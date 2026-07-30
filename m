Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E629D3F823F;
	Thu, 30 Jul 2026 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403448; cv=none; b=DdPHEyrhdPYHa7hfRA1SCAElvC5kFxf/M4VLIhjwrpD5xa0AjyZtbqX4EOoqUfznO8Vsff7VUcRj16TAq6xUDvXYkh+phGp6MnVWblkgzpdDOSuijgajMSregCzsC7nj/wzwYUH/bp8m/B/pWifzVtQLzLwJL5Z1QmVNFgMLGJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403448; c=relaxed/simple;
	bh=QvtmGQ6u3xTeKhHNyUSjSUa4kUZRRhhkjsqmgGm7BTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sEl4pvVAZKUhFbz9IQhcRwGuWbWFMkQ9t/2QnCqRk3aSHFXxdhbED+oAS6CcsRmfDtk78TESSu+j0WsLi7yQxKOAiRN+j37sw4fmNsRz8/sWHRXsKWQ3hQSDUk60xaU6So5Z4stTNCHhNXeQBDlvBH80qbvDLhuTpyqxr52danQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guJBQ9Nx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guJBQ9Nx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356D01F000E9;
	Thu, 30 Jul 2026 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785403443;
	bh=zimid6K44GcYUu2OTFrahG8RUPECvPXkTojB1LP8tB0=;
	h=From:Date:Subject:To:Cc;
	b=guJBQ9NxEvE8rMSK3CImbp85rEI5uuG7Gfs/QLeN8OQzDVELMYFGObmpUnwKz/YoH
	 eHJvc9Wz9lrLj/G6tJ9H5nUSNqRtgcuhzZUl2VdnTbo2iYAMM72sdeIxBFX6spEffm
	 CKqX8Sv+HBiDIBM5/FP5qe0wpyC5DEc5Um8MZChpdXOcb1t/VTueN2pGY7IWTMWgFh
	 6JWUQ1Z/RZaLXowuXOZp4NQLKBxe9eflcOJE4vYQeXpXSx6vxUTerBtemxGIS++A6X
	 J1rkY3/RkL5ZJuEoM470W7KjVVRgwrR0I0SX2jKzSsu0lgTQjBIUB01p7Qp5dZ+CNG
	 VylTdz+sQXxOw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 30 Jul 2026 11:23:57 +0200
Subject: [PATCH] arm64: dts: qcom: eliza-cqs-som: Add eUSB2 repeater
 supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-topic-eliza_som_eusb2-v1-1-288bcda1fee2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWdukrYrGqxhC6PCLY5CSDhgj4
 e4WXX6L9xZSJIHSpVgo4SUqcchwu4L43gwdjLTZ5K0v7WlvzRRHYYNePk2t8Vlj1uDNGa49HDn
 AWabcjgk3ef++1+pvncMDPG0zWtcv6Mk/4XkAAAA=
X-Change-ID: 20260730-topic-eliza_som_eusb2-8e1d45cbe10c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785403439; l=1062;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=TAaKxgq8TY+aWNI79m0eiyND1prh0PGtL7/2tmzi8R8=;
 b=ZTyTGfpCirr3mvGDCh22xIMGioHVI31nJz15OsRhC78gdmUCAHlay0KvVL6nPRmr4j9ILYaPq
 zAH/HZi7F3aDWxGPBBPhOIp/dclD+NFkAmJQsBlM2HbZa+pqpHHtuxu
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Hardware works better when it's powered. Wire up the associated
regulators.

Fixes: 85a1eb421dfa ("arm64: dts: qcom: eliza: Add Eliza CQS SoM platform")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Validated against Eliza power grid
Compile-tested only
---
 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
index 318ae3c22351..5ef6c51618bf 100644
--- a/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi
@@ -369,6 +369,11 @@ vreg_l7k: ldo7 {
 	};
 };
 
+&pm7550ba_eusb2_repeater {
+	vdd18-supply = <&vreg_l7b>;
+	vdd3-supply = <&vreg_l17b>;
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/eliza/adsp.mbn",
 			"qcom/eliza/adsp_dtb.mbn";

---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260730-topic-eliza_som_eusb2-8e1d45cbe10c

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

