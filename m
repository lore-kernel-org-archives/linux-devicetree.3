Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1E2449B16
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720811; cv=none; b=IQtIOZnNbhEr6RaQ0M6qFbhkfdOgPReZftKL3hiokBue0ZRYP4zVNFod7s1odxpDFJkXe14DzANEjf6JxnaXlhYJ37Wk7qoRpbkLvLOmSzlDzQ8hqKyW69sjPPAw1N9t+eMyh1fUavhul3meZRgnyNnmbKr1In0AwZBByWhikU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720811; c=relaxed/simple;
	bh=xANXtOiaSRHZikF1Pq8P3t+bkAaThlmuB+FyvIC2ni4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I/19qkrRjPtlf+z21wKLUxv/caD0W98MDwXLwowP0S4Ro2In5bpNVNrty4TmrbYaxAVuE1i1qKJDe3wclXe1QMPjvvz5NE9pR7ItcRRo8L4tmrNtNK8SzgfZpASpcL4eRhdous1YU9fE7caKTkkxPpCPP5vn6FqB3d9UmVr/NgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg4Zp6gQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg4Zp6gQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so6770105e9.1
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791720803; x=1792325603; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=;
        b=gg4Zp6gQFqmEX1CSGivAJLsgiteD3K9J98Mja3K+2XmXBpa/rat5BMIbTY77Mi0mLr
         sHzzr4VhkLDpA+K0qKWvg4xHuqk+Zq3lwBrRCTJWNd8uPrsiKMpvjtAkVaZ6jdfuNfZ8
         ctC9/0zuQd05XoUOdgp+IixKm33DnPuKJVvM/BDHjyWGjOeBHjSGE4JjG7RCa4/h32Qs
         NP2e4ng8Yynp1gZddbbQ4oCxH1zA/FDfjyMksMDguFIRsQSzlFidiDsYUD/LfbCaZmBB
         I4IqAFZXgkl7hXepDbnJpDpZcPZL65vKWpOqHwhdMbpVhlHsnsQFlODIiZdNeFFP5DJH
         z9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791720803; x=1792325603;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WNhfRaYtKVpVmrsy/HA79NcbT4wzVybUHXDzkeeAVs=;
        b=1kmYksIQiof2PyE5VYq7sYNz1VCur0ls8N4dNN/PESMieFd6LkrRUyfdePAhwN9RE3
         dV4WMsl0mbJYOr4WEa9S0suKOSxuVnJvmu9e/E/OgmdhKPQ+AtJcW8qHFUmQOknUG+97
         E2DigpfO072NuSjYyWm7hBwOMxtX+872tABrsE78dNzvwpGog1J8gNSYSQMZSh0AEuXS
         hR3ZdYGWSZQqgeYW3kiUE8YYcr1/L64FLfrFwkHbVV4nvC51PevOkh3dk9hvOwtk0fPX
         mygnBUtyXzbbSY+7P6mPtcc0iR7rlc9fn4VGqCf+DOj7IsMKOINaSQitMQ5aeq1W9KnU
         VcOw==
X-Gm-Message-State: AFq9FYLx1YMUAUDGV34KJTXm5GhLV8io/Q6tuTjNgrfiwDiAHMJEGftj
	/pa5vCmFSJTQbkb4zjJBiMKbt6anRotp2jWJGkXzexaCQ9tLPD+wH0S/
X-Gm-Gg: AYBFou1gRuBRv7a3ErURnwJA/Maha7FTbP4mKbJxxw3HETIjNN4mq7vsPMdYSpVp0N3
	f3EAW0z85BcDY5rgWjSNqJbwU2JKXuXw5YhJIWTelST5464SgAgVKwBzR0BYLX0FqGCV3WKDbpF
	OmZeZiM8lLuOobbaCxaxEEd/txE1JKF941o5i8n1ChC/dvBTQg+rr8mdud4jLnrWfQwHQ02aygA
	yJjrjeoIpwFzOPxDoRQIBWu13tcnxcdwy6K1k5jVwWQSC/7/MGZHCBlgmK22mfvF9dLzETckwJ3
	Q7HKO9dzu+7ENwP6X5dYS1709S+OGPcvlWsF5NhaMcFrPJGhHwyO6MtfFLRK9hU9oDkEcf0g/ny
	jr4DcX+a7qi8hpPm8G4/4/WoZsRXEKMb9MMhlL/b+ZgKe9Oc4C+Qc4sxoKWPF+IsB2n87oaP+Uw
	Ow51WuHbUlfNVU8Y/VyiNifllpXpmSOt9s+1eTxN1Kl5AzJmuAa5i8HJ8tFb3BQrLm7r4SVYnHh
	wq62N011PyfZ/ejpYg/mCVk3xA0fDAh6ntci+9RM2QpGzP9m8faCr1v
X-Received: by 2002:a05:600c:3e83:b0:4a1:6d35:779a with SMTP id 5b1f17b1804b1-4a18e446880mr106551865e9.3.1791720803247;
        Sun, 11 Oct 2026 05:13:23 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm328215565e9.4.2026.10.11.05.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:13:22 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sun, 11 Oct 2026 13:19:13 +0200
Message-ID: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
References:
 <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartK_YJ80XiTvajPgjPcZKRXg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartK_YJ80XiTvajPgjPcZKRXg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Sun, 11 Oct 2026 13:19:13 +0200
Message-ID: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Samstag, 10. Oktober 2026, 14:59:47 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieben=20
Sie:
> +/*
> + * Each bank has 16 lines, one bit per line in each register. The regist=
ers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> supported + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */

This looks identical to mine, which itself matches the old zx29 GPIO driver=
=20
with IRQ support etc that was removed in 89d4f98ae90d ("ARM: remove zte  zx=
=20
platform"). This old driver had support for IRQs.

My hardware has the same register layout, but no IRQ support (related=20
registers are always 0). So I wasn't planning on reviving the old driver an=
d=20
just using regmap-gpio like you do here. If your hardware has indeed workin=
g=20
GPIO IRQs it would make sense to revive the old driver.

My hardware has one annoyance: There is one GPIO line (not one block of 16,=
=20
just one single line) that has an inverted direction bit - and this line is=
=20
necessary to run the routers on battery. I don't yet know what the nicest w=
ay=20
to deal with this is. If we have a good reason to have our own zx gpio driv=
er=20
then life would be easier :-)

--nextPartK_YJ80XiTvajPgjPcZKRXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLcLEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoijZ0QAIYvFbnd86a0BA4vB7p5
HZW7/UnHb9Rd8bwaNM9LhFgFYmTeQPLzMoVsSUt84V+JUge57Kw8nPV0Iux2YNkz
IdzhQiShuW4/7oRjYqDSPStnkxVSeFDPOTmMJWLxqVXDvgWr5UMdCq4btlpYiPaU
mnnG9uvEjFCocDCxhCQpoMAx7HUCy+EnNge9vMPmXezh6+S4u1dYYE0Ap1u9kp1w
9yOd6Joq6hldxa8Rf+IVb8k9aFOz34eK/3HCBUuni0/zIIMiSj4EhUosmD7LxtMp
9GQ0bmuDTognLxJQHVRG2mH11ihkfvtEW25D/Dmb40YQsepPvjBAO3aq/DkoVWAc
+jc5MaYUCIZkiKvpU51Yyc4dWrCPr8mBZLDhGE8mT1kt2a5Viu4E4q7aePEqqmrX
7BxuiP6EDWHhdlvd0twIv4QjP6j+qE6+RbtGFSypOUQ8r5U83qrBNXid7MWXKwEA
zyMF2uh2oFdGAap3RK07ohCigHiuWkbk0HYdDt/VUP/pZLD2OR7ozZ94ResxbsyG
9ymGPuuDHwzHy+ULVHiaeHWygV0AfO3/BdAh+IfbbU8XgLQNve0f3ouodUN98L9M
NZAeS7Kwtpt/55jvyJ/ZxDufW+xIHnHrqrW0HPf/asAchms/6+TkScZFgcJRA8FY
2yHKUduoenPY8vgxk+nADhIb
=xhk2
-----END PGP SIGNATURE-----

--nextPartK_YJ80XiTvajPgjPcZKRXg--



