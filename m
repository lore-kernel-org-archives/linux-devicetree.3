Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC95168BD
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775320175; cv=none; b=CWWjnbcCA5kEOUwcpnokcyda2KUFhZ034OGX/RP0ZwQA84WuJh2zDHlcfTRSj6wsaeDVm6OY7CUB/zrl26NJHRs6/63rarAQ6pPN8Efy/duVqu15emmIrc8DNKAcQg1gd1BfBkGFzDYyuDjEhBZbH5ISGBRzrvwF8gd/Bc1Y714=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775320175; c=relaxed/simple;
	bh=J+mH3tlc4DzHrOdvjC92wgc8hfC/3o2s8GlMhvE+s00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqMxZsFgmuQxQE+FOTjvM1wFCuu44Himwo1EznmtSaGTiSLuOgjR1OZnYETTAaKqhWD5wtkJUPmy1vzHIGxOehJnPni5vf8SBqk2tP0ltjxQXFEpTTj5Lt3MS11Xw8z1XFN+U3bBdBnn63/7mo8Ftg4w0mqhtSnohbNj5n2j+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=FjqMWRoZ; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="FjqMWRoZ"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-470145d7e6eso418380b6e.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775320172; x=1775924972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++8C+TxvxhaCAqikK6VYVaMY+sXmVJh/F3nUP9aaBRo=;
        b=FjqMWRoZY8egRIS+pC8sqmz1d+eervbT0T9RaLaNDHx2V+K64WQKDoR0sqK2Z7qq/2
         L1+04An51bA2B819ZzMZADFhlE6TCn5WTiYf7Y3QzFVjQpt3DKdqGlsz4LvM/wiGJlm2
         QGu/L6nzolw5olKLwHmR7DJIcSGC5L7uLgU8j6yYV4Qx9ZtxIZpwSm68XV+m4f5XVMxs
         j8x4dk7jDrFxenISkI8CVGAJuj3FnwN3aRUPf6OBg2Ol2SS6XvW8/E0ZehnxBxn+8MbN
         3aSdNSBVD58piT1McaeTYoJnOwBV3l7Fsi3dgqY9OmyCKvKBwGFHHizCYt2lDAncHACj
         yINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775320172; x=1775924972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++8C+TxvxhaCAqikK6VYVaMY+sXmVJh/F3nUP9aaBRo=;
        b=Smn5Wc1CA4UxpzJQf0n+NCzRdtZrErC/0uzDZm0lOCYC4pfW3ngnD6UHUV40qskVcT
         UmZ+bkpshCNUC2Kj2dGIIHnivYajQ5E8aatZ0iEL25IuS0MtWr8Cuv9SXZQ+yxjjpdBD
         ct6jQROR7tT91Anm8jBbY+Iwei5BpryhRYl9ln8nT1MT88W692EoldXm9ARZBU+pA+xX
         EnlUxDowQXKkAvR53hRFL16LAJN1lL2mYv5M/Lu6SxcIYjGHNvpQjDINHZAHp+hbpTD+
         t8qJOiHuUBQy2+Qf5vmlkB2bD6rFTs16ikwTyIRrBvQa/LdJ00UKijZNon7zgraUf0sD
         APDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu3TmsrYH7Ym41iPE8cyGj/R1XrhcfBVzagmVj21fd7QHBXuAYT7SIwta/9k1vYuH5B1mT3CpsV32f@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5X8vyrvaoz5c5r9bdHPgqM1LqP7w5KPnHQ5liWJujWnMUrSeW
	mj8sRlEYAAZ7u/x0RaCPMvaFzlXIhd9Tk2+W3+DmFHOsYsXLd4MjBgBCJstCrJlkKTw=
X-Gm-Gg: AeBDievbHqQ/E8t+6/KQKNkOIv8hbI9OMihK7912kuYzfe3CC4XfI3qHg3jxFB1fpZG
	Or/W4ciASab9/lZexNt6cf4yU57V53yh6ijG6R68fIszIrr1gLizx+76dgZlj7zJk0qc9iBr+SL
	oSOSyycMYdyRrApie1xTCG1mwRAnVpQIJkwXIMHHCnrTi2fot1mJ1OfKlwyQKLhaDSOTvo9mKMx
	/SsJU8m9wmNH1f+gGQ0t0nLCQAN+dHlZyYG7m43bSsW9uT7EwfUTKuuRsV+dsj6aYwGzwl43hb1
	YDiv6dHM1tYrBeReM8v+tJnxvxRnM1kzGfkIOF7cEDUYJS4fvkZFx4siazfuI+Y36LlaBgS8iXp
	Bjgf14Be+ixc3hnJxYgrrB3wckq+ca2fd+hxqYPOsPAmdJLWnBRpSJNc1hiaiiWNHf54Yx0wKeL
	+h3Fm8HEMLmQL6ybyjhJZDL+RkxcRQ2419I5zhpx0c2++4VpDiyLoZZpnIAr2yNPPTiNMwxO+NJ
	w==
X-Received: by 2002:a05:6808:894c:b0:463:927c:1e3d with SMTP id 5614622812f47-46ef66f9cd7mr3956595b6e.23.1775320171996;
        Sat, 04 Apr 2026 09:29:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:e14e:bcc6:3f95:26eb? ([2600:8803:e7e4:500:e14e:bcc6:3f95:26eb])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d9387a763sm5220382b6e.18.2026.04.04.09.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 09:29:30 -0700 (PDT)
Message-ID: <fc46eb9c-abe0-49af-9f19-fa06f6cf2847@baylibre.com>
Date: Sat, 4 Apr 2026 11:29:28 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Move adis16203 inclinometer driver out of staging
To: Sheng Kun Chang <nothingchang@mirrorstack.ai>, jic23@kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 andy@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/26 11:24 AM, Sheng Kun Chang wrote:
> This series moves the ADIS16203 Programmable 360 Degrees Inclinometer
> driver out of staging and into drivers/iio/accel/.
> 
> The driver already uses standard IIO channel interfaces and devm
> managed APIs. The only missing piece was devicetree binding
> documentation, which is added in patch 1.
> 
> Patch 1: Add devicetree binding documentation
> Patch 2: Fix MODULE_LICENSE to match SPDX identifier
> Patch 3: Move the driver from staging to drivers/iio/accel/
> 
> Sheng Kun Chang (3):
>   dt-bindings: iio: accel: add binding for adi,adis16203
>   staging: iio: adis16203: align MODULE_LICENSE with SPDX identifier
>   iio: accel: move adis16203 out of staging
> 
>  .../bindings/iio/accel/adi,adis16203.yaml     | 52 +++++++++++++++++++
>  drivers/iio/accel/Kconfig                     | 12 +++++
>  drivers/iio/accel/Makefile                    |  1 +
>  drivers/{staging => }/iio/accel/adis16203.c   |  2 +-
>  drivers/staging/iio/Kconfig                   |  1 -
>  drivers/staging/iio/Makefile                  |  1 -
>  drivers/staging/iio/accel/Kconfig             | 19 -------
>  drivers/staging/iio/accel/Makefile            |  6 ---
>  8 files changed, 66 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/adi,adis16203.yaml
>  rename drivers/{staging => }/iio/accel/adis16203.c (99%)
>  delete mode 100644 drivers/staging/iio/accel/Kconfig
>  delete mode 100644 drivers/staging/iio/accel/Makefile
> 

Quite a few people have attempted this already [1]. It is likely not as simple
as renaming the file. Please review and give a summary of all of the previous
attempts so that all of us reviewers don't have to go read all of those messages.

[1]: https://lore.kernel.org/linux-iio/?q=adis16203

And when reading those messages, you should find that the rename patch needs
to have the full diff (I think this is the --no-renames option to git
format-patch). This way we can review the driver in it's current state one
more time to make sure we didn't miss any cleanups that are needed first.
