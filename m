Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABFE485CE7
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393177; cv=none; b=AF4MK4piQOgokaeQx7xLhF4V4xh2WePXRUsWEUH3DTkZIP4d3EP/6m7abqM9lg9C7KZizO2CxDopTbyuJzC4KrK3W6zwM5uzgkfxCo1qtlb/46Ar6bsmmBpahtv9ox+m6wr7oxP04JZQHLlVK3ShIgqcJobtbWRGQLkI7FO3DyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393177; c=relaxed/simple;
	bh=LLMb/HyjYW37Kr2Mya1c8bPVTQR1GTIw0/aQgy8v0sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Egg0hkQnQsC4/4B3TPgbIxJXGa5zx/C/7/ADHG1VXOpiBc/q/iO3gGu2/Oyzaqjlqb5aOfwHgK/eLgBgrZz0eeUNXiEJV9l7LFcD1u5rS5QW9qAyRLCBinnLuObuddMgCoBiNut2cVyFEmOp1xL7jXdN2L/SM86sFNd+P1BlUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=plZ6Ae7U; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="plZ6Ae7U"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfb76b304so105419f8f.2
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792393174; x=1792997974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LLMb/HyjYW37Kr2Mya1c8bPVTQR1GTIw0/aQgy8v0sM=;
        b=plZ6Ae7U9Y49u8L8zdVLZqH67YBg9bHy9+JJCR3KF1uJR3dlsii0pc4KZDCorxHKN9
         tDcuXhrN8DsXy7jc9YchdgnH4XYcihrs5Wr9tSlnVUSSmp462YqYa2m3Zx0rWoQyPp5d
         TL1HM9/s4aXpIE3H/BzEUm6LA0IiF9tawTYDMefwvsfAVuuoshM3CfvJ/VJwbFlB0gsY
         97YqeWlrUyyVvjPHK/qYigdKMiEzcSC3j6ocqVDG0PMDzGGvBU/PQyNIdlvwgcvhX4+c
         DXuUjF3ccLeD9wF0Ec5hoTdDVon5h0ZhVtXfkqvsFA6JXsvc/u7TSfAa2EI3RMpCTYvd
         LfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393174; x=1792997974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLMb/HyjYW37Kr2Mya1c8bPVTQR1GTIw0/aQgy8v0sM=;
        b=Il4p+hV5okKeejaCBx27NF5yXi3iI5T5vr+yqV3xhoUWwfkarsrgwMHg256Xcb6WC7
         Tzz3TSNikZwpcdxX25j31vvkfI3W1oX+cpfwbDKIycoIlp9ZRnaL8qEtEVbYC+7cFf2L
         sUQLLk7SXatrAeypQ47h/aIdyBEoi/HkRcbgQQK2MG4SKhgfIWJIYpge2Dm0KGsgZmwd
         6lL8+C6dPXnC2q6A2i1/c+bxWkz7thGAieFa4RSavXWzW5qrCt8UrxEAThZdyUhUfHn4
         U6YpKmQ6ofallmGDVWbs3VucomnUXThREad/Z/EfR4LXnwWW77bW0L7wBPPWyA1SSQ6A
         /C3A==
X-Forwarded-Encrypted: i=1; AKwUvBxFemiP0gvDRq2CPy4hL8hJHLfaQ22wdeF8AlE5OGlPDPTQ/vXR3RJp7VsPCRAnctW4qi8+Ho5wbWiM@vger.kernel.org
X-Gm-Message-State: AFq9FYIEDlDxfVhl6+pWcwakwa1Xc50LRaqWeWtzDUAEKc74mDiKWYIl
	rItxGYLceUiRFR94OUrxPCD4BZWsr98/6aOeygpbWEpRVEGKwS0sWou1AlWcy/F+1Ms=
X-Gm-Gg: AYBFou07sPiQBysLzQFMeLmee4ooXSwzhxcpzW921pMVpyll/hjXOVzy2/ihnSNxLYO
	h6qn3KBED4YjsxxvHqdaOOY6lDDa/XqNTgwZpWMdc1Pm2pg7WqlbRNohdjCW5yjr8cy8ZDY4k8K
	e+bXstLBH9O+hV9Yea5mLZa4uGiv01Psle23fEp479DGu6LxpENhsdo9gG9rJGTtTXRzr7UzGG8
	WL12t0y+xq3phts2UhUQEvAyP2W8TfO+6+zs4cFxLRaRWCZCBGWIdCLXEFRDBjrQ4K+PdMlGW/x
	gU9HfdUUhtjqoUvVK0K4h3bR1Ja3JTLsIW8YfMVubUnn2f/I5J9pLeJmgnMOQ2O3Iwl1L0XaWer
	wUvl9oF9PyNMbUcaX/c5yZMAlslCZGDYVNQXXlY+rbjiY/HetJBnI7PxAHJpvRrm42z2CGkCg8D
	oyqsUNv8GqLgFRbiWuKKHuVWPKtup7OSmQPuYizDW1yRii4YygdrAesB9VSho06MFDESFRUCMZj
	Wtg7bYRze0Q5BAVfoqjRHRggboCVwQGmA55QIMXKg3GfWi8GI4shKd8IzJZgGw=
X-Received: by 2002:a05:6000:ad0:b0:48e:791:1cb with SMTP id ffacd0b85a97d-48e07fa71d0mr8663688f8f.35.1792393174300;
        Sun, 18 Oct 2026 23:59:34 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48dfd471877sm17855976f8f.1.2026.10.18.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:59:32 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:59:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ross Cawston <ross@r-sc.ca>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: add driver for GPIO buses sharing one SCL line
Message-ID: <atW_fsT6BKTsgB7o@monoceros>
References: <20261018194315.945-1-ross@r-sc.ca>
 <20261018194315.945-3-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="37wd2qfgr3nnmrjd"
Content-Disposition: inline
In-Reply-To: <20261018194315.945-3-ross@r-sc.ca>


--37wd2qfgr3nnmrjd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] i2c: add driver for GPIO buses sharing one SCL line
MIME-Version: 1.0

On Sun, Oct 18, 2026 at 12:43:15PM -0700, Ross Cawston wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id, so there is no
need to also #include <linux/mod_devicetable.h> which also pulls in a
lot of unneeded dependencies.

Best regards
Uwe

--37wd2qfgr3nnmrjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVv88ACgkQj4D7WH0S
/k6ZaggAoHAnurvLGEP3L6zNx3w+6ff5baOUBRRssiTdUqhb5qRZJoYoVEr2Y3Eg
iNbRJcltWL+Fb1/K3KMyPXBBDjMz8Y9SUVSIJpGTJcaWAjLYpUAxz6avmRzHKGbn
nF2zqNHukyx3nLFqKPIMOk9EUxS+9MJknWtgi1zDwKJzOQL/9Ga5+pr6ZKqWZ+Wj
hkZojOEmVsRVbjRcsa2lTp4hSxEkobPEHuN7x4tEWwF4atWSJfIHzf89kap0KIs2
r7eJiCjHY0ActrFxfVE+Mynl5FHZLA0xJsJQpfB/J1G9h2Wf0EAzba+vQjGNYAIN
CxJYxyMQGH1ehS326uzLwwPLFM1BAw==
=ZSot
-----END PGP SIGNATURE-----

--37wd2qfgr3nnmrjd--
