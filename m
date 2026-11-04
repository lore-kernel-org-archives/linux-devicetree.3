Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810874;
	b=4VqxzWYKOegQqvFOK73/ugEu+vjpvtWzUFhk0c9MUYU7rWHvvFwg/j2ldY5Dvr81MIlF
	 e1/QwtAW3gm6W590xkIrYwX2OfJeqldRnAtGipaKRGztVdkEO8yttM6B7IyggOcIoQQXc
	 fck5p3/VhCQYA23VLoKCttWJsZ2bvieu6g2Sfc73fmpodsfLf6KYuL3bt2i+Fr0i03OEt
	 CS3l3orBR0pPBgz+VBzJYJR6kHBYyh4mNRaFKzZPNKooFSQOM2fIG5EdawHBzEEv/rHrQ
	 HdTXxGyoD59rFEdL2P32CxNPxUK1O5Vx83FdGWNAtBL5e1kYbQ3inlKogZlLcMJN0WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
	b=Fu1QG1RZLnTFmZZSNQ993O+AlISxddNCpino3GWzMceVly36HLcukwMQE3xRu3A/ghkq
	 t8T6D+ttGdLVhpPM3R+yGGTDzrfXreHCSlapaB/4DF1YN5D9/nC71COzSyaEkOiYSN0hH
	 i57l0JzOEp3mccMxeLEBjotMJhWKA/IBVFRzp7u0oXKF0XZ10ynOxtJjquI+JmxDjOtRv
	 ImF3G1HaYWQSux17fc236g5pALl/eRsCBUBj2vy4h1A4SlJozM9R6KetFmcRDUSW4Pvl+
	 D9t4BQp7Ei0oQEKgOl6+OcLqtV6vFPrnlZcQPqwX+d1yT8xBvKXL9XB8rotKwiflLLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915A606D83D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8915A606D83D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONOs4D47
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36d6765756fso718048eec.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810874; x=1794415674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=ONOs4D47G6dqE/Qb40F45Otu1UBvZCRCmCPEKocfpcbZqCvSNlBXHBerYhItVEIbmg
         Y7ZdBRreRAhQHcdUZammYaeLXW+7wCAsiMF5J0x3HDr8EhjSabCJsMdggUOVB8Haxe+p
         0I/cAqbuJ8N/5vS1lyvYAwDWXbQSP37AmbbAY+zjtnhCIu2M8IRYL2UdBwJlDC1junfb
         145qvg9naBCNpwwSGwnym+e9D5Q6yQltI+mH2d8EaSN/8kKa6arGcWXs9ogEmghvV/7a
         IPH6wseh/tHEGdw4uXSTm+9Qwu4t28Z+HtZ93qbIyJ7jua1SSc0KjmCL7sz4BhncdqjI
         MDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810874; x=1794415674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGl/9uJ37exsA4SzqKmECUxbZxp1oB60g5h/tILooTs=;
        b=qNBIPa/hW1/Nl8zHp4VpYfwIIim0PUNa1BUuXpIz3haysm5bIZet7qnvtunVeLSstk
         4XZScuyp9SftwNdwUH5lwPXuyiiLJRybP9JbTXZS6nkxi5gh/+F7JRc32FAGcuvCjR+g
         kGZ+vnTGwzS0DG1oR+XlZzdFxKbWWlj9c/zzVwg5fEkkXYXRctGvRjGQpeHQ2ARVuuuy
         EjzTI1oXotTcocVTzmSd1AWVY1TcsW4MqZKOkN/6KC3dZebUOZTrPUErFX8T7I1ERr3U
         j51+4xKyzShSkWXPQH9V0xeWQoLUamNW6zrZBKW5mGAixA8Daw9M1Xw+XCPRwNREXv29
         OVGg==
X-Forwarded-Encrypted: i=1; AKwUvBy4Mk76DxovPM6YilkcdqYtFpMSMQWkYCU7c7d5GdJMOKNcszRsOVGby1PfQgIUjlQ27gMvfxbdLbTe@vger.kernel.org
X-Gm-Message-State: APuU4Z/3FwUJQ3j0ZKEAijq5Lp3KI39psOs2yBGg2evebRG2CeCnEDUM
	iaagQEYqp7XzZXw6x9sbTTVn4KXOp/L5t2pJ27I10yDDIQBGX8xHTwaa
X-Gm-Gg: AYBFou3X7BNibNaG/a/UdYHTgObFCtx9YsbA+CYCjET0aA3oAqBDd8hSxWR9Ywu6aFf
	kFmz056m6mPNioCfxyvQG+8/iu7SBwQRWUpcaxxRtEXXnASc531UFKE+qdx5A2ZqT9xA47gHzkI
	NZIaAdxXEyHh/IAh8oS4cdp8dBEvjuP8hwuCk2QTwF72pl+cCTDuSc5jHuEI92WDkFJXqjew5r5
	7um2yZoN7RsUO0hvSHvq0tCacR9ERV2Cbhbx7wiIYvb7hPd2Au67hnlT1Q2qLCnKQmoOyJSXtM9
	bb7u4QoDukwcCjYPeQ6sWn0XBoYFiAJUwPynjS3uGuOkncW+6CuFCR0uHy0pD7xXrEqzuzsG4h0
	u0sNOoSCVj7019WsEASxeXTcH95Xry+owkG+qdpbfq8qOvbYE9nhGfGxisTJHburJmaQmfkfx4E
	Y3EoNP8IKadkQopQI/NMJ+id4lQw+5876mC/5dWZJwHub6nRBJPfrS0CUEfA6DGqHMgbShmkCky
	8w96xVbN4TOsp5fCI96ZtuPSm8qT2wKSW6SDBBsr/09IA5ePb/XiBeHB3MFJpHOlhpHOsg4zrI7
	WY36N0mZJSJWxA+qjvkFmLSomGdY/G6jehW3og+SOBZFa1uZbqqROrUkk1Dl5nSwf6G0EuZto50
	LwGMzCnY=
X-Received: by 2002:a05:7022:7e0c:b0:147:a685:9125 with SMTP id a92af1059eb24-1ac574556abmr25831860c88.2.1793810873589;
        Wed, 04 Nov 2026 08:47:53 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:52 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:39 +0000
Subject: [PATCH v13 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
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
Message-Id: <20261104-master-v13-7-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=C3ow+chGT1NNdSip5xA3Ydc5tLXGcOB+9coWbmZJeQY=;
 b=0gSOTjAaT57IzIzDs2ys8gXMuFwlQSYBUyrknvzdEMuCtxzuwu4EGZ2k7kNLvFUEfhKoPMpX7
 w7QqxqnrPSgCDIYxCy4duxqgXgLFgE4j4KOPpGEsEqWdkLXATzLOJPl
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

