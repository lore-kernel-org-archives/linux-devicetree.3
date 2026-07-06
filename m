Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0880542466C
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783339874; cv=none; b=SIOll9H5eK1Urtp5UuehJR2UVGQUShEHknGXpbJFyCAFXWTxp6GJRRT4/qdt4FAmZN/MQrxhp4KICXYrtuzAYlf28FvnTk64R4S6XKgJH3j21+PwFCgyV5wdWz7MCZK+QZlaZ0zZarBTd0RpeaaeCZgCGH6bxnQFImoW5VkKwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783339874; c=relaxed/simple;
	bh=Q2U+Op+VJBwZYOYmZL+6AFPmXvDyszSs9SWc4mWsXTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pohfUyXctH0eRLgE78+RicX0MP3UXuTdbXQE3Rg5Ch8KwYybdy90NjJuB31lgdkhv7LmMbsNvdiI5FaSmYmNJ/3k1iix99MkExaOm9246Id8BMz6OU5R9P+03c3z65R3atx/9y6ZELuSWlr5YGdKKjfBjrYEvmQpZU81Le6ypN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7nnWQrA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7nnWQrA"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso4974433a12.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783339871; x=1783944671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PaIUyVR1PWkAm9FdD5PygQC8S63mBB2HotoKGs4tuv0=;
        b=Y7nnWQrAQH33hTrdMgl43FOkIkiPgwjlyVmPXc0AeLtOj95DJ/Bf3Qv9CLpmn6ekM4
         ThgMWcZ1Zsun/imq5Re0PE4p8/l+4x5m52h/PCM42DA1HpuEEl/4q1SbTMe6nOONX3+e
         qmZ1/JSFx5+eEiL8X5FTaBpSZY0CL5ND0Qztn63yEctP2IgJMn/FKB7EQC7JrRTiI8hM
         urq6scDiwaSJSWHsFxwNJCSZp5aWs/zlerN05cAtzVpVq8keecsMt/0VucnGlcY5Xn39
         cDgE6QBOunNPfTIYXbT+f/fawD3NszKM9bchaye7renITmT21R3d5DCvAuWO7LGE0OOg
         Z0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783339871; x=1783944671;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PaIUyVR1PWkAm9FdD5PygQC8S63mBB2HotoKGs4tuv0=;
        b=rm0GPuhLHynBjQ1OfSee30JdZa8Fw2LmmYAjCWQm8fucbAzl/o7KbH2jxDwWmHBiQQ
         4tqKp8sID2gXDW05sUoe+prE4c6CIl7k38XWM9skqYB+4u/wpqvJMyIY5uM7TOdKvYGg
         R0A8mpRgZsNUDD/nhYgjR3Inj6HDQIRWlHhLhgOpf2gWQR3uDC4MMTWKO1TOCGzA6riE
         KLyleWOHPEByis8Si2nzfLCCi6p13i2t4apn0Jrvm40fSX8hJXVLtSYv7PhNwB5xUNz/
         QzzEXbCgtPG6UwNxVMex0068cmCgWxWndaurPFAs2KpfnrLhshdKXyznHBGWFwbRcUd+
         6JHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Tb66bjjG9suvFHXEwPmr6/8jcxIuUgGcIs9G8BtHXbuMOwSmUntjYK1GYkmjYtnpWUlFbShnY1v9@vger.kernel.org
X-Gm-Message-State: AOJu0YwQa9hZTlBkN/aWa5banQEUOw4NkZitc4I9TuQSuyOIkjyollgZ
	Yx/f7uhlAIU61xHuuda+QNT5iSnMczdy7pn3Va3FXcSdjyr3IqpdGl/1pgbscIxsBIs=
X-Gm-Gg: AfdE7cnjxmKwKi03tna2bXGLQu4mZ+dP/OtBW/fMixsey9GtqVrPN5b4in/s+Qr4PqU
	1gJb1kIL8lk13gXdoiAwdFR2mTP8c+4n43GrKzmtMXAGhVupRfSuiJt4/h9pgfYHMsfC/FW4qBw
	1NQMh9jiWrj7UrpzTMfiEzOHwVeRWczOJuNo73qTv9luzjcDiijiWltz36MqbgMgKO8S0ppRwZZ
	SVMkSeRqQZHVj3V5/CidOulXy9F3ll8YUraobaE9vRlxS9IcSsx7gn04ekXwk9VGPoz6tzVcD7k
	ZCnCDivgPBGqkIhg5NCzYQgrAWh95ho2/Ss/lKnyzcSmmTob7ikDXw/VzolZ6r+eEOeH91ebuOU
	rR6uvcdSuS0fBkRTG1yu+dbkXE4K0Wv6rO/2lPfpJKGmCNTjy4kELFY5E8By+lkm+Kk88lJ+fTh
	BVPASZXN7FD8/Tavw5h4mwyzxN6Q==
X-Received: by 2002:a17:906:d30b:b0:bd7:f75a:817c with SMTP id a640c23a62f3a-c15a67f809fmr14565066b.17.1783339871421;
        Mon, 06 Jul 2026 05:11:11 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6054fe7sm732082766b.10.2026.07.06.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:11:10 -0700 (PDT)
Message-ID: <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
Date: Mon, 6 Jul 2026 13:11:09 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2026 13:00, Vladimir Zapolskiy wrote:
>> There is no "master" device in this block of devices - save perhaps for
>> the CSID mux / wrappers on some of these parts.
>>
>> We have shared resources like camera noc, system noc and external clocks.
>>
>> Please include power-domains and interconnects.
>>
> 
> Why? The common power domain and interconnects have already been
> described as resources of the parent CAMSS device, there is no need
> to duplicate descriptions in every child device tree node of CAMSS.

CSID, IFE etc are not parents of the JPEG encoder.

The idea is to make all of these peers, eventually. Not particular block 
owns the TITAN_TOP_GDSC - the entire CAMSS block is a collapsible block.

---
bod
