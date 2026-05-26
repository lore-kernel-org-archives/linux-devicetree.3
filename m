Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BECA18B0F
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828406; cv=none; b=jHXAhrVYyRGdHICkf6At7D8rNDpo/SWmu+iQ137ybzQREXh8qqyQonajNPm3wVEfXIMAJ8XNC2mjwtwOzYqdbmhjqLKxWA/kVz5gX54d42KUk+OrhJ6viZd6aiqaPYjBNgKE19w/Afh8d8rljBKbZlndMmvWfxUPrR8SI1Myljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828406; c=relaxed/simple;
	bh=2z5bTtd/HxPEU8eYLMrzRgawfNVrHqvpf4qq3+29xt4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bRCV4O/y40fz/LWQt8/aCgbuR6nu4eT1gmoFf1AiR20YSQ0RUGmJfOdd1db/keHCb6VJmEV5qYzsCwdZnIEzamPlG0//M+YmMT47gjybe11Wubbs4U9JKAnN3IhLUajOhiU9B9DVBhmvmimySO2LluSBIC5S7e2UYdqquhKwBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWhLAaYz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWhLAaYz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49048e043e5so34501095e9.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828403; x=1780433203; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw9iPfDQzt8bW0KV99nuWsMFk8LtY4w/e81ccwJ3ovc=;
        b=SWhLAaYzSI/gcN1IvuSPrKabWDPi91V5uIzMGxNEXVoCd7ATx3iW3DHasA0aStYG4K
         W9BCc486WSrOd0hdiIQ3vF32+orXOicbi6DdsQQDYA4TwLVlzL92q8rlcSIIRse9gVw7
         2/BwX19aWvUeEaQ7XQ+AREZXkbJ02jEkkDT4OdY8HPLohlWkECP69yfZGzBMeHEXwRym
         kF9k2Rpf+LGth5BFHQBMW3+DczDrOmVigPr1hXO6wWcrhsUNMcEnFR/KGdBL09Z7mbCK
         T+WNzS93yO5OtxdP/sC+YrWri/kDvsNYRD40ZJwaVAP6yXHx95cc8RKUi9GYYrJBffx3
         dCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828403; x=1780433203;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sw9iPfDQzt8bW0KV99nuWsMFk8LtY4w/e81ccwJ3ovc=;
        b=sCIyh7H2k4274JGnFsEp9HfQbz2zKpAGOb/rRSmJfBpCt7f92YQMYZWm7+oty2uVRJ
         nzfJbenItSG9E0qUWwONG2A1hWhg6/u06Hv8D2M0WKJkCn45T1zWuzvkVEtDEDBF8P9x
         wyZJ/Y4hkx8JU57u89jnPnaWh1zRnxAirntucYm+oqfumwq3/W+Id/SckD/oc9JUlvhJ
         1aMD1SP7NrmoKX/n7pbrzvvhgz7KN8xkD6KQEFIzvqiiKVoENqUJ2Qk8rBTUXWiyYGk3
         cRl/VnmmNVbmtp95GnbOD/X56h2Au3ESbarRNOuokUP1TKrddjJDsqaw3sa1O+Ptasro
         lNGw==
X-Forwarded-Encrypted: i=1; AFNElJ+o9TQIxzMBNs3nZVSoxN/pmgAlyUx4op3NZXdlMEsujRO73+LDaKmYIsKvxGKn3HV1CJojGcKonoae@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnzjg4mk7GJi+vpHztEjMcptsMi7wgR+iQ5Isnfb5zC9JpaCMi
	ZxjZNitIZAvf7r0ssC4lJoTBFYYMQx4V7BneBBovrdHkhu9zQl/tdc2e
X-Gm-Gg: Acq92OE4UTb6chUrw91+s3fND6P9NpKFtZf1d4r5oaWKKddKcesxsEQt59Wve6Vt/7L
	nVJjCpopG6Xfzp+s22umOwNw/90xY1ytwWu6Y5rbGPOSt8gGL+1SdCi3fSiVeXgmWdZgMq/jydI
	UGFdMLJUkmD1HNDlprEjF7u1SNm3Q4j6/B7HQBRKxZM8hUU6kxs1zVfCgCUkGP2cGfgsq9ELK3R
	ApgOaalpLhQ1vn6FOMeGjcyVcpdhJ788cxFEs3daqcdUh/yZr7he/tXkdYpjtoj6Ko/9RAO7ixy
	ZZrLpYZ39AC/PFuMUwOjaj5XWwFN3K9jfeklrYcIZWHrX6353mqSlOSz4gfxBWFpvy/swAIPLmL
	BxaZtaHwOC7PuqkXTNUmwDtSK+Yw11dRahO3gOBI5/UiCuaxBBOaieEx1lngQTcmoEtG2T86URC
	5z30LksLvQVrJiolMgo6Ig1fcifMgulHfFhnxf7a+SPSsWDPU=
X-Received: by 2002:a05:600c:4f88:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-49050ebb9e0mr298822445e9.5.1779828403347;
        Tue, 26 May 2026 13:46:43 -0700 (PDT)
Received: from localhost ([2001:4bb8:19a:6947:136e:fa14:24f7:1e97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49045284855sm356054775e9.0.2026.05.26.13.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 13:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 22:46:40 +0200
Message-Id: <DISWIFAG1KHL.3CUT30EQMVS81@gmail.com>
Subject: Re: [PATCH v3 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Lars-Peter Clausen" <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Rishi Gupta" <gupt21@gmail.com>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Matti Vaittinen"
 <mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Jonathan Cameron" <jic23@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260524-veml6031x00-v3-0-29165609b2b5@gmail.com>
 <20260524-veml6031x00-v3-2-29165609b2b5@gmail.com>
 <20260526185933.0084679f@jic23-huawei>
 <20260526190528.0efe80c6@jic23-huawei>
In-Reply-To: <20260526190528.0efe80c6@jic23-huawei>

On Tue May 26, 2026 at 8:05 PM CEST, Jonathan Cameron wrote:
> On Tue, 26 May 2026 18:59:33 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
>
>> On Sun, 24 May 2026 23:53:56 +0200
>> Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:
>>
>> > These sensors provide two light channels (ALS and IR), I2C communicati=
on
>> > and a multiplexed interrupt line to signal data ready and configurable
>> > threshold alarms.
>> >
>> > This first implementation provides basic functionality (measurement
>> > configuration, raw reads and ID validation) and defines the different
>> > register regions in preparation for extended features in the subsequen=
t
>> > patches of the series.
>> >
>> > Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>>
>> A few things inline.  Biggest one is that device driver specific state n=
eeds
>> local well documented locking. Here the whole complex gain handling mean=
s there
>> are a bunch of register field where the accesses to each set of them nee=
d
>> to appear atomic.
> The sashiko comment on underflowing pm counters also looks plausible
> so check that as well.

Hi Jonathan, thanks for your review to this and the other patches of the
series. I will go through all your comments within the next days.

I replied to its comment on the PM underflow, but as I only replied to it,
and then I forwarded the message, it might have gone unseen.

I believe Sashiko is misinterpreting how this pattern works (not
introduced by me, it is already available upstream in
drivers/spi/atmel-quadspi.c). Decrementing the usage counter is fine
because the devres action uses pm_runtime_put_noidle(), which in turns uses
atomic_add_unless(usage_count, -1, 0) to avoid decrementing the usage_count
if it is already 0. Otherwise the devm_ variant would be unusable
because it would not be possible to put the device in autosuspend for
the same reason Sashiko is complaining.

Best regards,
Javier
