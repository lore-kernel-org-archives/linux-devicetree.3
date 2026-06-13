Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE073C37A6
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 11:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781348519; cv=none; b=P9++58m8lguRJHnH0NE3Hl0xGUt3PEIIY1195lnNZzyjz4Sg6L6xmVc24HXsJJ4EKD4ISkuzI5eBtiG35UZNNg3W78AUxj5jyeZ1J0CMEaadpQBp41iRPEssYYZdGUKEv854UvtFafVuoqYNMKE8GaZjQyAQtWBMKL36U0bV0Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781348519; c=relaxed/simple;
	bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olOb7lEpKpgrInu+fgtmfhp5JH5XJD20VT/IkM/La1IATkVg0r4NyX0I0CZwXDW6lP369ywC27C6GHHAxjsVuUcoFwDYBE8pOyeCUOYYbS4ZgbLo8l8IP/VXp+VrUSIu4MMva2XecR3N69hcM+zJ10PCJajPD/AlcwBYXwYf61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T61BZOJM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T61BZOJM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eec22fab7so742037f8f.3
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348516; x=1781953316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
        b=T61BZOJMnuvPIOTM0UUeGBVff9GOstrCbnqBhGxCVGIw3xblI0eVcbW9tBRUDY1vZL
         jLXrBLRRx6807Qf2byGHNZvfsNXhmr1UOuwC1A4uU2s5NRX7wXLrEYorc0z24u+k6RcX
         n2TUtj+gj5mffWLvAapTU2PnmXuyE/fPqkD/3EdL9eaFLwzreM9z1JmZM1svQ1RmFigc
         JVyixka6qfRtcdWJVUYbjDUgwr+1uYR4shM/Q2dixvB7CFu6ozTAi2pGDci7Fa60TNdy
         l6VKdRVMAe+7vvdgFd4LuU9odkDsqJaXPOlayvc3e9mvBCJsO11JfsqP0BuzqiJpxj1+
         plFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348516; x=1781953316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
        b=mgWUV+rnJOAnvv+tbTOw2QrWKn6Rh6vVbF4cOcGPxOwzISWKW19NEIAkzMUtIm4ktO
         YqpORr9oFCAObtYF02DR4hBOhPQ9WAHf9NNfOTEYvILCrchbcvrkjoeOzxnjDIASHMf9
         whsS/iK9Oc0HZnEpMgQ/sgfwzxl3IgVWHJCe6+I40stHaHzFX5Zel5uW+B/Il3RBKxMf
         1V3iqVQay5gDiWwS+XIOu7BBLIeFotjay5x2JlGKYmlxshvFfEuQ/iqi+a5FVO23qBil
         zwwXB4kd3qn46deAAhPCThF5xEPnqMAUUz30rkze+8LVA4iiiU4ZIT9BdDEvEPnj8wJo
         t4QA==
X-Forwarded-Encrypted: i=1; AFNElJ/9GMPM9r1PYrFOwzhb894b5iBwxOKWpZ1fjsYLJX5/pmQ1/18p/QB/pnnM+gtuyda5bHS1JAkOr/Sv@vger.kernel.org
X-Gm-Message-State: AOJu0YwejsU2O2TiDvi5myHYIP22yVJPQJ8HRwwVtZ1xvp/sIa/i0xaR
	SBpqtE2Ad/ojhlK7i9y2GPiZahXlDcyrubI+ezvVa9J92lxKqfhOhisW
X-Gm-Gg: Acq92OGgX38c0WI4WVmPB+v2PFuYyOZmxB1qyCufCqipty7XLXEthM5E/mCq+m2E1e6
	A/rCwLdZWBn6xNN5cetcmcd7ebUQiZJWb4SQE1plTbxf3mWi1hUHGgAwtH7mvL8HrLgvTZy1aJP
	EfvX8bocrhVWUe9KxeYpfia8XJDhC86KmskCWNPrmN3vu4GB7YhGbnIvaWRnFopHtpytCeq+4rG
	uy9Z6/TxuDXXyIK0kbxuznqvMv1aMbl35FtHdKK82p3rdstajrm2YHiD5z0Zc1NIZJzsWAdgJjX
	gIThOe4NNdbPEYgVUg6MSdG53I0DiZeLU2qoZBuyJlN1+G6JO241LJYXzHwPJAFT4KrGbvs+7qc
	Zb5QoCQdoOLjfnrGD29Zs3qG4Rqhr+FzzeI38wwiKr+GIASawbPsSvClw8ZukAqwfOOuERp2JUp
	bV+jihj4YtiYN/MUx1QwYiI0VUUvlMzlV+ZEVZUa0PE1HQ
X-Received: by 2002:a05:6000:188e:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-4606db8c6fbmr9211591f8f.14.1781348516083;
        Sat, 13 Jun 2026 04:01:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm14930828f8f.1.2026.06.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:01:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject:
 Re: [PATCH v4 7/7] arm64: dts: allwinner: A133: add support for Baijie Helper
 A133 board
Date: Sat, 13 Jun 2026 13:01:53 +0200
Message-ID: <rVKu3PRHTqCaxGV5Fc8kHQ@gmail.com>
In-Reply-To: <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
References:
 <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 5. junij 2026 ob 09:09:21 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
>=20
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - USB-C OTG port in peripheral mode (via onboard hub)
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
>=20
> Add initial support for both the Helper and Core boards, including UART,
> PMU, eMMC, USB, Ethernet, LRADC-connected buttons.
>=20
> UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
> AW869A chip has no mainline driver currently.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Schema validation passes, so:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


