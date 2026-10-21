Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792591175;
	b=FshA9pQqFNERZaOVBKalxHV0SUvXs7UoZJS+tsHNdAA73S9YgHqeA+a367hbESICxQNz
	 wxUo927jLmx7kxoKz7OXD0QAaoBDFath19QOB98whom0eBmmleRM3JX6RLRt0LAOaeNQW
	 nAZqIEtn0thGtiJF5r9sreyrekIqPS8Aph+qGQThUsEu04ZYwUmh15FEn4aV245hFQoMz
	 QS0g0XkX5WBDADxRRI4wFwxdJytMVZN5lCQfkwNXybgogfT5QoaHQbU+j+NEu2r7Itv7v
	 Nuk93kRFVI014MXykn+lkjsogEHtJiqIPOqYd85qwzsg0+7GnRibXNfe0DJafW613Vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
	b=XCl5mobZxo8J5EKc25Tb+1LSjS6jbOa/gGb3f/S9eYg3nuWb2eJnpvPaQ8aM4P7RW5Bt
	 e9Lr8t21pFAGyfHp404lLty3CNyPRf3CjA48uzjTnyXLoajlCYlh1r7NlDkajVJYQc1Td
	 vXIprIikdBvXb6m/PvJv3I6vR7mp6ghAo3UB/qCZR/0jvcdLgtD3Gib+RL6ftdIrDUmwn
	 zuomIzHuAAyGS9ncS7muoylj449frk7jpNJ0TQ9Q9q9VvX9qjj0jguPtmAcIJcVfBkYzw
	 511SLTkt8R9ziBrk7qv67p1w/mpLdmiOiD57jcvur0nso8kHfeFsnPyXYcdyACnnT7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PPiUOnHl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1530060A2601
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1530060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=PPiUOnHl
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49429181ce9so440564fac.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792591173; cv=none;
        d=google.com; s=arc-20260327;
        b=kNzc9xcokyWOwEwsytNAIRTQ11Ve8/arlQjpsdcpRVAkBpP3wDzwsegGANEQ3O06u0
         Ht5DDChmM9fpWxCZT1Neg3dJcUQ42o7fs2tZ98ycHThpXM3wgsB2Xi2Qxp0JW7PMnVHV
         l5NH8ZKsxo1U2xYry5pct2Yxgsxm6hpLfrpfw02KB1v9kFc5FWm+dX4ecxoIOBwug57m
         aH1QBt3sB9ckMOAt8fZC3PebJ3s4pBgmVObANNGomoLIEJTudQluPhPkgLK+1pKdDqWr
         LRah2QUgjfNXR0pPvy2CvuVs/eWdXEjij+kGo4spg2tWVWSKELbGpJ7lp+cWvW2HIFbg
         4HPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
        fh=eIV6XFBL5Ecki50sc/jON4P+/dX+zuEuyb8LQuZsBOg=;
        b=WDazONC9DLYuTcwCZmvwFTeR4VoMbH55Dnq2iwLBQzdrD80uDS/YRaCHXeSwSGHWhS
         8r+ZZAJmcGWNKukfTkI7jHh/gSTu5y8nzqabbDbIpU32a2TUNezsvbilEQaLwLYbdv02
         usyv6DPHb+n+/EkfWccDocFgyZprNveG/3JN9lgGWwUz2cFHJqinLhUNStj5hYdnoBPL
         7JYqd4sy3j++vbCLGl3WAS7tjRwn+5hBfzwjRqjBn8l64Uu2cbVYwsBXEJ7BaUAr7xOh
         qjpuI4LaE9mLjiC1WN12PtyxZ/s73uiXL3k2wf8TXq9BdbjpCtbtubm9MYOwK/aOO5DK
         ++fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792591173; x=1793195973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
        b=PPiUOnHlmfiQcWyQ4BCY5Rhv1mdtaCs3vtKHRRxw5/4QN3goEwwBe8ZqxjgBzy8HzR
         hcINe5adlEI0lXh5N9+mm+wEsPyvVg6eiyDmCZthRlHFE9/h0Dci6UHxnYMiipRZmptA
         EX7cW/QoTJ8uSLjM2Ux3fdvxCW0wcqYw6llJp0R2XeE3fYU2j3yN61i5m4qPOxm5Bx6f
         W+o5B79cvE/uMNx0vBh1lENVQS5vwBr0V6OYTlw/iHJPCKJFdu8D9+k99vly5hQrK5e5
         EuKZXDp8ZQbtJ1+QYqT13MW01xEeM+kDsX8HXOOLb5Natjbp36aJTRriamSqb9jTGBCu
         QvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591173; x=1793195973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFXwKRCvo+WFYGEsnibzA8pBCYxr11F6w2gzPIL/gGc=;
        b=t6nJKuoU9wM5JLeAvJywW8r6H9SagnSSFJQzmQVt4oCyAqRPb+jsentTFHJ6P/1bi7
         D0s3en4NsyQQkSv+IJO7Ca6HPduYWUlzIg5FnfM1Q9HLkTi2OSERALJlKqMNKfhqasja
         ul8R25JZwjxCfpb5cjvvSQzi7zlDlmcg3CkpCRS/K5TcKmQ6csCyDiTtjFqqVZdYl/V5
         rspXaqp8R3DBR0mLfTV2UiJMOz7DF2w6CCHJYMrdDx6UyfGH2zuckAEnWfY+dvsYk+xW
         MMwb6fuWekapb3vDppdijIkMtV7mNpAb4kGcsxwy8osgLZUl93IcaHB7Mk/m1IkVqznF
         0BoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+0mqlQ5tuFENuvde7jj1ubIfnRcumiKFfZNaEEy/8tWS2nAcBzsplRz1K+oN+BQbz2O5epSOJLdOq@vger.kernel.org
X-Gm-Message-State: AFq9FYLOLoXj02VBiAqiEKDALLg6Lf79H2eb9T90qhCwuZio6ajwcq/c
	6IJb1JaJ5Ee7f3fpMlT/S7trKEPvueYJ4d/jwaken3vS9iuxPifb0UbBv2TD3hu7sgxzczTV4Xn
	aisYOCxqdZpG+MOxcX49zqsHA1JrUGYxK/fMzxn0iAg==
X-Gm-Gg: AYBFou2+0d5qlCJeEgLCtkN9u/FahbIRfDKJsRDgNfqs6Gd7veuXqICkJZ3AXqYq1Cc
	wAcnDOQMMhtDEoa81WsXEx5vF4P65kSSbLqgYLfacYh35o/OLP4NFhW1P+mRnWMIuvM5v+Dsgt0
	pyUTMu4e9VgpKxUmMywS/tIOkylrDWdlhp98lwEYNsbhySzTeV6jx2LscAwhD8/S1+TMLm9Qh7Q
	nP6doAxa8f0Y+NCGX2lvmh2wpv0x0jWIpv3PVmE33Gt6zxogQL5x4H0egFDKhKi2mGlNmThLq5K
	DQ/yZ/RPp8oz5GwKYIrKbxATcUAaoPPUxLBBLjglOSJgV4+K6QbJar1get2tm7LqzhQ7E/rWIz2
	C5sXT43AXHQo66F/lJAwwIp2ZBhdcswkLMesFPuprK/5oKRMRvzRaBXvInKUjL6ImQxT6esByUa
	nexzK4CYO4uMFP2GuiGN2uHX5SwcXvdCK2UHSDZhipjT6s7LWGYj/J
X-Received: by 2002:a05:6870:c6a4:b0:4a6:f705:25a with SMTP id
 586e51a60fabf-4a7dc1757ebmr1057975fac.21.1792591172606; Wed, 21 Oct 2026
 06:59:32 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-4-75fcdb4163f3@raspberrypi.com> <atc1us1fj6MN6UfF@kekkonen.localdomain>
In-Reply-To: <atc1us1fj6MN6UfF@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Oct 2026 14:59:16 +0100
X-Gm-Features: AclHuK8fDstfvV4kpy6BcazMRbHSLbyvfAabyEyGh48fK-Qeuexq4Pm1-IrJHMo
Message-ID: <CAPY8ntC1dU9r7Ku890b5cqpH5LtQkRFS68dVkYbe0FtVXG7GiA@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] media: sony-starvis2: Parameterise the
 configuration to allow for other models
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Tue, 20 Oct 2026 at 10:34, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Thu, Oct 15, 2026 at 04:57:30PM +0100, Dave Stevenson wrote:
> > Several of the Sony Starvis 2 sensors are identical in the
> > majority of their programming, but differ largely only in the
> > size of pixel array and some timing parameters.
> >
> > Parameterise those parameters in preparation for supporting other
> > variants.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/sony-starvis2.c | 170 ++++++++++++++++++++++++--------------
> >  1 file changed, 109 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
> > index c4f590c489d9..189caac78066 100644
> > --- a/drivers/media/i2c/sony-starvis2.c
> > +++ b/drivers/media/i2c/sony-starvis2.c
> > @@ -51,17 +51,9 @@
> >  /* Lane Count */
> >  #define STARVIS2_REG_LANEMODE             CCI_REG8(0x3040)
> >
> > -/*
> > - * The internal readout clock runs at 74.25 MHz. In one cycle the AD reads 8
> > - * pixels, thus giving us a rate of 74.25 * 8 = 594 MPix/s
> > - */
> > -#define IMX678_PIXEL_RATE            594000000
> > -#define IMX678_PIX_PER_CLK           8
> > -
> >  /* VMAX - Frame Length in Lines */
> >  #define STARVIS2_REG_VMAX                 CCI_REG24_LE(0x3028)
> >  #define STARVIS2_VMAX_MAX                 0xfffff
> > -#define IMX678_VMAX_DEFAULT             2250
> >
> >  /* HMAX - Line Length in Cycles (8 Pixels) */
> >  #define STARVIS2_REG_HMAX                 CCI_REG16_LE(0x302c)
> > @@ -102,8 +94,6 @@
> >  /* Sensor Identification */
> >  #define STARVIS2_REG_MONOCHROME              CCI_REG8(0x4d18)
> >  #define STARVIS2_TYPE                        BIT(0)
> > -#define IMX678_REG_MODULE_ID         CCI_REG16_LE(0x4d1c)
> > -#define IMX678_ID                    0x02a6
> >  #define STARVIS2_MODULE_ID_DELAY     80000
> >
> >  /* Common configuration registers */
> > @@ -153,32 +143,11 @@
> >  /* Subdev pads */
> >  #define STARVIS2_SOURCE_PAD          0
> >
> > -/* IMX678 native and active pixel array size. */
> > -static const struct v4l2_rect imx678_native_area = {
> > -     .top = 0,
> > -     .left = 0,
> > -     .width = 3857,
> > -     .height = 2201,
> > -};
> > -
> > -static const struct v4l2_rect imx678_active_area = {
> > -     .top = 20,
> > -     .left = 0,
> > -     .width = 3856,
> > -     .height = 2180,
> > -};
> > -
> >  enum starvis2_type {
> >       STARVIS2_COLOR = 0,
> >       STARVIS2_MONOCHROME = 1,
> >  };
> >
> > -struct starvis2_model_info {
> > -     enum starvis2_type type;
> > -     const u32 *codes;
> > -     unsigned int num_codes;
> > -};
> > -
> >  enum starvis2_lanemode {
> >       STARVIS2_LANEMODE_2L = 1,
> >       STARVIS2_LANEMODE_4L = 3,
> > @@ -207,7 +176,7 @@ static const u64 link_freqs[] = {
> >       [STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
> >  };
> >
> > -static const u16 min_hmax_4lane[] = {
> > +static const u16 imx678_min_hmax_4lane[] = {
> >       [STARVIS2_LINK_FREQ_297MHZ] = 1584,
> >       [STARVIS2_LINK_FREQ_360MHZ] = 1320,
> >       [STARVIS2_LINK_FREQ_445MHZ] = 1100,
> > @@ -267,7 +236,7 @@ static const int starvis2_tpg_val[] = {
> >  };
> >
> >  /* Common configuration */
> > -static const struct cci_reg_sequence common_regs[] = {
> > +static const struct cci_reg_sequence imx678_common_regs[] = {
> >       { STARVIS2_REG_THIN_V_EN, 0x00 },
> >       { STARVIS2_REG_VCMODE, 0x01 },
> >       { CCI_REG8(0x306b), 0x00 },
> > @@ -650,16 +619,74 @@ static const u32 codes_monochrome[] = {
> >       MEDIA_BUS_FMT_Y12_1X12,
> >  };
> >
> > +struct starvis2_variant {
> > +     const char *name;
> > +     u32 id_reg;
> > +     u32 id_mask;
> > +     u32 id_value;
> > +     struct v4l2_rect native_area;
> > +     struct v4l2_rect active_area;
> > +     u64 pixel_rate;
> > +     unsigned int pix_per_clk;
> > +     const struct cci_reg_sequence *common_regs;
> > +     unsigned int num_common_regs;
> > +     unsigned int vmax_default;
> > +     const u16 *hmax_min;
> > +};
> > +
> > +static const struct starvis2_variant imx678_variant_def = {
> > +     .name = "imx678",
> > +     .id_reg = CCI_REG16_LE(0x4d1c),
> > +     .id_mask = 0x3ff,
> > +     .id_value = 0x2a6,
> > +     .native_area = {
> > +             .top = 0,
> > +             .left = 0,
> > +             .width = 3857,
> > +             .height = 2201,
> > +     },
> > +     .active_area = {
> > +             .top = 20,
> > +             .left = 0,
> > +             .width = 3856,
> > +             .height = 2180,
> > +     },
> > +     .pixel_rate = 594000000,
> > +     .pix_per_clk = 8,
> > +     .common_regs = imx678_common_regs,
> > +     .num_common_regs = ARRAY_SIZE(imx678_common_regs),
> > +     .vmax_default = 2250,
> > +     .hmax_min = imx678_min_hmax_4lane,
> > +};
> > +
> > +struct starvis2_model_info {
> > +     enum starvis2_type type;
> > +     const u32 *codes;
> > +     unsigned int num_codes;
> > +     const struct starvis2_variant *variant;
> > +
> > +     const struct starvis2_model_info *auto_detect_colour;
> > +     const struct starvis2_model_info *auto_detect_mono;
> > +};
> > +
> >  static const struct starvis2_model_info imx678_aaqr_info = {
> >       .type = STARVIS2_COLOR,
> >       .codes = codes_bayer,
> >       .num_codes = ARRAY_SIZE(codes_bayer),
> > +     .variant = &imx678_variant_def,
> >  };
> >
> >  static const struct starvis2_model_info imx678_aamr_info = {
> >       .type = STARVIS2_MONOCHROME,
> >       .codes = codes_monochrome,
> >       .num_codes = ARRAY_SIZE(codes_monochrome),
> > +     .variant = &imx678_variant_def,
> > +};
> > +
> > +static const struct starvis2_model_info imx678_autodetect_info = {
> > +     .variant = &imx678_variant_def,
> > +     .auto_detect_colour = &imx678_aaqr_info,
> > +     .auto_detect_mono = &imx678_aamr_info,
> >  };
> >
> >  static const char * const starvis2_supply_name[] = {
> > @@ -674,6 +701,7 @@ struct starvis2 {
> >       struct regmap *cci;
> >
> >       const struct starvis2_model_info *info;
> > +     const struct starvis2_variant *variant;
> >
> >       struct clk *xclk;
> >       u32 xclk_freq;
> > @@ -770,7 +798,8 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
> >               cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
> >               break;
> >       case V4L2_CID_HBLANK: {
> > -             u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
> > +             u32 hmax = (format->width + ctrl->val) /
> > +                                             starvis2->variant->pix_per_clk;
>
> This seems to be a pre-existing bug but it'd be nice to fix (and backport)
> this before this set -- the control value is divided here by 8 but the
> control's step is still 1. The step should reflect the granularity here.

AFAICT it already sets the step correctly.

https://github.com/torvalds/linux/blob/master/drivers/media/i2c/imx678.c#L1197-L1199

imx678->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
  V4L2_CID_HBLANK, hblank, max_hblank,
  IMX678_PIX_PER_CLK, hblank);

so the step size is set to IMX678_PIX_PER_CLK, which is 8, and the divider here.

> >
> >               cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
> >               break;
> > @@ -851,18 +880,20 @@ static int starvis2_get_selection(struct v4l2_subdev *sd,
> >                                 struct v4l2_subdev_state *sd_state,
> >                                 struct v4l2_subdev_selection *sel)
> >  {
> > +     struct starvis2 *starvis2 = to_starvis2(sd);
> > +
> >       switch (sel->target) {
> >       case V4L2_SEL_TGT_CROP:
> >               sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> >               return 0;
> >
> >       case V4L2_SEL_TGT_NATIVE_SIZE:
> > -             sel->r = imx678_native_area;
> > +             sel->r = starvis2->variant->native_area;
> >               return 0;
> >
> >       case V4L2_SEL_TGT_CROP_DEFAULT:
> >       case V4L2_SEL_TGT_CROP_BOUNDS:
> > -             sel->r = imx678_active_area;
> > +             sel->r = starvis2->variant->active_area;
> >               return 0;
> >       }
> >
> > @@ -877,12 +908,12 @@ static int starvis2_init_state(struct v4l2_subdev *sd,
> >       struct v4l2_rect *crop;
> >
> >       crop = v4l2_subdev_state_get_crop(state, STARVIS2_SOURCE_PAD);
> > -     *crop = imx678_active_area;
> > +     *crop = starvis2->variant->active_area;
> >
> >       format = v4l2_subdev_state_get_format(state, STARVIS2_SOURCE_PAD);
> >       format->code = starvis2_default_mbus_code(starvis2);
> > -     format->width = imx678_active_area.width;
> > -     format->height = imx678_active_area.height;
> > +     format->width = starvis2->variant->active_area.width;
> > +     format->height = starvis2->variant->active_area.height;
> >       format->field = V4L2_FIELD_NONE;
> >       format->colorspace = V4L2_COLORSPACE_RAW;
> >       format->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > @@ -896,8 +927,12 @@ static int starvis2_write_common(struct starvis2 *starvis2)
> >  {
> >       int ret = 0;
> >
> > -     cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
> > -                         &ret);
> > +     if (!starvis2->variant)
> > +             /* Powered on during probe to do detection. Variant unknown. */
> > +             return 0;
> > +
> > +     cci_multi_reg_write(starvis2->cci, starvis2->variant->common_regs,
> > +                         starvis2->variant->num_common_regs, &ret);
> >
> >       cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
> >                 &ret);
> > @@ -923,10 +958,10 @@ static int starvis2_program_window(struct starvis2 *starvis2,
> >       cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
> > -               crop->left - imx678_active_area.left, &ret);
> > +               crop->left - starvis2->variant->active_area.left, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_VST,
> > -               crop->top - imx678_active_area.top, &ret);
> > +               crop->top - starvis2->variant->active_area.top, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_PIX_VWIDTH, crop->height, &ret);
> >       cci_write(starvis2->cci, STARVIS2_REG_ADBIT, 0x01, &ret);
> >
> > @@ -1080,11 +1115,16 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >  {
> >       struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
> >       const struct starvis2_model_info *info;
> > +     const struct starvis2_variant *variant;
> >       enum starvis2_type detected;
> >       int ret = 0;
> >       u64 val = 0;
> >
> >       info = device_get_match_data(&client->dev);
> > +     if (!info)
> > +             return -EINVAL;
> > +
> > +     variant = info->variant;
> >
> >       /*
> >        * This sensor's ID registers become accessible 80ms after coming out
> > @@ -1093,7 +1133,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >       cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
> >       fsleep(STARVIS2_MODULE_ID_DELAY);
> >
> > -     cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
> > +     cci_read(starvis2->cci, variant->id_reg, &val, &ret);
> >
> >       if (ret) {
> >               dev_err(&client->dev,
> > @@ -1101,9 +1141,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >               return ret;
> >       }
> >
> > -     if (val != IMX678_ID) {
> > -             dev_err(&client->dev,
> > -                     "Chip ID mismatch: %x!=%llx\n", IMX678_ID, val);
> > +     val &= variant->id_mask;
> > +     if (val != variant->id_value) {
> > +             dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
> > +                     variant->id_value, val);
> >               return -ENXIO;
> >       }
> >
> > @@ -1118,7 +1159,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >       detected = val & STARVIS2_TYPE;
> >
> >       /* Prefer to use sensor type specified in device tree */
> > -     if (info) {
> > +     if (info->codes) {
> >               starvis2->info = info;
> >               if (detected != info->type)
> >                       dev_err(&client->dev,
> > @@ -1127,11 +1168,12 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
> >                               info->type == STARVIS2_COLOR ? "color" : "mono");
> >       } else {
> >               starvis2->info = detected == STARVIS2_MONOCHROME ?
> > -                            &imx678_aamr_info : &imx678_aaqr_info;
> > +                         info->auto_detect_mono : info->auto_detect_colour;
> >               dev_info(&client->dev,
> >                        "sensor type missing in DT; detected %s sensor\n",
> >                        detected == STARVIS2_MONOCHROME ? "mono" : "color");
> >       }
> > +     starvis2->variant = starvis2->info->variant;
> >
> >       return 0;
> >  }
> > @@ -1162,7 +1204,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
> >  {
> >       struct v4l2_ctrl_handler *ctrl_hdlr;
> >       const u32 hmax_4lane =
> > -                     min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
> > +             starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
> >       const u32 lane_scale =
> >                       starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
> >       struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
> > @@ -1181,13 +1223,14 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
> >       if (ret)
> >               return ret;
> >
> > -     starvis2->vmax = IMX678_VMAX_DEFAULT;
> > +     starvis2->vmax = starvis2->variant->vmax_default;
> >       hmax = hmax_4lane * lane_scale;
> >
> >       /* PIXEL_RATE is fixed and read-only */
> >       v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > -                       IMX678_PIXEL_RATE, IMX678_PIXEL_RATE, 1,
> > -                       IMX678_PIXEL_RATE);
> > +                       starvis2->variant->pixel_rate,
> > +                       starvis2->variant->pixel_rate, 1,
> > +                       starvis2->variant->pixel_rate);
> >
> >       /* LINK_FREQ is also read only */
> >       link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> > @@ -1199,23 +1242,25 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
> >       if (link_freq)
> >               link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >
> > -     vblank = starvis2->vmax - imx678_active_area.height;
> > -     max_vblank = STARVIS2_VMAX_MAX - imx678_active_area.height;
> > +     vblank = starvis2->vmax - starvis2->variant->active_area.height;
> > +     max_vblank = STARVIS2_VMAX_MAX - starvis2->variant->active_area.height;
> >       starvis2->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> >                                            V4L2_CID_VBLANK, vblank, max_vblank,
> >                                            2, vblank);
> >
> > -     hblank = hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
> > -     max_hblank = STARVIS2_HMAX_MAX * IMX678_PIX_PER_CLK -
> > -                  imx678_active_area.width;
> > +     hblank = hmax * starvis2->variant->pix_per_clk -
> > +                                     starvis2->variant->active_area.width;
> > +     max_hblank = STARVIS2_HMAX_MAX * starvis2->variant->pix_per_clk -
> > +                  starvis2->variant->active_area.width;
> >       starvis2->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> >                                            V4L2_CID_HBLANK, hblank, max_hblank,
> > -                                          IMX678_PIX_PER_CLK, hblank);
> > +                                          starvis2->variant->pix_per_clk,

And that IMX678_PIX_PER_CLK (8) is changed to
starvis2->variant->pix_per_clk, which matches the change above.

v4l2-ctl --list-ctrls-menu with imx585 is giving me
            horizontal_blanking 0x009e0902 (int)    : min=544
max=520424 step=8 default=544 value=544 flags=has-min-max
and with imx662 gives me
            horizontal_blanking 0x009e0902 (int)    : min=1034
max=194669 step=3 default=1034 value=1034 flags=has-min-max

Are you seeing somewhere else where the step is set incorrectly?

  Dave

> > +                                          hblank);
> >
> >       starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
> >                                              V4L2_CID_EXPOSURE,
> >                                              STARVIS2_EXPOSURE_MIN,
> > -                                            IMX678_VMAX_DEFAULT -
> > +                                            starvis2->variant->vmax_default -
> >                                              STARVIS2_SHR_MIN,
> >                                              STARVIS2_EXPOSURE_STEP,
> >                                              STARVIS2_EXPOSURE_DEFAULT);
> > @@ -1356,6 +1401,9 @@ static int starvis2_probe(struct i2c_client *client)
> >       if (ret)
> >               goto error_power_off;
> >
> > +     v4l2_i2c_subdev_set_name(&starvis2->sd, client, starvis2->variant->name,
> > +                              NULL);
> > +
> >       pm_runtime_set_active(dev);
> >       pm_runtime_enable(dev);
> >
> > @@ -1436,7 +1484,7 @@ static const struct of_device_id starvis2_of_match[] = {
> >       { .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
> >       { .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
> >       /* for non-conforming DTs that rely on runtime check */
> > -     { .compatible = "sony,imx678" },
> > +     { .compatible = "sony,imx678", .data = &imx678_autodetect_info },
> >       { /* sentinel */ }
> >  };
> >
> >
>
> --
> Kind regards,
>
> Sakari Ailus
