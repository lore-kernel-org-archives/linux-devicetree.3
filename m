Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D6E3B8959
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283613; cv=none; b=AWnUsZhMdR3kB8mto4qEdXBXm80ljxI/R2mv6+CYVxOfXxbWGuZ5tG7PRvNl/3aUVT0X3dH8U7qI5hLWaR4Qp8meCVLhcgKn9QX773Mo72TOb4/r49RKliGsnnjt+U/82zASKhJLqWfoRDCyz72spNqpWbnkOGas5TIx7eP7Yy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283613; c=relaxed/simple;
	bh=mZQYdyuzrERlRzc0a3/bTlADzdtLlwwGfbzAubppi8s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=VeBe6bdkFnWzvxYFRtEGXyq/Aa7SZfUDDr+KqNUU052sgO16t5G1eR60ZkVjM77iRvXuHZI1VrvPHP0ue3NIiLOptRMa6Qj9ovz3Z7DqRFFAcmOpgXOvROgDhxqeQbWZzTkH6B0ZOsr8LWDGJ4KiHNeYxBkb2zmOGjxj6DuUru4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L7wETQRX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7wETQRX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so26353735e9.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774283610; x=1774888410; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=;
        b=L7wETQRX8m/aqZvJLqeSEwp5r1fon+QU8gfuB2fFS9LMT5lZZece3XVQdqFqqozbd1
         zIFR83qVjUCqeKoB1u+qdOcWcnIvl7BiCaUFttEtrFIjNaHemRy36pi3Q9bZOKYcDRKq
         kug6aedW2/A47yS4K40Rnvu/NqlxhtaGldToe6ngYDRwkqERH7IQ0BI112n4LYltq0kB
         4+20q6exX+hTSrcRgz0XZjm5BGNoUMotaZAmRFAa2GxB9BfoVlev950lLJ4G8kGzUr2A
         pHEW5Sg0mSoSczzOnxB5Dx3BkHqDnj33Bv26182eOaYSL2Cf+051CQ5CjjghdKGUTcEq
         heIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283610; x=1774888410;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tw1CKAGR78adc6SIaonWynMm4T02YyIsxi3rErXI5qo=;
        b=X4uQg6ZlUPXkOzTwPPLSad3IqV4IWrlHCZYc6YpXMd+656oGiTKCjeq1lUIdfivN8C
         5GjpQcf5BiOBiXUKVQS+h4Gu/wVvFZCjueWTtzmIMt7i0XcSJE3F2jJh95lQxTHRIaNT
         +iUcdfxb7bwcsTT7aZ/XKjtyz2ilc5jGH9kav99HI2mExqS6FQaMVNs7HgByfntTwaxE
         crSbeGS5eD31uFenVrhwrt7TodVL8sdpdhcK7FGFDnppL0btlMK3PgU+j55uPSH3yxw9
         OSppCPZPOg4YGVEqCncwDlpMYQ8vdctHQyQmsULENanT6MsG2iOYJvPwmiwiNUjN1bj5
         ZGFA==
X-Forwarded-Encrypted: i=1; AJvYcCVYpOgMCLS669wsWj+3i8LJfufQWaWmi7aCLHrHyqPbtOQ/oxc5XWixBuBjbLwGAKPsr1v7TMcttw0G@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9J5leEPqkli+btbc8vgFc3eQtn8/05LO092KIiJVfd/9VdM/
	XbDxa0ObY3iLv3mZEOF2OqMxLxdyOJyHZESRFPAavE+fAsE7wgZoT2SQTNqQ9pxHXCE=
X-Gm-Gg: ATEYQzwx16uWOHctwqzBsJAXBq1/yAc6q6LlB2M6agpIMDX283B6Px0B4f71Mysmn/e
	P1UqqIzUVi/5QYxs1KRUt3c6xcOneoBnty3Vi5DKijkyHgebARyI6ehaurkSP7mgXyYdbjl6tAO
	/VZIU0vRY8F4mamDnXEkdiDFD1MJh0Uf7u1mfidQ6FAlOE29A1UsQ4uMKyfD/0uqwMeDv2d6flm
	jxaXO5sg358EvY/aepU6bZq7T2c5+652uast9QJs71w7Oxykqx6SkhEiT62EgPD5BVB+HA1uvQR
	5i5nd16dM9BtdusvxPBlnamjDgFUDitdwXQXmmU/zDoNxFAGvFwLa/88XELAOm/G7fwgWonqf9P
	FA6ylOvxjK2/rVORS/7nphTGIdE1vxhQHePrH1DfLxtJPbBNoXe2Vj46gNlRBvfrgsV49mrEaAG
	c0qZoaGg7HV961+cmkPLnQ5/GWnPcPju6WYUFfR2P1kIyIbadEm8ZC88EaE7Je8lht9neYdS4yh
	WuZvfeUUPpO
X-Received: by 2002:a05:600c:4714:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-486ff01f1d0mr187337805e9.29.1774283610196;
        Mon, 23 Mar 2026 09:33:30 -0700 (PDT)
Received: from localhost ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm564276095e9.13.2026.03.23.09.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 09:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 16:33:28 +0000
Message-Id: <DHAB1PA67E94.241OXUFJG1GSK@linaro.org>
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org>
 <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
 <b02f06e1-dac7-4521-bf5e-471b5575467d@kernel.org>
 <DHA9YL83GF3E.VOMD4KV10NLW@linaro.org>
 <7831dd9f-3e7c-4016-8d84-fe1fa82bdf9d@kernel.org>
In-Reply-To: <7831dd9f-3e7c-4016-8d84-fe1fa82bdf9d@kernel.org>

On Mon Mar 23, 2026 at 4:03 PM GMT, Krzysztof Kozlowski wrote:
> On 23/03/2026 16:42, Alexey Klimov wrote:
>> On Sat Mar 7, 2026 at 5:03 PM GMT, Krzysztof Kozlowski wrote:
>>> On 26/02/2026 16:47, Alexey Klimov wrote:
>>>> The GS101 PMU interrupts generation block is actually a standard Samsu=
ng
>>>> Exynos IP block found in older SoCs like the Exynos 850 and others and
>>>> not exclusive to Google SoCs. Thus, renaming to
>>>> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
>>>> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
>>>> and preparing for adding Exynos850 description.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  .../samsung,exynos850-pmu-intr-gen.yaml}                             =
 | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101=
-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,=
exynos850-pmu-intr-gen.yaml
>>>> similarity index 80%
>>>> rename from Documentation/devicetree/bindings/soc/google/google,gs101-=
pmu-intr-gen.yaml
>>>> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos=
850-pmu-intr-gen.yaml
>>>> index 2be022ca6a7d..f9b40f3fd165 100644
>>>> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-in=
tr-gen.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-=
pmu-intr-gen.yaml
>>>> @@ -1,10 +1,10 @@
>>>>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>  %YAML 1.2
>>>>  ---
>>>> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-g=
en.yaml#
>>>> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-=
intr-gen.yaml#
>>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> =20
>>>> -title: Google Power Management Unit (PMU) Interrupt Generation
>>>> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>>>
>>> Rename is fine if you add here compatible, otherwise the name does not
>>> match the compatible.
>>=20
>> Thanks, I'll rearrange commits then to make it sane in the next submissi=
on.
>
> If you re-order then the case will be the same. Filename will not match
> compatible. IOW, rename is not a logical change on its own.

I probably should have used another word for this.
I am not going to *just* re-order.

Thanks,
Alexey
