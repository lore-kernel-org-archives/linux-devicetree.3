Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70D23EAB3
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408700; cv=pass; b=E0RtY8MioT/LYVlTeTBPfI9HnkV7ky6YnzxABrEUN+PEkCKvEvCkCkim5bm+cuWiMfw2n4HFUu12HiJaIPTphpw+kcyQ/fIR+V6O1M8YUYjKM+MIca9F6o80eLsAOAwcdaPpdqrTs1jFrB4IdcaXZKPSt551/6aJQqdzoFtThSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408700; c=relaxed/simple;
	bh=MC6tVURhAg6t9rRXYll8+R5TEvwcrPn5tWtq6NstdZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kce7Pie0Qg/frNglNDFw79pcyfcJG5qy+GhpIHUuWTqRqaTnkh8aQrA7aRS+NVVYp0D/Zu3N9QEiM0I4VhcGYbmuOn+JXFBnbHgo31P06FHzIbzbHVnAEc1LlqfJ83mrOeVWvGlXobiMJgJVNztGPtMamY+ZtkLbIJ6T/sX9YOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBDIXb2C; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBDIXb2C"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-836c4474028so31007097b3.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789408697; cv=none;
        d=google.com; s=arc-20260327;
        b=qVPT7OjZnbEYIRAtbTr6O2nScHbJkOUF8D59b51ScsIcKoBuiUDrwu2qvtuARTryYy
         3PjTGhavF/5+fUQozPHTyWlIP62JrZzhp81kLBd6Lo54qc5yBzN1LeqGqw0AztybE0B5
         aCi+SROxv/3N3noyvI/tDLDubPDVSl14bbAr7LAehdqzf9ojx6r1aD+cI3+h1AT8G+Gd
         fZmupGgtSruBppt4nzgy8m9VTYMsdZc/nJroaji65v3Vbz1L02+OavbCmOWCkboiD1gl
         qYBKnbYDww+RoayO1fuUyuzz4eShnzQuweSC4aUh7Uze1e4mtLzjsnCCJQgEyCXxCeZc
         562w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        fh=tyOf9o83LRL0/STtIeP4Qh4TpAG/lwsorGPQu2lw84M=;
        b=SOkI6B7aaERexlMpKuSZwhcXwsJERCKuMJ1JtsoHFc/DQoy32nM0lY2AkKP7fNL2sy
         nLTBu/yG0Wyh6q+W916Sr5qjoIsQMxEdrSjBWw+vlKsrZHZsqEU0BwUu4yL7BpZQdpzn
         /41YA8at56H0M6IDpBlb4Njxu0QJPNBsIuG09Nb903mPwCKYWxpKsNAwb7IjhTy1w7hD
         4HTv/yVQSLygVwnkqhmmJRZ5MCPBNRdTxz9QDIKd6BotgaOQfeiAow6pLW5GgnKWPVmT
         jmigWNay0SmBGvriADBOyRmfmQ8uQMPkMP9jgjLHqjsRYvkN+5KizPAuc9X9WZrYAzIF
         N7DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789408697; x=1790013497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        b=WBDIXb2CzThvh/ReckI1zVvavMA1he7nL3wkYVtzY/weJ3J3T6cN+23Ixhe8GT93uJ
         qCAPeFHKzDaIt0efqo5g5vn/ek4/0ijzh5GlcPBmT8psoaTG6hlCcWZD30YOAZ+iGxpr
         NWOg63QOOI9c81vRrMLGBapGWMw+/i3RBFOgm+LWckTohVrRkrm+N+DMMrHHId8PbdjW
         iRo7tftaq2kh5GFEt3btorciKnWpVlCJS9nwnLhUbutXxWP4IEgrFkBjVE61EIxu4jCs
         4m840sYq/6TdnmvXOaTKbeFUa1DF3v85Pjwo/VQdnzaaAMKZVfPBamMVYrOAqc/HkzUI
         9Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408697; x=1790013497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        b=pH+8kLgE4NuV6UPWioeD2iWbXsTH1LD8EvUpp1wdI2YOB0CMIesQjAAOkszl4BC/5B
         /tpDuSaCok61opeeYaBR/FZyyp7JTKgk87V3+jjrVzuSnGpbnokOnEzmcJrFyjol9rsu
         4hugO/Ib8qaLfNMT8hz80gv7LY2N270+Xw9w+fzKKPKFEMbzkWy1SV8bNW5+peAo+nDm
         HN8vvYvAaKJdirGjHqJrIIiwS6ogmVRzDF/xFkMgbXkN82y3oDNy3e/HyCfULMHM0oBp
         aVqWHNf3wrToljkqKotZhXV1/1MRCjsJ10NxjUkq/tQ1rstUzCJYMuDBu9DYyIk1HweP
         +Tgg==
X-Forwarded-Encrypted: i=1; AKwUvByIyO8AvXO88EsSLA+J+KHck+ETa86iDw6mIFb3538KoT9DJCdaYoyJAudW3LYTw9vqLjC6Hoddpc9A@vger.kernel.org
X-Gm-Message-State: AFuF++mUAN5MJlPVBA+hVpxjxgthvfcfJ3irzsHxLeJVNVXVzCci2r2N
	9NXHSKKXmMpf1A30l8duqMcYjsesu9YmzoeTsr9aFY7TJ8wRUDqv8QKPhe4ptcCgxW9KDWTpiDB
	sztmowL8njxMPePrGxfQHKJclRwDUcb8=
X-Gm-Gg: AYBFou1SnuU59LSMPAwsBQwKBngFouxa/4xMzLLyHpKQy/K0JzDrwSVxrWEQ8KIqao/
	H2KzQK9V2MSiO/pSSZA6TdHLdZJWA5/lLDFEkZwSW8LCKdI2wXWeCmVKqiezDbr4mHx4pPcmvi8
	YNFeMtaeA7zf7ecnCnHp2zgQVg1vmio4kR0CcN4NgwyUe932ZiCEhgnykHSboW0A6uwBMl9PP4A
	Ym/Iywy54sGfaYxkOyVWW6SgDUp58KmsadCnF7DCxTs2aotGBjbLWzgiGEv+kMfhQD7X5XwOhHV
	HSmcjRKo8ok+pUIZ5BRh+je0Rs9lVEEg4pRhhBblHO++emdA08QA2qi+Ufwv1gdhjz914dCre8S
	8jzcGZEpzZpv5YQtuWyCOSr2Z
X-Received: by 2002:a05:690c:dd4:b0:873:5bb2:6c04 with SMTP id
 00721157ae682-88d22120688mr11381817b3.46.1789408697551; Mon, 14 Sep 2026
 10:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll> <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
In-Reply-To: <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Mon, 14 Sep 2026 23:28:06 +0530
X-Gm-Features: AcwNN1XmAr2U4Y7hTnsIi3akRJyGBw_2Sdlm7tt1jAvzlcyQNUU17kLda5H3aR4
Message-ID: <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2026 16:29, Uday Kiran wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    const: lacie,netxbig-leds
> >>> +
> >>> +  gpio-ext:
> >>> +    description: Phandle for the gpio-ext bus.
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +
> >>> +  timers:
> >>> +    description: |
> >>> +      Timer array. Each timer entry is represented by three integers=
:
> >>> +      Mode (gpio-ext bus), delay_on and delay_off.
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +
> >>> +patternProperties:
> >>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
> >>
> >> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
> >>
> >> Actually entire pattern is very odd - it has $ in the middle, but then
> >> followed with other REQUIRED stuff. I am surprised it works, but
> >> regardless it is absolutely not readable. Looks like a begative patter=
n,
> >> but why would you have negative pattern for known properties?
> >
> > Thanks for the review Krzysztof.
> >
> > The negative lookahead was added because patternProperties matches all =
top-
> > level property names that fit the pattern, so excluded known top-level
> > properties like gpio-ext and pinctrl-*;
> >
> > In patch v1, I've used additionalProperties which removes the regex ent=
irely
> > and allows arbitrary child-node names. But removed and used patternProp=
erties
> > as per the review feedback.
> >
> > Could you please suggest to me which way to proceed? with additionalPro=
perties
> > or patternProperties
>
>
> The children are leds, so they should use generic node name pattern like
> "^led-[a-z0-9]+$"

Yes, Krzysztof but the original binding uses blue-power, red-power,
blue-sata0, etc.
as LED child node names. Would you like me to rename these nodes to
led-blue-power, led-red-power, etc. to use the suggested
^led-[a-z0-9]+$ pattern,
or should I retain the existing node names and use a more specific
pattern for them
like "^(blue|red)-(power|sata[0-9]+)$"

Regards,
Udaya Kiran Challa
