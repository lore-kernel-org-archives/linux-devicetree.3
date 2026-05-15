Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AFE37B00E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821703; cv=none; b=eIqiNavdQW4xsunF5iT9gcED8l6l62gdGquucUQulur5gT63ha7T2BX3QrGee33/Tfq2oKyioY+Ghbed+lvkXhuMqAIE7xNTkiZdKib4TXokyK5AoAqYrEDKPNrNvs9zMVwV8TQOaeOQPVCnvppIp0xWTk5dE3AVXRq3NmH5SuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821703; c=relaxed/simple;
	bh=foPiAKtlim0IMGXBD6vjdgfAWPjrYOn9Kce7+yb/c4o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qv6jUGrF26vd9zKjNKH2cwd2Ji8YaBN2tIbSz1fV7VSn+SAcMm/HDHXeU/KThsOO3l1g5fKX8Cv3+O4vGPnT6NTvndjZwlXAHINxkKN1ofhLjtrNp0RxslOXB+oBnwmkj3qa8x9ZQpq7avnXPYAbkVIiXPJTcsmWWtBBM1FRIlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=c5uGs2jF; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="c5uGs2jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778821699; x=1779080899;
	bh=bY8td5xPHQkAvs6MnLRddzsEhSM0rtjpwZSEz61U4/Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c5uGs2jF/40+/AJP9iIBtqB3QbcPFLrmYuRLHxYWqG6Kdg39VdH0Ap5Kp51s3eoWj
	 g3gukyHr+TtHynPHBWxkRos6tyC0mdlKSA76XYtfQP1OqVxY+H3l89heiAXvAx4MTU
	 tL7xECOOcqbUoFmP8aD2CfKUomzojzzfjXxJ25pLfpQaDvlDqiyRmKmxYwbTGQryEx
	 xEsvtxoICUg3CUnFjMpWkB1cqLDd0I0BBI2XxTuEY887xqlZXVBt6xQtKtlRw6aB8z
	 v9ENHB80RZDHWURmEtESG7DxBkGcq1H+7XwFiZhuRW8dzCRwinpYR9ziiEltHovWOe
	 MFNIxJae6d5tQ==
Date: Fri, 15 May 2026 05:08:10 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
Message-ID: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 359b81c8d6c56f79e141c4cc4d08652c6efd40a9
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adreno 810 is present in the Milos SoC and is the first GPU to be released =
in
the A8x family.

This series is marked as RFC because it depends on a few other in review
series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetre=
e
support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change=
).

Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
review and has been applied.

[1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e=
54b3d464@oss.qualcomm.com
[2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017=
cc642db@pm.me
[3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f838=
32c3bc9a@oss.qualcomm.com
[4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f=
5988c43a2@fairphone.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v6:
- Re-jigged the register ranges for GPU/GMU to match Glymur
- Depend on RSCC offset fix
- Fix bindings to add constraints for reg list
- Link to v5: https://lore.kernel.org/r/20260502-adreno-810-v5-0-bc9fd2bb78=
8d@pm.me

Changes in v5:
- Sync with latest kgsl
- Link to v4: https://lore.kernel.org/r/20260416-adreno-810-v4-0-61676e073f=
8a@pm.me

Changes in v4:
- Add 1150MHz speedbin
- Rebase on next-20260415
- Add dep on efuse patchset
- Link to v3: https://lore.kernel.org/r/20260407-adreno-810-v3-0-30cb7f196e=
d4@pm.me

Changes in v3:
- Drop DEMET from GMU clocks (not required on A810)
- Document qcom,adreno-44010000 compatible (regex is gone in 7.0+)
- Drop zeroed out CP_PROTECT_REG[46, 62] range, not required
- Add a810_protect to __build_asserts
- Add UCHE_CCHE_TRAP_BASE_[LO|HI] and UCHE_CCHE_WRITE_THRU_BASE_[LO|HI] to =
a810_pwrup_reglist_regs
- Move TPL1 registers to a810_pwrup_reglist_regs
- Include all protect registers in a810_ifpc_reglist_regs
- Revert pipe reg comment, just copied it from downstream but original also=
 works
- Link to v2: https://lore.kernel.org/r/20260402-adreno-810-v2-0-ce337ca87a=
9e@pm.me

Changes in v2:
- Mark as RFC due to dependency on in-review changes
- Explain in DTS commit why qcom,kaanapali-gxclkctl.h and not qcom,milos-gx=
clkctl.h
- cx_mmio -> cx_misc_mmio
- Sync a810_nonctxt_regs with GRAPHICS.LA.14.0.r5-03100-lanai.0
- Link to v1: https://lore.kernel.org/r/20260331-adreno-810-v1-0-725801dbb1=
2b@pm.me

---
Alexander Koskovich (7):
      dt-bindings: display/msm/gmu: Document Adreno 810 GMU
      dt-bindings: display/msm/gpu: Document Adreno 810 GPU
      drm/msm/adreno: rename llc_mmio to cx_misc_mmio
      drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
      drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
      drm/msm/adreno: add Adreno 810 GPU support
      arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes

 .../devicetree/bindings/display/msm/gmu.yaml       |  30 +++
 .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                | 165 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 298 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 536 insertions(+), 39 deletions(-)
---
base-commit: 2ca0470eca8b4cee27aeeb39bd93c1f4c96b7e7b
change-id: 20260330-adreno-810-5a47525522cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


