Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2D2324B22
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272693; cv=none; b=E02GxaxC0EPoCYhKxLeDImi5cU8IcJbckuUQTQuCWWTRUOWdgCbeLE6Qtbh9XZlnPhQG4ZQ9znGye7B5DG2su+hDPyCwSanBRWnSI/9rDuhyg8+MdL30xbz3J7l2bljKCid98/b79z8++b6fO06Kt0BOGXPf6LzDkdrD72Qm+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272693; c=relaxed/simple;
	bh=0ZR2dHBJCJIV7izh6baDvLxom0CSaWn2wTdEurxPKO4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFY7RS0wAWmzUIgRO3imT7NvkFdyoYcKZc209JUenwyfdP1/Xrb44F/V/2PHxB0lShL/ug2BKRSOzekJ8J3BGSPiXBY0ejHo9YiTVCzvYndstjG0o0+tpQzMRycaZRCWPzCqIPg54v0d40WPnJVZ2RBSfpIyks1PQ26h/m65WX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9kDxF57; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9kDxF57"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490d1e54b3bso12767895e9.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781272689; x=1781877489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFsEYlInaSHqLS2KZVjT1FL0qF+p1vPQhrQhmNDTg1Y=;
        b=C9kDxF57y+pTzCd9Z+UzZHjEvhufcMlXyLIZtPwIN1s/+u8RRjZq48bvpeuPayOWfW
         J+Fb/4otzkeaK3Vdy8lCPC3eB9RBCn8GhLc7heN1vFVP9q4ydjXUdvpo2UeODj8w4pnI
         3U2EskTgi+CybbUvm2ENmYDQI1z+2WGH05tYKoiZpfRiHrWiIe6buKlq89fQvuZW9JBU
         Tb9vXBnunr44eINAYZ8ro5zF2ZOm/80xDpUf9AwUIovEZ7par2ZmHIZAzqOUsuelXjsX
         NhRxAmTKN1t8HnqRQxTB8Yt2e4MivMXJb52RcPmh/yVdXF6lHwMJT/sMwqePWJIMNzX+
         S0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272689; x=1781877489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFsEYlInaSHqLS2KZVjT1FL0qF+p1vPQhrQhmNDTg1Y=;
        b=P1iS0BAx1fozxpT8BMDqWmclLWXBMYf9xfwtjCsIy3o+k7yF+hyaVnJcysusr2tZ0e
         Ib4Bvixv4v6iX8CM6NL+nCSkGbkoDGeJhFj7chem9ntONqocZP7g96rs4cEVxqW4NNfg
         5tvpgsWk6lZBj3sriT1bpptAd0xYpDnK6hBYL8T3lP5swRdBtknhVAnuugek7wucFyZJ
         gsIT0ONkndEIVD4Uu+i2Wp7b1kCkpZ57rYeJGaKCKfNdPaaiEArTApjFE6MQ6zsDfD/o
         +R+7Q2XSJMWg17lzWdriJ4BZZdeFRmvoop56B30EEZUjciFCbysujYga0cDCjmurZjgC
         /W5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/k3PFwzxelLG4wbso1r+k7ySN20qGw/kWo1mAgZWH978w35M50AQp+p4H5Iw9scd5VaYT/lSetV6Rt@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5qgToa9qgDeSNRfmQUYGZ3wdX2JaJW+GllwoLnuxzWdgSDHb
	8d8aK8IpwOTu5W6olFqruWxjGQ//G30hX/MAeZQx9QK7CZFJIk1er5pX
X-Gm-Gg: Acq92OFespNyacoEINYuDt3v2aRq+s+rR9jTu+RK2WfKQqsiscJG/WACVsgAvYPXAWV
	Aus5yKVm6hnP/PnqWD1EUpn2lEJHwCftMfhCaz0Rv9bVc2tPx+1ElCCpmGyaF0ICW4JYkZSiblX
	DRprqcDxkdAefLxlmqT89RpuOwTRndOndFy4TnocGk4og1Y7qmCpIPO4KB0zmD8H2UoNERALlnZ
	qiqoSSfRKuvO7Hnm/Kwek5gjZxgcKBrVEqtn5kkWoxLgdzrw5hqEfOIS/zitDnm/J6VJ8gse3Zt
	2vv0JJURkmqIkqrAP9CEl1r1Yzpzl7O8ITM7CKSuA+4Zt8LXUV1HnqvtyuwrLmGwo5uWCQNZp6E
	GupVWfcSN84gaIidLu/LK1VMbI9dP6I4i9a6wE7ut7fg22m8mPwdNuEwaCKT3+IRJvW4/asUiYo
	LnYmb6KjXGg+AU7okPoypgbF/G+zBjgqu3uBy7Wwy0ogfHh5ADq7B8FZEka5XWfjwdYeemrEHmX
	CcNW6ZEujp4yCTrpR4q7INqfo0+fAS7wXDlFjWq+K7jOm3trx3oXkS/y/OxvxRHAtm7QiRo8L2a
	wF+ieAdw0GD/2MIl4/udEWFo4ui+4tsEcbEvQgbjhouJ7WKNfTjpXj1zsY/PDufmmA==
X-Received: by 2002:a05:600c:46cf:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490ec4ee40fmr35602725e9.25.1781272689430;
        Fri, 12 Jun 2026 06:58:09 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm39291915e9.2.2026.06.12.06.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:58:09 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:58:07 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marcin Bis <marcin@bis-linux.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: iio: dac: adi,ad5337: add dt-bindings
Message-ID: <20260612155807.000059e5@gmail.com>
In-Reply-To: <20260612133125.196208-2-marcin@bis-linux.com>
References: <20260612133125.196208-1-marcin@bis-linux.com>
	<20260612133125.196208-2-marcin@bis-linux.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jun 2026 15:31:22 +0200
Marcin Bis <marcin@bis-linux.com> wrote:

> Add dt-bindings for the AD5337 dual 8-bit I2C voltage-output DAC driver.
> 
> Signed-off-by: Marcin Bis <marcin@bis-linux.com>
> ---

If you're adding new device support, any dt-binding patches
should go first in the series.

Another big problem is that you haven't cc'd any devicetree
maintainers/reviewers, nor the devicetree mailing list, therefore
they probably won't see this patch and their automated tooling
definitely won't check this. If you're unsure where to send this
patch to, use the get_maintainer.pl script.

Also, it seems that you've replied with this patch to the
first patch in the series, making it appear strangely in my
(and probably other people's) email clients. Use a cover
letter when sending patch series, it prevents things like
this from happening.

+cc'd devicetree@vger.kernel.org

-- 
Kind regards

CJD
