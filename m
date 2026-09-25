Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A53476071
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325006; cv=none; b=d3DKEKKUbVDCLMmYW7GwSBfuXBFDBp5qHdp4G9HhkEMwG9MNwwpSFc3CH3gQqNjrI1R96Q4XgW/JWXIHZ5QJKSPdylB1a9SdqyNYqatjQWTiiYA9YFa6ppjwg84W30yZOc5tfNvDWckthKVZzl4E2qwCPP9aCDy9RFA6htzJGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325006; c=relaxed/simple;
	bh=7Yqn/9QKc0RPp7Ok8AjVITceRGKTpb605+kGQ1X0p+Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r8+DSSWAokKZsgctPoDzc8pRRDnrqjqF9kVpT7y3m9bi+UfYPuJIIwtRg/9JA7hz4kODFIAM5Gg4Ts3AT+nDMu2IPMiA3jEcGu+nOpwxqzQCegdoSKVdofTK7BCfv6KCRotholPlDryIZRL38UHvSkl/ik5HlDnpANTinxWe5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hCyYg2eu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hCyYg2eu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so4566165e9.2
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790325002; x=1790929802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIupO2OT5b7vAUPs104S95g1bWYJYDx/3eWoPMfexsw=;
        b=hCyYg2euqkp0knykE1fUK8RyUUPZjpqSYKmBFx8ZBDqQY6mOLzS+zHh5s3WicmsWDm
         NhNqui2hrNv0XEI1IcPIAyBfDQyL0ukwB7AnXWfa7WiYB3EbhmFSTtqAKDnKi48+eaOd
         Pgqn8v2ozkaKtJ3dOrWEhV2yhEmgLxz9cwmDYcyepoEtYjf/QOmBJBoJB53QOsLN8Kb0
         I7ACfEEnlLNRwlkZcHaIGyl+zDoNi3PITqkxpq0PElyjGNbTqWahXloUIK3Zg01Qd0gX
         iXU8NDK+lLy+7zi3SUwjyOZ+rHjtU08CjIqWqp7q049E+XmjgpLYUGvN9tPH5gCU61qo
         pE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325002; x=1790929802;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIupO2OT5b7vAUPs104S95g1bWYJYDx/3eWoPMfexsw=;
        b=D2CRhOrCPBmQvCs4GMMHbMfeGOZZFua5p1/ZxRffk+bzY1D6Fgl7gyz4jYF2Sa5vqT
         IcKpeAyPp4kS0EacOEBpUYHiSdnAyGDQPu3q6XFnR8INeFDLROYK0LJEvRPzPYpCkaCB
         1TxrSOjPyFQWox7WgoiWqd/JKDqShE8qIuWJs6Al8dGDDRiGS36MmIyxGm04snFnixuJ
         PJ8O3wh1xl7O9cu3xPy1L52SFAlWTH8iNLsQ6CZ9aHt0j+JVNgp3hPWAY/0p/sPSqZkG
         YN83cSy9v8QakKSzeRRM/T++EhjJWhCr7usA+Y9keJcuFgRVUFr2r4UTZv1PEYKgo58m
         QucA==
X-Forwarded-Encrypted: i=1; AKwUvBz/wozP5Vn48qqZ7mK4N4X50IHzXG4YL8ZIFHjwEi0GJa81gVycZnbtieFVluSMHV/l9c6RB0tuFxqC@vger.kernel.org
X-Gm-Message-State: AFuF++k/9ekqGLYUHvqy0JlB2frdoWlFeptf/A3ysawQ4vre3z1NKE/B
	yqCbJ4/keuUThNpiVAucW5eNMwEhGEnpVLu9b0z9g8kuyZihJEg1ZQaW34FGEByaIu8=
X-Gm-Gg: AYBFou02wKnNmMby96AIwUmOweM/udFvTCiYeA8Tj7z0ZaIbdNnjUqtrTDs6dpqoRMY
	2NVDnFJWF2scKmUNTZ8q+s9ClUE79iFd/UaoNRU/J/5mX7lgzbht+8ZITlPjBc3fuBSEOprb2cb
	k6oLeQmAL+LguOMJrTrnx2lRo29VRaa9Lj9LnlJQPlyrsVBeFDZePl4T5cGq4O1mewGTeBJzX16
	AQFD5xhz2QeEePWLiXqezrQwVPM02j0SZVk9EQtVsd+j4DvVABVjC4SKmJSze79pv4KTQ8ZCqqX
	/di+EJGZxMLt5hC+hSK2qeav0KOe6eLzg4j1Wdn7dRrxIVP2feOixVlwJXabFr1nMX156ttkkaj
	f62NOGJ1gBO0F6tHFJr1cnQPdCRKoUcSuLJ/or0UrHxjxlMR0PnePwfmGJ4GjTx0GuR53GGJTWB
	+ARa5PnN/YA5VTpYSx8/YvhxVs8FoaP6D+q9LMP1pMkoy0x/hJZLkEdlTIvVVFigrYIoYazyWWr
	jq52TYRf0jHlHYy3QA=
X-Received: by 2002:a05:600c:3b02:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fe647dd30mr94864315e9.0.1790325001475;
        Fri, 25 Sep 2026 01:30:01 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff069d071sm50123615e9.5.2026.09.25.01.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:30:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/5] net: stmmac: sun55i: Add per-compatible
 match data
In-Reply-To: <20260924204842.9457B1F00893@smtp.kernel.org>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-2-15735155a789@baylibre.com>
 <20260924204842.9457B1F00893@smtp.kernel.org>
Date: Fri, 25 Sep 2026 10:30:00 +0200
Message-ID: <1jpky191iv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 24 sept. 2026 at 20:48, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] net: stmmac: sun55i: sun55i_gmac pointer is lost after probe
> --
>
> commit 96a080b2a3499368db013319e188847cee61183d
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> net: stmmac: sun55i: Add per-compatible match data
>
> The A733 GMAC210 glue registers are in a dedicated MMIO region of the
> controller rather than in a syscon. This commit adds per-compatible match
> data holding the glue resource init callback, the stmmac flags, and the
> glue register offset.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c b/driver=
s/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
>> index 862df173d963f..c4df532850074 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c
>
> [ ... ]
>
>> @@ -107,22 +128,34 @@ static int sun55i_gmac200_probe(struct platform_de=
vice *pdev)
>>  	struct plat_stmmacenet_data *plat_dat;
>>  	struct stmmac_resources stmmac_res;
>>  	struct device *dev =3D &pdev->dev;
>> +	struct sun55i_gmac *gmac;
>>  	struct clk *clk;
>>  	int ret;
>>=20=20
>> +	gmac =3D devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
>> +	if (!gmac)
>> +		return -ENOMEM;
>> +
>
> [ ... ]
>
>> @@ -138,8 +171,15 @@ static int sun55i_gmac200_probe(struct platform_dev=
ice *pdev)
>>  	if (ret)
>>  		return dev_err_probe(dev, ret, "Failed to get or enable PHY supply\n"=
);
>>=20=20
>>  	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>>  }
>
> [Severity: Low]
> Does this code intentionally discard the gmac pointer after probe?
>
> The sun55i_gmac structure is dynamically allocated via devm_kzalloc(), but
> it does not appear to be saved (for example, to plat_dat->bsp_priv) before
> sun55i_gmac200_probe() returns.
>
> If the structure is only intended for use during initialization, could it=
 be
> allocated on the stack to prevent an unnecessary heap allocation that
> persists for the lifetime of the device? Alternatively, if it is meant to
> hold state (like the regmap) for future callbacks, does the pointer need =
to
> be saved here?

Yeah, At one point I was thinking of setting stmmac bsp_priv to prepare
for a possible suspend/resume support later on. Eventually it will be neces=
sary.

I could do the stack option or keep it that way and set bsp_priv.
I don't mind one way or they other. If someone as a preference, please
let me know.

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-allwinne=
r-a733-gmac-support-v3-0-15735155a789@baylibre.com?part=3D2

--=20
Jerome
