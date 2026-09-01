Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0212141A503
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246527; cv=none; b=CDrlqr40S/00o6LBYQVxoyS4XR1L2KT1qkPMK3bwPdRGTd53lXUYpVHMgHuGBERuybJmrIQ1KbKKCkP5n2RlNFH2WgFgj0iojwzMfh1LxD39AnppZVwC+rMTn+T9LBhPVEr/T3oZf69zUV07sTVOfNUxroqoZt8JTpEuHzwUTKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246527; c=relaxed/simple;
	bh=SL1wdM6vp1VIszL+xuNFr+53xhHZT8pJnJOiXD1KxBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+eRMbZ6vVGs/d8nzWAmmtU5BcdpRSBX/MaIvTkFCty4dtGBmI58O2kKT1/0UvMnRmha6Eym4/8Kngqxpb3bDXnleQRsVhhOP8higcql1FfaIdrwj0lbhZMIPfzFxNCLvFCKssgB0O5DfeMkCl41y8mRlxv2Ix+pehY1HZ5x/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vx/tFVbV; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vx/tFVbV"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so3940523a91.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246523; x=1788851323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=Vx/tFVbVtyQTXX4xTjkq6HUapejWaPA7Ja/er7YiR6H7amuVUE/iEWmiOqKQKm07r/
         +srD2+jyYToMxjz+mhvtgve9ocOPf//4yJuxghpoBwNMff6Cn+6jsieNJy7hSwAUM+l8
         VkiOvi14mmQHSXyUi+ftQY/8qZybDNa5iWXbxHkFh/vZ5C1kyFKgmqC3RsNvh9m/tr7m
         mRodkE6KKXMd7UhiSZxxXa0TlEJ6tSdWkBLXWdl0x7a57eUfUkc6HUJ5/e6S31Ba8hf3
         11/YJzRn6V494AlHKYJclLDRYp2a+XXPbSFGFc5A6HNqjASdTff9JGq6eCDDfzfjjFJ3
         KO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246523; x=1788851323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RKT3VAzrTBQCbJUoz7WVF1Zm7cw9xcizV7Y1JN603Bc=;
        b=l1XrIFD0SGQg9CyjGIyIrWzNBqXdDkQRxnS5AQgbek8kHxkCh++rS9ef5Fws//6P/J
         o7Sy+DIpevqftkwlFMgbAxheOXm+za2CcsJVsXh2cg4+DPcCgp8mIe0WpaTEqVlLEn2G
         noAPKP0VvorRz5ysTdbQx/qtaCaQTTZeeXt6QdbVFLGmtAOkb5OUsY26I7HKR2eXFnS8
         JwZOL0pfVK5Bi9j0rqrQ51KhMH0ZzkH9amxDBB4xhCIBVk5BHVi+WnHd9NN3bLdx0X2w
         70j0w+LRXSQpHXrRTAsTQ/mIgOy9Bv3IqXiiHPsRpjpzoXslje/CydQYJ0KFrzAbqDtc
         p13g==
X-Forwarded-Encrypted: i=1; AKwUvBycFoK4uQPkSylpze2b9zDAVAubp1ZotMGBB7WFS5xFrzaPe0dILTTDLKS6cc27nRq9RNMowjQG2ivG@vger.kernel.org
X-Gm-Message-State: AFuF++lXqFL6GidDDW1h3YE0okeG2a/Edphp3Dbg8LDDKFo30oMs3IG6
	6nCEX0El0e/UqI/x+30sIeM8dfzJJAzFfuf0vQkgt0YRI9NF1OgAz5k/
X-Gm-Gg: AYBFou1Z56fA2oA/FNL4OvB1ENZRex0w82HoP5y457cFCG5WB2lUjS07B6TvJzt9H7b
	WKEhhHygPcLlBfpCnQ9H6UfaikbbtdeYQXUrm6CWCZGYGEs42Idm0KI2R+KJCFX2CKBS/77DCTK
	+avXCwXpQIvOjaYDlUwunqnjD7KARq7T52IEXajnqhirpvBBmtjkLAVMbU3MYW8U5i2AyRItW3u
	iBTgBmAZSePQeWV2yw7r9xz02xEO7eAyIa34cYtu4tatga0l5QnDJ95cD3hmof8iHymksDt5Cvl
	ddWLPd7TLongPHEv/hoNzmU4a5Y+vZ/GnpsNMnmT6CWdfZ7JAXXSuoIEGQPPAYZDFjY665y9X29
	tow8Efxwn2wzmUKPFcWcH94ecUd3Ed+zW/XzCAZFWoHWjnwM+CHEVer0hXhZokhTx7HBwIgsd3w
	C72lI4feOZ71s+43hQKNw6Il4H6yhd6oNvDjaoW6pkbNmEI6l3TPWOQtM+KqKVrGIHIolwYOP8y
	KoQspK1ZqR+
X-Received: by 2002:a17:90b:3b41:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39907cd4e1dmr7683960a91.6.1788246522641;
        Tue, 01 Sep 2026 00:08:42 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:08:41 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 07/12] dt-bindings: power: qcom,rpmhpd: Document RPMh power domain for SM7250
Date: Tue,  1 Sep 2026 07:07:12 +0000
Message-ID: <20260901070717.20513-8-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the RPMh power domain for SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55..e08441915 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -63,6 +63,7 @@ properties:
           - qcom,sm6350-rpmhpd
           - qcom,sm6375-rpmpd
           - qcom,sm7150-rpmhpd
+          - qcom,sm7250-rpmhpd
           - qcom,sm8150-rpmhpd
           - qcom,sm8250-rpmhpd
           - qcom,sm8350-rpmhpd
-- 
2.43.0

