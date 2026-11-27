Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802089;
	b=tdLZKaQlt8ZKEac7Jpwe9qhnoAxKR7hYuRgEvWHeIiRZezk8sNIlCcaXa7lxKhhdIU0E
	 hpOvGnp0tp9nxlDhaOliYkVu+AviUbOOC6h91in75fNosVlOGPqq8W+jrGqgvd1zsE+at
	 r+wuDJYU2xAZ8E1EwBKHAhQgRLKBbRkJWxRd/h1lmoibrIXBjGiw2Tqthy7830KIAlyG0
	 o5Fo71dE2F9PaHecHEqtM4MyNC74Z44Pj0VuyebgGhTLwvH3Az0pvLS2nXFsJRMvagua3
	 /o0p7ss/vyK29hbiC3PqlupiT35JWvb9yZjTtln4bgq0tC/02ORQwOKY4MpFKnHQdAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802089;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=MBpzvZy2ZJyn1GNW1kPyufscZwT3WxGJxcs/46l1sms=;
	b=Y+PZZcwMAcvhefDRG6rkfdGvmAKjzC/LHUmpWWGK1JFIiiJMRYGMSCoC384JUdxYkXyM
	 BN4jxLc/gMwFk5y7xhxhFis33wCl5MHcTCK9Uim1HT49CQd1eyrc1gUTWJi03j+US9Nef
	 cQgG4h+neimHVYkyLiUj+r2x7fAH1K1/OvMVxzRGVkBE3fqBHb8Z9B9gN0LJOHZGmw5fC
	 prDya3XX/i5wFvVJls/+CbEZtHNb+ksKuWV7/z/8B4jti4cTtVs+8zFqnb/jzLCHdkgRQ
	 4nOE50w1nI0yP5FE0U2SmHD8kt0qnDZ5sYYPu5KthFIP5i5dj9oZQEQCgwMSOECVe7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WV9URbfw;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91277606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 17:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91277606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=WV9URbfw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795802084; x=1796061284;
	bh=MBpzvZy2ZJyn1GNW1kPyufscZwT3WxGJxcs/46l1sms=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WV9URbfwJWMvgppCmeG6dN9HfAo+Ub5JejJNz1mG5l2s1pHBb6LLnUTPg91VaoXxa
	 AeqhPesz+uhW3OQr16xDEpUWGBK7xxCLx7jRe+KJuwQ4jkMoZAU9Z0j4hkxew5lZ4G
	 XcOgLet77UWkXaBlgg0YplyjpEky6wY0jTt/a2Lr4k16Q3Gd1MO12yrxi+zbeEaOPP
	 I53M8ClJVixa4hSKKagtCloAK/kauHedhsO2bgbaY/uh8LmQmSFB++1oWti6PEQpue
	 oARtboOlsJFB8JGPu6koj8BbMtoSQenWlVSOTTeXy86qzXKXmSdA/Y+AYkQFx9TZDY
	 4bNHSFUGl40WQ==
Date: Fri, 27 Nov 2026 17:54:35 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Jerome Brunet <jbrunet@baylibre.com>, =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
Message-ID: <0ZiLi25XUh_mAaMCw_YhXS3YA3FIj89dJfHVYgxGcBS3a5biGYvczbtTd9O3zus2A5Q1HQMkCaU7I9UU6Y50VGIZ_ltPsKx-7lHvtFtYcVQ=@proton.me>
In-Reply-To: <682cee16-d56c-436a-8661-0cf511fa2e78@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-2@gmail.com> <p3YaXlLJTguQBGnWyMpb1w@gmail.com> <1jld6eldic.fsf@starbuckisacylon.baylibre.com> <wzwsbUKM-fEhYpTIhswvHly5oyuMCPDOExJEWjbSf-OS3Lrwx2H_l9CUfuMITJUK5CyEz4pNojUFRzjDDczUQmX_LmSWwF7DVSceD34XeHY=@proton.me> <682cee16-d56c-436a-8661-0cf511fa2e78@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: e8432731c81dec984c084befc90a1a96ab850531
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andre,

> What do you mean by that? The proper solution is to *create* a new
> regulator driver, either embedded in the pinctrl driver (make the
> pinctrl export a regulator device), or as a separate driver, using some
> pinctrl provided regmap.
[...]
> Are you using a different approach?

Yes, a different one: I only meant that there is no PMIC regulator
whose voltage could be changed, the switch is inside the pin
controller. We went with pinctrl states, and sunxi-mmc selects them in
its voltage switch when there is no vqmmc. It works, but a regulator
mux exported by the pin controller, with vqmmc pointing at it, looks
cleaner to me and needs no change in sunxi-mmc. We are happy to test
that.

> Do you mean you use vmmc-supply to point to some 1.8V regulator?

No, vmmc is SWOUT2 at 3.3 V. Without vqmmc, sunxi_mmc_volt_switch()
returns -EINVAL for 1.8 V, so the card stays at 3.3 V without UHS.

> Is that a timing issue, maybe? Maybe the sampling happens only so often,
> and you just happen to miss the change, occasionally?

We cannot rule that out. We read the detector at every SD interrupt
while PF ran at 1.8 V: in the adaptive mode it said "not 1.8 V" at 2
of 90 and 6 of 83 reads, and with the mode set by hand at 1 of 99 and
3 of 103, where the card stayed clean. Right after a switch it already
reported 1.8 V on the first read in our trace, so it does not look
like a slow detector. The USB3 combo PHY points the same way, as it
shares CLDO5 on this board: with the PHY running the failures go
away, and in older traces the detector said 3.3 V in the first 25 ms
at 1.8 V at 2 of 76 reads with the PHY off, but at 0 of 1137 with it
running. Those two traces also differ in kernel and DT, though, and a
run comparing both in the same boot never happened.

> Just to clarify: "0 of 40" means *0 fails* here, so it works?

Yes, 0 failures in 40 rebinds.

> Do you mean your patch just badly hacks those two bits to do what you
> want, by treating PortF separately, but it's not something that looks
> nice and upstreamable?

Yes, it is a special case for bank PF in the pinctrl driver. With a
regulator mux, its set_voltage would be the natural place for the
same order.

> So according to the A7A schematics VCC18-PF is a separate power supply
> pin on the SoC, and it's supplied by CLDO5.

Same on the A7S. There CLDO5 also feeds VCC-PC (the eMMC VCCQ) and the
combo PHY's analog supply, and v6 already references it as
vcc-pc-supply.

> But this is a firmware problem, then? As 0b10 is documented as 3.3V,
> which is wrong if you use a 1.8V eMMC. So doesn't the new pinctrl fix
> patch overwrite this with "auto" (0b01)?

Yes, it is a firmware problem, and yes: with the pinctrl patch the
register reads 0x05555555 under v6, so PC is in auto. Our boot chain
writes auto too; we set PC to 10 by hand at runtime to see what
happens. My point was only that 10 on PC does not behave as the
adaptive mode that the manual text gives for C/E/K. Whether U-Boot
fails with it too, we have not tested.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman

