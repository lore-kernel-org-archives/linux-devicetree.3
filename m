Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C639D3C7E0B
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520844; cv=none; b=f3VIwqhVtn+VMAn6vg802+yrDUlwuE9pEI2onbVsDHRxiySOYWUqE7XUiW5MW5CjW/PyqckX2iXcqRAwdCGkrqHw/V6U9tmj0570cMAX3lwvTEZjtA2tHn20Si3GyAdq4wEw219n181TiuQvRBAcCwkneDP0vt+hGuFmDomTobM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520844; c=relaxed/simple;
	bh=A1+PPN+ZOaz3K3/onvE9mBZ0QQ0QnXOga5ILQXc9ACI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VyUTtL0d/pJCJGNHWzKVG4d2wQSHQFx7FU/W0pyUju/6nzUMhM+SkP/63hEiBRz80QGxE5TGLSVV8DrHYq6camE6Sp7tNG6LeUEHms+I0grXB90k4fcJRiQwb6FW0xCji2UVirF6YiXpX39dNv5orACVnS2gSKUAbZYzejvon1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYr0AiiA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYr0AiiA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b94a19fdso724282f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520841; x=1775125641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XlEsJL64WOZVJt9wnraS3EcQnsaIsfnsMni1+t4/jZI=;
        b=tYr0AiiAZKRFLu9N+Nvnv9GW9lvbcia3lUKFaDpjFalDev4Q/K59JNcrzMu+OrTkP3
         oxrRaRUhMLfGFnARiged1SuZvsEhlhDnxhfBtVu3S3TxTfF4mUgwMmJauXd/Rrlcih8H
         DNmj27yluUZfPcXrzwe9QMI6Cj+BtP5jA7L2POQGu7sMnIVoleazRrnFH5shEEwLLuvh
         IRyytkKIK5ZDZxbQSd5aiAComxOPJwYZ/LlrChmSWTRZYJeptgTNtFYi8Vt/K+bAbJYR
         qzbdiTy2IhFQY8cUT33DxeToDtS4MqCyQhJ/bl2PXd+D6AZNGoyp235CTvZa5Qr+2fBv
         eHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520841; x=1775125641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XlEsJL64WOZVJt9wnraS3EcQnsaIsfnsMni1+t4/jZI=;
        b=FH6TM8A9ElLBZYAhwzNw0xw7kfEc4Z+7HMk0jBVuWEknfsGK6bxkpm4UnExcRR5SSx
         ibsSa2MldY4quSfi79TFpUrNGB0QidU0gpTueyh4mt8PG74e7C7CbGHIelHkxRPPAiM7
         YcudgdRZDKciN1lCWEGK2j1DJA/zSMFifbfoqwP47TMJDCnts+sChCu9OKE6CPm8hihG
         2orzDeGaie7FnfyQj4Lz+mMvgy5FKP+SAaxIdNcpOvyBzSRz/JO8V2TuKTozbl+UMEN8
         +JhZWHyoGcw/RG7l0l8Hwb4zOF9zKucTJk0xLnFpXi+L+WFkNcBa5AF2STKwjmNPrWQY
         at3w==
X-Forwarded-Encrypted: i=1; AJvYcCVFvZ3KClUoC89o44oc3sNrE8hV4+f16VlGHlC94r9XTup2KGvzV0WeY0/tNVKYso2FvGTjJLKoyJeO@vger.kernel.org
X-Gm-Message-State: AOJu0YxecI3GXCrTwM0/LgPUpUFhX6pT75xcU8t7p0M4Bd8wF6clncdp
	hQv3Vltpg83vvqOris2Zktkg0WiYLQdI7VjBimSTK/uq3Manaoh8gPShJUCblA2CxuA=
X-Gm-Gg: ATEYQzzJvR0oAE2UznaS6twlNxP9eQSBp0hQc9kfonnkd2EUK9YVJqAkalLxv12ZeC0
	Cq4WnU7ccwZvW5X5t5QaReBRM0tpIza1j1ugDgwrGgLNlbPU9B98+XwgCsEHs7HtePfzIjTia87
	j4seEfDht/jVNXyDlTbKgMJXd/JkWXTmi4L/kXMEv3pDALBkUUkLD4sDRN6aOkKqpUXkQJiDInB
	lAOTi40Z/sKXoGQkmd21jc/hD+BIrgbwX7+mCtP0/oadJwnfyvJwrHl7Djx+SSHJQkQrS11fJSw
	6BltaoYlfvyIK9XggwqHR6lPP5jVVsak3cM69Iv2TrIDwVEiX6D6IMs+gmB7SAhGzV70WzpycZN
	ZeqkSG3KWG1pNZuk9yMvuU2m4nkUWxXgAmJSfM4e1aYeII6JXR4qfG0yK3fUwCZHlbxUQ6uYBqv
	47RKVjALXmqczJ2TM73S4zBuXnRJWRUleb0A==
X-Received: by 2002:a05:6000:1847:b0:43b:584b:96a8 with SMTP id ffacd0b85a97d-43b88a36584mr10856779f8f.47.1774520841044;
        Thu, 26 Mar 2026 03:27:21 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:20 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:46 +0000
Subject: [PATCH v3 09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add l7b_2p8 voltage regulator for RGB camera
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-9-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=A1+PPN+ZOaz3K3/onvE9mBZ0QQ0QnXOga5ILQXc9ACI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQod+R7uaWXuxiweRyU2Rd9JoFv69ibQaTtFv
 HkpDxFtnC2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHQAKCRAicTuzoY3I
 OgMCD/92DiRpNI4s2VZ2cfhRL93LMx+EOBSnKcro9fU8uac+fI4ym6wQZ0AhPYZMbD+2yL3XKWq
 qBB5zXw2WbKdNFk66YC5e8DxowZNEvz3G8GcBgqsQ34UE5oZb+x3ywSCrn1n1kCIgleajWS6Vu2
 82YBSIpP9nGL4ZGoQyeqy94WjYI1nXzTla1sxB+5htJH9VD1AqwHQF2BFGqj08EAZtv66mQ3AGv
 CPO1lIDpMaDO9DhL+X4aJhJneqpi3LvilTvAE4tmKiIyI7PrZeKD0Ll8RCdYYxnPkp2km6VRLEb
 MgYhM5HpY03+EQ6xrm0RJFFI0/chrU8HpxTCng2yPSNGvyoI6/pDX+tjzwYFp4IeuYNAaXlJxx7
 /yEGRo91WkR4qnzrb1gjWqx5HAO7z2LDfrdv7Ols2WUqjGjfsQV62WgoWwmhwH01Ms8EIVSgtWT
 s516KioKILjD+7Akfzm0jy5diYD6XfNDVVFEMnzCp4wNtuvPhBTjDHbVeakQpvWeD63wM2Y2TWh
 UblJ3MtQTUMlelp6zeLqUvS/FkEvj+qoi9q9Sug6PZDEsV/DKXTf1iZPJUBlaFVSEhEKVjcqRWB
 /tOtjZK4jKh9otmH9fr0qm9jBX56fji/cfOFADoqd9X+pScRluJC7/KxOh1xerpvstiTkRhejKI
 Yc7bUlSHgisYOMQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Some sleuthing work by Aleksandrs Vinarskis in the bowels of the ACPI
tables for this part shows we need l7b_2p8 for the avdd supply.

Suggested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index f10dff1da7f8e..b09b6c87132e9 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -552,6 +552,13 @@ vreg_l2b_3p0: ldo2 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l7b_2p8: ldo7 {
+			regulator-name = "vreg_l7b_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l8b_3p0: ldo8 {
 			regulator-name = "vreg_l8b_3p0";
 			regulator-min-microvolt = <3072000>;

-- 
2.52.0

