Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978224;
	b=ibE8TwWqSB5siQodCN3EpvdKPJYpEBdqrkNqPWFT14x6LWbUzepT+xNKnhMb5ivGIPrl
	 eycEetl+X+DblsFCyOY5yr8UxMEZ6YaGVW2Qh3NEurhe6bAQapj6y6Uz1yshvOkL7fX4p
	 ksI1ZIi7iBUarKvnWVzfxKf4Ev2VUHD4W1PfCRdeGu2EO32wfkwHUpdmeHZ0owdGo34+/
	 FF9jU6fxuUS9a47L7W9ZT/mQXnRYdlwE7j/Smgl1XLpjXVqeGHvZz1i4bdlxkLq7kIWR5
	 v0QRXd6DLZeWfcyrDcAHVcVCOH8GkwO9CcL0uBleDG77MJLv4wQtnQo8R9WDZIPAgjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=Vw+as2npk/tUmaGDQXNOam6EZE6sd3+awO+PYwnsgNvrywOWtRj9ZAq4MBpJ0DTSZArM
	 gFlJ05gkayH28Be0YgmFCgyzVapzTDps6bAkux2+WwJ3GfRCc9wTDFuYZ7Mcxpfdvb4yb
	 jk96lh4XKUX2F/7E+OWop9CatNGA9bjLAhxrpmQVMi4dD3BpJBpMHVymaVFsy2Od/CBEy
	 sflmyFFOj7vjUi6gIJdgMg7tysTHVCrNXLra8m9D2uyXYCNFDSPbIt5EecZbfjnjiB7vG
	 y9qyShhnaLPXFcg7/1N6GpsUfV0Krcq2TwMW1G0fDLem2JyIPE1Rcxd9M6q8oR3x1Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE2606A33D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEE2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hm57Ipyd
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso1676476eec.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793978223; x=1794583023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=Hm57Ipyd4zR0uJlvm6dhRylUqkiMorh1ZS7/8CIZIjoXX8W4jWlo5vqp5/4jt/ydkk
         QdnaSgyNWo9/sN8XKK+gMrZJWjv7mm0ReLPBCbwPhKKXSRBomJWJX2ybDOwfKE2jsL7H
         0hyiMTRiYUD/u4oVkNMkMQY1VNevjc6LJcpFos3UhIqI4WVQUnOzO8qd0wmw0mMvYCUt
         ctfNM4AbnSRx9Oczt4ISPdBQCx0OMHEduHduejZq/YeIJRkTPIozhgJPnBHJ6j2kOFr5
         6T6mcZs0HwP7b1+duob7/uJn1O+7ANzgsU8uocJiS2aqejFMnIVJITikaUoSF+beZXCt
         4ukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793978223; x=1794583023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=GkgqdVoJzQmdYSemsZWAjXm6ZAk+E/m6nSq3taa+kAVpqLvGNxc6c/EePHZBRuk1RA
         dMfuPtnUCpG41Q/54JIKnUx8zwbwUB2bEzbGdlAqIaxGjCpzcy88zgXx4sGf3ASdshmb
         Ygf2DLI8MO16xMmHMRijI62O/7fOdJSI+k/fA4wWw2hr7pJylIc1o1V2YDRGBuz8Mtli
         14rjXWhvVxFIsuC/sR77I2IpQKHcCaNnYogcci4Hi9tRsDzdrKH9aISpySac8eqweKVV
         xPdwDVmmHcxibCP6QJ0k/HMchDgIP2rDWqcjNTN9ByN/3lW1t8xEPfNdpU2DptCUIlPB
         SYkA==
X-Forwarded-Encrypted: i=1; AL+hErFdbKQG4YYisiI+QyMN9NUykJ7G9cDySelBhPi9j2RL6/2gcBfdgYFx+Z+8izfSaotNGgsRmwVYHm9q@vger.kernel.org
X-Gm-Message-State: APuU4Z/9u2Jyk/5Flw2+0ZG9oPPrpqRRiNNVOCzksgZg0k2Yxa2uaPEw
	+5y2lplJPEG1S4fhHbYmidO7sPhDn3PajkTFGnYlnYWd/v/EDY2/06Ry
X-Gm-Gg: AYBFou1XEIkT/qRGLJayHyaN0TOgyGW90Yh5GUHn7bWwHMtJ3wqU4420AByRhWs1W67
	ks+E+m2m4WBfSUveillA0Qsrkjgs4hkYXYNq8yfe6bKTOGLOyszf5PpkxZ/nvjlnlSnco3SV36b
	+KoYMHEMOgHzUQ8UGeptoUuyb9y/nqByTAIe+fEviDgZJiPF+YE2Qr8Nkk90R53rklyov7Qu61W
	6rFMR2xNSW19ookwCyYuNaFq6kOGYEVqKDrxvJXliqjH/FPO8bV4p7SJNal609OZyZq/qWjg1yD
	INQgQzl2i4aeVgrtHs3bKji6uGzMqhsrlt5v7UEj7yBfrU2xYExw3SjZewTdLulUwyVK5uNPFLz
	d+O4e4E8c37Kg2e8QlwCv7PevaihW46p7QOpi1C5vRsCkWo7ozDXw8w8zdd/MRcc5LaqIKML//z
	FpTIQjj2JG4EaeQVgbz9fzgLJo7lG3rQGSRocf7ZjyVrngbMhhnGUBgKthQSeCfBSQZiIn1c8g8
	RExKlgQIJ/9nbFfYXlaUbtmwCP1qgwNtK2ggvSakIHMzC1mey1N7P4qMN4STu3J7b3GWDQe5Kjv
	FB643VxTnrLcXWI06MnnkVPjL6OhbKFQqzYTRmwzPKJq5GM0X59tJyuK5bEvc5fCNf6bxwlNisO
	pcnnX6Ts=
X-Received: by 2002:a05:7301:d81c:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36f75a2b011mr4038390eec.6.1793978222959;
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.221.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7581500eec.18.2026.11.06.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:17:02 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Fri, 06 Nov 2026 15:15:42 +0000
Subject: [PATCH v14 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261106-sm7250-v14-7-7d167e993f9c@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978147; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=pBWXHjOFV8yy/kVfddEOkI1z2Vr9iOnPMtTW0sfnFDwT+AdWHZ8KZUKMMqogu35cKmAlw7fOZ
 Tzds03Lu9S/BDhGPFs7OOqoZ0Ml+RHtklhdEbV5ZxocuZ/BaH/Yzk/7
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

