Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08943D9555
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332747; cv=none; b=I6xP1bZSNVJ7BxhBfYzc6SZKvKQNRrjERaBBpcqXnx+UW/NK0SIkOK4/wUUQ3DcgygFxaPezjO1mM6pqZIH2IyG5NGvMYvP75v0ZITQJNUKjrvEeZeGAbvojZwE3E0XlmwO83QYNu7S4E2IlMqSyp+7Tl5Gr7h6r2R6ic/rdfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332747; c=relaxed/simple;
	bh=gqgOIGIN6sXR8VaiD0l5Q2LHm5agZmjYy0VZs9k+yjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V1kdILxXfp1leccBl6ygR7xcwB8r6kW+8QcQwn/obQ+gTVOiMeuv9iYJRPBqSweR8hVNqAEWgcph+7Oyg6hnqmQajVDahXLWcUDmbHkkNvcpy4+WvNtAaIxpb7HGfphLUEPYVR/Qv9H1vd1NQztSo4EXS9F7Z2jIBBEe8iPpXFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRIBpWRj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRIBpWRj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c124c3c876aso384354866b.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783332744; x=1783937544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqdiZptSXu3ipdJWB6QZa/nDkTWEQFhlT8vnJMgKmk4=;
        b=DRIBpWRjP6YIlMnqGcYDXJ+MeyD3nsqikVqkGuR//MWxv21DRVtdAje+7iHEXQM6wF
         l1ecU8eqR5Ggg8MjCn80bql/csRRt2hGBTTTbSudJG5Q9Waw0CWMDsf+GALBEnUiqCPs
         LUO+HQkplwRdHPevEt39FnHn0afp/ntUwN65pUtfgkZFFfpI22p7mb+LJxuIirRniumA
         uiMB3VeHVALtHIssz8Sk/ZtPNoj2OyWPmAHSa5DoYANBiS8u/u0485j1Uq+CrNxwhxJe
         6V2qABnaG8aA8nXlB11Q/s2FJ4Bv9KbzSmN01AF79BMbY25NwETuwZ/nHlGV9CAxsKjI
         aSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783332744; x=1783937544;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqdiZptSXu3ipdJWB6QZa/nDkTWEQFhlT8vnJMgKmk4=;
        b=TUGOSdnuoywGoDqgLTQWrQAcHG35gmuYWKpXWXSiuR+BBqF4erg2s63l+7Ql8uMLp1
         uYAV0Rk1o0purXnjYSvdZtiCVw3wranctCnbPxq3BeIf0Ycj3yJv6LVfS0X0ydj0LIbq
         pRjRUe24/BB7XFcQ3/B/AMcSUlsga4JPZElQMz2L6V1xMnvO/7Lk0SNSstG25K+rYxOz
         XU4zMaI+YNvuk8Sp6UXt9EV7FR0tq1H2B1KihDwsz77fpWtN9pC30p+sjuNhGXt0zXpL
         LgUCLTNKDuUj1IJ4ICFZMOAbcuMeDB+tNp/KcW9MWfzrh43JlO+ekqJBp4bvmA2IBl44
         NfQg==
X-Forwarded-Encrypted: i=1; AHgh+Rrd02HkCv3wZT+q+5YlcL+4bjlrPCi8Xo7YMJ67X9dzCdjgJO8UcOfToG7l2vpufQhR9gFhuqLhhjQ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp33WQWvZYYITai3Mem8XdxdQd9BFNNFki8+8Arj67m/ZYPz/r
	uGtY2eieQkkvPt8Ao2sBdvprMH7SVB7e5u3pNlnocC8+2iYtLomVf8eIhUZmams8kPM=
X-Gm-Gg: AfdE7cki0CYJjgLXYFwyPgKQBbTesJK4S/oBXxS0gpvBrt/AoT15BntcXpSIjaPKoVi
	lTKcBOFSFsLE7GX2EQIc2l7K1Qb9lLA0aaB1JmhvQh9V1LH1ts2hXiVzlnff0JIrEzKIafvkI8S
	O8Ojt/R4a4rR0xwYhKfeDod+ZYy9+KMqKOS8nGisG67QZu842e5FzFvQ3DmkE6njuMYgNZozhOG
	BSrhkYKv2zLxHti/9eO9rBVogey8TsUhigV/cOlrfhW+SCStQ69yO17iw05Y/32gct3KEl9klCj
	hkf3kELjz/JyD8hrwdQijDAW3VZIowGNlrO6VlNtFiUcJaNeb+KJFwJ+FGDYU2iv+50ZBrNcn9m
	GzyysIe52rFvFS/mlFvJnbLqtZqgiNWoSr9xiBScesU9Q3frLpFU9f+kqo9xFSv8a0XvIJjxsYN
	gZV7EurV9BI4acErditoh1KMwA0Xzbo2O1eK37
X-Received: by 2002:a17:907:9454:b0:c0f:beeb:dbd8 with SMTP id a640c23a62f3a-c12e6b2e5ecmr395937066b.27.1783332744035;
        Mon, 06 Jul 2026 03:12:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6290972sm712364866b.41.2026.07.06.03.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:12:23 -0700 (PDT)
Message-ID: <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
Date: Mon, 6 Jul 2026 11:12:22 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 08:11, Atanas Filipov wrote:
> Note: The handling of shared camera subsystem resources (power domains,
> interconnects) for child IP blocks is still an open design question.

Why ?

A device needs to vote on its own interconnect and power-domains on any 
bus. A sub-device of another device may wish to ramp a clock for 
whatever reason.

There is no "master" device in this block of devices - save perhaps for 
the CSID mux / wrappers on some of these parts.

We have shared resources like camera noc, system noc and external clocks.

Please include power-domains and interconnects.

---
bod
