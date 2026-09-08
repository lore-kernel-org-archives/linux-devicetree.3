Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE2D5921E2
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883090; cv=none; b=kDHyLMUOLQxO8bFxFOtuHjS4IQAaAtY+wDX+bboPnbaj4GJrBAsjCyZzxX35o62RSQyc5e5uc8nnLmYbbafoqU+dCZTXeh8gLFequ1f6oKzedtQsI5VKXQhjqMnMo9W7qFk6oG3fTmH8/a8r+edOKWK18DuLn3EoBNREibN2k9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883090; c=relaxed/simple;
	bh=HCOjmtuIURC8etW7PMldOk8sZqet30nx4hUSBGF2CaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihPMtueTMbko9J+6Z+aY4UsuJ3Rm8rcrQp22+0LdyV7dielJ9/1XxZDwaT2cqvvVGVMiJ1NU+nLb5Y9t2PbdlRjWO6kidVj589nAC+6JdbUpB9PxMdcpMAaWtm5SLet/4xGWA74/ybaWHzGYiBMfI2GiVsZG1R4/dWhZ8lisiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=R1wihYgR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="R1wihYgR"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-485850cf499so3185622f8f.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788883086; x=1789487886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=COKTXmW8lCYoLX/NVE9lHsQ1T9j35CdnW3YzobS56+o=;
        b=R1wihYgRLDUHV4dUomXmKTaBwR50POp7oEB6TzD5CsxU5cGBvanOrj5b/MGM2TbnhB
         RqgXlGux3WqVJ7wAU77ykLKoLugAOgc5MY13YEI2L8PeaSZZk4X9lt4Yba5Jb1b4NRNO
         pDqSFhE33y2l1ce4kwcaVi0e1CgYOWUA5OWhuQkgQQH8mkjoAOHQk6fmPf6RnqsFX4+V
         khy0aO8TEsZbVKRsF/bk+0NX0qbnsmn18pKJQpQZNevFEWvsvDiv5of+RacNp2mLeKRi
         FMVabifqOWn5F3WUvNFlJ3xXDSG4JMl7l6wpQ5J9WKdGPEaUR6fifhD7d7GhpbjD/gxp
         pFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883086; x=1789487886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COKTXmW8lCYoLX/NVE9lHsQ1T9j35CdnW3YzobS56+o=;
        b=C6DEdeqfwgt41kgf9jQmy2D8MYWAw+UKwV6Rgai41cB9ltJ6W826RafT3Fp8tM4WWb
         qjAn2R4JuhXvR/ZJSZEUTMYrBV95qb80I7m1QyXsnMYkRYeYqbxCrlt4KabX3o/83L3S
         AKoyocpMF/BgNTV8j28jiwZNC2sCFCakr4mxStpVjzA9Bu8zuNgZt4hnO4i2fsMk7CCl
         JT5tTR+QFXGXHqsTdqmVXZz/5E1pfKyty/uGdTvAJ5TMSpXS0CYRJAaLX785wINNwzr0
         sbtcazHzdW2qKHI7QSMeRECuf1PW2aSVVgJoAUxc+oydsHdpe5Ri7H0bFiL4W0xS9t4Q
         1xig==
X-Forwarded-Encrypted: i=1; AKwUvBxEiQ+d9XZyF1YxmphdVvGdyk+0RsHsd79UKB6ceWNizAuVZ6yAdAYuKRHG6IYjdMROcF2bw5vLzyAn@vger.kernel.org
X-Gm-Message-State: AFuF++koVsE6xBRMRYfEuPWpu9WRscUUBatAQu4HrRElJu3m+fNElXKz
	nYYuAb2Bu+6JNiESFuH3WA2AXihfWm7JkXN7tBjsFks3IeTZo7YdenwoYYGzBViKpd0=
X-Gm-Gg: AYBFou2RGkjtWhYesqLGVZaj7ZVB3z9lYK6r3pH71wGrYkZg/gV4LTBTTGTQgbrgKXu
	yPfDfsL74UNWaPus3gpmBGKh1qGO7W5+yKQGWR2h7Z5lFwoeTl56V+yAICQ7J61Ck+W+1XoZre/
	XfPp/yHoKL6aDZDM19WfoHrENzQd7LIOqEEjGKHLE2WPGGDvkH/U9Aiye0vVZV80XMHy/X6q3Ts
	/ByuThM4hlGTD3u3YqLZB2DyeVysEgdW2ahWcBwgJjzXjuUvXmA+Sfqs7uilDusJrwW0/1NvGw7
	YPNEaOx1FXATaNY9/Ps2ARRIWdwbQKJViMey6mYd7mZQALZuHC1JuAp08k4ny90g+GG1EDZdwmA
	NHbEe4Q0iY5HulFJyb/7rY76AORvQKScsRVFhDNFG1gXj/+nwqEgrGZ0aRithzwJXEAc9x0iesr
	I3aAisjBEGyoocnX/YoRdxbWsJ9tmr2/nGxf6aqkMN417Cuuh2kV0ZIyoDQQPHnXUww4GCNd98o
	yCFu2Gh53bx4cBh70BqDpsnaKgIUfVB0BtOuNbn0RIkVJZqlPI=
X-Received: by 2002:a05:600c:a0b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49cf8262133mr304493845e9.16.1788883085916;
        Tue, 08 Sep 2026 08:58:05 -0700 (PDT)
Received: from localhost (p200300f65f19a9042cc2680c1f1bf2f5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2cc2:680c:1f1b:f2f5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48588394fa1sm35076368f8f.8.2026.09.08.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:58:05 -0700 (PDT)
Date: Tue, 8 Sep 2026 17:58:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Takashi Iwai <tiwai@suse.com>, Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>, 
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>, patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <aqAvgcljjWCkFquD@monoceros>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="765wben5jmkzogdu"
Content-Disposition: inline
In-Reply-To: <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>


--765wben5jmkzogdu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
MIME-Version: 1.0

Hello,

On Mon, Sep 07, 2026 at 09:37:25AM +0100, Srinivas Kandagatla wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. Either rely on
<linux/soundwire/sdw.h> to provide sdw_device_id (my preferred way), or
(if you want full iwyu) include <linux/device-id/sdw.h>.

> [...]
> +static const struct sdw_device_id wcd9378_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
> +	{}
> +};

s/{}/{ }/ please to match the common style.

> +MODULE_DEVICE_TABLE(sdw, wcd9378_sdw_id);
> +
> +static struct sdw_driver wcd9378_sdw_driver = {
> +	.driver = {
> +		.name	= "wcd9378",
> +		.pm	= pm_ptr(&wcd9378_sdw_pm_ops),
> +	},
> +	.probe		= wcd9378_sdca_probe,
> +	.remove		= wcd9378_sdca_remove,
> +	.id_table	= wcd9378_sdw_id,
> +	.ops		= &wcd9378_sdw_ops,
> +};

subjective feedback: I'm not a fan of aligning the = in such
initialisations. They tend to get inconsistent over time, and sometimes
(like here) they even start inconsistently. So if you ask me, use a
single space before each =.

> +module_sdw_driver(wcd9378_sdw_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm WCD9378 (Tambora) SoundWire codec");
> +MODULE_AUTHOR("Qualcomm Technologies, Inc.");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS("SND_SOC_SDCA");
> +MODULE_IMPORT_NS("SND_SOC_SDCA_CLASS");

Best regards
Uwe

--765wben5jmkzogdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqgMIkACgkQj4D7WH0S
/k7HSggApAsqBk4MvLcFhPNfq1ozMJSIoE+LirT/GzBRY6d7XMtZW8CLtYNiq6Q3
HeZbQlcqOlJ5fT3O6pGkpEwA23r0GX7JtqBOgz39PxQV9CX8l72tcqw6CcQrG2tV
qoub2YTQt/7/ZaPAHEhxxcZxWzR1+S02ejC6kf2+4FrySDkUfBdJ3vVD/KKxbyS9
FcMHpBbR9Nv/J01dLTASs9iUWSki8qNwld1+hhfWTFYI7Ho+7Yrt79+LAiUqwJjj
Ph2+Toa/P2Zf6i5IFf0K3k9g7HfMxt8WzYTeW5asujYRo0bNQfBk3vj9yqwJveHr
H2iSp++GJEzaPEbhyx9imFpQ3voL1A==
=cFZA
-----END PGP SIGNATURE-----

--765wben5jmkzogdu--
