Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E833DEF7
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468571; cv=pass; b=IL+VSBmRxORTPGjI/8Qnhd8tkO6wu0Tab4M8oWHiZ3NsfSVIbRTNDxsLabOZ04T2OC70PS0OT4q4RYq/HLKiowNQCJqSqzzCAAmKGT0w0EWPnv/e1Vm/kG2I78AwfdyFlezthMrBKilG8Eb+u5aqy58qt54G1gp/KcppBAF49gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468571; c=relaxed/simple;
	bh=lVH5yPIi3/pyYRXwtAiWL+HzSoiC/igDNveot238DKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAL9fmI1UJGg9KJGLBJoNYgGPsdda5H7d0uCsdKQe4S+NZKRNJk5WJR37TKW8/pPCWgoI/DMs6eIf7tD7lP0a1N1ohXxkrwpZUKGR6dmPJstRewJSfAnyWb/4UHTdaThevQaB5wi8/xlfg44KP/sdHLVpA1CJPOVq0pLNat+/cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oI5Eek8c; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oI5Eek8c"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c28e3998eb7so254975066b.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 03:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468568; cv=none;
        d=google.com; s=arc-20260327;
        b=k8QlyqLlu0RCpqNZjZkZ+7a2qogiZGdEi2YlPYht6fJOhlwRZWFsul93pDoiWcB5sR
         8eIDu5oVNlkpcH80ELA+8HbmWScgwZH/+NMbDmL5Fx7l4f8/8M6ch66QK9XNJHQvxEsv
         M7FU8eCO7J2hDVsK+8FC3y9J0wXXkmrtZMSNDY1oK2UIKFfcNycdfVPW8EDtwSJHj559
         ZqKWjIyU+VPuS/m+/LB+/O3E4e21MJCbU2Dwlgh2qf+tr3yfZlJ49OuIgWHGhYHYhhQE
         Wg4XsnTeDSdmhc9WoqZAMsHk3ll19+sBZDZsT96U4uol/QN5qSgTCdoRykUlkNKGRmpV
         A56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EybIxRu7gh0/uGvNpGNQAsB/2hq7wOMr36eqhjWJ4kA=;
        fh=be80aWSkapP311uUAQQTvoQhS38Xs0C/9GnHBwSm6Tc=;
        b=hOYlqZTg7H5vrNxJdzQgeZU71y0mHVDEkKDuv3T47Bm6yowAIowldqOS90jQdoz8gX
         cF4QfGxVIY+Zj1MFoY8Hf8Chvl4EEOUtVqJXMM867EBkE/Il4advEuKuP/rnN/nbfR51
         kOoAVufz4MYbB+BLrNkRpmity7dsyK7UNpFZV6eZE2psg+vPO3ETWFi6Com69cH2imLJ
         2655H0P26DU0ArxEX7q0IOHdl/0MovL0BMiVnifYm6zhNG5aFpjwFt9EUisAQ+Q84ly3
         oqiimdHLlmUpfBoZpVM6133VLHqsqcAv6CbIoX2h/l69Zq9sKuIUpiSeSSHxSs7jNwLg
         /XBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468568; x=1790073368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EybIxRu7gh0/uGvNpGNQAsB/2hq7wOMr36eqhjWJ4kA=;
        b=oI5Eek8cYA9lxAOcGswi2IVzCHaobcbDdRAU95cpiSIzjidAqr00+KHoMP4nnev0kC
         DCaPlKUJaYuOvgFJZ8MfyuL1OroziydVuZZ3NYkI0ofTzvqWx1XxiPj0AXnPwckolpVC
         vpi9Yq8xqUEqhY2v3WXXwHXeN61gHgQmZN60MRX2tkc53lnwW3Tco34ZecequdAKzvE0
         7eRDvZEAxbJMl0VAg34Yv0uBMoYn7btIBrnWsbyk5Hy+ACo01BKt2jTQ+B6br1cdjYKI
         9lnJftlHz1CMEN/D22WR7JjAUxMb9IxnAqLeS9HQqYQ4REuh13AF3hLDrj+K22MDSsXR
         0log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468568; x=1790073368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EybIxRu7gh0/uGvNpGNQAsB/2hq7wOMr36eqhjWJ4kA=;
        b=DTSwKRBtMQy0R/fm2YxofOtvVzcm8JnnLWJea/TUG7wfYQExYbm0wfjhAzh2lzusxQ
         vAqLb3ZPWmO6PtRB83BlzvbiiFxGOp7mnkFZL8AVLtUAr09kwwy6lmjucEf9UcaGKiJ7
         knS/qmoQT0lwpHmg1fIADaA/OEH1DI2XsEYSGov+dgcTT4rVfhmqpR6L4CsAoeE9lmNd
         8Vutl/1BngbKxFHuO8cK++LTFfoWThiLm26X6FC52RpURNM2GNp/kfqdUHCHEdfFX+zd
         ztHNAEoXCljDQB25eZT65r4EYJzYvauXhv9heXnQ5aYPGaxFLcUADcdzhx01fcsrVH1K
         NrDw==
X-Forwarded-Encrypted: i=1; AKwUvBw2llRvyzdCyHgz7OVJvVLNYw8/FZIT7BSARZto46u8h6eEZMawShpHYxHAPtKkEHEDBO3waER9Hl0y@vger.kernel.org
X-Gm-Message-State: AFuF++k2hpIZjIWXyMlZtYaG3uWIKaJEcMJxyfXTafzlam8v7xRGPGFU
	0iD2AHBiTtyyCwxENrrRHmKddRmE8lJmd4jTfltF3wJxbKlbsmGaGdt3WEdXTV8u6vER64v0LBB
	1Wc6IazxzITGRmhzL1HDC84nLvYVvAnU=
X-Gm-Gg: AYBFou3vmpcpTxVQ8Hf6BHMX7Bh3RN0YeGU84sTtLOMTVUlgonUvhSU8H7BEjo/pfvs
	ZHMoSyqilWqncP+sUDLKD5dO/Lsfved7R8F7vb/Leb+FRZMwUNjNUhIg2JWrNhl/pdQxlBugHhc
	1/rqW04IccTATR9bqpja9UN7D/EI2a6skMyvftXJ/bzuPfqPtCbVQXGBfyVfr8ITsPl1epjBNy8
	ZBDR1j171iiaSAWZ7YcJ2FpRR4Wu+2gxrkhOOIkzmXFmdPVC+EkOPB2nxFmNUhqFip+wv6fy6gt
	F0LC72C9GVtWb4ErmlqquTSfr4CkmXHiRSKXlVPtKuoyaDxawU2dEkfwwA==
X-Received: by 2002:a17:907:80c:b0:c29:1678:de36 with SMTP id
 a640c23a62f3a-c29b8756facmr375515766b.46.1789468567393; Tue, 15 Sep 2026
 03:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185849.907479-1-coiaprant@gmail.com> <20260913185849.907479-7-coiaprant@gmail.com>
 <20260914194421.944211F00893@smtp.kernel.org>
In-Reply-To: <20260914194421.944211F00893@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:35:54 +0800
X-Gm-Features: AcwNN1VJezYkhl7wtVaby68YugY1136mwuoA1MxlIq9aSNGHJATVbB4iAMAwGQo
Message-ID: <CALj3r0jHGpLSRgErU5Vy3xO-CKMsdY_6ixAczeapx32yFbSziA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 06/11] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, 
	conor+dt@kernel.org, linux-phy@lists.infradead.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=E5=91=
=A8=E4=BA=8C 03:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Unconditionally applying the RK3568 SGMII AN restart quirk cau=
ses an infinite interrupt storm or workqueue loop on standard interrupt-dri=
ven DW XPCS configurations.
> --
>
> commit 78eb5488d0c0d3fe9f609e56e59710ced52856fa
> Author: Coia Prant <coiaprant@gmail.com>
>
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> This patch adds BMCR_ANRESTART to DW XPCS when configuring auto-negotiati=
on
> and when the link goes down. This is intended to resolve an issue on some
> platforms (like RK3568) where the PCS does not automatically restart
> auto-negotiation when the link goes down and comes back up.
>
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 0337e2bcc0125..8c3875b6985b9 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> [ ... ]
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
>
> [Severity: Medium]
> Could unconditionally applying this AN restart quirk cause an infinite
> interrupt storm or MDIO polling loop on standard DW XPCS configurations?
>
> If a cable is disconnected on an SGMII port, the PHY may continuously tra=
nsmit
> the 'Link Down' AN configuration word. When the MAC completes AN and gene=
rates
> an interrupt, xpcs_get_state_c37_sgmii() is called. It clears the interru=
pt
> and unconditionally sets BMCR_ANRESTART.
>
> Will this cause the hardware to reset its AN state machine, immediately
> complete AN again with the PHY's continuous 'Link Down' word, and fire an=
other
> interrupt, creating an endless loop?
>
> Should this behavior be isolated to only the platforms that require the q=
uirk
> (like RK3568), rather than applied to all hardware using the DesignWare X=
PCS IP?

Thanks for the review. The High item describes intended behaviour
rather than a defect.

The state you identified =E2=80=94 ANCMPLT latched with LNKSTS clear =E2=80=
=94 is the
normal state of an SGMII port whose link partner's media side is down.
The partner PHY keeps sending a LNKSTS=3D0 config word, so the PCS
completes AN and latches ANCMPLT while LNKSTS stays clear.

That is precisely the state the restart is meant to handle. Without it,
the PCS stays in that state indefinitely and never re-runs AN when the
partner comes back, so the link can never recover. Re-issuing ANRESTART
on each poll while the link is down is the mechanism that makes
recovery possible: on the next poll the PCS re-runs AN, and if the
partner has come back with LNKSTS=3D1 the link comes up.

On the poll rate: xpcs->pcs.poll is set for RK3568, so this runs at
phylink's resolve interval, roughly once per second. A single MDIO
register write per second is not a concern. On interrupt-driven parts
the behaviour was tested by Wangxun and no adverse effect was observed.

Thanks,
Coia
