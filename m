Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BE38DC4A
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003163; cv=pass; b=rdZ9ZAPOfqoZBhYYPXNhESJO2dqZUW2f/Cs1pz+VBy6uE9d+gT62BdrBFi1qswx+RzaX1Y32dOmJbrG0B7wJGSVI4HI6LfRl7pJgGo+myTsNT27JVEqHHwPp1sCnHWMsVEYnvOYf/gK1Pu9gscv6snTY0/7CRhdy+N8W9juCSmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003163; c=relaxed/simple;
	bh=CZqe83CdbrlQPi6FPgQSJvI2rkWIn+KuZ+8/6Lb2N88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P/5hcUtFGd0f4VEa50Xso3PmhB84CbEvcyUZLuM2UfkVruUpi0CdSB8jKXzdCOCjfq3iC3Ta4kiVyikL7iz9RPdGK6+Zaf2B0EZYVXvGT917Gbs4TqjJO0nql+s1KDixAA0FKMIQ6Mt7lAvZPAotXjCKk7ZyhFl18GgK8SGpMhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afSJoFJo; arc=pass smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afSJoFJo"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c2dbaf828eso658409e0c.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 00:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786003161; cv=none;
        d=google.com; s=arc-20260327;
        b=WmHajEEuPAzowLRWxeWWZ2FWVPp/YM+0LfRH5Yys2SocEnww7n8jPgSquvDj8eV3DB
         FeLpG4w06earo50aHK0btDeMXBKWCE3D25h2xgII9i0IJYafwBouhbIFKdP3ZSO0S8wG
         yWCv34HFfSuYry3p/UmEoCMNXdDadv7bAtdekcb9yBLB0VPFduzkVsFzeRXyxrgG7tub
         qfE8cIQE6JsIBfmStOQshISRy6R2K6TLBj3mGh3GUUS4NI2iTzgThH3ya9ErACiozrWO
         1FZkgHb2qzSloxIdNOaeM/Ql2fiG/nwu2lHCY0zXpzoagE7p6HtDAaeGpWsAGoZ3uvCE
         MPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59YY+DXL2yyj7pyfiGeJfPdqCY+fQlQZUi24hVUCSOk=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=TBqFJRGpySqWSIkU6sL2402ywfEdQJV7Iso06h0dhZ65IVzoTQ/zar3nnbdx6EVDfr
         C0EPXxb06FLqfB4zeCI2otViA2M3XHrKMgnzDUqdPYzU/KGLTDc8DpUY2n2ghXpCrr9u
         XACgIdf9upAE50qIBW10lR0hWXsjTg277JG4kKhKY/mLa3pxUgNEmTli5QvAuIvmbsnR
         I5dL6HYMWy2oTDOaUCiXu/8W5ejK+5O9MacykoaoP7Aqj89fM3ogsD07jDZQT162nMsx
         AZDYRu7gGnwEkrwtkxgfrzlbkngzwttDl3qz3AynoWs6NRbLnU1Dt9grG0lryixxBTfZ
         hV5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786003161; x=1786607961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59YY+DXL2yyj7pyfiGeJfPdqCY+fQlQZUi24hVUCSOk=;
        b=afSJoFJoIkxqE17p4QHqSQ0OV5UM5J9U29f+0xW9SGWCrV/JQ8yiMnLd/JbxKKDI8l
         kUC44o7RacdeJBXzfYpTKUGPMzlttD6UNtHJsPv7i5kKLrC1V+1oL0+4yrtnMBrzIpO8
         hJ0T7NCqCId4i+TyOjKm7p+YTnbXewKWrTxCqqTWUAly0y8uCxYsZAJ0ihhCbpxfAMJw
         4/JVaY74aY6gXhWckL2zUQZ/2NIxEWqURJHuqHjHTs3p+lSFnbLarPsQm1O5PySWUSD3
         Pr1r4OricXuaQCZ8+Sw9J0v7h0S2/RS5I46VzKZr3g9Ocg2sXeuX/eroTFrH1Bgl3Xs4
         3TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786003161; x=1786607961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59YY+DXL2yyj7pyfiGeJfPdqCY+fQlQZUi24hVUCSOk=;
        b=XlwIRD1ZeLDgaDRWsCadw6f35my581KkOaS9C8lFgjJAES2SxyaqmqjC4wmp3XFsCZ
         xwnmT6IbpV/E1I8NCrhKsmBZDMNxVw0IYM2MtES49JgJevv1OW8aGQMKl8guMywyeQF8
         WAQwcTRp035U0U8Ig3FCO1CVsXEaNIRYdpwzpcGACE9CN67feNW2CeO4fMHY3+8+irB5
         x3tNeadCKXyQr3wYkAUswfXCB+vGoYnrtEBTA5eYdVxQkkpBxLeIVhBm+0yD25jlJcDi
         r4TPnErNPlYWYU/2vz4otbEYiw7AT9ggQhM25lKapQTfHLHD7E2HyeeypSadDa6tJAPh
         HRMA==
X-Gm-Message-State: AOJu0YxdwVucl6rrCDCC9Miqb6UKKwwEehwyM09r7QvlUKhGHtdAhQ/1
	Wmtu3S9IvkNfkaJl2SEsm6k9IyRpLVNYlT9NMyNgXcZY5C8IOebkr+YGnYqqPkLIjKvPELdfHAv
	oLzP0kLLjrHVjpBgpe8KtyuoVZ3vwkFg=
X-Gm-Gg: AR+sD10qE7d9NqNaVulnHbSLbKpLUBL0gZkxrG0E9luDTeCQcSKDCnbbrrJRYul9Mxf
	oxhCI7VMVsXd0ezjcM+fbuxBjsU1UfBt0lislV9se5VHpWjd44k1YYwtj5og3aBCJRCHhnUvRmo
	LpK8S6GOXESKEnhOp5sltZt+U1j+8vwQOMPpCGInDum0THFxn3PeJfAXHJcSX+6Ntu3qrC7XwTA
	zGLxYd5RTjNHtdLU6EELLF8h4eXEz+E2YfkSDNqPvbZAYk2jdQY0Nm56qYiVHYcdh5woqAPQZ3t
	du7AEhiulBE/H93kVxtx7fhWtSGcJUdekPQPfdJtSsSmVvXmPvPVkpSaOw==
X-Received: by 2002:a05:6102:4b08:b0:739:4fa1:50af with SMTP id
 ada2fe7eead31-760e6aca466mr3111728137.2.1786003160956; Thu, 06 Aug 2026
 00:59:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
 <20260805-anacapa-devlop-phase-devicetree-v4-10-5d67e0efa6c5@gmail.com> <20260805132859.6F6DA1F000E9@smtp.kernel.org>
In-Reply-To: <20260805132859.6F6DA1F000E9@smtp.kernel.org>
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 6 Aug 2026 15:59:10 +0800
X-Gm-Features: AUfX_mzuaNQ0eCcXnJkxAnzIOeQjXhrujNKvSlE_ciN8OvZiMygiEuyy-Lxy2UE
Message-ID: <CAPBH0A_AtoLWYQ2TCXc_AhcgTreOppK8=to+hn-SX7kkwtPs4g@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse monitor
 GPIO expander
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=885=E6=97=A5=E9=80=
=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Meaningful code and commit message mismatch: The patch modifie=
s userspace-visible `gpio-line-names` for existing `gpio@22` and `gpio@24` =
expanders on both LPDB and RPDB without documenting these changes.
> --
>
> --- Patch [10]: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse=
 monitor GPIO expander ---
> commit dcdaa17a966db9099c36ac9d58c5a7e8e75f9c5d
> Author: Rex Fu <rex.fu.amd@gmail.com>
>
> ARM: dts: aspeed: anacapa: Add LPDB fuse monitor GPIO expander
>
> This patch adds the PCA9554 GPIO expander for PDB fuse monitor signals on=
 the
> Anacapa BMC board. It adds definitions under the i2c8 multiplexer for bot=
h
> left and right PDBs.
>
> > ARM: dts: aspeed: anacapa: Add LPDB fuse monitor GPIO expander
> >
> > Add the PCA9554 GPIO expander for PDB fuse monitor signals.
>
> [Severity: Medium]
> This isn't a bug in the code, but does the commit message fully describe =
the
> changes in this patch?
>
> The commit message solely claims to "Add LPDB fuse monitor GPIO expander"=
, but
> this patch also adds the RPDB expander and modifies userspace-visible
> gpio-line-names for existing gpio@22 and gpio@24 expanders on both LPDB a=
nd
> RPDB.
>
> For example, it renames "RPDB_I2C_TEMP75_U8_ALERT_R_N" to
> "RPDB_I2C_TMP432_U8_ALERT_R_N", and adds new labels like "RPDB_SKU_ID0" a=
nd
> "LPDB_VERID_A0".
>
> Could the commit message be updated to reflect these functional hardware =
label
> changes and the addition of the RPDB expander?
If I need to send v5 I will update the commit message.

>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.d=
ts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> > index 0eb547ad0ec16..f09dd1abe77d8 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
> > @@ -8,6 +8,93 @@ / {
> >       compatible =3D "facebook,anacapa-bmc-dvt", "aspeed,ast2600";
> >  };
> >
> > +// MB - PDB
> > +&i2c8 {
> > +     i2c-mux@72 {
> > +             i2c8mux0ch0: i2c@0 {
> > +                     gpio@22 {
> > +                             gpio-line-names =3D
> > +                                     "RPDB_FAN_FULL_SPEED_R_N", "RPDB_=
I2C_TMP432_U8_ALERT_R_N",
>
> [Severity: Medium]
> This is where the undocumented RPDB expander definitions and gpio-line-na=
mes
> modifications are introduced in i2c8mux0ch0. Should these be split into a
> separate patch or documented in the commit message?
>
> [ ... ]
>
> > +             i2c8mux0ch1: i2c@1 {
> > +                     gpio@22 {
> > +                             gpio-line-names =3D
> > +                                     "LPDB_FAN_FULL_SPEED_R_N", "LPDB_=
I2C_TEMP75_U8_ALERT_R_N",
>
> [Severity: Medium]
> Similarly here for i2c8mux0ch1 in the Left PDB, the patch introduces
> undocumented label additions and modifications to the existing gpio@22 an=
d
> gpio@24 expanders. Should these changes also be mentioned in the commit
> message?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-anacapa-=
devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com?part=3D10
