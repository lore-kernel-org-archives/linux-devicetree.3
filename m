Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C7830D41B
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784771194; cv=none; b=AQjdLQD9ZegzNYu+z+uIyKa1rJSjghtyHVIxkZZPeGZdbdGg5Yk4AyPZEacYqGoveQAVHvZb6m+WzVOUB9uqRzZ8moPpH1WdGtfWeAN8YsVwPVDp1BGAaFGA+Oy4owuLS+DZelQ4+ktLFCNVSlvUcQ/lwMDh+zS+uAv3rNgLwQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784771194; c=relaxed/simple;
	bh=JiTUnp6GkB6B+bmJP65I25onDMOLDPZ/wDqK0J06aA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hIz/B5jpiyWzAGYpbziMDLtZ+57H5eyDFt4gZ5xOUyBmiEcrD9o/YXyktRTaB9FCwrXntZmU1urHdyvqtgShMr5ubvN84AlLZuj+FERnm15Vbdh5P4Wa7fgevpKmv5ezgvazp/A56QVaBzofqCcKLv2WM1Y5RjiZnglq8hp9GBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRo32JZl; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRo32JZl"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7dbcb505578so1291017b3.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 18:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784771192; x=1785375992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=TRo32JZlPBZV1yp0FU4HkdjtSusiiGpweMfVWdRgc48yHxyLJwt8W5iBg96Bed5dUw
         Nwjg10q2FlvNBauBZRt6X4HUARFDpVWvENJ5fNIc7GdDGfFA4ZeXORNLfMPoTBLXNKjV
         RzUYitrzUXnHGrdBJI6FCWB0MM8W4ELynBKw32ppwoeQXzZVbSaY6NxmNjfqwaeT7+Tr
         O9G9AEHVZcfD/NQf17boourJEMUw2P19PaMzQt2VH3y0nFOaJXy6nH6JxTvRzVbbtf6z
         EMeMoV0f9+9rOzYH16SSdO9kXJY8kV0Q2BNSk4YnrGbGEnxD+KaGbQ/xut0UE8gwn7kG
         Mefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771192; x=1785375992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kyx8fnMYpU13qyrRjwi9Ec2VpF+qFTk63QV3HyVJPgE=;
        b=piTW1uia5HL6b2jb4Vo4JBZ/urbM1NfE5en9KdFwtkNzEWbh2MLjTi8ycALCVnxvvB
         t9dwvhG5hdvTg4vINbRoEwrZh6+ypkwPi8TVb/hKYfeBw7R9H2Gl9NNhjlg4/J9t5fed
         PrrvUtikt9wYKa1OXOkeDrRUqqq5ou5L7HjxhOs/kmbm3S7GigB2pj0amrJ8OAVi9bla
         huHyUdRQhpfSJIXUHIVBdrD37//CyXc7Q2Y23QG8q6I8N3M/UMnSxoK8ybCUgxLbzt8+
         WUZw+KFLcCxETHKiPlS26SX0iEOWYPD+UhXWR9VGDNFnO9fGCU1PE4gqAkM82XlXl80J
         U5gQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBfoE9sBmultqbpJzX+uLIQGpv6XFInbQDwalW5PwxQAz+VI06f0kUzVF6jaQXY5qYsl4MUBK9OkRv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7BCdiQBwUQFw2rBs/z03f+JqzKqFAzjzCz6tTYql9azeiLrk
	mJnPlDrKNGgr0EGk51vGhpa36gt1Xa2fB6hy50gyHkfrhApWlWUCQOwL
X-Gm-Gg: AR+sD13VyJJUWp6Ds9POt4awl3jy3WSmcekS620T8u2VNG41gEX48HgZewTtqzOfmMk
	k7bl15gZ1k1ZC2nOSDScegTZQU0I8nN40AUzJlhH3Y3CT4OvaDpJFAoDOgKOvAiTxtFc42Vxuwk
	HZ//yZQnRKcke5jB0HLuy5eYyLjfWWoVa27KgSdoLUlg7RfZE6D4+IUW8Ei63GZUaucFYqwZTxt
	IvpC9SB+T2VO3l1UaoLfPv+d186P4U2AKjnsgGCPxuk2V+HuwZ8XDBmasLYbJq/KGiexUZMHAPf
	WistPpdiBX4yBazXHB8UiWAIBUiqXnRKs33lt4h7h1Fbn4ngWe3DwpFC8xScIvfJFviowSrFau/
	hLNaIbVmfWiGxplTZn2m4W+Ianlv/U94v7iz6mKP5BMYouHAp/g5eclzGPR7y+s2cd6bOMDT+jz
	yRJznDr55Bju6CyfkwD79DruXSSnid
X-Received: by 2002:a05:690c:ed0:b0:812:996f:176f with SMTP id 00721157ae682-81f4c140ba3mr3175837b3.11.1784771191941;
        Wed, 22 Jul 2026 18:46:31 -0700 (PDT)
Received: from karli.attlocal.net ([2600:1700:7270:4eb0::19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f33bf2e50sm22038487b3.10.2026.07.22.18.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 18:46:31 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add MSM8920 and Motorola Moto E4 (perry)
Date: Wed, 22 Jul 2026 18:46:25 -0700
Message-ID: <20260723014627.63310-2-aneeshpradhan@acm.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723014627.63310-1-aneeshpradhan@acm.org>
References: <20260723012431.48499-1-aneeshpradhan@acm.org>
 <20260723014627.63310-1-aneeshpradhan@acm.org>
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

