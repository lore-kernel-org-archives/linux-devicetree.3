Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368164;
	b=qhnLMCqT46++Ej9acVR6jpUlvOzxmgyeTYHmFLqF+5slJO8FQjZa1qUBTWL8t7JOtdY6
	 mIaKjQjdIVu5OwhDShp61oh//yKvNZxQ9Ka8TvHwRJJ0/Nd7sxBPpkXKNyoBZ2RjxuLVL
	 ebp8805kxvpef+dWRIP5iYz6B8YkFnY1EcOifXr+JukcWt5hlGDN5YxItGGHepawz4TF7
	 7NcPbyoa6S3/DeHMkNpmXYn9YAe4h/OsGVu/O8jTkv0prmf3h7pe2feWwMxYQP+8uVxLM
	 q7OS068UruQJh65gddraQe58L4EemfaQ9dWEUL9nvlxY7jJbwxsObFma8mN3lAamSyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
	b=3anjpRi1UFOCHPRT21gedhAC8oGe/j27ONdORJam21yRjAWcjk55V2lC/idqN4uApwVW
	 FJlucGh6S5Pm4qPhKEu5HtDy+noUKa9RUEt4CkUdZpn1B6SdYDcINzKNnq++T1+pZ4ESp
	 KS4m6TNVp9rW/c9cGLJlqjzpZYsGJT5WP2MCaldrr/MtNpCF1SEX8wCledAL3Way76pTR
	 ITnw25jPE8WB2YmT8NH21wuIo0Grs751NlXdCdKpiv4JrqPFtvq7ccLxNmiP2DOIsW6o/
	 3ShkMDU1w6rVdw2alZZ7zoLxz9/52Ad/mKFxlhoKjcq6ewYDqNka1EToTQcaOw0//tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdMN/uuh";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC0B606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC0B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdMN/uuh
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so3084253eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368163; x=1795972963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=rdMN/uuh37VKObF52K9+lcme53bqcVhzqmpmYe9zYf4xuf7IMBHBGOWYyCDpwozQem
         HWXEws9rArjqW8P+BJrs8nA5WqwClIUasxOguhVLwHBAfr+1EfGiWqdYOGJcP3CtmHI0
         gFM2LT3VrFa+7Y1gdLeG9WA6HQpTTkVWY35gj/quFUOILDjm/CiPqDGJ91U16Z19CGBl
         KUK3EdQL3TDOO5ADOUiFXPerabn7IEcmxNlrpheQJPGdqhsKbS5g6fctTEQ8Xc8PYA1C
         8gAFgyUBNZoud48/lrvtNYJu2wAHKjInCOYGYtovVezXg95EEZqg2FGRsu8+8BtEPE3j
         PHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368163; x=1795972963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=576Qvl2ypTDD9yrAIj4YAh6P34TjGSq1gM/j9EPcq4Y=;
        b=zYwDJaawzHZcBNj6gNCnQqc+iBI2rh3Cw6fVCUZDaCGYjjSy2wqaoLGyVqePQPZlsp
         gh9Ax9YNzymJcmmLdLpZO13xHk4Y+kMAgyBYCATjX2rBTaJMzUsgL7/Ez3JyE4aysg6Q
         1bb7fmYCoK5bVC/2CY1EmKnBpU6Ltg7rXVBZLM8sEfywcECJBhfDtCXG1AF4IdxQu934
         fxCSGzYUpCFmuq9yNCBPjGi8Xp/nPlnVbV6x/fD3LQiejK53S+RS3Kl9Xpgu/MNgbrkY
         wNVGWyXqVawPPZ5pw4SP2wUGPsnwWlJAcv8XtNZQ+qrIH/eD8Xpz+Ne6AwN5IAQOrCE9
         x/3w==
X-Forwarded-Encrypted: i=1; AL+hErHWopoKw6WimnSdTy+5wdwm6dlg5zXaPbmrhJMLHHK5Swaiiyrm74HihOvPGJ9NBUK2UlMMJzYURqtI@vger.kernel.org
X-Gm-Message-State: APuU4Z8q1UtiForFcm7l+qD+BENIpYOtL9tRsiLiPWDSPmlP9QypqY77
	ffOl7ZmnUl9C4KtMGTA4zrVHSU19ZzDXcymENbnpkduisWvmzi1Mef5W
X-Gm-Gg: AZFdTZe/sH+64JmCRU+bGJpQ+JRTOs46R3uBf17a6iAa+YTaTcowrtcFhcRASBjUvIs
	m50+vT7nwK6fxibxG6Yq/PCiMigiVGhYl2UKfscQZZFZziXG74N7QttRBZp7KVfIwg+JjYdKxzN
	7HHYK/Imt8/ILTmoU+r4zvzHfaPjNqq1PGqHdIA8eO6/KJfnJtVEGSbTGpIw9NDCGNIPuhtYf21
	isVzD8bLIpPaqByj/VEoczG2UKXoSnP5F0DTQcPRDasv1JpdeWoIrmyj/0JhTRKCBkag4tvhuYv
	fc3hYhE595TzWteCIMMG7JAsLt+zPaWFRjmdgL4XHwlSOt5AwrTcgGMpEueHy6bYgEjQp/Kwffj
	oHjsKje4gYh8FsGq7FIwZJ5jpXOnA/hrNvT+5K6LK69T5YGBvIbp/7QoURF3S25QmFenQdf4jjq
	tXCnumqt+srhOhbEZ4PDVUIMFcmIlDZth1F4b8dMhWGvyn1lYNuKyK6RLSVDyeV+bBK/56wgG8D
	G0OzFhWGpB9EqaH+/HUx/B16o1ZnI+VzKLqLyU8kofORrKhkV1J6HByzqwNqO2rtUtounuBhUEP
	9yd2pQpD1UhDi0ThVoK36zRrGEakVj36ttKIA2B6zOisaW23YImxmb2PdrNMUo3GMWuI0Hi0gQX
	uZ/bDjUny35hc+WpcvcIOUbgre68Z4OD71ohrbBquseGC7KHp8VAqxxzkiUOu4eKOmT0JUsGX7G
	pQgbwVmxy7Orgtf4BxnBxzu/Thp7syTtlNo1OrByvLai9lRQk=
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr10817054eec.4.1795368162901;
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Received: from ?IPV6:2402:a00:163:3509:b842:8324:ef7c:136d? ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm30943866eec.14.2026.11.22.09.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:22:42 -0800 (PST)
Message-ID: <9997e6c6-2e5e-4314-88b2-a8547ab035f2@gmail.com>
Date: Sun, 22 Nov 2026 22:52:36 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add
 ext_mclk1_c
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115174237.48908-1-surajsonawane0215@gmail.com>
 <20261115174237.48908-2-surajsonawane0215@gmail.com>
 <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <20261116-nondescript-buffalo-of-whirlwind-6a5008@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/11/26 18:10, Krzysztof Kozlowski wrote:
> On Sun, Nov 15, 2026 at 11:12:36PM +0530, Suraj Sonawane wrote:
>> LPASS LPI gpio5 can mux EXT_MCLK1_C. The SC7280 driver names that
>> function ext_mclk1_c, matching SC8280XP, but the binding enum does
> 
> I do not see it in the driver, so are you sure you used correct reason
> for the patch? Mentioning driver means you document existing ABI being
> used.
You are correct, thank you. In mainline, gpio5 in
drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c is currently:

   LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),

so ext_mclk1_c is not implemented for SC7280 yet. I described it
wrongly as existing ABI.

 >> not allow it.
 >
 > Entire sentence is clear here - there is ABI and binding does not allow
 > it. Please point me to that implementation.

There is no such implementation in SC7280. The same mux position is
exposed as ext_mclk1_c on SC8280XP, in
drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c:

   LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),

On Vicharak's Axon Mini SBC (QCS6490, sc7280-compatible LPI) we need 
LPASS gpio5 as
EXT_MCLK1_C for the audio codec MCLK. Patch 2/2 adds ext_mclk1_c to the
SC7280 LPI pinctrl driver, and patch 1/2 updates the binding so
function = "ext_mclk1_c" is valid.

I will send a v3 with a corrected commit message that says we are adding
the missing function and binding, not documenting pre-existing ABI.
Thanks,
Suraj
