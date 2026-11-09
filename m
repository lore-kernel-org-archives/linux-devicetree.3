Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201071;
	b=EH8wz/fANVTfxzXTO0fBoNGFRyQVf/e6MlSIz5EOTGwHRYFCXS+h09mOz5QP9bQVNX0v
	 93DbmSxAD6qWusG1AaAiLg49x96P7Uo5NHOHsnIyrGKUldRQbOAzQCZHOh9YBPU0zzWCh
	 GWPqRoSGFBhmAxCvv0HE1++OtMA9w8PdDbDxlHWCfkEPSDE63zHgFfs3wNhjVicu9WnlK
	 43mOb1MkAGl20Jk7XjkG49qDai11TKLeFwo0GCA7ooICIGtzk9cM5wfUZr+ow/t2st7Kw
	 rz+OEj8Nip6z+S3tX3lP8OVzVrd+t3p43WqLcze41hjwLBYZu5XbKqJF/vsiK8vQEig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=PViKVEDNl7eyaV98kB7k3kA6zBpmDGrpBaq9x9jFABc=;
	b=Gd2mTJ4iomeYgw188RX4GjJQZWlFWlH5yhrQi16AULDCXbfWGD+kFYXq8ZbKvnSGMPNo
	 f3aqFDVvw2g6RYfTQoMqbjcoI/j6PWq2xisk7+yAvCqPcOg1y+yBjAUIL0IwEu1LstVXB
	 tMjxg0LPUe2gH85lg3MK4Vacf7OArfOrKdqhnQYkPvt7vDc6eq7DsMbEpbo04EulUwid5
	 HP5i004sA3L41HwSH4Xc3R5dIJC2nQrZ6ZcVu0sWqjZZh8z4eWTT5oFifY2YjTgsvI9vm
	 3lmtjcfhRPh0tT7e2HSaxfJqXndPodqtoBwluGo6DTFXnJwr+PVrXK57CtOLKFEO6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqHlxcIN;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C3606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 05:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqHlxcIN
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e977109392so2289605ad.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 21:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201070; x=1794805870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PViKVEDNl7eyaV98kB7k3kA6zBpmDGrpBaq9x9jFABc=;
        b=fqHlxcINkmdtjaMCmFQsS7nR+jyIsGDImb5ys9PCEhSj55eIwKqocVBOCKV0piOzgq
         0ZOCcKMmR2ra+jVWRMGexlFitOMTQquZFoF8f145FxVnduuqRbMlCH3FgSiCtmI3ycB4
         qyNjJAOO58THn+EhgJXhv3mSH+DCjeF5yHia9AEitVcyx9DBxxPvRNiKdI0koEkMLzvl
         rxFyLZSsJIw+R5lRuvDc7+nCPQwVjIv/6A2xpfouvhumcrMcGmNU35yK46hpS2be0BcN
         dbYO0Z4D5Z03qpln9AjarB1hDOyV+saIP/qiVgQeEvWnDmJL7jpuMk7Il9vRk0oHz3nc
         x07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201070; x=1794805870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PViKVEDNl7eyaV98kB7k3kA6zBpmDGrpBaq9x9jFABc=;
        b=q2rryyM1AeYszDRblLzpezkILFXsnd2nWi8Lgvx/bPbM/M9JNcVt9p5ARdIX0M1Rdu
         Wj+pikcw8xZ/x6n3MRhiQJ8myVe1mvLjU+k46SMbHXD2YXCAy9dLBuC9kjRaYbxq2Ak3
         YmYZtnuet1mltGHuqv/ehejcdABAgf76U2pEER/58fRmZ8pqqhOsKtwWAd7yyUUKTL8r
         FDghZazIhzWIYSGoRe/f+i5GYPrPT0H6AqwGQMrzOWpFdUza+g2AjGscsuKVpCZFLLle
         sLJ36M2nbhg8kw/VnOzvVp3MMXhG6rOz7LcFdHIExO05KFhMWZnLvLAxup0rGecues6c
         ZcOw==
X-Forwarded-Encrypted: i=1; AL+hErELBLswqv7o6ABp0MY8V9o4Kcq3kuZyodamCJO5aOw4ui3tTEaAEgA7WQQNsqi0SkWy80vbQ2ze6J1V@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZZfuMlcNVHnBzv7QcXvW3e2HNP1Lh3p49ZtFYkzlXOrVNmpWt
	cwgljIUuQNhOX8XbJFTHT5CG2fmuHYsnmJY21M2EO7gZUrl4OzQnKzyI
X-Gm-Gg: AYBFou0ngyYbMfJoLPkj1izDdOU4+2ueCaNAgxyKdL2yRoty/dX5XfyqfHmWrPdDNft
	5WL1BeSgiyNS727DDAlaScq8VME6UTlxv0ZP7YBuyzewux+pz1iK8hE2FB/p9AV2T8NBheq4R1f
	zwN4E4rOUCU4BojiWLCwep7S8IDsoKj9RKZ5xHvOY/yE/TA9VaNMkhovH8udGPSefmMymeDlrwo
	jj83bxfDRZQzjNdgpBMF+JphM1pB0U8ezsSymMdAlMzZRYFCmCAjnawPnnIEZZiBLFpAnmAZn6e
	bm12PMvu9k8jQF98f0onM0AomxFPBhK6srSTW2dWI4rcESp67xh3uMlEttIEjM/MqWhIZt1yG+J
	XX5y9QlS6Q87oA0aXcgiPRCXNrISbM8qSUQamWYLDG0rU/H9nRmo/OTIyijQUavGGRNkY7Q5yoF
	QptI14pNW3Riya3EXgMmv0Qj5sL1QvO7NWw4IWxsTQTPFT0Z56as+BbOmEVp8031+UaOaj/R/pF
	elb6/HJ2ao3vIm+0NMo9y7+Jmc8mEHcx8gx9Yoks0JR6vLX17hugHiiUDXW+D8W1nuwEHF/Pjvq
	JoCnLjYbpKUWtBVhMrx8xAYlS6fdwfF87geKbMj/3ew470m4K5zosqRJSWfvZdY7yCOasqxr+lJ
	ou0NfZRkguXOzbGahPHdqXNHwyIuOnu8DaBiodERnvd3QlhuqHngiyI7gVA==
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr2878398a91.23.1794201070121;
        Sun, 08 Nov 2026 21:11:10 -0800 (PST)
Received: from donnager-debian.. ([180.150.112.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b12790befasm5247652a91.13.2026.11.08.21.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:11:09 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: aplic: Add Tenstorrent Atlantis compatible
Date: Mon,  9 Nov 2026 15:40:41 +1030
Message-ID: <20261109051050.105623-2-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109051050.105623-1-joel@jms.id.au>
References: <20261109051050.105623-1-joel@jms.id.au>
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

Add compatible for APLIC in Tenstorrent Atlantis SoC.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: No changes, pick up review tag
---
 .../devicetree/bindings/interrupt-controller/riscv,aplic.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d2..d4e17861eda4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -29,6 +29,7 @@ properties:
       - enum:
           - qemu,aplic
           - spacemit,k3-aplic
+          - tenstorrent,atlantis-aplic
       - const: riscv,aplic
 
   reg:
-- 
2.47.3

