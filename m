Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11C43C7C3;
	Thu, 30 Jul 2026 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785419914; cv=none; b=HRdQNh8nD3kyVHCqWV3Vyjw739tZb2FkjR00fBGG3JTxNiseyikvrYGNurc9UTOk5n/LCKqYaWUmwJRK0h9xd8vtRripu5JHj7WNvqMcjAjhtuxgqBRR8v6Un3EHjRDCQ/KinpCSP4saXp7bSZ2rJRqLEqvZVo3khYmgvRmJrtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785419914; c=relaxed/simple;
	bh=XebX5I8rLIYh1NuqEmfYZFPtBrOCqPU7dXaj+0PWtXs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PkfTsFbvy1tdbT9YB6UGDiTt+M/S0ubCyfEwNo0wQNA649WfFQfwz5AD/ZFOcQ3BWNgajXXal8sEjPCp8gidvW+/heWBZj3Kt2h9129kqvkrq86ftuC73UjRIOemw7b41sV/6AZm2O4l7yVui5h/1SsfqoUY+zjJG12NLLfuinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpXiF6cu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpXiF6cu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0FD1F000E9;
	Thu, 30 Jul 2026 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785419912;
	bh=1RPw5Bsvh5G/IDrFf7jq3jMC6m/JV32DoTb+VmSrjF4=;
	h=From:Subject:Date:To:Cc;
	b=SpXiF6cuf78g37kngmaeWzbeUC/7bnI1OuuogqstxLOwn/BHnn1A5fLhFVYnNgksZ
	 /BmMHWc4gLvqk+9AFlA1r4T/kGe/2T3AfapNTK6vW1nU0LOIHtA5E0wxlxEGUyz1Ik
	 hICmiXiXhEou6P86EtgAmUj8LaAUEWS1avJFCtQ1+LAn3RrM430GZqCLI6Q6jsvol5
	 +Mas6wfME1xOshlVuvIPlDBVwRiNQxNjN5HhpkaYRYuOgILVbcYVHYsyZjmBAxKd0r
	 L40nN1aeGSWK+Zb4YVU1XLU3kia3GFkA1KXZXY/s9pSECtuZ4O+MxXyTHEvjQPn49x
	 cQZWljK2D3bWg==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: [PATCH 0/2] Add support for SA8255P in the phy-qcom-snps-femto-v2
 phy driver
Date: Thu, 30 Jul 2026 15:58:13 +0200
Message-Id: <20260730-phy-qcom-snps-femto-v2-8255-v1-0-8b8bf5105a68@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAwA0F8hPdukNMDEXzEcdHYyE7a5IsEQ/
 t2px3d5G6hkLwqnaoMsi1cfQ0F9qMCOl3AX9LdiYOKODPeYxjc+bZxQQ1J0Ms0RF8Yjty325Jy
 YzjRENZQhZXF+/e3n4W99XR9i528J+/4BuPflVn8AAAA=
X-Change-ID: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Sriram Dash <quic_sriramd@quicinc.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=XebX5I8rLIYh1NuqEmfYZFPtBrOCqPU7dXaj+0PWtXs=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqa1iFBtmTRsUUS7/xlY4D7Up+s+AtmbGWSzR3Z
 VGt/wkxqNaJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCamtYhQAKCRAZDR20Zk4Z
 NbXZB/9JPzfUkJ3Y4PyhB0g/nYBGtAeBVwPU3rWtQ/W6VSeBMZsGt12zAMCIaJA21PyKrJm9cJO
 ndRjftc/s+IxT4/yvyRgFj8PuCvirv4xnKrTt7qEwDKrry+rCDO2GrRLP3JaGR2s3PLfTxNuMBn
 rc9lWJ0U4KtTZbY8VB+JU8tsldIbIjy7BLdmn2UiHCWepFTyDwbyw9nUQbNAUieGeGh+zAmdOSr
 mJcaSCcVBPmHToG9EkoPV6Hucd+ohuYtbAEqLyjfCSkW2Vjh9nKKskkNTSiGAgUBJyXMqdcm9fI
 IHD9pUVC+bLYDAGtQbPNz9ZiDHpNyATZw46o7LqIg4B+op1I
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power on/off.

Power domain "core" controls the GDSC, resets, and TLMM (GPIOs)
whereas power domain "transfer" controls clocks and interconnects.

Patch 1 adds the binding for sa8255p. Similarly to what has been done
for I2C [1], this is a separate binding.

Patch 2 adds the driver change, which is based on a public vendor
patch from qualcomm [2].
I did the following changes on top of that:
* Use devm_add_action_or_reset() for dev_pm_domain_detach_list() instead
  of implementing a driver .remove()
* Changed power domain names to drop 'usb_' prefix
* Fixed various error handling paths
* Added suspend/resume support

This has been tested on next-20260728 with a Ride4 SA8775P board that
has SCMI firmware (which is compatible).

[1] https://lore.kernel.org/all/20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com/
[2] https://git.codelinaro.org/clo/le/meta-qti-auto-kernel/-/blob/LY.AU.0.1.0.r1-16800-gen4meta.0/recipes-kernel/linux/files/usb/0014-PENDING-phy-qcom-snps-femto-v2-Add-support-for-SA825.patch

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
Mattijs Korpershoek (1):
      dt-bindings: phy: Add sa8255p high-speed USB PHY

Sriram Dash (1):
      phy: qcom-snps-femto-v2: Add support for SA8255P

 .../bindings/phy/qcom,sa8255p-usb-hs-phy.yaml      |  52 +++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 126 +++++++++++++++++++--
 2 files changed, 169 insertions(+), 9 deletions(-)
---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260729-phy-qcom-snps-femto-v2-8255-90ffe7674001

Best regards,
--  
Mattijs Korpershoek <mkorpershoek@kernel.org>

