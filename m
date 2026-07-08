Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7863672B6
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471463; cv=none; b=elaF3aID+1caV5ns2SKth+Z44w26fOVMTViIdMN9/ydGsnXP2uqvL6iHda58d6fgtHzwftfwewOIVtZcZcYcIrCw4oNTV31QWdVH2u322vudXQASdfoZjcKpmOH4YiqvOhye/HaGhy7/sVuqISciK5YOzLuCE+TND7LksfSv8eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471463; c=relaxed/simple;
	bh=pWBNz5LfXepJgIeDWzJDJHv9jPzg+TX3+coEE8bqAes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLwsM9lSwXrlbfeANalSC7JF342ZSFeFlb5Yn9qUYNTo3Nlp/wTPLea8HfkrUXEsvS7hDjppGuicbOHTGpjkYYhLDhhwvUvKTcWCm/vaS4sbwFbZGfwpcElMrVu+G/V9xQDn/121l3lT71DEUi9RESTlNI/xCQQly4bcur2WXZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7j5QLUp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7j5QLUp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b779003fso269445e9.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 17:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471460; x=1784076260; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyDeSpSoWJue+yqqnuU2hzkr5O5i91lX/20TqIJnGes=;
        b=Z7j5QLUpzWq/djw76RkvPofC+T2A4BhEzbx47x4qFUOOz5+pOM6kOT8lyEfL/PMhKx
         PgHzgd2lR0PJIFGHHH9TZUnZLkDUu6FatRK9lbKlDOM/Dty9YnnTu+XemIOsbUbkKBbg
         pwYU3qKFawq6TtXIt7clHAgrODotQcfbdP9kTlrFnld7KMkrI6+eVxfJgRWu88zvsr2B
         mYSC1/k9KVQh5Emc+tZQ9IKOQIPPON8itZ2H9yHSH6q34RGiCnRBterTZZqb1vs5R+Af
         xV1Lyw2dUNsaCsakFzhK4UAYNd9splHVfkIWRv4YMX/rnKYqM0dxcNft5T4J18sGiz5T
         wZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471460; x=1784076260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyDeSpSoWJue+yqqnuU2hzkr5O5i91lX/20TqIJnGes=;
        b=kkzQUmYvA5gnMn9H7Q3TDSevt05FsZVTjkCsa8jhiH9ILBBQt/MW/g95xd/Bc+tps1
         RWWebFgwqAa8ZZx1kg3BFi3hM16LNbjyxeUo0XDKwjA+an51b2eFKTxgycRDbUQ/k2WN
         59Crj7BMGZVkMjtl4DwU5VwW1lblNyHp7zae9JGLmySEIMlf+zW/BcXlf1HV4JZiBwuO
         Nnm3Dgxhe+zPLIB7w/NpjaorS9Dp6uRt3OPWIYhZtSSgn2XTgtrz1fhVJZvXHgu5YcOC
         C6rOUU6SJD5tbVVyKL+urxYbe6tmsGQ9zuBURxU6y16cYMXtk+8EdbLp+sxH1Cn4elGD
         A60Q==
X-Forwarded-Encrypted: i=1; AHgh+RrX9aU2Ihzeb8/iEKMb+KU8chdE3KnBnUAPltOSAfZiscWICEBzJ52L5lLSivslA0xuPW2CPKfs3gVe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5mo8fAvBKFUC97L7ueIx868KglryRBcusssz0b04xrq66KY8V
	sArVFfCyP0UnC1H+wmmxX1F6G5+8PTarwxwZTo0XCYYvA9xESOrPKL6CO2o7HTfhbaE=
X-Gm-Gg: AfdE7cmhLTSk1RfSP9/RZKaxRfdqTwxvaC8hLFOqGGmRzj5IxNwBM5K4K4XJlGLguKp
	wbGJKdbz8uS6y+2f9DcRfCznUklpa6yxCItK4+p1aeI1kmJdau0arGS332Sq+n4GaEWDooceNpQ
	jrcWaSZYfojuUU+asGQXGFFOKH79sev1Hlh6uWRQQtV6SfoEyUW/Pz1uPxBdjAGF+rBl1tEdwyw
	ViM8qZz+7CU2FHvjoBoQ95roY0KvUsknLfAA4HeNnaIz1jexYrQauj72PGMVNZNTdDnqPZN1vSS
	NIriUsOdQoyMzlfThfdAnZa9ICoDw1TiaAx2EdEdngMfkfgubCUowXIKhJhzUCsfrli7Rw6vdeH
	yvGPC5whe830U7ykWHkE9h/Y266sVJnf3SmBKSnLQeifMOe58ePGZC0rOmJZlUJcEQdo9tAG2qw
	z4QFa8fMvgfy6+MZmmBaJn5g0=
X-Received: by 2002:a05:600c:6206:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-493e68c3aecmr1450445e9.14.1783471459859;
        Tue, 07 Jul 2026 17:44:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:19 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:08 +0100
Subject: [PATCH v4 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-1-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=pWBNz5LfXepJgIeDWzJDJHv9jPzg+TX3+coEE8bqAes=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1bmSpJyLHbJdyV1Z0tTG/FN2q2WGHxcFN6G
 nvzJsTpnUyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dWwAKCRAicTuzoY3I
 OosXD/4pMB2Os1FPkWcnEJBkXpGZHg2LseNqF6dqV/SBlwUsXgqVTWi3LZxjPmb8rOdLrlftvt/
 XjVjxwmMZE6kDCzHu6XU4Yp59Gtyzt0v41f+YVHIqUZc9Zcuh2s3NdBgFWT+b+j6yud8th9p2sn
 wbHWx4XoOXGvzjnxTA//efhNsszyDCe4lyRuFlyD7m0pmWeteib3gXS5SLmCA1u93LnLLYe1r27
 ucJtV4QoCMid7gbo+UyMavNhe/t4blPXG+sZRbgtVluAFKh5gIFDYrIya0enEWftu44kkVsPeml
 xm+SZ+ed88q124JZp9rmgD/rfEF35winw8orw3byq3CQZV37FJ16oEIHTYUGKdWgjoMegVtP/la
 YKzUKhdwydtcFvY8Jactlpa6/WO17CNFbgOOuT87TEoxWWXvjALA65xCLI9mu3Ye3/FXrToHIIH
 7myK0rUwJKHWI+k1cl483FkC1o4AdFEGFRuspol4haT1ebLdF2UJLWoetEB600GCyeY9uXiYiJ5
 CYO5NZHhLUvEv+dmFlN3uC0Fvp3YazRNhd32XGSohS/7AgTMl3EcEVIsgiT+IUzfi4tgaha8Nun
 j0tPohOpP47PdRzPg4CRRjj0rg/wvGNsqhTv6uMVsA7dJ4Ynd8mikNmvpqRSEoknd9cqwRfFFKm
 /C+j8wusbNjMyLw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142b..9a8d6f020a391 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
 #include <dt-bindings/clock/qcom,sm8450-videocc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5550,6 +5551,22 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0 0x0ade0000 0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.54.0

