Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06893F23D7;
	Fri, 26 Jun 2026 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782481116; cv=none; b=dET+rhgjFmjgRL+gtyXShE6aQBORfoAnxUzQaYQBXttDjNkmbBN7Q48GEdOje/sHWfCajsCK4U9IspjKm9/+iBBVkC97XpQOACDE864cEFSJElYkRLt9gJxa9rPoP4iwn/xg6dTh/SeEuCVRfVnRL3QeFr1fJuWyYrDSyaNEiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782481116; c=relaxed/simple;
	bh=ygNoSlf2LfIxfSlf2nQQCdhAwsp9v2K16sdxAnS6lUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EiyJq+q3bhggIStaw0q4qF11f07uij3FKTgcjlFXMeAIWba+xCzWpdjS/PFKcE+xxunCc180zE2sp19Ou99OvRT/OKRMOWgmBcn867SLcrKEvViPYVXzt2N5IrFw+jAndOKP0raAUK7/mQu81OW0w4Q8jz46i4KODpbX9wckLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWuD0BH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWuD0BH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A8D1F000E9;
	Fri, 26 Jun 2026 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782481115;
	bh=C67f53Dh63EGgDB2fjJoregeFYfRvPyb/AeNtEL4DXg=;
	h=Date:From:To:Cc:Subject;
	b=WWuD0BH5DoDCb0nHd4fUaO+ybkSBNQKH5Icjzhn2ffArIiQNCHT3zm+qxMFMk56dD
	 Fwy5b09qfuXfTl01Cyv90Qw6cnevgsOQPaI2NbdAiXxxFeukwsBdrpIxinszgDkEWh
	 mQIL10tTSeS+AWGdOgJIXdYGdSO0aniNu/RaGhYUolFl7+gTE7MMb38ZiVGXPCwfpB
	 Wdp/he2YMI19zEtLOBUnXYGL86g/PXw8TbOhcqIABmXCxiD7152xNrR4MXsmpp88LO
	 m3llWl+tv60qi5h2b8hG9C+PaNDi8i8Zvr0Fqoj7hoVnBzs5BtTayu6yDU0Ke3eSw+
	 SR+wCiUIb0XRQ==
Date: Fri, 26 Jun 2026 08:38:34 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v7.2, part 1
Message-ID: <20260626133834.GA2142045-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Linus,

Please pull DT fixes for 7.2. It's based on your tree as of a few days 
ago to fix the warnings introduced by amlogic,thermal.yaml changes.

Rob


The following changes since commit 840ef6c78e6a2f694b578ecb9063241c992aaa9e:

  Merge tag 'nfs-for-7.2-1' of git://git.linux-nfs.org/projects/anna/linux-nfs (2026-06-23 18:36:41 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.2-1

for you to fetch changes up to b39a6b2e9d5bd6a3153aed4c7440172b8f6a739e:

  dt-bindings: mfd: khadas,mcu: Drop type reference from "fan-supply" (2026-06-24 08:48:09 -0500)

----------------------------------------------------------------
Devicetree fixes for v7.2-rc, part 1:

- Drop unnecessary type reference from khadas,mcu "fan-supply"

- Fix clocks in Renesas R-Mobile APE6 example

- Add missing Unisoc SC2730 PMIC regulators schema

- Fix Amlogic thermal example

- kernel-doc fix for of_map_id()

- Handle negative index in of_fwnode_get_reference_args()

----------------------------------------------------------------
Alban Bedel (1):
      of: property: Fix of_fwnode_get_reference_args() with negative index

Krzysztof Kozlowski (2):
      dt-bindings: thermal: amlogic: Fix missing header in the example
      dt-bindings: thermal: amlogic: Correct 'reg' in the example

Marek Vasut (1):
      dt-bindings: clock: renesas: div6: Use ZT/ZTR trace clock in R-Mobile APE6 example

Otto Pflüger (1):
      regulator: dt-bindings: Add Unisoc SC2730 PMIC

Rob Herring (Arm) (1):
      dt-bindings: mfd: khadas,mcu: Drop type reference from "fan-supply"

Vijayanand Jitta (1):
      of: Fix RST inline emphasis warnings in of_map_id() kernel-doc

 .../bindings/clock/renesas,cpg-div6-clock.yaml     |  2 +-
 .../devicetree/bindings/mfd/khadas,mcu.yaml        |  1 -
 .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++++++++++++
 .../bindings/thermal/amlogic,thermal.yaml          |  5 ++-
 drivers/of/base.c                                  |  4 +-
 drivers/of/property.c                              |  8 ++++
 6 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/sprd,sc2730-regulator.yaml
