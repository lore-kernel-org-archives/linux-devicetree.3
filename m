Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EF323909F
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248123; cv=pass; b=IAYGUpctURrsP6xTkFqDxaZeTzcFFP4fqg2YayXW/bchmV1TX2bS11cTrCWmfS6l+FsbVJ9jDCWjEw0Fb9gkRqmr3auKPOTEpKIbPh7RPGs+qop6rwCTXOj747Kej+7Z2+JofUweYtH24i7D7jEqa8X5U8P2xvxyeQWZOU7W+5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248123; c=relaxed/simple;
	bh=Y5IjH1Bdp/HIIEY319Pr351nUh4nrZWor13x1X2xdG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSo4slu4cO8v+NRofTRAUR7b9hSkmUPMUdDjb7mcJ15ohcBTEdDAPUI5B2TyotnR7E5fiIUdJTXrY8x84MsrBLa+pPcYiQaH6YARB41HwIqkShcsBT6Xa27t8WoAlWaeq36hnf0KdNZ8XwKcpyuUztX1SnE1eFYyRcVtns6UczI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rj+svQy8; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rj+svQy8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69fe400c14aso4170562a12.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248120; cv=none;
        d=google.com; s=arc-20260327;
        b=KrYocGF9QBMQNLDC5ytIOV/RCw9A1AZrUVEWvaKkmgXCRNyBKmkP00uSvoO+7U4Nho
         6YZK7uGMEvLwClx4uC3nSch+JrnfSKrk1aB4+g5Ph7f8KEqdIxdYdV+CZOweIAc/KoFc
         gJa5r/qyod2O6iTyVxy0RuA4E0VuvYbMn2FYJliLklmQ79V6694V95bsfhMPm5AfLx2C
         zxgUhFLVfiWU5ddf5jOB5bUE1Tb7USSh3RM9lRPGWF6tau1GE/3xIubUYJhEEEb6bObn
         Q2dc8wA6aZdiG7RhlTK+/EZ/RHi7oB8YYHBc4HdWAw9diETvfpsFBKhxdeyY+CAXrUwa
         OWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jFo9QIGi1bowYtmXcjJ1ewwDQZf3d+IEplm5iC9s+fc=;
        fh=YmgMuQmwddVBOfCZSK7bH+UxwpEJ2l+6LOQDEPAzGOU=;
        b=CVVVPd6LBBq6eqJt8nBeAI7yVgeUXuG58BamH0D4Hqf2NDHcS0F0w9bEo5pciwEnM6
         b36GNP+gFZEsGLM5OOve9R06KsNib9Q2YBK8AGF01gJOera63RUUzPI0tcsklk/KVoa7
         bWW+7SF2tbYoCnUxheJLT8nXPO+0heZ04kAv+g1dcVSSIx4k5CQt8QnIyksFNQI2QNpI
         KpOlVti0RzR/KDV9wQvP7EdSDyEjvrn7YGsHG0vz41nQyy+sRPk2pHl/aFwjVePdjEXQ
         2auXTZZ8OiLSG63jYTNopQqDQQCle4GCmzFD+eisQ70MH52HFNru1eHUMAXmgqY24vYQ
         SGVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248120; x=1785852920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jFo9QIGi1bowYtmXcjJ1ewwDQZf3d+IEplm5iC9s+fc=;
        b=Rj+svQy8R0/aMiIAILXFXrkoar89amxIzXYH3SBb1V99kMx1JygHELsGjiRraDD8Fl
         oF/8rdqsD1IpAAKROBQxOUT6WgJxRkbX16GnAk+KakJJR7T7JbDr0aWxeCQ1lFecf5R1
         nEcn1HPlTE42LKaqywsQyy2DE4Jk2aVNLW0/4IV7hBKF0W2uo/r84VcHwB/oYN8azVSs
         Rx2J0zpfk6vsQwd03I+9b4usE+1zNHqS9XovmVacz6w5WSPUHBMuvL9ovZNdaRpmgaAH
         U+z1P6YCOYY4jdJQQHneDnCnmwqpTHd1IT5jbf1QDqqRNUSAfFFgkHwDruMIAF6CrcKw
         YoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248120; x=1785852920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFo9QIGi1bowYtmXcjJ1ewwDQZf3d+IEplm5iC9s+fc=;
        b=caN2yc8BGtLLGSsp+o/iuNI9OyCy6FrQTZUZCnSqET6FA8RvhKNq1zUVbAHpO3Mdmn
         VDyNxyF4CupYDBk1DMGRCiXWl1emP2VZwz0KcETX5TLJCKVZ6HLhRHx7vVycT7w6dlnf
         tCk02J8ctYw9y7lVK5n6jHUOE/qpQIX4guZrsNtgz0moLS9JIOd9oozxJKwme5SiTix5
         AKVD/hUkebH8VW5YSG7ssYpnjVWXaEpBKSfoo8bpIZfYpiFvE6qpE+v+C5dJjR1YR+bM
         boqxUWFqkBQKtrAa+sDXnogxsxn6P+U2bnUM/EAApObVI0JptQL3gnzy3hH1fpspez+H
         5fsA==
X-Forwarded-Encrypted: i=1; AHgh+Rpju+c+fFj9oocm6hNy3tWSGbdCZM8kTrf4Oks3WplSCveJJWG+uDrwmWDOfv9dbD1Opd1HH0lJAJxf@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVWotTLN/wBG0U+j5t5WP7iaDJJVn8OoFg0fCyqtRPwk6y2ka
	tM5CEWUy1VV3z4FjXLipi/jm7rGQyVSf8J82d/EmOBZQsFGzxmZq30/n+EgskiYSpkG9O02sftG
	qjiMyBoMAZibcGMolII9iJCIBQBHlmGE=
X-Gm-Gg: AR+sD13FdYv8gV6PyJ0TKe3CqkDhTUBP6hR4dNaa+ioCq/qBr7VDYYFQ0YsAHdCU2L7
	4N5+1UodsgslZ88pqjfrR1IJoXkmnPAJWWhNtSnYRICQs5hkQ1KQpc9Oj67GRxTU6DVD+Nj8LQ3
	heaYzAXHOoQqGUQl4eDC3e/X3fzoXrqNrKDuDXOv1ddHWVcXibrhBEnrKzC2i+vr/T9s7tmC07D
	/OhHO2NvWc59DL1yf7Su+sAdhuPmJBukIMkbuZm+FfR1s+3MdprMCmUyR3cQtY=
X-Received: by 2002:a17:906:eece:b0:c16:12b6:243e with SMTP id
 a640c23a62f3a-c1f72142e48mr159558666b.44.1785248120024; Tue, 28 Jul 2026
 07:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727075324.3555446-1-a.shimko.dev@gmail.com>
 <20260727075324.3555446-3-a.shimko.dev@gmail.com> <20260728075339.63B5C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260728075339.63B5C1F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 28 Jul 2026 17:15:09 +0300
X-Gm-Features: AUfX_mwvkYMIMfnSM1177XFyXUjcy8-qLtZ8RZKWCrOcOA4UU_0PYQYh76WWUIg
Message-ID: <CAOPX744yuL15p60JKyy3eSoFWcy=t1tCtgKOdNN0AYb794Um6A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 10:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> > +config DAP8211R_PHY
> > +     tristate "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY"
> > +     depends on OF
> > +     help
> > +       Support for the DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY.
> > +       This PHY is designed for enterprise and industrial networking
> > +       applications, supporting 10/100/1000 Mbps operation.
> > +       RGMII with: configurable TX/RX clock delays, optional flag to e=
nable
> > +       180-degree TX clock phase shift and internal packet generator.
>
> [Severity: Medium]
> Are the 180-degree TX clock phase shift and internal packet generator fea=
tures
> actually implemented in this driver?
>
> The help text advertises these features for users configuring the kernel,=
 but
> looking at the driver code, there doesn't seem to be any implementation f=
or
> them. Could this mislead users who expect these features to be available =
based
> on the documentation?
Yes, I'll fix it.

> > +     switch (phydev->interface) {
> > +     case PHY_INTERFACE_MODE_RGMII:
> > +             if (rx_internal_delay < 0)
> > +                     rx_internal_delay =3D 0;
> > +
> > +             if (tx_internal_delay < 0)
> > +                     tx_internal_delay =3D 0;
> > +             break;
> > +     case PHY_INTERFACE_MODE_RGMII_RXID:
> > +             if (rx_internal_delay < 0)
> > +                     rx_internal_delay =3D DAP8211R_DEFAULT_DEL_SEL;
> > +
> > +             tx_internal_delay =3D 0;
>
> [Severity: Medium]
> Is it intentional to silently drop an explicitly provided tx-internal-del=
ay-ps
> property when using PHY_INTERFACE_MODE_RGMII_RXID?
>
> For PHY_INTERFACE_MODE_RGMII, explicit delay properties are kept and appl=
ied.
> However, in dap8211r_config_init(), tx_internal_delay is hardcoded to 0 f=
or
> the rgmii-rxid mode.
>
> This might lead to unexpected configuration drops if a device tree specif=
ies
> phy-mode =3D "rgmii-rxid" along with a tx-internal-delay-ps property, as =
the
> requested delay will be ignored without warning.

Yes, this is intentional.

The RGMII interface modes are defined as:
RGMII_RXID: MAC provides TX delay, PHY provides RX delay
RGMII_TXID: MAC provides RX delay, PHY provides TX delay
RGMII_ID: Both delays are handled by the PHY

For RGMII_RXID, the TX delay is not expected to be provided via dts,
so any TX delay value specified in DT for the PHY would be incorrect and
is therefore ignored. The same applies to RGMII_TXID for RX delays.

I did this to keep the switch statement simpler. I thought it would be bett=
er
than adding these features to its cases.
--
Best regards,
Artem
