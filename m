Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111617;
	b=C3Fiw8UnJEMQym4RVBTk2U3DRgfK+U5hKFL+0wazIjkQ9GyWP+yEUGx79hFtBWL4lm1z
	 18/lGcXnh2hlsX2Jpep9r2amXaxiKNuqF2C1ObSPKlKa1mJgE4ipu6KVkoYrgH/zEfnbE
	 wVfdE6PUFFWLVlYMVjRS20i7d26N59xjALzQs/UiSSrDFrQ+iShcjPJtErhfV1JlMSecM
	 qPgA5A82qiJucAWdhjAee0Wh7t7aJegBQK61WGbpbMvflssoIzgFJBOOz3iuxAsM9Pku1
	 SGN03ry2fJ/ODa/mk5xuUzEgmbPny1lKg1OKoI8yxFdoVc1s0uxRglnEAuq0X22iDZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
	b=2aPUhchExjHT4yX5iSlnNTI+/7wC2ad9y/uRQzK7S7te7xFHHn0hO9v7Uj28ETIEiwNI
	 ueosEIbfOdxaL1MNnk5OIdHbkuRzgU0dkv35LVwb3BE8BiVFCqvqOY/EL6KvoGu9NFBL7
	 dll9MjUSyNMtBYgVMv9UR1FQsL1r0qrPi73e1oinyseCzTRknnCOulnwmBNNXhOQrcek1
	 zsy3zuSK0WsG00QhvR6jus8C8MlBJJcqV/F8RjAddEeLC5oOOR4UDYgp2Lbg9aAt+bmnE
	 PdUQyyyww3A5crKGMH7n6SLOfoI59QP5BAcklCHvl8QBGIQFsm+m3SOMhDAwPU3wZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kr+IeXjL;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCD0606A32F
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCD0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kr+IeXjL
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4ad4072943dso40886fac.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111616; x=1795716416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=kr+IeXjL0mBaTUa+aj21FwLVGfunm89qfu2cv3XcqUyTL4kQA+iNsgAocslBB27sz4
         cXRndaC/29YZ2zxKnsC4ZTXJbaxAQxvx+QGsbTdoEx+jps8qwlxL1PiSi0kX+h10vBzH
         TfoQEOTk9I18UREBmasWDYICw3wc1IxqxszxGv5VGayCLCXKGwNPUm1HRNs/6gdsLnPH
         t5g8VhYKCj69TsUouE/bhGI8yMnxVH8OJSJhNBuDSTsA1o1Pe4QX9sbQ1bP9Y3f2QyU+
         S1XvycwarBk3+rDKuTm2zvr1LJlrg4vEy4CxdnM19TOD/IqA7EGNHMTcyvhMUl5YHqGV
         ltmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111616; x=1795716416;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+h1+6/yXyfCQxVyWKiaA+3PG2QahTNSPc0SUKvEWjo=;
        b=m89LrXy4Ro5rmM2eV4O9tbqCXpsLWxne2wLlfmIJIVa/rq8BImeOjBm45VrYm443EN
         qvSDgXyel7GFNtA3bSFnqXzD1zgFtGU3x2EaJeYySGKHeNz4bWq/xlAzRrjTHxRiiTKU
         ZIMZkZ7wZMhA4/logVuOk24KyUSX8Ey3a+0HPayB4iuVHpiBtb4+DLITejTN3ACB8L1t
         Oio74Xt/fypEeiTML1JgyvK4u+DoptVeuW9VOkESVLKaAt9PliEYq9R+sGusOPr82yqY
         VqQYSfM9TTY+J9fkJ/tsJgqt0MWIwl4HHuT3s4CimzZaT+fd5B/JRrSIxMPnZ4PjZAiq
         IYmg==
X-Forwarded-Encrypted: i=1; AL+hErFh+IYOWUY7VWjDoPp3nSGm5NyNRuJFa2WHCnqfEOCIZMNSSFlvvFqFwA/W+QY0yhGNhxSOoBE/BoEb@vger.kernel.org
X-Gm-Message-State: APuU4Z+//8W3nVSMMrHmC0GgY8ADCatO3albhkNdX1r8YdqW3ONZLfhI
	Gleg4TxK1gk05EpHJjH1dhkeIIGzDxm036Xl1aqPwD3WTliVOo7Aky5C
X-Gm-Gg: AYBFou1Z4Xa5iSJpqBQo6wrHM7vswnCKaJGanPeUCu/ZOQjh6v+ijLU+w8VfXTDVB+l
	9MFBL3Lqjs4K/dj0CT5s7kSdEJ7yWKUnkUU1UVXwTCuQZ9o0pGi8Z0jbqN5b85QU2MHvRU0/OBI
	rLLM96kjhXSO0aFVz2eRO9YZNhd5hx4beZfDrAjuCteFRWSfzZ6rC2e3DwJTppS9UJyzdSI3pL0
	4J6JnMs1SqItR2U6UBy3cenL+Ha8H7TOAVeOZ4eKe0cHIKFAK3aq2j6aqVAF10so/597aCXAHfD
	qg25pss/TNd/YewdVgQsZSh+ZuYb6DfxPU/TFvmEiOmPF9GqZXlIzRxoP7Hr08Y74IbYSIfzwGr
	0o4vnt+qz3Ub8nlO+SWqYqFXuD1Q79yKWUZbg9PO4cIK+Ae5J3+srd3LRR2WkqKuxpe5QXIj3y3
	7rfBhGaDI5NxZGD6pOOk7VWpEsZlIYXrDvUut5FKgpB6d2nlNJlA3UvUjuE3mHmnFZmk/KG2X/N
	orGEPpZXpLzgQNZIrYp2dVsM7VQoOpw/B4QbJ3CkTpLWlFlHVcERru42ZLhvX/4iwdrDsd3Gb3M
	ugMY+YupqEWSY3L/9bthRuGwEdhhrYsXoHzqTe1AGdFsaP3aA5Ij36+0zN01dU/A6vtmmkah9bg
	QyA==
X-Received: by 2002:a05:6870:ac13:b0:4bb:98d6:f37c with SMTP id 586e51a60fabf-4bc81ca0dbemr415502fac.15.1795111615833;
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5fcb19a9sm453262fac.10.2026.11.19.10.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:06:55 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alex@sverdlin.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 19 Nov 2026 13:06:53 -0500
Message-ID: <20261118-a733-dt-v3-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com> <18a78cddfc3c28c011bb5d0c566c2f307773b235.camel@sverdlin.org>
Content-Type: text/plain; charset="us-ascii"
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

Hi Alexander,

> Shall parts of this go below "---" as history/changelog?

Yes. In v4 I will move the dated test results below "---" and keep
the hardware rationale in the commit message.

> Do we need capacity-dmips-mhz, cpu-map and two PMUs here, similar
> to rk3588-base.dtsi? This in turn would mean ppi-partitions with
> #interrupt-cells = <4> in GIC?

The A733 manual shows one DynamIQ cluster with six Cortex-A55 cores
(0-5) and two Cortex-A76 cores (6-7) sharing L3 (section 5.1.2,
figure 5-1). Every core's PMU interrupt is PPI 7 (section 12.2.3,
table 12-1).

In v4 I will add a single-cluster cpu-map and separate
arm,cortex-a55-pmu and arm,cortex-a76-pmu nodes on PPI 7 with
ppi-partitions, and switch the GIC to #interrupt-cells = <4>, as
MT8186 does for the same six-plus-two layout.

I will leave capacity-dmips-mhz out until measured on A733. Radxa's
BSP uses 430/1024 without a stated method. In the November 18
RAM boot on Cubie A7S with the v4 DT, CPUs 0-7 were in one cluster,
with the A55 PMU on CPUs 0-5 and the A76 PMU on CPUs 6-7 counting
and receiving PPI 7 overflow interrupts on each CPU.

Thanks,
Enzo
