Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C969226D05
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160991; cv=none; b=lZ6/FOtzlduyOkV4YyJAM+jza8oQdJuLlCSrvynE+lKKmJ9ER0J9RsAUHlWVtuZj92yZdJz+hXPkvwkZYW/vtUdJEVKDUi4j439JT1ZW0tMiRn6a3gkURQjpWnjZSituDDKIt5CDGa6iLgcN/T7QdxFpatrf+PMAiBTRDaOa8fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160991; c=relaxed/simple;
	bh=cJ8dfAUymUi5/b4KAsqaDEF0/Kqegqnkf0HQS5fuWYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQopLwBSclDrWwdLB5betPPOOoz7bSj1RJbOuY7m3kNk9M/X8OqaqdiGxjU4wadCjg/JB49RJnzvjdaZbUshB0WgIzPG7rsD398OpSBPuLfrdXYEnm47sFINZ8ORiuyTOV9Fz1o8KPVcS9wAEhEzcpN5+FUlPIEeQIoBHta6Uww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRyWkFYZ; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRyWkFYZ"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7c6e6822b11so34632137.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791160989; x=1791765789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JnCZgK6LbunIjGmFBSscnbMfeG5EqkEuWOG6i+CFlcI=;
        b=gRyWkFYZYirjoNRocFXy8Ydb3hEWu99h4NHqjxSMUcFsNiJWrvTx1juVd/NJZXjj1w
         e2nVpFrtI0gGVOTia9g+eNHG96BsQavqN2+rXX2b+cNxv2ARk9c87bj7vPbavW4Mb7Im
         yjIZ+XlYUzinBaAhckO5nfeDYmY/audGRo/VviANEU8/pU9Fqzu1DgE6DXxTjdsAO6fs
         W8CUR2QE22ziKrydwQIvTeODtIeSGVFSy7jJd+xTdtkxZ9Sc7Ua/eHTrzYqysl7gWPZ4
         Ftx4UClfZ00gktBN4FkNQvqHEdwCVnLS/3pCu0jx4LNMuCyyzUqenAG6nPrwT+vh8Skf
         Z3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791160989; x=1791765789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JnCZgK6LbunIjGmFBSscnbMfeG5EqkEuWOG6i+CFlcI=;
        b=V3a4UOybTWGInrLqtvFGAFp9RObr2as3XQ2qOHeEI4qvKYcucmr7CCD/m2cNK61/i1
         bfg2IrZU/MLuHRLA7EizsvyvgYYRhonOT/W7PZCzNzHXsGn2odvAxkXe+sNy7M0vTbvZ
         wU9QaQMctjwKqp/PBfD0gLa6gzjRictBxVT0o3quU/T2rS5w3UC/9x4hx4zoNmWaTACd
         Z2xRYOIJhvCYMSXGtapG4c6JTT9P4gr68YJQ4WZHMRA69wYdLLnSVn9eWB4zF77P9eoM
         uhvHEdgNhQvn3COIiPeHwjZuWJxBbWdAsrad1zf3CIcMm5WNameV1agJN12PEchcf813
         0R8A==
X-Forwarded-Encrypted: i=1; AKwUvBwcYQcmmMqYfPvc/rqLiKtE+pV9+9MSv4KvfinFK6oOAYOYQ4ymMlBlqh+bTlRJzU0noNbBPAED5H16@vger.kernel.org
X-Gm-Message-State: AFq9FYLjK6rdAUCJO4he5WtlWSFZmVJuTceXJe+3VmJVKd8FQOOeIlMa
	rxlNo6qVkjBWlMVyKoz8+dBz3CiMXyCbr+Jm+EXtcjgPQtZmsJBcxf2u
X-Gm-Gg: AYBFou37hlb0laeuX+rdsiCu6Voo58LpzAvQHxJTojwoG+r4rRz6cqNSPr+ZqIbemIc
	T/uHpY/h91LBaYRS5eM3t4qdgd4cRLYF8VEQnRkl5wvZGu2ODnncRCfexrrKdtv+4e2f4uHCicy
	YDHzQtDydWNr2nHgSx8ArlOMcNTbQylNPsjuL7XPa+P3F8AgaAGYjalEB8OaaXtclyOs3Nm87vY
	jytYRTRiG959B9RJ0gUCiLooWozAtI+g8yUnqedYYG8InfYWSgduis5iWirS6gs1DOZcHkx4jgK
	Ao75CZyEEKFCJp7nOdZTEaAbUzLg2wThK1qye3qQrXQq09pSnUMDdsNu38icnP8OeG1ollrFpKW
	cdqNZUNizUFhBdl6oQVXScKExEM72aPAQyKI6NMXhVzzgbIRdujGoSNn02AEMvIihYAY3phEYQE
	d3IlkLIVGNOMKKsypSHt5wLBwogDxRmOayofiBdDlhmS4GTN6My3ZaqyiyPyhNgqXegFwLnrB/O
	CDzVg==
X-Received: by 2002:a05:6102:41a4:b0:7b2:508e:3d40 with SMTP id ada2fe7eead31-7c244b9b1d6mr1275758137.15.1791160989089;
        Sun, 04 Oct 2026 17:43:09 -0700 (PDT)
Received: from localhost ([2804:30c:96c:bf00:7844:c38c:894:4054])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c10002f77csm8504297137.10.2026.10.04.17.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:43:07 -0700 (PDT)
Date: Sun, 4 Oct 2026 21:43:20 -0300
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
Subject: Re: [PATCH v5 4/6] iio: imu: inv_icm42607: Add support for
 ICM-42370-P
Message-ID: <asLyqO50cSIil_WW@debian-BULLSEYE-live-builder-AMD64>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-4-c65281b745c9@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-b4-inv_icm42370p-v5-4-c65281b745c9@axis.com>

On 10/02, Kanak Shilledar wrote:
> Add support for the Invensense ICM-42370-P MEMS MotionTracking 3-axis
> accelerometer with built-in temperature sensor. This device is almost
> identical to the existing Invensense ICM-42607-P IMU, but lacks
> gyroscope. The device supports I2C, SPI and I3C. Implement only I2C
> support for now, and provide support for raw sensor reads via sysfs.
> There is also a built-in temperature sensor but it can not be turned off
> similar to the ICM-42607.
> 
> While at it, change so dev_err_probe() is returned
> when the WHO_AM_I read fails.
Not a hard preference, but the WHO_AM_I error path update could be a separate patch.

Nevertheless, looks mostly good to me.

With ID tables ordered by compatible according to Andy's suggestion,
Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>

> 
> Datasheet: https://www.invensense.tdk.com/en-us/products/3-axis/icm-42370-p
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
