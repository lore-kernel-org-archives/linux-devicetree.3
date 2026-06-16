Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF1309EE7
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618587; cv=none; b=uwlIW18ZUjls4ieqEx8pC9ZxHJhXIvvWmXmN/jaRvSVX3L1ahdRbzItmoHbxFEG8Z6pdeJqTr6Lz4MefONxEJqyK5Aa05zq0sRXx7Lcm7oD/thrw3SgITig7Pda0Wgz74GrkX6jwfmzC10WldAICYnwrHWzRdsv6EOJzTc40+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618587; c=relaxed/simple;
	bh=XrhQt+Bea6fNaADCqzPU6iWXdPxv5Zbxr/AGVhFL7r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndJFZ4euXPUn+vTFWtygdjl0oL56rB8LT+4oL26wEdqg7MxOAUl/KNgmnVPeVvntw47eUF6nRGtZBBCfNTjoK9noikacWxAIVw9die1aLtfcN2VsBAXu7ewYhSnSRggoGDUIlpN7XHgN+Jhy3PP7XqAuqMoOGs9K68qQPO90t+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6wZelgk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6wZelgk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so46249425e9.1
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781618584; x=1782223384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vzRGthAkkmRjSu9zQ5XOd2TW7ygg5YjF7D/zPA17Lys=;
        b=F6wZelgk3vwga1GEbYGH5BVnstH+/xHIxcNb/nECx3+TuOA/rAHDl44kZFmtFLnMqQ
         XnB6/0y2Qs1hPSL/OjBH/RtvPqhrEGNCvwaITWvZ4W3eQmTHjLMd1RyfQ1F7CuBzv79d
         Y1dFO/bmdwbRcSvmXCmMPD+4NP6TRvvr28exD2URAmw3xNT2yaDQa0jsXMlL6FKUtFEU
         deNQcidcrSHIYD2SRpawAkkANHsslVEPUK9NKrebG6E16GB0fb14Fxt8jvSTszjFNDoW
         LBCDf/8YXQpUb5G2avBj+2fatldIlqV9tKzP0luRQ2HfcMnecNFJa+h/990nCVtFMm+h
         RMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618584; x=1782223384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzRGthAkkmRjSu9zQ5XOd2TW7ygg5YjF7D/zPA17Lys=;
        b=fczstiWwEGKhxdUV9f0Cdj95zCpdt2rRwzyoWqL860e+RoIxH9l1cKLgLRe/XejT3a
         Lmh9C4E7IpKWo9sF0t6OAQyN0U+/gAo0yfYq9lEy2HCmEB1G7f2CxmmiiCEtAA9rQqu6
         kxWeMFvvgcQXoKJpOTDtHUgs7mM+PRsddbKA0b5U1O7CJ6m37ZuBdievm4p9pbCc652K
         TnFMklTn5HDZTTUKks6ES8AoOt/SWzsKgs9BbJgmzoQlVjf79ptELXtSnnVC9M/JmfkA
         GSo2wEQ/HHXWjP9lpkiDiruy7HfMv8TH7wJ6N1f6hobKiRTBtYOcI/BsVfk7xpSjh62l
         bkVQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yGmW3ETH5AR/w69lNqocEnRHFgW+3bk9n0WockehN9Ztyk22Tx/I/mPnz3jltQnSFCNguf81jPAyo@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWQC+Pvozp/4rgrRtn6TSzcTrFnM64wgFmp6ciskmBbOnNXXH
	XImJGc6F5YfGdw/oTLIsbIgnbnOPFntA0UWPaO4UCHY8VQBNY3u6UDbB
X-Gm-Gg: Acq92OHyHiFKsZquPEIjoDjGbC3qzUHETOpDKhIQ7xmxf0vcqPAt3JoU4kYopBIr7/u
	0v2SeqbsJfpe/LVWN2Lp3XUgfGvioLs1eWQ/HXMvrFbo6c9x51y58JmM8E3jBl/3i4tGhEBJKFE
	0ywEnXsjLhBbVdwu2xOKkXtlZ8dFgCrxpjSy6uYrmriI4WK4xTSr9qOZAwhrf57wtpV38xTrz3+
	L+1NGZ9cSqaUVtxTRxKa5Qo6pdZkxGNP48WtNa/RVJspM3IEpMVNfEepZ1Sb1PO+xuZ7ooHkxUQ
	nf5+i+JWwdc02dgqQFIbbNsXBw+1qN2lr9DYKMEph/WyBGGTNZ8qG4jBs9iYK2PGNVRF8J7DvG9
	jy39W7rw6p+DU9QL2o+zBDlKqtkiBIFjg8vNRT8VP/OtbHLLUs4kxAuWkGDFbD7H8IGkFsCIIuo
	100BDMyL9xHgKowZAUR2GPOdqqVdVC2GF2IAABxcKt
X-Received: by 2002:a05:600c:6289:b0:492:30f2:963a with SMTP id 5b1f17b1804b1-49230f29756mr41273285e9.0.1781618581575;
        Tue, 16 Jun 2026 07:03:01 -0700 (PDT)
Received: from [10.43.74.250] ([185.94.190.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm243152425e9.2.2026.06.16.07.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:03:00 -0700 (PDT)
Message-ID: <a19f981a-01ea-4477-b443-2fee69f226df@gmail.com>
Date: Tue, 16 Jun 2026 16:02:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: Add GPIO-locked fixed clock
To: Brian Masney <bmasney@redhat.com>, V.Yurkov.EXT@bruker.com
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
 <20260603-feature-clock-guard-v3-1-01cca0aa04a5@bruker.com>
 <ajB2PhmxvdtsXNnm@redhat.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <ajB2PhmxvdtsXNnm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brian

On 16.06.2026 00:01, Brian Masney wrote:
> Hi Vyacheslav,
> 
> On Wed, Jun 03, 2026 at 11:16:42AM +0000, Vyacheslav Yurkov via B4 Relay wrote:
>> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>>
>> Some hardware designs provide fixed-frequency clocks generated outside
>> software control, such as by FPGA-resident PLLs. While the clock rate is
>> fixed, a separate GPIO signal indicates whether the clock source is
>> locked and producing a valid output.
>>
>> Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
>> clock whose availability depends on one or more GPIO lock-status
>> signals.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>> ---
>>   .../bindings/clock/gpio-locked-fixed-clock.yaml    | 70 ++++++++++++++++++++++
>>   1 file changed, 70 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
>> new file mode 100644
>> index 000000000000..9106b800b673
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GPIO Locked Fixed Clock
>> +
>> +maintainers:
>> +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>> +
>> +description: |
>> +  Provides a clock output whose availability depends on a set of
>> +  prerequisite conditions. These conditions include the presence of
>> +  one or more parent clocks and the asserted state of one or more
>> +  GPIO lock indicators. An example of such clocks is FPGA clock that
>> +  are outside CPU control, with the lock status exposed through GPIO
>> +  signal.
>> +
>> +  The output clock is considered available only when all configured
>> +  prerequisites are satisfied.
> 
> I'm stepping outside my usual review of just the clk drivers. Krzysztof
> in v1 and v2 asked for more detailed hardware explanation. This feels to
> me like this is a policy that says to not use these clocks until the
> GPIO says they are ready. My gut feeling is that details like this
> should live in a clk driver instead of a dt-binding.
> 
> Alternatively, if this is generic enough, then could
> Documentation/devicetree/bindings/clock/gated-fixed-clock.yaml be
> extended?
> 
> Brian
Does it mean I should drop driver description from the DT schema?

So you are implying that gated-fixed-clock.yaml can be extended with 
another compatibility string? When another compatibility string is used, 
then some other bindings are expected by the driver, not what is used by 
gated-fixed-clock driver. Is that a common pattern among dt-bindings to 
share the bindings between different compatibility strings?

Slava
