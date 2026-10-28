Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156564;
	b=WW8snm4dWclh59LqqAuJgphHrzPEWV+VPj5rpSKp4ksnMJjEyxjpQ+88uNSTQZieEdxq
	 eLkq4fatZxOzTiJF3NMDVVjVUr6olrUkkLVSR4XMwiiaXc1RV43INiiSwZZhVfZNwP0s0
	 NABMyRiM8xb0iFcKodqbdmM7Qz2jObqkd8C5TXCJN8RP4Vs900LH0kLWc7C4Xsc/7irRO
	 bUQHXoje1Heos3DDzyECRR1/evYzLCxAWSKJ9i93JXejn4SqHgjE52x9YbOml1/3PFHnm
	 4++D/qNEbXuIJLxeqFdfIS9CH4M1iCwfl2CAyN38evaXYDjvW3mgLgcPYqox54+OIig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
	b=VjzQNU+OhcibSzmV48P9egwmiy569dXpv3pvyVCGvZscZyIEOPZ4QSTX62D63JgMUpbI
	 DnW5CXuCKk1t1e98i8nECfN7vGKx+rjIok4xDdBzpVtTroPfiRDhXD5eRAiLcridVspgn
	 oUWfj3lqVnN2GP2T/u9hrxKHoJ6D/qcnGkwC04hgsbg4TgMrYes/Mrd6qoBZugEC/q/dQ
	 tG1x32GL8MDsf1/hs1cnXM3PEv8p5CyX8XxipWC2cCt3X6eRsqxn9N4A/SZgD2JsWD1wj
	 bJzRAeGWilXz8CdEIxoI18bXwZdE6mZAbkwkxaNT68wrZwEBxJ1rUFK6Zlq53kId3Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nVVHtD2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE3606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 03:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFE3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nVVHtD2
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0e21048f8so4267067b3.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 20:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156563; cv=none;
        d=google.com; s=arc-20260327;
        b=RX7q/avWjGwDvF/ZgQ5vEH6yVXGbRqEYR/zr+m5Dfwl5t3K2CSQNjoV9yZr5i2kVXE
         +aGlVsqJqKYaf5x6GsIfb+uBkZar7MPAZFSIWxpRXX6O6gM1K+vL5iCLjbTbNGuCNrvh
         Qd7bnM/+43qxYCmwOxLMbbP3PxjUq6Qn0wmaZkeANfLsaSj40MQyTJ4FGz7oLujuWHWl
         EU2ogByrGXYNPCm6YYsJ9nBFrpSejJZkTL7BWTVZce/6fDITkHR1SR+kS7/rEOromeOn
         09XoRwpc0HMGIQpb8C6Yidzl0mIk6ksH0QreYxd5HNVRcSL4dOWOueF83Q+ky+SP5baZ
         AnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        fh=swyQ1bbuUho77+qKOFevJL+69PUghLff3kt+tZg/geg=;
        b=avi/wjhp1OaEqPT1sXYS11QZdW2U9YHoSOBxhDSbN3uNtgYDdvwu8BBFwVNiB30KyM
         Y+d7MkIEHPB8QuHabu2dVowh3rYCUoMtUl1WJVfuZmc9I4UKJY6RGXUIuiR7I2dXY2ip
         CxxoynGB094I00Sl8Y4+VL74CAm5S+TzefvNP4Tb0kIwGaxZEcb80K9mdrA9OYHVkNRF
         OKOZQ2wnQJM6r+6IPZei/EMDhduZ3NNhJbXtM3lMdl2rDOA/q3/k/1o7nzKPWsbPOTRs
         P/tGqFE1YcymJDgUAAsoq42xL+KCQ62VKdiCh1qbAlNIlayw/6aElZc3VborkB2IshRg
         dJbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156563; x=1793761363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=0nVVHtD2AAGzgrZYLxigr0+/wRPFGgQR7F00ymwm+NwBgrsa+2b2Mg1brebNzmE5ky
         FPxL157nk/iUm5/tmgPhLpklyytZh1vCrkzDuMqSrQ/rCgyTrs93Sznf14FIz1ubtTII
         JfyR4R8F7IR3VOupDJ25aJbsUt66vtnlS9KD1KJBdxCOVXtUdpzjJ4ywsCahwIdnkMif
         lT1jYR/hmDsAledHFsHycCCYvIGjaBF2KqKv5XRsFYqXhgjJdrYkAbbr6DFZ+IXsmZEV
         TBNSfvhpwbYe/4qNBNc5jewF0II1zYgp0F/6mKw4BBSKVNImw2gCEgDqTHL8E9U0Y4nq
         cKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156563; x=1793761363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=YSC17WB7Cy9lj0M14s3lmW24rh6QstKI7pDjzsOqAobUyar2QGh7o7Y1TzPHhKZHBs
         d1+o1O9eUAM5a+/XwXNWgPRA3NBtGOd1g0gBjWmX8mapLo95tAbgcc+6la0pEeYvxs2X
         zwBPi4ubIkBUokkmOJsL6HYu0oZPbLHVS3m5VhT9ON/8NHflFupzUV1+VRCsT0gfhUNc
         0dbfv0iJeXW7q030XhAYGLeN6/8w0QV7qLHMIjh7A+z2de4LDVFb4gsENprLpTobqDle
         hJNKzpvUlTfibXyeWs0H6vAWDAGGjrz2mQH0OVEVdQBn2pL6H4cFJiDws57TFFglBVgC
         ppug==
X-Forwarded-Encrypted: i=1; AKwUvBz92jBo6tErxFaLA4OLgB/yRz6tyScszWJJXhKdgIzD+c2Amnl0R0hpM7McoKAbYJ8W0m7bPe7T/Rne@vger.kernel.org
X-Gm-Message-State: AFq9FYI3IuHp9KU5ZrHS6MxlCpNnoqtS79u507P6eYC+VtK33T+vA1tw
	y2auC57RhHFgZFNDKMniQTKs58jLJnfGW6wU4XCYBrPAhS74aivPGa1UMhwJ6E6Dob5eTw3UH3g
	AgCPUd1q488dFljp98istgON9TPpXzCk=
X-Gm-Gg: AYBFou3bJm0RbWw6YEfy6MndbaBOzaoP5Eds/o8vraAUIyT0K3tZ51oHUtE4b4GTEgE
	I3t2X9ZkZ4eGD772Ub4mzQfytZOOJ3ZntxQDx5j8+cktV9ZvCPZVHHOyxhBSbTb+jyc8Tehnk2n
	vaMzveEjW0s1fUkxaAkUEjftSd4QBJ+rEnS9z5huhmNIX54f/TrmXKlD4tAhL/QVl+0sl2BPT5P
	LgESGUXnv7nB9Kv0Mtgm4YVGeNPJx26qLJ9vGxdW1gRA/Rn9GoW/vx18BR8WDR/Egrtj6fIjmZK
	oqbe2qc/+fCtQ9xuve+dP7ltfjH+v/MKrUOyjBM3bPchTlkLiUSZu3NtwpAEXoT2QN3+wyt6VwU
	lUpcCSCe6jAx0+Oc8iaTa5KyKFERqBubfcj2z
X-Received: by 2002:a05:690c:930c:20b0:8b0:893d:ccbd with SMTP id
 00721157ae682-8b1b5c7066bmr6133407b3.12.1793156562747; Tue, 27 Oct 2026
 20:02:42 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-2-prasanth.padarthi10@gmail.com> <20261027-savvy-powerful-seahorse-cc1079@quoll>
In-Reply-To: <20261027-savvy-powerful-seahorse-cc1079@quoll>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Wed, 28 Oct 2026 08:32:31 +0530
X-Gm-Features: AclHuK9lp_o8SK5eEXhK6dRTkFSMinl_ZrlydL6PeVvJqMGdIxhaqqqLV4JoCCc
Message-ID: <CAMFFDGhdzegMGoajgjfX8FRTBNF1p5VJ9CCcm9pPEVCA0xibQQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for reviewing. I omitted the earlier revision history and
discussion links, and placed the compatible incorrectly.

I will reconstruct the changelog, include links to the previous
versions and reviews, and correct the alphabetical ordering in the
next revision.

The intended changes since v8 were enabling both ADC engines and
adding the IIO-to-hwmon bridge. I retained Andrew Lunn's Reviewed-by
tag with its original scope limited to the MAC0 and MDIO nodes.

Regards,
Prasanth

On Tue, Oct 27, 2026 at 3:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Oct 27, 2026 at 09:19:10AM +0530, Prasanth Kumar Padarthi wrote:
> > Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index b7e70868e..3e6133e2b 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -79,6 +79,7 @@ properties:
> >            - enum:
> >                - ampere,mtjefferson-bmc
> >                - ampere,mtmitchell-bmc
> > +              - asrock,b650d4u-bmc
>
> That's v9, so where is the changelog? I see in cover letter only v8, no
> links to lore disucssions, either.
>
> What happened here with previous versions and reviews? And why is this
> placed in non-alphabetical order?
>
> >                - aspeed,ast2600-evb
>
> Best regards,
> Krzysztof
>
