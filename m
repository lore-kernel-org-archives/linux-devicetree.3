Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7BF2E7380
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781809162; cv=none; b=YeA1uuLhJXPGvdhiELCuJXRbNdILuklf/4001h+5978NqCvU1BkVE9Bgt0dffkK/XFBRaCiCKO6HHaUnqcpnnsTULJSDLBbwAqF0DwY82o+fMCyWI/pCPddjKzzadBcH9hMYigXgr2Z4hfaG9U9fMXx7HB8bc8+omS6NCw7ANc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781809162; c=relaxed/simple;
	bh=eNDRczsn4J+WbbVGQc5sTpLlLQ5/BifWzbSsnl1wjrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tiEQCnlO+f6l6bcTjVxXlADhSOUU4XP1H4zb8VW9nD3CKPWmBajUlhVIOblXXSyIA38OY+M2Xon3QBhsoLLZ1gHrkMS7sU0P+lLUEaWXhYBqXTJHdNUby6cQOk63EpMTWsBFu5ToCuLzjS73N4N2I4oP+IFgrQunU1W+yhr1WCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pthWNMLE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pthWNMLE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4908b92904fso16502185e9.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781809159; x=1782413959; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ML15MaQcznPpWlTthGJ5ZAccE6wQ2/6XSoOTMeOi5c0=;
        b=pthWNMLEXvLwf9OmJ/OOFZ8hoRrI62u1JrjFMplgdL2pWB14bX5IDemUtRR3Bfeubj
         9PsRZIMZMzcScewJ4BqhBbeo/DSK14FsF4DH2m1RRk1V6xZpLwsaYeKmkOps2Vkj8B6y
         o3nr5C7JuONF9qjrYgAGAqrfxMWDv+N4+uyPOCY38aAdeNSOrPw0aXCJqBnvAor5Xun3
         Ek+ntdwFjGyu+YRzDJUpRhiKKxnugDRVNMRDBWtAGqirFhQMs6OGFZKekqgn+rb3QCw2
         tnJJ0DFKevjCQjMqTwtysvUhn+DeXRgwpIEZJKdgEYf1apiObWhT7ftcGMW6jzph6QU0
         KiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781809159; x=1782413959;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ML15MaQcznPpWlTthGJ5ZAccE6wQ2/6XSoOTMeOi5c0=;
        b=OVu+Nn1fb/LVZBATZEaw4xIci7t1gg7aaRARRRMvYqDKSOGpWGIBCyGTXNxR1zg9Ci
         GgdV1EN/5QWdy0iuXVzjDUoJHPsHj4fY5ViJrbCHxs4wdZ5kkGpTgrbc65XkiiSVZpIX
         252fGYqvTCNoz78kFdtVd4yQ7EyVOsvfPk9VoLfzpxsguRTl5TLhPK0p9+aIP8IKoSOX
         Gxv+Ys56M4qdpiPBHSCvQZxIjLkjemqBFQoqHmQ1fvaxNpyzHIPr9vJXn/u62Sgd+AF4
         xWJ40lMvbKCZ3lwFpEaDLBvBD1L5G3ZMezJ1lmpYc9u+RY4WvaQuPyM6nYMRb/HCXA5Y
         WeEg==
X-Forwarded-Encrypted: i=1; AFNElJ9rKeFQfW9qhWNME4/NIGbd8VvitxeCtSgquYJGUBIPgBhOwOqjnVxmQiX4P6GFgahUcRPvJkn2x9K+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8l3JcNzPeERAmUrm46Gu/zsLaM9lxaFkLb+J516lu5x2i6d9
	Fg96AGuSNmSAl89JdkTZ8IDKoojjjWhVf1uMfHihOp1//AR2pnE673uC
X-Gm-Gg: AfdE7cmHmwyHiIJfEUA3CweIQNZO7GbsMzEETOTcteA9taP3EvrS0G+Purz+Aj+lZhT
	+EsFTiYtFpEjD1Kp6b7WML3SWqTfWh7tMfBPrl0GJit61+IhSlXeFi8F9A6xv+4xXuu5Lr+e3W1
	7a2aWv9UUXJy8EO4T0yy0js+CEGMXf9o7GUtOWAQOnUxr/OVuanIvMOxGKIJY3ynBxEZtCST45N
	cWuAOOi6gQms37YtMM1i8VtUN4p7VuKZzVruKd3dIab8mym1syQqYyPEw8igXKyxXtXx2lWIrfs
	areCqIwI/wEyxHVgfViKFGCa4UwDyoDSXDi2lt+dxpMDiBCY7iC2bX9Eci2MQmaRKAd8bEOQhw3
	MzNlK1yBesaIaQCysOrCqSmkpl5ZXVk/L1BDHQ5xvz6EECzp7KC6rR60pLskqMzBKUJ2KtNkY6A
	n0zmhLbl+iddvPTDnjBUzkcA==
X-Received: by 2002:a05:600c:1552:b0:490:cdb2:fb5e with SMTP id 5b1f17b1804b1-4923f5a2c9dmr13330905e9.22.1781809159062;
        Thu, 18 Jun 2026 11:59:19 -0700 (PDT)
Received: from strix.localnet ([197.250.96.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcfee57sm7910205e9.7.2026.06.18.11.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:59:18 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH RFC v4 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset bindings
Date: Thu, 18 Jun 2026 21:59:00 +0300
Message-ID: <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
In-Reply-To: <20260617-deed-snap-4649ffae0e27@spud>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <-l2OM6P0RNSYRQfOSObOyw@gmail.com> <20260617-deed-snap-4649ffae0e27@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParthL3pgqDQSWeNUtue9c8aVA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextParthL3pgqDQSWeNUtue9c8aVA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Conor Dooley <conor@kernel.org>
Date: Thu, 18 Jun 2026 21:59:00 +0300
Message-ID: <BXIzXc2sQ5SGynZ1chd-pw@gmail.com>
In-Reply-To: <20260617-deed-snap-4649ffae0e27@spud>
MIME-Version: 1.0

Am Donnerstag, 18. Juni 2026, 00:23:56 Ostafrikanische Zeit schrieben Sie:

> Do you actually need an aux bus here though? Since you have to add
> simple-mfd for your the syscon-reboot and simple-mfd is a real bus, can you
> set the reset controller up with an mfd_cell + devm_mfd_add_devices()
> instead?

I'll have to read up on devm_mfd_add_devices; The aux bus was the suggestion 
of Philipp Zabel. At first sight it sounds to me like they do fairly similar 
things. I don't see any precedence for [devm_]mfd_add_devices in drivers/clk/.

Whatever way I go I'd like to use the same for all 3 clock/reset controllers. 
So far I only made topclk a simple-mfd. I recently stumbled upon spinlock 
registers in matrixclk, so I guess I can justify a simple-mfd there too. For 
lspclk all I can see is clocks and resets and I ran out of unknown registers 
in there.
--nextParthL3pgqDQSWeNUtue9c8aVA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo0P/QbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi5REQAIpu/GpQwqP141DKI5xB
0EX5THPKx0mZqlnsa5AmllX6jbbRJcefVucQDGcsxnml1o9AqqACwyzLbIzgV3CU
FiVw0dgZWFXvbMDJd86ag1NtaL98vcw9PgHX36TyILPVYGH040BrZWuyQsqmCxcV
BCJ+yUzmZOxADojGR3teu73O58q/y9xKsCmYM/jTZ0NWqNZNOpJ0jIbGmUUiXwtY
XToDOH4k6LQWdvAJzoLQ5pnmczX0RLYh2BLgNIGnJTzwF/XgTOXyi1Bvllmy7aii
kkqyQuWuB8QtL3dEmaCgKCpUZqA960h+lk+79kX/sg9fjSszclPVfvk7WbaSD4+f
cwB6tdnagJdbK9OmFR0xixHnuSb3XU/H7uAy83vobGGHd+SK+ciBTF7U6Evo/ehF
nB/6A1RUjcnereGiUykzsVoWEVvnw2yAGfCQ7KUJ+yqgxuYTNEFLNhIAGoG8t2Hf
DryFswSWkeUZXxKqscW5QxanDRIMFYX0CblVyHxIp0CMGkccSuT5yVCvGUB07ueT
gH2c+RQTNf2ZXD6wD1Y38T6w0yqIrIZSeBu6ts59Q65/CjWQWjp2LsRrnVfRm2Ei
PwyZhtTSoLH/p+5FYioCjjUhpTfB2bLT9suvALpaSo6ePJALSyRMQNwG/YVEoxp4
4pCAFEovLsxAtKS+bcDZW2ce
=ut2t
-----END PGP SIGNATURE-----

--nextParthL3pgqDQSWeNUtue9c8aVA--



