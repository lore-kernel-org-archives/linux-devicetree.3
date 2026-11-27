Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795768685;
	b=ri4zm7x6tBvtaXB1fg+rLdGirqjcLhrAV2bSl3xSOXK1l6StbgxtyV8R1Z26/SINMP/B
	 krchiPL4ZgAJwjmYWn0MRko9AdwScwIRb+27N8hasreyKTepBpFVr1OVR+PZOzCQmkn4o
	 rjH3Vgl6uA8WTJX/p6iUt1RpWt72r9rwuQre7pgGLU+k83GBZRRib/5PL6rEe6DfrtZ8U
	 TznvsWi2M+ADQ25w2C5ME+RLAH8KGO5bxystitIr9UaWS63x2odxGV8i2iaWULZ626NDy
	 RqEoz3Xl9t/JHPdvpcbJA+aoYjR7kyRe11r/Fbh8YqyOcmNJXBzZ3qD7CcWLmCbH0tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
	b=g0FVIX2ss7fXlgAVyePyg/78am9IwTPk0iY9oweZns/a3YVnj+EdqBVzL0Kc8PHuKVaH
	 +UbOqdVccROwzLvmUJpJ4qUmJJWJf9zy3CcRyMNMh/3lsVdanqrMs3mSXv90MxO2OfGw1
	 VANwapEAJ/zR+sMvjzYuMQJ50JdVWwlH3tHJc6BrVd73vyhwU5+1h7kT9mG3BAfaitmwV
	 3QW2kLVP39Gpq5g8MdqMAkFQxhqpe470YkSHC3SFV/sEj0WSYSEn/SIWMgk2v8+Meu319
	 yxGTk/2v9mC1nqKCl9c6g4WFiDokA5N6gVPplyjRxu06UE45QxhfG/BBMmHp15Gjw+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToO9C5wy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE423606A327
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE423606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToO9C5wy
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ba85ac95b7so1014656a12.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 00:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795768683; cv=none;
        d=google.com; s=arc-20260327;
        b=kalCUJBFAV6mPNwli/cLKDT3wpQfwz7rCSl0wKwLurYV8/aNLw+ee1fVfI9qMiVsCz
         DB9NUVONDA0xFeKFMAS/vXJ+FPtgS7C2YI3kAh0oMmivAqHKr3p+omv8grl+SV7kkOIh
         ZgzDP4s/jwZl9jPro1h/5q6jt4k5xLP1XK+0X3OJ6Cc0cA64WozHzFJutaCiava9Nv+I
         AWNdByVgwpj52OFkQB5gRhjHVQyel4K2ymvA5y+U5KI2bIJGo/33ahcej3F+Q4b5w2sh
         7hP0st6P3IUMfODZgOeQxP+ZGIJ+xy8sMFRSQpnV1WIwXe0UBdxrxN0ptkM/0grdJsj9
         7s5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
        fh=WWIj9/YblkRs05QMO22wrvmgQ7+udbLnUOkdf3fb8wA=;
        b=KJGqhqmS1nCZI2ZiSRnIOODYKVZj9HYxi6+0NOGgzpWN9M8pNslDSVI5Nmi4d8Jfb8
         MV88SaHyolAxfjBzTAqtk5xqzi4iZzLnGVeFzv8q8Ec4qv3R528V5+1HoKG4XR5cjlpR
         Q62a6wGOMM48rGgYZn3Qo+Nh7qslkGVIxpBA1u9nm9rWGTi+nTCDbmci7AnUy1DvXozT
         KWg7/rXna4Xbw5z8PeYb3AysUBF7OSzYt42RIO8H7N8Y5Ll5nLMjcj0rZjDsusM19sP0
         U2dvqy6MoaKzR1Tkz5AMcZ04EjjpvXImANGt7eCouJJWaS9NmYrjn4N9y/nrd8mT+sxQ
         ausg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768683; x=1796373483; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
        b=ToO9C5wyWnyPaMl6qDk5PpaoPIQdnHnQ3y6BlV1zIkzc+uZrf57OzjhVL61YDhLfbU
         ajWnSGTigUbWxcctMFa7jFiPB74BnQZTbHc+sDw3ZTyT6jZxxt3avhTcyagd9l9Qv2zN
         AAdatIYxNaPE4X8oVCgsIUhSEUH1EL4JCLqA6V1vD7iOfCZevvrEhrQA43d6fdfjEtV4
         oy0E9a6eeaw3ioKz51SsiOr0QG1D0RqjM1yVafXAKgjx1IFkgnqHyRFXR3lI/CJlXfVj
         j7+zCzMSXCYjkO/Y+9mFf471uclSXhbUzff9o1QmZqDRF+8huEjTAyilh3KVDSYIks3m
         RMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768683; x=1796373483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+iLLY2LNcOA15ZEBBxvXXqmssEEMm1Qui3OR6b1WQp4=;
        b=AHP3izX4aBBjJtGpdLZAMG954erY+/PjD9JP3vX/n9edVSnj7WyCarRCGLSgskeQMh
         YJnmlgTImuJG8weOMXXt0d0GQmnF1mNYuP8hPcsLCK7DQyDUEPg4SFYrQ35GVlW9EYMS
         rIwSi70r9z3Xhm2hZEs8sZ8MRVOrC259oA+f4wJ1JgdK3SgxLwg5FgsLagW1Gm2YT3d6
         k4ZKn2Xicf/44hmvENgFchDYJnRe5rPzMJUQLcMSUm/RJAsUba+7ZDCTMioPKX3UynWv
         qv8ZCoI/hGLOpgeFcN9dsVlmxu9S3pWRIi4rYd8aatZa7an78wpQTpvj7tW5wJlw4U7M
         9KqA==
X-Forwarded-Encrypted: i=1; AL+hErGpGck01Mp10moubXBAEAq1oxYsjpCj7W0AOj5Ute+IblTYj0pNUYyXXHgAc0Ye7AgxnpgiBc9kUjD4@vger.kernel.org
X-Gm-Message-State: APuU4Z8g9EWeg5p2RcYVULtdmPmLmtYbrk2lMYPkktdxo22meAkuLo8C
	QZbGNkaT2Uc/PnAy+TYWzmZ3mpzBxNmgq1iIeeE7mMkrdOn7UdVmeG5BaAaWQKMasa0385LjW2l
	vABthx+lpfdNm7ffv2pxKQpCibYk/0ChftZguQYr25Q==
X-Gm-Gg: AZFdTZeH5y5MiZD6kGjgzMno2hnD5FGQPqd0ZP22K+6Sm1cVLGGt81CB49GqiO0ZodM
	pV/yH14eJab7NvbABE7bCfxR07toAV8yhzACtKoIVpWeA5VNzdOllsw5LDLCzVI0olZAb9aC1CV
	7VAFXLGQVPSytwhz7nEwNWJiWNM8sPIjxXCpdRXzCi68BKoh8Ddukvxkyd9739A67hoLcpCfp83
	qbE27vrS8Hze4cDlAZuoUH6Iuv8y/00365t8zoSjhtTHArTTFE4DOMaqGiXhWwsm1hrRz8NVqJW
	orz3ca3VjRlkyGqcMOIyI2Qxlp+Afb9TUDBwGduu8KX84FCS7IsQ707qMp91wHhfq3x08BaPOZH
	DsGnbUcMNewXQ8/5m2TXWM0radggjTGyEwYCVNoVU/QeHPVt0Ou6uq91+1Juaieh34zsjKUE=
X-Received: by 2002:a05:6402:c887:b0:6bb:2a8b:5b2e with SMTP id
 4fb4d7f45d1cf-6bb2a8b5f9dmr6168346a12.1.1795768682451; Fri, 27 Nov 2026
 00:38:02 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
 <20261127-dcphy-rx-v1-v8-3-9ddfef99221d@gmail.com> <sashiko-outbox-236841@kernel.org>
In-Reply-To: <sashiko-outbox-236841@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 16:37:50 +0800
X-Gm-Features: Aa3M54pu6EO4cdX8RMwrWdtxfoQsdpmDJZ6iQ0uh3wib5NqKabP07P6_hR9dYhg
Message-ID: <CAPwA33Jfp_ybG7gG_PfZoS_7=g3_Fv0w2B9J3xxWsJM7hK-3Ug@mail.gmail.com>
Subject: Re: [PATCH v8 3/9] phy: rockchip-samsung-dcphy: Unwind power-on on
 PLL lock failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> This fixes the incomplete error unwind in samsung_mipi_dphy_power_on().
> Should it include a Fixes tag:
>
>   Fixes: b2a1a2ae7818 ("phy: rockchip: Add Samsung MIPI D-/C-PHY driver")

Before this series, the APB reset at the start of the next power_on
cleans up after a PLL lock timeout, so this fixes nothing in older
kernels.

Best regards,
Jason
