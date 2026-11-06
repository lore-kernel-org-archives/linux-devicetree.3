Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978215;
	b=HaAQ4/uf+Kky01rSEjMmhcW7+BXo12jALw7G2g5yPheFrfqDEtcoBWcH7GWazSiKwtvh
	 hTxzUmj9/BNZh6M5Lm3hAt730RU46y04J8IysHhw0PFpDiXEyKINXH3IRR2bJuhobFDnv
	 KRxywSmX2pJUb80E0UJPAXzPTRkme8/2Zh5ksezhoc7w1bXZQ7OcX9LDclfOhy8SJfAc3
	 RoP9AJpgRIEgjJf31KFD9NoA8Eohr1mp04NAIiZFpxaF3rrExQT2MU+F3FRNIlBGRW64G
	 c+fxfUXb3nF7vw2qXJLxBLT+8R0erocqVm7d9UD92NHyMQ+s3e27gmECspLzOvOt2iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=YEbyryb5nm51lS8jCxOJ+2p7Pi5pvUy97ElRTHTJwN1N6c9mj8ZgehXWS15xvJw/3lLR
	 JfvfRD6JsCBbNnrO4LHKcdjBHshd1gn+oySOOak6KmqhP7gyJfMrxAmK5uPGJoa8m6K7J
	 Qj2uv+fnUcLU9h1aBTaHmCfWfZU+o/SRS1WRx5RfRsa4oTOJ2Dj18e4b2zXuEJwdBZ3vp
	 84r3BfLaGMaGB04hSHgeQYJGPO7ozwVxqHYX880HREqUvHtxGvXzrrYJszzIPQbhqbhd0
	 93WK/9nzRoLEKyGBFYLaYA/1pvSzWUf/Jkf3iLU/iB0UxDXRx6OBNdGTxU1oiELrrvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67DB606A336
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67DB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJ2mv+wU
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so1003322eec.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978214; x=1794583014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=UJ2mv+wUuXXO8u7SnP18fog6WaoiWwvWKnKvySMt7qV+3dlB2tt7iqeGvpAW1lrpi1
         z26GL514JQI4LJBgGjfHjRWMXWdE+euTdx0gAVgfRRsDDwK4O/3wCVVkVMr2atlDb6Sm
         fFLUzM0NZ1RvVn+om0BPvHoP4E4az7uFs5K9W7DWpegBIKSJZ7wMWJj7cAeQQAyrVeld
         cBfu7mHCX2BfrtH2PNu/Zr+UkPcmxPKP94S3Qp5JGnA83bfvm59addxBC5XCsj24ItmS
         bV6qYppWswv+1CAuZ9YWG7jer6QcEHI3i+6GZCmzAbLANmEVqn2zxFIhiDDaBvwgrXU9
         oi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978214; x=1794583014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=rUExr+CiPaklG/p+64/VNwAWLHcaF5jYWdXnKlXN3MAmRz/fJctgkCQ4uGCPFiCwDG
         GqVyqlA+CGrYsWdbylP00hprdNqFDHNwoawPzFZHYLvYjtdkLDc1i3xlI2FWwx4ppNtb
         lYA0bOthDbWwFyWlZ3CmGs2bsraOrZChmjFUfwhBhhVexdZO37GoKrmyM7zZZU6AYapD
         BOZ6PZ0g1BVrLoPhO0Wj3BE6uwtfI5uudApbAjRkbbwljkfP3J4xNT2h62u5ENm8X/wb
         5rnL9AhyOMtFTaeNEXp+9WMGsVYD5zL7F9LEUUW2YRkpp5e45Cf6H8HsWGhG9wT1eISf
         oBiw==
X-Forwarded-Encrypted: i=1; AL+hErEQKzH9DupWyQYx5XdwkNNRYo73tcAaGMSKAxxM4YcH3hs8HjRzsUGxltTPpvjndZoqxqc7kNlKzCu+@vger.kernel.org
X-Gm-Message-State: APuU4Z8/FFdyAIR1v0/AGEvX9QNj2jPldHDE4IhNJCidc4VbCLP+uyJd
	KdqiIFbS9uWM2u1ri7luQ9v4IgBgMsOvAoPucWIfUyPYCwfypfSCWpiQ
X-Gm-Gg: AYBFou3dhTVUFxBmAmzSDnZRbdiPh7ZAcnTrpmE880pAU+Kjx0s4MwAIrmE8XeqJyoh
	2oeAijcgGAD9mDVAlCRi4DoIjQHPB3bozG28lun76Z9MzzKEC46HEKQLXDwpSvA5GyiBAougOwE
	NtCXVEcsFsVIj1WZbuRe8qlMvod0yhWOWEFGH2zUmEjC0SktptVQLwIVigoDKngm8lJfGLWPgc8
	VBME+WxQZHuchNsdJwTHLYqyCJv+HQ/B0dWxyMHLsND1+0jb4e5A5DY/jiCnEdm10ewYM/IOacF
	EBLlBHPgJtFUzzzbvLvPiHq5U+qU6IHWAKUw4TTln9APV0vVmcogJC/hmTS+aEmOqOCF1LP6Oum
	sQejmsOaAnBXM6bNWwk37iQ7awib+mROTyTx7gvirAeevghJlHlyv6Ur0FUP5Qs2ykM2Zbqjh9a
	C+n50qrcrPEjy39h2/IPOJ7g/X0umfEiIwxMV4igWg42Nru30fxsAmYN+KIhHxoZ3y1nnTYPGn4
	tzVqwSlkVBek74/arZA5IFT5y4hqQ8hFgCB4jhfAd/MoR8a53U12fyC6Dro7uTm4AmMnK2/pMYS
	BtUcFLxhN0sfXI67Wma/PyUvoHHNA6oQ3vdyuoPxYRKU6Fl0mfAzJuTMBpESNEkMhFtNj7jXJb+
	MLil7Xr0=
X-Received: by 2002:a05:7301:190b:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36f75441608mr3747167eec.8.1793978213641;
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:16:53 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:41 +0000
Subject: [PATCH v14 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
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
Message-Id: <20261106-sm7250-v14-6-7d167e993f9c@gmail.com>
References: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
In-Reply-To: <20261106-sm7250-v14-0-7d167e993f9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Sreeshankar K <sreeshankar0910@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=OJ/c3M3Wj0MaC02qVOKVTq5RLwsCER55eDtOI+BRvMbrJSwx6IJqxbkHqxxEctBHahiXCn3E/
 t4J9wrrf/FLD651S4+JcGBDdZwjERY/JULmn2DDTAIq5nBSrcU7QL5V
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

