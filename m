Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564597;
	b=hh2Db8OmiBdPp2VnTcSXm5yC+WCuCO430/9BmcEx9mLqsf0brArXGO40yMYfTvpFtOBX
	 jv6Ebh8PvjxWsHyhaNlFF3hrmqkyxqpzoibIG/Ess+V98vleddvP3cEMhaonmXSzR7ZXM
	 YW7snb07dy9HawAZNQodjZmA48XNgwLQy3W0IcomzQTzuz5M9tjTIm5iY4TqJ4fiY+Icb
	 QyeyAW8puO6oWNWdENGg5zBzir07sCfmFP6jQdlnwaKh3WnGalNahzGJAxOCUebLUAxR/
	 NM4iItGs8zFyauxQ5rJaj0JAIJ0jvz0J8hN5NXk/WwnAlv3QStJxKnCtbN1rEzVrxAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
	b=OtGIxEZ0qDjrv9McHsFlgMh1Mr+CKidOfs7Na0rpjPelT2JHWQZ/ugqZB4+tW8B25pPH
	 wqsWISyJLv0dgHO4dVtmy8SWuxWcOlvOXQ5XPe4DCwSHGK+f9atUlSt/BOl71hrV+u28k
	 YewPXOd6hoYw+7YHlgeB3NoICLlxGEvukWW9T+2nmDMoE0Eovq1C4b3PrBX0IyaAW6dWT
	 kl55iqEE7X/ca4mplm8jRU66zJGLvid6lvZ6xU98P7XHO5wk26VvXza8gPIxR8bwwSs20
	 YxdF3aiCeFg5vVWXoCBCUdEgd89S+bHWzVBZ6pflw76P901XDE+F/NBDjZXgIl/6ZSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=p6TyeFko;
	arc=none smtp.remote-ip=74.125.228.131
Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C853606A8B6
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C853606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=p6TyeFko
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c50485c0cb8so44586766b.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794564595; x=1795169395; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
        b=p6TyeFkoVOUeZsZn+YShv7EPwTXNl4nm5v+8cd6w4mNijv/76ZHOonPgnttdyGWHSZ
         uIdexMvZ9JRZBPffyXh2pUxZFR4jWSuGrFipiIfD+EG+eg5YTLuoEOXo9FEdqpooZBMC
         rGdSQVMdhAxOa9pGZzVjc3efrhntuBZexoEB+v1b8dbGr+vzSeRSe7zFJnaKeTpnx2Nt
         B590OHIZSOAFKWdHE3H1S5NCMDILzqfTkV77AkZBPtflgccLep9cwQb5FK6Zf+L4F30k
         ry/j3H8g59MVDo+3QQxIWzqBneHeP5D97A/+Jo1ZnDLPRw3bPwE4QoZEeO2FeUb+zx5l
         PJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564595; x=1795169395;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DI86z/0Iql/9v/K5OtJPg8rVycvTnslIkr8t7coMOfc=;
        b=DX1+T6GO5DHaOWgdxW3SZLBSIikbHUERGF/UDnUUvSDpAMh/GCZIRvsAmutcIblLz0
         cMKdptLKgKXaWBhXiT9ocmty1pkamRL0LSckNGmdbEfTRIwdfhsU+boRNiJ4UywkpfoN
         QTn5hdKhk4/fOSPpEmPCIj6BgSejFQRvH1m+NVDGfIhco977ke9LFCbgztLyZYHO7AFd
         JMHjreB/ItH9xLzf4n/KvF2cuwyw1RcWnu9C+rrt62DGtVNUpy4g1p5E5vE6tzrTOoRO
         cyP4qzQzwICRVakswCI2udrBdg2pKCqt/NtetkCrjRP+Nd3DCC/kISOfZpCrnM+RWjZ7
         2A0A==
X-Forwarded-Encrypted: i=1; AL+hErERmbHSGzfxtSp/61i/daFM1iYvWAN0KzjjcpwdhLM7GoZ/bp6qszrOSJTalXpy8RTwTNZ/W5HHtv+k@vger.kernel.org
X-Gm-Message-State: APuU4Z8m3QK6SoJT7r0lcOK/5vMqYfuSQpG9M8NB47mysV1st1mMaza0
	pkDPDv+vCNO3Qayc3Lr8kSEgttr1kZcZ8hBVq88BpwJt5O1xjE7JZmBJEIYQwbku7RQ=
X-Gm-Gg: AYBFou2xE6Y2RkjCBr5nldcEeCMT+cCbmOSe6ac1ux2exadkiumvTTh93neethbi/Y4
	2BaJq6DRMwmGolLLzVrZe+YRCfirbFcvEhchSeq9zBrqZCtSwsC+dc9FrB7WNIuCHoBiUKmE3nn
	C2l0NAV97a/qJbuM27zRg4BzTOcB5lY7mjF2N5FztxAO4WyfPPn1pieUfx3S9JSJVdj0TK4zFfN
	AeSmwDkEAmuqBe0HCAPOIThvA8EtrMd7XOP7b8lGfhnr/e1KdRubAIqP7jSx+PyoK2FlulgISCp
	ODHBVfayZbOdPLDW3ASczUBw2MWUM4CVSR8HoNs5onv8ibp09EU1g5jWqjosBSBTW6n9+NX4o7Q
	k9CcyasyrrwhiV11KZW9dxoIfhFeJU9Swb+n20THgDMqn1XVXbiM1LNxDXA0gelUWKL7WSvRec3
	zA1/y7VislsPx0R5kR7x9yBRU5xXIynK2m1UJGRRPyxNHviV6UAOCKqXbiP2f51zOGZ6LwwT1Tr
	ANvvLmfa90hPMS2xMqLPV1sbHhK0JdX2hcFtvwSEp8wiq4QkGrb+W27XFcEJA+mM0131mKca5jX
	6rjSpg+WnxL3GGt9Pudp3Ri2NJwzWHV1XG6WZnG5u7mepliiSrP5/hF9GPHtO/Fp5e9J55kxTQ=
	=
X-Received: by 2002:a17:907:d40d:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c5096372189mr164295066b.13.1794564594691;
        Fri, 13 Nov 2026 02:09:54 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75758766b.5.2026.11.13.02.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:09:54 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 11:09:53 +0100
Message-Id: <DMU0219YWEL8.35KQSMY192RH4@fairphone.com>
Cc: "Marc Lainez" <marc.lainez@gmail.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>, "Danila Tikhonov" <danila@jiaxyga.com>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <phone-devel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] iio: adc: qcom-spmi-adc5: Add
 ADC5_BAT_THERM_100K_PU
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-4-val@packett.cool>
In-Reply-To: <20261112170841.2189322-4-val@packett.cool>

Hi Val,

On Thu Nov 12, 2026 at 6:07 PM CET, Val Packett wrote:
> Even though it existed in bindings for the longest time,
> ADC5_BAT_THERM_100K_PU was never assigned in the driver. Do so.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi=
-adc5.c
> index d57ba8526e0c..c27ff89429f5 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
> @@ -542,6 +542,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC=
5_MAX_CHANNEL] =3D {
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_XO_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("xo_therm", 0,
>  					SCALE_HW_CALIB_XOTHERM)
> +	[ADC5_BAT_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("bat_therm", 0,
> +					SCALE_HW_CALIB_THERM_100K_PULLUP)

While this will work fine for some devices, unfortunately this won't
work for quite some other devices that don't use a 30K, 100K or 400K
NTC in the battery - or when the NTC beta (B) is differing to the
hardcoded lookup table.

For example on Fairphone 4 (pm7250b fwiw), the battery has a 10k=CE=A9 NTC,
so using the ADC5_BAT_THERM_30K_PU with the hard-coded lookup tables
would result in very wrong temperature values. Even ignoring the whole
NTC beta topic.

You can see my proposed patch series at
https://lore.kernel.org/linux-arm-msm/20260220-bat-temp-adc-v2-0-fe34ed4ea8=
51@fairphone.com/

Unfortunately it's from February and I haven't spent more time on this
topic since then, mostly because fuel gauge anyways was downstream, so
pushing just this upstream wouldn't make much difference.

Now it does, so I should get back to it... Let me know your thoughts!

(Fairphone 3 with SDM632/PMI632 would actually be fine-ish as-is because
the battery has a 100k=CE=A9 NTC and the beta probably is close enough to
what's in adcmap_100k_104ef_104fb_1875_vref)

Regards
Luca

>  	[ADC5_BAT_ID_100K_PU]	=3D ADC5_CHAN_TEMP("bat_id", 0,
>  					SCALE_HW_CALIB_DEFAULT)
>  	[ADC5_AMUX_THM1_100K_PU] =3D ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,


