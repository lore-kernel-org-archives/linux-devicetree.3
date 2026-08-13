Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3005430301
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604297; cv=pass; b=aN6Fmax2nWbnmGTr0qwlzUnxgsVTnyoLX+KY0Lajg9bT08H3CMyhCSbVfv3bOuy7HdmhJvaiNxvVcdnCA2/LtBVHB17Zi4ssuvBJT2KUyTV0O08q4rDti0sUlem1wf0rVnaEQ58YkzzU+SfYJWN2asvxarySH3Z8bUzNU9hyumY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604297; c=relaxed/simple;
	bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KuKtqKZyLStidrSZz0QIfIJ/K+oa7opRAG3RlKgcH3GZndoGX17YM13O8WM2L9tJeTxLzyzW7LGslM5eSnN7tAVF3VDhErupbo1MnwOsgyJM2F1/186L5talkt+abdzYijCKI0s180cpB3YQfLskAwm9YdKIKFdi+2uAIZM6pVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwbucHwx; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwbucHwx"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so499849241.3
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786604295; cv=none;
        d=google.com; s=arc-20260327;
        b=M8/wtMqm/DaBZq5goIAm2NQjOgWvEZt2ay5g7nIB2T6incA+x8wOo8pVhHFIi65FuU
         4SXOuC+5HBeCG3axt1eXx5qyUoZq3j5MTbTMDJmLztMeZ4OkYPgTPseFVyBYB55RzB3R
         FXCmoFJ/zm59byv3zYf4ihH8NV2K0WsCWEZY94sTWYM/2BfUllpeuYR+RLdtYNCxGTM2
         xN8gduxoJZirkTnb7OJHV0e+F1ntPf1wJCgYU6Gjt2JJiQeMcJQ+0aAihZ5sx/jEXW22
         G+SRWSbc7kF2anfvPXAWEtq26d8HNzpv4cJ/aM4Aw5IKdjkEs0QJbwRSdnhSW+ezkHbT
         J1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        fh=UmkcEdrkx5g0jYV4xKrqk1EId7sN+o6rkkwWiN0Bq2E=;
        b=jCHDa8v5QiaWKuvfScszoidp+7uB7AzmWhvJIt2aCYKda75rrmJh9A0bxKDbKsFP0Y
         HYWsK0lkGXLCUdm12rzUys3aRbEZCpEeLBM6LFvLHpTLm/cf9mTTH1cF0NASjRL1OQmO
         lMWNuFsaldTbIMmWMOyyErZOqDT42La08IXaYIXtAK8pGtG9UqZ+5EfcEaZirHmv6Z1o
         doHLI0CrtcICsCH83br3IbyjKuhtrAE7jeE6QJXJrE7tliR0m0gcVKGd0vqjNPrQvVQI
         inEUmM3ivgm/ds+gc2v6kZtEMKCHvPEl+8ra9AFRmtkJ4vPBqYUqwTPpoHNQtVXL8cJn
         efJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604295; x=1787209095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        b=OwbucHwxEElrG9E+Q9gZd2pRnpjdJXuNfxkBLjBTYLMEHQIg+99nx8a9FlMXrOQOEU
         MSCGrcsKNEKQ/61mVVf90cPXuJaQa02AkP0raACW+GzChl9xBg0LAe421lE4SjzV6M8h
         iSEppMi6w8m0wHkAaB5r9cEOJmZ7f3uHZsXzodMJ5ca9QUcZv41azXdpLi1tjc5mIUpG
         wDgoKOt7sNQWQmpKovAIVG7Uict5pb5c6qljGIrS4OXFKtVhuQk/3o6HHi201aR+H8iy
         pNcBduFzs4WFzlLnBXRTlwUQS6AQ9eF++pFmMmZK1qOGC6x8FMqksW5OjmfCHmw2eXKw
         Dkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604295; x=1787209095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcw77KBMIYpRy8DhahSnN/xtZZNsyj77PbRJiNIjhE=;
        b=KffA7Ap6yHy7bL8roHuFI+JInC0jSL0b65UhnP74w9XEmhz2i8vqTWc5zVNTmcmCh4
         41b6DHndFoc7DlVYxMMjoYzvKu47V2cajkXMa4Cy+8OAMZK5ggRfMBMC1vujC+matER3
         mlbqicBbc78jvNhHv4wh0qhE6YWCvpu6q7LiuVlL1uCtg2fp1bZ38IcOGaLeZaRbiKP+
         //SRFJV/Ja6W8lOC+IEHGLxOpV2aoW/ZuiU/z90mlPdBtS8UmDEcoGPV4VzYRwfMRooj
         DbW5c3W8WwccqjmbUPBXINmuY7tPxtNRgQBSv3DDY937KklI4WUz8bxfhQXP64wZSPkE
         Huvg==
X-Forwarded-Encrypted: i=1; AHgh+RpzHngEMwhiGs8yEyHKRFFk9ZJOh1NiL/wRd7Aa+Fd2truOlteEr1LGtI+Q1qi3ytRn19XBMDDZ+LW3@vger.kernel.org
X-Gm-Message-State: AOJu0YyW1+vC1fn/Iagx+IaaGg+HwLhoVPCkzjLpxntjLXsDyvtkD7we
	okCc+RVQXMCgx/dsGw6NGD68ogFWPgIVSqs4/tyvmRSokan+RzwLi2cDv00m0QL/5kRwMHbfrw/
	8gjuf4YJ98Pi0/eciECX2CZC9tuax+aw=
X-Gm-Gg: AR+sD11NkNxs1D7vGPQUt7sgyHrHXFYTAL8Nn0+XBca0wHR5DvYkRxFWKUhc20l5B88
	ihjKuPeN2A9W5R2oSUy/k2x4H8VDfVBu9e8kGoksdUonlcY8ijed14o32SgOJDmzoFHcLNtrekm
	ZMlaISU+kNAk98jfleNrFLCkq128N2v5dOcT8av/eu9f2eXd2RPytjc8DlQ8MxBg+8u2YGtxRMW
	Okz7OP9Nd9qXTc5MU53kN3UWSL50wWE85FB8OZYSlfKbVz4CwTsMm6E4XaZtSVgB9A4GeQEX5dT
	YRCyRwEkJjcpRjyag5qWjJqrbGa4vvVcKzEMcr+VZf63lb8GIN2HMLclEd2RrVNvz8pRxdQEOMC
	MBjtu8aQFiKLF2WUbmIpXharZKHWPDMgZ2U5UsE6toZpPGI49LpTj6s/C5t2UuXTg5ck9HKfPeQ
	qgx3fIat/wIudoegL2BpE2UqxkAlo0sSxPEi7G
X-Received: by 2002:a05:6102:c09:b0:6c3:1bcd:31dd with SMTP id
 ada2fe7eead31-76db5c7db09mr827543137.6.1786604294775; Wed, 12 Aug 2026
 23:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com> <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
In-Reply-To: <20260813-independent-ladybug-of-perfection-1afe7a@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Aug 2026 00:58:03 -0600
X-Gm-Features: AUfX_mwgvEsp_avZ39gMBtOXoVUSCDbwgKTbjWWmofYwkFQgC4t_LLBxQm2wsU8
Message-ID: <CADvTj4qaiyEtKk8bSj6Eq=q=KJ5pO90Aa0iJQrysr2LR3QuAQg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Andre Przywara <andre.przywara@arm.com>, 
	Chen-Yu Tsai <wens@kernel.org>, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 12:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Tue, Aug 11, 2026 at 05:11:30PM -0600, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
> >
> > Describe the parent device and its shared input clock. The Ethernet PHY
> > is represented by a PHY package on its MDIO bus, with a phandle back to
> > this device for access to the package control registers, so it does not
> > require an MFD child node. Function-specific supplies belong to their
> > consumer bindings rather than the shared parent.
>
> Other way to represent it is to put ethernet phy here - either as a
> child or folded into MFD device node - and provide phandle to MDIO bus.
> We do like this already for several devices for I2C case with "i2c-bus"
> property. Here it would be "mdio-bus" for example. Such solution feels
> more vendor-agnostic, easier to re-use, however I cannot find any actual
> arguments against your approach.

The PHY package remains on the MDIO bus because the link PHY is addressed
and accessed through MDIO on both AC200 and AC300. Only the AC200
package-control registers require the additional I2C path; AC300 exposes
its package controls through MDIO as well. Keeping the package under MDIO
therefore gives both variants the same representation, with the AC200
phandle describing only its secondary control path.

>
> Maybe Rob will have his preference, but this looks okay for me then:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
