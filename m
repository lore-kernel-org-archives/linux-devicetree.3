Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794698049;
	b=ed+YRY8y9XcQj0mA7D6KCPW7aeVqqFR3rNuacmcI5XheXd54MuUpI6GUIz+cOABlsdad
	 a6pN+z5Y71X/k1/q25tImxBQpb1r8YeSqVEt10kZ/IUBShnnBk2DvipDG3vMGuzC6Fj75
	 3n4klIRr4RJGBj0qJKTfBMiunNvzvB1+qQOyDtshF9NUc/uw2MEJgPc/XNnIeZSOWpB+W
	 E0P6hxBLrP4Aam6/YCblcdJs/tDMsqoYKxYrE8YS5AK3Ynq3Vy1xQ5Qnr17JIZpJzNJlu
	 afe6GE/Kj4bBVTJ7okZBYgnq+rY3gReN/TVQce7kqdLGcmT3i1aDDp9SpxiraHNDLGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698049;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=MF8lUYm3b4Q7LDh+eTQABq+39MWDYCMYzIn/uwCA2lc=;
	b=LPpLjBZpFMYnsrTr+ahoQvqANVbd9DwxgZAiE0wPKvHF/XisHGWxojScM75KrzY8XDj/
	 iSV3ZZEGPoCfmxniuaNqHpLN3cToUELEo/AeaavsqSjP9s3jFvPKKRSKOKpZS/a96v3u9
	 XHyKffRusEvoITXfOlf6nl7vVOJPhBC2qdqPcpolOMhBI59EFMNmOijGFD+w8ROZZhHJl
	 dBGRyT7Rv75D3XpV29J3gBvINpSytzmGmHTR3Zl4nIyXXmI+QhEqnJP29qNmE6A9fAzMj
	 J/Zkjskc4QEJifRTEyugKrtoyA+PWa1qg7nWAkfijbw+ni97Oy6O54xif8gBxxI8CWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=CbHDKu1L;
	arc=none smtp.remote-ip=95.215.58.38
Received: from mta1.migadu.com (out-38.mta1.migadu.com [95.215.58.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B9606A329
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2B9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=CbHDKu1L
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=A05dQw/tOo/0VMOJJqmL5AQ8CgUPaaQgI50m9o9OW7E=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794698045; v=1; x=1795302845;
 b=CbHDKu1L/KW3VroY3wveFLiEjAAbYKLRcc9bxUaSUmYOAV9/s7F9PEy0Qf0HME4gwZjyeLUp
 6ZUlz6HQI/3g7iqTmw+OqDGVYHO5oIdPNhdIXhtynauMg6N8N11fanEx96YZv7gm4i9mWlPSaMl
 yICjm3hVwrIhGi9QKCe/ObFZ9pmoQkZrFOvlvEiKQQFkl5mmHS63hnka3RBJU9gzK24nFyIjHSd
 q5rltCpseDAzCo/O+gXjSbDMcHEsgZ1UsSV2OPdxnYHjY7boR7XoVPgHem5s5Lq0qyY8FccKWiB
 ARbMhAspQ8uIXJFcITgkKSfyQ+jWz0QrwJaX9S9CBqZXA==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f9d31ba648e08677;
	Sat, 14 Nov 2026 23:14:05 +0000
X-Mizu-Trace-ID: f9d31ba648e08677
X-Migadu-Flow: FLOW_OUT
Message-ID: <2943a816-cc56-417c-b7fd-b45d0dd11ddf@postmarketos.org>
Date: Sat, 14 Nov 2026 16:13:58 -0700
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
Subject: Re: [PATCH v7 3/4] drivers: leds: aw2013: Leverage C99 for-loops
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-3-ea5a3113a479@postmarketos.org>
 <sashiko-outbox-215079@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <sashiko-outbox-215079@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-14 4:00 p.m., sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] leds: aw2013: commit subject uses drivers: leds: prefix instead
>    of leds:
> --
> 
> commit dd420770c3e97b4e4988e32c3e735789959ed94e
> Author: Paul Sajna <sajattack@postmarketos.org>
> 
> drivers: leds: aw2013: Leverage C99 for-loops
> 
> This commit moves loop counter declarations into the for-loop headers in
> aw2013_chip_init() and aw2013_chip_in_use().
> 
>> drivers: leds: aw2013: Leverage C99 for-loops
> 
> [Severity: Low]
> This isn't a bug, but LED subsystem commit subjects use the "leds:
> <driver>: <Capitalized description>" format, so this should use the
> "leds: aw2013:" prefix instead of "drivers: leds: aw2013:".
> 

Acknowledged, must've wrote this commit msg on autopilot. I'll fix in v8 
but wait and see if there are any more pressing concerns before re-send.

---
Hal: They're going for the kernel!
Margo: Colonel Who?
