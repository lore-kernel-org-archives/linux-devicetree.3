Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB9A33F8D9
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178481; cv=none; b=PVjZXDixu0uo0L1muktgKcf+CkvYtFKAbYZf5/rMvR4W095oRtprWn8ilitoyimC/yBKhOUk8YknFX55gNU4jENHRe2CH8PbZ+cmEkNDesic/Ifvm9iWWK/DEeQXhGTfiYOh8v2gOvuMJDOWpV1m9lzHMc7bbz7Y20fuKqbFMYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178481; c=relaxed/simple;
	bh=5NFk1FU3zQgLvOHWY85ctRP96qkII4yfyH1qndHlnw8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=K3XSnyJgNt8N6tl9SCVuOj+uo4HilsIReXvMj/g11UbclrVbhOkV+llmiaD3Ext79JGoXUW4xDjnUT5wZHVEvCqcdKB0rOS6VQtxHjwoelZaGIoaJgL6O7ud5tUJbUmJJOGIYphznVHSr4Nlq9gKXqIvEU9s6ojUwRaKIKoBxhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZL7SlzpL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZL7SlzpL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so70660095e9.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776178479; x=1776783279; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=;
        b=ZL7SlzpL4lw6cNHWWZFtDY82Iw+2NnFy1h1Bsp25pbtWfADIvhOgDpCqms27LudOzh
         +D1ycQIxgsoJ15qcrbXSyhjEEEFUa7vC0wIFRUw62TKgASrzizNOc0cljyMgpsly+EMh
         0IWzC8hJWZGh+Y76WMjGukD/cL6RFRdcPwwQh1/xJMstBxz2yzCh8TbjnEZ3TTuwrl93
         s2bum4hu4eHk6wElPmIjAKNmOGa5DMHKwqumMNV2pZitqcZQkPfxG+XOjMnhUj1fplae
         Tc2vokHwgRLZ01iF2uvXcCxVpin/m8FSVEUKb6M+zsRsUSIbSJFS51GOUl/w8KEhrpkV
         koww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178479; x=1776783279;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PAo7ya1UV+iUteVyqPUr+hg05LINCS2Wr9p6hmA+q2Q=;
        b=JVoiDmBK0RdEnEjEiuAYcYJ7I2bbh0IN+ti3OzOktz3bdoCnVDvNdpIEx206bACDPc
         OaK79CF4i9mXYXJ13rvNGBYEIufYSNhpXobkDigEOGJ+73yHQzn78Jat8N9nA+FyIeYE
         HGmR6uaD0hq+gmgSe95h/1dC/L2yGIFNOGxonZjI4R4gVoS/vc4PsCdyRnllXV3SpD1t
         2HfyXqBy4WzbMMSXYIoIyb6MGzztnsEgH6yai08EpIzpiAiJFhhNCDYC1i87xWBEh+gf
         MrXJvEpOY3s2JA+F8jcAhCeaaQ1Y6O3qRVQKKdbKhzdAmMjxDcEKc+d0odEBd5PjHqxA
         QcCA==
X-Forwarded-Encrypted: i=1; AFNElJ8PWdJHgNOWuYwIQ011dPIq/J7NxSqe6nHT41nSSkL9qTSCWtTKDIPqvQVktV+TyKCiYT0C38QWjZAN@vger.kernel.org
X-Gm-Message-State: AOJu0YwobiUWncY7uMHXGHGC9DnXN8GAEF6Ppq+I6WmKVdsgO6bKF0K0
	0O9wULSP4K9mJMMUJke+m1fZSqNeRbQdGlfOE043PZKv6CYniqqD/D4HTnGN6oTSoPs=
X-Gm-Gg: AeBDievQQGSGkSxXqLBFGbMSMBTYpjegn+buDi8MGD0JaL+GUBXYjIZdkM4nEIiRBH8
	Xge4JQivMyE+fZe69UAzWdfzwmyXBon/1wftRI7pvMmiy6+PZnYpubnX4B/Qv0o8hjmnGU0ao+r
	udeNOaZ8NY/HUJK40Es8AEBzyT0B1AGyiF5yOlBLRpMT9kQZLi/nAw2JoPMQRgLKBaanAFseUv5
	Szcr09JLkhHqWez3owLA5ro2346B+BtLtAEC3ymM6pl8LIJJMi2JzKpXJ4hchb6gveVwxPmYtrB
	HpWBXOQa03w+lBbVvlRNvXy+WW1fsGa8zHmQ/RRVxWN/rEWdzb15NW2IMt1eub1dOpwMU/JDqbi
	NUZphTa9QWnnXKrpLQCQh3WVWYK209QHuNCcm9ooHYsI7Izc6eIRy7941BIGNpV2dnvMPvpaFYW
	pfeRZFeeY2CUkpNW2FIgdYTSmvfeykCrjhM5n6XoS295wx6JKhy22/+o4atR7C0UL11IH+7XRZi
	+ujel1/1LTrVTD5Fg==
X-Received: by 2002:a05:600c:1391:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488d67e6a48mr259531285e9.9.1776178478697;
        Tue, 14 Apr 2026 07:54:38 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73e36e7csm22002840f8f.10.2026.04.14.07.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 15:54:37 +0100
Message-Id: <DHSYQ027GZGC.4I9F6TPPMBI5@linaro.org>
Cc: "Sam Protsenko" <semen.protsenko@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: samsung: exynos-pmu: add
 samsung,pmu-intr-gen phandle
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-2-c5a760a3e259@linaro.org>
 <20260413221638.GA3624532-robh@kernel.org>
In-Reply-To: <20260413221638.GA3624532-robh@kernel.org>

On Mon Apr 13, 2026 at 11:16 PM BST, Rob Herring wrote:
> On Wed, Apr 01, 2026 at 05:51:55AM +0100, Alexey Klimov wrote:
>> Some Exynos-based SoCs, for instance Exynos850, require access
>> to the pmu interrupt generation register region which is exposed
>> as a syscon. Update the exynos-pmu bindings documentation to
>> reflect this.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  .../devicetree/bindings/soc/samsung/exynos-pmu.yaml    | 18 +++++++++++=
+++++++
>>  1 file changed, 18 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.ya=
ml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> index 76ce7e98c10f..92acdfd5d44e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
>> @@ -110,6 +110,11 @@ properties:
>>      description:
>>        Node for reboot method
>> =20
>> +  samsung,pmu-intr-gen-syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to PMU interrupt generation interface.
>> +
>>    google,pmu-intr-gen-syscon:
>
> Does this mean the driver is just going to have to look at both=20
> properties for the same thing? If so, just use the existing property. We=
=20
> don't need 2. Yeah, 'google' in Samsung SoCs is a bit weird, but that's=
=20
> Samsung's fault for not upstreaming support for their h/w first.

First question - yes, look for both properties. Using the existing
property is even better, I don't mind at all. Thanks for pointing that
out.

Initially, I added more generic samsung,... property because I thought
that device tree style prefers <vendor>,<property-name> semantics where
<vendor> is actual (real) HW vendor of corresponding hw block and it
should also refer to the first/earlier hw vendor in terms of the
timeline.

Using google,<..> is simplier and I don't need need commit that
obsoletes that, so I'll rework the series in that way.

BR,
Alexey

