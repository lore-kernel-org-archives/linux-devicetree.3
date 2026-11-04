Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793805252;
	b=H9qc0jIrgxmyxnmkwOL7AvqXM1l/S47vSJNbiGLfkS2OkZFvr6EwPk4zXdw4xmf+QmYZ
	 p+S5z3hmpuzM+YVH5lF5LT3v1ISdYQ5oeFK39oyy1iOnY+G105GyPnYmL/hEQEeBcWE69
	 QoseLv7QHhiVK3MHSPmMANzS04LMtW/whlztOHMSdmYII9gdZ16D2qCvv2wqJ5uaiC4Mn
	 uNvL5NgKJETskkI/r0e4ZKm6q/hCgQ16AGkHKehqX97IYGDkS9u1cE1xtWyEOWMk+l8Km
	 J7JyS5VkNEY7ZBawkrEJqBDxdIrzJfcSYSnnQawq/zd4owQCcAEi9XTScICpHphrtCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
	b=kSNi9EFFr9iWO/K+4vhZ4mlK3Xtrs51Gzdig6lrVRM0ClbKSwdoXaZ+5syMB9K1GJIrC
	 lP8oJxhjR+XuAqMGdFG4I7/5SQyiR89dWpaupYQGLKTM6Zj9s3FU7biHic4eWrhA0ewY/
	 YQm3YBrpQEhZOi0wlRUj2kYn0uGRDEed8Np7Qd28N+cClHVAEc17t6WeZZfumqxa9z5RE
	 LrDkwenRiQeuAmbR5fvWHCxYq2Drom0fSJBGcKNfsyY2PXlJMsNUO6uGRFjIZvbZINwU4
	 yjy6eLpYH3FaluBeXdREj8LJZnrgEPIb/rPZd9V5cMbILWnbKF1WNaQLcDfYCOeoTDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY6uYD1v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4F606A329
	for <Devicetree@vger.kernel.org>; Wed,  4 Nov 2026 15:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B4F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY6uYD1v
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so915556a12.0
        for <Devicetree@vger.kernel.org>; Wed, 04 Nov 2026 07:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805251; cv=none;
        d=google.com; s=arc-20260327;
        b=M90ilt7cqm3heYiGBxdMn7tctehcikOSTtlfQdvxX6efSdgzEQ+0nkxVO3pAmfFNGs
         vRAdIq6Pxtf8ZI2O51YRaDX7s8oBsSdGH8o0+w/hV9ZIyGfR/2rF1I7iN0o0MRDifxk9
         Smy6f+sma71EgI0Zls5F+StqBG8Z87yaOs7DjxMtg9HHU3awOLa6TeNk1uYA+2/ZYI1M
         WId2UrM1JIJnsR1XkNnFvvlANuYeOcK7nGu+oYt+R2+Nu+7aGUoBLPr2GQAhQa9NdiNh
         jIdWzG9Hc3G4QR2y8POG7pTyPKbC5Xl8K87GmwFBfybeXdkIw+X2n37M/Q3qJf7pSGC3
         QEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        fh=hWIRNfMKG7siZDbUTVdEMOfsayRQ1gH1eHTkzgzKP+0=;
        b=QnXm6IyntOBoCoNzFipVk+l90yg0zQl5byI8i/d2m5MZfmcGwfhKUM8BUB2c+0V1b9
         d+6XgB3ixzCzezq8plNYtSTsAlDrP67UH7QfLXEtypTHATmzK1Rxvu/vi/ZYtCzAcrXl
         tdnmLXmb/n48Tq535weV7729dtjD5fXr+pRBMo9wnlj8bHZTnnsaPslNb/qXdPSqyHUo
         pUzP5j+YTCqZOngEvdq+MHA1cwboiym3dF5UTSRmiiP8/H2ZY6ktyuSbBoBbp23Q+0gy
         5LYoWH54a4Kr32A6CW/tWF5xxI/2YoDAW6yfkSWY4hwM/STXz0QaKRaC+G373F3ti0vF
         WDng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793805251; x=1794410051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        b=HY6uYD1vf1uwS1oAykVnBMNefRlP9SRKy456fmWRVAduc0eIIowekPG6VSP+JdjZcB
         ofR2EZhvXZHo26kwsW2BTRqutYdKn0s2Mr6m6weOsEPyESVciF0qr21lRucAfrDmqg4V
         80AgomVczOt1SIo5GXdz3iKJqUbsqAwgFMKXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805251; x=1794410051;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SZqVUJKXtA94P6bTEy16aUk/m/u6t0bulNqJn68FpE8=;
        b=a0u2UPmd6Zsd2o4F+5zht59IbVyXGYRGAVePOx8SwQUkaFLqpDmgq2ADygLkcDydld
         ROPciPoDmnqPEouqbT9C9PAJGl40OKtrGLMgYTnj3pvfVSWfOz8wAO18GKQO2jvH46lH
         zuBbfqhK3bTbTICkPt5B8iyR3hmeh/dAl4AHMI4g5V89kxdIVaxcPHTK3y1cjnpMWUmd
         /jLyavFVbBYAUsoTRPjsLS42hUIdi3LF1VrwW2s6CQQnyPsh2wkeKQVucH/ahd34GcTJ
         GRe36jDTVN8+ky9jwTH9NQlo3BRTIGiof6dLJZZJPG6REBWeldRUuWay4SKytKMzVXg0
         Mfvg==
X-Forwarded-Encrypted: i=1; AKwUvByj1yjSr42VS+lNmtiIxy5A808vQH9aS+v8D41Qcc5id6pAT5Tkx2XbzRAoLHsW8cajNXfPWcXsF+OP@vger.kernel.org
X-Gm-Message-State: APuU4Z/9q8349QK+e4TkKATblHZt01O7c3Ht0Daxv0oezXuoHEyOB5By
	+GqUkz0J22F9jhAHBA7fyvLO/QWGL0Ou8pqWdsKrB5pRBlk4n5OsJFTtSzXl4oPvCW+TIJU1nYK
	5n9RrHTO/RU5RmtsAFNqd9nsF2M4UM1tF+jvLtcfQ
X-Gm-Gg: AYBFou1DbSjaBB35KOpVcWpUJ7rzxt0pcgHyxl+UvZJxXA+46ur5UDrxOjlVBa/77SH
	PA3puZMbdNaDn7VDLkOoOl2gSBqh0Hc0uuHi8r8VHKIMNo1xhv6G9oMzdbvh0w4eHKPuBt9dAa/
	Pctfrv23moWULTvwSlpUSahCYBgQ3oIIRV+UsMaafgzLN2qFYqaxIiVGL6bdXVPXhwFUi0SBWvu
	QqvaQ57kdJR6TmzBbZqYum3cjnRtCRqyeEIMXjHEJqcgbDgAe/+L04jJwPwz13rqdd+qKJEaNaw
	OVwsujZ2Q0cnTq41ZQ/BOUHtXCfxLFeWvcdW9Bg+NHbgTDQ1mG55QFvbVQsXuXU3cq3Cq+WxLwt
	hT7Min+nw+TUrFzkxPsnI5TQGwZtm0BLHw9DlFOIv2cMgE4HwXHThssr4pbVohHXMmnmVq3Y=
X-Received: by 2002:a05:6402:1ecf:b0:6b4:be8c:325b with SMTP id
 4fb4d7f45d1cf-6b4d3285c72mr12781754a12.0.1793805250703; Wed, 04 Nov 2026
 07:14:10 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 07:14:09 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 08:58:47 -0600
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261101220224.1436242-8-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org> <20261101220224.1436242-8-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 07:14:09 -0800
X-Gm-Features: AclHuK8zRxeH5csXFpoD2u-FiyL3vbkKclLgEtNnscyWzGd1u0WrvcYL68ykwns
Message-ID: <CAFLszTgY5oOMYQjsk2sg-8w88uKq2hOqEiF4o5iAi5pMC8TZGw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] devicetree: Add DeviceTree live tree representation
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Devicetree@vger.kernel.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, 
	linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-11-01T22:01:07, Douglas Anderson <dianders@chromium.org> wrote:
> devicetree: Add DeviceTree live tree representation
>
> Add `devicetree.py` providing `DeviceTree`, a non-flattened in-memory
> representation of a devicetree node and its subtree:

Please can you start with the motivation, i.e. why a live tree is
needed and what will use it? The list below mostly repeats the
docstrings.

>
> - `DeviceTree.unflatten(fdt, offset=0)` builds a `DeviceTree` hierarchy
>   from an `FdtRo` instance, storing `libfdt.Property` instances in
>   `self.props` and raising `ValueError` if duplicate property or sibling
>   subnode names are encountered.
> - `DeviceTree.flatten(mem_rsv=(), boot_cpuid_phys=0)` serializes a root
>   `DeviceTree` back into a packed `libfdt.Fdt` object via `FdtSw`.
> - `get_node()`, `create_path()`, and `walk()` provide path lookup,
>   intermediate node creation, and pre-order traversal.
> - `get_str()`, `set_str()`, `get_stringlist()`, `set_stringlist()`,
>   `get_u32()`, `set_u32()`, `get_u32_list()`, and `set_u32_list()`
>   provide typed property access and mutation.
>
> Add unit tests in `tests/pylibfdt_tests.py` covering `DeviceTree`
> unflatten/flatten round-tripping, duplicate name rejection, and helper
> methods.
> [...]
>
>  devicetree.py           | 276 ++++++++++++++++++++++++++++++++++++++++++++++++
>  meson.build             |   1 +
>  tests/meson.build       |   2 +-
>  tests/pylibfdt_tests.py |  77 ++++++++++++++
>  4 files changed, 355 insertions(+), 1 deletion(-)

> diff --git a/meson.build b/meson.build
> @@ -125,6 +125,7 @@ endforeach
> +  py.install_sources('devicetree.py')

I'd forgotten about this but PyPI has Zephyr's python-devicetree
[1][2], which installs a top-level 'devicetree' package.

I'm not sure what to suggest. Would libfdt_devicetree be too awful?

[1] https://github.com/zephyrproject-rtos/python-devicetree
[2] https://pypi.org/project/devicetree/

> diff --git a/devicetree.py b/devicetree.py
> @@ -0,0 +1,276 @@
> +        for suboff in fdt.subnodes(offset):
> +            subname = fdt.get_name(suboff)

We should try to stop on a corrupt tree - so I think this needs error-checking.

Regards,
Simon
