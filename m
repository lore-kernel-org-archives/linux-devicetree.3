Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22A3AE184;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032129; cv=none; b=JE+jswV49QD0kf1U1EaeEdVq9wvsdLwDKeGctfAb4s4BtVDfao6jo54ov6DUifMIixzAjr9xe9WNaRqyXF6wXK9A26gbW27ecOz313NJganMMoOmnJCmBNoNXNtvurVysvaZZAJiXyOrr9i/vQg1mCebK6U8vtak9oiFolh3aBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032129; c=relaxed/simple;
	bh=ijyWGc7cgC5C8+2EsFh8eAzQCX0rxyLF1iEbqDPqQQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pX3/IrDwHcs5oKBZhOqT0k+goNCqwUjzwFyudJaNUb2HaRrkmj2tD1RKpjbu6y2sFt8idfQFUxRiqfhxLo463uU1DCm6NpmYY2lc3uoa9q96+mKIFSHRmovUPy+nJ2xLtcXoh26u4Uh6NiOe/bl3jR+ki6oYEH0CAZrLA6zxbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvAf8aB1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvAf8aB1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 332ABC2BCB2;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032129;
	bh=ijyWGc7cgC5C8+2EsFh8eAzQCX0rxyLF1iEbqDPqQQo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JvAf8aB11iYfWtQKqXurNWxSAh+0em4CBKRYdqWAG5UJIqnVGFLbPomJ9NwjuCAI0
	 dylUHgCUiEELvkRWHwcl+N2giRtw2+fc8yTFPGduJAZ85Y/4TJPaVL5ATd80BXJO87
	 uyTKTRWG1H1eDLmFY5viXyhM1vYjk4l0qcOwD+I83dMWNwqGU80+DvBDwqY75WzSVD
	 2WfgfCCPhvp3sEqe1WMbLTCnTYtPKVvdXf1IGCyrAN6vx6OJ/944e8N73wcBLm8EpY
	 MCP/2YXM0L2T6QnfDfoj+dSVtARSmSXiA7M881E4dTw1T84Yl4Wve+aIq+iFj4MohP
	 OeBb75q+02AfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28134D35151;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Reorganize DTS and add fuel-gauge to
 samsung-expressatt
Date: Wed, 01 Apr 2026 01:28:47 -0700
Message-Id: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WS6WocMRCEX2WY35GRWq1rCcHvkZhFR/fO4B2vP
 Rc2Zt/d2llM4gOCfpWo+tRU67WdaOxpanfNazvS2k/96aEK+NG0uYsPBxJ9qboFCVZqrQQ9P44
 0TXGe97zQcX9YYjWhNYWTZu9iamu2erh/3ri/7656pKel4ufrZfsY59xV+O7PArLCuRRJHA2Va
 BQkREjeV6iXzmFR0UntCrsN/h5tFBQIlr3OOalUJ/BF2uiA0NnERkUyjGTzx1QMTsbMIL1UqBm
 rTQZtSoFsXEpOsUmstf+Quo7JBQwTG2+kzoZMZodALiQFGNBnxzYFX8I3UetrgdF6maoVlDMBK
 yuDD2QVZ0R94eVyiQ6Xhrfud83PWn1tRJp/qhfzacndPb2IVYl6EDEFcDmwvj0MsT/e5NPw6zv
 SlyXmONAY93yMUydWFFKwohAYHRr1mZbiRKKKoZ93zWpvVGgv2+36aT6NL9snWtW23v/8l21s0
 EUVb8AmG/4+1N6dz+c3SoA/0ZgCAAA=
X-Change-ID: 20260331-expressatt_fuel_guage-465dfb3f87ab
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775032128; l=2193;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=ijyWGc7cgC5C8+2EsFh8eAzQCX0rxyLF1iEbqDPqQQo=;
 b=MmgwvXuLziahm10UT8nqenr/+BUb7r8SSOxtPl16o+nfZOWv8d7ZJ2FHHUV5zKZeAnhDtnlwG
 UsQEACoEga3C90WXtCwQoAqnRhloxGewGyMajyXy0ijRXz5bBPNFOM4
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

Reorganized the samsung-expressatt DTS to be more in line with mainline
standards.

Tested battery by doing `cat /sys/class/power_supply/battery/capacity`
in upstream Linux and comparing the value with downstream Linux. Booted
on upstream Linux first, as the upstream Linux seems to use a lot
more battery than downstream, and then put the battery into another
expressatt running downstream Android to compare values. There are
some slight differences, but overall seems to line up pretty well with
downstream.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- Previous changes were based on some outdated dependencies. Update them
- Reorganized expressatt DTS
- Switch to GSBI5
- Link to v1: https://lore.kernel.org/r/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com

---
Rudraksha Gupta (3):
      ARM: dts: qcom: msm8960: expressatt: Sort node references and includes
      ARM: dts: qcom: msm8960: Add GSBI5 I2C controller
      ARM: dts: qcom: msm8960: expressatt: Add MAX17048 fuel gauge

 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 420 +++++++++++----------
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |  35 ++
 2 files changed, 257 insertions(+), 198 deletions(-)
---
base-commit: e9ec05addd1a067fc7cb218f20ecdc1b1b0898c0
change-id: 20260331-expressatt_fuel_guage-465dfb3f87ab
prerequisite-patch-id: 6fdd0efa5eda512b442b885df80774d1a7037df7
prerequisite-patch-id: 12d296f83ccb1bdfb8d06a72e476bf51ae5f4e6c
prerequisite-patch-id: a970acf2080143f41ae0935dd2c57bb71f5bf338
prerequisite-patch-id: fd25fef58503c5e5cf742e79b124948c7f6b98d9
prerequisite-patch-id: 68603a680b24921759425fc289e61fc4435e5ccd
prerequisite-message-id: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
prerequisite-patch-id: 8de4de7909722ccaf385c4224f25a623eaa72c28
prerequisite-message-id: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
prerequisite-patch-id: ab8b8d87fd2d518c4c5b5dace3f22238d1abbe49
prerequisite-patch-id: 47e32e653e520a27770bb05d99135694b0128ba0
prerequisite-patch-id: 7ef7df61e7ef6476a35811d765f522f793d9ecc7

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


