Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DEC34252D
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137009; cv=pass; b=AiGaeg1ANXlAu1wxVVYTX3hmJch1k8WdRpTQPdUY2nTE5vQwqe2Qge6KEEfZXeMrCXdm67nNeI1v5W6/tyLYrladUCjC8d5l4nBCOk57D3M4EcONXGwpe80IgZC2umDWjiiibWtR2ZZiEJnenWQFxkLvoHSLtJK5tkuxyTPnaUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137009; c=relaxed/simple;
	bh=RaPpBgN+D6zuIGLXpWCho2L5MGJqgyWZi2TZOyFTZio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBJTP7KcU+WRPhrXBG6/w51T6jLTYj9MTgOtaNaJpS7JYwaIYdlyyKON0sjaxwkdytq/AeMHsXy4klK4+6JtypP8n5zOg/NqaQgu7jlwhJIYqkGnCrY/A7Z4z8T5B0cTYoWbaGKr6MQb1IOjthzPxg7w+N1LP0x7IHI1YDznsJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ProkW6oK; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ProkW6oK"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6712bea5c91so537864d50.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137007; cv=none;
        d=google.com; s=arc-20260327;
        b=L3PNMiGYeWPUhgqmk5rcZyCmEVXRCs/qh5nTjpl3xehXEUSBllCxxhY0oFWDpZH1F/
         Tfp6hztG1Wtyz/vnZmmLyFvw4wFl7LOg2cuhwf0tWRuucKUbGJLkOFG+aVOWABlpjw1g
         xHJ6Zijb2x0r4gaaAW6hM9GdGXfLmie6Y7XUAhJKDD8r6SvW2Q86h1YyrkQdrBNTA3Ex
         8iODGzzcrkvNpfsc+tEyRbGw1JqtGKb/dWcx2NanGDuu5abXUhMAVZpIu3bQrld2MCrL
         Umqm3sIor8aWPBnaB/Oz+DaJBWVX+zfwCVPfs+96Ceu4zs/ST4Q5WJ2KZUlwE+rAq4xk
         On8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        fh=N9TCa4HQ6cgSUagIufl9Sx5djzWIwi9Cd1OYl0nEnpI=;
        b=A0CQlKlUcE6ZlGySb3Wqzcko8yMUzeoh8MKdKwnXqN+ft7ABPEmUZptc72fzjZHHn9
         ej2BSYVu2XW8yj8caSn2njhksEA2XVT3ybASloGUSzmTrk2rLecCttqUPFQRNbaTGRfC
         DHkkszLv3N5rKfwdsT9sBjLNhnD18U1lnVCE5lIY7c0NacZ3zq7iETWI9SHBYzeyR+Mn
         T6tOVUw0NiNSNF81jkZc5u+2eUfQd0+/KAKM4Mg27qI0btoP2ZzCP2upvPOU0snDZUh6
         zexVdIDmNs0J4GBV/DYjnyfjlqVd6+PbGLpUeNx8A0g3BpVv9nNDspueI8qMtF2S/IVG
         JKrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137007; x=1789741807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        b=ProkW6oKxIK3f1qy3jc+oUQvihwIygrEGPJVbrLD+fCIcjoEM6jKmwyY+2LV0T+62H
         jsnk/OYaC7/NBbooVHEczhMlyLKuL2FhP13OtZSbHYQpusV8U5Vekz/2VzJw/+UHfmlO
         6TiJnDsLXw5HGPi4m+8UyGfdoriAt7szpjjsDfscO5LbfDuGmRI934sLY6ZjgzMByC10
         01rcFOZU5NV3vVfG2sDgjgvKscJMetq8S3LV3N0p56NwmnyjbE/p3xFAXmIS9mE7pKxN
         96P8/dhLmVVVOTkQQxiXCIWXNIsOyDDfPat4Vt+gVJMi4q1RHTYy4XRUXdvVJL8BvV5o
         BZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137007; x=1789741807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYmD2Y5XYVokAHiqQ6vCxMgGy9dgC77N1YnW+uxtC64=;
        b=i46kbAbdCEePtiCMICyWMfoCwNlOqf3AZHkmAfChow6nWYluTWV7morv63q4ICHqO+
         0aNYXQZNQDLNwPFOb9lL6F2DuV7vi2rPIInLHxVtSu7FexL2sLCaI3O2ivwrBwBUq6Gt
         jl0smUqnzlT0/lXaUdSrFXItuv1eqBTplbCqVJM8gC6peM5uKSqDdAsOfbcjBg/bTdib
         ZM32GXXKBxsJ3AQ9KVH081TVME93fHLdWjym1icZf7tr25AyM1Wd0FGuEqnyCYKtcrua
         VkX2beSxM5yArFc/1UhMVa2ncDzYTWdt0BvxeyMrJJwQVrNvp9+JycOJONp83huzi25y
         KghQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT+KP6WdrNSYZVJ3L6PTwWDiVXyYcwYwcGddImkZ+ms7cN8skE8+l/x0N67N9d49YyMXQ+yRuMuIWn@vger.kernel.org
X-Gm-Message-State: AFuF++kkgVHo/3YpPLKzXHXgkI8vILuk+ebVwcXOSHYcFAmrye59Cwb4
	9y9nHB9suBapVDAA9fX/5gvEmR7drdZbMa+KVcz7F0yrkpc0oCAhtJ7hmF92pJnlIBWAWWjrk9h
	RsZ8scvwXPrFH2eH02yaMd/W5HYRbT54=
X-Gm-Gg: AYBFou3QKPSBlDSD+nn69rnIoSP1SKwCXGDyQ+YuHeFfy7uHugtEP4QkGyeZegYd+bB
	UKuekKs5GT37u24NMXenxQ5Nj1qFsxHRtW6AYYOwnDY5cRlFCs8M11zDQ4Fte1OeJB4yslwZKZ9
	KhcyHDN3aQdlPaSrcu1ikQXRT0YUID1d3xgsQ+38Gjvu6Ffz2/kjQjnMLUyvzuB9SIcgRJjQTrB
	6xIARxCvl9K+r6FyXpps6wU/YGgHk3ZWi+fV4+Ece7eZU7TIgfkIb92zk68Kb6R5E/ELmPIIFpm
	I1vFdL6xNWDS1EmMf7onYsnLpOp36qpOAXYk65z4o9+R+je4YTF6gL3vSiJSj30j9F0=
X-Received: by 2002:a05:690e:d48:b0:66e:57d3:766f with SMTP id
 956f58d0204a3-6712457ec2amr1411116d50.5.1789137002131; Fri, 11 Sep 2026
 07:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com> <20260909-arcane-yellow-beluga-5ce6f7@quoll>
In-Reply-To: <20260909-arcane-yellow-beluga-5ce6f7@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Fri, 11 Sep 2026 19:59:49 +0530
X-Gm-Features: AcwNN1XJ7ErReuk8FrPMLVElmntuOvsTP3mJQkZbaLhh_fmWSTDFDh93bPAgHIo
Message-ID: <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +properties:
> > +  compatible:
> > +    const: lacie,netxbig-leds
> > +
> > +  gpio-ext:
> > +    description: Phandle for the gpio-ext bus.
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
> > +  timers:
> > +    description: |
> > +      Timer array. Each timer entry is represented by three integers:
> > +      Mode (gpio-ext bus), delay_on and delay_off.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +patternProperties:
> > +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
>
> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
>
> Actually entire pattern is very odd - it has $ in the middle, but then
> followed with other REQUIRED stuff. I am surprised it works, but
> regardless it is absolutely not readable. Looks like a begative pattern,
> but why would you have negative pattern for known properties?

Thanks for the review Krzysztof.

The negative lookahead was added because patternProperties matches all top-
level property names that fit the pattern, so excluded known top-level
properties like gpio-ext and pinctrl-*;

In patch v1, I've used additionalProperties which removes the regex entirely
and allows arbitrary child-node names. But removed and used patternProperties
as per the review feedback.

Could you please suggest to me which way to proceed? with additionalProperties
or patternProperties

>
>
>
>
> > +    type: object
> > +    $ref: common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      label: true
> > +      linux,default-trigger: true
>
> Drop both, common.yaml provides these.

Taken care in the next revision.

>
> > +
> > +      mode-addr:
> > +        description: Mode register address on gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      mode-val:
> > +        description: |
>
> Do not need '|' unless you need to preserve formatting.

Taken care in the next revision.

>
> > +          Mode to value mapping. Each entry is represented by two integers:
> > +          a mode and the corresponding value on the gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> > +      bright-addr:
> > +        description: Brightness register address on gpio-ext bus.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +      max-brightness:
> > +        description: Maximum brightness value.
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +    required:
> > +      - mode-addr
> > +      - mode-val
> > +      - bright-addr
> > +      - max-brightness
> > +
> > +required:
> > +  - compatible
> > +  - gpio-ext
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/leds-netxbig.h>
> > +
> > +    netxbig-leds {
>
> Just "leds"

Taken care in the next revision.

>
> > +        compatible = "lacie,netxbig-leds";
>

Regards,
Udaya Kiran Challa
