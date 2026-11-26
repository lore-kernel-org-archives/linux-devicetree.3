Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716556;
	b=rQ/+4Wkp/gVyehA1wqGOgFr3X96BASoPOJ+FC2HVNlmPImIzl6zTEcFrj055BoQee12Y
	 PmHvWnbj/nukJFV4pluFE7hMoOHY9CXUaIIjZN6vwUVupNhEvER3XWNfK+g7rstcrHxfs
	 Lnns99hzo5kCGg5eOGb6icSoMIrqu4g7mdlM3725HUM1yw8eVFrI3b5Us6bHS/62fPqjQ
	 wbZgI3BwQVtRGh2PJeStW2QfiHy3HgHQtOoGxf4lzbGJqbZ1BgUd5uUMowSaMx1vDqPQ5
	 AyXpMKMYIHQl3lJloeHnlZzoBFq0p2ZZE/hAa7fFbiq3S+hg42kp44bHion34nJBSCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
	b=LPyh3eTzUHu8VSWg+Q5irLYqyxvuj2ejNGfWVPpk0xpcDOGG1LpeCEKikXftUgSdvFlR
	 D5zXO4gEm3p9IkRvCS+w2SeUuw9akXJHvGQYvc8eOJ2CLQV0lgS5ucFBXVYscGJbLNPEu
	 8Q3cwy4/iF5bF4Yn2FkqIQ+R+6JD2lO2G586t0VhASN1oRaSF/shuEMR7E9sPJrm8Sqgm
	 lbCW4bKTBGYCrKKy5gpgkkQrOietj7pO2yjRa9kIKRckO6A/+pkdPtilBP/qIO5cxvDBz
	 jSltKpRBXTAAgjAGyHIcVYlV3IYMfP1VwdIzlz6Mb4v2hK6GdK+PWLBcJI3uQ6Smd9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4ysYqZI;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA8606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBA8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z4ysYqZI
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5163838f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716554; x=1796321354; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
        b=Z4ysYqZIi8yTtEsGaz3PJPdELo5yah/1bnKBGrQNdDouR5yhyfZgAiqVpFk2dXVvNR
         saVwKIPGbZ0WHF7+ScrB7Nn+ThzlMcjK4sI+u9ysAQpkDXIRhGd5iGa5sRNT5BEVUHlB
         51yQUuvr1KzVN3EJl2MorHrHyXgbCLCyqu0ZAJMTHy2RlgdvtAa6A+w1+9nkA5RU5Jkw
         zAqsyMWKeR50HjRN65BXcOyLcE615jvvZHikjzc/kq2xvqbbMYrUQ8mRrYd4LbcZJye8
         dsDComUeHBZAMqWWwMe+eda/TqBmk9RUDBNQ56KOGC4Zf2HZYQIDV2KFGcx2+oYZP+f9
         K7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716554; x=1796321354;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
        b=H3yIFSJD5+7i5J0bSeehm9scIzur1mI/FpiQVis3mpHVg/2VvFNQRe/MDEO2EllK2x
         vECMAjMIAxPOUuerjjFvsldDATWmIqrgbiZtMzIOYX06LB4GblqJcbFtWLwQCpanYQMC
         Q8vrTKHFz0mkwLBx9MbVpGmB4o89pdHqutlw8g9jBOlKjgFQBhJyIndRHeo/de2dilfK
         8S0xTyX/7NglN3o4wgpoREK2SG9i1Nk6DKLMLfP6jCDKkAM/4ijnraEwW6C86gYecDLf
         CRCVYC2KjK9OSujNlXznyCPZ55WysUC8rBEfmwN5LqNPgxMuRKESBePWWeLQbjRti6lm
         eelw==
X-Forwarded-Encrypted: i=1; AL+hErFU0B0hjVGmznWiD/AUmFJ42nw0MR7n0G1uVshqooyczRuJGcK/U86cNwHoBq9WF2sbzQDyarUt65rE@vger.kernel.org
X-Gm-Message-State: APuU4Z8XIX03yxxS2Sb4BFD646JmKZtQgAzsE7mi+/67CP2ZZKSplx/+
	NgiJ/YuPFvG79peOR4RtJKNSB2dBiuyirbDiSpJi+lYpZCdO8/9WUUiL
X-Gm-Gg: AZFdTZc9y1VLGqSHCopql9I9ejDWceEIquWHR8Q4A6jvpv0mFH8gPiSXrvNf00y+hJf
	6SjDXbTNcbtdcLZ3zNsDgafytAYwfikGooURn0Rg7MZPGp1vd4EeLFtg1yqiEGauBaCx9IGssUi
	B+Ap5MuzDWUA38iXq3c4klG4HAmivRiS/uFOdn8yDHnhAkM5+DCnUXA167ZU0q4472fg2mdj+Ue
	YoNdsHOzV33ez1F7puxIk/WiJ39iHSlp/IsR1kZmEgmA0WjWNJ/CbNWhk2Be/Vba/WT8sdsoDYe
	vu3YZQ9ECIPztIfGy8XsV/y/yk/EWVOpPIm25ytlGT1RqIrJ957BgdVEHzqQCk5xhXxu0kVcFSg
	ACNryFuALzB+Uhe8y+//Y9ozscbTJmIvOx3X9cr+ried9yLERK6SWxE072Vns1THaHelkyMZsqc
	HfkaJeh16PXJq9s8E9elnjvcOASHcD8pNTp443wMVLixoTdmNBMf1iRnxl9Vk+qztYFHCsfs8so
	/Xy5+I75gzG5u3H7PtJolR/bj/cIYdD7UdDCyakv0AjZDMvKUg2Uc8i4xMZzQZDNA+rDAkoQRyJ
	ELFT/UaUyUeAGjAj8qdnTnoS/W9juz8F+2nb7Kuwzg==
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr52009407f8f.37.1795716553993;
        Thu, 26 Nov 2026 10:09:13 -0800 (PST)
Received: from strix.localnet ([197.250.160.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm50447904f8f.21.2026.11.26.10.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:09:13 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>,
 Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mfd@lists.linux.dev, linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Thu, 26 Nov 2026 20:26:25 +0300
Message-ID: <qBBdBMwWSaK2Eq9RGMmPfg@gmail.com>
In-Reply-To:
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
References:
 <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartfY-J0jcIRweO3vnQrxe_bQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartfY-J0jcIRweO3vnQrxe_bQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Thu, 26 Nov 2026 20:26:25 +0300
Message-ID: <qBBdBMwWSaK2Eq9RGMmPfg@gmail.com>
In-Reply-To:
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
MIME-Version: 1.0

Hi Ulf,

Thanks for the review!

Am Donnerstag, 26. November 2026, 15:26:20 Ostafrikanische Zeit schrieb Ulf 
Hansson:
> This doesn't belong in this particular driver, but rather in the genpd
> core. In fact, we have a proposed patch [1] that is being discussed;
> but the bigger question is if we need genpd provider drivers to be
> removable at all.
> 
> What is your use case for this?

It's extrapolated from the clock system maintainer's request to keep clk 
drivers buildable as modules. The pmdomain is even less critical than clk and 
can easily be unloaded and reloaded, even though I don't see much practical 
application.

I see the following options, in order of preference:

1) Simply remove the device_link_add() call from the driver and add a line to 
the patch description that this is deliberate to maybe shut up Sashiko.

2) Set .suppress_bind_attrs = true and make the option bool.

Note that the MFD parent is tristate and unbindable, but that should be ok as 
the pmdomain consumers target its own node.

.suppress_bind_attrs = true combined with tristate isn't going to help. Unlike 
the phy subsystem, pmdomain doesn't hold a reference to the driver, so you can 
rmmod the pmdomain driver while there are active consumers.

--nextPartfY-J0jcIRweO3vnQrxe_bQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsIa8EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiBIUP/05AbhnlM2LcacFX58EL
N7rFiT+lhfKkTk2WyMVEI10KwIOop+Y/Am5zrnL5YXQPyLWu8N+pfkUki9SvJSBH
iKKDQAncXwJ7lWkBISVb2/BxeqJxIHWfDJ0GYhYsaHxLyYo4PWMjT+tq9s+Naqvv
gu5WXpYb3F5sqS0qshsJicHYiU4z1vU9hg4Qazrs61AjDU46L6XpevR5L8mONzHZ
piLakQdu+Hp1LFMtu7mMqniIc/RnlRoL76NDcjP7BZ5iS9l+INN5R4bIYGP5uCJR
84bozcygfkiO6tlkIIcumE/Z5DtZfUlC+u4vvpy1X3jbtMokGZ9K+hpKLCVOQkqq
nklQEfe5EwJVW55bPLRj8LD3npSlBNsAWI5BdgyEqvBf4RuLdbVmodDK5dT8p4YM
/u/o0m891tAX9tp9dMrkPPJyyhHe5rmRoV9mSBNDzqLuOUfQcvhsHdyPgi/xFLY2
FHugaTeVu2QhrRUvurddqz6liNm5+sfy7uzYUtjVjQWxAQZ0GBnDKaVkIaYYUHnv
i1VRm13aavhPdH3WgQh//hh7gZZxc3zO4ioU9gRtxWGwOoCZOYhM43WrTmImaRMG
EMld6KpU6bCcuWmK9sC7u6W7PXOrExL+8Z6bO09no49EU90SimbONtaWrHM9i/jI
0jucOU5MLX8n7BJ4G4cwpoor
=3XcY
-----END PGP SIGNATURE-----

--nextPartfY-J0jcIRweO3vnQrxe_bQ--



