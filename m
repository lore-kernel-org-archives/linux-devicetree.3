Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661788;
	b=m+NUIijzRTRSb0ARQykE3XRfB0MFJxjdy1uCv7TeUMg3kL3ecl26pkOCxY9GRWnvgatD
	 8A9XAH7IlY/FBNyF7ElmgEZ91MP9/eZUh8Xsm2lEMXvvX2f/xmdtdqt4eBMm3Ii6aww3b
	 YXoJJvhuDsaTlft885kSqUCWPsHfNF2Lr57F0gWQJBBWGEz45/RKSc3swo+CvrJONQYsK
	 Xvd/KtNJ4NFwMhbrLqCs0lz0b+ZtDwvhsZ4Wh4AhfRrIJoINGtIIXILnXjlbf72aDqhLD
	 JjM0d9DMJJwwGlRZ64o5ndWEtr7CyXEQ85dsu0FnZ9nSpoUXydcZk2qIFF8PKbDHyyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
	b=zXSo2CvxhS9UP3uTOEGDnsp+5/fIMrtnsJsIpnaZFK2DpPhvo6oH9QUB7V0KdSQ0TWRd
	 WWP6HSbKEv65rY/ERuuDAVNctXjaL5Txi+O4zGb2cB8ppISGcvkYnqnxga3xO0tuud2DT
	 sUV1lZiNK4HMgW8jFe6fwicXXWYWeajegZHXbS3Pylb34OYAoVOHmnB9g7pVXO7Z4ygVt
	 bAXwbjMIDtmZgwgi4IDwtDgAOvUbYbw8h6CJWFx9QFJDj0rwemHczyqcpDEVFcm+zaHLv
	 TZ5uvT3S0BldGJteyaJcoCbHvLsvALm+xOUEiMyI+BxZj27RcB2wIShsS1EzRQXnEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKAAeyCn;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C60606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C60606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KKAAeyCn
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so11243105e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792661787; x=1793266587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
        b=KKAAeyCnPcWgRh0IZ8+4xHbrmYgnquXBo5L8vA33oB3DfLBplLtZvb4+tdyMEx6CZU
         MC/jafSv4nbwsU/OuW9nYrpFDTI47VT6mrrkFvIbheV71QwQURpQYb25Sxsqs8yHJlYx
         WhsmQB9VBdQU2vp8qeVtTnu23rAIkIXJTk+w77kW20e22S3vdXtyTanaYbonqaq9NeNb
         2vXMrPvuVdL/66liHN4KjBL6YpajHFMr7kMJuIgU2BlauIfi+VBZfYdZHxW6PUsD5Mk6
         jQZ4jRloIfzo63wr0gcJnLVPbnYkxRCrkn7cS0C4ZhFEB6DbC3yDw97lmF6rXJnzdOyG
         jaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661787; x=1793266587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7HesuqHCUKfnjxgSq80MIKhfjnfNKfcHJfcl0gxIzE=;
        b=0oWqYFsCYbWN9WzuYFu6ojw8YEvD7IBHloy8nL9sbt4mYxc/A3MftMtywUzJSxqa3n
         z0EANsCIMaHm9JzpNax1fHxQr0Fh+pTz9myVGDPA0JEB3GfVt5MDB4gsBL0YNfF0ROVu
         kgFNkaBEM2be8tGluey/JXxIEENb4O2TdnV9CLd83kCe/Sm4k3wSJ7YuZraCW/rFNgWr
         h9cT8RFI3dFxdsfQIrTUqXx5iVDytUpohMTuWCasxkCob2QNapUDHPlFOxNLqXiwTvxo
         q91SyauR8kAdK00VhE0tGv5+EOPF2ujV3zRepD2tTgoAVPzu8qfW8IInpxxnIFbqJfsf
         wiyA==
X-Forwarded-Encrypted: i=1; AKwUvBzga0nNR+VPkzMgA2VbI2hULcHhyBAikhwhQeUiyQwMXjzQkMeX5HNyCSrhJk1thFp5y5VfD4cJ4OL6@vger.kernel.org
X-Gm-Message-State: AFq9FYI6YkaiAk1qSTFDb5+g27ICZuk8aGvsNll1h/6rwf3WPFw5Hgh9
	dBp/lf9v3HYc11rr55zR+s57THCFbdvETkF+2LD5APHRmOmLmSKhYYMOXuAhrEYtnT4=
X-Gm-Gg: AYBFou3Uz1y+2/FNnuSDllVPJRlVYzRI++lIWpcpkiU3CExLeO312zpSirjvGcF0fbf
	yphY13/7Ehpp3HALfG1FqWvAPcDATqQ2tRyfHIPv2QAzgry0XThjQHSiVwrjBEd4EWx9M48hC7H
	BR7Rekw0rXH+qjSE9xLaFhP/G0nC4BLdDKKBk/sGOf7BVC1tTsHUpRFLS0drr4+7dnTos9mbu5c
	J0o3cyi2467Aq1adc4AsW8SvU3hFhPRIEzxtkGQCE6d/VQ5UbsAdLun3MEf/vCbqiCdljYeSxRv
	ggdTso3OccnMN+Nmm4R+8eSDmFe1KUz4q7+Qs28oz9DrXiWRmmWOtgAdmAwBmYkBKvjVsYG/SjZ
	qj07JF76L56bLfjNxw+WrJOS1818xwyDwMjj43HYmAs0PJ7yavU7EI9m/2mbdu6a+YGML95mY5D
	WuDAuyWgIdRaQEfMkiM0uoU2VXDGvzccOWLe+66A0bm3wLo1Bt4kwXyWgXRe9WZdaY6mTyZVVSc
	CcqcWGjBIiB+CSyrbj5Sv32WdUoOIfjDryJG/IH7XjulIUkAFjlDhhmANbFlSW9enVTD78rz0zL
	j3aRTxgKnxQc0taQ
X-Received: by 2002:a05:600c:628d:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a1fdd170f5mr99283825e9.15.1792661786569;
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm53299485e9.0.2026.10.22.02.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:36:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:36:22 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: sm8550-hdk: add DisplayPort audio
 playback support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-2-8a189c71938c@linaro.org>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hreQtrvscUJJdl22qtTpfQsMNJBU8/Pv38wJioMLi+k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dkWzY/AnMYELYGe57U6RsFJV4K33005WEHPXZEa
 I5JsDk+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnZFgAKCRB33NvayMhJ0UreD/
 9RHj2TqNvZhc8tCAqohC556Wv5dLj+qJ8xFQiqadrhwQ3TifglV4kZCYwvpamw37cMwVBBniQ6akpj
 Vj9kv7p9jHB3USMQ/a1UmqQdDenwyZwsJL/Z/bSy3zOU/anKx8cYCyx9JK8WtxIT3zIDuYwIqwqw86
 atvZZ5S5R57dWFiaYO24GFYkdP8MWCZW+NfwFK5hEl6I2ngvKnYYbThv6e2//0dH35NdK8xAPWFHsd
 CHx5X2+IG0MxhZJuRiPPWDGZ08c/9qMkmAAnn7vgzg+SOIsfwHgfoJQZax8o/p0ovfkD63oGjVMRg6
 zF4c3ILYvg0f3E+PP4IguyNpJ16cT2zIstY3ivPQafIl3eUHUY/SUgQoPCIlEpMuRfcZBP240+Gzta
 ZUAv4RmJqTpp3pi1MxyRjMpSNcAZl3vDPVxAAWg2b3ust4VuMUfaEGIUObHedASTcxlkWS63Xm4QtZ
 mK98IU4TkO9DKkM9FoenGrG7Jzh0J5Bdc5UPNfMhRsAiWjJ30jN7yB/QZGeVZLRHGM4hKJHUrIXLHU
 4EpQJ8iPRE140xE2KKne2x47ohznkYrqTZRGoeHMblkN+MX85iDeSo5Gw5oXbgmy0KPLpf5hq2hY2s
 RFKECkjfaHbJcW2R1jxJQ0xOi03LIxrmPfTYRmsiF5/kBKAH5X8iLuVdmVrA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the DAI link needed to enable audio playback over the
DisplayPort altmode output.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 6c09816983a2..d28a51b6e7be 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -294,6 +294,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		dp-dai-link {
+			link-name = "DisplayPort Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.34.1

