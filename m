Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F404519A5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085628; cv=none; b=Lqxt6XaJ+BgWcEy+b1spuOhJrp93Yi5iB0JCiAUe2wz04d6BMfpB94R0BZm6myrFHfvAikEZDUTxgvYGRBojjzRJ31KlnlL7hdruveQeMn2q6XYKeD0Dc6oJ7oHIuf/w3sw2RnlzEy9BlWaKFB7HLoleTug4YMS9hH4MwL+FWkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085628; c=relaxed/simple;
	bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXnB5x4z+JIMWek6YM0BrB5IDbbcVAa2XEq9A0rs2LWuLrsGh233EI41KGjSH9JE5i4F9DeWZ082DeHgQcCt6C3XsVGUyJw1FGdXofHKH28X1yQ9/qgj3eRVociy5o0yZxHOkizwD/SQRP7oXoDM5gyEZZt9/jBCmpki34c3HWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CfOSlEhu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CfOSlEhu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso22602345e9.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786085625; x=1786690425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=CfOSlEhuGYDDWyfbmlLfTdjvDJJI5OwpdbdBapgJflbUwRYDZijzOIKEyNvGRUdxhI
         QmjoBgPgXYio+5PzfXSiAYHEUmW2yVp97f7APOlI8x6sKOvQzmAlvG51H+qQngwcFNW3
         ngSBPwLP6FnmQ7dfHgQQj9CfsB0TaznMKLYC4EgQoL6xuLzhWLqPqJ7V9QYGdDGx+Hoj
         mfmpuKbxR8vToV5Crji2g5wpC8ldpCqRJkXnlSXUpSrJaNFvTS7hKJuSkFYKXpnzUd3v
         oiQ+XB3bezrsQBNFeAyH/5X5GzbQJkR9UfQH5pHBmfkh5NORtP0l3BpZoCKNzyDyzCKz
         Wkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085625; x=1786690425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUIF+ZoBfnPhDtlVbHIbfV3H6x1dAyvkNT/RRT7NjLI=;
        b=sGMpg8gD5NG0YibjDHwmalYJQ2AiaCoeXlwXQJoY7QvCvLZphZ25xexL5+L/GsspNC
         YfxRSOPii6ozrEkpfX++F1AqE8UXjL/+621PsXiHGgfQyYqGTAMTjiN9oNBLwqLkKIPK
         N+mXclaNwFgIyCmitVBTJ7Rqky+lA6Gm9Vm0imgjLQMiFpvFFOreiccEyglP8zf0hpgE
         Tmmo4m4IuGpab0fduwPqBqAKXo0JMJ1oZrnF60I9ZP6zhJpcmGBed0xUBXqyU7arZQpQ
         Ge6V6v1lLTgA+F3eIExubUXc1P3suI3FQKMI0VXK9cI329fUBxki8JPkxL0I+M+wLQ2r
         +7KQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBTs8+6u9UoYBd5SH5/QaCyRf7jzAqjvTjYGnl+0BvQ45q4nAR2MqI+qb9mGqX3EDxYllRNq81Mwxg@vger.kernel.org
X-Gm-Message-State: AOJu0YykEJb2b1WgamZDHeP2yCk7K1t9HMslNEkZcxbLiWAUOzFVVR7H
	TVWaYfuv5DIYetvbOQfm1ImrldXyjaGZSw9p7UZMCPcUheSpc4it/Py0STrF41uHSMw=
X-Gm-Gg: AR+sD10TaAxPF1Z/DZjrZLUNHryeya276Vk0cVrmynlrfTf2dCvZdOEL5tDxLGWPwjs
	M/HSHzX8j+DNrqjVt0LUF3EngEwE9pFtqmoN6pDbrWyEz9HSQsQSSPnVN1PJygS24PXJCmQpnjk
	tj+JskJxvJiIwso7HCewCY9cNov579FocX4nrb6rXnbTLzr4OOovekmX0dmRurUgJsfp9ULxeHR
	ENaBqyzdKra4QnpN9IQdoJERCXCli4hnh/0iIGfVnAqIu0YOcrGbXuwQBSDr+tz3NwFHoM4C3bB
	c3g2uCiy6ILe91N4Gb831mifTpeTB0ynTw7svIoFIqcWxZ0m9P4GwNW7JIPdzWuo5NScXrmqULA
	QDNozfpjr1xHK3aptnPta+vjF2DioVJjTDrX2cyZKnD1VETHLh2MlboN74n/iJ85Bv5FIFnVHqI
	oTJyuWQ/AsFyVbyb1SxjmWDo8lHkJobn8U0R1EvVsT/3ts37FtbsRfB0oGToJoWjZlPDQLsQoG1
	16gJ2/GwvilfFOKdGla2Wr5YedSaukfNudXKLwCEnpcXXyif6Cg
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr16392445e9.7.1786085625549;
        Thu, 06 Aug 2026 23:53:45 -0700 (PDT)
Received: from localhost (p200300f65f017104bf0aa590e17c3201.dip0.t-ipconnect.de. [2003:f6:5f01:7104:bf0a:a590:e17c:3201])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995422016fsm98840415e9.8.2026.08.06.23.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:44 -0700 (PDT)
Date: Fri, 7 Aug 2026 08:53:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Cody Kang <codykang.hk@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
Message-ID: <anWAmitXSFRUw1W2@monoceros>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
 <20260724-k3-display-v1-5-f22a10a52867@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjrvltbz7ftd6xiv"
Content-Disposition: inline
In-Reply-To: <20260724-k3-display-v1-5-f22a10a52867@gmail.com>


--pjrvltbz7ftd6xiv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 05/17] phy: spacemit: add Innosilicon DP TX PHY driver
MIME-Version: 1.0

Hello,

On Fri, Jul 24, 2026 at 11:16:37PM -0400, Cody Kang wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please drop the include for <linux/mod_devicetable.h>,
<linux/platform_device.h> already provides of_device_id.

Thanks
Uwe

--pjrvltbz7ftd6xiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp1gPUACgkQj4D7WH0S
/k5t1Af+IUdmJ1rwWz3XTKVvTnkiumXy+BBJlthTfpRB3pFeiGILfF6fTXLHen+q
HI5KuCh4tnAo/jb3zLCDqO0RRmh14m5WlEgbMnFB9NGgBsbmj77K/WjLo2asTvFN
zTn9nrSjAtcmoJs0h4hIB3zaaueCYiWTGq8S2lIKH5D3xMUy61+006h2s5Dtrzlc
fHv743vCRkGoaGQWxHvpsgkx8Sp7WXEwZQyMaRvSggG2FiskKlV5pyM35siiJuAA
re4sCShFRtGFOhGjKK+mM7y8skzgBNqDocWT4sYp0QYeW6w8nwNHyKh3KUN//afs
1fDWRTlDMEJQqbI9K3OToPHbVguUIA==
=glOr
-----END PGP SIGNATURE-----

--pjrvltbz7ftd6xiv--
