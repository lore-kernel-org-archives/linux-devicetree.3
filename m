Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D853FFFA4;
	Mon, 15 Jun 2026 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533350; cv=none; b=iqBACIiol6O/EAah3JlBlk8i2sopo0NYa4yU2lab1X/P7WnFJYe+P0X/khVh7sjYZx7X0Xz+VxcLdqHgP146b3XtRLwtnxY1zVaAh2mpE+TIGAgC8ktulCoawY7Vy63i4NZK4XRIq4Ln0Jax4IBU01fbAhvbPmBuKC4jBZ5fIfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533350; c=relaxed/simple;
	bh=goSS1XuJbT4YlOO/1T+WZXyO0tlUMSkvhRDphXZh+Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dN+ipFjvxVMcHZ23UdmtotivtFgQRFiVgytCHJKB4UbJe3ZQgSVAKmvZl8Q7rvZuQWN0cKv0/QI3Sfp9LR9Y5ViqBJH12Qx/8h/tk4DhzljQD4XW7yQkWw6YzWD/K8u9Q9JiV3Kjp2oPapKiPTS/j1eGqb/si8gNO2MABD1oKyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jOykVgdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jOykVgdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DDF1F00A3D;
	Mon, 15 Jun 2026 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781533348;
	bh=Ux/YJhhVlxObgTS3Cs6vEDupPEf2heYNa5Ixuw9Ae2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jOykVgdglYhjDLX8Bjd59QyZwbhtKL6Rj13INu/eZZrrsWyEoCxfPVr2KRjh2woyo
	 7ibvSbngqruj3zJITnHMQCxJPP3ix0jDirAyFQR0Z4ylvrVy94r3/MOBXoM6vu0GKF
	 ZN17oTktc0H+KtFfj0nkez0DZ5fZf3qWCB24zUhyZi2L7UbM3RPxUBSQA1XyppKyv+
	 eh7YHowa8nXszd/uhj+ezbCTGeq4krp5m55ebQxopruVPvkTf5bbxeryjUB+FuiWqR
	 6OcRO7ZGJ6TrzReKZLD34dOhUj+1MfBAC80W38yyQY9hhHDkI5ZeP65JSC+iHR2P3p
	 2/HqmiML0DVZg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 15 Jun 2026 16:22:06 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename
 regulator nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-8180_disp_power-v1-3-18d36b548c48@oss.qualcomm.com>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
In-Reply-To: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533332; l=1479;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=zCxGKmgCzn+DtBZUt0qi9TffNeGOYq1YWtn2Gpi55cQ=;
 b=TpKMYmI692SYYiqiS5piLWxXohLrJlYH8slQQvv0tlE64hM6Og94qbr8vHwlOULqyqkuP0doD
 /Z5X7TEKh4RCLTsYYXNaYIZfhVR1yFc4+Qc0NYKSN9z9sfw6kzyYI17
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Align with the contemporary way of naming regulator nodes (regulator-
prefix) in preparation for adding more of them.

Reorder the renamed entries to match the expectations of the DT coding
style doc.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..0d2cfb830e83 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -157,14 +157,7 @@ cdsp_mem: cdsp-region@98900000 {
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-	};
-
-	vreg_s4a_1p8: pm8150-s4-regulator {
+	vreg_s4a_1p8: regulator-pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
 
@@ -177,6 +170,13 @@ vreg_s4a_1p8: pm8150-s4-regulator {
 		vin-supply = <&vph_pwr>;
 	};
 
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
 	usbprim-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 

-- 
2.54.0

