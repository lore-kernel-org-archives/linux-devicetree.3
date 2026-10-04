Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC993440644
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122673; cv=pass; b=rO+hHcywTyxXpZCwrfKvUP6lnUJiSdzhUqOMn7O0PSgkzo2fKpJ+V9x88ouUKDqAf2PEKvMhibH2x9z8w08ZtLNfe0DRTuYtl3wjwPxUs25DVv7zFPIELGBAvcQ4K6Eqg5pVKjFYsvsW9x4NdgryHIlBXQDCT00lIALlAHbCgys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122673; c=relaxed/simple;
	bh=zQvitaeXvIXPsBzLHJD4W7X6qye0XVH/jk4cnitg1Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT5s66Dzk5J8ig0WBvEjO4obtm46++O2JoyAuL5czcR70dPKbKkGHWvHUFzGgfU4s0LJQTxq1uln+V1bhm+K23ozRC+PVMG7iLkpGHM35lZp0cKrH84LFeFzWalkcvt1NTbUyPugVD3h2c530NLrj+gBY1T3Fg81Q8ds5T9DVBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ftQUyQkG; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ftQUyQkG"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac8d1eso5246567b3.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 07:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791122671; cv=none;
        d=google.com; s=arc-20260327;
        b=d0c3vz6rSVA1PXJ61qai7rYqm7PwA0k121C+BMKy6JM3ZRYbG3JimKTRWxK5NyDeNN
         vmXMN9C5uGBaGkZowVetBfXPyzVsoLFuUtRw+pMmKci8MqrYxT+FoXoFqvBAvJHzbz+L
         bLjJavp8tw9A5cHfdWK7D9dsdn95OGnGeOOZY/+pi8J6y7mEFskyETHRZ1U0iLuDpgcK
         H4msuKef6NrkbXm77mcDK90YfEYuV0KysgVJwDteTkfb+/EN+1oTXJl2byIc4H1bWDXG
         RKqvCF6wwxXC8+Yi2MddBBwmgg4wQYqA8IBIY7uJkN3HDqT9PkFe9eeJzhFVzP3AVIwK
         xR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLb4eRNcCEX2UMwoo8gXKRnIfuOx+5A4lJjiZhpkmM4=;
        fh=yIwneq7kjlKisYRXmd9lns1aWtBC5JqrTBpuNh4lcA8=;
        b=bvA5kvShwrus96RgOLMQxOdocKDZgoQB4/xbVo3z2w+1HgcvuQLH2oH9j7jo98Ec/f
         vCg9JE/9mUpj1hVOGyx6zWqYERHoesArx4+MRa8FEjo2xH85k2wurcbnZieK1+A5X12y
         wi/Ol/Kna7I6WdxawgETMLnbLa/IVSskq5oTknO0iUXrgiP0GErxBctl8MJi0jS6IH5E
         2bI96vwMrqSClqTsnPr2wIpW26Srjlb+bIeBzw1b6TVaFTRVzI4VhEItrXlhS8kVWCRo
         uOkqGsOdZjHD4j5CTIoAEiHruFPhVa0IrhW0szVrMTOxtcWLgVeDWoOCPTttnKA9glvR
         luIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122671; x=1791727471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLb4eRNcCEX2UMwoo8gXKRnIfuOx+5A4lJjiZhpkmM4=;
        b=ftQUyQkG+UApOz3N48cMNnWYQL4ijCkijE5ox8/EKFDbl4A+U0lAwXlsIa4D/ZQAKi
         i09beRXkWesIif+5Q79oRGas+iuXUYz7FpfD6OtT9mUQWsepBuVyu6IaJTQ1q6/wC4nB
         lA9+xS5s3T1q957OsDiwUX6wt5JBrivakwbyhtA3BN7C2/roUEvnQrLQPn1zweqQPHsK
         HmijqrBuc4EAuulTL2fYBd/1pT3PApE2yUUX2MDq1Jv4pdWbr74f3feD8B/+/RIrw28f
         TtzmRg1HcRYKO3asm2EsftP/3bVODcI/H6gU44DlETGNyYb+2qcV6nmJjNyiHasd49V+
         fBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122671; x=1791727471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLb4eRNcCEX2UMwoo8gXKRnIfuOx+5A4lJjiZhpkmM4=;
        b=yrq6dpyknSwGEXsch3L4gfAuRIyDUriLzfNOx96GqZKLrNShs7orJuP4wSFVBMzz/M
         qqor+rpJA7/x63ykFuKR7zVDIQDCe+oyjuGlHAe+32iIaf/0xV3qxpZqRl5Vm0Ksdgtf
         Fl8Q2m1u1TT2uBMuO2cZProueDRhMXRgRIHDq+ndlQrkeouMUGHCdV2FEmOt4OKh509s
         2ZperV5hxCszQit0k75A9EQcN5aCrdvCl03T4DGyMgUhtjhsF5lqQMr1t9flPri7kutB
         TybLt0tFwHR8gIXMFrol9hdxz8dr1w9AVPCInXeNwdSpjQkR3f4yk2r9T79Drr+KbkWX
         S2Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzssdRDIgirKzNHTzMmWIc4iQcKJhb43Bfr3nHidCZwgdLdu2/tmEgVRQy+/BY5r2gUkYTlBp7Ow3qV@vger.kernel.org
X-Gm-Message-State: AFq9FYIrfu/88DM+30JBs6j8TtVpEjM6JQiC/w1a1C7DwGXz58GBqk69
	ebLxTalVvvVyPJ6nvVPYcywWS/rBrRtWAzJo3xzwKDhiwMKIuWcmFIjV936hVu3vnJDRzScX5hB
	0NmmeFq1f6PxpAq/R3GaPXxr223WNWDU=
X-Gm-Gg: AYBFou3PQUp9yG9nB5kmJg4s9jioSELEItMGT6bzj95LECy7PKj9pc7SBoyjyX+hYYp
	PcuSNDbev4YZZSKrdjYb9j8g0Rxsz6ALGite36ucyQqfmnvCcvasP0IFcKvVy97lTDDoyW8/bV8
	g3dTsp38v2Dr3iMxblpoc8r5cHa0tmVO1cYKdj54MSRmc92PcBvZ0hrGanb3ypVsP+p7CyYKXjk
	hOB8Wruj/lwy9ImQ5HMCn65nJrzJNOwqUVGeqwa9EwKBh5QiTzm6Qbg1aSnE2da1KhUGnvCRE1p
	IKbp6tYI4C2rFdOp2VXRpBI0flbZwPcnpRoRK713n6/pAQIgG15CTYw0l69NNpEJAAo=
X-Received: by 2002:a05:690c:808:b0:894:4ded:2746 with SMTP id
 00721157ae682-8ae39bc3a5emr29986867b3.36.1791122670719; Sun, 04 Oct 2026
 07:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll> <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org> <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
 <82b71784-4bb9-4165-a0f0-cf00fedde944@kernel.org>
In-Reply-To: <82b71784-4bb9-4165-a0f0-cf00fedde944@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Sun, 4 Oct 2026 19:34:19 +0530
X-Gm-Features: AclHuK-smCoxAzq60YVQ3K1PKT1W0UA8Bq-Qwa7xNOwTShMYhxgCUih7FvIhu4Y
Message-ID: <CAAj-GBkPTmSxjKcXrzeMA3bz89vPGHt0Ai4Gat3KSz3epusRjw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 11:39=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 14/09/2026 19:58, Uday Kiran wrote:
> > On Sat, Sep 12, 2026 at 1:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 11/09/2026 16:29, Uday Kiran wrote:
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: lacie,netxbig-leds
> >>>>> +
> >>>>> +  gpio-ext:
> >>>>> +    description: Phandle for the gpio-ext bus.
> >>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>>>> +
> >>>>> +  timers:
> >>>>> +    description: |
> >>>>> +      Timer array. Each timer entry is represented by three intege=
rs:
> >>>>> +      Mode (gpio-ext bus), delay_on and delay_off.
> >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>>>> +
> >>>>> +patternProperties:
> >>>>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
> >>>>
> >>>> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
> >>>>
> >>>> Actually entire pattern is very odd - it has $ in the middle, but th=
en
> >>>> followed with other REQUIRED stuff. I am surprised it works, but
> >>>> regardless it is absolutely not readable. Looks like a begative patt=
ern,
> >>>> but why would you have negative pattern for known properties?
> >>>
> >>> Thanks for the review Krzysztof.
> >>>
> >>> The negative lookahead was added because patternProperties matches al=
l top-
> >>> level property names that fit the pattern, so excluded known top-leve=
l
> >>> properties like gpio-ext and pinctrl-*;
> >>>
> >>> In patch v1, I've used additionalProperties which removes the regex e=
ntirely
> >>> and allows arbitrary child-node names. But removed and used patternPr=
operties
> >>> as per the review feedback.
> >>>
> >>> Could you please suggest to me which way to proceed? with additionalP=
roperties
> >>> or patternProperties
> >>
> >>
> >> The children are leds, so they should use generic node name pattern li=
ke
> >> "^led-[a-z0-9]+$"
> >
> > Yes, Krzysztof but the original binding uses blue-power, red-power,
> > blue-sata0, etc.
> > as LED child node names. Would you like me to rename these nodes to
> > led-blue-power, led-red-power, etc. to use the suggested
> > ^led-[a-z0-9]+$ pattern,
> > or should I retain the existing node names and use a more specific
> > pattern for them
> > like "^(blue|red)-(power|sata[0-9]+)$"
>
> I did not see original binding mentioning any names. Neither in the drive=
r.

Sorry for the delayed response, Krzysztof.

You are right that the binding text and the driver do not mandate node name=
s.
However, the existing device tree source use names like blue-power,
red-sata0, etc.:

arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi

Also, the driver uses the node name as a fallback LED label when the label
property is absent.

drivers/leds/leds-netxbig.c, lines 585-588.

If we enforce ^led-[a-z0-9]+$ in the schema, the existing DTS file would fa=
il
validation, and renaming the nodes would change the userspace-visible
LED names.

Regards,
Udaya Kiran Challa
