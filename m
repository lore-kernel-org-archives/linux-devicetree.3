Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792501501;
	b=gZWxp76J5Jbq4WYqdqmuiqWCeKUzgE/cw9Qxtz+orZ381FwGYMOO0qdZG3ziX3+PkZsG
	 555YwhtHgD0fqKiPnBImSnr8ryEniAc9V3BxMQqdoX6tEV66VtcHWsGKgAFb6kLYda0fZ
	 qmEeUNR8BiDBXcQhpDLuqByx/3krj1abx/8y53JCnxfm+4SgIC93Xv9TRPl2s039OUId3
	 X+9v4Y3LPz1FO8M/P9+e2rESPATPcqPhnfgtAhsFnRGci9kdS8yh1+MKCusTQ4EWFO2n6
	 /GquSSSxNxYkaKPVvOiLX5GT8GAZ9JlS4SAxaRI0qsBwhCexd7Cuqyl46Rt9fwB2p3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
	b=sv106yaZFCfx5ZhRaPB199ctxFgqI9UBhiPh46WbY24BTT+Va4LrN/MpYiiWX/zyyztr
	 swG/VHr+AoJxHzRzs6Wrx9WPW5hEryyGkmB0kre1RtSC2WRVDkJNO21LVilbUlITzx+pi
	 sveMi+AGygBcMUwGuA6ibSJurT74NakzF1yzA67U3FRMVD64fuMh+OLPjvUPpRha0SjkA
	 e3O19Zib0tlgDnGEgyJ67S6kbSz0RKTA+PdR3LWCXqWe3Kv0qftY7E0dkli3+leH4LUmB
	 6dxdmqpvLkvXI+QgjjCQ7jCw4ahuIxyftJuCPjcLmfHBtDPFLsGP2msvhGxifqJaJsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xF5CgZtM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBB9606A320
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBB9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xF5CgZtM
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so424932a91.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792501500; cv=none;
        d=google.com; s=arc-20260327;
        b=kWWmvgm+ckT7dSvhCQrAWceEEBf4LnOmQLADYuIPLRS4vNfYuJPRlPleBuIEVsrp2e
         X6299J3clqZC3vrRZ24UKKKr5xZPOEmn/4HYfcKbUpMNT0vqKnQUtIsbU0GHnNxHZ6Up
         +kWgZXkYAAIvl3BJcbMm3VGrzKB+kYpqMFyssX3E6q/RzbLO68om3qGRW2B3vSGp62P5
         3k49q64GCEC/s+UMuB/YV0v9Xi2wsgzkVavoOdhG+jM4IIvwGQ3pUjvYXhZdrUudDVl3
         0DAzX4n4CZ9Xzt5U6VME7HmidaWC3ZYdsT1LdJZx+qrnT3gVmVsulPp7iDjesc4efik1
         j1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
        fh=jxfDy+1cwqOUq6UIpGEXi+v9L1oZtWc/eOo13zGjuNw=;
        b=YjT0Nuw4EVshBtKi+HMaZJ8PIORa70tlc561NZUs3EIwJeKAQ92AandxNHv2Dh2gWw
         f6oQVFksKTImp4HWcA4eCinF4kPpaRF4pZhpmgurqDri8Y7soOvzK1exod2x8hdqNr4Z
         hlsA+91pWDUkH0p79Gx9ZeB7EHHrdRsoEbwL+0uOKonkym2Z0ktHNmMUcxvEW7EPB32m
         VJteuyBES0puaR/iHN/1CUFb0RQDi/bqzFKhVEfYy5TMdSSjshyufjWumDyVXKxGoA/D
         orIXdYVSdSrCzeYDdjkLWm1Aw9bDn7IG6LunH9SxEJ+NBy1kS5fz7OWKzAMh/6cq1lid
         oSZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792501500; x=1793106300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
        b=xF5CgZtM7ONqwjEt3lKLm698g3fWzyCOm0n5BjWOqpvFhg9vNkeqnuqF1kivJaAQiy
         BbyR27Q730S9zFPzDslSY8IWdOMVWgB5gbNE1aCM8IM9vpicXZOIN22To2gj2yrA26ok
         XyYkWMCkD4kG0pvvs4zJ3HFT9BDce0RLo62efSCvM3QO4chKPLw+TBqPo1/d1lElw/sW
         My/YP9OBng9gTSZj2mCEpTILobrvnnWAhQ49Mss29w02AySVE6JQqkIDY4W520ozszEm
         km6QiWF1uP98FQcrFj6arFGUsrm6dYfRlgi6o4LQN3qb1qt4tRl+0vRnumG12yF65Y9I
         XS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501500; x=1793106300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hk6NzAT4XMI8WeTQvuAnkf91i6pcghLbbrlCX9l0Rao=;
        b=1NPGmqBvbzjHClrpluqPxnQgNp0Rj1o+ft6wp4VQERYj4eskkNPFZlDnfPhUiNLjlr
         ihXFteB3fRpS1zEVVJc+1ZD689Gm6N3SvHm+NW2tbj04B3LFIrCC+5tUOcy6R6WnS5dF
         FFzIZfqxmqTOcIQcIbcS6y1L9X/zjERdHRkxZ4SvsMNovdwE+KOujaJm9s/lvcQVZtn6
         ckhgAdTEmfky7XMm7FpzooxvfKGSMplNCwrTskVVIRYFTD78XO1BO4/t64b+FPOs9ykC
         RIshc00V9JPWTKdr0/Kn4hMkOzgmLCEI+SOR/valLy6CXvMx7NVqa4H8E9wWe6G7PRaF
         FGxg==
X-Forwarded-Encrypted: i=1; AKwUvBw5EHmxDxfdQ2kShvX+9HsJ/6hI8MWWT6hGDP+1RYDthozOCmJINNWoQq7oAKTKzTLUBskF2NBat43g@vger.kernel.org
X-Gm-Message-State: AFq9FYKT3RWcqIvUdSkiQF6zssMvjF4DkeHI10oewaBGIEASaf5m7a9l
	BtIDO/b1CDLkvWujxGh/D6GAYMpKVV5K98qcLWJaBW52gX4UE6oIOvLroCKR8GnOFdTKcDXT1pA
	uGUHq10FMbW4pt9wid5oW0rb8PMhg8/sKBKKLZGmG5w==
X-Gm-Gg: AYBFou34M96lPvuG1oh5DdaaFSOhsGLTFkg0xyJOf+19oc3R+DbvRA3/SrVJkz5bPk3
	xKR8TnPZP7Vt2/FSbtl6UXxF+YHz4oZndGIixGuNQWGI4jUywrYU4qjDIQ21E1yp6GMsDMLAsqV
	im9zQTia2fIs9TzNKO1K+2WuFQsOyAkhOyrgpoNwUibYBfkWxaIdqpUB3KIYPFHAs7x1wym9SEw
	h39+Myk20oY8/IIDQIgxksQ1MNva6gFAkI4RNwPjnzvPSZQPddbS2FhuFFIDxSqSMUrxT3KQLae
	2oGz43zj/DTRELeujVcijGqZB2/0QuvqlBeCmGWxnGLysXwaym5J0EfwXkuUaqQPW3wWDUFfn64
	yU5QlnbiT6Oz2yJLtQe5pkO1b6812hI7I/A==
X-Received: by 2002:a17:90a:d50:b0:3ad:676b:28dc with SMTP id
 98e67ed59e1d1-3ad676b332fmr808023a91.14.1792501499592; Tue, 20 Oct 2026
 06:04:59 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020093655.344585-1-robert.marko@sartura.hr>
 <20261020093655.344585-3-robert.marko@sartura.hr> <21892f3a-8e0a-4c72-938c-b2e77b9f0dbf@lunn.ch>
In-Reply-To: <21892f3a-8e0a-4c72-938c-b2e77b9f0dbf@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 20 Oct 2026 15:04:46 +0200
X-Gm-Features: AclHuK-2Vur9-XXFhf7sHu604ujSpE4RJ1TCAk85iRxwFehzOQjuEaxeKnqe0nU
Message-ID: <CA+HBbNGLc+imr9geBVSZthromLUCBTbC-4roVuz7SM2PdYPfuw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/5] net: phy: mxl-gpy: release MxL86211C
 Super Isolate
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lxu@maxlinear.com, hkallweit1@gmail.com, 
	linux@armlinux.org.uk, lgirdwood@gmail.com, broonie@kernel.org, 
	michael@walle.cc, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lrosu@maxlinear.com, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:48=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 20, 2026 at 11:35:36AM +0200, Robert Marko wrote:
> > The MxL86211C can be strapped into Super Isolate mode, leaving the PHY
> > halted after reset until software releases it.
> >
> > Release Super Isolate before gpy_probe() reads the firmware version. Do=
 it
> > again in config_init, where optional VDDP setup is reapplied after each
> > hardware reset.
>
> This needs expanding a bit. All reset actions by the core should
> happen before probe. So why is releasing isolate in probe not
> sufficient?
>
> If the MDIO bus voltages are lost, what else is lost? Should
> phy_init_hw() be called again?

I think that Sashiko confused me, it claimed that PHY HW reset could
happen during interface up/down, etc, so these would be lost.

Is that correct?

Cause if PHY HW reset only happens before probe, then doing the
voltage and SI in .probe is fine.

Regards,
Robert

>
>         Andrew



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
