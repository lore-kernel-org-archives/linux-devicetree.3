Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3674B44CA
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791824499; cv=none; b=l2fUxxVqaD5bu3UhMPNGXGK1Vz2KUNpvnE0JOdPGcHGducMYWez5OSPhdERs+rucAikxnRsfhxFKhBmI5BlO6BOWnDHrUF18q+DnB7Xqb8c8rTwXnCWsMG/KovHA9uPVzi2MjY5KHrjygbKY970nMqc++coHkmucut8UauWW8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791824499; c=relaxed/simple;
	bh=rZNYSXMqrn0GxiCZb4XSIaPOfilJGvalM6+xmVDt7+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=La9Aj3WOS9BCnPHUhNbFmGck7sO5HCr2yOMyYo/Z954s0N51EgouW72TTzNFbKwOyoTSAqleJoYqFmcr5oBAP8kUNxjxtfxjxZV5brfxsKHzyTENjZATW+1+d9VCQq3LR8UhdsKs0p95RfhIZxQw5CMmYMLA9cXm0gs2ygtM7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=dM4HCgv5; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="dM4HCgv5"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917c04630c2so28636826d6.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791824493; x=1792429293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IBoroqX0yymjVNw3YzKwxIQ75HHooWwrz0PZ7J/ZT8=;
        b=dM4HCgv5S+EvP6VA9jx1h4fyC4OszrV/y0syDAVPyB9EREgqSLg3jay4/0m8vrmiW9
         uVnn/u2mjJuFneDKnMKAu1SuzuiGV6dz8etqNhALWD2h3M3alu8J/SbNe0HqHbSkumZC
         I7jyeymRXsKHY8UiUFn1pyZjcMYBzTRQe8PAbAGUdjRMscYDgOdRlRTok65jkHzYkxgz
         7ZNDdJ6SodOd3J6QsgxZHtTuJcQ73UqXwRkoQkbAIM425JKlc0/do88hUicWE5r5+OqI
         CqSv2ApMTa/OZuoTE/JJ/xFmSfPbBVqceUF3u0M3DsVxH/zjfm0UzqzH5uBhalReoR6j
         tp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824493; x=1792429293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+IBoroqX0yymjVNw3YzKwxIQ75HHooWwrz0PZ7J/ZT8=;
        b=zIE7GaiQKLY7RvPx9AnrK5WIfnX8AsG1CVg6minPWM+lj88aF4W98XPHt12gmrM0ao
         lRxrMTw7fG43nUQracqLRkdH68p7ryVJTv9ZqjvEV9/Hm8t6f041fevfMp2ioeiZc9VO
         4zFCcTdBGSjDB7D0FngtYxBBNXP7rki3tDv0yrXMk766tCo29fAoDFkt4OLFemNYaI16
         1byPgtrsRZqL88d1j57hEElcEgW6NfUCrVlII8e0Nkd6+mqfVpM9r22BDNd2XUolw4tO
         +duQijKRovrBVfMbWGiGFxuPtzyhl2eQTGvWVD40+mPP5TIVIDbVf0UP8TfoYrH99BNb
         rG3w==
X-Forwarded-Encrypted: i=1; AKwUvByrfBRSvwrnmvBi3E4LCi23BV21rm3NoeylqPsHJoxlMQaN4V+Yy6RGPfu9fN1hi35w2AqLsq414muW@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4LpTE+LIXGbXnyKHBak2lPk9fNBw2AVUkoyTSi3n0AEeUelYy
	rPKSI8eIOeCwqVL5JXXHKYuP01eqDiz69hwOB6XdxsINoZrD+2rvLwCOSWcDWvzrqvs=
X-Gm-Gg: AYBFou2aXDhE0vEk40fRhb3x1wx7rR8AoF9tsg8/otEhJ0E0GuJ49cOibkRSDTdfA5B
	o8sl+hTPApA2HnE9p/avR5XLem4JTiQryfP3phtHoc5PzsBvTteDjGbj+H1Py5q0oM4xb/+kZIH
	IJEJyJxTOWw6nXidfcxNrID6nyGkTiNiLWQ88X4ZkfCnva3qwZZRsHDhrEHgZNttKrAG0PvX5Y+
	C9kdXI7PLlsNIkMCelSh1r2cGF5dv9JVn0oegAwkScF1/Y7d6x+E2j5enhE7B/Igb8kHn+/EQC7
	5w/kCtTfbYXbPWD0KTHpg1iGsRxgicePvIpG+ZzANe4oxg/4Kodelml6xdThkWMc5D8mO4d5IvW
	LLYnhUxYiG96fIaesjBzixHIwUqJyuN7/C26SOdUmW9tccj+EWTQLDD22egFjWzzcz5G9UXMlQh
	uEHcI4eyQfUt1F8EvtcU7q3yCMWr4X4dY9xrbqg3tZ6Zpzw9iQKOigRuVUjE71ektvTWY/D8A=
X-Received: by 2002:a05:6214:ca4:b0:91b:5d3b:4abf with SMTP id 6a1803df08f44-91b5d3b4de1mr165556636d6.52.1791824493549;
        Mon, 12 Oct 2026 10:01:33 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7cesm2108436d6.48.2026.10.12.10.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:01:33 -0700 (PDT)
Message-ID: <da75c8e4-cf45-49c5-86c6-4fd8151683e2@riscstar.com>
Date: Mon, 12 Oct 2026 12:01:32 -0500
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: reset: introduce
 toshiba,tc9564-reset.yaml
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20261012164354.3872326-1-elder@riscstar.com>
 <20261012164354.3872326-2-elder@riscstar.com>
 <sashiko-outbox-168431@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-168431@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/26 11:48 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] dt-bindings: syscon missing hardware-specific compatible in example
> - [Low] dt-bindings: incorrect node name 'reset' instead of 'reset-controller'
> --
> 
> commit 86eb967be387fadac7b22aba279d8ed01983af26
> Author: Alex Elder <elder@riscstar.com>
> 
> dt-bindings: reset: introduce toshiba,tc9564-reset.yaml
> 
> This commit defines the binding for the reset controller functionality present
> in the Toshiba TC9564 SoC. It includes a new YAML schema, a header file for
> the reset IDs, and updates the MAINTAINERS file.
> 
>> diff --git a/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> 
> [ ... ]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/reset/toshiba,tc9564.h>


Unfortunately I hadn't noticed this before I sent it.
Krzysztof pointed out in the clock series, including this
here is unnecessary, because its contents are not actually
used in the example.  I will remove this for version 2.

>> +
>> +    syscon@0 {
>> +        compatible = "syscon", "simple-mfd";
> 
> [Severity: Low]
> Does this example fail dt_binding_check validation? The core syscon.yaml
> schema typically requires a hardware-specific compatible string to precede
> generic fallbacks like "syscon" and "simple-mfd".

It did not fail dt_binding_check validation for me, however I
am rarely surprised to discover there are errors in my bindings...

>> +        reg = <0x0 0x2000>;
>> +
>> +        reset {
> 
> [Severity: Low]
> Should this node be named "reset-controller" instead of "reset"? The core
> reset.yaml schema enforces the ^reset-controller(@.*)?$ naming convention
> for nodes providing resets (identified by the #reset-cells property).

Yes it should.  I corrected this in my private DTS file but
neglected to correct it in the binding example.  I will fix
this when I send version 2.

					-Alex

>> +            compatible = "toshiba,tc9564-reset";
>> +            #reset-cells = <1>;
>> +        };
>> +    };
> 

