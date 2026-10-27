Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126812;
	b=xn+b2pL7aNlwfQTMX7S+xF0F2M+AA966CYjj3UJvG5DR98AUuJ5j8Dz/KSdrPs1TsGIP
	 T6zHtzXr0YeNOglazRv0C6UUzX3wHnjglGayWn5f3ZLVxJ3mikOGkmXzHUFhZdauAn5sJ
	 gO9DzAH7fG+ldKaTQa9rRoC5eCclAq3rzPwYKC7iU5LzL4wPGgih0RjsQLs+tiPTMpLUs
	 2PW+yerj8lfhfd6BDXhfOiJVhr6G0PXgranrR9/9XZtHwNdkMy7TzwecRwDpVFpAes+21
	 jo8FMqRI5fENV8XbnXY7EJR2vtLzw6uNwel3d9jrOJx3/K3tW3omI5ihI+nBU1PcuaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
	b=M6GhV83PyF9RglfvdoFPpxUbC47vLE20qJfCXs3RsmVTfyXN71OKLzg/UcgmX32vA5A6
	 OyosXu/yHnkw8eNoJ1ZhNAs07XFSPaB4hKZpnbzqxef23/yBYO5IQT5O/kCLn2sITEnbF
	 Hlwt5ZeBr3x8/sAXdIGo+mjTr1V1dKqeKc3OHARM4pZNnjMmkxQ0DxGS3UxU3DzR/KZz2
	 tJdUSTvPUekEvFQhCQi9AnF8LCkCps1v0E5vACLFIAYNEz8uYLV94fMMlmZY1xTif3eKY
	 LnCHlmg5HVoHzq4OCj/h1PIwtziB7fU5X6nKBF63uCsMCcSQlZWfKluQ0qhNdWKd+Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D54606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62D54606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2G7yvHa
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so281830eec.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126811; cv=none;
        d=google.com; s=arc-20260327;
        b=myFDrpn/mXmU117s9TTHR1m+tZCQmyLg26MhxK11VbpI29aZQ6TgpSYUAsnyXWrvk1
         pUmD9nU5+sd3P3DC7P0pufKCE0uU/ccaktU/h+AjP0CnnpUCF+PgosIgwHZQlr8y3IQc
         1sZaIl5r8t5deHn3nmTstbNsOZkNsTXqG6NVEYj9zpx9rNyMpMVHX60SoOiNqhmsJpJq
         FzMcKeC+VHulJ5hPoc6L55YiImu7RsW8MjQC1NTE8Po8C6NEGvK+cXbywXTzagPY0Fuz
         nc67hWMBt1EKUBQshJiw7O+5338o8clETsv5a0RruHbaSXhnksBt2uvFRXXH4vnBBJ5+
         EBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        fh=gbbKHrgek+hu/tnAgUJ5T5g8PvtlpOQExg9C8fO6Ukw=;
        b=oPaiB9Fl+RdcXgGMJR6x22NoqhsAvDppbtlv6V0LoU7W9IBUIeJGpHmYnP0pf1JQYT
         me4J5v18E1RVBvxyEIZ3AK5M7j9m9Xyg3upgpsPDMbZWu35CtwNGWNZzwbI1hrGjOhCI
         tnKIYbMkoJTcrteEteIKtfu9Q2IXDAmFXBvRuJKJyPvC/OXCFixAUh4t//dceOPn0iEG
         S7HELdW8mSJ6n9svlhU9lBId1Wn2UGDPjzALEULROe3iXqhbzbXG0Vi7qi8cFlUcNmGa
         GnZajpE8MXWWu54ADQkBugu9gubyzkHvgKoGW2YnOirM7f6MvfOQd7/WpZ42cxTgwiEx
         NMLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126811; x=1793731611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=E2G7yvHaNkRxyW5X1e82+KIGXM5YEJiStgrdWIvG/gYSSS7qOXXR28A0GU3fx4B9qv
         39OttinzhaBsa0+GeHKfNbjNJIQz7h3J8bTmFKDp6du7ye2G+jDgrSN7sDv1jPFk/hE3
         o1BW1kG2DpmC26MFXaXofLL6r0i2h+Fh3zXcVQSF6dgwT+0hK7V8lP3VO9F1uZcL04jv
         WAOHHlYpkX56zN0B8hpKiKMIqT9WhrE9BOOBm6VyRUG+uOBWmVMkZeZOf17DJCocnc7D
         FlaAutXsgGENcLxSOMGA3Q3USXx4TGloK5IfEhnjEjIogrCqfYWQq3Kw1XP+nA2Shun/
         sIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126811; x=1793731611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSaqKS2TpQZW7IvyQZH6ojBdMfjkGdBoVNPM3GO8eCU=;
        b=dNrYw+fAE+o/S5F2VTt1cwe/U4DHVZ8YU46uU/jLsX6wvMUzHuKPFb65DMdhQ60rhk
         5t8vKJS2A2M9r6vJGrP2wmH/kabjMzUb0L1a6K+kVai2FbSR+pLi5GNNGikKtln4pK09
         ku5+F1WS70cVmA868Pv8dqvToiQ4daHDgk35oiKX7oI3wZzv3I5cNqmPfZcrHcag7++u
         b3K4mc4Bk09PdZ8D0UAsFHpjz3pIAPeWig0iRgOKY0a+uwbpiBqtdeyTL25fEA3ArW1e
         KP0dImGim+P68t4wGDGJzxLPhbh46FKZdvX4ONS0ozkb8Ry7ZRjWf9jwSvO3kxLvnI4Q
         rdsA==
X-Forwarded-Encrypted: i=1; AKwUvBzwH1b1Zv4mKerlCUZ2hqBObCjc2FOxsPjmSgi9tiyZlQFHgcqHDfjhMXSLIfvPop0RAGUjoeYQcL1N@vger.kernel.org
X-Gm-Message-State: AFq9FYL1W9gx4TpHgCbgYpuj2NpaL+N138iKtUnGx//RdRyFEKXMUrtY
	yoMRljf4d0Ixb9s5zxmZRetzvOH0ywJYOew2C1cJHw9Fw/ME/ArTCCdhw2UTOOXQW06e/U7NSl3
	JD5rbW2bSW6/v50d2EaWTqLbHTBL4I+s=
X-Gm-Gg: AYBFou1yL3fbOFJD0nUA2aTJkbk500bTSyaqQYvMuNe3n4aZHsvr8RhNfZXGTtvDO53
	IJfELVj3fiho6yXQZj3ZJeUxfcYe93yu4Ow8bq3yXaRa4cj/txdb0t1hT3BVY8JX1JB9BIzQqjW
	nYCcTAQ2plcIxNFwKFRwpoA5klX5qQq9WupEIpor0yQMzluCxCQZlFwbmZfg4L+TLgMgbnnIsDD
	PoWzJSQCmodgTYnMIxSESoDcLVHGj8cbuY5evwGEklDSriz9I0eQfF8X/4KnVHuRxZX0qDhVsm3
	F/su4aMtyDgBA6vllqnQXuO6eMQSX+3tTC3mnViDI93oe/aem95Vbqv0yuEfDqsPOPy2pFlz1DP
	mqUz/+aqYk7UoWq7DasyrHbOefOmoJkJospCd0H0HtTZEj4GZzCTgmwmDUdGn/ni9GDmX4g==
X-Received: by 2002:a05:693c:638c:10b0:369:d8e1:7bb6 with SMTP id
 5a478bee46e88-36a203bc9dfmr355408eec.25.1793126811403; Tue, 27 Oct 2026
 11:46:51 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-2-clamor95@gmail.com>
 <179312433904.199157.11834547028241710753.b4-review@b4>
In-Reply-To: <179312433904.199157.11834547028241710753.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:46:40 +0200
X-Gm-Features: AclHuK-EdXsdf9foYz2HdBUkkAOJoPmsThEgknyKq7DwRpVYxIMIaZENdpZib5o
Message-ID: <CAPVz0n1be44e455tvaowB5H8mrYOyTyWof+PS-nmf7W5VyAtQA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Maxim MAX98088 codec provides a single DAI cell.
>
> The device has HiFi and Aux DAIs...
>
> > +  '#sound-dai-cells':
> > +    const: 1
>
> This makes sense for the device.
>

I must have set code correctly, but forgot to adjust the commit
message. I will update commit message in v2. I have to adjust wm8994
codec anyway.

> --
> Mark Brown <broonie@kernel.org>
