Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994791;
	b=f5Jb1qjzJSveDoaJRRCBPsKt6n1l6lsxT+1r4LGmLRZmtLxxMsQjPMKpItjlyE38Rwcc
	 oTX+wrMhhP9KD4ceVPK4RB30elKRwAiS/+/fK+uL+tDLlXIf0SY+gI+2g6tFXHP6DEsPg
	 ScegL6kd1VaUuK1tbqxvYrJD2UUbYNSrcHFMuI33o5X7zCqj9Db40oGa6tFuYjjMZMu9X
	 K8M5xrTmtXlTZZtwFH+DVeMRTX40Px5eHvEr3SyQlGmRCZIQ5IXGIMIVOhWe9YJaLu02d
	 TJyLVDRYEsD1uFQZW4XpqBXuxf3kXa+uFDOQizp2+ShdccKliSOwjjLvXPLHjHRpjpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994791;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=+KrsHl34xJ4ftFSv/7lL7KykdHlw2pIpbgJEgLLYEHc=;
	b=5MpV01vRAkh7DKX4AHRQHv00NwSYDcKEYEOInc9JnvD7LAEe514646mv6tfbTI38clii
	 /KzStpARWG9oHiwf0z6qh+hXOA4ZVHDs+Lw/Vjcy2t3w26yIOtoqGvmiIGowAA0LLSpgi
	 waFpBaSOzIuBJQQCzsi0d0Oy4Y254BzMGc/xhvZUALnkUtq6g2J6KSWEFEBiFG0jd4Q5t
	 +ypIZwbfMBJivwkP6hGJiY5PJjseOw+4zyVHnDdZ4qfJHDAUxTmZYX7pfrpHpF6N4bKMP
	 juG6Emq5pRbU5yPJ+Uk5NoyHTDbkF8dYTZegG8S9qad7vRyzt9J6kOTlq76C98HkF+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gNF7OGQa;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44003606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44003606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=gNF7OGQa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E1034E4158E;
	Wed, 18 Nov 2026 09:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1049B5FE9B;
	Wed, 18 Nov 2026 09:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4396A11BC0C99;
	Wed, 18 Nov 2026 10:39:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794994783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+KrsHl34xJ4ftFSv/7lL7KykdHlw2pIpbgJEgLLYEHc=;
	b=gNF7OGQar5n85yZ9W8CgOBOMsPJ/OfYjOFUvxa7twze7oRzfdbx4piGWEJfsVqO2MqWeny
	SEU0q4b9XThs0O06K2A8P0zQHuMBf8GeWgRAo+i3D3yXzX5D330ycMEdWboEqh6z06AZEj
	r+6QxCOXrN21G09/vBO6lm6p48TC2m9f5W4hpyYFqY2zx8kSuQcVBUr8FLODOJmYkbFJAN
	8Yvo/n9yNbYt5nJHAS994Y4J5K2glUkxqdEj+7gWorXJyBQ7AldY/oORykZoMeEux1afvq
	x1xCtujGLMPJtwpy/quJrZ+pu2YV4Pqw/m+YWDLmNptosVgk0dAgR2eUfsvpnA==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 10:39:37 +0100
Message-Id: <DMY8JKQSCVRK.2ZLAAS9PECBV0@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com>
 <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Tue Nov 17, 2026 at 10:09 PM CET, Wolfram Sang wrote:
> Hi Paul,
>
>> > On second thought, any reason we don't want this enabled by default?
>>=20
>> Please see my answer to Geert [1].
>> After reconsideration, maybe it is advisable to enable it by default. En=
abling
>> ECC is done by the bootloader, and it might be better if no further acti=
ons are
>> required to enable it kernel side.
>> If ECC is disabled, no errors will be generated, and the capabilties wil=
l just be
>> set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

The EDAC_CAP_NONE reported in the struct mem_ctl_info structure if ECC is
disabled is just used once in the EDAC subsystem [1] and is purely
informational. If ECC is disabled, no interrupts will be generated in case =
of an
error and cdns_mc_err_handler().

So there is no risk of any side effects if the driver is enabled and ECC is
disabled by the bootloader.

I will set it to enabled by default on the next iteration.

[1]: https://elixir.bootlin.com/linux/v7.3.1/source/drivers/edac/edac_mc.c#=
L125

>
> Thanks and happy hacking,
>
>    Wolfram

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

