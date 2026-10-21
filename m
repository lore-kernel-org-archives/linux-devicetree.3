Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599267;
	b=suoPCDwGU0s9ZQ0l1z5lQpGHDJQVFjNaVRqZZ6UtLQUgHVDMgYGtqr0yotRzUam9U9o/
	 ZlO/oOZWCVn+v5g2XiuogabIZFtHD/QheyxBEANdeanJpZpWsVfnEt/TnDkCkugmp60Sl
	 FimnlFhguoEhL8gwxvVQWpMwETapl8ZdS6518lOr1QiL7kyjxpBfHX7xQch2lkiGOMMZ5
	 U8vWxO3uaiN6C6F/+VgQWGI827u3jWMnQKNt43wDAsWcHMnYQ6X0ehVdUOgLHGc7Z8ZD7
	 i3920z4Uabnh8pfwhM2YCQAqDX5KjksT6gBVy4dPhCXLKHLwZgVeEmJN7oS1jbBev2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EYfi7okTi0CauQZlFNuFbrUJBFVpuaI/7/o4adTAMHk=;
	b=mR2fCbajstqwV6DZ0Z+Bolk3O6JWfEzf8f2fuw1n6qE7+jzi7RdOY4/xyTE46Gz1z2JP
	 HmgN84t/5R+KSLjDY96TFkOWilYMVCWEI3jhdUdi0x7tc+Q9kPaofCFzYXNc5hrL5tD1F
	 QYacx2JpwJMEIj97Pd3uchjDnz6GDbAZU2gu6urNnPG0wVNq5uUY+d5BKbsW7V+JsGTqh
	 UIX2ppotdYssr2+2dqHZw64ZTXS/tAtmxTsv4oJ09TwqhLDhKLu1KtxiWNlgVYpngW5OY
	 +x4PJLUqNNyCvXnXdmRD2aRHPd/4m1g++Xh024SEEh9hMdWrDx6Ph+Bs9TaAj+P5tWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YCvufwYM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25762606B6DC
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25762606B6DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YCvufwYM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so801843f8f.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792599264; x=1793204064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EYfi7okTi0CauQZlFNuFbrUJBFVpuaI/7/o4adTAMHk=;
        b=YCvufwYMMCbR6JgJ7YV8qJiqV9S9KJVzrgAdjuqJJRWbg1Y31t8jMfajRYqEpvfdlc
         ACuyzdCAY65Mi7chBCIqIZEezxMU6H7bdQXFJ54h6WxVNQH7Exhz12cuQaK9Bs1TyK9Y
         un3TXpt14Wd+S+LOv7k0HrFzvDr4MmODYzBTky2uEGUvzSGcnxvD2jOfcdkvn7rD40m3
         IENOmr/NVpSqgPeCf8w0px+hCvFR3CGqZIo1qVCglnfVbWE06Sv3gce11o//6VMpRz2C
         ywHkVfiwIlPXiFQMbRMbwuIcpzmdF401Ys3BkVF1O4ZzU/7RRKQX+iCsXZ8avL9XOA3w
         oLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792599264; x=1793204064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYfi7okTi0CauQZlFNuFbrUJBFVpuaI/7/o4adTAMHk=;
        b=HWjy+iECVdI07UPvCPAI2cT7njWjZqzsFKPwXAcNVWQqhcCSN4dn4DZEhHcXGE+at5
         h6yYiUd3EiLtv68MSXwyvJeyLT94ks+pfHcDBfXa+MtvEgfTrZUmvt1Vb+Dyke78zpjA
         j30KhlXfuPYUmLSZliRQ0BB5zd/uGz9wx+jVXAwcAZ0OKtoXYtNHclAA3NDaSGlAA7J8
         OvyJ08zqkVumPpK9Vi9YvrV3D6BbsSZuRQ0P26LZvNKblXCX4/zFkqx+tsUGZn4E3VUz
         YqqsqHi7BCp4+sO+IrnVXF9iWwbcgzyTwRUh8on00qS/0RMZkxZE2X5AurIwPvlHrgY2
         5gsA==
X-Forwarded-Encrypted: i=1; AKwUvBwccVj8jfGvB2DSe8fjapOML9FiTwQiz50vEaI2JjCAwZbfEbSUynIZRvLKjrVnewqWZt42imuCJm9T@vger.kernel.org
X-Gm-Message-State: AFq9FYJLnR1AviODnu18FRsKicNT9UX4dleW2dblDRNHzLsXSF/4lrQ9
	n4MvUexgqifv9Tn1bb6fkutGTkxkgtO6y0eLeyMF/NT9eMz0OCBIiejM52OxwQOgN8o=
X-Gm-Gg: AYBFou0Hd0FtP0mZNqPX6/VpY1kslWmEO4l/5NzyRAmyD+qUlTSag/pdOxnNV3OWPR6
	EpqsYi/rWTcBYMzFJYzyehxRNwjdDPEQNr9ABvMEBfA9L0jqms6pFDeS71I7xqUGDq19O8f6yI1
	DQaTlnaPpJ7jqD2ybr59kWWOJwcClCF5uYQdoFtiNziSA0Jgg6TVsVkBEE1xcWVwo14VaUlYmjj
	22SCWjIRhm5pInqYnADJpIyybXKPGsMUHjR9cC1/I1MVVzkb26tpVvQEfYpN7s6tM9oxuz++VBr
	MXoMkaXCfGSn6/eUDyq6G2NbiY4cLkJ36pByKhejGkTXG1yXZ6ISZoHCnjz2BirhC3I+Hz/L4JU
	p+xXUOcmfElg06ctUhhrrsTYW4NfswVJ6MN/2wPqqROzvm4WOTDpXsbQnHbhpiQ4iGs+YXuhqMs
	BVOMs/3xq3Ykp+jEV23fN4d2d9tg220k3c0cPslTGKoqzae1GA4WSNoY9lDm2fz0Zzhm+AwvN8a
	HngaR54l3FQx60pAD1qkaFWQCN8fyFD+uLIqMvduttxvOsL2W2Yj1DlKqTZHNaEUYqdEt2+QPU/
	eKNT/bSqfsfUVM9NY9dXpbQz4y/6M9JMQpdo6PovEWw=
X-Received: by 2002:a05:6000:2dc9:b0:48d:fbdd:4132 with SMTP id ffacd0b85a97d-48e264a6345mr5617302f8f.18.1792599264403;
        Wed, 21 Oct 2026 09:14:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904634661a51962f5e0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6346:61a5:1962:f5e0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e25841fe4sm6698401f8f.53.2026.10.21.09.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:14:23 -0700 (PDT)
Date: Wed, 21 Oct 2026 18:14:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "lianfeng.ouyang" <lianfeng.ouyang@starfivetech.com>
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] hwrng: starfive: rework clk/reset teardown order
 for JHB100
Message-ID: <atjkINr76NvWasY8@monoceros>
References: <20261021083712.3032-1-lianfeng.ouyang@starfivetech.com>
 <20261021083712.3032-3-lianfeng.ouyang@starfivetech.com>
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
	protocol="application/pgp-signature"; boundary="n5t7utkqknwcdicr"
Content-Disposition: inline
In-Reply-To: <20261021083712.3032-3-lianfeng.ouyang@starfivetech.com>


--n5t7utkqknwcdicr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 2/2] hwrng: starfive: rework clk/reset teardown order
 for JHB100
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 04:37:12PM +0800, lianfeng.ouyang wrote:
> From: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
>=20
> Rework the StarFive TRNG driver to address hardware-specific requirements
>   for JHB100 SoC. To avoid reset-domain crossing glitches, the driver now
>   ensures clocks are gated before asserting reset during teardown for
>   JHB100, while JH7110 retains the original reset-first sequence.
>=20
> Add per-compatible match data (struct starfive_trng_data) describing the
>   clock/reset teardown order, a new "starfive,jhb100-trng" compatible, and
>   select the ordering from it.
>=20
> Fix the runtime-PM get/put balancing across the init/read/reseed/cleanup
>   paths, manage PM and the clk/reset teardown via devm so all error paths
>   unwind correctly, run the SEU-triggered reseed from a workqueue instead
>   of hard IRQ, and serialise the command sequences with a mutex.

This sounds like three commits, with at least the third getting a Fixes:
line.
=20
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/completion.h>
> -#include <linux/delay.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/err.h>
> +#include <linux/errno.h>
>  #include <linux/hw_random.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> -#include <linux/kernel.h>
> +#include <linux/jiffies.h>
> +#include <linux/lockdep.h>
> +#include <linux/minmax.h>
> +#include <linux/mod_devicetable.h>

Please don't add <linux/mod_devicetable.h>. <linux/platform_device.h>
already provides of_device_id, so just dropping
<linux/mod_devicetable.h> should work fine.

>  #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/random.h>
> +#include <linux/property.h>
>  #include <linux/reset.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>

All that header rearrangement is worth pointing out in the commit log.

Best regards
Uwe

--n5t7utkqknwcdicr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrY5NsACgkQj4D7WH0S
/k67hAgAkskrK7Zfzy1Ye0Z3TqK6UQV0vrDBR6LB4bRpA7K5fC2zxEHV3jjN6CwO
+k+1d2C/DKYEQ8arf67BX3wqGKW6KjqqSfbEbUM9trV0jIZwLPAHlyDSGxiVPKDn
z28jyuNDMjmVJfTZXUyD0/JRnyLo20evi9pEFGI0OB80CLwg3nWf+g0hnIVaJg0b
n2HZO8PF42OzET7+9gVski9Rh3qdq0kEBZgVDAe57ybfSKFM7pFDelzMwXYKxX65
zfSYB1qImYb0Y8oe3TA3mDYTdWXrh56+fLIWUAMAkBIfVu34qf8WfAdIuCcmcd40
lm14jNAcwCHd0U308PYpap0aWDIFjw==
=S1vP
-----END PGP SIGNATURE-----

--n5t7utkqknwcdicr--
