Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8113C37B3
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143134; cv=none; b=bmjmzCG3QRQUbNFl4AyMqdSd9d9QHb3Zv+w9b4tphLzfZZ4UFgzsSOxl/TkOCnHZcOn8WdwknK3XMPuklem23KEEQD7Uw2XJEvc3b+1nzQUPtN8E2436iSC3z5SsU2F2WdZ2Zo1GNPJSgJXM7lcQUbDvY8jf6aA63lga2XQTt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143134; c=relaxed/simple;
	bh=RSM04WqdCGywf6+XWc7SkmzH+XxLY8TCVgtHDFwsIhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fBwuhXh8bl6BOeUyPuA9Q4SLzMU8+Qg0oKfCsR1MQkFx30jH7e+hHdPU66JH2bLrGKeukKaXS6C82oK1AeigR7MBryQUJiUKhsq21k8S03XOV5uHhV2gjQYWZsaKPf9/Y455ei1tMpagUd/rt/2w6YHoFGbi11wfFN3USjkpiLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=j5xfRt6Q; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="j5xfRt6Q"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e6e9408e30so4009407a34.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782143132; x=1782747932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTvlJfJ/jYv7GeFAqft93Z3BGKkpqUZaDK2/YoNRVos=;
        b=j5xfRt6QIY4Pgn+IYlsI5YajmXQvVj+qLzi2jCCWZyiU6I72LItK3ry1p+2h2PaJnW
         JnO8V9HXcsWLeED1oxD/Q9U7YRAQz0mS4PARpmI17pwgNAp1IAyKZgG+NJW96RWNnyN1
         sXBu6WIAQefqHrd/v5dHoE3duCEn/m1c9nyCI/kFjVkmUH+6t0jO+SrK+ffmolY/UEgU
         zxNymAZErleNsxQhMOeoN2+rLy2JxTvOLN8ROlysNEgdxXi96g3Lr44FP5fi89IZ1mrS
         MH+XO+n9eLpoZwDHA1+Io240y7OKkFdgeZ3NF00znR49rp9XZitCQVI5ysyqwEWRvDSg
         f3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143132; x=1782747932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dTvlJfJ/jYv7GeFAqft93Z3BGKkpqUZaDK2/YoNRVos=;
        b=VvivoGuxf3JlB+Zsxeu4D0723dJCUqzb0qyFtuChp+XFamryW/m5LEHhS7aqJiucQo
         /PcUoEKHjUlGqY4Sv5EZOm/gRUhvj0gyZmSPuFaWhn0fuYhvKd/peO/P3HvSVhmrLDM3
         Jka0nWUxnWFwFLPCsh8mcet7ZUli+T3shpKzAMBRkzu615oAlIKISMzdIeiuTzOUOKkU
         hdlo5yfTrSTY5tSW9j5+BvprTkMrAht2KrB45xxaoNYq9cQTtEaMh2YAMVnflSz6dg3w
         2wIjnmLypcEyHDxNDYNsmEQl6FMejIb01hDMj7HLa/ycidAgrNuBd9eSIRfPMJ8Rc6WP
         pamw==
X-Forwarded-Encrypted: i=1; AFNElJ8qdb7cKwwEl2b+GxszUk1znAfSxEbIA6YmWkxchAwLgiBmScTE6ZB1yRJ+lWClOE2O5VRpjxNzfHu5@vger.kernel.org
X-Gm-Message-State: AOJu0YyoAiUuEMm0ZthvqFIlvFmgKiMqqQDGZAUnbWhmVV/V/TVMkzFF
	5cWtw4i59U6fbY51nKZqrztZE1nN028q3iD5uliUmXkL/iTgSbzz16lG+r1KzrsWs3IyVPQgU1F
	uersJS1U=
X-Gm-Gg: AfdE7ckfezJlhFOeippVv1l1W9Kat1PT95IG1P6Ppe5w4cxceYx2gZXSy8/ePqzk2FW
	huPGZoMy8rW0Bu+m6UWVI8Y13m/OKA+MBSC+JZNUDMlhl2MCpZisETLN2cz8osyHXS4A8y921R5
	1RGk9cAdRbKegQWj7zpxjkT1qyZTRpJpJ07cLf3bciQDOZqB/iSyf7IoxevGc6RLdXMWn46lht2
	fDaUf3DYEBUpK450te+zrM55o/4/vRD51aCn06Sb3sg+bUjOjwr+uCx67+olvCRvN5bUPizwLT1
	JunfFBoVVG35/mFJytNvwHCTyENYtnW8R3c+llRsTdiiu+wQdkxCPC5PzwG1XOuEl4thhhC2zMX
	BeQXoJbbEv8rftyRdFBEOlidQIlqp5TiWKHFnnp9JmvUxIuyfSyIUVnXrRMfCLLQA1isTJ8VkMh
	fYhsmFgdiryudVcSTc+ZvfljIsFgqCQM8IdHS8O6fBpMTRDChr5G/5JYKj3wHQFjU=
X-Received: by 2002:a05:6830:903:b0:7e6:f7fb:967f with SMTP id 46e09a7af769-7e92d801f3cmr13465829a34.2.1782143131998;
        Mon, 22 Jun 2026 08:45:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf? ([2600:8803:e7e4:500:b69c:5a77:b8fb:a5cf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e94429778csm6705723a34.20.2026.06.22.08.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:45:31 -0700 (PDT)
Message-ID: <614988b7-c77f-4f0e-b220-c0acf44bef27@baylibre.com>
Date: Mon, 22 Jun 2026 10:45:30 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] iio: temperature: Add support for the STS30
 temperature sensor
To: Maxwell Doose <m32285159@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20260621004626.66629-1-m32285159@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260621004626.66629-1-m32285159@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/26 7:46 PM, Maxwell Doose wrote:
> Hi all,
> 
> This patch series adds support for the Sensirion STS30 temperature
> sensor family. This driver currently supports non clock stretched single
> shot measurements.
> 
> Given there were very little issues found with the v1 submission, I've
> decided to make this a regular patch series rather than an RFC patch.

You should wait at least one week for feedback on a new driver before
submitting the next revision.

Given that you said in v1 that don't actually have the hardware, I am not
going to review this. We are getting more patches than I can keep up with
already.

> 
> Changes since v1:
> * whole series:
> - Squashed MAINTAINERS updates into both the dt-bindings commit and the
>   driver commit.
> 
