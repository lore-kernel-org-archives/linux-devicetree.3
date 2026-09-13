Received: from mail-ej2-f9.google.com (mail-ej2-f9.google.com [74.125.228.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E682E92BA
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789315147; cv=pass; b=bI64PX/i5Hz7QzOql5IpTjYQVZML6zkiyu5f4sWttAmgXkEUE3MZH87WXxOyQie3ip/pPkhetXdQjE0O3A0mMnhlRa7ptW4fmm2my2zi09qRMlcPuSar0rZpTqOuTg4yEoW5KWk0sRjUNp8KOtk7snrUnJqhX2ZCzQFP2pmkf6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789315147; c=relaxed/simple;
	bh=GwskXz/4lUAOU/7p13jVmuQ8myr6xowZ5XA7iUxaLtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tu1B4rSKO1z+vAIuuvzdM1z6GAMGVGDNq4Vvx7w6Vo1pBJvNYfwRJKrdpTc5YJXYKmgj/1tJTKlzDtCiWtcO2lIJBeuhlAc6QV8WV4bBH0qb9kzMz47qONEqEasD59shRElybBm20xAh8Gjxqq/fT82Hiq/xSU1WD4ZBh/z25HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWg1nTvY; arc=pass smtp.client-ip=74.125.228.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWg1nTvY"
Received: by mail-ej2-f9.google.com with SMTP id a640c23a62f3a-c2630e38cffso154651566b.0
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 08:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789315144; cv=none;
        d=google.com; s=arc-20260327;
        b=V39N0wpmc6cPVPkjISnWMxpKdtiHqkwdXmAoN08TUHIb9vjEt23qPle+vu+36HfHSM
         5mpwXb2gpVrWaKmPUNA6oZswIuiumx4VvoZhjxLK8den5sAfh6fUTy8GgTF2PDDrGvG4
         /BnJRe0kLnsGUOIY0hT7mQSTUDf/r3WgXbOORUc0CZuknCdecwNtCijpRhXPhzB7vAE5
         Sl+bM2C1St9xkMjcF3nZcxamC5QEuc5MiwRfBxTSJJ/XPvMUwJrKahxPjg4dge2Tx7QA
         OiVxngcFIYnIJ+I3ApInm6kDFAABOEU3UIiVhTQNb0gxyPf/xFta6sVn3glUGwtr6Jav
         Ci1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        fh=xkQ06Lbfhy4mPanl+IkD1Cy9VV74JXEEgs9hJXumSLk=;
        b=hwRvhH99wCsHccjk4H9X61bo2tXgd7GBesjih9q094Rn/gWCokvi3C59G8qEy/HRll
         ppDHK/XXeuWg/+tMXIoih55pO8c7hR2EFnSF5vB7KhTB57JhDniIUmNIzhga6wFnCDZE
         TlM7SOH1/UDmpqb3tfWTaZ2NSspx3oB3vM1Znci38Zv/BtIwnkOG3EptPTK1mrpshyaB
         6w9CA9oOgHi/XziUaX1cy/Cs37zryuZ61OA8xDV+BKVHy0/gn0buQCvix2ew2Fr4udYW
         YzXfWfchCWYQMOgKH6GUcQKl0z40fkn+v34qAXgQ1JvCA/uiKFpS32XFhoAJljMkrkoK
         EAag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789315144; x=1789919944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        b=WWg1nTvYL+9Ouz7+KipH2gQpYVHVyY/n0XtPsa42WcbfDxm7cSdOQFUtSRwA5Hcyfq
         2LG//KqwbOEZongiSKa3DXoun1ndDqPtePsK2tE945hkt+jBt0Ot6dsW9CWEKmHHFs3t
         PYB4aiQZBycQJkDR6IlvPx7RhIKI9e3hgQOin/DCJV9mRZsAZBLv/Xkl48YaWmRrE0ej
         RRy9AFVTF4Trvxnh5Q8d8u9xI621lJAgGSLdUEceg3vnhLqjuf1N0kRl0QOmKY9Gp/PE
         57vw+mzR8nS3uf9DN4u1gOv07b6eYAVa1dE07EL4FVChQKez635fL+vGPRl8vdXLKIJ4
         uGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789315144; x=1789919944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtQwQGv8F8oJXhyzp/mmJrRotQmL7KJWiE3zhpMTfrU=;
        b=B1oqWViLz2jHLl+m/aDBxjYvlc9ZO7RrSGVVcmLg+OrogvUWVAsaMWDk2ypetocayx
         Yo5Xhi8fqlDRbT2R0MabHT1IAItwTZoNJkjYgzsPcp7/JbHRXNhtiG31I/Y6q33tQJ9m
         R1Uc0DjYdrRBW5pdIGTK3FF2B8xzTv6y97n385/nqKtvEPLzmBNnIo2MVU3wmhoB5cYs
         nvC934PbwyDzUhy12hMSGdJdD817+tVlOH8waniovEbm7BUPOBg00JJG7pAZvxl9d6tY
         2f55oXd5KINwP6pVllpB1AQuBGv//xL4x6cfb/aviFcV7O3X50nF0F280oIMzSh0wkjv
         Azzg==
X-Forwarded-Encrypted: i=1; AKwUvBwFH9d/kaMIRmza+Da24wCYkmhTgX4lJAp1Wm6dZLxEtYbBWbVyU6leA6fBb6EknJadXFwiMT08fa2n@vger.kernel.org
X-Gm-Message-State: AFuF++mY+yMfisNppiO37WkdSDkugus9gTJrmjniwoXcKaQn0zSIhRSP
	v7X9vS7Cw3NQFAQwnhIDVgy4VymkQCmQvwave40bsynt1M8hlVzUxQBUIg+svUJu3PGjlTXgOZo
	ziGbm4hbplVOIa5bOV7891MdKPgS5yv0=
X-Gm-Gg: AYBFou1D1TlyYewkAicFWEBWrMFmCXcYnbBI7+ejIZb03ACXeixVjWZvUf13P2WhPdm
	EEM54W+5OsS6ueRpkm6ftqD4IxarU9Zc+PKDgwrHAw7WSBgWNbHm7K2Li8KKtHgiK0CILvlT9UB
	zXQzEIk0KVefO2nA5smF81SZnr5iPt3xMQdUke4aIZswZT4MGGX22yx/N4qydw0bUUNbhUEjOX0
	QTGWzUKe0HwgaWnAHhcDdUXFevOo9ZyVNBQCSPfaRHyxBrWh/YiOpv+ddthEF3Jt1RHOz9KGzEO
	v4beSM0So8ZqDe9QoA/wFQkonYx2xaHe2z3Zq2JNpoE8m28gxtF6GrzFeA==
X-Received: by 2002:a17:907:1992:b0:c19:6104:e5e4 with SMTP id
 a640c23a62f3a-c2985769204mr414384566b.20.1789315143958; Sun, 13 Sep 2026
 08:59:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153713.2572547-8-coiaprant@gmail.com> <20260912201327.127042-1-kuba@kernel.org>
In-Reply-To: <20260912201327.127042-1-kuba@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 13 Sep 2026 23:58:51 +0800
X-Gm-Features: AcwNN1XAulIb65_nNmPJqWeqm6n78LTScmm_BZJth6ooN4ELABvEb2CnyYjxeFw
Message-ID: <CALj3r0gRtJJMzZKW1DAyYJR3WQUX+JsBNH23VULhgLvopyHADQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 06/10] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, vkoul@kernel.org, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, romain.gantois@bootlin.com, 
	hkallweit1@gmail.com, neil.armstrong@linaro.org, linux@armlinux.org.uk, 
	shawn.lin@rock-chips.com, david@ixit.cz, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 04:13=E5=86=99=E9=81=93=EF=BC=9A
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> The patch sets BMCR_ANRESTART together with BMCR_ANENABLE when configurin=
g
> C37 SGMII in-band negotiation, and clears the latched CL37 AN complete
> status before doing so.  It also restarts negotiation from
> xpcs_get_state_c37_sgmii() when AN completion is latched but the link is
> reported down.
>
> >     On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC sid=
e
> >     SGMII), the PCS does not automatically restart auto-negotiation whe=
n the
> >     link goes down and comes back up. Without an explicit ANRESTART, th=
e link
> >     stays down forever.
>
> [Severity: Low]
> The changelog describes a user visible failure ("the link stays down
> forever") in long standing shared code, but there is no Fixes: tag and no
> statement about which histories are affected.
>
> The only hardware named here, RK3568 XPCS, does not exist in the baseline
> tree: searching for xpcs_rk, rk3568-xpcs or pcs-xpcs-rk under drivers/net=
 at
> 879e280b8486 returns nothing, and the glue driver arrives later in this
> series ("net: pcs: xpcs: add Rockchip RK3568 platform glue driver").
>
> Could the changelog either name the pre-existing commit being fixed, or s=
ay
> explicitly that the affected platform is introduced later in the same
> series, so that stable tooling does not have to guess?

The affected platform (RK3568 XPCS) is introduced later in the same
series. I'll make that explicit in the changelog so stable tooling does
not have to guess.

> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 0337e2bcc0125..50b9cdf94fdaa 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> > @@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xp=
cs *xpcs,
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* Clear CL37 AN complete status */
> > +     ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> > +     if (ret < 0)
> > +             return ret;
> > +
> >       if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED)
> >               ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -                              mdio_ctrl | BMCR_ANENABLE);
> > +                              mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTA=
RT);
>
> [Severity: Medium]
> Should the comment at the top of xpcs_config_aneg_c37_sgmii() be updated
> along with this change?  It still says the opposite of what the code now
> does:
>
> drivers/net/pcs/pcs-xpcs.c:xpcs_config_aneg_c37_sgmii() {
>         /* For AN for C37 SGMII mode, the settings are :-
>          ...
>          * 5) VR_MII_MMD_CTRL Bit(12) [AN_ENABLE] =3D 1b (Enable SGMII AN=
)
>          *
>          * Note that VR_MII_MMD_CTRL is MII_BMCR.
>          *
>          * Note: Since it is MAC side SGMII, there is no need to set
>          *       SR_MII_AN_ADV. ... There is also no need to
>          *       trigger AN restart for MAC-side SGMII.
>          */
>
> On the default path this same function selects MAC side SGMII:
>
>         } else {
>                 tx_conf =3D DW_VR_MII_TX_CONFIG_MAC_SIDE_SGMII;
>         }
>
> so the restart is now issued for exactly the case the comment says does n=
ot
> need it.  The new DW_VR_MII_AN_INTR_STS write is also a sixth step that t=
he
> enumerated sequence does not mention.
>
> If the databook statement no longer holds for these parts, could the
> comment be corrected, so that a later reader does not remove the ANRESTAR=
T
> bit as a mistake?

You're right. The comment still states that AN restart is not needed for
MAC side SGMII, which now contradicts the code. I'll update it to note
that on some hardware (e.g. RK3568) the PCS does not restart AN
automatically when the link comes back, so an explicit ANRESTART is
required.

> > @@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_x=
pcs *xpcs,
> >               return 0;
> >       }
> >
> > -     /* Clear AN complete status or interrupt */
> > -     if (state->an_complete)
> > +     if (state->an_complete) {
> > +             /* Clear AN complete status or interrupt */
> >               xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> >
> > +             /* Initiate the next round of AN */
> > +             xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTAR=
T,
> > +                         BMCR_ANRESTART);
> > +     }
> > +
> >       return 0;
> >  }
>
> [Severity: Medium]
> Can this sequence get stuck if the xpcs_modify() fails?
>
> The latched status is cleared first, and DW_VR_MII_AN_STS_C37_ANCMPLT_INT=
R
> is the only thing that brings execution back into this branch:
>
>         state->an_complete =3D ret & DW_VR_MII_AN_STS_C37_ANCMPLT_INTR;
>
> So if the clear succeeds but the restart does not, every later poll reads
> ANCMPLT as 0, state->an_complete stays false, and the restart is never
> retried, leaving the port down with AN idle until something calls
> pcs_config again.
>
> mdiodev_c45_modify() does a read followed by a write, so there are two
> places it can return an error, for example a bus -ETIMEDOUT, or with the
> Rockchip glue added later in this series the pm_runtime_resume_and_get()
> error path in xpcs_rk_read_reg() / xpcs_rk_write_reg().
>
> Both return values are also discarded and the function still ends with
> return 0, so the diagnostic in the caller can never fire for them:
>
>         case DW_AN_C37_SGMII:
>                 ret =3D xpcs_get_state_c37_sgmii(xpcs, state);
>                 if (ret)
>                         dev_err(&xpcs->mdiodev->dev, "%s returned %pe\n",
>                                 "xpcs_get_state_c37_sgmii", ERR_PTR(ret))=
;
>
> Would it be better to assert BMCR_ANRESTART before clearing the latched
> status, and to propagate both return codes to xpcs_get_state()?

The current order (clear the latched status first, then restart AN) is
intentional. If the restart is issued first, the newly completed AN status
could be cleared by the subsequent write, losing the completion event.

I'll keep the original order and propagate the return value of
xpcs_modify() so the caller can observe errors on the restart path.

Best,
Coia
