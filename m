Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAEF4A2041
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519428; cv=none; b=ixTtoOnufpfN2rVwz2BP4N18TRt2i7p/E2orR+tSDIStMUamVKlYGMnLup29eJqvkDrhLdifprcZ3NiiPzCQvOvN3t6NBAIs7R60wiUl5IIqSYBxipTEzrRSe9L117hYFDAnDLKCqf3sIyfWL03VfnaUG/rZG/4OpnKkW2BK8xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519428; c=relaxed/simple;
	bh=bZrLMcImBykx3oRRK3HVVood6l6S2lGXu7LQOJWI3H4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvMHN1aByHsc5QrpzC5qE+OTXq7Jjo4w7VGE2HaD5s0lrVCGgAJ/b8kHHo3tu9hHwAjQsPHJf6C44AZDEZ2XNy3TBqa5KMwoF34QjB6BpmSbXrGQda6PCohYd0K1gOHMTK0fsvUwVIQriTYSnuM//cbqn8gIcf1mCAUixDzPdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QQX16WaB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QQX16WaB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso8430875e9.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 03:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519422; x=1789124222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9q3cb1HRmrEaFH2Sno52PzoSLUWQfgcsQ5S1xcRpY88=;
        b=QQX16WaBqriZdh16HOIdkxn0IFyirjh/3tPEGTyJu11h0c0gcUnFe5sWw1QCZ/xIUn
         12E9JJjJeU5bnWxOTrL83USINWZkXM1Dpifx3GGPUX0ERV5kZpf6K74IpMG3mtye6hIg
         MYMZJSj7vZ8g5zr+nr80xHuCOCXVM1nrXkp+e5y23JWSUtQt5gTDpqbFdX86A8HG6NTH
         TeffFfUjjcqO1+mG7mQ1c79CJArwO8/PE4ayQs/jm0eYObPti9q+T7TYvudd50YahjO+
         tdVA9LT9edX247AXQo088TrPfIp3w07avx/yQDNxOYt76ar0fsefshGsptIzJhuWmmnG
         trcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519422; x=1789124222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9q3cb1HRmrEaFH2Sno52PzoSLUWQfgcsQ5S1xcRpY88=;
        b=KZ+F9j6Dq1I4HBoSog355Q94cduYOwPtJOc4RbTouu2a32WyGTCUVvTHotzmLjUZ5X
         /d5YEPPfukk6Py2B8L9EFdXt+RxT2EkCr4Gg4eqmy/H/AK5FOUQE+1DRribV4e8KecdV
         g3YmAkN2Evt3h4P4FF5tssYH2jelvTTzN1K0NzbBEbdVYPc/SUL+68FIT6hPr0bpmM4g
         LPO403hsfrGUtfkcDQinKIr4trUxpCMerRFz7BuGiswg5bSTUbCwlvrX76rUneJIRvsK
         CTQtQ8cA7tM7/I2v8ugJP5ERp9hrJJGTmXt1CWuDHHaghbulaugVlNEALKnpmSUAL38E
         /e7w==
X-Forwarded-Encrypted: i=1; AKwUvBzYwIjcfbSUhM9tMqht/wz4ABy9SBnmNBhhFMJKJiDwzN3UV//8J9wnB1BboDEyuuoTWAKihZ5+g6Yx@vger.kernel.org
X-Gm-Message-State: AFuF++mHQ5zZjjgR8woR7kyGzwIiMAsuKZaf+s1utoeWTcqgQl3l4JL+
	7zoGKR0G6/cbXPC+N1kPJxdov9raPlkmccguxHPk79/jLiiA+kvRKeFs4zzfnPaXblY=
X-Gm-Gg: AYBFou2tlz9YZdjtJMvE7AJYYYGgU64YpRoRlGO22GzEJoAYY7swT01A7somZa5pLR+
	LMKHyS6kKpa9O+63pe4tPtUdoIJbC5XP87m7OwV2SPXX4CR95oM3LNhCvqnUQMrRyAxUyX8yavM
	Gno0HRMVCNrYHrXXbPUV6/HhnoqN1jyeMKCQylvSNx3TsEeUTZX7W0RGPMxlcRkjq/HGPy9pvmU
	RmZhiiGqKQpQMnQvhi8KKtc0JoQTwWtJhYbqsl2MAgupUpK1Nt9NqF+Al1pfzuSEH4r3rBg2jg4
	FNiM65yPwl34kzYhqfN7RRWzJnu0Bt1xkvgdMfErg9ksgG9/mW2Ib8/tBlq8IDMysK8zM+xQ+zB
	xe7buiXOuvRp5xKLo2VL0rrnBB02rPLYlchiSrD2OS2UrZYCLomudrqTTWF+p7VBcD0xK6JIo+U
	Rik9unHWP2PWDFRw6Gs8rXtOj86lONkdW6iGeNpLrOcIeJ7lhbCLhVznXyzjgjL2C2fXJS2SJ7
X-Received: by 2002:a05:600c:8b09:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cf823f57fmr88570735e9.10.1788519421540;
        Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:57:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:45 +0100
Subject: [PATCH v5 13/13] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-13-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=bZrLMcImBykx3oRRK3HVVood6l6S2lGXu7LQOJWI3H4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPplgz/ddFP9fKrMGKohvRQDmaTVdX2mg+Bf
 g3Hivg2Xs2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj6QAKCRAicTuzoY3I
 OobQD/4666ZAH+ofmP2fKuH8xGv8qMu/HlOUaedLayTC8HzTkGVwrQ2nk9Xfz2DF/aQueH9Ry4+
 WBf270VS1yqP33BHAj9nd2/7JUXkwJxaNzGmxfnYgkLgojapETtpHcz5t9Eq7fKs/ZIfQTVmWbW
 gkPGaT9aSqQjyuTWZ7vzDvYG0lHtEaLjEYk47jxiR0AjnOajZnG0Ijm1zGLo/M4ysJ2hyAofkqE
 kZiRqOZd4887vucVlPpKlvJ4RztocTf3/k3rW28ecnyZgv6izXM6QDSaQiV8dZPsfIal+fV0tnr
 LgLPiT7508sz6s41G0DBpcgt9N/41eT6DGZ/t7WACT/R3E1n6XIwF7YPd3ogKp/xqeRrZIJ2vf8
 vZWPgctU3KAlf8Hj8U7JYoBAO41eChNnMrgGHdkJtQYekxTxKDKliqYGIwaoWcC06mRYjiNTPee
 /EPN0CqO+tdokiFNKWP3b/c1R4d2felcCwcJgxhpvvGNSwgVJye3brHv0PWiaXztimxrz6in9gZ
 WbxP1xRfIQ1po1XYTOrHyW1S5e/0oR5VUD0/ST5Il5W425MKYJA5hTzf78r/MueztXfZQL0mkSO
 TE30qyp0ra8hsvq7JNrsMRyx8FdgGtE7f6YPehqZhT9PD1S9OYUFwHEDX3nNt9yLB8jxwSKbqJQ
 d/PDTYQj2eqJKaQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..e92414533d48f 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,87 @@ vreg_l3j_0p8: ldo3 {
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
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy4_out_ep>;
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
+				remote-endpoint = <&csiphy4_in_ep>;
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
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

