Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3B241A909
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040514; cv=none; b=VNxJ+ey4uOoJ4X4UH/xOilZie3GqisiB8wGvV3OihFjle/wI9s2eOoll/AetFgQV3GtQVXlhPQdOLS+OIsvy66bo+fTwLkI3ixnXHdlXWedUHM+c606wh7LWk17BCEUxeRf9VE8gJUQaP4/o8hl/fmnFZI0/8rILSMYqOgJmQ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040514; c=relaxed/simple;
	bh=5rxYfB6fEA8QV4OQaA+5imSOiEABtOgJH0KumSHC5aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ip5dZACeNqXQ/XuAHUcKWi+QOS8Ec4w/sObPNDV6BH3OXnlWY2wXawETylXP/SBn7cPR4WoPr2oC3lqjD224LkrvJ4/0pSM1UrgbWLonJUGfmFCin3W7GczsTwkqn8yKnNfORWkpFXYzTDPcAllTfx4JAoYkcRx9C+l7ncODeuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffgphiyd; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffgphiyd"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so631192a91.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040512; x=1787645312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=ffgphiydLPqrMkvk8Ocx6DiIu+lI1/7goj88H6UgB2YOdr40c99aKs+YYM4Jz96h9S
         jq2/DQtbrhaFcyOAQxNLORVNArEAtRuoAF7lMpsfFqm3785kaoMyBrY8W3JxVTynw35F
         HVMxARa5jXZgkXFu1iZ48mBLAMquJNr5mcBcXkAus8CxW4oj5XfEG0Bsz7ecCJmtJzBI
         h0CMJ0IdVO/UfeVozGIbQMQQCcRr8BYwb/tUp9BsDjO4iEJca4z4GANPLq57AfgXTnny
         ZSia6VPVULPEQpySkyAXGCeJ3wgnd0PmChD1TwLPTmO35xt0g7TZyIKMNw7JKC20Prsv
         vqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040512; x=1787645312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPC9kIZPJX9w+966AchnoLlTw6QUfW1S03XH4obRJBg=;
        b=Wwe48CYc7XL4d3hmfNMHhHYBRHlV0aIJsfn35C/A1PXrmhdXL3z9ITPtNorZ9q03We
         PCEpPApb6Pw90k3WOP+ZoD+KjnWivw7UoLt0ffprPuqJIgdFvHKp3PCfd32p+8O9dwnf
         6wOwGn2dy74xaEB0xEqLQK+ARp138qlyuDz1skjGsfDZm6tfQQINcT9DjYM850fAxbsX
         3FmNzlrscUE5BQFUhHKODZfCSJ0jNS+aOSJNiI09CRQKthpBA2xD6OoRJzcXykqbZO21
         2YJcVq2/QAYZ6tYx3dM80FjdJpXQCpl61ClAp8hoQjiUDrED8Y52UKbusUf4bjZs+6Xu
         0eBw==
X-Forwarded-Encrypted: i=1; AHgh+RqNAvWfW+NW2+1K5gOIORUYneEV8NTm6YcNOyYgToxw3s3o34m5PJHZKAWtxYpjD269eXxqogOFmi3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCJE23CLRQ0lDyAmV0PABw4ovE8SZxAbQJSxP/WK1q4suNKLX
	q1DRNr8kBfACJvs1wrOqbWu3V85BxliPZjcgHGEnBhb4RsgNpzupa0SN
X-Gm-Gg: AR+sD13qgnQGvqXrsqBn1FqwgyVSfa3Rr2MXOUly9M6LR/qGeEpaUl9GKTflapESJLy
	iB55uApki7JbWdDyKO97ZnVX2bI+Cy5CGBYml5K4RAPIol6nT7rzDQgee9Y+HASawHjymubAqnz
	Iq4I9Z22e+IfylDagDtopZ26AXKZ/r/HfZGsUSwHFw5N0OrhRThob8d4VURhy0cWATL2mx5+LEX
	rDHij9M7VKOJURW+Kfme8M1bK9uaVS8iNtO+bY8EhA68eVAs0naC0Kn60bCagFx7/X1nDh4EhlD
	RHOGhpfLasO7by+OzKZUQJcbik90EfFG8RfMBkV4wbJjsBEihQOBeRw3O67YQwJL1zRE2zM8BQV
	vH4aH9GIwCycns13+fpL6HtNDeGxKH6w6LzJG8ZZuUb539pCJRSnsTBIAWe6o+2MacHfYpfMUZ3
	N/VouIyw1kNcPatKmLebEqHOX/yDghFrbJJGbcngpHcHmrQB0pz/+NvUy3QnMG3Mko9AI8u2m3R
	yBf6/zHXwc=
X-Received: by 2002:a17:90b:2e42:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3955f1b64b4mr5407158a91.18.1787040512026;
        Tue, 18 Aug 2026 01:08:32 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm22606290eec.4.2026.08.18.01.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:08:31 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue, 18 Aug 2026 08:07:43 +0000
Message-ID: <20260818080754.4362-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818080754.4362-1-sreeshankar0910@gmail.com>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1af73c0ad..3c1ba5168 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -208,6 +208,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

