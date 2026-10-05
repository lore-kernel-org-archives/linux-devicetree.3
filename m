Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22405199920
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791159940; cv=none; b=ddFIrP9KL9+ZLfN8pSQJLPxL3z6ndsy46ndFOqLDOurBQ4Da6Dp/hLU4Zg03YlMfXFKEkj/tqHvJEQG63dSPaFZtSsUvltIf2JICBCt/A5gfRjgfbyswvJdU+kdaUBpEMI9bZcLsuVfI0uqJ0OyXNTOQrZxVFlCfI4g+/4yL9dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791159940; c=relaxed/simple;
	bh=UjOBKbAKoYtFXedpgYaUu+eAQwTobi8qej6jfEwI434=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tq9vxEO6bKcfwGv0DHY68GAeEB8qcSA1E/jN+tCE/7Z0RR1FhrJ+a++mB1AAT2tbhIGQrNVBQoY/3nZQWDqOZurQMctlO4HBpQf5HeE2EvMtsp0M3A+sxcFc5iDd4avU5zp9WvWSeSVPnk603gngit77+AOsY5KRfwu9REz4pyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th8sWnca; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th8sWnca"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-988d2fdcdc4so790439241.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 17:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791159938; x=1791764738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRktsRR8jsvxEuGT6N6yXFN0RwMzMtvHCyMuqTTf4kI=;
        b=Th8sWncaWdjYhP4jMWC1EEw+aZyoKR8q7n97nwPoM6nGCE+92S+CZDk+Hit+rlS7Ym
         6n+mKm2UUA6WDijYmdf7YMdSxjwjQBXF/pwvYiEb+7vP2UkeFJ2dbSliwgTKxVnK4mz6
         D7uf+hvtht1Z/6BlyKlamFUY5YdfIyX0yjugvkqZ4RnPHGw1kLbwf69BbQVY/SIEJqXP
         Gu/uBoyEVTLulvuv8X3BZcY+Xt4YwMBFYDvh4bcxP4U5kIf/AiHL88lhdSODrkDhoiyl
         cj9AJ++9EndUYyahpsuXxbAFBULrdZgr2sTD1bVIhJ+iQr5puYhngy/riFzK8B+M3qjK
         IhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791159938; x=1791764738;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRktsRR8jsvxEuGT6N6yXFN0RwMzMtvHCyMuqTTf4kI=;
        b=YFmbnz8CJBwXbs5wAVRTGtXHavb2Ub2pvWj5AeCEiKXMlXb7ZJd9ROu53qbv1Hdg+N
         OGYSnCTe2HlK2yLXh93G2/mI2Tu6t8fmNkX5EOIde2slGe2Pc21kr3PBg+6yx9e1PT7v
         SSip+MGZrTVu4W1dn30Vx1PPE0dgvPf69OdZkgYZynKAI0d0V/uAhk6bvFGooiJh6oR8
         v44ljpQOx7kQbU0jALNfKACwf7OeqZGXhyndA/CW/BkDCLQI0I+NbjCTwoopURiBuZrr
         nmMauYFs71bGm9RCyhhskxuPswCL1EWRLX7vYsKneot7+/to48+pKLFM3xCiy7Bw9Sv6
         2bww==
X-Forwarded-Encrypted: i=1; AKwUvBzLockZ2XZscGfxPtruz5SaG4py20SVQE44tW1ydtVMhTQDYk2ZY+P1d//sFX4qqMlluGm3mh31ddHC@vger.kernel.org
X-Gm-Message-State: AFq9FYJVBpbk8GKYacoWIm6TrwSDDTX2Y25YvFOgfQ2Nvm0RT7ombdu2
	z88MfQoVZWUpxOLjV6IVXpHFKFr+jNIYSBFGHppn5pevTohEEXbtqZkSV862BkNZ
X-Gm-Gg: AYBFou3Jok0/pQesd05pm9rA2lw/RXT88f78PuDey4l5yeSD2SHayj/0H7vcm5FIp2M
	14RUoXTlC4f2yJJLOlcjpAFEYnLOgeDwkougEeJz8g7xsCY8NMGwTH4zyRWMLzn80OvFF/yGhfo
	rYSgTcgSAU5F6s1hHIfFAYpXmjnvXB0i6XS5FdW6DFovcKcKXzimA2Cd1juS5pOYBOsHmmBQsbA
	DXZ+xf6qu6H8ui0fB6buri5fqtvCZtp5RgR90SX8kMHK2VjHniK0D/dHch5VWTgln8tWeW3PdIW
	Jwukxx8TKrQ0EF5GPWM88ytARFFUL7GSHYEvFVFczY3+ZmwVBiJO3Nz7FDIZ1DbtSZXKpJPoulf
	oUoPB1ufLTr1saBiMQh4S/rzZHQtsc21/Mcxlgw5ySFaNDsfMdeDVPTYGdeuQCHC7b0GYU2bbZA
	flF06BzoqU00uZjZy111bEMUF0qKDA2V8QDRDBHTE0hE9XujbdvFTJ+5n7/7xE9ZBY8mh5rFwUk
	7/Q
X-Received: by 2002:a05:6102:1623:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7c244daeec9mr1578540137.15.1791159938090;
        Sun, 04 Oct 2026 17:25:38 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b2f115fc9sm8981087241.10.2026.10.04.17.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:25:37 -0700 (PDT)
Date: Sun, 4 Oct 2026 21:25:50 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Henrik Grimler <henrik.grimler@axis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>, kernel@axis.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] iio: imu: inv_icm42607: Simplify IIO channel
 macros
Message-ID: <asLujlrqvfRirW5a@debian-BULLSEYE-live-builder-AMD64>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-2-c65281b745c9@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-b4-inv_icm42370p-v5-2-c65281b745c9@axis.com>

On 10/02, Kanak Shilledar wrote:
> The INV_ICM42607_ACCEL_CHAN and INV_ICM42607_GYRO_CHAN macro had a third
> parameter of _ext_info, drop it and just point the .ext_info field to
> the respective inv_icm42607_*_ext_infos. This reduces the repetitive
> calling of inv_icm42607_*_ext_infos struct in the IIO channel spec
> struct and makes the code more easy to follow.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
LGTM
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
