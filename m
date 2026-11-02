Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657096;
	b=cf/4EVVqlqYoFxKFp6LIj9p/HuTEVi3YNjL9m4dfWije+Ect7DEKesdE6inqOiJeAHsA
	 SQM6MMjSHezJyD+3A7Q6N1FUpDUPl8GJA38f/wCIlMcvlzh+jFuOzgiQFJ/nw3MJHPJuq
	 zY1v922I/vI4iDwzZ6FLK71JIVAFcZb8OmwnhA0ByCYQh5jOO1jjCBZtvruV7cBpL28Po
	 fkVWqpIvsUaBYBAZUPxBs8tAbV+tff6bTr1KwRa1aJn6hkVUK2gBb7WM3T3Z3S1y52ZB2
	 9DbmXA8StORoaAIDVqeImkPcPjKJjLF+9hsNFY9b+CCOnn1EIu+Jbahmi6Y+H1PhNdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657096;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rUheGWlZY0Fw99KiB4LeUAfu/tl33Y1wkijZEqrb6QE=;
	b=SVSh4XtbHjmM8sb65qjtOm1MSFUwY8jGKxcjvlP5N3iBjlk0LZFI2A5+jisy8GETlhJe
	 WfbsFurBx+VqVN02K829r6KeqUA8A49mg0a16Q+pZocxoihISDKS2tuL1CXOQWBhunwOD
	 wRfpvWJlRMNRbmIucfrU/oFyQJeQNMpXmr4ZsiK55Kr+aa+uTAGh56ZQ4ZOh5dvXyPmNf
	 YuTOdwE5s8A31Ysou+0zxPP0gbjsr2/69fCXBndN9cP7WzYfcWRvaZShzmfnbWB3/+/Bw
	 TMSSIFHowJCuWdewC0wlRLAjUE84Vagct5YaTrbhHrgcHoM0frZBdvUlCPTrck2aCOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=GF0+vU36;
	arc=none smtp.remote-ip=109.224.244.29
Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED0606D804
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 22:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91ED0606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=GF0+vU36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793657093; x=1793916293;
	bh=rUheGWlZY0Fw99KiB4LeUAfu/tl33Y1wkijZEqrb6QE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GF0+vU36Cy5INsapQ9jEPsZ+LKrAn+Dljr84EryO7IzlckW6ZbUcTr304IS2Switg
	 qJ2yex/DQ6gdEMX2QcwX2GU1dj4G2xMBsRjQbc7YloQDlQ6bPSDX4ARf4+LKSOdN2A
	 OUwROGQxWeqrEfBOlG0VvMJLOvHZBPOPEI15KkYKTtWXN88Gs9ZtRZIjnL11KXwWQG
	 uTJmZ9vQHVqbYIlftPZRe7p2Hku7tLt/+Lffe2DiOc01qlDyt2+a6N6kazgLr4uKR4
	 clv7GX0bToQQxlYXsQ4GZ8+8RTo6DSM4AYR9Dslpip7VAVzqNuvP7tMujmBiG4FhRy
	 pP20K++uMRriA==
Date: Mon, 02 Nov 2026 22:04:48 +0000
To: armandas.kvietkus@proton.me
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] media: i2c: Samsung S5K3T2 image sensor
Message-ID: <XCb3u-2QvpbqsiIpiU4KXIVLSRrhUMk66AuWzyq-g_87b4PYck2zK1bM_jV0Jk3j2qVqbLqsnmXoSv1pWZ-eA3vC1sX87APNMyZoC2xS_vM=@proton.me>
In-Reply-To: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
References: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: d7cdf3858a387bc88c297cd533e2a85d5c875641
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

Hi Sakari,

Gentle ping on this series now that v7.4-rc1 is out.

v4 has all your v3 comments and Elgin's. The binding has Conor's ack.

One question from v3 is still open. Should LINK_FREQ stay read only
and follow the mode, like imx258 and ov08x40, or should it be writable
with the modes filtered per frequency, like ov64a40? v4 keeps it read
only. I can change it in v5 if you want the other way.

Thanks,
Armandas

