Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA52E7623
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781976498; cv=none; b=aUyQPeaSCfJVNX3dH6tIFk1L38qBIZMgxOy7qVOX8YAyRf2b2XSMeuLDlwHYOjfKUSYu5BDltP+AdRJNlvKZFriTlBh3vV5f8ReqgVXV/VyAKn7T9VlsVDxGHTZmGSvva0Ep7IxqGLoAOXdbZDx7LeZ5fDsUEJ3C0sYvQZpKkCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781976498; c=relaxed/simple;
	bh=nM5yehFKra88Qfal5zlQkUu6h12HqXiJIL0q08sT7nU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtwLip124cPN6uyQ4EcpvaIPqyciceREBl4WKpBdY17IChzlTj/vHhWEbhUporsmaz80mUCll9YrzKygy/aewaBTyuVQGpix87wcN3UXHy1lgmVlev6uhbnC1c136lcbuJ/2kaXptVd4zmHFcyoAGEcsHWdBd2gsdr0UYF/EiRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB61f7lp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB61f7lp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4645995069bso1712341f8f.1
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781976495; x=1782581295; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=;
        b=jB61f7lppmVBZGkKBtcJaZCSkm9hC3ba6fNnuGFpbsu5ILAsvceXsbtlJzQevYsV+x
         fo7AmHwC8ug+s09Os2ZXQWboeHE4sEU4+C06+XWAws2Gp/CvQMCe2UjcE6rsJV7Q79Lj
         ykYfjIGdLGVvPmp1fjc8J//yuYBo2DCAimNvEbSSqY/+RIbrEmtEmcVm9FwY1E9hJmk8
         xwlU3O9/+ByeuvePqDLiSR13kfjTLfmcLgSmFoFXiN2nUQe2sRzTAGx2weogkFGesqe/
         khQ//xr4sKUclN46CAmQHKRa7wI+yqNLEGTcp9O0bS5WTB3m0qKb5C7agYqEGQYp+W1A
         3NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781976495; x=1782581295;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/6fDvnIguDHo3k7rp3ZTnWwimeNwTtivMzdauHwuVo=;
        b=EaEdzDDyCV8Rd9mtKDDMgGu21ql+/4TOgLJnVA+HSUZQk1mhwq1U2cR08peVgCN9Xm
         s/JqsV37duy8eGyGUc7JRTbdAzKDG2srPsbM58C2tL1kbevjMASLJl15vroFb7qYxodV
         U6v4PA44JaiZtfek7a1V2W5fMVdpgm82qxBYxLZlmmK61py8fnTKLn8h++VkX0VmUrI4
         FcIvgKhboLVTmovCo4tRwF1UOye5KYhP01ST+pQ9akbB0yttn5sLuhWxInGTu8AnKFCm
         vZI4VNQK7/gnoIeZ3w3P3ovFlyWKyCSHrUBlpKIUaRrH1cdZyA/bny/4EeYe/ZCWmSwk
         4fIw==
X-Forwarded-Encrypted: i=1; AFNElJ9xa3gphxuxsZwv3KfegtXlFTHEKWD0IypBnowblxqkWuF/scWb/KQi69eRJbqwcIZTLko5hkBkU4rv@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/nJNBz+t99u//s1AANYnJle21G0St0UTQfm24zEBUBGnH+q+
	tpKNn9MKNsWTji+2XvawJRb7WhqAZfSw5MMBvGUfmjQiIsW3augttqSv
X-Gm-Gg: AfdE7ckbLbOcR8z1skl065kd9zYDkKS3NJ428q7DEQByve7KJAm6bR8XQu3ZHnvHV1W
	4ELmHjmWWY/3xOro6vK2ZpILYYjR5FBL5Y2SCg7jcXniUYxPV2SqMGs+7KBa4xPza4+CmJy+77r
	me1Dps42dLJsQADQB4QsfaD1YDDwbnkkYnGaDZYIWqGy9dtPh3LzY4ERYjnZfcOfiJxoTzESohZ
	gsGwVsrxF1y2ApLVG9eiXFd7kaztqUx0R9dLcHcbZvK2IeM0Tv+5ht9BkxsN/3YSFmJV9oulNVV
	FqPFgt6F50JKT95p6DCgZ4/Cgulc5JjK6leHrpzpCos4VNjaSQLguq+VNWCg/AveZ+dB/M5PI7T
	QV0dwWjaR2UXwMM50wHAkNttLbMnZhpPvMrIRNSZhWH2g1TbNQv1BTw3N1A+4emqIQ1g66ij5Yi
	vb79T/pbrKEFczLa+hRAx3Og4vrA==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr13924863f8f.34.1781976495283;
        Sat, 20 Jun 2026 10:28:15 -0700 (PDT)
Received: from strix.localnet ([197.250.226.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm9661404f8f.14.2026.06.20.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 10:28:14 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset bindings
Date: Sat, 20 Jun 2026 20:28:03 +0300
Message-ID: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
In-Reply-To: <20260618-fantasy-estimate-6c52edbc6890@spud>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
 <20260618-fantasy-estimate-6c52edbc6890@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartj8KIpuwSTluwcOdB0G_0rg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartj8KIpuwSTluwcOdB0G_0rg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Sat, 20 Jun 2026 20:28:03 +0300
Message-ID: <vYm1twErR8mp-Fjgbvf-MQ@gmail.com>
In-Reply-To: <20260618-fantasy-estimate-6c52edbc6890@spud>
MIME-Version: 1.0

Hi Conor,
Am Donnerstag, 18. Juni 2026, 22:54:53 Ostafrikanische Zeit schrieb Conor 
Dooley:

I think I get the gist of your suggestions. I have a few follow-up questions 
to make sure I understand things right:

> I think aux bus makes perfect sense when you have a clock/reset
> controller, but once you start expanding past that and you have reboot
> or hwmon or hwspinlock then mfd starts to make sense.

At what point does it make sense to move the bindings from bindings/clock to 
bindings/mfd? The controllers are still very clock-heavy. allwinner,*-
prcm.yaml look like clock, reset, misc controllers in mfd/ whereas 
ingenic,cgu.yaml, sprd,sc9863a-clk.yaml and da8xx-cfgchip.txt are clock + misc 
drivers in clock/.

Likewise for the node names: syscon@ or clock-controller@?

> You'd then have topclock that is a syscon + simple-mfd, matrixclk that is
> a syscon and lsp that's using the aux bus. The topclock and matrixclock
> would have dedicated and trivial drivers somewhere that have the mfd_cells
> and call mfd_add_devices().

Do I even need simple-mfd? It seems I can add the syscon-reboot node via 
mfd_cells too by setting .of_compatible. It seems once it has a driver (even a 
very short one) simple-mfd is misplaced.

What about syscon? Topclk needs it for syscon-reboot and the watchdog 
controls. For the other two I only want a regmap. Afaiu device_node_to_regmap 
works without a "syscon" compatible. There's also regmap_init_mmio, but afaics 
I only want this when my driver is the only one using the regmap.

> Probably the compatibles you've chosen start to make less sense at this
> point though, but probably "topclk" and "matrixclk" are not what the
> documentation for this device calls these register regions?

Yeah I'll rename them top topcrm / matrixcrm / lspcrm. I just stuck to the old 
names for this email.

> I think the priority is having something that reflects the hardware
> accurately, I wouldn't compromise on that just to have the same design
> for all three drivers.

As far as I can see the primary difference between mfd_add_devices and simple-
mfd + child nodes is that the latter makes the MFD composition visible in the 
device tree and the former keeps it a driver implementation detail. My sense 
is that the latter is preferred unless a subcomponent of the MFD might be 
reused in other components - e.g. an ADC is used in PMIC-abc and PMIC-xyz and 
thus the driver can be reused as well.

--nextPartj8KIpuwSTluwcOdB0G_0rg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo2zaMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiA8sP/iDCZo9JCPTXlknep41Z
EiXNNHm4yYRiVaWnovL3ahmlVRNEQnKpkhizLzvFtmvkwpJPPWe+PQuZGKh1xfHX
j4l43lj0EiP9ZkpSFoJgHzskpiLVoCzt8IzYLzY5/miAhJCRVkVhudLZXb9AWTAN
5Kg2jCv4/s6gp4viQkwA58GEomii5C43k2D+j8/UBf4rz9mWrMuMRaezj7F0YqCG
Nik4IrBIHuDGWJyThgQ2mTluCQcBroaA3V/+jhDMTPg12FmhY4A5M1fpW33iN3B6
fo65LBzVwmhdjICendnz9go3I3ZEjqnlERFhlEqywbZBjNxFxhV0Jg7XAuVN9YOw
EFYuyNbzZy+u7KYvgzW8pswUYhOjAUupEU2EOY3+kKzmpkB+0hXeP10rTawXot4d
GKJFdt9emZh4/xFtEyeVovXR2bq6Kk40uZsgwDEf1KS+QtANtA3vstQn9rEhIPFZ
vVopjQLE45hhxKiWjXqUZaA0iJg+bmmy5HeI03X9b6jXgfaEhJBBAH0bRW9smBoK
OJ0wIe1JnGd0RnGM/1DjWedhXVq2RMfVgXCozzyFiETgXhYr++4Y57h/NgHzoNm0
nIN2gqG3q7T+OOkziGJmmcMyvONlYqcyy2F9bnJ1AgtGwdYhMWC159JK54VhAd6S
sFQ9rZwU2zMAjJ7YPlocj67G
=JozV
-----END PGP SIGNATURE-----

--nextPartj8KIpuwSTluwcOdB0G_0rg--



