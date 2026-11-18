Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995662;
	b=z4Fc/uzB+HmGz+thdE2w+XIImq6G9EiFkrUh38mr+XEgKQ3Di6D086Rn0O4XOzneN6/5
	 qBmFy+SUXvmgkTJlPALa4gBBSRCpLA9eggzZxw5u5thrtqxkmJXo+KjKgTiPpqMEAZVwW
	 BS6ZqOIBooNPD7Xg3JkXhxObMSqmB5F++v0s4/A+l78PbyNJjUW+3EOj9yeOQBEJrlqSu
	 BI6UR0UQ/fa3NiHf3GPEv1F3swLXRZeESSu/D5XiU3aw8gK3eWRnQdr1FYL8nRc5UwhPm
	 en2upNjaSRKwOvBPJutHXSGEF78bvp5VIbiD4hrGq5RIwsP9eRpgUM82z1ZLDMZVclA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
	b=eLPmTsWxh2P2b5Z75HyWzJDSOlF9AYaXzXViQZT1qfBiD3YYB1VUuve2FV4N/2Ks5Jfx
	 EtLpcSb5sSNZ3/kFJhJCCkJRfx3o4TggoPEGIqZ1GPODLQjwpRHCTUlmPO/oOc0Fnedvr
	 TsZjQkiZTPEjYZN9BidG7sgRBO0PA6ttWBeUlUGw6Hl9/+LnZPBx/5dbD9OK4YO2LH3sy
	 xqIePzFwBjUtXBIKPeFyUsrt85DgA1jlWnc+C9xhnnimlpO7E1aKXwh9iUEi5SxMpoQ2e
	 AWUxfR80k0gBLRjIqyKSuxzk6sRxjysmfzA1hJX1HGtuSHgN5Nm2miTjLFbHFKfI4ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5eaYciq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D4606A32F
	for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 09:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2D4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5eaYciq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7380835e9.3
        for <Devicetree@vger.kernel.org>; Wed, 18 Nov 2026 01:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995660; x=1795600460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
        b=Z5eaYciqucY9tPvMWgtwpa6lHfPYOF2Xzo8ZpymIHEeYaM7ceXUy4cwkRDQH1/WaFo
         fKdLexn2Uo3Dq4t5efXPTUnGy/bRRy2QwmHyxG5iH/vKXImjNoqooAjOOPP7L34/nZqJ
         0SlDYecanghmzXaqkIKNSHvk9bG+A96Cqr9B5DJQ5NeHjJ3ehlKt5v7IIqVtl1Hy8f7f
         4ey+5qQT4d+CVRauLztzDPPOwNR5Z7d3LU4h2Y73wKsvSkAdYlN6fJA9P6e1XYnq6oQD
         SqeB3QBksir95uLM3TPA0ItzV/6IR/+55FRnZktc3DB/sa/vikwo+v54XfpkHBNUrYry
         KvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995660; x=1795600460;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0FxgduUeYAAYLU+x3UO1uC70A6tSSO4t+ElS8hcreI=;
        b=ZyFig//W63j5ji24iClwk2a11odu4eywfBUfmtfHC/NV9o5rFJZtpg99oBEiT51J12
         acEmBLqK/pJYtQyEvQ+KpAe5DK+ZimHGGeOWfmDVX6QDIzfH/GiXbCxOkJOa8htW71EP
         5E7JUKc2aazAGO6wVXlRWwEqZX4uWzDoAu1J7lIYyh9XiUVRK6jho97rvxFummLBc+uS
         4qZShUP/XZEnM0fZERvm8YlCDfvfbv9155GQybpkdnRSc/j6n2uCyA6AX/o8cppzbcmn
         tLGfQF8PKOXpD+BXYRtUCT6Mj9cgnQc+tAK0XQRDA00HwbjFWMldtV1VfFdd2eHfKRUO
         2PUg==
X-Forwarded-Encrypted: i=1; AL+hErElIS0UDM7JC3xqfObE5jiMIQDM6+ayyA6jBGJbtZAB2ZDIlzODRPFxLjXGs/YQ8rg3UV8VfRGulSiH@vger.kernel.org
X-Gm-Message-State: APuU4Z9xUCIdAAk5EjmHeM/f9hVqD8eK5s653/rV/1ARrd2NlEMQKaOC
	P5gI5jY3GY67l7y2nwMkrfqQCttU7abqV1qmZZ7ABRffvdIpzbUU/d81
X-Gm-Gg: AYBFou1P5mfdc8vw0gIoQj7MyiKdYQMBgZnWLVR/2AwXpcS6H5obN9hhVh75tDwyV4G
	4PNa5Pf/iBsZJcAucZVEH/vmSoDalZoTVkOAnpJsmwAgT5ilf2+suO4+mqPT7m3E+vpDgb+Mkju
	PuvnVp/kKNygqcEiuKXXBueIpIBeXnevQgwXv+mx1SStE5YZEx2FggZYM2vkQkg+/+e7kmmtHX4
	vSwQpbqXdBZtxDGLpG0/Fjx+0nxaH9hy0JJ5teJcE0/q1it/WceAnO3I445V2n0kxkGBEBF1UOr
	/A5R6wKBJp44qPgOXAVPrGMuQyWhqTBU2h1k+eRO1RdzZI0lZLL7TwyR+/4tm1ne7DeB5nbSLat
	uP0CwAYdSonduF+7VAi3tUAhAy1wDsV3udZsyU4l7bkYKVWlpwfQ6k29mgZK2yH/UUyQS1WS21C
	JrIfTpYh4IID9Kq3Wei8rTusF1Ti1CW8t75G7bGLkIll8G6mVCAagf5Y7VUQ/a7WJiKcWtCPcyr
	KX8hgXT8hDixtiR/xpzFXmSr8W/khMgRUA9EcUYpxvPyvrQKCIYd20sYJq0miydISrKmAAT9qG9
	q+A3q1ixq6CEbkJHAsdGm5dKmun9iEipcnKEeMO1iBEA7zWDutnEpUo9RE8N1T+P/g==
X-Received: by 2002:a05:600c:4fc6:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb7da23baemr38830375e9.15.1794995660149;
        Wed, 18 Nov 2026 01:54:20 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e50e992sm24034685e9.0.2026.11.18.01.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:54:19 -0800 (PST)
Date: Wed, 18 Nov 2026 09:54:18 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Saravana Kannan <saravanak@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QW5kcsOp?= Draszik
 <andre.draszik@linaro.org>, Simon Glass <sjg@chromium.org>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Peter Griffin <peter.griffin@linaro.org>, Julius Werner
 <jwerner@chromium.org>
Subject: Re: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with
 memchr()
Message-ID: <20261118095418.51d30ee8@pumpkin>
In-Reply-To: <20261116205320.1621386-9-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
	<20261116205320.1621386-9-dianders@chromium.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 12:53:05 -0800
Douglas Anderson <dianders@chromium.org> wrote:

> `fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
> across the string table (`for (p = strtab; p <= last; p++)`). When
> building or modifying trees with large string tables (such as DTBs and
> overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
> `fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
> byte dominates serialization time.

Are those symbols just in a linear list with embedded '\0' ?
That doesn't scale well at all :-)

> 
> Advance `p` between candidate first-byte matches using `memchr()` (with
> an explicit `slen == 0` check for empty property names and a `tabsize <
> slen + 1` bounds check before computing `last`), preserving identical
> suffix-sharing behavior.

Might it be better to scan for the '\0' that terminated/separates the strings?
Then you do one memcmp() for each string/symbol rather than for each time
the first character appears in any string.

Even with the code below you want to do the !p[slen] check before the memcmp().

David

> 
> On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
> DTBs) this reduced `fdt_property()` time by ~5.6x.
> 
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Found this speedup while benchmarking fdtfactor. It's not critical to
> functionality, but seems like a nice win.
> 
> Changes in v4:
> - New patch speeding up fdt_find_string_len_() with memchr()
> 
>  libfdt/fdt.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/libfdt/fdt.c b/libfdt/fdt.c
> index d9ccb70345d0..c7cedfba7815 100644
> --- a/libfdt/fdt.c
> +++ b/libfdt/fdt.c
> @@ -348,12 +348,20 @@ int fdt_next_subnode(const void *fdt, int offset)
>  const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
>  				 int slen)
>  {
> -	const char *last = strtab + tabsize - (slen + 1);
> -	const char *p;
> +	const char *last;
> +	const char *p = strtab;
>  
> -	for (p = strtab; p <= last; p++)
> +	if (tabsize < slen + 1)
> +		return NULL;
> +	if (slen == 0)
> +		return memchr(strtab, '\0', tabsize);
> +
> +	last = strtab + tabsize - (slen + 1);
> +	while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
>  		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
>  			return p;
> +		p++;
> +	}
>  	return NULL;
>  }
>  

