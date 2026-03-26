Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F43E51FE
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520846; cv=none; b=cyWVqa1iZagb9PYBv8bt48bSfmmpABGqKLUU8tZNRPSvN2ZAXOhV4j4z8q9XwqpU4m3lVzVA2Q/Wy6dA2QcIfsPkfy1VbMLIzB7gRqGD4Tt8Ym5hRUccs4yp3ZS8MBC5u31FHd6Ki2iMG/5jr5eVDjvWyX+VGMAkw+FZtpbFZM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520846; c=relaxed/simple;
	bh=yTMS3LiJTjDuOiNDB09ZSSgypKoywGixPGrJ1fa5Ttk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KteP37h7kV5ULOY/PinOjsRzwH1SiTv2wyxoWbDmPBmc7iY6U64v5iabfPp0PGZbAqq0WbLpPv2nKIvwMY6Z/W8DYRwkF+tjkDgkBRbktAENZEMohqoBDMJw1dT4reOAcejJq0VLYBJXZveldAimio7gceHe5hhgp/5i2QT0Jt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sskr3OMk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sskr3OMk"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb439299so7356765e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520843; x=1775125643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qUYtiFP1a7tMgoJboSqNqxWMAoNj05TUmYsZNo5Pj0=;
        b=Sskr3OMkLPOlwCXkDku2NTRZnOZiHO+ql84u1Kx7PIN9yBeQe1J8S6WzVPum+lbrfa
         XA2zq3kN9RfnBQXyTHTk6GVSrmOoRXkOyzTIdQbTkGaeQj9Vwk3mLvVqdYe8K/FS5XnF
         sLXo5LkfNtR1xyVo9XFtnH3kzAgVafV7dYhTzq+/5W9+fl6z7XeatBYaAhHJIS5XgGcc
         Bqj6IurMsf6J4dyYxIPPnAySuHMZkDsJkpHkPwQOsPvA2azkPtsucmtPgB3ikqDuUprc
         5PV5Dwdy5eehfbUJNxNHzpjRStKaqiqUc4Pzg1L2rWBKYAB7t0a8A4CDLaQrncewI1VV
         tCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520843; x=1775125643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qUYtiFP1a7tMgoJboSqNqxWMAoNj05TUmYsZNo5Pj0=;
        b=FFznSrVZidVRZmpjmxZWXI6AT2te3UfDq6SfU0WAxEOxNusCeQKlNdyAwQOxnbOJTy
         4+8Qi+RJ+GSDxrBpxQi8ly4r9IFNYH54MKoV2pa3EQZr7vPrNiagjcah+PaGviMUUqXz
         PGQdC207CPHCk2kWpmhDxczyOxkar+HxYutuZOoje/CPEeyli/EW7k2FuWWZjCHSA/E/
         yhU7Gkl1kKyKSRcwFl3mkrLBxCZeI54gY1QYHXvtF6apexHu94Ia6QeR3kkdXiG7d+XW
         WPnGyfwkf+SbWOI1MPXKikNGKIDZUlicNV89BI0Dtl/4L/wsurkpfj0V89s/aIxbWxUm
         1/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkCJxLAfw1JAgaS7vx8nhnoebUZOZm0AgaJydUa2e2RsdAjjBpgZI1l4w3MpzJ0gICFl/QiYfGzWEz@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFA1QUeG9MuQHkPeOKM+XQm4QsNn4VM1+HcN3ErePd57tuMOQ
	xNctArrtlKUh3+ViDeHHBi8cKmn6tcWw/pjEnLoj6xbuAR48DcKEPUSWQAOFKpn8hYU=
X-Gm-Gg: ATEYQzzjLu1zLD9YKlN1F+04p5i22YiYDFk/EOR0+djRQRnnjehz01L/iBS4HMibyOX
	xn3tcW6+v0DEbkBWSsWPk8BldlI+iNzCSvsp5TRUgP8eSuVbpbhT3yKgi/DxzuRj8LyBn9URmmt
	Su53Li397ydkMlfT5OJGSaRnaYcZ1kRKdE9oC/RliJkuyfb/0GSsCqkGvknIoLaKgrvVu42Yp2p
	+dEdoNsH3or56x9LSkZ7w9akd+VyAil4mTevymI4R76LNnqW/xrfX//ODCoZr7UzwyU4gztrg+T
	Wdbzv3HQTRqF8V8/CFNIQLhKR6hupNAuS+fX6En4z+UtzQbg36hWjIfAVtSENLGnJ1p/L4CuPzE
	aKsU3DvNFUXPV/dDyIC5rdySrwFiNQ4ZQvVl4Jyp5+K80T+9TSrTN5Byg6Y9VQZSlOt7LCGGcwr
	sKW5bo244m1IiyjlUpWc07884AVToll2N38Q==
X-Received: by 2002:a05:600c:4685:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-48715fc3725mr108737285e9.3.1774520843277;
        Thu, 26 Mar 2026 03:27:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:22 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:48 +0000
Subject: [PATCH v3 11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-11-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=yTMS3LiJTjDuOiNDB09ZSSgypKoywGixPGrJ1fa5Ttk=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGnFCh2hZiUCt7dn2uDZwYpcX9GKllyuWiOmK6maH3YJwPuBJ
 4kCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpxQodAAoJECJxO7Ohjcg6Kx0P/jnv
 r62aWeRBCoUEt7OdwhRsZh0VrRQgkoBNWvBqDELblTjlgWxu1up5MWcY+P7zpi3LylFxLCYHk/+
 1TMpYbLsj56j3sjr/SDvLxwZafkYImWwpzSP49Mc5fmNfr8dEno161WGGg20KF/o0Ag5CiQbgFB
 J5r8z+IakDBjFTfowR26+9WrlPNzu3JcBa3ajuAZ2EgVTFz5D8uQJ4MDtLQXgm+9VH3a7gwNnvz
 smdvP4tfZCJUtGlLubFVm7PCgWp0md6seemttze3ytNLLnYl+faCVSkdTqD0yFRL79HyAU4NFfT
 jU5/SBgOri6UE38q7z6nSn4DeJu4gj1aCkJ0u86+NtQvL4Pv+U/1LI53b2CjUQiG7747LhWo8rM
 fa6WWvg+/xXwHY1cbLrjJFJHDBZTTFWjFh6CpaTpuBkm6UeaIMbcpL3RjL3GkMdipiVt3qc9bW8
 R5xQQh3RtQXBwiInxvvvHQHttqM1xhkpctKptrtYwZCXy0uzi1efs9xLUvBb/I9mUJ7YAhYEyEA
 FJNyiylVNZKKh/4HuJodhk0Y982WuQteonL7+65ACbAc8MU65U/0K+jHN31PuZlIS3yjAj6Mf8T
 DPRcI1tDXRwt543gp4Kps1UD+flLs1xbehko3KdWrP5/ZcC76GZlcn5yZ0dL5/Am3ZepsUKBE1U
 SayQ6
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index bf04a12b16bc9..e31f69fa43854 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,66 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.52.0

