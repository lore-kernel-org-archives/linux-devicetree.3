Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948952;
	b=q+ZQOw7U500wdJHZsr/4wSKJgHPTEgmxn3m5l+/5MgBaGixalccN4upvM0erJpRXXjg8
	 Tprxy6GxVM96ZnvfcvbPFo/+ixwcSswPHkFbja8rp7Gn/uWFF7VON/+xdaAKt0qLXghuY
	 9/rPBm0cYwBX5PQOoRRk3mMliZkPNW1yg/+hv8jhsiOQLujcVXPyxE5OtskMBX+ArWRag
	 b7ErIyzM9rG/TlZN5wzb/cUqJVoCHx3h4Kfj7OlTNWQuOJFd/Ojkbl9XEb6q1bqMAS/b2
	 FazIHynC3e0iiIHrRvUj49wr4Udbh1wGIhDxxSho2SglFlaSksmC9zCu/eKNkrHaZ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948952;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=HZkll7EezYeBdMYzyeDR41vXh/rItYPkuvoaq3vI55s=;
	b=ot20hu8P7b2u7DfXkA+0yJEfWEy40wCEUJKRZc2lw2MCza2h3f/KosBtiZQrFgCD528c
	 EmwUixl4S5WTFAfhc6yBBNYVoKtOx0AfiD4ptFiQQX00kbcWJ1RR0+oKssLPoxYGAk+cb
	 b3WIbHARP8ntUt5xhGnOIpICHdnQEdDPa3XsXzpKaDNCa3gzEUQfPmjqN4HsPqai7QNPJ
	 v3Gg8VNN7gCeXUZOahw/oiyiB77DtMgmhQQCUtaJjMuoADrbDxmwCBjL6yn3NOxKLL/k5
	 UINomQPBUXlXf5OHEIztUhMkGtKtzqc4d6TcoidbHvisR02S32FtXf1w3z4mci/4Wvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ttemJq85;
	arc=none smtp.remote-ip=109.224.244.27
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9B5606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ttemJq85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794948949; x=1795208149;
	bh=HZkll7EezYeBdMYzyeDR41vXh/rItYPkuvoaq3vI55s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ttemJq85Lx/HQJXgd4ocT/fUrs2E3qjkRxVQvJ+KompJqeCMO3/dRRCkKZ1HoNFgl
	 KDVHAPHyPz1StnjNwoc+egzCKRXdb1fIdy11Kcyqf0nQeDrjMeMAd7+d7au5rpjHYd
	 vj0HWq3huEgjwVOs8WX1HJxGX/7L/H8XwtABmrjlYVcNaBKKoNVExtH3HwlcU9HxEI
	 TxaiokysznrhpwJoTg20K+GPKHHvZi3mxqJgZBZcPBiLOtuZoEsOxoTrOF27/lUHKk
	 AzMwNlNbyziAvw6BZKV7LPHKeLV1rEszoeDxD2SNVZHbBIM5loah2hZrAGf7mUFCOT
	 TQXHd32elahQg==
Date: Tue, 17 Nov 2026 20:55:43 +0000
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
From: "armandas.kvietkus" <armandas.kvietkus@proton.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Message-ID: <uj-7TS37Pvz6jDAyxdOYWJwLDB0LJ1NU0fxtvAdz6W5_mtR0uh4B5U044_IosBRKBu3Dlp0pR5F98Tf4vQlUwJ5cI-enEmTdMI-Y1M0VL8I=@proton.me>
In-Reply-To: <PN3P287MB2188EEBDB68A82967833C8DB88772@PN3P287MB2188.INDP287.PROD.OUTLOOK.COM>
References: <20261011-upstream-s5k3t2-v4-0-d33b12fb3263@proton.me> <20261011-upstream-s5k3t2-v4-2-d33b12fb3263@proton.me> <PN3P287MB2188EEBDB68A82967833C8DB88772@PN3P287MB2188.INDP287.PROD.OUTLOOK.COM>
Feedback-ID: 164226125:user:proton
X-Pm-Message-ID: 4bee14c2957ce7b0b86c1d83645e491b479fca16
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

Hi Elgin,

thanks for the review, and sorry for the late reply. I had to replace
the battery on the test device lol.

The repeated 0x6028 writes come from the vendor register sequence. I copied=
 the tables as the vendor writes them. The second write selects the page th=
at is already selected, so it does nothing. I removed all four in v5 and te=
sted again on the phone. All three modes work the same (thankfully lol), v4=
l2-compliance passes and the frame rates did not change.

Thanks,
Armandas
