Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171766;
	b=gEXGyn5tauAEiyqeGyVZll2c6FIif79MFSCKwFQKgIh1ELb7LnZ12MaLjcP8egzy2CIY
	 EyQfTau93LyQM//diOM5JFemPOC1Kn/uF6A3Qm/q16+W3kwONKihULr52gHhfSE+6QAlZ
	 gmdDkPkN/IPLtpIg+PAWGR3gqgCm6jmK/4/9bS/JQJcX5qvYzQKU1KO+yYR8w7jAaLc80
	 cg8qqRuDYNQQXudGKUXcmmX75L3uz/WTqOCy/z3rg4DxjlDF8XEvPRfoBVGiXfrviywSF
	 OYcqFXd+iNY5cNHKunLXxKK3LBWOL8dbIIEYUVtI4FwNH19ycft6mwwScBM75Vv9F3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
	b=tDBSTVb4DZ8i9oDq4IuP2HkRpvVPdHZF6m+YhsMCwjZfH9SlSUTDJyhg9MD8MA7bUEXS
	 K9dcGfO0OEBesgJ6YCjaR47kIva80kOnEuv/QZaQTi69QZbkt6q/0dN7FIk6lIOqV+Ztq
	 4EwSFSUv/mHXm5Zcf9X0qLq/5v59KXWUpLAYSYvvTH1NQrpAO+Ui7WjCwcSD9gCVWtYSx
	 gssEHTpS4IT6DZMg+4/lPVomS7IS+iDCFciXfmGBajodARNeDSq7NH8N1geiPf/rAIs2k
	 bPgrfiu/eBdL9UfKXLvPPhRPb9YbrM6usWGPn5cuzefjx7olPsVkzFsK3fb1gBBnVyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bj1RDHAt;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EC5606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EC5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bj1RDHAt
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so4612995e9.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793171764; x=1793776564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
        b=bj1RDHAtB7vjolh/24QUvBkjTKpiQ4fB+9unIykEiiFy4aRwpzNeawm3XLokJFOah2
         L7uL3NcV9qrvoRUqBUstYTl/vbX7YesKx4ZUfFicl7U0ZsfVEuiRMkTUPaMCfpZXAnxc
         /JjgXahGqqSkk9nnUASL9ilmPxeG/bwigyi1WtMUZTIUPREvuPQt1BM5hJSRONfAHWEf
         afYWiwnrkeiWB613fQ2NABYwf+OZPqsBHno58MpDGrmclIEV2sDw70ph5TLcdta7Hequ
         EyLnEWnEbaAVFzWmaI/hvzq6EOv2s3YJ3knhw/Y/8s2NJDbalyD+DZeCRZSLIiJqsPYN
         yC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793171764; x=1793776564;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emtegajvD2PHGqYHH217zdcmL1omyniO8biT/+kuRok=;
        b=CqR6/jL+7mLMmAXqpEOSHzLvAuWYdEfjPeyr8HPAds4OzRM76x/Lvv3xolxQfbbYlp
         n0lQT1dfG9vz33Zw5sPb0MmhUbweM+QBaMx6k1aPuAyEB/3IG6G4rwmjR1wB5tg+1IZD
         Tyj8KjpGO/Scd/giDf51DvXwNeT9wS8t5SWB68GfoWZcTW4QLTdPQ+9BGuv70uDSJvbe
         AX55bQRNu/9CuFosTDuLVJjPyab4YuDMKmAJs6pAdKx4YXX4aeWtlV1TzvKt46G/2yv6
         Z+pQHsVfFjMcVCa4xDTwyD7jIIU856ietEyvXYLrqizdbA7ZBYSdcHG9/mP/cRBlD0Nn
         eX2g==
X-Forwarded-Encrypted: i=1; AKwUvBxlrPldFSioxZDU4q48ERFgQbFwZFYk2IHu+zC+u7kzAhl9AlpC5tt1q6AoUT8bC0nXXE6XjDwIW4e3@vger.kernel.org
X-Gm-Message-State: AFq9FYJPF38HqjajJbkML35MtGttD+l1y1hfvzPT7SzPHjEQzO5X0635
	TncTj5Tkth997tJFtorxGTTJWNkBOK8xaOmyK9g5i88joiM8l0bdS9ppAPgBv5LF+bM=
X-Gm-Gg: AYBFou2h9mQH9XvhMRO3ajpPEsT9jKjFFTBzAZ2h5DVMWjVxAQpPSg5CX1Sik0ru3PJ
	Sq7gqERtEeeicY5nCdtdaoiuLldUaLZHVqlYxt5KL0ngQmCXStF5QaWsrX1Tb7L08vhy6OPg50e
	lwg7/LSs+R2YfQtSIRTzZWK47AbMzfW9ldUJDZ2x+TPqJe1rxPI099hHn5C8BTVKVtMeuznWISS
	N+15Igo+dGHjiv5B+OPPhKy7Hwdy6ge4ZMTV815m6b3tyckXCJQdJWUkNfNNz2BK5w0YyHV5MFl
	g44pV95QPB6XExXyJoiB/Z7iJYex2jVxhrxV507v+q+kkRGhjTFN14HqUM+LwZca8l11iFzhiiy
	8e9s89sl0MWnXvdDcsTUAPXVSABehOZwG5/nHd1aO5F4oZSEmU1ofd9Jo5UGWc9B055FT8RQ8La
	H4ThvaJgqip/7PqZ6yebZTwk/9Y/DfuSJeCqf2xT5Oz3PqLTcMsPG6DQHKquK10Ex8P6gH3Aj50
	5RBPtKh4ewMvjQGKvCjHXP+2MdTYcv8O+b1DRFlyLTMLJObUyLrr0qtjk0SfEJgyK6EcOidz8zp
	nJD0gOWJhdTIRD4cB6C1sw5AdI6G6+jLgb1YCpOj0ATZvvUHun1XAoas0ilR6JfNWMuiDP6GqFq
	k+CqQj1LNYIeJ7AM=
X-Received: by 2002:a05:600c:6098:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a9640f2328mr26189545e9.1.1793171763595;
        Wed, 28 Oct 2026 00:16:03 -0700 (PDT)
Received: from localhost (p200300f65f19a904c16506b94501b867.dip0.t-ipconnect.de. [2003:f6:5f19:a904:c165:6b9:4501:b867])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a930a63eb3sm26054795e9.1.2026.10.28.00.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:16:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 08:16:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <auGg1AwlHMTKYAL8@monoceros>
References: <20261023204209.48556-1-olivier@mgcrea.io>
 <20261023204209.48556-2-olivier@mgcrea.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7kzx4bd5q3rwseko"
Content-Disposition: inline
In-Reply-To: <20261023204209.48556-2-olivier@mgcrea.io>


--7kzx4bd5q3rwseko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
MIME-Version: 1.0

Hello,

On Fri, Oct 23, 2026 at 10:42:09PM +0200, Olivier Louvignes wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id without all the
added build dependencies of <linux/mod_devicetable.h>. If you insist on
full iwyu, use <linux/device-id/of.h> instead.

Best regards
Uwe

--7kzx4bd5q3rwseko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrhoS4ACgkQj4D7WH0S
/k4yYggApnKsIa+rCf3BFQJjly7WiAmxlAQR57PJQJaEPivBmt7SsrrspxVOOAum
ZSo8hfftL2LyDHfMgYIzt3la64M0m9Ka5MNheXRDG3NuIFW78hiJY1uyy1Sy+fcU
oPNpBjjLJWxzwjcGLUxIbM4kPqmIdsBamY7GrwDSB3BeNHFmOL2l6oLaF7QF22sC
3rDO8bwez9gW80BWN7CJCjpw4ynQK6LaxRX+7fBFbX4fRvqIL3Onp3Nufmp4TVo5
iXpJYlTPv3vt8tTP6rhxFh3R+9bmnzR2nc8MUCJJmAb7qRiaZSoQ3kz09LzpeVWt
eAau0gujuBeEzy26ASfKDcl86MpIng==
=0pQ9
-----END PGP SIGNATURE-----

--7kzx4bd5q3rwseko--
