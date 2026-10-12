Received: from mail-ej2-f11.google.com (mail-ej2-f11.google.com [74.125.228.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFE33D6D6
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833110; cv=pass; b=UumNnaMNBBAGzGOpemXtEC7BEyclOuUkqEcFbzZXIBLiRHY85GZ871UrZxCGt8cNNNhN5F8Qt0MMz7O3yLyIpv+H0XukeZNezNS6cNZtp55lo+0qMBEcPy5Ivqa5rjwOnjMZyvD0LZUQve+NQlG79mQeeR8u4eBfjHlvHVyviVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833110; c=relaxed/simple;
	bh=tgIZVnCf3XGFRPbT2LLSKxTT3U2rAEpxKOb6eHJqbdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcWL+HIp6nkgB6R1rrSrGz8X2bSYa7iyxd9d6EBvVZWwmitypOu9K6xyquCHi+pKtf7S8e3E+sPCaDCfmHL9gSNa9gGuEdQ2RFped++ZtXIvdXb/6IBU8H/AEi5dh5YounBNG6mhh7D/C5xLPAZ8DttsiDKROE+woBDtZKcMBhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDQoBfQ+; arc=pass smtp.client-ip=74.125.228.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDQoBfQ+"
Received: by mail-ej2-f11.google.com with SMTP id a640c23a62f3a-c3184a307cbso105041866b.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791833107; cv=none;
        d=google.com; s=arc-20260327;
        b=r7oR/09nLmlgQqhH7DZE1RViyCgjdlqgv6pTzUJfH7dqcYpCqgDn40Eur3kKUayKzd
         DK59lYHEkLZFPA5Lh6vzZfu56Y05pxBMcgtaoNRg4/9voOOXGdQCEh0Co6Jh7mo0BGf8
         BRRYoIWRqNmICBZJi4YaZJqFYDUGvcMzS1eFtSjCzfrWYp77FmDcgeG1CtOZ6BjBeRA9
         LKDeZxAbu83X1jLiDH1t9cDO2xUnIrEjXHRNVRbNvd50GjRVPOf1N9488cs5V2NM1/2+
         +2e+LMVrGZPKDVmqvLtrMIBitcHxbgzr5yeZpryCfQRpbdmLNP7PdKxPyy5mMGoN7DpM
         wTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=;
        fh=wSnAEdjPD0nYAWPpV0b0QPiU5LThEBkvvHpfLAz9My8=;
        b=l/sln0d2nfpZEOqQYn2AEPW7yU6zBo9NgVfoObuvK3+kn9IgjjtyDnLaUGbLfWqFnY
         Vj3U7LCReVWujktxssaK+KS3DpcFt5XT9+wSPGh+I4ELm0ANyl7HuwdHQq923Kaf+Rdt
         mvJmqKtUWyrh4OurBOH41qn8gGxIpwIy3/GEcecfsDZH8cg/3NgSATqEuSAHaEHVguAc
         E9PHWdvx0sbuzXiNkvZ8AoBDcQDAhFtjB4xT5lb8A3m1pIJ+j+ibYjY0YU3pucEcvUpW
         5Twx0jAMwvHgSw1X6oDQ+JDrbxcp4qNdh2qBMxJmcmlmSG2MsNyd3pPAkdXndKEzz7xc
         JK/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791833107; x=1792437907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=;
        b=ZDQoBfQ+rT9HTYW4+uiEMdJEdlujo8CsZRIsDKUY5oArj8I85efzyKg+TEET5Dvmo5
         pX8kHWIcYG1g60TGWnazVOVQ4QDtCjaxBu8HnGfktOxCQ4Lt+XbbZ52YeuPnkIv3t7R2
         uwFmKMTOtJCGqfeHNT+II5rlsIL3roBWl7q/O8wE/TE74OO0CEO5KB9D2iSPJSgArjF2
         2HhXwy+Fh8gTtW2W1qVRQSrC4nSwdodECNgkqlAXpOFy7Xhe7mc8Jj9gZG3HSkyU5HGz
         r7VfljbgJDMs7uZbf12lF8rEBMPBN/p2Ry/OWRliy2Kt/rDNM5NXAQl9D0YmoNndxrLb
         FW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833107; x=1792437907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L70Ii9x5C+z302d/Psn2CqblJNvQ2CMmeLwkxN/XibM=;
        b=o58b+mz18tRSs0EJFWG5KueNWKn4MyHXqMbZXJsBKZxv68GjnMg9tRNbC8QPNcZeMW
         lRjS30L+MULOC7cKt1dyBK2FMiCEXCn/Q3RPHi3sKoKW/Wm6ABSiWyOZ2kme/vBbdFEq
         phmMubIV5UkkMxkk/vExidcWrAzdQMJ+/ut0oYbckAREc5E2ZivpIztQRnlPFlUMAgYy
         wb7etuB6LR0JzxbLiMv8T0VY3dPcVgXzIh4cbh9b7hoh52yudBkDi6Qlerju8+kHyttN
         Sv0t0W1AOSJGrkB+c4G8j9B+DMYKtTd8iB4BCpOwzYG6NdeFaHepCq8WzdvgljL7ybO6
         jNyg==
X-Forwarded-Encrypted: i=1; AKwUvByCnSltsRUEgz1FRalDXhbUrZtEwQbgOFw4nbAZcIfdx7mGH/+8dn5/szrmsWo6FBCnOhjpQbK9dpyy@vger.kernel.org
X-Gm-Message-State: AFq9FYI9mkFzewg9DIfNGS3Nze5Z01TE/KzV9GEns+Q3W4DujD8bzcA5
	JId9yRLJ6Ji6HumWgNnVDQsGuQTH6WK+/WovxWC3gwCU3E4VTvdD2Y4Lqp3Ho1SVJBzFYcarAa9
	NoGMJw44tT07p6RfC88Hz3RU6YsK7SAg=
X-Gm-Gg: AYBFou3807tDAQcvvPIeUhuz6NhDyJ8BtXjrFOX34u2q26ojGU9de3IezrQY1WPCSh+
	aobI27QqsK8/g5MccoEgtZmmWK90G/um84bKLoXF6SGv7jB9b2yIDv9TKcEhZO/GaJn1DWspsol
	YMDrlopMBBXi+wjw/s0pU42FtBJmTCiXDaBEldUj9BrwbVjCaYXX/dOzLUrWIExVVcBqghq0zBM
	1ipHD41xJ9Q7TKyZPERIbliQ2l9SLHetEFe/kqOSVLBieCW2L/uzW/kThjEKRAQ4VQ3rkl9mAAm
	7TlnSLnLDj6wT0dA8xA97l544oaMa/WAN2emgTuw8Ay1nTz3gxb6cPrBdw==
X-Received: by 2002:a17:906:7948:b0:c29:60b7:3f14 with SMTP id
 a640c23a62f3a-c31aa02b449mr966426866b.46.1791833106527; Mon, 12 Oct 2026
 12:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008175225.3375274-2-coiaprant@gmail.com> <179183168522.434549.14619345397319265452@kernel.org>
In-Reply-To: <179183168522.434549.14619345397319265452@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 13 Oct 2026 03:24:59 +0800
X-Gm-Features: AclHuK_IK-J3xdjBLHul-e3CTuwWO6mo07_5PjrwMDoCpvY_M9ekvq5ssPY4yMg
Message-ID: <CALj3r0jTq+wztO=-TMDkNTM7OFkB4UHMpugTnQ+YPiuWYD9MFA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/6] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	david.wu@rock-chips.com, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. Both points were raised in earlier versions and are intentional
for this hardware.

<netdev-bot+sashiko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=E6=97=
=A5=E5=91=A8=E4=BA=8C 03:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] xpcs_get_state_c37_sgmii() now does a non-atomic read -> act
>   sequence.
> - [Low] Concern: in xpcs_get_state_c37_sgmii() the ANCMPLT latch is
>   cleared (pcs-xpcs.c:1112) before BMCR_ANRESTART is issued (pcs-=E2=80=
=A6
>
> --
>
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> This patch sets BMCR_ANRESTART alongside BMCR_ANENABLE when configuring
> C37 SGMII AN. It also clears DW_VR_MII_AN_INTR_STS before AN starts. In
> xpcs_get_state_c37_sgmii(), when AN completion is seen with the link down=
,
> it clears the ANCMPLT latch and restarts AN, so that parts such as RK3568
> can recover the link.
>
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index b415b93d77c15..6466e0ff2a98b 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
>
> [ ... ]
>
> > @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xp=
cs *xpcs,
> >               return 0;
> >       }
> >
> > -     /* Clear AN complete status or interrupt */
> > -     if (state->an_complete)
> > -             xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> > +     if (state->an_complete) {
> > +             /* Clear AN complete status or interrupt */
> > +             ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INT=
R_STS, 0);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Initiate the next round of AN */
> > +             ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_=
ANRESTART,
> > +                               BMCR_ANRESTART);
> > +             if (ret < 0)
> > +                     return ret;
>
> [Severity: Medium]
> Can two callers of .pcs_get_state() race here and restart a negotiation
> that has just finished with the link up?
>
> The read of DW_VR_MII_AN_INTR_STS at the top of the function and the
> clear and restart here are not atomic. phylink calls .pcs_get_state()
> from contexts that do not share a lock:
>
>   phylink_resolve()                   holds pl->state_mutex, not RTNL
>   phylink_ethtool_ksettings_get()     holds RTNL only (MLO_AN_INBAND,
>                                       no phydev)
>   phylink_mii_ioctl()->phylink_mii_read()   holds RTNL only
>
> struct dw_xpcs has no lock of its own, and the MDIO bus lock only covers
> each single access.
>
> A possible interleaving:
>
> CPU1 (ethtool get)                  CPU0 (phylink_resolve)
> xpcs_read(INTR_STS)
>   link=3D0, ANCMPLT=3D1
>                                     xpcs_read(INTR_STS)
>                                       link=3D0, ANCMPLT=3D1
>                                     xpcs_write(INTR_STS, 0)
>                                     xpcs_modify(BMCR, ANRESTART)
>                                     ... AN completes, link up ...
> xpcs_write(INTR_STS, 0)
> xpcs_modify(BMCR, ANRESTART)
>
> CPU1 acts on its stale sample. It clears the newly latched ANCMPLT and
> restarts AN on a link that has just come up.
>
> Before this patch, a concurrent caller could only clear the latch. The
> extra restart is new. Unprivileged users can issue ethtool get link
> settings.
>
> The commit message's reason for clearing the latch before the restart
> assumes that get_state calls are serialized. Does phylink actually
> guarantee that for these callers?

The C37 SGMII path needs to restart AN from xpcs_get_state() because
phylink does not call .pcs_an_restart for SGMII. On RK3568 the PCS does
not restart AN by itself, so a link that goes down would stay down
without this. The same pattern is already used by xpcs_get_state_c73(),
which calls xpcs_soft_reset() and xpcs_do_config() from the same
callback.

On the non-atomic read-act sequence: the concurrent caller can only
come from ethtool or mii_read, which do not hold pl->state_mutex. So
yes, the sequence is not strictly serialized against the normal poll
path.

The consequence is a possible extra AN restart on a link that just
came up. On this hardware an AN restart is idempotent and safe: if the
link is already up, the PCS re-negotiates and comes back up. There is
no state corruption, no register left in a bad state, and no way for
the concurrent caller to observe a torn value, since each MDIO access
is individually locked.

Before this patch a concurrent caller could clear the latch; the extra
restart is new, but its only effect is to shorten the window in which
a stale sample can be acted upon.

> [Severity: Low]
> What retries the restart if the xpcs_write() of DW_VR_MII_AN_INTR_STS
> succeeds and then this xpcs_modify() of MII_BMCR fails?
>
> The latched ANCMPLT that triggers this path has already been cleared. No
> restart is pending, and xpcs_get_state() only logs the error:
>
> phylink_resolve()
>   xpcs_get_state()
>     xpcs_get_state_c37_sgmii()
>       xpcs_write(DW_VR_MII_AN_INTR_STS, 0)    succeeds
>       xpcs_modify(MII_BMCR, BMCR_ANRESTART)   fails
>     dev_err(..., "xpcs_get_state_c37_sgmii", ...)
>
> On parts that do not restart AN by themselves, the link would then stay
> down until the interface is reconfigured.
>
> The commit message covers this case:
>
>   "If an MDIO access fails at this point, it indicates an unrecoverable
>   hardware condition until reset."
>
> On RK3568, the MMIO-based MDIO back end added later in the series seems
> to fail only through pm_runtime_resume_and_get(). That failure is not
> transient. On other XPCS platforms the databook says AN restarts on its
> own. So the documented behaviour may be fine as it is.
>
> > +     }
> >
> >       return 0;
> >  }

The latch ordering is deliberate: clearing it after the restart would
discard a freshly latched ANCMPLT from the new negotiation. An MDIO
failure at that point means the transport is gone, so there is nothing
to retry.
