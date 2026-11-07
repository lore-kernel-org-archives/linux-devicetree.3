Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039503;
	b=mfT8770QuwOEUfzhZgDIhbgjU04fXtBQlZp/957UwOJOJG6+xGLTlXoLA1Rek4aaeOrn
	 bQioYVB61sJGaADf3ooNPVoxZdROJV4TFaMuMxQtpfxL9Rxabc2/Yt8GGdN6wztuverhq
	 NLv2NVlQyvcLl3R2NJEBRxC2jcdZykchCvKZu0/eHSGic69ewQDD7ciZNBhkf0CG8D99S
	 mwbBK7y2y6hLot1ZIraDByNjPRV58fLpBx6oUTVnkC09NfK3Iel0YUmFq2qxqde9Vx92P
	 sSTyWnwQTHE4z6TRLRYNMK3hd3u+Gr/IX/T1Ir52y3+nuG0t4g0k7L5viYQL7NodGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
	b=Vz5PSpl4TsMbO2U1ZS5Dyu6d0fNldluTmG13Dx6zML8sCxUJ6qqATJ5Nk84gm1QD2Bd0
	 66+Ih5NJNnOSMjTPGLY9411OAqqhMSoOmX8in7oEYheUQOFDnWMKWeRhND5unqobK1ww1
	 TViICb0oYf6nEOak+yBYSMiOJ/0b8RY56v/E9oRzzrzNxrzFC4ftzs6YL1oMH1pJ7hdrq
	 W7hr9SweIVgg0jUgaA/4+oP2gD3XBuWs25QFDRLvQOAYS0XA3ZBghe+wtMDM2V9ha9Rk2
	 aImwynyrvFJZf0S902bBPmKeflkxbB4IfDuUnY17piENszQYrHoTuVI2St3LI3S+I+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUdLLuxy;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6628606A32C
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 08:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6628606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUdLLuxy
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7646525ad.3
        for <devicetree@vger.kernel.org>; Sat, 07 Nov 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039502; x=1794644302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
        b=uUdLLuxyl3UJP4spFk3NxgQpmrV3TmK9yeFUh1vl5evvBlg6C5YftzRlsdtpVUqUAL
         VPwKMdFyu4VK1c5tKq8BWJQ/IrK34OvioJHOCG0eqvMUASiYSn985yNhimije8kbYFC1
         3ATGnIJnKzT/V0igv4JRmNc3IjiAOUyD64Q2ruQVvdcyYFLRgNIl3o+soZ9NhK7zf0tg
         NQ67e3pwL4aZszws6XccLeLQAyYDC9EdfD2oxlJ7uZRR13Vd3SipU6b6R9En4o+yQwrG
         78Z3yJtteRvnYajuzqPZnJFQdEEjaqRfEZ5WAdcYmDpNkukpza7aul36o6VZBbUDh2Sz
         Sv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039502; x=1794644302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
        b=iywkVY//vEpBR+If2QI9arYHJfHSknO7ViXEbKTcOBWkweSgLu95kU8eEUPYq1x1e2
         CuMdCcJYUIqqBG5S6B5OYS4lFH4bIssmV7USApgYKtylpPLrZhjHT9rXyR67uWypw6WV
         1po7TYc7D3Oj6jwcNeM6VvhC7f0o1Fnp4vTzet/opLfiizoikuhd2VMJ9CbzRz7ArMX/
         E4Vw7jDK+L+Jp2K3DPOuul3+QsdkiRsg3GbcG9/5wZQZ94+e6bFiHE9xjxTrUZKorM/F
         +4jbowyVWvVL0xiJ7ajJPyT1sadTIR3kF4uCQXV7kElKIeDkYVivwGERanzFmmEfLqPX
         QxvQ==
X-Forwarded-Encrypted: i=1; AL+hErGyAfvVWz47L9coB54uxFpM9GIMTrPdIXATf1JIElW+7DgswS7NTN8Gr2yheylb51wpD626GoOKxcU4@vger.kernel.org
X-Gm-Message-State: APuU4Z9xHufvV8VkSPkvEur8slm0iPJ2g8NTY2sJh6nkFYuOO65hPLqE
	jWSPos3NcKmrNwIgVm83nBTfz3su+8My9QLFLdQJ+F8X7ETq9dK0eu5S
X-Gm-Gg: AYBFou0zgymoDhbclynu7YFsVINJ3hsstW2n3EvFlASN2ItER8X/WD6Dgn0kWoEwS23
	gpUPd9Ovf8F0CMt8uvXlL2/sXBJ0c3DmzKwAq61GQTgY2LhcOe9ccN9mVIy5iOLipH0hb1WLcpZ
	QLZyMoTwdG2mjUZ4LXfmcPAg/i0od4ErM1J0hMNhyDFJHQCuGYr5V3U6gR81Ks2J4MUgTYcz/UV
	BlToLv/hhDsO8JH5dxZsKrI1xP1Q5nTKM7m5uBC13AVr6OhCgGvnWd5RyMbbAN37nk8SdbzCIwn
	146nwsCK/GglAxUaWoXBk1HginnRCflDv/8jn7RGq5xWS/9tNSaECvzp04hhI9UBzVzo00QZgho
	0CK1+mQErgieLckz7LxFVIqrSF1AYJ+oHhuJWFN9Hzmcno0xZR93NELpB/xf1rKrU38JSLueihG
	X8LF6Spk3/bMWCSDmgsUbLVNZwv9srKyBwZ5EDtCNoOUzg5NDE4iMcFPVsE9f6TwlkdDZOtxXu/
	HczqyUYTYOrIyWSO1xed5v0B/Fef9MT2qkRwmFhEbkAvIY9P+s1oXzugCHJzkRb+M95ThJ+tFuP
	ACFv6JM5KNk7LNl0iw==
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr55809015ad.26.1794039501791;
        Sat, 07 Nov 2026 00:18:21 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac5:45bc:1e1e::300:1a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47528e5dsm11943395ad.4.2026.11.07.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:18:21 -0800 (PST)
Date: Sat, 7 Nov 2026 17:18:17 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
Message-ID: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
 <20261105222435.571449-1-asalde.le1@gmail.com>
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
In-Reply-To: <20261105222435.571449-1-asalde.le1@gmail.com>

Hi Alexander,
(Resending with the Cc recipients I missed; sorry for the duplicate.)

On Fri, Nov 06, 2026 at 01:24:34AM +0300, Alexander Letuchiy wrote:
> On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> > Does mt6895 actually share the same reset layout as mt6589? Given the
> > generation leap between these, the former is very unlikely to use
> > the same resets.
> 
> The vendor kernel for this SoC binds the watchdog with the same
> compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
> same address, and its register definitions are identical to mtk_wdt.c.
> 
> The TOPRGU reset layout is the one thing I can't confirm, as I found no
> reset table for MT6895 there. This series does not use it: the DT has
> no #reset-cells and no consumers. If reset lines are needed later, I
> will add a dedicated mt6895_data to the driver.

The MT6589 wdt driver now also registers a TOPRGU reset controller:
f12d5facded7 ("watchdog: mediatek: Add wdt/toprgu resets for mt6589")

The driver now registers a reset controller with 12 reset lines
for the "mediatek,mt6589-wdt" compatible, regardless of whether the DT
specifies #reset-cells or has any reset consumers.
"mediatek,mt6589-wdt" used to be a watchdog-only fallback,
since it did not register a TOPRGU reset controller.
That is no longer true.

Since the MT6895 reset layout is unconfirmed, it must not claim
compatibility with the MT6589 TOPRGU reset controller by using
"mediatek,mt6589-wdt" as a fallback.
The compatible list is part of the Device Tree ABI and cannot be
changed later.

As I noted in [1], "mediatek,mt6589-wdt" is only a safe fallback where
the reset layout is known to match. Many SoCs do not share MT6589's
reset layout, and MT6895 gives no reason to be treated as an exception.
We should not add yet another MT6589 fallback whose reset layout is not
known to be correct.

Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
"mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
once the actual reset layout has been confirmed.

[1] https://lore.kernel.org/linux-mediatek/xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4/

Best regards,
Akari
