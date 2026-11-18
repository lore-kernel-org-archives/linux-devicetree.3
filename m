Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991656;
	b=0PMDVy1GNSwEawllNcgoKzqmxbECFfXEPj7zDR2I/7b17KVscuOhlsZitDhpviwCm1mB
	 QXHBeO1TF4Qzvdhg/cc8h92cLBTuQckiuzPFjn0XNbPKMuiJC+zFdrrosX9QvrOJ+8HZV
	 1dBz4j0dHjzE6oeEt8K1NeWRLoTTpyO6OAG9MjnhXfwfF8+lHKGW6WlZffIDlm7EohWyZ
	 eQnrSWMe53lwwSMibTMrF5S9kxe8stAoIlcnx0tBb3jS1dIkOzf1FqK1004BQuq+IWKEp
	 NLnZmQMekKPUCKh/j63xOoYDLvzwm6YjLmYXPKIyt0Hik/wVN38DWMlhQ2HJnSvDt7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991656;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=kGrHNZsv8k17WyDtcN0KoKiEb8AAC/oHWu//7fo5faM=;
	b=DpugTZWrR9ZpMXXiSOmvgMa8eVReSoYgfB96LTRMuU4Ej/tTV7U8+vwVMWuaSESIuWd3
	 hWbzu7WnykL6Lt00ZiJulXjR8gwrNQYicZBlkFkKHixsRfilASDcUE1iyMUWhbeuaodg8
	 Ox7+MXZ9cIOfXvsBj6s38u3Sko56wZctJQI5X0vfF9BNcQ7A+LnutYEyG8ErJztZ0R2lQ
	 p7hYxhLRxUA1Ug+ryerSMkEk1tzuOcjn6TjFh8b+tTobFGd0hOK5OAPQ47OSKEwd8wzxm
	 E3OxeVFV1GrIoqaHnFRek80Khgr6fvO94HX0JGWEZGmWMorchuYua0jlmRRFaypSi6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SefnjUk3;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE1606A32A;
	Wed, 18 Nov 2026 08:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5EE1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SefnjUk3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3DE0E4E4160A;
	Wed, 18 Nov 2026 08:47:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1107D5FE9B;
	Wed, 18 Nov 2026 08:47:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED02411BC0B1A;
	Wed, 18 Nov 2026 09:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794991653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kGrHNZsv8k17WyDtcN0KoKiEb8AAC/oHWu//7fo5faM=;
	b=SefnjUk3W69idot9zlT4yJ6DKWi198Tgr1TgEoP1D48Q04zWbpCJZjGgCen4SwBPVj4ljf
	/yEc5B4h7eMQxoBBvjOCc8vFCmdXgNxXbQ/IOTdXu2/lBr5NoO22F9tMShnqbvThwWk4++
	JUNOnk7jleWX0Y+Y+3htuXY5KEj/tp2U8MuO2H8lmPX1pFW2fnQYFrSolgPSOgvva1n7dO
	Khu9BQsdc8WSUq5l33NU6LEB+MxV3t8JAEEQQqtOejFev1xDk2O1IQNcvsfZs61x0NPPQ7
	g6oefbEVfytz21Eo9SnxDoHzGt7mUwxYLYe8VO3pH/W7qf8WODOm0jpAL/mBCQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  devicetree@vger.kernel.org,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  linux-mips@vger.kernel.org,
  Hauke Mehrtens <hauke@hauke-m.de>,  Aleksander Jan Bajkowski
 <olek2@wp.pl>,  John Crispin <john@phrozen.org>,  Sebastien Decourriere
 <sebtx452@gmail.com>,  Yangtao Li <frank.li@vivo.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
In-Reply-To: <5155531.6YUMPnJmAY@prime> (Simon Wunderlich's message of "Tue,
	17 Nov 2026 17:45:36 +0100")
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
	<20261114100608.3432120-3-sw@simonwunderlich.de>
	<87fqwzn3tq.fsf@bootlin.com> <5155531.6YUMPnJmAY@prime>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 09:47:28 +0100
Message-ID: <87qzgijzkv.fsf@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3


> About physmap: you were right, and this was actually a great hint. I test=
ed on=20
> the my RS123: with the EBU swap that its boot loader enables, the flash i=
s=20
> simply a plain CFI flash. With compatible =3D "cfi-flash" and the generic=
 physmap=20
> driver, probing, reads (identical to what lantiq-flash reads, unaligned r=
eads=20
> included), erase and write all work. So this board needs no lantiq-flash =
change=20
> at all, and I'm dropping patches 2 to 5. There won't be a v2.
>
> Turning lantiq-flash itself into a physmap variant for the boards with th=
e=20
> classic U-Boot setup would probably be the cleaner model, but I don't hav=
e=20
> such a board to test it, so I'm leaving that alone for now.
>
> Thank you again!
>      Simon

Excellent, thanks for the feedback!

Miqu=C3=A8l
