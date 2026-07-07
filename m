Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076923F8247
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783423993; cv=none; b=NpgLt/SMY7wXZPbN9WbB2qdkdnqRx4VJKWSwZ1JJJ8KWCX/UaNWu6hT6WuA/gwAaM7EQ7z0nWKQaJrmwaLGDKyNhr6JxNzNEqhgbIUYuJUhR8xzTGl/x086M0I1Xp6/n/pwcOdmTuFvXXnT25106oLWdhhzf7PbEtfnpIrJfuF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783423993; c=relaxed/simple;
	bh=r3ZTDaAnxTCpX1wXbKfP9kdtqD11rv3KNLqJa/YXFME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lXVxcsL3HnMW2NXiRR0UuAHKlORP7BSro01qR/DIP6inmCCfOCLmfzKR6U2yfmeLmw4ILaXehHdGyQZIv8sCUHqMteMEk9/uw9mpay6nuOINlVsGy4/ogdykGNF3LhcFx4igCI6bMXH/L9g3tc8RkEHHMQiqVPOpKw7f/lGTxI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKYa2Flv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKYa2Flv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso38756505e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783423990; x=1784028790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Z8mOZho8ofeFAadcQO4D4nqadR03wrbI+Q8bNSp3k=;
        b=qKYa2Flv7kRCsrSDr/ZluYQzac+hszr3yl2LwcUBpW9uyjNjh2r4+SEmZuy34RwY1M
         2T11iU9Jm/pXhHg3GUMeyS9agNU5muC+OagVDpYE7lF6Tic4lSMKHUDeJ7Ety/KOe3fW
         XMC0HShZ3RXjkU2bl4KbH4O7GspUGXXhsAICfKbjhL9VSQYQv2wDPkrtOP5eHvhXSdwP
         CJOlmkuaKPm41NQDXmwsX5IA78z3ooiJWzEy/G9XBHg7qZFdTCskVZ6ZuA7VPFNDLAcl
         1zq3oIdBfp4DpvhaY7WLilhUfcAvKjkjm5dYKS+dFBxIZebqbUq7ZVC2onvVpm1JCKL2
         ZASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783423990; x=1784028790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/Z8mOZho8ofeFAadcQO4D4nqadR03wrbI+Q8bNSp3k=;
        b=secXnK8bQ1E2Hd+iKx5OOT8e0FEUdBMNW728UPNbnlftRLOd5AgF7UKb2hOJ4oj4Hi
         imtC+Q9bI/hyXwLsFUQvxlWxUDS3jh6fBv2VmaXOSvmvfhh5I3tlKf2F4TDpOeg2WRZ0
         R6ckAzOymhQnf+8hejbgjDteYheYJ7lvbpM1UqbgeITr/ckd3YO7MGnmdql0JQ7eEhQE
         sLsl+xXs2y7TsYL+jOE2tIau1pW5h7DDgO9Msbo0v/NACsXft9ISFofN9eEDi0DsaO3G
         QARzNG/TFWaEQf24F16DXK16/SuSjJEaHMPjdIC9tMrUCHxB9KgX+fblMSfEvkzW0OmF
         R4og==
X-Forwarded-Encrypted: i=1; AHgh+Rp2a4Moov0fyPDLdI68GX3hbDnS//me5MnKQqkzC3+QQd7D4d6HPhEKs+7/NAqWu0PrmLsicbL7wsHD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5bBopeJLJ9PqfPOuKQnI34YzOMQAhvnf8gH+g4Z+H2esqedDs
	nuDEKpG+weIFaNr9DmdnFHBKgRJRq0pHojhYKNJvDkmTxVoYnZ8xQvT8
X-Gm-Gg: AfdE7cm5VCZY6V6U5AjyCJMRmx1eDd1wqrTmubfiP2TVCTQDtXohddNIwyPtQKlOUc5
	JCHzueP8ew1n0oUjxKpwZ4sv9hE6tLoBicuy1SO/J07NJbQpQUYSRiiXR1VuNEddgZMEkbXVNll
	HYJMF8OUCZDmdiR75Rz89dpc/XGojfp6PqyDqR2wTlPkY9IwXeZbU5fmeSV6DjZA+XeNqqAf7rO
	G60geiWZ3Pf5YkaDpZ9GVs8UNmOj+xpkZkfYOfUKcmmOnLVIKLzeHtnJV1JkVznSQTSh2/q0q9M
	2QAcJ2sZSvO7ogMg73gi4SSfge+dwA76tXi7y5w8UEp83jQny2CIjVVRkObmqYLVQMshZkd3Q4d
	iuRJ1p5jugFYxeeXAiqqDYVxYpfRRwvubqHzJX/02rl05ZId1GNaNX0AwsTqmNjLvs8kd/RqNN9
	PmUq7UQcFyhLstOgk9iYjbKAKPT9mnOWk8AsSSsIpuDa6OIYFYr4R8qlHTKlldw8MZSUswFQTb0
	QhqRA+dMFgpuL389Hbml5ZZgSOInzXjx5l09COOUDkhyQqYMNwOXmx8j9UK52cX2cHdJzU8Zokh
	NRLDfuXn/QLIgprVU9jixKOj7WFLOeX+S2wQACLKov5QnpIbGATQXCyCxkUw9O8W+JYj5FbzW8b
	ZtR2XoesI9YRCecVzEpynWAM=
X-Received: by 2002:a05:600c:3f16:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493df08b92fmr54103775e9.15.1783423990091;
        Tue, 07 Jul 2026 04:33:10 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm53494575e9.0.2026.07.07.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:33:09 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:33:08 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: linux-iio@vger.kernel.org, jic23@kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andriy.shevchenko@intel.com, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v9 0/2] iio: health: add MAX86150 ECG and PPG biosensor
 driver
Message-ID: <20260707133308.00003e7a@gmail.com>
In-Reply-To: <20260707112714.2261727-1-shofiqtest@gmail.com>
References: <20260707112714.2261727-1-shofiqtest@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  7 Jul 2026 14:27:12 +0300
Md Shofiqul Islam <shofiqtest@gmail.com> wrote:

> Add DT bindings and an IIO driver for the Analog Devices MAX86150
> integrated biosensor, which combines two PPG optical channels (Red/IR
> LED) and one ECG biopotential channel in a single I2C device.
> 
> Md Shofiqul Islam (2):
>   dt-bindings: iio: health: add adi,max86150
>   iio: health: add MAX86150 ECG and PPG biosensor driver
> 
>  .../bindings/iio/health/adi,max86150.yaml     |  65 ++
>  MAINTAINERS                                   |   7 +
>  drivers/iio/health/Kconfig                    |  17 +
>  drivers/iio/health/Makefile                   |   1 +
>  drivers/iio/health/max86150.c                 | 564 ++++++++++++++++++
>  5 files changed, 654 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/health/adi,max86150.yaml
>  create mode 100644 drivers/iio/health/max86150.c
> 

Please stop sending new versions so quickly! I know it's tempting
to quickly send a fix if you know what's wrong, but I was just pulling
v8 to compile it and suddenly you send v9!

-- 
Kind regards

CJD
