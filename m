Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF333C554A
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520835; cv=none; b=UWKAcol224qifNWMY+ybgNXT3U8cjyF4Sp2DbHZltpQdbNRBzcrCHyQ31/e1GzNaep/u8jFi1T4kFJ3ef/Z5CJ67+byJ4jz7DzKXckeCgUaqxBdYpJNw+1wYeOEQyQ1Hd7z6hol/yeRQzdtwLMoh/+OrHciy/0/Y9JIA1dJQkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520835; c=relaxed/simple;
	bh=Q8g+dmyFf1oErSWuQHNucIhfVfVOZgXSMdSNemqqcCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MR1bATIjKzJaXanhd2d+BGo4+gI55HkuKU9WkLxfINIiSgFtjlOv6ZjUV56kdif0BDsiQU9eufus24OdwhG2LcyYgCkXBoyZCNSaePDsuS/J6vSYRycPyIKk5yhsZKXj+VRsHH1qS/1VPVQ/srVqxDR7Q9aVeH/ot4JzfHYk9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMt//jnQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMt//jnQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b87970468so746752f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520832; x=1775125632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RR6dNrqowAF8KlOhi+bFuPgwocDMrBUnZUXIhi4XQ4o=;
        b=dMt//jnQy/PUj1fAKQyhLeEEiP8Z3f0c5UZpkBrLFmEWsp0xJJBq+5DsMzKyqfkBif
         fdGJFJ4aK8o6g5D5hXND2UsGeNOAtfQXO9FoQDYmAgMgJ72lypGDrn5uZ1RJXaZ9GhaC
         xSsfI7PrBLr4ODN47buQsCvkrt3HfNMDeDbZqZ6TkUDVf8PofOzqJiayxpHyTIViRJsq
         IMyEclNucKjkF3PQtqvfQL663aY0Igjo1lih+KgxQPcsQRalzbUSJQHPWea28Nm7XZBT
         qnVHXIZ0XgxkPE8EjiiECYPCXkjKr7w71I99z4kPoYeSUyhH7A/OJmd9NsP8xSczcoV7
         V38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520832; x=1775125632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RR6dNrqowAF8KlOhi+bFuPgwocDMrBUnZUXIhi4XQ4o=;
        b=atmm6Cb4s14G2KDw+M0ui03UrByIxWh+wgnjBPT7TdVbErnbQIKcDn0ppxwsqm7fDK
         4vAc/69HEi5qviEJQxlz7dauWHyBGN2kIa0xUyfYdKmy0fvzbOtO3bWDCjoC6HKs3lEb
         cHkaXny661k4xK4uKp5dGWss3Ae0C9wvdS/I3kBnrd/MXX/KVPhZvncqsDEN1v1jDyiY
         MUcGueLlb2C3rgnQ0FDvInu5FZ10JmVUzNeVr3UneLtv7yFgNsy/X0e9U9Au7fHfqqEX
         yL9ypYrPv72xqyX8odSyaem6Urgw1Pv/1ENTPKUz3KawAzZ2Ihbo9TmbskwXOGmF4YDp
         +djA==
X-Forwarded-Encrypted: i=1; AJvYcCUGs3RUcBIe8mt32CxavpJJAUKAzbITSNJ8BTJxzCGHWwDaLyUiSP1/WeZcRIxd6ZZ16edcrY89VUT2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8XhlEWqzdm/TyLDMyd9qypp9dnSxVIKiNb/71JC+sjxGUpJc7
	I9n3e7x0kIpyRmmTe875gww8OjKnRab8AgFOlZEWYF+wcQBY5ibDsZvnNe/oIe5HU9w=
X-Gm-Gg: ATEYQzwGrc+ydMoDA+aG9OV9Dx0NOrZ2Fl8AqtDn6c131llHlSMkmEkwvjuw0J7hXgN
	nuH3Of3zqYjmdw8H56cONemdLgak4GT07iShi0few6AOnAt/MFvFrWejmg7PD7wIoi9MxnWNiLb
	uVJDQNbcsQvfvSsayeASF0BHfLj7OQs6DxEZL0rZ4Kj2bD1r3vEgosynIQOfw9zHCaUh9IdAw08
	X4JZRppt95nnaGl8MMZhz/TWHdHfRXKGyKVgSXBvoamaWlUy1eqcRYO0eHuIhFpLe85vMrwJV3u
	OAx3Zb/b+OimLyCvEBLN6Gs7O1NyF+K85WgYBcTamryDUUBkHI1+rEBz+IZ/rF3jVtNth+G93a8
	Su5kgggvVODQiPEOmsy/8yAOXc4jL5+Yek1t4Wvva18i44M91ERZHlWh8Kef1G1a3ZCIP+GSAqK
	MBAirf9NCtgMROnJhZtoqnx2Lq7i3cxb5p8g==
X-Received: by 2002:a5d:5d0a:0:b0:439:cd10:aaf1 with SMTP id ffacd0b85a97d-43b88a960a6mr9871040f8f.53.1774520831779;
        Thu, 26 Mar 2026 03:27:11 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:38 +0000
Subject: [PATCH v3 01/11] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-1-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Q8g+dmyFf1oErSWuQHNucIhfVfVOZgXSMdSNemqqcCM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQobvnsH/NDTpUPQPEtXvF6adHwLHfEfAknNy
 DqGkSlw/NaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKGwAKCRAicTuzoY3I
 OrOJEACkMXUyveAfq4tUVFdVlXJb5eA1lcnmXR8z8qnTITS8Pzcjjs14qg2qt+n9LSOfHlMRoGj
 syGx+zlzszEdbR2GKzE5opMpwSwhIboNIWFGP1hLEi4yBtdnK0OMTJX1JHEqTtz3GzpZZppPRPI
 bgwIk8S4N7MmvDbjC+FmWMRVKfwORPDAFGFScfiYJ94EBfEtpBsDYdiXo4Jq8TnOEbITY6kgmxX
 0EaVHcRhr0vy5xBm4Y0ZRlyW6/BVWRJ2DCcg8e/SZLlwBKJpcYrhjLSzMeap0+tvHS8CPr9khpC
 opZ0/VlFncIpJKTaMlhkQ1iewKGqGb0X/Y7uwjmujLs/vhnpxscB7YYCtL9nVp3maQ2sCFNuLfs
 hXncbSTKSfANo0geiQzpjKkyqxRCXvHWl8q3U0+RHITTgeKd6oFlOZrkvWhxgeejHWwSwWOPupj
 3ik1/QR8vtOKiJMVt5fYfaWALFkavRvKyAsds35AUVRfcEsegXm22OhUALJLDg2dbxac0V6HyWd
 6Nluh6Rrx4wY6nEx7ntW2j1PzJBvDqbP1y6n2ja43/uPZwDbb7cHUpPFZTI0o/48oBZaW0Ob3Yk
 jmXi26shais3wj9T3lhIl5hu7GpIsmAr92anIGGXw1veGpZ7g/xnyLmnW5lkaVkhV7FmhIDQawR
 m6yQPFA5B+/hRoQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e6189..029ec012d0a94 100644
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
@@ -5464,6 +5465,22 @@ videocc: clock-controller@aaf0000 {
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
2.52.0

