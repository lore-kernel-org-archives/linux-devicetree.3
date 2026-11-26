Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725235;
	b=sEADMmWsyHf7KNDsf9YvWTyzp3morW/FTnE4CzR6HFn1i/spwV7Wr0MINa3C9LcDinpG
	 9DuxJ+vsYBgBf/6NYhA/X8PEdDkARjUvkBkP1jebWsAuV04hXJCfDAcjaH8swpr9P1KFz
	 r4qmcNFR0FPLHvik/dEEf6/0seoSQcyOW4J5VFUEzkEODGni0fmXPbR/qgRpdb+l4fw2u
	 vVoKLgwi692TJxllv39VUwWyZ22lFO0K73Mv/Our4Kgc+QXy1Qxpi0juyscCiH/XvBdqd
	 QG+qV+8R8Q121xDiyNss1LJySBf+k9ZiwdXbFZNsdfkiT51onlpro6INheO3HmRJ74g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
	b=kl+2aUN1UnP4g1bcSZXyR32sNsBj187RWINoBBDLXWG4zAnYWIo/rzxDpm/c28ro8HTh
	 lCByvK1WWGZuYact1B0o+78xeKlml48gqVysqOnXXPVG4KJ/w0G6JLrtYb2/0i3sbSFVD
	 xrAf6M56fyQDTEEosGVRacDMbpxdHlERN7PfpU1d3LgUMK3L3qdOgutMkG4aBXOORPSVE
	 Wc406tE37emQ95lTNuXnummEDNs6kkRqus+O2hzplX+1zh+QTLipjPJH7j4Bwcg/zfCEI
	 0EjR65oNHt3OXaeBwoyGeO+WE0xq/Gw2WPIcnAV32ch7DS7lNngLnk/jeSPOxoFz/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ki7lj7Iz;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D673606A32E
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D673606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ki7lj7Iz
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4932b13c4ccso4125529fac.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725234; x=1796330034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=ki7lj7IzqYkWadwnqj6PgQlP9aUyGwgU5E6yX6pdQV3YeHU1khswnjP+jW5pftsJ7C
         pnt+f1ngrIJ2bmBCHrG4FW/0/vhgDJXdVWuGQwLf83LcE8uBAjgR6ujhbwxkvSHofQXZ
         asrOrtlakJUqMZ9EVGAnWlkUZCh7MU8McKfGDZjePn1L+QTpHpwRONn3wuebp6gB6vWU
         IpEF8r0arMvF9klc4QSs5BvQzqUM4dJRhyFeL9E6BgRJy4ZCX5fZe+SGfo5UL18yQM1t
         mf79GpaG4qogum7upxuxPTUL/HZDgK/iTQcXnApXO9nB9IjFJNQZbUGj5/jIG2T+YeQJ
         sMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725234; x=1796330034;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=SnCeryZD6q33vSLr4J24soopKdSsFoyhOCEh/iFwdg1aBmyVdeBtWc/6WgBGWdvdHL
         RcHUvd+czjKqCAwPJbwEnukfEN6fk7VmkH3CjFnaVEyt9xN6yjeaJ1vJc0IBbkJcpnty
         kkpMHLDc8C17rOBIg33stFvMFOOg6BAI3QLKN2B6ZcnijbIpsFBsGkFO3nS+JdG3NVIb
         Jni6RqRFPK1sE1jEQQWVsmAq3G0VolYLedyXHdmTMXiNEYHTihlbO6flipqhuxsSas5y
         9dUTglhpFqoPa8qL/RTy+FUeVOtBBo4C9Aof6Mptt0+diENsW2Eexc1h8g1pUvpKk7Vx
         2oIQ==
X-Forwarded-Encrypted: i=1; AL+hErG6DIAsGBCRofObbsIgQOw5B/rAfUzsuoZ7y3LMy43H8010SOUsF/bmk79ecwgcBduntlXJ7/7FipBe@vger.kernel.org
X-Gm-Message-State: APuU4Z+ot2lygiFf9Y4uex0ntw7HTsxRFSjul8K+B+JrjS+WuHYJu9SF
	wXUxPBHK6kbbPWhyytaZ1KFuLtIXasmljSKT+CO6FnYOQWqs24TfNjf8
X-Gm-Gg: AZFdTZeFTvBbb0yPTNXdQRYb54OBr2DWM1dgwWK6esDHzTDBkKs3iRIVJUZiblIQo+h
	47McXSFkd3HGva0EtK3X+PnRhkUyp9zE09O9loblRvYWvjezy9VVA3cBzF523cKLxKgJP5e/6RI
	rj3/XtxGeP8Zxvrzm/+HV+Oi8H8TQ2jWkiP7v4wIt+QxLTRLt9D47sTrk2Y2uAbHfrUcGcqzEWs
	Klbde+ybGViaJGu6B74Hj8ftL2xm5DbEDere3uLFl+vos1etTCFcL/nxKIwzyg8q3RlDLOymSZK
	e4Zoy+oM+TcevYOkPFyIKg4rFDZa7fOdb2RAUjeZ1wN9xctpW0WyDa2oynnDl90Nf/QBsby0sX2
	+H9a3zgpIPemqQc9lSQTVfhUR8HQUhOQFQo7W1y1/U6ORaMZ83+cL0y5K7WalFM2GXp0u116xTu
	62sX6Gk6GI7ZguKWlg2iI3W9Lo8XBkOgR+O6eKhEvon1c/cJhR8wsUKXaTOezkswHTJHoX6Q02N
	qVQKDQcjji3SSrHL1BDVu9E/UiarMtaDWPscY8NVYQFxHC+SjvcKE6wRSLQsnYuumTWHJdkN9yu
	z9XVJSLJPDOdR7OdgT2HADPUoSWk6v9I2ktecQZk6zGC8slFONElKo364NZxzZfgCsitek1KYv0
	xRcr7Pv4=
X-Received: by 2002:a05:6808:4fd4:b0:55c:859:adc with SMTP id 5614622812f47-57a0c5bfaaamr27052957b6e.55.1795725234464;
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a31929223sm17049002b6e.1.2026.11.26.12.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 26 Nov 2026 15:33:52 -0500
Message-ID: <20261125-a733-02-soc@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com> <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com> <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
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

> > This should be evident from the schematic itself (the pins are used for
> > I2C). And then the datasheet would tell you which mux value it is.

A7S schematic sheets 7 and 16 show PG8/PG9 going to the EEPROM.
A733 Datasheet section 4.2.6, table 4-36 gives function 6 for TWI0
SCK/SDA. The v6 commit message cites both. In v6 the I2C0 group has
/omit-if-no-ref/ and the RTC clock include follows the A733 clock headers.

> > Someone please test the PMU.

On the A7S with v4 I pinned perf to each of CPUs 0-7. Cycles and
instructions counted on all eight. Sampling cycles at period 100000
delivered 193 or 194 samples per CPU, all on the requested CPU. Its
PPI 7 interrupt count increased by exactly the number of samples.
The two PMU nodes and their interrupt partitions are unchanged through v6.
Norman also verified PMU counting and overflow interrupts on all eight
CPUs on his A7S with v5 [3].
Vinicius also reports PMU counting and overflow interrupts on both
core types on his A7Z v1.11 [1].

> So I wonder if you could take just that binding patch already, to not
> block progress here?

The binding is Vinicius's v2 3/4 [2]. It adds the A733 compatible with
the DW APB UART fallback and has Conor's ack. Taking it separately
would cover the DT dependency. My console tests also used Vinicius's
driver changes.

[1] https://lore.kernel.org/r/20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo
