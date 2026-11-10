Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280094;
	b=FSaWsjw9u8mCBlLpE3axAnSlGGJYN19Z5mITwefnwaTbOaBJUMj2lzD0KTkWHxxqmdiZ
	 G3rm/Ig0LPr9JUuK4UDNDlQlwIAUEXy6tQPkuUbFn9RXoldLQkkCBcHTtdcNz57eUrrNF
	 f2x9koJhx5g6iTDPHCXRbPXS2dlNrQiERG3TtkBVP4Ekb4oN8uWJmbHD8FjF/OIEqc/2p
	 SHo7YN8rEaPQvf91F1CN7J0A96ut4u1v/0+kIacPJvvXxNz4NQ3eY5qQ7h5iyewnq86Cn
	 SPpxGzhcLNaGfqTV31HaDTTxB4O36FN0mWmf7nxqDIQsHnzLJFbVfJ6jzByTBhMeioQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
	b=j+wkkWylVVemXwZqrfiSpNTXWHLCrc5fsBBxCeHOmiUn69e/1sef+Tf0GTREgsbpIUSd
	 9n7pERITzu2DsAuvBTLtds50etGQkQk1oc8WR6cO9jEaHHVmVUVtRZsyuLOsHMFoHLmEd
	 tVubai02NiEsj8lCWmbEyDR8BrQztFshOShN0RD76Rdvo4OX/l4OW2YPJMvDC29zGYZE0
	 vG8QqL+fAe2sDp8r9Zg2gVjIPjcovQdm7CL3uUYm0OCPfTgExSImUaOWxTfxE+QHqJMXM
	 WL9v2PYdkI4D9+oZexgooj+nWZAwSvCP3FBMmuLQ6NOQSsbJ0kEDILfhy+ZqIvA12FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UOhCUjmW;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767C606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4767C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UOhCUjmW
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so1323661c88.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794280093; x=1794884893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
        b=UOhCUjmWqyhIgvb6DM4kMuaVtMGn8ypxPihudQDurBoK7Hf9XEKPsEIK8NVnyCDGGC
         drPemDaDW0v/ZMthSVCjgBd8+uNpQ+Gf2F40YqjsbSZARP9+BnGxHnTeLx1aih/k8A42
         7+iGnZgiHMfsh6MtQGmrAjo168DSbAYe/gj7NF1cHLXA10TXCSSBBAhIPIGQUcc4b0LS
         u5BNaFw5kLU3b0G3aiwFGJo9gqgzeJKTFIciBuwwVkvVau81G/cywEenCk3XivD1QGVB
         pqI3DtkJMigBBJO7B6y4OReh1Qqpt3wSSIbAXHLmjh1I5nUk0TbeK4vlluypWJjwTJWG
         JDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280093; x=1794884893;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxXrVe4VYlIQzW68nXA3FT5khD/dasufUzEWUgRYIzU=;
        b=Mwd0x9tJ0M0n/GQJFsS+diwP0yqcB5WT2UlVStQQVxQLcRrPtVheXJH/K6zXzY1C0P
         lJvnJnFdgHYZNXRPgHOLV//mSMWjBb6wOxNSsSC9UVM4vgP2Cy729QFkMNc2xw7LeSQP
         zA2dsB+O2i04MAwSacSPs9gBwOeBL2KtOBqAD94x1vf3jVjH3PbLUQaOhvaZOBIGDbWA
         jzftx4ovo8WOFKfCKzLb0+aE+wXgdIiiSn7RlF+uc4BGlT9MOcz+uleX60idudi5EITO
         q0S6IKA7v8LIQ+a6fGNHaahu7CUY/Ie7XRfEqwLLLPQK0Os3Jkkb4dKWzZHzDsPgoYp3
         U23Q==
X-Forwarded-Encrypted: i=1; AL+hErEgOgWMANWx+h5UEW7Ao2AeuP2SPKqCIHsSvysHAeZH/BjboBU1N0o0e5Rfdr51jiC1X1MKAXQQX6O3@vger.kernel.org
X-Gm-Message-State: APuU4Z+oR9sBwS13zjxW38VAAA944bwMVATDTA4pWMimE3MUc0+Cec8v
	Wub7aOIx1a4j5G3YWK0NAUk2hu0C9v5ks7R8I8P41KYibFKuXDi0DwhzJjrDIblpMl8=
X-Gm-Gg: AYBFou045+u5yDwbJzXOcwptZLKKNBnOM1pDCrwmi77oTD98E2Jpx4UKG9ew5TvtFVZ
	bbM4yPY6hJOG8TX7WvbjpR4fh5F3Cb14/GYDmick4BSqYFdf+DXG7ifjJl05d5/galks/3NpDHb
	PttKOs9b3hECyMJUJE1RCrgjaL5sxsZnX306LSo6H1vz6w6xm8snx4GOQ0jnbxG5fiMvYttCn4x
	zOmKQlHBVovktcZQU0Zmae82d1wzdmRaDKFoddH8vyc0EoDf1XIxiv9lNnmIJ2GEtUy7gT/mB21
	wkkiAE7Pnf0hLS192Jjx7wM20kV50M1HljRf0hZ/Uqvl4Uxu97aM0gmzmttiuH43I4h1dyQOzeL
	QhYjaUoYl/HdGykV5O2y5MqD1uM43zxnzsak1z7QHEr19VSQ/oLG1pIbiLN7P1121NNFevGXXdG
	394ARqKNRWYnHCvgQVyHUiay1hq0Y3+pIfwFtO44xK7ycmprLf02aMDB9MJD/yLaa8DtVgNKf4O
	9o8wurbmJWpjusL0UCFkFBK0bkfuMCaNgnW/jrCwk+qpbL/CUyhxVHinU3SCXm7hgZEgo5SqcQk
	XlLD3TI1PR8K/WDnZ0z9NOBvRVG/vX1BTY1bUX5CPgWiy871nrOtpXvypH3Rdpmgcw==
X-Received: by 2002:a05:7022:458b:b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b3b602aee6mr2497518c88.39.1794280093242;
        Mon, 09 Nov 2026 19:08:13 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b7ba88sm3117480c88.22.2026.11.09.19.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:08:12 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Leo Yu-Chi Liang <leo.liang@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 02/14] hwtracing: gtrace: Initial implementation of gtrace framework
Date: Mon,  9 Nov 2026 19:08:07 -0800
Message-ID: <20261110030809.2405947-1-leo.liang@sifive.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com> <20261001052243.3042627-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mayuresh,

On 10/1/2026 1:22 PM, Mayuresh Chitale wrote:
> +const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
> +						  const struct gtrace_component_id *ids)
> +{
> +	const struct gtrace_component_id *id;
> +
> +	for (id = ids; id->version; id++) {
> +		if (comp->id.type != id->type)
> +			continue;
> +
> +		return id;
> +	}

Following up on sashiko's comment: we are adding support for SiFive
pre-ratified trace components on top of this series, and they are
registered with major version 0. Using version 0 as the table terminator
means a driver cannot list a { type, version 0 } entry, which the
eswin/EIC7700 SoC ships.

For now this works because only the type is compared and the
mkversion(1, 0) entry matches any version. But a later version check
would silently drop version 0 components.

Since GTRACE_RVTRACE_ENCODER is 0, the type cannot be the terminator
either. How about reserving type 0:

	enum gtrace_component_type {
		GTRACE_COMPONENT_TYPE_NONE,	/* id table terminator */
		GTRACE_RVTRACE_ENCODER,
		...
	};

	for (id = ids; ids && id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {

The NULL ids check would also cover the missing id_table case that
sashiko raised.

Thanks,
Leo
