Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648350;
	b=vBgcEiQ4tEbDobRG8uTpjtYGzNbH7HkQ0dAPhMfz54GruI59ostL7/wit2s6J8+0TZ1V
	 iT5vm8m50Z9OpD2/a9JrKU28PzAVgLANEf50f0PFN4XdBYJLK0GX2BM33olGfUaAZ326N
	 1qs1dcJZmycRwanmK5hWmMd2eEK/gx/44eBrbe6OKmdWiRw/xc7oCpa209Eupkwcw/UvW
	 ZpjVUN1DHvy5lclOQl+Qbtq3ozMPNlwz4T5uCnSMTh1QET+6n57OQ4NguQl7H8JalLaXX
	 zRIj17hCQMpgOp79N9ylU8stJOmLUWYxkCF4b8CKfIMm7IPk928zkT0FVkOOHrfTOQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
	b=lD3QbkceMlPP6jylvpsoDNq09q1yvtpfYTTv1CahYJ41uXa3XHQgJkLbWjfUlG0M+AiU
	 JSl0MyYyCoBPqJ7D6jmX+4XDYuzG7Zuy/BWMuw5//LgNpH869UKOPY9Fekx+dyGyEXJgK
	 LeQJlYfmtOoxoiGXnLmkIJAZ9QKyf1qkDvur7Nd+FNAI91/UueDr6Rni8EHMH0Cw/lGdn
	 nLANxgVF0Wvg8Gp+JJAEvvsmCRGvI80zNSETnjKOAHRm0B4AqUqPOahQUQIk8b4zDVKIs
	 eyLIoBasBFHODtBlsZsK8dxavXrWC0ck/DmFswooDaDRlqJImQ03sL+vCZJDAS2rZIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P9+vfVMQ;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC4B606A680
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 23:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC4B606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=P9+vfVMQ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so41508085e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 15:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795648347; x=1796253147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=P9+vfVMQuEA5tApB3Ym+P8H7sPqn9qUi+CwY7nhtWJ/GEq21N+YuwnNdE7iVGw20bZ
         dgEYwQq4qLwfEZ5QGeH8wpnTY+9HTHRiTm9S56qrqXGzjRXUgjA6nZKHE5zoiuQgQ9DJ
         JSSekzHetnM6g9vN0zXnQ9SBK8tneNkTvPOSOwv4DVq8lAoPP2Vxp3IGuLXSpx20hrEf
         25UOybrnutUF1MB2Ba/f1r/iCHNGotD9Jq3BSyO415okFTxkzZRxdC2QjHIb3y+ysD7r
         S+zqG6SBRdD5fnuotFWNOiQLCPVOer5mKJZbhI+TbAdKrBrt7pDlfptq3gjwKl/DUjbz
         MVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648347; x=1796253147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+DhYJ93tfesWORfibIV1d9I4czZkNjxK3eLYv410RY=;
        b=HQ5vOkC1FPF4pI4wAaUhuoFTKk7FcahcdwEN4b0oFSrkYz7v88Dirm27E6dleDaTBe
         Qu1RUFLUjGmbFGTuXfGVekkWlCI3Nt+S4NqrooVVhajceP/zlOSbky9ZZAo71K4zxcMg
         9ns4lFx/yHKdNE26xYHxiP5DlhLrX054S7weQ3upgrzscthZlXLWK1VEvzLppCRX+JCt
         WrI6Z5idRA252BrLLR0WLRGvEkr7oQzbVhs/L+MJ9CimRDr+19x1Mj2lOIrKDVbl8kBu
         Dm5KfDGyXhqTGfaqv1U/R/MUPwJhwwrHzL+7xbbAZ7xPoNGr58LOPOfRvqG8ekF/0D0a
         twDw==
X-Forwarded-Encrypted: i=1; AL+hErEGYjfRrt02m5GQiYZvYgakg8BhrS6zH84jH/Hi2hM7RdzLxdkXc62nG/Jm3y2fki90LWnjtgM5cg/N@vger.kernel.org
X-Gm-Message-State: APuU4Z+4MErFnJO3gnubqjm3BszDnBj4+l4t0UUoy9fN0Ed/VMnmn0OP
	UoDcQS/nQQKln5xShJwsmpqIOxotH+HBi7vReuTsfJreRwIl6hihoG47R6+crYBaLHs=
X-Gm-Gg: AZFdTZewSZaFH4rlG3njEx1R9n9SIXfX4EabPYD69Pn0QKyvh8TzjxSh2+SbPaY8nJN
	PhtRU+iAEiQTOkC8FZu11u9J9eruGijDoqodk2e/YQSbvYw7j3Ld0sAFx6z/8+w+Wu5NkV2hD+u
	w+lUTx4nU5kBxRAXQI8pWj88N3YI7/hVieKPCLr3Kc8AUNMcAcz1bN4R10g2ZCzM6Cvl0j2XBgD
	Cm/+CDqcTyyUwSamLI6Vvl/zEtlv/0imHgwmZ49PtMNZAzuC6XBUEsUuU7yFXJpQL79aoZYNp7t
	9vKqsIMTQHrYgOw5aRIDR0ClCceNmD7fUTGe1/N6C3BefrJurWYRRZfEbbAOlNgDvroqoX2Avll
	M82ZKmhhVBlRYVYegLh6AbWn30RTR+Nz8/BNK8NYCEFIYZwS8NSCxAImD3wk9QEJVl1B1gS2UKf
	1Lv8eUys91W38HAQfJaA+DKm5CqStb5XT8Cun8m63LLtWWfReg9P5SPXVmKlYYR9Y/MBAopyj3q
	1GrxXFja38IXC3t2qmkldgNV51fbndgr/XQr/mZIKjqF9rXxl5j04STrrTaXTiqlnSxLm7ia1rH
	ESfRfY/Pa22xBtTrSgO7A/m1EbjgGLBx1AI=
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr395769935e9.17.1795648347566;
        Wed, 25 Nov 2026 15:12:27 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8533579csm480759855e9.2.2026.11.25.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:12:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:12:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>, linux-clk@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	Mariano Marciello <mmarciello@google.com>, google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awdp3W7LWfQ3ZrIy@monoceros>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
 <awc0sBl6q6A2Reaq@google.com>
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
	protocol="application/pgp-signature"; boundary="khx4cneo7r6erf2z"
Content-Disposition: inline
In-Reply-To: <awc0sBl6q6A2Reaq@google.com>


--khx4cneo7r6erf2z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 11:19:12AM -0800, Brian Norris wrote:
> On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > > +#include <linux/mod_devicetable.h>
> > >=20
> > > Please include the specific <linux/device-id/*.h> that is needed
> > > instead of all of <linux/mod_devicetable.h>.
> >=20
> > Or better still, rely on the bus headers to provide the needed
> > *_device_id structures. (That is <linux/platform_device.h> provides
> > of_device_id (for patch #2)
>=20
> Only very indirectly:
>=20
>   <linux/platform_device.h>
>   -> <linux/device.h>
>     -> <linux/device/driver.h>
>       -> <linux/device-id/of.h>
>=20
> > and <linux/auxiliary_bus.h> provides
> > auxiliary_device_id and of_device_id (for patches #3 - #6)).
>=20
> Also quite indirectly.

Yes, I already thought about making this more explicit. But this isn't
my primary objective currently. It's safe to assume that the provider of
struct platform_driver also provides of_device_id. While a forward
declaration would be enough technically to define struct
platform_driver, that is not sensible because most users of
platform_driver also need the definition of of_device_id and there are
too many drivers relying on that already.

Well, but having said that, the thing that I consider important is that
no new users of <linux/mod_devicetable.h> pop up. If you want to go for
#including <linux/device-id/of.h> that's fine for me, too. (And similar
for the other busses and *_device_id structs).

Best regards
Uwe

--khx4cneo7r6erf2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHa1YACgkQj4D7WH0S
/k62MQf+OKGka4mPSwopQ0+gI2VWXrdB3QhqgUL8ffjUMb7jkBi86oA6YfcjNC/D
8aZRTb/LZNPgl7ygdsKPEfFKlbKH1yCA+9gfN/aS+x6ykkZUKdn1Ha8m8ImuN87s
ooG++TXgzYfljHdoCVeukZsRth0gqt+QTBWLDPPUCDzC543cmPPqIWNi0LXdgwuf
OFve6MraHVKSLw0TVigzWyx0MYat5C1Y5gWVcsnmShhh1D18CrPfvFcu4dFot6Zj
IsEZRk30Wuu42YCnSD1t+UeGc+VDD5hxC1JhUdvN7txOJr1NHKdNT11aByux9mPD
ityFQTt/321OJci6adJV7NMgTYNlPg==
=MU9a
-----END PGP SIGNATURE-----

--khx4cneo7r6erf2z--
