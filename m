Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610522;
	b=DRNbELNGVwQFo8ZI7tSbL4HiN1kSiZ5VRyulXHl1bDMOlVdEqd0LnhE24tv0CRgzd1i+
	 H2y+4QfO6YGn6xkXo4i4L1OpsqJChCjGBU+1yOoufGXtOe+Zd+WRqBiHsImcuyrz+AHld
	 ZHkvaILPAd/yk3gYM8aMRaF01Qy2w+r4kdPunkP+kna8KLQck7JZTtbI5dIVk2sSQahpL
	 IWQfTgU70PYuStsZaHFYot32wmmbTgidYOD2sdwbnkkIDEyLVsQ3y+VzXcrcpRifEJYl1
	 NloO9oTUukZCQrgyyRgkJkePT+TpglUq329vMXm+A7FKETQuHsS6MyaNsQfq0WOIbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
	b=fH4ORgTseqi03JPA7sfoSNccVXnSFeAbzp1Uzi1AIbdfA9fsdZWW0Ksj92vGSkYE6InK
	 m8ac/GU9jc+vrygfGucGre8mzrTBLy+WPYTCpw7iuEgjWxCFmJSas3M/o0UOBfQgPgcqH
	 eqqz5D/Yd0TAwD7POPkUGwp5D7bKwrosy+Rj0ec9Ze6Z+ZoXnf2DQ2tQjeFBJBOj4KrWq
	 uKr8tzt3T23nE9HC9UGkcfiCIuehLP9fRcQ1FPeEbd/TY5SEhZ9belF8HA/wXvjlDDVW+
	 2X2jVzW8njIVdrYTzQ6WLNg7W2Y8oTji/9/GjvTre3n+N95VtHQqUGH7+RDsZaJX6yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEnECypd;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D81D606A321
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D81D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEnECypd
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99c042cee7dso3080486241.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795610521; x=1796215321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=sEnECypdk7KhUAuwHAJwkbWydJZy951eF+Uff6HU7RKtBSEmE5wi09kP7Homq3uwia
         VY3stvZYw56g/s6sYlngXrgud0CbnUtQ5jjreUqBqaM2f+MGBznZHDJ0VVa5c6XVFYUV
         9icUdpi36L1MSrexxgh0sPfjTJeH5vu0H/oR4GB9A3oZa4N1ZR7/ysgUgd+TTcPuPmt6
         lg2xyUck5Pe0ecOqdSnTN4LOD2LA8ak3RzCetCzhbQr+X3MsQW9dq5O+g8QuUUH/lfxt
         yQQB1+8Qhf3Ws9z8Q8/SDdBWMh+CiYW1g/qJGbXs+US9FjyZqHIq8pWgMbHobZkB3bpV
         uxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610521; x=1796215321;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KRutoAXol4rkfxgv8cg1HbYxX5YuCi1F4TeDRlqdlo=;
        b=lEACHSYcP4hIJNMwmFYLu1kuhZpc2netMHI1sbOq2sZfOhFtTKXfTS4vCcPuUrgPZb
         CLyLlW9onPCDxjsOITb7aPC5493U7iuHjhI8EdTb4UmR88M4PYrREKH1NdJgGuPrqS46
         LIhDIKjKUSTAcBBhM9G7Ke9nvEKJHHuvDXsOM23VGIUPy+IjsSEckE5TmumFcDnRBqGE
         6Ly+XmEucRQXSnWv5BmDK5CZJBb8haDfbHdAMmBvKHHjc6I3NWt9R2Nc1BBOntUCg8ik
         613EtTYO7s567ELhGSl/wpk4XHrCfxB7ebMm/ecoFzRIlv6E0r9xN/SNcgFfet3smJTc
         fsJg==
X-Forwarded-Encrypted: i=1; AL+hErHrDp2Dzp2cnFW0Ts0GEZSzSjQrLsF6/VvOw4IZmCkKR9ia4+5qGt/9+Ks8jGfFyF4oZGYE1YFlI84v@vger.kernel.org
X-Gm-Message-State: APuU4Z/C0K5rYhNWiicPp+Q3dr7e+J9wTAWEPlH+1gh3pZBIXBtGhRWr
	ALqXWMyl6w58mXqEcVlbJZlrzzL1Klbaa5PILWePFB6XptOprw72xiIS
X-Gm-Gg: AZFdTZcp49gueunSI38FfgXq7MqtIy7qGHmuLA6R2fhnXpcaZNqBhEYkgjeKVkOfvyg
	jwJi8b+0u4ppvlObSeZEWKgBauWVvgS+WEtYzlDlWQfVlUi0jlQjP83sss+EXWI5U9PeAmceRGj
	K6euiXl1XRcRTG3+S8jOVrettqjcQ5BCtlquMVEbwheRYIj2h32wcrgVWfbZMDDq/gXXmOgBcvy
	ZYdVwFZJrVuSogAgwOMFBaJBKJ9eWu4wKzBarkuV2rsFSKrXEkObflMCNXq5cQ7b2l32Jk+kcUI
	zIrpaEJ+cZtu9lAKOGCf6vBUEryb24/G4w9Xwm8OYiKM1G309nBPhsQf0+G60AQfYz3ZMI/a+1K
	W9VU3qXLYPWShAKl69PRgZ5KVwq9KDQqva3nWMBTHTSgf10BH4hwgZjY+FEm3ccCM6ko8SXbMHo
	CwTRXCGuWK3IQDOXlLNU5oc/OomZoZDebTa0f+fpnjF/8Vm9XArB86wiA7ylXHPDCjfDPb07epC
	9/euFL14Qeaia7BFOJWBDhz6dy6YUBfWMiX/NuyvQgTQrfpe9Kh/bWK4Q2kZlXQbn135DhHAeJU
	loFhfSdp21iaRbYcIrrCPndHJSG5OYuVoc2KChnhypoHieOISfubpv3fGN4Hpl4gYSVJN8V6Yy6
	/yhvLPolz63fkkU56YWf0GS9Qwduw2ZDptmkBc9+Upfm+/V1q
X-Received: by 2002:a05:6102:951:b0:7cc:1192:5636 with SMTP id ada2fe7eead31-7d73939011emr10098810137.12.1795610520935;
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:f600:3026:6717:b8b7])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm18213181241.7.2026.11.25.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:42:00 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Wed, 25 Nov 2026 09:41:39 -0300
Message-ID: <20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
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

Hi Andre, Enzo,

On 11/24/26 15:42, Andre Przywara wrote:
> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies
> once.

That works for me. The A7Z DTS is ready on top of Enzo's v5, with the
review comments so far addressed. I tested it on my v1.11 board: all
eight CPUs boot, MMC0 readback matches the reference SHA-256, and
card-detect hotplug works with GPIO_PULL_UP. I also tested PMU counting
and overflow interrupts on both the A55 and A76 cores.

The A7Z binding entry is "radxa,cubie-a7z", "allwinner,sun60i-a733".
Krzysztof already acked that addition in my v1:
https://lore.kernel.org/r/20261113-tacky-unbeatable-pronghorn-74ed4e@quoll

The v1.10 board is still untested with GPIO_PULL_UP.

I'll post the updated A7Z DTS patch to the list as a follow-up to this
thread.

Thanks,
Vinicius
