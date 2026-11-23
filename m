Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425421;
	b=wfU72B7jopvPORrwaOGLRjQR0426rs7IcaPdkPSi0RpeDoNRNHA9fWbErB957VHfyF/d
	 DIbUgWaHNeXMbEEoLrgazYbuDox0hGRmJCgfPANVs/H0IlTgvcB9XEoakMX+RD8ovweq5
	 W/MBRdkjjRugwrvraELRJxqbq9EVKm/OBj3jbcIiy6wZklCe9oV9yoHbiRWsDco7XIZAF
	 x1jmDcO5j9QU4ECsydQ9Jfui8jcu8MYTXU1MbWSd/iGV6UX+EorF/1tru8h0L5DAZtFAW
	 B2sCuTPkMk2pBF3+32e1uWdXcpSdL6YEFPx2lMNEr/0YVGYnEU9WHqlJUNsp5XgWb/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
	b=pxAlIoRKgw5ExdinZPUdVZvzGZbr87M44BeCc1teNCOsiCkmqP5uTnG714X6NKItqoni
	 x0lrOCRL7lg6TQ2iwgm9OIvmPS7wmNKWl3aisPscRF0fPVwKGKezFwhdJIUJSX029/yCC
	 U9OAitArIwuqrA0sufofPuq/ttbq8xnmZgWEn4uvR2mylAa+uduipudDop3VhDMA5fnls
	 +IB+K0Uyh01rra8wUBLe1hXSbKBPl6zkzTfFHFh/eEcqH2J8XbYhSx491MYqSvkxCsPTr
	 UxceuGj6awshR1TH3sWPlhM/HCiSX2nUOsjtnO9LR+JFzygHhx3R3cDzDe4Fmpz6eyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SujOSC3b;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CF4606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SujOSC3b
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a9be758734so1788684f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425419; x=1796030219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=SujOSC3bJ6T5qZYnGcOUlGfGb/XPzEz/mcEywcTIoGYC/v/096w5zQui8EIrk/p2Cv
         cKCrDJV3hNKyi4Q+XaH1MbeqOl2FjAJPbqvclju5ti9weuviulXhw7yJ6g9cD8SnB+EY
         NiRHE6rL1xTY7zHCjnfM8vjPsa+ffWVQI+MXLuMxh6zoIGTMDPrOFTgpO0ErILuJt+pE
         Eq2bhuFgPdWjpQq+YtoYvEh8QCknNuwPr/4YslboIRW6Tb6Q0WlwOiizJDnAwN30eCzO
         yJ09eoWNrpIrDwPh1vIqEcRloBzHouFWuo6mGf1X0BK+tC7e3DB6KWGRuwLm+GgwrSnW
         o16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425419; x=1796030219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KntknVNj068zKgAq+zdLaDv094kaGVDF9/OJXVQRtwA=;
        b=ITlrHD429Zt0Ttx7D6IRHVy9o2MHigIyji1Rl+LfMSiPEEe6TOC3jnsXJjW4vESrqF
         vrOgivZv+8L5kgrrNWfytY//txX/jZjEDdC6TixTXfd1zJNTzOtot11vzvBqM87HWFhE
         K0+0/hf3mfLvjnVFWZhM6p0zcsaIrxXtZMr3x4BhC0KXJV79nZ9+K1RUPy8sne9Y8O2J
         0UkYrAUkFbLZp4kp4phFlPw/4Ka5xZHy7lfOyIZ5uhPLeLz9C1nXXDctXBVmTZ82IdtT
         IkaNGSIPyQZ3V5trdd7uSidjpV42p6XDYnoOKflMmjEvmQNjvve/JHwf+E6BZ9OsXJfI
         GNQQ==
X-Forwarded-Encrypted: i=1; AL+hErG/H6c88lkI9tthgfpi8Q/cs1/xihDKsLFWKdQT9CUxkydYvNuEbJcM0pS9l2F5NS0wtmJNRNerl1cL@vger.kernel.org
X-Gm-Message-State: APuU4Z9iyFqWpwxKYqmpnCsBjemvIm/Cgj865ci6WN1vTgQNpuvQQXHO
	EH3dnLQFf2eKn/Meq5UQG7tiu/pCapdHmhTqGxVanqDy9PYZAtmc36CYRvg5SpXVEIE=
X-Gm-Gg: AZFdTZeGOhI6vfIl7rdqk86cDWUiKNqDIQbOAQq0ah2aS9pZyF3yWVtRON8bbZLZ+A3
	UfPfN20iliJIDIELrvVdv8oadM/AvWBYrqd+QvmuH66hWHzkGP6hhQ3sfC37DWfJnv8ZRCJRmex
	BFUVVA3q+O6Be2zdqKTYI7fnBJ5yWvP4RlLOJxfK0mFuWXIQ3Z3/LIoJHCnLkbyCPz4ZiSZ6zTb
	p6Ck3O6/ebvpa8T3qi3R1L0QWhbdUuh3ViE4stwj+PQVhe1zAYMDspVBfq6fJIyVhb22zmXm842
	o+Pkx923pXTLm7st+0LR9CACZtaPcVe26rFsl9L2q6kFzEnDczA8YMdFctAcCec0P/GkvGdTXQy
	xzrGX3CC9/yR2U7P5B1odZn98r5pBeZGLN2vT47baHhuYJR3J0T8ekSKlhrtLE1Gl1wbbkz1Xma
	zJCwL26QE6NB80V18jVzRSawtPL4/63igWoNe5dD7HS56hIC/BBWHV9gk5xVp0WTq2bJgacTTtO
	7QRhrILUdOqDmD9aFudX841PAaBveMP+wBXmDb1tBstHb5l6DaTbyPiZjij212s01TgW01u7WPt
	bobk5I0qpSiSRvmt26J0SQWVMgT/X60zmK8FR4+GUhekyce8tmj/nOUwhm2gGuAnJ4uKB3OQ7/G
	O5bpHvQpkc09sHJHN/AXvgHhh1K02Yyn4QVS50Q==
X-Received: by 2002:a5d:64c9:0:b0:4a7:69c3:94d5 with SMTP id ffacd0b85a97d-4abb0e469cfmr20062459f8f.28.1795425418389;
        Mon, 23 Nov 2026 01:16:58 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab69bf61e8sm22313933f8f.11.2026.11.23.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:16:57 -0800 (PST)
Date: Mon, 23 Nov 2026 10:16:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
Message-ID: <awQEP9bHA0RPfRUA@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>
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
	protocol="application/pgp-signature"; boundary="o4xfpqjjox3khpoi"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-8-b0309d0789b2@gmail.com>


--o4xfpqjjox3khpoi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 08/13] Input: add polled SiRF AT550 resistive
 touchscreen driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:18PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/input/touchscreen/at550-ts.c b/drivers/input/touchscreen/at550-ts.c
> new file mode 100644
> index 000000000..89c2d2701
> --- /dev/null
> +++ b/drivers/input/touchscreen/at550-ts.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* SiRF AT550 coordinate acquisition. Layout cross-checked with AT551 draft. */
> +#include <linux/bits.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--o4xfpqjjox3khpoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBIYACgkQj4D7WH0S
/k6Mogf+I4t6gj7ob8tkta5kHm+YP96+f6rsROw+nYQ5NXBDBTwdaHgtuxTw/3u3
9TSFi59BI6mt1CJkV2ldOhel8Do0lFyFlVyx1+tlaLGNAjrt3f8m2IWJcvQU4hQK
qCxr790Ac2+n+6M13QHVHO8E7+V5Kxu109uuNUNUWIsrjawNdIUx+lqOywM9o/JT
s7dUkwPF41vgxb8gPn3Hr9uAImmkTspc70TUfxqNtGVNmQlizkBCtSCoABv5QCdW
mXZx4sl+NJUJpqZ/jj0ehbdZ1DT8xVBRF1ZDrDU0AdqO6EAWVEnOx3tb5+7JsaKI
HSj3Bm7869/tgf+jXQ3QF1Uu7I1vmA==
=UpFb
-----END PGP SIGNATURE-----

--o4xfpqjjox3khpoi--
