Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEDB3955E0;
	Tue, 21 Jul 2026 17:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653900; cv=none; b=cD6NE/Ezx/biFAfE1QYDMLpXL4Ey7YKQM/3czjEEyuHHhErnCZny/LGUSbwxx7bTprhEZ9X8QF3CYhf0cFtiGvA9ZD75yBQHSCHvbEcuO1OruwELz+eqbvnkACFEv4m/gJejzgTUE5F6Wva75AxB4zTzPUH89ylmVNr66FzZTis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653900; c=relaxed/simple;
	bh=I2FRoaAEsEDrUMzf+pBPZkP1iFj+t9/CtS3WpVmxa9s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GyBlUZ6hygbIPPeXcn1A8pz4U4B1Y4JUUH5biUfUdM1mmlUU06kU3rYADReamHOA0zO2Ldqk342ZcGR/MRsrnmiyZEIJmg47q3YJVnyEPh22tc+ggWEaZud861HL+c5j1LqeVcDDEEHrU02thYe3GgcTk9PDSS1cOTrlZroPm7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRskIxOB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRskIxOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0811F00A3F;
	Tue, 21 Jul 2026 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784653898;
	bh=Ri1DcXvgWURkybeLp/VpfSN1gcr630NHia2xanTMnNc=;
	h=From:Subject:Date:To:Cc;
	b=bRskIxOBLVyNHje2TE9NjzWP0tst3LdveE77VGbzO5nVwpPGLTDFqKPp+fHjYLvZ2
	 8DAIeytf0YYLo4WGsHG4jVJ5OgaXuZ0H8HIXcSM0/viDls4tx1+7ddgOLHUuXqgBGo
	 WvRD9n0lJumhKEV27gHlizUPWRgW/gXFfzZzm6b/x/4+vldfqQlXk9ylmLZWZSdjWQ
	 YIk6069BnvtgqphL4DRxSDPOSKgNlpx4bkEU0m6OlbLWHZ+HfA6zmoHW3quzU3+ZN4
	 uAVlfluKowV8qCmOkM0IS8/LpfNPxx8pMKFqOdK8i4bCyOhf0T/NSKGEdS/mDN7xwg
	 Q2p2IDFfwR5eg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] X2EE ASUS Zenbook A16 (UX3607OA) support
Date: Tue, 21 Jul 2026 19:11:25 +0200
Message-Id: <20260721-topic-a16_submission-v1-0-8ea213130d05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQrCMBBFr1KydiRJ24SKiPcQKWlMNWJMm2mLI
 t7dqXXpZuDB/+/Pi6FL3iHbZC+W3OTRxzuBWGXMXsz97MCfiJnkUnEtNAyx8xaMUDWOTfA4F0A
 1Rqmy5ELKglG1S671j6/2cFyY0ldnh9n1SyTXj7Q3LDEWHKL57m2y7TLHKzjfnmFMgNHaDiYFH
 IRqNZdSl4U+7SPiuh/NzcYQ1nR2s/uPSeQwWEx1T4/VhAVMFblynSvNTSPKtvrjOr7fH2daBr8
 hAQAA
X-Change-ID: 20260717-topic-a16_submission-6ba665501224
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784653895; l=3509;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=I2FRoaAEsEDrUMzf+pBPZkP1iFj+t9/CtS3WpVmxa9s=;
 b=wRTGdBPYolmXHqf/9s/LCnfERIy3NtA0401rFmaYFxdQLonn/Rqq9uJqRw6p1YjbNoc5Fv4Dr
 Ja5RDCigfRKCPFrVLQLh9XZOLo02UrSVn2AZaMD6rM/+LCYAm/E6qwb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

UX3607OA is a variant of the Asus Zenbook A16 built on the Qualcomm
Glymur platform. It comes with an 18-core X2 Elite Extreme SoC, 48GiB
of RAM, NVMe storage, a 2880 x 1800 OLED screen, and the other typical
Glymur platform capabilities.

The hardware wiring is very different versus the 14" SKU - the larger
one is based on the System-In-Package reference design, unlike the
smaller one, which derives from a more common Chip-On-Board base.

Currently working:
 - Audio playback (4 speakers)
 - GPU, Display
 - HDMI port
 - Keyboard, touchpad, lid switch
 - Privacy LEDs (camera-use, camera-block, mic-mute)
 - Charging, Type-C, Type-A port
 - Onboard SD Card slot (RTS5329)
 - Wi-Fi, Bluetooth (QCC2072)
 - Touchscreen should work on the SKUs that have it, but it remains
   untested due to lack of access to such a device
 - ASUS doesn't currently offer a SKU with a PCIe modem, but enabling
   that should be a boilerplate change if that ever happens

The video accelerator (Iris) also works with the in-flight patches
and will be enabled separately once that lands.

Product specs:
https://www.asus.com/us/laptops/for-home/zenbook/asus-zenbook-a16-ux3607/techspec/

This series depends on the SoCCP series (bindings, label reference),
and the TCSR series (bindings, label reference). They should all be
merged pretty soon and are specified as b4 dependencies.

The following are soft dependencies for BT and display to work (i.e.
the DT is good, but Linux still needs them):
 - https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/#t
 - https://lore.kernel.org/all/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: arm: qcom: Add Asus Zenbook A16 (UX3607OA)
      arm64: dts: qcom: glymur: Add Asus Zenbook A16 (UX3607OA)
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A16 (UX3607OA)

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  | 1271 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |    2 +-
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 6 files changed, 1276 insertions(+), 2 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260717-topic-a16_submission-6ba665501224
prerequisite-message-id: <20260709-glymur-soccp-v6-0-16f70227547d@oss.qualcomm.com>
prerequisite-patch-id: 26f384ecfe96620007cab0ae3dd01db6e2314bc8
prerequisite-patch-id: 711fb836c2a609ad2f1f07f8785df3e8b72e97a5
prerequisite-patch-id: e9fe3e572292afc1ea6f98dba6c2176a28183dc7
prerequisite-patch-id: 5b78db9f6345733d9dce683ec231fa93859a1a0e
prerequisite-message-id: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
prerequisite-patch-id: dd8db07a04d6f4ede6ed108c4a8e61127f11b3d6
prerequisite-patch-id: 7ed88c595363f9d938026e11a10ae578da948176
prerequisite-patch-id: 2ceef6977256434f66512826bf85d7b736efbf3f
prerequisite-patch-id: 2a3d2669de12c0acce01140275ca550aaa3aff81
prerequisite-patch-id: c60993fa87cb9df425b0c90724e652a90359df6a
prerequisite-patch-id: 55139a2f9b55478eff21099cb7ab33ff34411c7c
prerequisite-patch-id: 58ac6f5fcb958eaf8bc8bccdf49b6c3432f791d4

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

