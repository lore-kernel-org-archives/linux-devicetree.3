Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E93C2FFDCB
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987068; cv=none; b=Mp3FMyi0M/GzzTR1IPF0G/8cdm23BJM0xXysnbj8cdUJGxHJbToO43hNj94vImL1G+mMjj/HOyQ0/eFab1VUO6Rgjvu15Kkov9j9VJDU/ZjsE+vNQJvnKw2UPpflr0GHKrLUu8TJ1zA9GoPdlnRIlIJvqFNsmcat7bAy6O0JRs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987068; c=relaxed/simple;
	bh=yZlednh9nVTM+xIY3GdlLz29I02HRrnjp3HlVqr0/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHK2QEuUSUsuNXM+1qgJM9xTe2yf/mBy2czO59uszgL9bDDZpDaKY44RpsoN0OA1s3rEhrcGpP0SZOnMLBiM/WEPeVCtwM90p1dZJwCeCKVwiGbfgRkTl+pYgjBSJUnNERKCdXutdLEJu21950BiKrQ12jaAcjO/Mhf0HZKb3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2914lqM; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2914lqM"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c45281a06so8167062c88.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987067; x=1778591867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=;
        b=W2914lqMxdn6jzV2p/uMJhBAYPeoJte1DKvNPnqhHKZoGPv0HLoubgHF7GucKQgETq
         +ogT6hUG8mEw0XitLYxWn2Cp7Ee0hHbXwwPYEIqXKBbYMFxigach3S0imqSDH6zGoAo6
         /FSY7k2EDEX3zBrnweN9hccT1AuG88OZnyBGiCoCKFIpfNBH9N17ZKnNjfVb4hfKy6Os
         M1+k5DSa+BMF9ngXeZYPYH0b6sjoPD04Ob8ayyiYdkwtTwhqdPue0K5rt3O2Wi+/87FS
         /OJMp1tyvOR4mUchXt4NgNWPHRpboA+96I/o61rJaaR89gdYz6xv0JcD/aHs5aLtK30s
         mRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987067; x=1778591867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7Uwvr8MeFsSApFn56xtx5NITAqS9F0rWz+pR67Hm0s=;
        b=ZEy/wUI0woMZ9hwt2CqYdi1O1T6njdoxCNINgb960ic8Lbh6FseIn9z7d+FtATjth9
         eZLTWS1mnHehT41xXSlIvb6qL5A2wH5vvWGJqI08ipvLrkBA44diDIHDB4R6X/8NMChE
         aEJohPtMvdGUC8m26A5M1dQA3E366SsJkHJz0pE5NSOC4SrUAvTUD9auJ96yApPwe9NA
         HMqpCEBz0hj6XQiuuA6B6NWhzsUqbKBLbzdSP6ScelgoEevH7TFoENSVq+LXu6YEM0zO
         A+NUq6vLtxjbIzU+3A6LObsBw9E224LCE9d/hWJeYUXKVLo/4cYunwL+c346vWkpDkCw
         eSaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ph1v5xGaXI6FAL9fcxIZ2S9OUeujOv+k1wlhExbnkbQvse+j7k4/37yRXbZFi10wi03MGrTz6NCD0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/AEd8LxGSAF0pfWOpDz87g1yYYwbENvxJXUPfPR5SNyXvcdpT
	X+Unc4QTAZmCammLHGpGBfHLAVTFtvsacocepUTCVyl8tK84a0iKHcqx
X-Gm-Gg: AeBDievWsQOnEgP7N29k8k+Q7I/mKnL+5tGEzSQ5pUIl/bc9v4tBaSSemJvM2qVW4q9
	3G3mJpmSLaWsty2P06Qynz38dkZG+KduVSIkCiKTNbhuUqp8Ro3xg0b8ab4z6yxsV1Vzpc1a6xK
	Yj3WizLD9dpY0htMdyYNRlMKoPmu8gcnQ93vEor+oSVm88vXnucl7ODUbFo71QR0E7EP4U89Yh4
	PFKfLgJuhE9cWkt2Ekj2MkEe7IZUNSdLiOv18/whUUqh+FCvbWBtrd59ZxAtvJjiQGQpuu/t0ij
	/4Cp3BYvWqai5ucrW1HZpcNN5U2V+Fp7YGdi4/NZiufK0vRKyzNjemgVLqxDMsc2HRrKKJTYFZH
	rPB+csmxqMLaJ9uSEGfAADK3XSY72wLc77GAUnFCMm8DWVMMAzip+CNJVYngM7DwtaOJtBEdqj+
	lQO1sQsM+uZr7M4zieMTRpC0EfEkZ51QYTlJkG8kpRuxNXbgE=
X-Received: by 2002:a05:7022:238e:b0:128:d352:bf8a with SMTP id a92af1059eb24-130b1c72299mr1458737c88.33.1777987066539;
        Tue, 05 May 2026 06:17:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df827a73fsm18173052c88.1.2026.05.05.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:17:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:17:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <5856030a-4d3e-4d1a-928b-f9aa0b21f1a7@roeck-us.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
 <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-3-b0c2f3519e0e@jannau.net>

On Tue, May 05, 2026 at 01:02:41PM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my watchdog-next branch.

Thanks,
Guenter
