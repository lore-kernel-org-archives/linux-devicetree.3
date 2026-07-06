Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E53346A1C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358021; cv=none; b=m6uN0gURKCju7Vcrk+pBPQwtxzOhCsJi+ZMfQ2Vg4a0ElbPHO+M0A2u1GJIseaCN8Skzw6FCyE3TgFu6X23uRgMSw31NyZtUsltxttvco1Kba5UqniYADtwcDOHBhb+SYNd3cmjk/Vy9/KyI7ohgpneFRqwNYLUDQY0r+OX0oCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358021; c=relaxed/simple;
	bh=MCc729RJhXwcN6DQHcIMn7v24UelBx5SMI5SMzKcwRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ60URad8OAG1nxOJ9j4TaV8+Q0MZ6YH4LTlAcH9zEWcE5ID17AAGKVlMgHvzka/XinIwRMjtcH+bmMle0PKql39AZgTpHCgJwc5U+rjJrSWFZ/rAkycvkY8WJ+nwyeLWoNESPQ9YOwYGpvowUoJWrePdfTItLZn5MKb8Xov3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VPp/K7mp; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VPp/K7mp"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so2185284f8f.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783358018; x=1783962818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCc729RJhXwcN6DQHcIMn7v24UelBx5SMI5SMzKcwRQ=;
        b=VPp/K7mpu7oCEV5wS9BkjoY+PcSrSVOlvvMuCd+yKet0r0lgrAauN9X7zyFriLlCUC
         fdVZlV11MYTjaRhXu2wmxOGs4TKiQv1AKPtsAxQehxLdzcriW26UJJ6A3PL/4HwO1RZU
         EN0miJgog40UbZtw7F0WnXmztiWIfi0WMbMVuDEBE5nMOHpnEQVtgdVrsYwBzvw6KtTX
         997P3nl1MsANQeVRnfNbN8adC6GZpW6xN4PujZ3FMXSvbJ8+FBxs4t1QhNBhFvPZIRwj
         bvKJUBnA5HhKOTV8UqfiMUwS+sHDc54cQCoOqj12wR94VToLrAJQ9pINNd0zqbF6c2O4
         FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358018; x=1783962818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCc729RJhXwcN6DQHcIMn7v24UelBx5SMI5SMzKcwRQ=;
        b=sNF3uIxuljuCfLIeOxuPvCXaqSZgUX9YMMLIHksD78KavYvX22jEz+56ZhrlURLh0M
         Cz2J+B1KwVRJ4oINSqdpwoC0NzJsy4KWPyjMBkaFvN1kddRkl5i56qu2SYCUQOSKdxYQ
         1d2DXLsmkmheAosQ9BaNTfvk6lmEllR0SYOT8otjTVqTK3q4IeZXjJt48o6o2NeZXA47
         kAYbFqi3iUj3QFJ8hcdWwcWPqRnf9MIxKGVpv3Ad2DOzicptlOZd7Lnz9lnAhclCIP+g
         jHI2dR9wAwNpqos58kq0IzUnHhgsV6IShuyzjaEJCwvqtXwUNFJXg2micfDNENnV8w4b
         D7gA==
X-Forwarded-Encrypted: i=1; AHgh+Rqy+6UNhdhPFXOWVr0hShtHrpSSTVPA58TYzLq0siKf4QVVF3BWBoVKTXQGkTVqPHvdXpqKfwwRL5iQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSj8Ik38V94Ts1w7RKJoUSQkK8RGFHwn8f/H82HFaxNyBXhz1
	vg3ghNhAnOvDJfhf4Pj9Wyt+hvQ5on3uYOqnjidYY+CSbjwM4ldZ+AD5dtijV2JNL4o=
X-Gm-Gg: AfdE7clEfww/LDrOhCS9kwscQeNBY/4KNdpsZ84SYFTLGLIMHYFgJd1QW1gcDtbdMnT
	gg3ifD3EWN6UNpXDF0zTY4QUvueIGaMuaNo5EMvbuqM9vEO2cmiDsdK7g4zj+lRR9VCgb41mxfq
	EwuFfq4P2YB1In1V+JjhbNZrCkF+Xcg7P0JElQMzy0Rk6QwfVw9dMzv7UEaYKxfI3sQqx+YFhiU
	Ibb2LCwg1FBGyTNO8bomjTy1z9WQelFrZkCEScAj7zTH+10LU4hP2tDWI8ucxmXYbZjLMmsQIqz
	o25dL11WslOd1T4U5AM/SEOS+f4Se89I7I6z27UE/Q7Q0P8m3ZgzERs+QCcscfJvNANYSrBQHLI
	O3QMd1Oz+xi8tP3y8wULFoba2+OvYlRnrDboOuxs/B2e7JPdXIEqbnhR6g2s19ruh/TYZRnFCsk
	B3ZLzlLZBL3LK+zDb1w8cHeP4EtQI0t9gdx5rJKK5wXj1kwc3g2BZl+EGjTMSjYUt5KN0YoYKj7
	8zwveOioBJZQQ==
X-Received: by 2002:a5d:4951:0:b0:46e:6210:ad4a with SMTP id ffacd0b85a97d-47de66678camr1240284f8f.5.1783358018039;
        Mon, 06 Jul 2026 10:13:38 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm25028351f8f.29.2026.07.06.10.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:13:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:13:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org, 
	vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <akviE-ANATfFPdYZ@monoceros>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2f7b3wyhcc726iyd"
Content-Disposition: inline
In-Reply-To: <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>


--2f7b3wyhcc726iyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 10:11:13AM +0300, Atanas Filipov wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users of this header. Only use the
<linux/device-id/*.h> that you actually need.

Best regards
Uwe

--2f7b3wyhcc726iyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4j0ACgkQj4D7WH0S
/k59LwgAuTiKtFSft7ryJWgTp3oj8ijK3Ahhq+yQEbS4uMyOKNsstXY+Elk8JMCx
FxyXJEnGG2j+ygfRTonPe5nJ+MVypDKFkgwAw+Hh7enMUP6zOm57qLiVXH7B7EvG
PwFhKh58/IZjfVKTSQlqFg3+x2eC5YO9oYB+TdIxb8ZhWw1TPJAtJICLzcDQpZZC
NKDKzgQvTq6/x4i9Gio1RGSOHDlqMgKVkcDOWXhVNzZa1aETjAX4GsfiPciZEv4Q
MLhDaFZAj+kLgm6AjvvD4CM2/C2gBYXFXB7vHJBgVMBl6Mb/iJi/zltvGj069aHM
5+sMK+vEVq0oT22WbjohX9omeLDU4Q==
=WLCe
-----END PGP SIGNATURE-----

--2f7b3wyhcc726iyd--
