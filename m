Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5028000F
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776529455; cv=none; b=OIyfT4SyrCpNi9pxv7jfjCwYj4OGN3DAGQ4LKFS5wXhUZoObyjOS/euP9IUZwlzj37hsC07r5qyISLFUMVDQHK86eF1EkARfJq3GWxgh4MrhLgQO6r90nhQrbFUShEkiTygFRt/VQk4GBS50XnjMZYgOjFW6+k42i1OKYtebYz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776529455; c=relaxed/simple;
	bh=r3v0eu8jyNJghFoZb8nIZSTQlFmhjMLEDWwjRApN++s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTTnNjKhcqQgKssIprJTjmZPlaTlKIMfbz4WzfqNucFabw888HJVgk5B4zU/QpcIdel2WDYhOv5tj9eC8jX48zp8linfAKPyXrGegRnL3PJjqhFmFZh04xZTT1vDwMuAdTQx36cTdSWd2eD2bJTiUCeETg/62W9Gw0zT+mtqriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=RyqVfkKb; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="RyqVfkKb"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4779b2497b4so1071457b6e.3
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776529452; x=1777134252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6Sv7AAI94WVTWDfs27d7TPLTcwxc8wbnSfHQgFK/To=;
        b=RyqVfkKbe/TDV1byPQrW3gdtJdmFYgQlxR2peus+0qYWEFoouOa4dQo+aX1MreP80V
         HeGpQHj/5Yb8ofu1iEQuPLQD5sMGaP+Nfq/6VmQf3GB/wpvAtYxc7yqyNLPuYzc0pqHs
         vVjNYv1tNxgJlyS+ashbt2frv7LlGtJnk4hlGoJpjN0+hZ0kD7whpnpKaKgNqXuU84z/
         USwZXUjtefAz+V/HlO8CN/5H1QSm9g5IpBnEhbjkkSSThtJfaAjHpZTecZANYSD5eero
         5aLGJpMtlsLrsAW+y/ly4FFCAwQsTIfo6R7XJUGMmED8L7tFlTF3YShtMfhP/HH+YBrQ
         GFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776529452; x=1777134252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6Sv7AAI94WVTWDfs27d7TPLTcwxc8wbnSfHQgFK/To=;
        b=H0HCr23IaKdRiy7on++OSSDxFbDf6BAn5ZJSKQGT8W3vu1+ZxCvpjDKsLga+WEVkzo
         NeCoyODPVzxGGENNjw5lmHNttmo6GuMqrAd1+kZsNIdH/RtjQJ2LXFmoOQDU3EmiXfKV
         SAAzOpxZDKXbRnE2w1R757NxeuWVzXzUHpTSsEuDKNDm+hYILmCE31tGbWZMvTX19yNV
         hs6aDRu29O/50H6OqNxyztwsiG9vibJfsnMiGOhU9jhVqNMZSQe1XT7jEP8aH6FvD765
         0TPcJTBjzaVD/+sWBaC3l0ystrUYzJXrnLFZQ0YZDGt0QDEbbQRUnXcjPJ2iAP9I0Exj
         zICg==
X-Forwarded-Encrypted: i=1; AFNElJ8fhfSN+Cx01hLqFKB027jg73r7KC6SsIYpX1y/6qveg6qGohWOEpBdGDx0mkPXyRhgDFmrQ+xrzuqr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0inlcVaCrwQ+UXlPKHW6c65iVMDFo22rw8HrQC5bWiB42G8CI
	LQ9FtHoIRpxqmgsb2nwR28lQiWMaTwE2o0VbGHAinruLGMkkml20bGXV6jl7hm8mSlc=
X-Gm-Gg: AeBDieuDSWXYvoivGOp4bqLYGuB6mm3uCvgM6ziDk7UZGS7jAYpk0b1UR7iQx8ImxHA
	1Sc13FPvB593qKyghcYxlacmYpLqAeGuYBtEeqbKvTAtIUQoU8poZvV/qJ20foxmsnHaLsKcGTu
	CpgWONEC6nDZMdItp5qiTCoBS+KyV4o2TdK/JXltAYxarO4fWabrHKsRv83FaLh8K8cI449wvJ7
	Jx9MEu3trUv6kJVZOnNIN4Wo4KJRNQv8DPO16+SBV7yNzgU8a5yF/nKv8f4B9s47IW8zOdDtPqb
	VQQctvp9qhgZnrTnprap94Pe3OUp+mxe3ouDipOgn1QQHikaZ5vIhoRrrRqw9n30G/Y0xDF+jdz
	PQOAX837yesEu85iT9vBgwxqclQqj7kDOxNuKsxOZuXD8MWvi3YRNCvvME0qEBBpQefTbtFUjp7
	6fl5DosFo6ij04NeDL8yyhvKa9n5Ar39EFWsM0U9mMwtpq/S5iJagAPzOCytN66uTK8j3Cpp6UN
	wiSsk3TmwynvupoSr8aB4k=
X-Received: by 2002:a05:6808:13d3:b0:46a:7718:c525 with SMTP id 5614622812f47-4799ca3e611mr4248868b6e.32.1776529452361;
        Sat, 18 Apr 2026 09:24:12 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b1f8:aabe:74d7:21ba? ([2600:8803:e7e4:500:b1f8:aabe:74d7:21ba])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930afa63sm4097296fac.5.2026.04.18.09.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 09:24:11 -0700 (PDT)
Message-ID: <36e3611d-642e-42de-9a56-cf81c3e06832@baylibre.com>
Date: Sat, 18 Apr 2026 11:24:10 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Update APDS990x ALS to support device trees
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260418144716.132936-1-clamor95@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260418144716.132936-1-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/26 9:47 AM, Svyatoslav Ryhel wrote:
> Document Avago APDS9900/9901 ALS/Proximity sensor in schema and modernize
> its driver to support OF bindings.
> 
> Svyatoslav Ryhel (5):
>   dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity
>     sensor
>   misc: apds990x: Use more device managed approach in the probe
>   misc: apds990x: Drop Vled supply
>   misc: apds990x: Convert to use OF bindings
>   misc: apds990x: Drop IRQF_TRIGGER_LOW trigger
> 
>  .../bindings/iio/light/avago,apds9900.yaml    |  83 ++++++++
>  drivers/misc/apds990x.c                       | 197 +++++++++---------

As mentioned in my reply to the dt-bindings patch, there is already an
IIO driver that looks like it could be compatible. I'm guessing that
this misc driver pre-dates the IIO subsystem. I would have a look at it
instead (drivers/iio/light/tsl2772.c).

>  include/linux/platform_data/apds990x.h        |  65 ------
>  3 files changed, 187 insertions(+), 158 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/avago,apds9900.yaml
>  delete mode 100644 include/linux/platform_data/apds990x.h
> 

