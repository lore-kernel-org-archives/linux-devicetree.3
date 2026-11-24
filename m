Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508567;
	b=lX9/NMY4Pkk/PNFkW8WbFAqGIMCFjO6mJZbuP/84v+eof0SratajzkPRQQJJk0sbgyz6
	 cNbf29zLEGVlXND+8LYZwR0wfkRELpWxoHYcg6Sq6+SpPsq21M2xyaWoBEOeqRbmwMQ6Z
	 muQTuArsYqIWESrwUKcUnSUAuDfXyjkFuov8RP/frrTyUqRK96jpHvLaTkgoBZWDRaoaR
	 JBmh9ESiQN90iyVPzhNpOEc78kg8P1rTIB+UyIG2oC0epnNIGB38u9QTtButgcPAR2ZbT
	 vWEfwCzmUDHMLkhZfvjx2LXX00lHnLolW94UtWtrXrqgUKUd+Csim7OHIYEt2lTFSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
	b=DactDwDGKqqTznh3Fa0Ovn8ZWE2jePvVEeyr/cuBjPT4m5/gk8iqL72jMXywUTaRA0y7
	 lZnhmyIxHNCzipylRaE9/YjuS2MeqTYhKhvYir73qdfczD1cI0CBadmXNP+XsFZodsuzw
	 8KkWDqX+vB39DLrVsmNDIMhUb95ZqmjfTvj/JvwvoCZxpqkJKkwTfl1xGuOzThBLHqLRK
	 tCAHY/+wzTtb+NOOXUm1DgpYEt84SwjI779IYJdep/RbCOebHtI09Zsi3f5u5AbfLZg5u
	 a3DJRj8Rf90uB/WDBV4QrW88bJYfsKOBsYMAc63FOjt2KZKcvsCPQKRunfHLh44VZeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkXuyC4+;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A700606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A700606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkXuyC4+
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so5760906e87.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795508565; x=1796113365; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
        b=zkXuyC4+mi0RVbuDiKRWE7S/6//F7Y1g8YtJOfu/xreqveajHoDWGssE1j5ca4741Y
         +sNJrDz5yLDn9Id4mhswHYeiG2ntdWVEgZ4Ox1UwljiMD0G/lMCAqPEAHsHailAsn7c0
         YPZWxUS2sd4L6SzMuoa/ggHvAdvoeG4nPJKImtbs209PRTxPl2LDUdxJw8J3d1BgAOjQ
         gI1HiZd3vlWuyCbZ+lv9T3McTqLaF1lRe1TfwvwZTYFKfW+YAT1qAPPpMppEiGEeaQeF
         yOpEpUYPOOACl+qZtKi9vl+bcLCKD2oqCA50BzK5IVcJBhr166TKI2mC1jBqvrktQxrm
         rNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508565; x=1796113365;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
        b=Z5WdldGPcR0veO52y+44ilRh1xXIv5FLmb5ApYO+gTNVQl4CaB5F+H/oso8UN/xSDP
         wdISl8G299B0hGwxecq5uSbDguSzL8Qj09aDLfE5aXEyW+/RYrwbx4n/Q17z4zzA/Gn7
         3NLrJYqpHgZ6PNXK3ADAs2vLT9csm4enNMbTqWfYD1JWtrvTfmPVGgaihYt1KxcoMXje
         ut9yUMgJnNPpve5rEFshEgp+UnHhDMqWU77v9B2dRPlsbjh3KIu2j/C5NJ6aukc5oId2
         gaJkv91MWD2kbMgbcP1CR4KTV2kl/hJuM6ucI3KR5DvKt5ldvWywRlwTok4y1t8yCM3D
         TS1w==
X-Forwarded-Encrypted: i=1; AL+hErFka7TVuPEeKFuGm2jWlnPQzAIwcFogt70kyDJ7T1RDErkASSeURiurUMuPEpZCIq/IAtJs+D0rDcwr@vger.kernel.org
X-Gm-Message-State: APuU4Z9CfR9jVqdFu49grbfRKpI1+lralU1TME+6BH39GoGTDQgax6Qx
	mfOVMh5mKPwakxG7dTDPn7PiYh2akNaMh0VS/fnGvm/FrltmwJUnvSbe
X-Gm-Gg: AZFdTZdeP5nonU8hFYlhtwBYWMvH5p0gL4GVmn1Nu3sANU0j/peJZ2QbbqRsobKJQ1r
	8OZojDr7Lm5+pgW5VXsHA8DPgEPXEXVBcI5Rf+DqAtwU8nQngbEN3sZmgKCoUR6qds1BZrheoBA
	Bg7r6pzwslP7WvnP1fF+M7c9AxdjJ881yc2MfqVu9NaBI5gEAvCIy6Az1JA49C4Sbs46Co8+4ju
	RpDWA2LVSN9UfDg8rvEz90RYz8bgWzo8cmY4Mdk1KvsPtUT4YlPd7DwfgH9bHzAsfKA3PpQoo2X
	FOD2rQBRLt+6NsiRXlPdKFppDAhoG9sne7RqjdhFWv6XjIUtMH1+JG48F2O2Xw2HXh2m1GTeSH2
	2/hw5/xapmJwEHM+EiqWxH56wxMXQE+cmxkNkLr4sJQZ948IjOKKFG8cw28j7Ew0aIpk8GMshbi
	kmJOHgVc98TH/o8GFlsHPMF+0j9vMwV+OInycC+qj809Qkr686o13IChvkEJA7H5QMNFD3uiWMr
	ghuEwe6znzQSmKNN1X2frr3X4UpF/LTP72e068ZfZzC3c7aYnG3yw5IroDyZMJmse7+Sgl8szhN
	UjqI30BuSbc0YN8EZMwJlFF8i9AwGikN0rIeOQx4AmnbEb8nCZIXkUw=
X-Received: by 2002:a05:6512:108a:b0:5c1:4e18:39d7 with SMTP id 2adb3069b0e04-5c1bc7bccd9mr4434489e87.12.1795508565068;
        Tue, 24 Nov 2026 00:22:45 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0563casm3560147e87.67.2026.11.24.00.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:22:44 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
In-Reply-To: <awU2-KjkZB7WvqfX@monoceros>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
 <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
 <awU2-KjkZB7WvqfX@monoceros>
Date: Tue, 24 Nov 2026 11:22:01 +0300
Message-ID: <179550852171.3.3520172407021510093@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Uwe,

Thanks, I removed the redundant linux/mod_devicetable.h include in v2.

During the additional source review I also found the vendor's A0 reseeding
erratum workaround. The driver now checks the global SoC identification
register and limits hardware reseeding to CS7542 A1, rather than adopting
the vendor's RTC/timer-derived nonce workaround. Our Almond+ is A1; its
identification register was checked read-only as well.

The built-in and module ARM builds were repeated with COMPILE_TEST=n.
The A1 generation path is unchanged; the new guard and its error paths
were tested with the actual C code, without claiming a new entropy test.

Sent v2:
https://lore.kernel.org/all/20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com/

Thanks,
Fil

