Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789510;
	b=LuIn5++N5PhP0ByGbG6uQIXWQiju5KnLcTxRkhoD18i1pA6BSneyyzLLK20nlW9eMEq/
	 g0GUTg9GU09ekMCpjN0KIpkNPz4je3L+T4DV4Lo01cPir/tJGS24zu0eTUMc3t+jPib28
	 fm7FELoiym11yW8qNZonW0dIfaxELnNBgmszhAkYzjoZa+4S0bMupBkVB8qSxcn9dAE6R
	 ibXw4Q8HR3ygw+VEeFws68J4ImG4szu7In7vkqGbifrEX2buTS039/b6YHpl1RZE2qEFB
	 NEkT3Xeyf6VjEMd3+FL/ccGBTmya6iP7mqWd6qbpinQ6ZmWENMhMYMNsmPi5UGCVx/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789510;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=o5YMEpyPVMRHq3R3jE/xM+ZLo97uZzcZNi23LeKuoHA=;
	b=4aUk6gWnSS/SR883prMJAsC6EA5uVBHZCA+VhViCI5ObDDLiu+UAAVVIaEaQj97+/OkR
	 HJETtpauPqGHVyKNvurz2i22UiUaT/0Fc8IFuIDtznrUL3GLr3656czsa8DVREtbCieSC
	 /yirXq/uQz441qKa2UftBnjGVOlF0lixgB5TGok9SuGBfPQRV0Ilk67T41gkGOKeEHWBt
	 Fp5MB5ACVfFZTg2R0Ipw4ekMOArTEAa0YoD1xs1yELK3r1y89DoRzJYvquErgUoCdUVYk
	 rR902q8qvTr7Lz1BSxiy75TBoHbq2r+xOCsubNlOtqfijaZaTNy1mpDHCtISJkcjx0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QIryK6YP;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE2606A6AC
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFFE2606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QIryK6YP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B60AC2AC4D;
	Fri, 27 Nov 2026 14:25:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71B156049C;
	Fri, 27 Nov 2026 14:25:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37EF711E69006;
	Fri, 27 Nov 2026 15:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o5YMEpyPVMRHq3R3jE/xM+ZLo97uZzcZNi23LeKuoHA=;
	b=QIryK6YPTIgydwV4pC7EccY920APC/caDdInW75e99di7b5N5q6nalwfbeM6A54FBoZAur
	+lgMtkrmsr5ahz1MVU53wRcfR2doH80Y968uVo608aDISbm003902nqDVEs2S7N3fOZMnU
	OOmFkapoF0wwZLh4KEL/OK1xeK1YbY0DKetBHBNvXiqLPXbf0ysfizLCjFbvOnPsb0zP9i
	dzpFw/D15adauAkNOV8RZ/TDr86lNw3BtvO3wss0HXWP5KMk45AKwyg4NJdbIZrL6uUZx4
	RrKIvEXMKcOtCrbsXfVmhLF1D6Gg5BAxynVUybydS+p7vsqItDTRCxm9Zj9wZg==
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
Date: Fri, 27 Nov 2026 15:24:58 +0100
Message-Id: <DN628YQ8UFG4.PF85CG1FNM2@bootlin.com>
Cc: "Vladimir Oltean" <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Jerry
 Ray" <jerry.ray@microchip.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bo Mellberg"
 <bo.mellberg@se.com>, "Pascal Eberhard" <pascal.eberhard@se.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next 0/3] net: dsa: lan9303: add LED mode
 configuration
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Andrew Lunn" <andrew@lunn.ch>, "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
 <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
In-Reply-To: <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 26, 2026 at 3:52 PM CET, Andrew Lunn wrote:
>
> Sorry, but NACK.
>
> Please use /sys/class/leds, with the ledtrigger-netdev, and offloading
> to the hardware.
>
> 	Andrew

Understood.

I will send patch #1 separately also.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

