Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460319;
	b=vrhHeqZCN0zGDYthjsLx048/NIQsbM6OnU4kSphiN0GLxG4bueTSA53IO83+Qv1ApiZb
	 Z5+wpBgQde+b3tpueNXxXAx226taV56EY2wcDTvES3gybaawDbOevwUTUG/l4SaBdSFxl
	 m7RXnQHDKMWDjr/gXAXja2PXSDPY2Egz2aipufVYYkrl0KPGKYAw26nmkOB9b0pkdgMOX
	 zYclUV8sAX+kY9SDnYb2sS/FIHePCd6LJj+KZ0S8CXjFxkKqy9sY4w09ULazCZkPl2bz9
	 ltyfNn+XIlFVg65VI4D98GegK+jQxuJ7A89xmeNVMCm7Eq+/VKOIEkdCSz71nmtPzaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
	b=Da2PPm4cmz/e3S12EzqfcGq3yWev1SMhTn4UjwBW5IVlz3XqhYSFyfX0HV7C5KwdXXg3
	 tunMX818eIgbG8aUyqIumBgySyxjHQx2bcr506lop3SO/QzACGdyVSVZOc8CepDmruV3f
	 R/6p3hIbXC19htaQUMG5payyzMXUk1p/PmAKKs/1TjLbC8Wnvo2GRS9RBX9TgYif1zYUJ
	 lrIVIyxzwDSSxZ6KIi63kAOOA56XflIR3o/jgPwvkvlqpbyZEqpd4Gn+d7Q9nxCD5EPaQ
	 CI6zcLvxNMUYFhlJ23DNM/COBQTrFHBTcyRCWhM9GmjbJr1d2QA7sLkb6QQ02ipCjsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rhK27hUj;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A469606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 01:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A469606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rhK27hUj
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6602709eec.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 18:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460318; x=1793065118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
        b=rhK27hUjeHRnkhbrVNJ2XwhZq7l4qeNjK188G/cQOCNGrllyZZrjFdmE7BBmC6PbZ0
         FqpQMmlLnaWvKqtvLwsP3VoeRu8uWRcYOA9ni1wMMT2H0G3ODy0x+IpphTIFPd3Yv0/I
         OiK8oGmEqGaMBBu1Yvhzln7e6Zgm2NH1kyRSgAGkThUXOFf4T9CG5Xg4Lb8dgNxQK1OY
         zGI7XFWCPwMcaI/ldYUB8ytRSo0huZB2FgurXz984M4tjKyRWOS8mLPdz+yFxO5kyzxO
         2AePlDfj0/lvRVnUnyQdoseg+5cRhVxFR/kx6i0QWz1eDRegxuSi8pCDH+bgI2hbVJQ8
         cXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460318; x=1793065118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjwwN5Dzf8X1Yx08q6zZspcMWuK38LtYvZHShxnEiOc=;
        b=MkPmsyysYOD1PgWuCekYr708XqCBN0uqLrvbs4i6g8Bc/BWtK6JFaG2tZhCpk2YhVc
         BBsCPbUZi5ln/OvbdUwgWNLSS1IyNm/4/otATTfvHxuvafdZI5PxK+bb6wPuKmTAPTtE
         8J6e/BGuXv/XKM9O5C12BLOazC60r/6GR97ymlXi0uFgiJt6PeOIQN/e2aiNu735dzpX
         GOXlxnt1tHG6+5Q1ajY3Ls39GsE1FYbECoJvXS6E6gi7m2tcmFXx7fnp6hr3mj1BNA2D
         cboHVV6l3DmnI9lKHVsKcrhO4A2/aNcHLjJn2MBv5/w+qVQilA/nnTjMcAH/0Fd1PByl
         W0Vw==
X-Forwarded-Encrypted: i=1; AKwUvByDAn8fy8lRQiLblorGy0an+59KpCjEO/NPo6xW/fSdojMfSkFla8tlM6cYgZANokF66NBYw2dnsRWy@vger.kernel.org
X-Gm-Message-State: AFq9FYK4qixtt0QyezODcFWkXmD/cJ2Om9Z8qGUFlg+AYsmVtY4lYvYV
	ChlLACSExziFSqvvaqU4NJ7hnHlN/eiy6l4lLfyqUxCJMFhjV9Fv5GS/
X-Gm-Gg: AYBFou3fxuhG0+WLLHgkbY48y9+XwrNiefHDosRjIf9xiWeuPJN6U9p7ElDQ810nQNS
	+lF9AUWXQmOeH3wDD3RYjR7o8wlMsIJU2afe8PJlPROZ7NSpbIVnD6Gg8CrnH7k509pO+nAedIl
	mbEVu7Tdj3YoENRxEvK8TQrWABOtGEK9OwG5tSwuwn01yhJAql624FWKtTl19abosQn2S6gNYov
	txkKZRGg5L1gAJizy9S9o5TvqNbbC2KDgqVu+ImdEfXNCASZ4eZgOELh7bS0IMhdkUSldh9ee9m
	3cb9PQmHLD0DCUgLKsmUHfCDNv05+OG/AhQQAJ0nEKcJcZAYiGB489TJwcUJEczogs8uCCXllzk
	i6/kVHn3s85GYKWOK5p91VNruhjw4X5fo0xr0MAr92XNrT+/eTJzQ/tJjmouoy+HTKQcskC/8AV
	+AvPjjTNfbjhSyZvBbCNW6zlgOMDSBJDmiYAc/Z6WWh1ihgBgpJUeD6xt9BBUWad+oEdfeUnpJ5
	sp7OnVdKLyG
X-Received: by 2002:a05:693c:20c5:20b0:35c:2986:35ab with SMTP id 5a478bee46e88-361a1668b4dmr13507939eec.13.1792460318438;
        Mon, 19 Oct 2026 18:38:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm37720983eec.7.2026.10.19.18.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:38:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 18:38:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, manuel.lauss@gmail.com
Subject: Re: [PATCH 2/5] dt-bindings: watchdog: gpio: Describe minimum
 heartbeat intervals
Message-ID: <704e79be-3fa0-46fa-aaa9-d13fb9d933ac@roeck-us.net>
References: <20261016221617.2223004-1-f.fainelli@gmail.com>
 <20261016221617.2223004-3-f.fainelli@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016221617.2223004-3-f.fainelli@gmail.com>

On Fri, Oct 16, 2026 at 03:16:14PM -0700, Florian Fainelli wrote:
> Some GPIO-controlled watchdogs require a minimum interval between input
> transitions. Add an optional hw-min-interval-ms property to describe this
> constraint, allowing the watchdog core to defer early keepalives.
> 
> Also remove the 16-bit limit on hw_margin_ms. The generic GPIO driver has
> no hardware register imposing this limit, and its heartbeat interval is
> stored in an unsigned int. The MTX-1 watchdog has a nominal 100-second
> hardware timeout and requires at least 1.6 seconds between transitions.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
