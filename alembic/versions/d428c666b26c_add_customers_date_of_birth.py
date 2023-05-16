"""add customers date_of_birth

Revision ID: d428c666b26c
Revises: 8af14c66949d
Create Date: 2023-05-05 15:47:14.006879

"""
from alembic import op
import sqlalchemy as sa

# pylint: disable=E1101

# revision identifiers, used by Alembic.
revision = 'd428c666b26c'
down_revision = '8af14c66949d'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
        ADD COLUMN date_of_birth TIMESTAMP;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
        DROP COLUMN date_of_birth;
        """
    )
