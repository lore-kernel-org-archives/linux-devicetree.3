Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530821;
	b=WNADvWWoZ71H12APyU/UnzDvPFes3yn/q8DZfNlDlVPImut6f17q7rQ04j9j265qyuOX
	 /r7jUZMQQTmBLZhuNBojMkdo36vGBLlNR/O3tm+xTgaktIHVfmZFEGjF/D1X4hpRJoP7F
	 mm2Uh8Ys5eJzz+JJxJM0WXSFo2I/OW+yT9ID7233/5hJXpyQCyusNoUcQYLdPPXJ4Ee+T
	 bEcBaMApacWGHO08JPmrAzWljXuh8Z2ZHXef/AAz509FYLCy7riN96Td/88HN5h+DPdWO
	 cQJhL/vUtOENvSet1SVcxN0WXqP71pOQ50AIE+YKNb4PI3Vp88nwKOSrpD68TZoSH8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
	b=4a4WQqVP74KtmNRN6Jif5I7Ng0X0XcOjioGM3m+ds6261jvKaDHR/o2FTlb+P88NXgjR
	 XAjoSnZ2+CQmOhiQ8dc9fTVufnb0W9O5lTpnfDY/0RmY1EaWdwG2OYIdNl0xKYHD915We
	 5DGvDZ6Q2JnPRIhy4EEc23Gvh4QA9r2/mTdRfXj3qI40GHQRVmIkvRQM6/AiPTebYGVo6
	 lSCUHLttmtBG1sbFORYFYw+SSwBF4e1GkW/IQz7QdkbY0qRu1LbSEv9lvxQcDP4Pwpnfy
	 dLUiPgCfmpM0WzfGJNmyLn/+D8/wWaYIekeRsvmIbVQW13NBAK5tNYCXmh9uWX/2lYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NTI3g5Hn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE95606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=NTI3g5Hn
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1848645a12.3
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530820; cv=none;
        d=google.com; s=arc-20260327;
        b=emD08yZBakBysX50X75IwqJ1HoBqrquwhln/KyiueUU759ECEN+h6rZt7oc1qQcIN5
         rdn5bJnQdEggnunjJz+tzG9dmz2oaA8f7KDiBaXDOEiuuxSXtS11t95J+B2anY7kyIPO
         XRmiWqt9dUjbs3Wmy4fLm13w5bMjC2cbw7pjmnMJgJDdUkqSq+ioyvgRljl6b1dLRBjA
         nTab0qbVqG74ImHS097Hbhd+02U+D0aWRC4RoWyoyEzPkAgGzbEVpw34HGI1bz0G4onZ
         Wsn88i0RZXo2IpvLR0pPRSNnkZFfdLuPprxWzLoUfbKEeMWAaw406XuAsRUf4Hkg+BeR
         kshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        fh=l4AAlQWVDvmF/UR+VLoDimVRkMAVEwRzqYhtCCw7oQ8=;
        b=BUtxjSlCwQ/JZyTj3jqC2jIA33JoF24aHE2nen6vXaS9UQXuylFJ4JiFtdwjbxBCrW
         oN/UKvwzeG0boUINhGKopIPdhYHcEn9oVqbHNaIa/cAMKN4Aurze56znr7mKEMq6BJmm
         mn2sdqc18UVoTjbxh3z6yucT3jwv3XrzaIBWDs4BncqkuH10y3GH34ysagsA419tqg+2
         aI/H17yDutMTEu3FOh6Cg5UQMHhbxcg/8vfKh/3eJTJ+hn/UHVhcGB3uJYwwhIz6N0+f
         nT6/80nsE0W1ZNgPA3cBqwjulsLmpdC4GB/ofNeUa4/AzHLAOLZPNWkzjCR5H0INF4n7
         bsXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530820; x=1796135620; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=NTI3g5HnwmY3QU092sHAKzcVOSZSiwWeh5F9EjH8JInIwlai1kHmJyvo1SbJ0BSwiL
         rCQoOJWeb7M687ssSIStp4KyeYdwJqMnVQgBsYISeeYYvIHbQgtbrqYpuKp5CrJd8ElO
         XhgrEVmaCGNI+F4OZEIawA8+zaxINkqJmLpmrpT/MvzlZLQVg7TdsdaC/j/5PeG6mTJ6
         7mi3Fqon7RbZb01Q/nnHy/WUdrsjEs9mxILoBbUu7E8zhxUQ+1pGKysNrOkgM8RdWfNW
         1WqP6y4qCYsNmU9K+J5nCYFvUJtEOT4w8CvmSRMhqApaNlFiYUwl40CPrAwxoJAdEB5Q
         9tIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530820; x=1796135620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=X7Yty37fDK1MWygsJWPaqZkZBAjKpEwbho0SO8YHEAdrwNwADgIkx08nFL31h4gutc
         E708op4XRg72wGKPrV6CVLCz7aTc2PbRdLZh73gIAHmq0COnFdCvXe4PxsXLi8O08ojF
         +d/9edT6p06ekTNNCJjNgT1A/9VIbm9MOTMzHn0jTRNiLMD5lZ3DlWHDO6amv53bGldT
         04z0yx8cFLG7ENv58XB04YEnX5wGXN2KQvj4UCilZuTBe7zhByNkYhhFSFAVW3+ihbfv
         aiNTabKAbsD3ACLA2OwB6xZbZgnShs+2nF71JkYXjptTiMH2h79KpZ2cPqiaVfFb+wPB
         vKKg==
X-Forwarded-Encrypted: i=1; AL+hErG1hF23TdhAYoiG/EcaOuyQp+Ouf/CiIVqbZarF5yMXndU2mNguhHEJ8LDg+1mB+TTccMDtXCfRRwMr@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Cks4LBPiSSD14use8Ccn0e+pF7wEpr2KYPBpz1TTu1PfazFB
	N0+gozK6ALLu0an9/sfuQNNU3No+rq0hPt6XNiVcQ42VawueLXzQwNHKtxsEeZsru/3di7ZuFTj
	6ckWaVxtgZdlzKXOQ4hRzBf+tzrH/bMNcpENko3Z9yA==
X-Gm-Gg: AZFdTZfp5anxwjjmMx7UoSKErPAwaxa4ZT5EFgboUtmChXXl9HD2XOotJjgIXKvg9YB
	uOEJLAxbKzie9mm4nr5KKCfneWTKuqnP4cLAnGywsE8cxBe4tUJUjb9q5DZtT1Z0SWL8hC0MI9l
	/zsz0Mg1YP4rzr88wsRMQ4RZCKfIPW48kbhPBuexq46YprV71/oB2SdhCcMcsZ4wxOnoZB7FNqu
	lMSKl3nd1hwirB1bMvFOhDnXlBawj8KOa92yNXpYgTUirp3zDuECopgm/UKxshb3YlAz+9ZEg1w
	E5PWG0Jslde00UrED/Fw/4gxCA2ncaIPmNZwpWub6SczVaqlCKJThuxmZyvA+Ua7larL13dox8+
	6N2qFo48R2EdIJE/0CBOyAwt/keR7Pg5q6Q==
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id
 98e67ed59e1d1-3b41c95aec8mr12847695a91.46.1795530820492; Tue, 24 Nov 2026
 06:33:40 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:33:29 +0000
X-Gm-Features: Aa3M54oxOcYmQorjTkd5D-GkJnjfCGVao0VGN1bH7KpMt9eEOWMLLFoUmIq_rhA
Message-ID: <CAPj87rMW6c0BMELjn70vsc+mkMxegDbSgQC-8BEDGspFyxzW2Q@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] drm/mediatek: Add support for Display Layer
 Blender component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hi Angelo,

On Tue, 14 Jul 2026 at 12:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +#define DISP_REG_OVL_BLD_L0_CLR                        0x20c
> +#  define OVL_BLD_BGCLR_BLACK                  0xff000000
> +#  define OVL_BLD_BGCLR_RED                    0xffff0000

We probably don't need a #define for every ARGB8888 colour tbh. :)

> +void mtk_blender_config(struct mtk_ddp_comp *comp, unsigned int w,
> +                            unsigned int h, unsigned int vrefresh,
> +                            unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_blender *priv = dev_get_drvdata(comp->dev);
> +       u32 val;
> +
> +       /* Set ROI for this Blender */
> +       val = ((h & GENMASK(15, 0)) << 16) | (w & GENMASK(15, 0));
> +       writel(val, priv->regs + DISP_REG_OVL_BLD_ROI_SIZE);
> +
> +       /*
> +        * Set both background color and constant layer color to Opaque Black
> +        * (ARGB) for eventual Alpha Blending to be effective
> +        */
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_BGCLR_CLR);
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_L0_CLR);

Would you believe that this does not in fact need to be black, as it's
been configurable since 4c684596cde4?

Cheers,
Daniel
