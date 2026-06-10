Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13411405844;
	Wed, 10 Jun 2026 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781093086; cv=none; b=hdqjYWV7+seuKFBbDB0v30K1Pozp1PPuSjsBSDv1lpz/8x1HXJdc1+eP9pH9620Cn7waLNT06o1X3vJPq7szDxGchWaVCP4QEI1/y9Pw6yVsNv+ReET3hSQs6kOFN2f/o/tpwC+Gmdh4J6/lTOgEIRHEjM8sYhKiDVf5aCgs7rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781093086; c=relaxed/simple;
	bh=M5nlokA19VIWfXT0gjerV+iDVU54fVNT5RCYkVfjl+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaBJtQRv4BBLT4c7PH2XuSWHsXsZeXLCB5ULDi2UkTpTuAFBRFXkgpmYl/MHR1QOu1q3y5zRW2W98l7BfDB0yZypI40RCdR5YLwn9o7NvLCQyUjV8BTbPQ++6eNwrV3xSDWT5CBzbwkoR4SVinv/L6bxHqeMGOUwaDtBjkI/5xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQ/noQHJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQ/noQHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95A51F0089A;
	Wed, 10 Jun 2026 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781093083;
	bh=uKld6mtpOAHOyUMP6+sCh+13il3I0Ttuj9CS6qy04Q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gQ/noQHJjHau+cQfA7znZdFUPUKda2/ysrQnTRe+jRtP+WekSeG4OzqfBGM3o96Md
	 6oRlXWKtSnHYCYnla40eUs/hSgtmkhQtKCqqE7x+ANgpcK/9aANooL+nMJP/hzERbN
	 7sck2bPPvZ0OM4E9eiK69ifEeHCoDQvIqTYsKbT3WTbA9KYPPiQ5OTGKP8dvDRjmzo
	 K8pASL2EKWYPnhjs5kmY6HeoA86X2EOQQ+/SqWQHo5/IAM0GB8QeE8lzt2vPqgDK43
	 Ezd4C7mFKbevAzAx6KbKde7uDfqMAA0GIojCIazOfnX/jIe1z5VoaFXiMEQR1k+4S9
	 tX1epyfW/WPBQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 14:04:16 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-8996_61x5_qusb2phy-v1-3-d7135980e78f@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Iskren Chernev <me@iskren.info>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781093064; l=1095;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9ndZtXkmqXo1r/bpwIA6jBPYTw6ttBiubHvsJ0cp8u4=;
 b=xsEvEhhKA18OgnoIAxsGvKjnXq2ahSZ8va0geoaWMJQGSNKXsDUBlv+EbutsWuW/i5ybHSiiR
 yznMZvMT/T9BwUY0uaTaq4JpnF0/630KvdM4PSVlD16HY693zOnpizn
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
Describe that in the DT.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2f67e665996f..b7cd1928335c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3192,7 +3192,12 @@ hsusb_phy1: phy@7411000 {
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			power-domains = <&rpmpd MSM8996_VDDMX>;
+			required-opps = <&rpmpd_opp4>;
+
 			nvmem-cells = <&qusb2p_hstx_trim>;
+
 			status = "disabled";
 		};
 
@@ -3206,7 +3211,12 @@ hsusb_phy2: phy@7412000 {
 			clock-names = "cfg_ahb", "ref";
 
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+
+			power-domains = <&rpmpd MSM8996_VDDMX>;
+			required-opps = <&rpmpd_opp4>;
+
 			nvmem-cells = <&qusb2s_hstx_trim>;
+
 			status = "disabled";
 		};
 

-- 
2.54.0

