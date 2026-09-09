Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA234F279
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952536; cv=none; b=ZTBiq2mAhFeeyVrZMITGZdM7onHKVIDrgFMRXvSnPfE09862tBgnFYFp2rS4Kvc1P6b5FIBppFZPstK49tn5Vgh3zV/DM8bdYWU/lcDwIKlOMoR2hUK9CJB3PIw2ZhBEegjjBBqXyz8Ul4phWCF6aHUi5JNqBTV2Ok/HzkhPzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952536; c=relaxed/simple;
	bh=uVNjEhcmJxmHp6RqLYrc3iN/5IyVXam0z2MWu7BCeDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKt8NUtDmA1mR98xfdg9f1HXYMwdzjda0eJK0M4Aq/oh9DybgO5EG7J6suUKHoNjyyhGxSqY/MukG38rla2nahk0hStiot0jFZhTe/w9d5h0YyOS1sy36OODxaikc/FxdyHts8BrswUjPckirg+Bm3EJnpy3fmUv76Wwl2JykOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=WuddutOd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="WuddutOd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso7101715e9.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788952533; x=1789557333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Scgv0vHJBXk9pG69/1ia9GBy2rYMOWLIZAy7/tcKrdQ=;
        b=WuddutOdQre1zL9EXRkGMSMpOXDeCAQK13ZlZwzwiCgIE9vL1OtGnniRao3wz1T0PC
         qruHVYQvjk6ywfF5bkmHoURdKKMmCi3YNMJAQvL/c9J/jK+CPx6jqlN9Xp0VqBJE2e1b
         iEJeFz61mJ+kYmEdK7sziDbcdpz+cJHlWjMNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952533; x=1789557333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Scgv0vHJBXk9pG69/1ia9GBy2rYMOWLIZAy7/tcKrdQ=;
        b=NJDSBS3stigLWv85o5vfZXgOkmdZcjChbDfso4aoC5Io5YmQGH/jCCc4KBqrnxqgSu
         cCR5shFTNJAd6Xy2hLA18SQDObkmaRIhNZ1sDNMfy0vpVZtJdr5Q+3TOc/3nUpmInf+t
         NspFaB0OFerUUF8AH+U91IPO7FAUJRHYjMQ9xgUBMiJFo0ZMT9Jvx+XGEOqwqwZip05e
         W9F8Tr9u2IZfiE/KMOtAJnobcz7tdh1ZwwGknMOC7JjTw7PYtP4reoAuM2RU/LmhlyD6
         z2IInllSoHOG6xs07fdfOt9tupmAa4VX060oYCDSeKtw5U6Emwh93Ub1AV0Wd+BOn7yQ
         1rHw==
X-Gm-Message-State: AFuF++mWM1Lbz9tgGZuPQXKbpD8kRfHIOyseBQdDiiD59RlomDRKkHF9
	DYHlmsjp+TeaTPuTsPAO851HqV2qbrBywvoHkfhNQKGwUJO0wsSTDhM/hivHdLGs6dc=
X-Gm-Gg: AYBFou3iIGMs0M4pbLAqwrRm1JTL61TPgqAxOK2r4oQ8Cw/Tc3wfTDh2B4C1lFGGNDT
	MDEJ3OeaM6geWq1o9a4fy5V8PPtm7oBYfD/sOQD+sblhDeIoy5wEMYzBhReJ6vRysO6Qo0xyHDe
	v/XhW97o8aKqbTU7myASH3A3TTTCcAJZFryK8LycHaazpVF3eJGTz4TpA16SWF0tanLrxKsvIaD
	F3kxWtv92TRCZ+ufb8a7B9Vpnv+7tMN2+/+xbrua1e1mBBEdkO7s2G15Wz0VdhOoamRxPOSFHqS
	9lCPJo4CrJrnidCzmIEnIhvzdOoRP0DSzRc+c5Qsa5qIHU7jPEKT0yNl3QtWlfFNeyLCRy90+oc
	7xW1sJkErF/lR86uCjq7dZDWFoLqIOBMiBli4UEM+oEdFDzFUCrD/gSpyepg1pHIZQ4NGDWfQjI
	V1v5aNcIAWHLS8WFPnR3TM/nF4XjhFrWM5raAxX8AB+fwum9hp/AqCIKldokXBeKy091dJ7dVBJ
	xE2nbuvHIDKitHI
X-Received: by 2002:a05:600c:8b12:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49d17572958mr124380695e9.10.1788952532046;
        Wed, 09 Sep 2026 04:15:32 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm107391915e9.4.2026.09.09.04.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:15:31 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 1/3] Add Draeger AG as a vendor
Date: Wed,  9 Sep 2026 14:15:09 +0300
Message-ID: <20260909111513.2259643-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909111513.2259643-1-petko.manolov@konsulko.com>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

