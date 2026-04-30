Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A3339DBE1
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533059; cv=none; b=n+ZevSCexl/YtTCLTjzFh1HW76BypiveP+fn2E3ChN4PG0f1OgnEXpXPfWGbL7DwodO9hhrhSWDA17MvrEtYUlq+sIjRrvsQ2BKjgO4748TnA8cH7LSXY0ONitNsV94BvdIbthlfLwZAA2eriIKu4jUYaHBQIVpunpJ9pprM49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533059; c=relaxed/simple;
	bh=xA+JyyhoD+6cuOWQwY5YNIB4x5Pz3Kxm/8/MqUktfKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qp3mOYFsc685wgYrXybB/FNG5TyzdGAsR2IIQoLMVBXj1dsKKgXieozyaAHqTIpZglf9fgmjPV9FLBabCjRIfNxpRXdGhSxpxpfa2WF/X6npo9yywWALz+Z4GbqligyDIuHiAVw7S1R1zArVMt646pxvRdaTYU3b5e8rRNGj9gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4kIU7Are; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4kIU7Are"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso5051475e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777533055; x=1778137855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/a28fcWAgOrJO1VSx976gpf9GAOotGbvaSHKVCrmZw=;
        b=4kIU7AreGm6O1JzvvJM63qjYgVePyADXOXeTWwy9RAKOT81adXsQpEy7aVFpczBH+q
         asEBPpbiLBKksjH9JzfKwP3EQIaB9ZxeN0qvm/sjX87N6kqKUfM3M8Yue6dV/rv4NmHq
         lyHhhOmvx+6aEBzHl7PYfrYmgBFKrvOfBNvYxcDVN5nucel2+JH7ZvHFPAJMChswACcX
         a455WdBCZocStJ94f4BiUjxyRygP4c4mw4HwQ++fVFcOXENEj50/tQq4CaB0Z/rsn/Sv
         xleTKgmA4XQRGdfbG8i1+VcNLOVoOHSqGgVOZJv7pYMoLdfrvizsgPIMDYIkIIIPLbP3
         uGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533055; x=1778137855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s/a28fcWAgOrJO1VSx976gpf9GAOotGbvaSHKVCrmZw=;
        b=gGBqEc4wzqA5JEG2fAagVxIZUyfAeBNxKMgdjW1OirnuUOkQXhYDi5gnwCwdkHM7pg
         Gki9tFJZlkQVQYzfnbQVzGTMgmEfpBjA0/uy9ZRuh+6g1nooCGqf+QmYFUpJP03OtCGM
         DFBuXsyeb+oCVHZVjaoX3eKhYfSR76OoRV7PJHsxWOCVBivXVt6jIs+2V++DMnbb65Ze
         6mQfcSomrYtAhT2jNFxVGvqt6+FN7f4p0Ck9obzRpQ/O+QtVJS3qv6DXX2vc8LQz/bbN
         CEaiF1W90prEG0wzIzJs/+EcHe08dm4vTFY3oJLNQg/A91Bv49wMEDuU+Tc7pa94Fo3r
         QQ0A==
X-Forwarded-Encrypted: i=1; AFNElJ9GjWcpb9JK/46qVFhr1TQ7GiMek7BUm0+8szTD2j742GeMB1M12gFWAEuu+1BzDnt9gJ2uXEZpn+XB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/TybF12bIURf8Zsdxz+WAUUpkzkmeWl7gx8aFj7SMSePUZ8xR
	Xnzs4Ni4KSdiKSaLN378LpYNSC++ckHXsct/YUHYUtuSZawfrL3dsPJ6WXbQ2k6418A=
X-Gm-Gg: AeBDievSXJq4MeZCvseE75/boaWz+2tCJ17yLrUCoedZ9l23MM5+GdtncapOvQjljuM
	bA4oikoj/NxFQ+6wN1irokFPb96wMJ9CC3x/+Z4LGz+VJw03eTl00bo7UqhDtkFLI3KesEu9qs4
	opN68t9i/f9JaK7CzU7MtjkGC0h3XU7rz2TJhDB16gljcRDkaUI/99/N7rFvaDpWnJ9/rf6qRhM
	Mw0p0xZDTplIMhLemh3KVpgrbD/d81A9c1yZVlWbUgOr7EbNAacGSF7deGzeNGlPxgZEhyHM60X
	xQIjKlBx7H770+bitS4f81wxFdmA98ahP60at2Ga/x0Sv1i5M0Nr9/1Z1TgRehtaVteo2m//aC/
	7aDD8MPPt1lfNJTLtAkKw4WCSoCbFeb+0PX139bY99+LwHS0OytLZu672l0LqY5r92pClU1ecA+
	u+5J5gNJ3Y8AMAmYkGKT/dy8WFAsfapoiyzMzR9nN7XMjq3IG2owX7X3Lj90VCgxJjr/SUikPUQ
	GTfFrRu
X-Received: by 2002:a05:600c:a00e:b0:489:a4:e555 with SMTP id 5b1f17b1804b1-48a84471b86mr27140065e9.21.1777533055237;
        Thu, 30 Apr 2026 00:10:55 -0700 (PDT)
Received: from [192.168.178.36] (046124200255.public.t-mobile.at. [46.124.200.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b89sm46080825e9.1.2026.04.30.00.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:10:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 30 Apr 2026 09:10:44 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-sm6350-lpi-tlmm-v2-4-81d068025b97@fairphone.com>
References: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
In-Reply-To: <20260430-sm6350-lpi-tlmm-v2-0-81d068025b97@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777533047; l=2211;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xA+JyyhoD+6cuOWQwY5YNIB4x5Pz3Kxm/8/MqUktfKk=;
 b=o47mlBib4+72w4KeKq52GDFNeG46iqvF8whC4buxAu3HdKwKgINEBOpYn5vs8NBfDwkL2uj4N
 y8i1wxSd+I7Db+UWVHa8rVux1DtoPMRNGFdI+uCJlPu1z3JWTXLjZzU
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add LPASS LPI pinctrl node required for audio functionality on SM6350.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 ++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 034545d2af2d..d6adf68563cb 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1450,6 +1450,72 @@ compute-cb@5 {
 			};
 		};
 
+		lpass_tlmm: pinctrl@33c0000 {
+			compatible = "qcom,sm6350-lpass-lpi-pinctrl";
+			reg = <0x0 0x033c0000 0x0 0x20000>,
+			      <0x0 0x03550000 0x0 0x10000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 15>;
+
+			clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core",
+				      "audio";
+
+			i2s1_active: i2s1-active-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			i2s1_sleep: i2s1-sleep-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "i2s1_clk";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				ws-pins {
+					pins = "gpio7";
+					function = "i2s1_ws";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+
+				data-pins {
+					pins = "gpio8", "gpio9";
+					function = "i2s1_data";
+					drive-strength = <2>;
+					bias-pull-down;
+					input-enable;
+				};
+			};
+		};
+
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-619.0", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,

-- 
2.54.0

