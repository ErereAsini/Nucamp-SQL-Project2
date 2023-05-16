"""create customers

Revision ID: 8af14c66949d
Revises: 
Create Date: 2023-05-05 15:44:18.431949

"""
from alembic import op
import sqlalchemy as sa

# pylint: disable=E1101

# revision identifiers, used by Alembic.
revision = '8af14c66949d'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        CREATE TABLE customers(
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL
        );
        """
    )


def downgrade():
    op.execute(
        """
        DROP TABLE customers;
        """
    )
