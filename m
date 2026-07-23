Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6BD2E2DFB
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784769879; cv=none; b=Ird0hkwEzOZWFHoUiyFviMcxKYDBOmo4ChHYTCeNNkth+MhPi5jIBX48scH6VhmStxkYt+Gx8uEy8RYgXOtRJcUDDWJ+3lowyrLUGr7yMfFOHOJCGgBHXANe0qzOKeQNIHXyRApgcx9pCTu02sFwGfrMIihECYZxxD2rFf8RtRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784769879; c=relaxed/simple;
	bh=JiTUnp6GkB6B+bmJP65I25onDMOLDPZ/wDqK0J06aA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha/tsk3rDDLeMuiYCbWEdjx2UgHBPqvFhmKgw/JnYkTaw8lcaDzttV0VWTt9f2voWjlnL2w5ihYU5s9c4IKXVq1roY0kWazUSond9tjz6rCWXgQ7/uWtJJYf9KnUP/Se3Id22itPoM0dfzAeMvqpVpMlcebYWlbIm/tu5A6hnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3XBK/gu; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3XBK/gu"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6682259cb3dso66033d50.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784769877; x=1785374677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=G3XBK/guPJgEnSaijfT/qXmS4/edUHcgA4JLAYBeO6tC3NEoSbY+fJiR0JENkLOBAT
         zerDgH1pToG+SKstXoQmWZtk2iYjkX8hDKeo5df/M9gYSiBQ5Et1x8PkUNtK+hTPbLnk
         WCM543GK1gqWCJNuW1BHQUtwOUruAvrfl/wNeMlI4mTfZpvtZ/R7GER/Q1asmBLFMO8s
         ifnqB7s016EyjbZA/k8fxL+TTQO0rLKNzetm7ilXqdG5KVVMDvWwSD89I5hJIK1VRU1R
         kqBzvXNWpNJP+5Om3HmCtJ4X201Ass/9KqDuUlcHUAnX8bAC4o1E5vL2C2urdaDBOjb8
         KqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784769877; x=1785374677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=WWdzM/nFOrT1dDw8BJ6FqtJ+xqROHKe2dAhkrmix7qY+7DFi4nTf8998VKsuyzpJu7
         33iw40bTthZ2eZ0Ckn1l8A21ZYSpaD9/wB5SSTB/Kl55KPFRMsapFrMN3YAg0MsKRtzo
         EJ5G70V9MXaPEOkOxrHy9bbCoBgS/HazCxI/AWrA7uOgrD6WmfjDeXR9qrCZtSd8CiYG
         yWlljmahLPQAvTwe5Rt2ffPcGO/1kil+u95lfTqF9y7SxbEOX2bVoVQ9hhXOrI4pi0Yn
         5Ot6Xh7o0IHXBOunb4VzUBGQgfkUuZqqw38YZW5n6SCUUJRA19VkAhWFzIQDK8x4fRAY
         UAWw==
X-Forwarded-Encrypted: i=1; AHgh+RrjSedELvj23HPb/JOH75TAMgTumsomblwe12SFDAEhvGdkM7fEGUSL2bCn2X1H+a+iQ1Wcd0w+2q2O@vger.kernel.org
X-Gm-Message-State: AOJu0YxQbxwAKuTLB2WDjdy36n1EujrxiDm9nKHhLyr1OW6vkkl6zU6q
	2d1B7s3OwL/9REfbfsa0R5Jf8VamXR1Um0fRrxYI2VrhPy/9dqqfXEg3
X-Gm-Gg: AR+sD10fKnCT0vNK/zZwlqiQ9UvR/C9U0ptGvtnOo6VxLZh9LTD2RPhmDHtEbiSABw/
	5mmTVz9VYNCZt8o3bWI5E4q7XfghRE65pz852VZ6l9pfXdQykJTvcq5JY+rWT1Wt3mLXIq6FsHn
	otW8I/bLFybxGKtfzePrJ+vn0VyV3NFlP+Cv+Z/Hfss/aSYDtgCvluNRK/B26/AEs0QCR/a6zSI
	PrmbfOlYrFBjrplkUY12g6kXcoL5S9K+Af9A09shxP1OZsQN8O2bhFe7a0AHlRHI2+Y992/S5Fk
	rxzlNiLQ/HuXGOmYOnd3MU7jiuiKfdBXtK9RvHdqmENVFgf5geEQIG42LJl+Lc+QTU2BzUotIym
	Gc//PoS5yz4GngV3B2cBkTtfL6O80JFPh9pRH3jg9t7Rcjdn9tlGbOgwsq4h+hupVasQNAhS5v7
	djzEIwmsCBVzefHpDH+X+hkZdndU9D
X-Received: by 2002:a05:690e:438e:b0:668:99f0:9359 with SMTP id 956f58d0204a3-668a61a87camr118123d50.33.1784769877479;
        Wed, 22 Jul 2026 18:24:37 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66890521188sm2310775d50.1.2026.07.22.18.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:24:36 -0700 (PDT)
From: Aneesh Pradhan <aneeshpradhan2004@gmail.com>
X-Google-Original-From: Aneesh Pradhan <aneeshpradhan@acm.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Catherine Frederick <serenity@floorchan.org>,
	linux-clk@vger.kernel.org,
	Aneesh Pradhan <aneeshpradhan@acm.org>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:24:29 -0700
Message-ID: <20260723012431.48499-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723012431.48499-1-aneeshpradhan@acm.org>
References: <20260723012415.48288-1-aneeshpradhan@acm.org>
 <20260723012431.48499-1-aneeshpradhan@acm.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Catherine Frederick (coolguy)" <serenity@floorchan.org>

Document the Motorola Moto E4 (perry) board compatible for MSM8917 and
MSM8920, and add qcom,msm8920 to the SoC compatible list.

Signed-off-by: Catherine Frederick (coolguy) <serenity@floorchan.org>
[aneesh: split bindings into their own patch; add msm8920 SoC enum]
Signed-off-by: Aneesh Pradhan <aneeshpradhan@acm.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f8c37096df46..5556f81c0af5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -261,11 +261,17 @@ properties:
 
       - items:
           - enum:
+              - motorola,perry
               - xiaomi,riva
               - xiaomi,rolex
               - xiaomi,tiare
           - const: qcom,msm8917
 
+      - items:
+          - enum:
+              - motorola,perry
+          - const: qcom,msm8920
+
       - items:
           - enum:
               - wingtech,wt82918hd
@@ -1323,6 +1329,7 @@ allOf:
               - qcom,apq8094
               - qcom,apq8096
               - qcom,msm8917
+              - qcom,msm8920
               - qcom,msm8937
               - qcom,msm8939
               - qcom,msm8953
-- 
2.53.0

