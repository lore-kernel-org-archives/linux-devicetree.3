Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BE490BEA
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789988821; cv=none; b=OqIxlnLyN04QgnQrdlf7eb1e3nno/SWC3KjXx7HmsACW+zP1irlB6XO4Ko3gxUjSi+0dbKzQQHQ5RlZ1vAAGTepQaaCzC7j4m7PpKC5MgimYT+DnnyIkdA41OoCRKZ9WKV+B7agxCmbeOf8C6MIvq8PN/vaEpk9gUbxxpKocOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789988821; c=relaxed/simple;
	bh=UUOINDD93jJS+LUcebWPI3js4hVCQibaR3IC0U7k49c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G06fqySCQymC0tDuFx1wuH1TFIXgaS0URYwvw9Fvb2vyYYV85him9/85PEvkc/Vr0jmlsLyvyVsBqBHmpQc0Ad8gmmpiMBGdErkNNq9iLGxWCRMzrN+0WQvggETi4nxMPv1AJuqJXj0Tw2Qt5nEDnXIlTg7IA+kY0RTHVqWM2zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmd4dzw7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmd4dzw7"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so25251225ad.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988815; x=1790593615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=kmd4dzw7YZwUGOpAohpIZBA84zGfg7XBW2MOXiu/6PtAIAey7CGoejz0Zx3N/LAUQY
         hFXz0jGOkd74aCYP98iga4k3O8w5+pl6eeik3e6AgCWKaNYVNkL0KJ49+QuGXt2TOM/s
         /JHmiVKtrRmdFk10TkJzqzwvM4DA3c65JItDPe7ALCMyGcfHUZ7IKfuvW9BuYSq5v4YU
         5wep9KIJutpDUF7a8BqfsG3nRWCmXCfuNK+qLGffBqgpR6zEmK4431v0FSYTS42e2/CL
         USWzYRVdteKi6yadRWl0nFHsuyfd4szDleMnlgzO+1zis8tdTbWLsol2SHHHcRvzcnT8
         GC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988815; x=1790593615;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=Q/pkmSJYl2wBop4wb6s3qfh6AvWR192/9ijTXE0wPcgxqeOmVqeoZ8bJg8IlVd0N78
         H1K8nmJ/wIY5inpp25cn2flfvhF3cqTI4JakWMj5jpejq+ATwdppHQqjldhGb/85p1Sz
         tgFVlL/kF3+nsaAu19xQdTXBr2BDpqCQxeRlT/5gh5G9vpFMa8HnWoeABVpZgENBO7Qw
         lElsyyRjhoDLUOkDscmVyVZAFqgR9+iVe1o34YGPDUcPri0pJwoMQw+/rO6jU2s5ZLj/
         wQOfXQhrxDmYHNeWtUMksxE3lcv1TrGWxGSjmBE1RaagNVgvTzXow9krWyig0WQd1Qs7
         s2fg==
X-Forwarded-Encrypted: i=1; AKwUvByu86vPgQD2ohrLJSAQrneebvGljslXxVG0m7fmDbAi1iPOm2kfU3cPuSleM4Xj6NQAv6qrkFAsrxyr@vger.kernel.org
X-Gm-Message-State: AFuF++naqgD+t8tMzeLyG0yWLvu9tls2EnPSYsodK/u93NF8roUnEhaP
	kciQdgrS48ZAnkk2luIZnRNQuNeGZN/qHg3v+tCG+YykjvKAjtllbhtb
X-Gm-Gg: AYBFou1Z4yfmN48sAJuri2H96pa9YnnpgHVRtIAGfTAvX4IcD6snEWeOATecdLz9KYx
	hPnR47H5s11yCxt+1qAZmSKGfB4T6uGTNnrbEZJ2f7Kbu8yGjWmtGLOs+ZHdECRlHtDw9zLPntO
	2jPyYwZKlc1nUPAqRbrVli9f3Gyd6RJx/GyiKIqYsg3WhP9XoJUu+FRtBPnqGzEwV+Sk4LhBHDE
	xE9rOZxADY2FqCZxPblRUIUUVNY1Y2h0C/t3p/IZVQOwWRTHlwA8M5IG1hcRl+7WGNDkFmmd5P2
	N6yNT9aP6uWidPARRFfDyJ1LlBLQtmBAEEaYX8Nuvb4KoVDakg5CzPGNvERd/jvQepRXD+9ZJbb
	5wmI8uXkK/vGn40DRYn9Cv2IcH/n5osjTdvS9DAz7Kqpi63aK/29Fm8wW1RRWS87uf67HJcR1Dv
	w3yGaMTZyvc6fnRpj96A+gUThuiS+cLuKR+653Isd6C2wE5rM1li9zDFxvUugBGuBvChHm5/r+g
	RNi6KIL7W2iKbauJcZD4v3LjH8J2ywTL6Aj13ejff8wwk+ohubVhDLQ2VsA+A==
X-Received: by 2002:a17:903:2447:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2ddb1b79df8mr144230985ad.5.1789988815140;
        Mon, 21 Sep 2026 04:06:55 -0700 (PDT)
Received: from [192.168.151.214] (222-228-113-186.aichi.fdn.vectant.ne.jp. [222.228.113.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm31428165ad.56.2026.09.21.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:54 -0700 (PDT)
Message-ID: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
Date: Mon, 21 Sep 2026 20:06:47 +0900
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: arnd@kernel.org
Cc: Frank.Li@nxp.com, aaro.koskinen@iki.fi, alexander.sverdlin@siemens.com,
 alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
 andreas@kemnade.info, andrew@lunn.ch, arnd@arndb.de,
 claudiu.beznea@tuxon.dev, conor+dt@kernel.org, david@kernel.org,
 devicetree@vger.kernel.org, enelsonmoore@gmail.com, festevam@gmail.com,
 geert@linux-m68k.org, gregory.clement@bootlin.com, imx@lists.linux.dev,
 kernel@pengutronix.de, khilman@baylibre.com, kmehltretter@gmail.com,
 kristoffer.ericson@gmail.com, krzk@kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd and all,

I would like to request that the core Arm Cortex-M support be retained, specifically for v8-M.

I'm heavily using Arm Cortex-M / NOMMU Linux for academic research.
In particular, I frequently run Linux on newer Arm v8-M (Cortex-M33/M55/M85) processors.
However, dropping CONFIG_CPU_V7M also removes support for these newer CPUs.
Because v8-M is highly compatible with the older v7-M (Cortex-M3/M4/M7), the v8-M support is tightly coupled with CONFIG_CPU_V7M, despite the name. 
The major differences are essentially CPU IDs and PMSAv8 MPU support.
So I need the majority of CONFIG_CPU_V7M to support Arm v8-M. 

Regarding platform support, I don't need Linux-side device drivers.
In my current setup, Linux runs in a virtualized environment hosted by an RTOS (like Zephyr) and accesses devices through virtio served by the RTOS.
I also understand that maintaining legacy MCU platform support is a significant burden.
Therefore, I don't object to removing the platform support, though the MPS platform remains convenient for bare-metal testing.

I am willing to help maintain this support, including modernizing the relevant code. I can regularly test kernels on real Armv8-M hardware.
If an active maintainer is required to keep the support, I am willing to take on that responsibility.
Please let me know how I can help keep the support.

Thanks,
Yoshifumi
