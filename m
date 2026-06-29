Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D3C3E168B
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745782; cv=none; b=e05bZyFAScvwZ469X+IcLeNTkzNsgUnVnq2rv6ZVfyPyS5fzUSOb34ElnUc4nsTlOxiXLCsE23igZtYdiRg6n4DtzrW/6dOr0Nzw0jiMY3oNeCUk8JwLek79I+AoHI1/bLTKsN6/312z5wIbfXh+A2Jtw031mUKD8XuIndASqJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745782; c=relaxed/simple;
	bh=J3QGTSuZ1XsobPdOg6SSeoy1Ot00wX1k51YYOvEUCKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3Ap5rFHqN2ABc8lEHlBL35/4LEnBtROgyvda04eW06RbvNfoBLLeJC0uZp3mD3/tiZgcPqTo4/yw+GkfCtDvKa6OCFG8sxgAdqAbuSyiNLWky32K5pcAZmqN2QysVxd4tu3cvK7lBiA/VC02Uz8m7DB9TUT4KKcuv7inA/biV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BMG9aQZH; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BMG9aQZH"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-44847520d7cso1387540fac.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 08:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782745780; x=1783350580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTUwvNadQrvVpwtKaon11x72JePn9X3S2cEHloyT/Hw=;
        b=BMG9aQZHLDYhBa6A1jTbk4NJOrOPmvqqct/9czKqTV1db/IWoOlfpgf0XSj9VvEykE
         vrJU+CrqJsqSgTPSQ/Fthm8OH8ApORCRxb6eV9FvyruSzsowqCA5RX3WYH76jwIhVLHD
         kAdEwl81JaSaZ9U9FNoAbTnplrzHsBxUPdAhw5xIW3UALigW2BdD43f3zmcj7Q6G5Ymq
         SO2d0eHhne0FCpJssWv1YX2C4GJnBiKUzjWWpwtKMJ6Eh2r30DgjcWTDzrRKx2QTDFBI
         Geb9Gm7ANCl6kB1PaCJx7Cfma4GV39Pmgnvv5OAQRzncQc4jVUulMr7bUSksLdvdylMa
         TSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745780; x=1783350580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTUwvNadQrvVpwtKaon11x72JePn9X3S2cEHloyT/Hw=;
        b=P38L/xWj1WIB8KWYEKhaf9xYg/wa4OPFxlxs50DUkvsbeOVUlQsilZ/gGBRreNitGh
         gztV3EDeOCZM7yHJR1aaFKXfwSLotU+ZTRAIVrby9B3p9YlQbcar46T7ZbYnEKZgv8W8
         X6PWRpUr0ZyqNDdsY9gRfjjTyWK7EGpmtN2C8zqTfNm2ZjWu5jM+e6lm36SFCAhLIJ1l
         RO+2KmyICiuLPjMPgscqPZBi55FA4J4O2zy5vF2G5fmrNvb628jFECN51+98ekllFfDi
         saI9h9agyO38T8Sh/92VJfYOfZCgM0Yuuny/g5ux/PhEuLyyYDlio/ALKpWn6dkyo32b
         USlg==
X-Forwarded-Encrypted: i=1; AHgh+RpeFa8MmBXd7ruYQreCmzzwfRKn62vSYdzRRrTAKYXTBK/Tc/thBnt3e7lN8OawZwn7zVR8f4+1H2U1@vger.kernel.org
X-Gm-Message-State: AOJu0YwczeGPHIHauyDr/oUnIbho6xa0a/UVflTZZZ16gS6sx0UOPzeQ
	F9T4aafSXkrlYxSa5WcqvHsDCeK7lpnAlmi3ZXeTkbnnIVsITSzOZ6Udg9ffAGe/LNQ/PAtHMUP
	ux5lp
X-Gm-Gg: AfdE7cmnrVo8gvn/ewGThm3mEvjKzBMq+HgOZwKFrmUyVCMA2wSWh0iUtT831oKCHV9
	5IqZrZVuA2LgX8oOc0Dana9JvKcc9tm4tbCeY64xHN3o/6sA9R4XoBFbg3XujGfFSWRDQMCuVjC
	2ibO+/2P9GZRWYVw1WcIiRWxVsRMe+mOofeVAHVXVQBSq6Hz/5BxViHTHgdfWz8jxMO1dAfFHli
	HHOC9BgmirKogC2iTtEp+d1uUIM2ab6/2KhlnA6FqdNDkv1v73Aj4bXPyfVYonHTM6ZQ6JnDeLC
	IbU0+pmjKOrK4XMIOb1hZBSPL9OCcTohwQ16m5t5eMWLUzv/NIPI0okHoULd4ut8WVGnVRVwKim
	X5WljbK5cRRyEoP9DzxWu0kk5CtYVf6JydxKyx8T/wXVZWDkbHLy26r8Llkl1X5EpD/Lkl0HIG2
	RFDY416MTVAJpdxGFttNWz9bGSNISBCN36lXTONr1Ot3za2R2KWE6XHDywx/l+0Wk=
X-Received: by 2002:a05:6870:830a:b0:439:a524:a29d with SMTP id 586e51a60fabf-4484e87cee4mr7386130fac.1.1782745780245;
        Mon, 29 Jun 2026 08:09:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3533:aa22:9a69:df1c? ([2600:8803:e7e4:500:3533:aa22:9a69:df1c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbee3badsm19615fac.12.2026.06.29.08.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:09:39 -0700 (PDT)
Message-ID: <f759ad9b-56ef-482a-9389-85ea1e3fd7d3@baylibre.com>
Date: Mon, 29 Jun 2026 10:09:39 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
To: Chi-Wen Weng <cwweng.linux@gmail.com>, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-3-cwweng.linux@gmail.com>
 <66ad5723-6589-473a-91da-b13e2ba90aeb@baylibre.com>
 <5e65eabd-699b-4587-bb38-d8ef5c6d2aaa@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <5e65eabd-699b-4587-bb38-d8ef5c6d2aaa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/29/26 2:32 AM, Chi-Wen Weng wrote:
> Hi David,
> 
> Thanks for the detailed review.
> 
> After looking at your comments and the other review feedback, I plan to
> simplify v2 and limit the initial upstream driver to direct raw reads for
> the external single-ended ADC channels.
> 
> In v2, I will drop the triggered buffer support, the device trigger and
> the differential channel support for now. Buffered capture and
> differential inputs can be added later as follow-up patches once the
> scan sequencing, trigger model and differential pair constraints are
> handled properly.

This is a simple/small enough driver that it would be fine to still
keep all of those features in v2. It would still be fine to split
them into separate patches, but you could still send them all as
a single patch series.

> 
> This also means that the scan buffer layout comments will no longer
> apply to v2, since the triggered-buffer path will be removed from the
> initial submission.
> 
> I will address the other driver comments in v2:
> - drop the unused struct device pointer,
> - remove the triggered-buffer and trigger-related Kconfig selects,
> - switch the register access helpers to regmap,
> - avoid forcing the external reference path unconditionally,
> - add optional vref-supply handling,
> - add IIO_CHAN_INFO_SCALE based on the selected reference source,
> - use the internal reference when no vref-supply is provided,
> - add a named macro for the sample-time field,
> - drop the unused channel address field,
> - drop datasheet_name from the initial driver,
> - use device_for_each_child_node_scoped(),
> - use devm_mutex_init(),
> - keep only INDIO_DIRECT_MODE for the initial driver.
> 
> For the firmware-described channels, v2 will only accept the external
> ADC input channels 0 to 7. The internal VBAT channel and differential
> inputs will not be described or exposed by the initial driver.
> 
> Thanks,
> Chi-Wen
> 
> David Lechner 於 2026/6/28 上午 04:52 寫道:
>> On 6/25/26 6:06 AM, Chi-Wen Weng wrote:
>>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>>
>>> Add an IIO driver for the Nuvoton MA35D1 Enhanced ADC controller.
>>>
For future reference, please don't top-post, but rather put your
reply inline like this and trim any irrelevant context.

