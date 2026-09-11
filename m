Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D403F4DE6
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 12:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128618; cv=pass; b=lEDRNO4dOTMfABG6TfLw7852CNmOE1fzjI0DDwisjXK7hmOdNmfBn8wb8EHQk1vE4Ov1KA7f0cYY6devYV1tSDXyPzxYRMN/xveZjI693fGO+sTqpoYrfO+cIYEXLpdoGIiBHgiA5y8tRhwzYzoaQ224NRGVdOpvVQsKEnuzYOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128618; c=relaxed/simple;
	bh=s2doigL40MavgJYYi+6feoNcgx2hlI7yC6v15ZMkMkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CluslAxh9AqjM4kVrtOj6TRm4POZ7MOPjK1ZWdUdHqJBzKQHw6uehwo7tMns8+qtv6dH22TguwWj451tRTNHrQUjE7J2IKhINlwetvVGzsHHqlGaPIxDFBYBxF698EDGcpp3PwS9uHYdzUH/H+oFIVWgfwvny5ZCyZsmOq0CjhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJnITs4I; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJnITs4I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso12813265e9.2
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789128614; cv=none;
        d=google.com; s=arc-20260327;
        b=c6PYXnupkV7eQzcA6gYwpkpawgBVNkenPbAhU05lXNZm4j6VdCFH64ySa7lz1y4N7D
         9dtoMIxN2CHXEV4V+O53bDp5zAZSefZN6N/kMyFyKDm3zrwkvuNA+ujWlPu3JgCf0wGL
         YflNIkLdTaPL3GOrSWffJIiin3e0LA4GxNNEeMq34E7oQL/ma38+KWoMeCOprx56A3KN
         Nt+oQlzL0JW96CBXP9a7S4H3WHJ/KpIGO39jiQdfLLckG6TwFtRKNL5U9aZkEvyR9NDr
         /0bKOuRZiUyRy8wz6gDgMCkuaHjUgh06W+vIhUwktgZf+CoXyTVpS2WjQ9WxToBTKXUV
         l+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3J8UlCAdANDfuXwyK75WO7Z8Tmd6ahY31LeseAlh3w=;
        fh=pkPpsUj+qcNKdaTb9hj0oHiIqRW6l/+sn0XS0Q43m/0=;
        b=RP9bLAhqu8YCDHshs2C8A1/5fYAGZXDOKHkeBhJG69mmj+KHLz+rjOuEkI2PpCXJZM
         V5CVOlxHKamfemKDDNQHXeUBMmz4i9v4aP4xprPpIIQYUUqZnovreqTYJ7fvcYZFxunp
         qrqe8ROcM7XJkI/TQGcS9GjgP+Ut61Ba2NRip3MpV2GBHtq0CIPmGQqzcnPRmlASwOEW
         g3pBLIhQgCgpsmVjwFoZQGpHyfXssGqdhGXvffFXpgM4XD13sMYZ67wyMfiVRbEqvJL3
         6WVENcWL54fMMVZnUTp21+L/9gqxdw1YWPpVTmtROwag4bZt+NnfaEjkYlipPZY2oyEU
         nuiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128614; x=1789733414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3J8UlCAdANDfuXwyK75WO7Z8Tmd6ahY31LeseAlh3w=;
        b=UJnITs4IWqEYDrj2zmCXCQ9ra2nHSN0SEipTyEWmaag3pjKibnEWj/gft1gkd0nF2Y
         qFOLDzFZ1SpnYGjxkHbWZO0Fvhh0k2/+TDGce9eiT/L7OkSFnXfoXPFCZFSz/mv2dm2h
         1caNsLn/NvCFT2Ue+lYIBGdC8b9vuhOWxXmXAQeYXjEdcRzUW7fA5FGJqQPXCDYppITy
         hPlJod6PbPG4DDizHOD6lit9aACK8bBfe8InWZu/D48PystHHco5vhUmRJdkdu2Q2I5R
         fk+ppuLwO4J3AbXFqb8WXmvCUwDDH0tlCeMzMg3SFt/vi5S5ZWSrSjd/26W0XPWHq7hO
         JMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128614; x=1789733414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3J8UlCAdANDfuXwyK75WO7Z8Tmd6ahY31LeseAlh3w=;
        b=GUeAnh3mm2YovWbGS8RS5K+fhFQfyiEnJ+wMzaxXNtdvpkUuJxeSsafbwdFyfpZa7r
         A+FLHfvgRkdOOInCgOiPnd8sh6c0GReuxMQpV4STxqTtFksJ8dx1sHNlvdFXIdmbC4Zr
         YX4I2fzJlxZygYpGp5BZEPlOVdp0TDRq17sq5G9wu7dZAz95qdXnoIy2qzHK+XOKXVSr
         5y+VUZ8OOg2iUgkTrYiy2HAwI7df2TklOQQaqURLW5FWoI9nB/phji54pAts6VPwvINc
         o5cfqd+aBzXuYTbmh0gkr0IAfu4FmkTpLcott/22DsGLLewjjiQIlA0Rz61jPHeq34cq
         TVgg==
X-Forwarded-Encrypted: i=1; AKwUvBzOEZYSpPpptIkgmLcc9NSw2XgvyVPyMTHkQ/6g2Jntq/igvpg89QytWGhw60noPA0iPMelOkh7Y7yo@vger.kernel.org
X-Gm-Message-State: AFuF++nPWl75EDtNl52UQiA++3a4WOc/PjFXgX+90chERI3mbwpUHQYE
	W0E2RnvtUkPKlXWvacIQVuh0d93E684yTM1/IONDTj5v8pzkLDn6lqiPPuKnu0X/XfAjQOS1E5C
	VDtg3J8sGumRyHUygnKF6rTigC+qxwaw=
X-Gm-Gg: AYBFou3+5KRYFK1lB//fKUKZgLcJJGjjkF9SDzhT+qSojHnK+Ng8m1Ps7JHE2bm1r/D
	DaurUkiIt7CCrkGZexFj/dkn4bptUr0xNcaje8/5mbuxmYpVrLgbQ+Jdmr196xTZt96nmenERHR
	yA0fv/Ngmf/o0icyCU6rqPJ1sR8Ecd1GCEioO22NpwvzmB1qB9VDiQcMZ5C/0EnFLMZHF0K/ilF
	GgMEMEVrZbSevWi04Or9hbK4JKmIw9c/atro+eGdkOySc20Abtk0Mazz4/N8uQ0eZ8s1Ktj4fpi
	ZTvJ3T9EKYhflRWU/c+TtkAiXCABWoVcRW9ebSw5vH+IwV/6ux4MG8GSFIkpFgYbwye5oM7dR+b
	qPijIht/6JpuZBhLgnRE7NpmkY4WNXgoL26inb++lEKvgkFmjIA1Sddivigz19ciCdlJuDavw3w
	==
X-Received: by 2002:a05:600c:3ba2:b0:49d:99:1d98 with SMTP id
 5b1f17b1804b1-49e619881e3mr56892275e9.9.1789128614171; Fri, 11 Sep 2026
 05:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260911111731.3404308-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260911113322.F03531F000FF@smtp.kernel.org>
In-Reply-To: <20260911113322.F03531F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Sep 2026 13:09:47 +0100
X-Gm-Features: AcwNN1X3EMrEnABSXEIebhNF9fcbF1O099DZU69vOon2jNzLHf0JqRb5x3-yA24
Message-ID: <CA+V-a8uJLn1N5+ThxH4c67gO76ksuJeMFroDf-WHM_4QLuqt-A@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] arm64: dts: renesas: r9a09g087: Use CPG/MSSR
 syscon for WDTDCR access
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sashiko,

On Fri, Sep 11, 2026 at 12:33=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Watchdog probe failure due to missing syscon compatible string i=
n CPG/MSSR node and invalid physical memory bounds for the disjoint second =
register region.
> --
>
> commit 026369134b14659a11e1791a537a1142aec5c877
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
>
> This commit replaces the direct mapping of WDTDCR registers for watchdogs=
 with
> a renesas,sysc phandle to the CPG/MSSR node. It updates wdt0-wdt5 to remo=
ve
> the second register region and use the syscon interface instead.
>
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g087.dtsi
> > index e8d4f76949ccb..40ffe56a40353 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > @@ -327,61 +327,61 @@ channel1 {
> >
> >               wdt0: watchdog@80082000 {
> >                       compatible =3D "renesas,r9a09g087-wdt", "renesas,=
r9a09g077-wdt";
> > -                     reg =3D <0 0x80082000 0 0x400>,
> > -                           <0 0x81295100 0 0x04>;
> > +                     reg =3D <0 0x80082000 0 0x400>;
>
> [Severity: High]
> Does this change cause a silent mismatch with the actual hardware topolog=
y?
>
> Generic syscons map only the first contiguous reg block. The driver compu=
tes
> the WDTDCR offset as 0x15100. Since the first CPG block mapped is typical=
ly
> 0x80280000 with size 0x10000, accessing 0x15100 either fails the regmap b=
ounds
> check or mistakenly accesses 0x80295100 instead of the previously configu=
red
> 0x81295100 located in the second CPG block.
>
The syscon is registered in the CPG driver and the reported issue is a
false positive.

> >                       clocks =3D <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
> >                       clock-names =3D "pclk";
> >                       power-domains =3D <&cpg>;
> > +                     renesas,sysc =3D <&cpg 0>;
>
> [Severity: High]
> Will the watchdog driver probe fail indefinitely here?
>
> When the rzv2h_wdt driver uses syscon_regmap_lookup_by_phandle_args() to =
parse
> this renesas,sysc phandle, it evaluates syscon_node_to_regmap() on the cp=
g
> node.
>
> Because the cpg node in r9a09g087.dtsi lacks the syscon compatible string=
,
> and the renesas-cpg-mssr driver doesn't register a custom regmap (e.g., v=
ia
> of_syscon_register_regmap()), the lookup fails and returns
> ERR_PTR(-EPROBE_DEFER). This prevents the watchdog hardware from function=
ing.
>
The syscon is registered in the CPG driver and the issue reported is a
false positive.

Cheers,
Prabhakar
