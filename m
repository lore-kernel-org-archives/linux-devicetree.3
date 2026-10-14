Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D67854488D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986814; cv=pass; b=cR0B69cNxqbXxeIp1pkPYec/y2xnGHx48unUDyi0DRjB3Bd1zIQz0/UgjCv4m3Mn7p8e+UqqLTdTFVez7Zuo+Zmwzn8Oj62n5V9CHMc2m5z3u6tjs+KoG00yyNK6bDSK3tikISeAW+6jhuHlmecH1dkCxpMOQM34a/1hM6qulCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986814; c=relaxed/simple;
	bh=0LcwAlWWK0AFCf1TILkUnxNzteLJZfEicsPDrj8s9Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKxUqTCP94+eXrUE5oZC9pbQHrxILJjZMzwxUlqjR+B/ft0YudJG2Qhvfy78al6Rgp5lR1AKJgg1kDO6RGPvoKGd3hPdthtLOewmVn+Ekmht4itjRqyNHY8sWvwfjkshjeVFT10qGoH8FBqrxh5sM7qTnElHAmmUN7Gls3LH+B0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=eNe1DuNO; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="eNe1DuNO"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so153955fac.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791986807; cv=none;
        d=google.com; s=arc-20260327;
        b=oEYbDDBYtY1lt/c6sUGHWlmJ/d6BYJMAZyEy3HLE96mtZJuAjU9FOA3GVFYH09DvQJ
         4n6Nkdt/NMLGoI6wx3l4xpBZsOdTyAEsV66leDXV8lDh9U/PltXcU8jBFT/LDDUgDz4Q
         ACLCp5aTm7s4tpVenCwPJuLMs+jzmCQf0YiAMplWOg02piYqblf6wV8MFkV8uKKfTSAd
         bIA4e4+TauFG5UNc6Ls7bRdDaqtBSrLkCebH9ogcr60rxYRxTH0/KN/agg7pDB8EWNY6
         tsH1zsLBY+LzILKq0jpLjT+eUn/9/GYVKTf9U9FJu2Lc03huKARSxNMkR3XhlK9XWyU0
         4eOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        fh=LsrtUu9YGkPqyS6Jkya2BD5uKw3+FZ+1SiE7pxQxFvE=;
        b=jKsJ9qJU+WkcIGKo5EWOJLqmmC9Ouh7Id1A0+vBj9+HqM2lnY8dfxtYCf8jOy1DGzf
         UBKjHi+g/kMwT/2ry37VXQa5PIwRzdGg7oS1dJUAh7+2lMiP4ia2joYc0WgQBcTsb7tK
         pS2eOhsiOM0V3tAObvi7JkNo1WEorBNoO36kaRC8zSazNmt5hVuMKGVvikoIZre7pSlE
         9XSRa6KouOQdNGgNAH3lg9J9FeRuwNLejGK3Pl++ysoz9XLe29Pa/yyiCsLUv8WUHcVy
         ke9Dl5jPuu7KOkFkC2nDgqpzoQltlI2i2baZfG4BkMjo97qILN5b/9dxBt9FD60GwIkT
         yqGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791986807; x=1792591607; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        b=eNe1DuNODth6IsJInnlNhfk876kXkB83E4SamZQQVGKZeHYyBu+7NWSd2RP3rMgvbq
         yqeA2SSB3+ImWPbUiy9WBxk/iFnY5urRw3sNLUaXzn/np+H7eaOQ6j0R3nbjmNayBcLi
         xHXnX8IcR+Zpe4Hxi6XIPEBoKRKl+kKGWDccRlrJOnbadtwH5l7LjSoUh2PCF80T2VIg
         CfqYGx/wlP+1IzZdBoWD3KQTvXTKZuAXFzy6DOgiGldW6mcoPweGZUKkrPXOwEa45puE
         r1wAkx0UyjCKQCuQ9fRovXQ0+ayQxZHz4wXr4JzIAcdyYkELld9L2417nSgHWDP2IVIN
         NSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986807; x=1792591607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45UmRzUopsg3Oy314idTfdd3gLWGouyWXj8QTFCxVZ0=;
        b=Fne4d+439ox8lHsPCsXoOqg5bSfP8vfxxpSehbB9wzUW2J3UxXDAAq2oXYq2PwoohO
         HSxH19DWRobu47ts3uTTH2nmcBLLe7ooI4Oz7B32ZIQYHz3KpAUgKpLsjWyz7E2m9E7j
         Ij5fKfwvlwB7dWF1Ov9tNl0F+nvfiS2w/WfOgr4G2SRgwuXvqgBdZ7r/a6yi6VaSm34u
         mXSl8FQwRo5YTxCouPAIc/pgrve2v+jEB7Xa+RbX2z6sHJMOUToSDP2TMY+DO84ZE2ZX
         7MiYix4C1HGG1iSBvICLOVpO8K4bT3es3QTKWRYzvjRKujNgPz09bZjE1Iiqyiae8MaA
         4HYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgWDmuT6VKZ86dS1CfAw2pgjc41mgfgwsQk2mZVq19TltURX8kjoSBYt0/5kR37SvNJxnG95vNf6Tq@vger.kernel.org
X-Gm-Message-State: AFq9FYI5h0W1VP9iji8DHB6RTUZMhVrP9z3+SKXNWJn6rla9xmE3L8eN
	0YSsPFX9G5Bf8M0FXi3cmcSqrpbl8K8M6C9XFvp1IcZUpvVoK4WOZDLPybXjfmNltbd4/ZMKDxJ
	I6RSIpnbeKbHhvsHH9aXCNP2WRoTD0CtoBstIRwA4cQ==
X-Gm-Gg: AYBFou10s9BhdE0SMboBH02GfEB+dd9b7yrqY5EfpArP52uNpSbB5kw3BMsdTCVqFZR
	u3JX5gpYZiiPgs8/h4VH784cLc+nCC9dgfxviDi2yh4whe+Gx1p7jXVWl2lqsgRkx0wpJnzOYgE
	BZsBKNlBff9Bj3lhHXxRkf92bpfY9g8YtkZ4CDaKxLN54/ahAbZxw5ed51Ht2OVwIDWL1t1FqV/
	sa740W5OeEMAkPsHKKEcMQOYf749r2CElqN/UbF2bNe1MNPWN2rV2ElktXkge2bQ/tazojW2Qr4
	3noztkocJwmT+x59Ip73uzxaV0dl4Cog3Adtr8nMWbPAbbvVq/eAFCUq8MTlx0IR8MgpupUQkkC
	H2h1orjwT8Fd5gFsB/AYG8+OiMhMrvsKnds90eQlNd6xkWRi5ORNNmi7XbmREQpsCCIB1EBg=
X-Received: by 2002:a05:6870:c454:20b0:4a6:9884:df32 with SMTP id
 586e51a60fabf-4a69884e90bmr5145882fac.30.1791986806999; Wed, 14 Oct 2026
 07:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com> <179198580881.2512054.3955199510169892039@freya>
In-Reply-To: <179198580881.2512054.3955199510169892039@freya>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 15:06:30 +0100
X-Gm-Features: AclHuK8ciYOFPl8qXkuGtN5q6F621BPykoHgivZ0NylfNaoIYKBd2rEh12LHy8w
Message-ID: <CAPY8ntCjTWTtVn-EyvYYnMdgH4DFtf6eDbJOdhh4s_ZYfiNADw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] media: sony-starvis2: Add support for IMX585
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jai

On Wed, 14 Oct 2026 at 14:50, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi Dave,
>
> Thank you for the series.
>
> Quoting Dave Stevenson (2026-10-13 20:47:12)
> > IMX585 is an 8MPix Starvis 2 sensor, so add support for it.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/sony-starvis2.c | 302 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 302 insertions(+)
> >
> > diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> > index 1ce2b86c57ac..c9a3dd4fe529 100644
> > --- a/drivers/media/i2c/sony-starvis2.c
> > +++ b/drivers/media/i2c/sony-starvis2.c
> [...]
> > +const struct starvis2_variant imx585_variant_def = {
> > +     .name = "imx585",
> > +     .id_reg = CCI_REG16_LE(0x5a1d),
> > +     .id_mask = 0x3ff,
> > +     .id_value = 0x259,
> > +     .active_area = {
> > +             .top = 0,
> > +             .left = 0,
> > +             .width = 3857,
> > +             .height = 2201,
> > +     },
>
> s/.active_area/.native_area
>
> Apologies for the drive-by comment, I just spotted this and thought it
> might result in a painful debug session.

Indeed.
Sashiko had already picked up on that and a couple of other things,
and Krzysztof has made comments on the binding patch, so I'm hoping to
get a v3 out today or tomorrow addressing them.
As mentioned on libcamera-devel earlier, there are a couple of other
changes required for imx585, so that may hold me up.

https://sashiko.dev/#/patchset/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

> I'll do a proper review for the series, hopefully within this week :-)

Hold off for the v3, but that would be great.

Thanks
  Dave

> Thanks,
> Jai
>
> > +     .active_area = {
> > +             .top = 20,
> > +             .left = 0,
> > +             .width = 3856,
> > +             .height = 2180,
> > +     },
> > +     .pixel_rate = 594000000,
> > +     .pix_per_clk = 8,
> > +     .common_regs = imx585_common_regs,
> > +     .num_common_regs = ARRAY_SIZE(imx585_common_regs),
> > +     .vmax_default = 2250,
> > +     .hmax_min_link_freq = imx585_min_hmax_2lane,
> > +     .hmax_min_pixel_array = 550,
> > +};
> > +
>
> [...]
