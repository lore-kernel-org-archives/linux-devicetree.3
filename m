Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997171;
	b=QMAypbLWT/Ead3i6uH1eeXmdMXqHy8z8fS3X91ShhfuRMsljKqQxy7czv/hyeX32QLpY
	 nlu1rIiakXNcgvvIhRBs9wY9D1vlPs41d/7e/rh2lixQusw2CnGPv/i0uD64z0R0UMMAZ
	 S76nMUM9IAPIogsKUrK6oHqjkXbHofYPAOF9RlI+Va7eROl6R1jkazI9yVb/zh9Xiexl/
	 y0/r0qN0XH5OxKN/DEeLhPo6WyIKsBxwVtNAYqDQ/rzuWzLq4rTb8rvyrY8ksMPK9xJ73
	 W9e/qmyENpaIz9NfrJWSBqvb7qmroAIj5m7blzkHBV2xEJVOKgO8QaLwO6D21IOiu/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
	b=Kwccvgw+m5DASh7s3Aw1v0+ZyJQRJuD0EmPZ/aNfPJNazCEov+rYGg68gJP5NRbnGbev
	 v6lnwTWIAXMeP6yBEorsktt/P5DDMeRX47dOu7SzCoS6iK8PhElRo31KFu+zD0at4m3OP
	 jxvUpIGnY4YR8TGnhGDPBwRCJ2Da+vY1mIOFxvv/TIJ4bxCrlF5di32wOk/D14jDaOUBk
	 YzTjGixKM2G7rmP8aTp40vxdkvU5kZODzKK3fA2ak6sidupt0BXi6+TxgdXTsxcqLeIhj
	 D7RpJX5MPZqpzekZUVtSTB4z4RlXNmp6mRDg4oHHO8TIAosf45574Xm6cVTqSvUoUAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpwZlnO9;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41A8606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitamishra.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fpwZlnO9
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so675546b3a.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794997170; x=1795601970; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
        b=fpwZlnO9jilQtLL4DAJCq7YOqNOZGys57uTa9iQ0e/cUCnxXIZPnpxhkYZQnDF/xVh
         7jQP4Fx3SpGgaxZ6nJMImICk4dfSLjcCl4Ve6eP0joRCfJN8eKX5iutyFFrH2rNkgLkr
         V/aWw9RRz7VWisDY+TUexJS9Di7UGVrdg+ELsm8vXQCviDj/SuMqROi+MWx74ynjHyCq
         ass1xoaurR7D/35+e1grHqtmcuI7Cb7N4Tu+fmgndjjm0RMnIJyJ+I1al4ilcgDrnjgq
         FDFu5KOfqfNAx1/jtsIztYwHwYSnSykqar/YutAR6DUR5OEzVBL3/os23ezQvFXxZkud
         Auww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997170; x=1795601970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
        b=nLHBI9Sv6cnZjB+ZGaVfhcJsv5ImX1mswifSuMcR7s9QrqLwesJd7rxkiSvBW6DpAS
         MeauHEHbV+I61UoJKPGpSqfhg77SZoYyYy1fgoL+TWwk/1Sy5HwZMy2psW8w8v20L4cy
         x5MkccaqMGVRP/0X5HN8ElTl6ZALxPeYy7Z3DMS/xvAPpY9rpINPej+G1hat3ubkBjE9
         2Os3pFfGhmO+3K3+J2rCFNGjWdeJ69MvI+HedDz1dsZYp+lw87PNoqVI9vNhqYQ/iNxR
         7lvmtArwOD3TYXLMc7uFxKLiAzYd/ToqX64a2jwuTQmQ0PeOs6juwC7r7zMP68IbfdDx
         IzBw==
X-Forwarded-Encrypted: i=1; AL+hErFQghAe5ZjvWp1MEchB6VFoRuyotwDUrCwsGrqV77RpAQzkllHO7MbUp4zhuCcNwWxQO95PfrtAUD6m@vger.kernel.org
X-Gm-Message-State: APuU4Z8RIhLGjxcJ914/TZ/iwMjQHlZLL+8g2i2i1xQ/VIGEEBLBpFLO
	H5fCpQIkSS95+3fAXNaT33/FCnAyUcaiBGTQlFV/0XTyQBKPOj7FWLAiVGYn3PxOfYSf58NnQ/K
	IBph1aq4J9Yevc9snUuJyGKsQ5A==
X-Received: from pgbd17-n1.prod.google.com ([2002:a05:6a02:64d1:10b0:cdb:596a:2134])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6372:a748:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3fe8adfdd60mr1941662637.51.1794997169891;
 Wed, 18 Nov 2026 02:19:29 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:12 +0000
In-Reply-To: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118101913.3135869-2-amitamishra@google.com>
Subject: [PATCH 1/2] dt-bindings: perf: arm,smmu-v3-pmcg: Allow power-domains
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amitamishra@google.com
Content-Type: text/plain; charset="UTF-8"

On some SoCs, SMMUv3 Performance Monitor Counter Groups (PMCGs) reside
in switchable power domains rather than an always-on domain.

Document the optional power-domains property so that runtime power
management can manage the PMCG power state.

Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
index a4b53a6a1ebf..aea6623bb98c 100644
--- a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
+++ b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
@@ -36,6 +36,9 @@ properties:
 
   msi-parent: true
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.56.1.703.gf848ed807c-goog

