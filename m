Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58C389104
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 18:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152515; cv=none; b=Ckf/GazBzS9qDNU6DmotMuhfO/TIuU+MeEfUrpU64J6N8KB4CHznrMFHMdk+o94MkvArNujFczLvciLFsdECOayzI7i219eDbGecMaUkLRT4WOIuvFPKyupgYM/WcCMsvMWeJClX8yVwMh5I00qwnhaXY6UZW0ul4V/ri/0QSGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152515; c=relaxed/simple;
	bh=hBlg7e02+t/YM6pIvJRIeAr5Jw7Vd/I+qWWjA/9gkT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Krw9tzn2HnPm+QmpJ53zyu+aKJIEZU8eBPmlBo+QSy/qB0r3QfwWWqLgGje5MPcJN5qFRxiabzyRvYP45nkFWWlqIjKHja/7YoWdxFlbxSnjTa1aygnmQXB8mMlI7P8viRYwDcCbj1uYkZJbjoWziDVopmC5Ew7SMiVCUc+/RjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AY2qXBt+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AY2qXBt+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e65b1cc29so2880085e9.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789152511; x=1789757311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBlg7e02+t/YM6pIvJRIeAr5Jw7Vd/I+qWWjA/9gkT8=;
        b=AY2qXBt+01lhHGjrXrxvRoTuHtT4DSIhV64PDjJF75a3gvWX7FQVAggm2W6Fdf6XsS
         LDg/lr3eoAx6ZRKnDFEUCJ27EsX7ghAYlHwzz0ZWYUNVOWnIBKwx5h/MdrxyiAupmIhU
         my3yTbBUeZP99yplxRjx4pThRWNSPaKtvdoYQ6eH+0vWe7PNdoJ9vBdZV5d4rVc0KOsJ
         V9wTsQTc5biP2R6vhWy7WEe7YIYc6KjuVyXtTqrIGAC4+PcJIt4Q3yuJt/HZ0A6/+FXk
         Fki4iOwXFyiNTbFeHvMRlaxMBe8xpgXzmCJf2CswcTxjtrxoRoumnOGCswoCxyWNgmjn
         vb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152511; x=1789757311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBlg7e02+t/YM6pIvJRIeAr5Jw7Vd/I+qWWjA/9gkT8=;
        b=S/DJSkONxHcgx/VdYK6vyUHwIrfwYdyNF5ITRRqN0VnnbWf/uPMCIENEpnAnqdJepL
         JUMt5WRJYFguQeFNSGEIpjcyel3vR3q938hVoqvyw9s4lupu4HjonCg2uQ94ZERCcANU
         p2qbf0KfSaEyvF2c3FFuesSO5o1i35jxaDl1rkP6PYhoQrynYCtvm7a96q9OCTn1sc1Q
         ktRP1OdmBrQtvKO2YxrLU/gJKjk8zqiHTI4FIli1aDoSnKfL7ghdV4yvUWZVqiuk/cO4
         v3HLrlu5iTLpgowG/sQadc7KQxEZJVYly6TUvqxgksgHpR09V13dzEMYG1VWtviMENkP
         jkgg==
X-Forwarded-Encrypted: i=1; AKwUvBxFN8VK1ZHXM+7hZga6W7737k4h0rcjGT5z1k2f+c4RnNeAO+/GaOmx9aQhpssx9EeMkCqq92hGzD4y@vger.kernel.org
X-Gm-Message-State: AFuF++lLehFzZ+kXuxZIIeTqzT0p5lUF++irBjuDWdWTRLWl/Z5W/dOR
	S3BomZKyGd4zchwNA2gFOYsicCrDG8xKEKny/l+yeRWYmSLOcEJanM3ZDQ7W7hx9fDY=
X-Gm-Gg: AYBFou1hwSJaaqx9SsmrBNyfMeBZCizerzw3xJrXoLksq7q3Z0RyIOfXzfy/Sv18iby
	ntCvw/p1PIug3wO5P9cQwipnQJbLD2Regoaz6TV4r6LVifbPsdvvRZ2RjlpoPxA2r/tXVQLT5Nr
	5FBpt6cmX+V4IU/g+Qd6z1E64BtdjwfNeZaHh08Q11RgcQOMbuvUu+2kCPLbEp0gKha/oZEWSwn
	eYdPiHP6xoyhDEZwaqvXvlDkCorImL3G2FeuWKZM/TjTNYv9UF4faKnrk5r4xCrweOT2WqJYjM2
	NnlCi7Y/YiZP15b56DLxHrGLdBBuz6N/AbLaoESlEUar4t2e1rM0HSnd33UjipPu8dC2UWwZ4La
	6BSHaVYQzLYUYzx77lxZrFDDfcp7HqlaR49c4I2fuapCqwOG+8XCBnVnwsiNZmzZjjThBOBrAW2
	gdMitrzgiV8foLXhBYqyr4Ff8NXl7Q1tA4irlPyT2B/wcb17QSMHuJ0P1wY6sd5+by7D/LnDTqG
	r74
X-Received: by 2002:a05:600c:4693:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-49e619bec89mr124169185e9.6.1789152510907;
        Fri, 11 Sep 2026 11:48:30 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49d26d49d57sm167326945e9.14.2026.09.11.11.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:48:30 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:48:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Saravanan Sekar <sravanhome@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: Add MPS MPQ4210 buck-boost regulator
 driver
Message-ID: <aqRMb8q7BT3uZ9iF@monoceros>
References: <20260910-mpq4210-regulator-v1-0-d37e208dfc8d@vaisala.com>
 <20260910-mpq4210-regulator-v1-2-d37e208dfc8d@vaisala.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mrlar3tkipxi5k6z"
Content-Disposition: inline
In-Reply-To: <20260910-mpq4210-regulator-v1-2-d37e208dfc8d@vaisala.com>


--mrlar3tkipxi5k6z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] regulator: Add MPS MPQ4210 buck-boost regulator
 driver
MIME-Version: 1.0

Hello,

On Thu, Sep 10, 2026 at 08:51:42AM +0000, Tapio Reijonen wrote:
> +#include <linux/i2c.h>
> [...]
> +#include <linux/mod_devicetable.h>

Please don't add new includes for <linux/mod_devicetable.h>, this header
is supposed to go away. For i2c_device_id and of_device_id you can rely
on <linux/i2c.h> to provide both. If you want to go full iwyu use
<linux/device-id/i2c.h> and <linux/device-id/of.h> respectively.

Best regards
Uwe

--mrlar3tkipxi5k6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqkTPkACgkQj4D7WH0S
/k6gSgf/Rpe/v2jHPCvYEnv4fmlUk5h0i4KXQEgWNdKhGO2rjLnSUMju6dcPBhnv
zee9/u9WMjUkKWpBr+WOrKZbRg34Yxkxi410Sw6PE1erxlF3qUaLAF/15ST72gPK
DK75kf+00j/k/wYIMRVCjrhyoHH+QsgCTwQgGudzZtl0qK+wcq/T7j6v5WcUWbNG
T8uUW7WIrh6DpxmNs6FgklXCxSqcBqKuQYt0ToNwN3nNpwZ0uFDqR80GIx5y3seX
IfcACpuy70FNWoL9tzDGzPgETvRjHp59LQhr8vEViHB00egK+mq3Hff6ddGpR4bt
8//wDpKe9ljrhJY1tktqW6w/Pc39iA==
=AM1P
-----END PGP SIGNATURE-----

--mrlar3tkipxi5k6z--
