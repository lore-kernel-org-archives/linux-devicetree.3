Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A25199949
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775880087; cv=none; b=d2x3Ndc0Ou0Gbx3MzGEETXX2m841+XuzVnYq+0Lg6E9xiiyyVXGeSrLhximIwZ5IR/efseFuQnK11g1GKkxJIKYlC/VERZ9M80tAvxJPTC89tK6whPzE7L7KYX61KRhOEg9ZMBWAmuJdZx1h8caChlpCJRlO15aDv4VD2BVLqRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775880087; c=relaxed/simple;
	bh=xgjHwC1AwXhJ9F2iQmgdB0v8iSgBUj9wk6YdvmJPP4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hx/GsEy5R8Khg/raDf/YxQCqOowWHXzX6P7jIaOo4p+RgqfE/D0lV+Rt+/0je7Dk2uvpo7n+9MTo4vldczCTryjSeCZYgXzJEeUtC/3/UldAL/B6F3HNJNRqAJyOBm+gbF/KbiVHxXYao/Aii3ozWcnEc9yDU4KruP5vTf4yre0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsX60lUN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsX60lUN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3072176eec.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 21:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775880085; x=1776484885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XewBh8QvnsFo7H/03mxRKI703PTGQg+kRq9yZd0qc8k=;
        b=OsX60lUNHaUK+ABPsfTXtTx0jwhch5uOotTOoLrQ8R91H3z75WNF2Azu0EXa0Byo94
         tUi09rtpU1yud6pycSwaoaR6YEEbYpgQkcM0dVzIbcwl/2C4XdS6D0CzmSYCbq8daQrq
         WCJWKWwSIlWjVnFqo6fE6NEyCT+6r/r5cThmPuWNGVI4upLeFKt1baVCDSkr7wQ3WJQR
         LikTmWgXWLXG+w1jhbLMxs8jjjZ782EkQZPWYCHZ5ENf4Dl39SpNXrxjMtJHNO3Xhh8g
         e8hP07B7R234yYyogfZ/bb4+PmGFKDj7lJhXnWRLHe3wLu1nz19CdPWJtdNBQecl6Cg+
         MVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775880085; x=1776484885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XewBh8QvnsFo7H/03mxRKI703PTGQg+kRq9yZd0qc8k=;
        b=m+JUQaTNdSPUodmuZxzOXxlL4NzHzWsYQC5tG1TsSMcHHcQBwpzCMm5gMKFbMm09ZC
         4jPz1yAKC6ValO8QQcBMBSXmjWw6aC7JsaZ+n51klgiqZAbpqg1L81I43chuOXJ8FgT6
         5ooaz+jlpNA4MQts6s7Zh4vWdsjINQOSMg8tob530PQHLgwOk19hpJUNKjURllhjHfHv
         EkiaEU9ni05R/fBiQJnaBCOxMwNsaniqiFEKBVthFhIPP4aEY6vXBR1VgxcejFadxTyQ
         vjb4L1U7Nsj2k+W0XD9sZof7WwYtN1iJPlt3XYbu3Xv1ytN6TipOj/CbsYDnbhjuOU8v
         iRMw==
X-Forwarded-Encrypted: i=1; AJvYcCV1seZbzSYb6l8dYyNOwm18if/fp8HW70mLdk8dB1H7hvR74V/MNCe7aHR2e3V4dpyG2j9aDgaIGU3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwoT90lTJKm6aXDYGLg5xlthOV9gCBVDeAHtf23UJOQUsW3rj57
	YirAtxNaTt2b7w8Ak3VPnmBDWmdGqCfE/oe1ufl9QOtmmAKqsqBJ16Ft
X-Gm-Gg: AeBDieuQE0W7bM7E+j4Jm8Lve5NoUZ0GEI0izpfBB5ecp2V8bB+wIYdKi4Xl9G3iw1a
	etkvlAKNXtmAMFxRh3XX9v6YS6WcDEBjVAHYGW9d/F+x6s8ajY9KF/XDWA7AjRvLFf/LMVVArij
	+du9Y+trQGKOOPy7I46YqeuPQbMrhXD50GEezFjjRgknCB2+X8vlDAY7aKt+h4OPhUNTstP+R48
	+YnpFZraWCHplt3zby12nUbfcl5XFgF6Y1tJQ9jGIS1qrwPgCSxfdFjZV8loeRQEbUE0kgXRFuI
	z8Je+Ofqy+SOHmGyzq9AmiyFQjK9ueUwpxN4AICPJODa7SwYUdYwwwlsLeQsubzRRScZX3hQknS
	EVrFkVHIxepHgq4gFpCfflLqPQgGEXxcrf0tj8kPqWHx/Q1l4h7fW2YhCv8cFhmkRL6zTHAIC+7
	4bF3nfIP2Pp3v9hH/FQF63O4GznkGAKhL1j3MZZud7zfiZcCrgbTSWgPTao2Llbk+CoGj+Lu0d0
	YHDhw==
X-Received: by 2002:a05:7300:220d:b0:2ba:6b3a:7696 with SMTP id 5a478bee46e88-2d586991502mr3579824eec.8.1775880085337;
        Fri, 10 Apr 2026 21:01:25 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm8567896eec.10.2026.04.10.21.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 21:01:24 -0700 (PDT)
Message-ID: <a0eb87b5-7bb8-4aae-83a1-982d8b4c06f8@gmail.com>
Date: Fri, 10 Apr 2026 21:01:24 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: David Heidelberg <david@ixit.cz>, Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
 <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
 <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
 <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
 <eb1eebd2-75c0-4ffe-95e7-9f5d5d02edd1@ixit.cz>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <eb1eebd2-75c0-4ffe-95e7-9f5d5d02edd1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/7/26 14:46, David Heidelberg wrote:
> On 07/04/2026 23:04, Krzysztof Kozlowski wrote:
>> On 07/04/2026 22:39, Rudraksha Gupta wrote:
>>> On 4/7/26 12:59, Krzysztof Kozlowski wrote:
>>>> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>>>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>>>
>>>>> Reorganize the DTS file for consistency with other msm8960 board 
>>>>> files.
>>>>>
>>>>> Assisted-by: Claude:claude-opus-4.6
>>>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>>>> ---
>>>>>    .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 
>>>>> +++++++++++----------
>>>>>    1 file changed, 207 insertions(+), 201 deletions(-)
>>>>>
>>>> Sorry, but no. We are not taking Claude as one determining coding 
>>>> style.
>>>> Are we going to do the work again the moment we come with proper tool?
>>>
>>> There is no tool currently to auto format DTS, and doesn't seem to be
>>> coming for a while:
>>>
>>> https://www.youtube.com/watch?v=cvoIbTL_ZQA
>>>
>>>
>>> Claude didn't determine the coding style. I did based on sony-huashan,
>>> which is already upstream:
>>>
>>> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts 
>>>
>>>
>>>
>>> I just used Claude to do the manual work for me. In v2, I made sure the
>>> diff before and after the change was nill. v3 included additional
>>> changes requested by Konrad and some comments that I remembered during
>>> prior attempts mainlining patch series for this device.
>>
>> IMO, it is just too risky to let Claude reorganize the nodes, but I
>> assume reviewers of your code did run dtx_diff.
>
> I think it depends on the prompt. Since I’m performing many of the 
> same tasks repeatedly across multiple sdm845 devices, asking an LLM to 
> do node-by-node reorganization can be reasonably reviewable (at least 
> when reviewing incremental progress, not just the final diff).
>
> I would prefer to do more of the sorting myself, but I find it quite 
> tedious. The diff tool struggles when similar or identical lines 
> appear in different nodes, which often results in a messy final diff 
> (I noticed this in Sajattack’s sdm845 LG patchset).
>
> This leads me to an idea:
>
> For these sorting cleanups, perhaps we could introduce a “squash mode”?
>
> Contributors could submit commits per node, making the reorganization 
> clearly visible (and ensuring nothing is accidentally lost), and then 
> the maintainer could squash them into a single commit to avoid 
> cluttering the git log.
>
> What do you think?

Easiest solution would be to get Claude to make a DTS auto formatter. I 
estimate it would likely take a couple iterations to get a functional 
prototype and max a week to get it into a mergable state, if the style 
is agreed beforehand. Simply provide DTS'es that follow the pattern you 
like to Claude, then tell Claude that you want to make a Python script 
to auto format DTS files and make functions for each different common 
style pattern identified in the DTS'es. I assume it would give a good 
enough base to work off of. The most painful part will be determining 
what the correct style for all DTS'es as I'm sure others will have 
opinions on that.

