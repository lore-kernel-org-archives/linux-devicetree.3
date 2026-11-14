Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621969;
	b=Q4lq/48crw2HxJH3g50zTLjFNGEHAW0RCHa2nT1MWEEEM9ZPW7n7Vq8+urrMOqFr3Qhs
	 8VmRq13Df1bklTH/SX+A+H8X3N+TVIKMh5IFvJy9ie7EzWo7sEirV0kdScDVA0qmcr3tf
	 OPlnMWWd4PPN7G0UWWDEVZes6DFuPRtUviuqDZKCb5/Pvdxx+wSFXN18NsYXyAaDlQs6y
	 MwQOaSdZgPcdnihdOsYZmdmPtXiX23mLWbGEKl5Je60+oDMxNyAukjhJiIYh30TUBlUnF
	 6Pj21fIrwoh15fy7O5CpRZYvbWafVJ1KNTZsR855CoArGhsDE3z6ymCclq4OOOOR0xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
	b=AdXoNf7LzJ0XxzDHP8cXES7Wld9gOpQVwHwLwvtovwadKVypeD0XG83ZfxUEaXybrlEo
	 1shtAD/p6VkfeCyUmaFjCdGgZs9KZNcjiWjyt2WKEVlSaFCe+YfpIW+8qP6steg46F46Q
	 /rHUms1axkphZ3i1fxqN4/zA48Bcvq1RVGo9KBltpatIGbLTbwsLNXXq2SmkZn5rOq492
	 EasFWPnEzWx0xJmTUXoJHE3oY8nkpUxJnEqocgUKUFFqa2f8MT3kFqqLzLQJJix18gLaQ
	 4BivV7/zosE9j+gV/iPTqpEnsxPWBxnqbZ31U0pIwszbaPGRXIDIZoFGMqFoGBM867A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TAyfUtT;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B9606A330
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359B9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TAyfUtT
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4d198f1a591so2099503b6e.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794621968; x=1795226768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=0TAyfUtThdvqH6Ea5+y8CqCzygO9MSky6knt5TN60Nbo10Q/ilCBpjX6dhsnBSgAkM
         G/wWoT8aCcFk8drGhMjc4gRFT/UJocS659rVt/n08QdmZFGQW3EbfRdhf12BPTWT9tB1
         2ebW7/Sq5JGQpR2+tiZYSLuwYdyz4JvNwg4X7e1pZI2OoexRM+CaGd1dBl69LZpkjA0z
         tmmeu9wncADkaaW8Y/fQq6s/xoRTyEVF4ky6OO+X+HFQJX4HF6ZnQUsQSyMw4KxitfC9
         0XSLU2hyQU145m1Mf7zTMIVYhYr38zLWxFymQMwUfu0HRmWQ4pcyEu0OTXPHkMVYkJuo
         yApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621968; x=1795226768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=wAr0duDjhyefSL6DIxu8VwCqJw+oxMyPBQt3A/jdCtpWAt/DnH2zmWe24xivBA1CIT
         BZlHC1FKjpyDX90hJ5d3ned0RR4iNiL/u//XfXZqRm89njs/mAaE3HPNsS4w0jUaYWgr
         c5AgE2qTBDjbu1FkM/+WDAkaCJkRpl4tikPOEnfTNH/WmA5I+IHH2bA9IIhvR540Yo6B
         bZjzsWJ9CFH2DklH6uNDpTAg1Ed374VGiygdqRkxSogDeyomtBDyrUheG/JurcNlqvV3
         ilnF2CPIUXzQUA74A7hYrgD54KohWSsF3F9k6rfNEkk1HtnajPWJr1PNtmFo8MUERyG4
         DG+A==
X-Forwarded-Encrypted: i=1; AL+hErGnIk3mfb/Wbz0qew+Jq7L1JMXtWHNb2YD/O3IaGASxSZxwU7ac40hjgFmjZYqczA6eNQfpiLV3aict@vger.kernel.org
X-Gm-Message-State: APuU4Z/E12ZErN013xFS2zcnnC2T1JY27NkNZw6U0if2qMLoXGXkYaIQ
	K1NpWxyIxFhWv8/dpdfdyGMWFnM6eiNiOSJxggNFdp6nCr/ls0WIuw2N
X-Gm-Gg: AYBFou2C0WAHzTjabi2gKcYaNvNSnrn/XNjaRvuDReJBZnEpCvj3FSIedCOR+BBYw3O
	ZyZ9O6ruu/GaCcOzl3gc0N+icffUwY2yoHfsbLdG6bvB5T0sN43I/V/S3JSpjQK5PL2svzoBdeG
	7sXz9wyjeOz947eEC3lldWEwO2QFlcoxEiN+BnVpRBPJj7xJdD8W5Z3AZBJmjbc6XrSyKkfynCZ
	8vf2f/RoiuwoXJtZEtGemI4FZVFD01VwtrDaMJvzU6qZrEJzfZ6xL21UdJgcqivHne/kPVvUrN+
	onDxtjzMWCe5zTT3Mfr6WzD5IycmGQw7UOuNVibxX/dSJ8pabjXjqN9wqEKHYMrL5LXRZuEaFOT
	yXRTP8mKRZj/t3O8OOEZjLhDgspoU0FUazqsyHTM9AoafKW13OAovRXmJS5FDgeeEPiGAC46KpC
	1QmMHJ258R3rd2vElu2JgEd9LDZP2KtONFT2bMiKb5XhrcedsA8JQF18AnqtUP8ss2Ngw9WKiWA
	QP5FrRyLl1pUr+RrUFHmFdpzUqcjuazc+wcJqTk2LtxQ/jGumpoLkeyxgWsDG6Xv7PB9J2LjcRW
	Z1qbTW5V8pdnFFxzcU7NROm2cewe/uNVzaaXDqWeCrh4GtdOMLGG9Q==
X-Received: by 2002:a05:6808:2220:b0:567:e9b5:37b6 with SMTP id 5614622812f47-56e64f005fcmr3240210b6e.41.1794621968203;
        Fri, 13 Nov 2026 18:06:08 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3f179sm3385433b6e.6.2026.11.13.18.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:06:07 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 13 Nov 2026 20:05:07 -0600
Message-ID: <20261114020509.632311-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114020509.632311-1-jeff.roach0@gmail.com>
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f6998..c3b6014ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -212,6 +212,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
               - qcom,mahua-qcb
-- 
2.55.0

