Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43442459CF
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 00:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160787; cv=none; b=mOtr45aZ98BOdnkpRr8kwVq+PBInanKMzIp2LvJ/DLGJWXIwfKDXTE4kK/eM4hogENA3EU+g/ndTG/nN0CsbIphPYHUg7iOzpDVSx/HDYy3HTjOBC/YZMfjGqpilyIMouuYADj4OQpIxnCQnKHb19a54JXoiSv6Tu2g/1/E73ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160787; c=relaxed/simple;
	bh=FpAYV6dwtieSe65iB/tgTKFYEOT1Q5FcoDQ0+sN+rF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Up0GZJEpmR2lwSZErOd1dB3YjCPJFrPnJBBP90lH01MrDPVBvyiFsBMBh65783gDQB/Yl90Bg18DbgFZY8AGQR2uTZWT5IGVymQBanrIHT200HBIWZcMJ5UPyIXfLL+lHMbst16ufUOidAGxqQKpRag2kA/nSEkgPJAMP6LE3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7wMABIB; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7wMABIB"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-988d2fdcdc4so793391241.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 17:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791160784; x=1791765584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IU7mqOMMBbfkeNzF2+wDQMXqKtPVHRNICdPeH0QrUdM=;
        b=I7wMABIBl7gK6+ItrTodA3fv6bp5Fpw1KJQsu6ZO+lVOEhD7vBbKruAj5OI8IieYME
         JGuFD+x5AZMdUz6IjYyzOiglt0eDoQ5YHe3tYCKVpbOrJKXU2a37wrxB78h1iodIKnLz
         Ex9gNu64xS1GvPVMx/S4VGZfiAuI0/+GAJGJh6l4RyJxXaep2oLuj8nil3f9lqrwzDFR
         cD0ZbbO2DSQR0cols8J6rafvfv2HTvdHJpOK2zv1joivHgOxMXaABTwc+vsVeGcM1KKa
         fQJFfuNKiV8V3ZkRWbhaCFvbC0i60fQyp/8DdoaUFpbdLyoSYg6gxPoBWttyHieMsKN9
         j2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791160784; x=1791765584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IU7mqOMMBbfkeNzF2+wDQMXqKtPVHRNICdPeH0QrUdM=;
        b=F6yFzg634AERLgY0ZIq4PDCFQ/eLNf+fnv/nZ/WEC1TN/McfNLC1mieEaE3GLWomm4
         CbpivPid8BEhG1cdBBhsgS7ybaNbvTm76jk1X9kF976Yk6l1p58tbL41GXs7VY5wSN+8
         RpxIFzpMB7QQ/u8PP1t67lNMQMBs3r1DBi5fFabQYdngmTOurOkOE1bCwcYeeFzn3aMB
         i3gG3BP5nDCoiTgAjQNric23NQrIEv1OtilxTUKylWCkc0MUW36Ui4uiaE2fubDm4SeG
         oSjyW6mF7vrn0fSady0eVOLOR9C+BP6o66YRO+2TEVcyzRecq2091lqm6yNHG7hag/cd
         jb4w==
X-Forwarded-Encrypted: i=1; AKwUvBz4y5KCoi209IVsjzg78OB/IjZbbfZA21/pHVLhfl9hZwIPxrznD/Seu0mYUUy1/GSM3tjPPb1kWW2K@vger.kernel.org
X-Gm-Message-State: AFq9FYK/FsR9i0rRsj86ijtujM+IpnHxo2uRJvNmTYNJmcylwAfhkfRI
	Z0Ha0uCeudZJFM8SV8rwqFdCkA3xRRSBR38j7SNo3LumKj2kwuKN3yy2
X-Gm-Gg: AYBFou0YME+7/0+wpljQfTv6mpCK8dSmv7RSfRR/wEOe4F6PEj0hrNQbloHzOks6e3/
	xwHEmE/cInRg+QvCSPUki3NP+qDThsuMR0wOFFdRyfcTRxQwXOzkGHfwQpoJEt81AnnsmKD8iny
	kRnjJGF10AEWRXDqwOp6dcYygJcLSc7nOsfWUA6FCV+22fDyM3J1m3j1swNo6PDW6xlTuZmETQ1
	A+gDFPujfTGHt3Cu3jOh6lCyUwutdEdbbyKliqieU6D9M/da46c0SZDdTq556gnabDPyzU7ZSCX
	pISOSuUkAqO8yXuI2HX1+Tst26FF6EthENMDfViERYj+0+4ZHozVPa7mm6P8k3E4iNb3M+qOcqt
	//Fh2zqI+w9ZUnWJGpJghOWn/X/xc07R4/sVxFVMaXBxjtUOSO71WaJGz9fb4auLEzDbEyZaRaW
	4UGGUI84uVe2pCw4Bwxc2ZQ5E/T1N4DgPERr8pREn5nGNgAU4UXOxoZEU4Zt8l4CcKZMRAbNWrg
	NLgzVta+4g0LOc=
X-Received: by 2002:a05:6102:3713:b0:7c3:6caf:bdc6 with SMTP id ada2fe7eead31-7c36cafc094mr863360137.21.1791160784624;
        Sun, 04 Oct 2026 17:39:44 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98c4c9d14bbsm7265834241.13.2026.10.04.17.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:39:43 -0700 (PDT)
Date: Sun, 4 Oct 2026 21:39:58 -0300
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
Subject: Re: [PATCH v5 3/6] iio: imu: inv_icm42607: Initialize gyro based on
 chip_info
Message-ID: <asLx3gLw8CqCHssc@debian-BULLSEYE-live-builder-AMD64>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-3-c65281b745c9@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-b4-inv_icm42370p-v5-3-c65281b745c9@axis.com>

On 10/02, Kanak Shilledar wrote:
> Update the chip_info struct with a new `has_gyro` property to support,
> devices which do not have gyro functionality. This is a precursor to the
> next commit which adds support for the Invensense, ICM-42370-P. It is
> similar to the existing device except it only has accelerometer. Check
> all operations related to gyro with the boolean.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  drivers/iio/imu/inv_icm42607/inv_icm42607.h      |  1 +
>  drivers/iio/imu/inv_icm42607/inv_icm42607_core.c | 41 +++++++++++++++---------
>  2 files changed, 26 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> index 4d51b0da1aa16..e4075288247b8 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
> @@ -130,6 +130,7 @@ struct inv_icm42607_hw {
>  	const char *name;
>  	const struct inv_icm42607_conf *conf;
>  	u8 whoami;
> +	bool has_gyro;
>  };
>  

Might not be an issue but, don't we need to check has_gyro in
inv_icm42607_set_pwr_mgmt0() and inv_icm42607_get_pwr_mgmt0() as well? 
If I'm not missing anything, a sample read could cause the device driver to
read/write a reserved pair of bits (reserved for ICM-42370-P on the next patch).
inv_icm42607_accel_read_raw() -> inv_icm42607_read_sensor() ->
	inv_icm42607_set_sensor_conf() -> inv_icm42607_get_pwr_mgmt0()

On the read side, a simple safeguard could be
	if (st->hw->has_gyro)
		*gyro = FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);

With best regards,
Marcelo
