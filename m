Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6903CAE72
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103799; cv=none; b=SiTIryRNJ6+pdorTa0/k0ike8PvFrVaqJH/ll3MO5M5YpozD/VdeKl6/85EStqanFMNWh7TgMd4RFHsNyXqiQAVV2oSXsTv4IREShGCN8qRFtW2OkAwM5AUUOAXiUqcUKlYYkuKfCK6aznebD1mtPCdgL7aL/huRK6Bfv2vNChk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103799; c=relaxed/simple;
	bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jtcLtIbcYlsw6PD0DAK0ShS9iBRzhc37KxSFp7dFAzN7Tr1M5M8qyu2Y3quXZoPBjRbch/tVuxuh6hpxz1lNo+24uvziWXXn0ePXA3QQWBtmGEvE7adSoq496QqlPyCIldeLhK/B7zBr85odAfgSJ1C1KV4MBxMvR3Nh+tMbZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSLaogIl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSLaogIl"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so21940825e9.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779103794; x=1779708594; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
        b=bSLaogIl4oDAgpaCxp6MbqYJ5MvesguldfDmf93PaMI/jqam1JcgUKGHdqDKeKsqSV
         NaDMx3qxtS61FD/KMdKbjAvemc8mihqE+fIvXvPhDp/anPMtYcYrVgb00QUJK1x8r701
         k2m1+e8jB/L/1BRoYlLDPeuqsehwNx1FG4nCNH0cjQ2uPLyzM5Pn6tQ4K4hVWHcplqIT
         W77eSCFsbY8LjxusxZ9y6IBhKf3EXGoxwU9baA0VQ1uODRnIwfCRmAJ1M0e3hAzzFOUA
         h56LsLshnROsFYUcvLxPtSdZzR8t/tKd60Ym9Tz8/vu//kQLWnKHlMcSnHn6rmzBExC5
         RTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103794; x=1779708594;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcf2oqn9+1oTrvHZKQuLXActXOhO6WFTaxZkBm9KmB0=;
        b=ZsxSanSnsUXwfCDpkd1TamM1kG+gmRsD7smL71rglZ12iy3jd62PKsuMLHOaWO0/hk
         Aovf9GDvY446xzMikKqraRqJUM2sD7VQefbigBezGJjXBLp+SKwosaVozpNI7/v3HVLN
         crB/YTtZKjk6+EoQ3/fRt7eloE41m9U9+v39n9QgHgOh/sdaewKmtpr7LUtwTfBU8yVG
         d2fOlf/ZGdv/cKZN2JFCA0Vcz2KSJUlfyRbF2uzMyC3V+So1n4MrvRd9x+KQ4bzWpT7C
         8jprdEXjYlLS0bMspix1W5lYSMfjfSlm7SGkukops1WXzEvLh68RzwIr0QTDJ5eiEa+s
         HH/w==
X-Forwarded-Encrypted: i=1; AFNElJ8ucM8mKU4l3y0EfV/Pgf6b9WKBGaSWXVBbodTYHqgOIOwMaNu3VG0M484kyUGU9XtQDIH32m9WDg5e@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/sEzo/vKHbTvXgPaASLaxnjoBRtoBvaXPVkASKG4Ha62xz+T
	aKLC7nccpnDueLshCiXo45K8djv0thCAv/smVechccf3cp4zPsuhGhvc
X-Gm-Gg: Acq92OFaX/WlslO9CHLvfA1cwIjNAVHNF5/BUYdlQrmeS7xRhKWtWaknLaHHYeHDcJd
	Y1N0uTZidhhbREoPSMupsXgYLsJVNIvh6AFUCXFHjDN3jfUCPllfpgM2yowLA3sy0RH76phiQx2
	rq/0xXZgGIUkJDtyvW/4P272q2dc6FCZDSaG4YCqyocbZ4Pdg7ZjLTIo7InCdE8JTCNmEpAbZL/
	L3sD6e+kxTJaC55CR2RFQbBYjFRaXkU2PfLb/grjCiGQWvW1q7tCUNnJjxxE44EUnEp6AZGeNU9
	28T+10Lbdx0AFEewimMh9qNB4pQvjo5SmmRWlD6NRViQEe5ro3G89+Jk+05MBjd2QdbRQnMgz7d
	XJF0FAtur+7A4OcuJbOiz2I/dwO3O5EeOBdJqzAlX+dvT3a/8yVZ8NvOcYN9waME0cXjJjt1DkS
	ccGTtZDB+JOv2rsbHV7tSJTXr6QNMig+GvtsCssdgEspkHVYocfmyJfjHNnYQniHAmJiihoA0Mv
	fk=
X-Received: by 2002:a05:600c:8184:b0:48f:d1b8:9aa5 with SMTP id 5b1f17b1804b1-48fe60ecd7dmr220286485e9.8.1779103793402;
        Mon, 18 May 2026 04:29:53 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm80885505e9.13.2026.05.18.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:29:52 -0700 (PDT)
Message-ID: <6d8659f393e0bb4f0805107a17e306422982247c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 13:29:51 +0200
In-Reply-To: <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
	 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
	 <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
	 <14a7e289ff5ffed8fcd6dcb9b2e8455a1b2c9420.camel@gmail.com>
	 <256b1cd8-b143-4f71-91cc-8513be04ce4c@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andre,

On Mon, 2026-05-18 at 13:16 +0200, Andre Przywara wrote:
> > > And anyway, I see a *dual* USB-A socket on the pictures online, in
> > > addition to the USB-OTG port. So where does the third USB come from? =
The
> > > A133 only supports one host USB port plus the one OTG port. So is the=
re
> > > an USB hub chip on the board?
> >=20
> > There are two hubs, one on each usbphy. OTG side hub is even bus-powere=
d,
>=20
> What do you mean with OTG side hub, exactly? Is there a hub on USB0? How=
=20
> does this work, then?

the upstream port of this hub is wired to the USB-C connector, one port has
CH340E USB-UART on it for the console, the other port goes to the SoC usbph=
y 0.
So it would be "peripheral" only, I suppose.

--=20
Alexander Sverdlin.
