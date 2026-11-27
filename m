Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781866;
	b=qOWujTht6jyvfnu55ygYzDD1+N56NOjVuf/bREQheoDDDA60ceCbvlDC7JM6olOOiw6D
	 t0JT9HJnaGiP0azspSJJEC4yMVipOrEUb/23CnRJ3gxFLOoXq1lmzJroTO2Kybd/2TWvu
	 iTdTWP9c0P0BaxNOKKIncrhUVMz38pswfRew/1Rz1hX0Q4y4qxesMfVbexnueO5Lim7fy
	 vZNxjTYQ0Jluaz3yB21N651AgYAkbDF1WMeVarUyNepFf7yTe2fwo3Bv3eAJZ/cTIardR
	 6iNQTZkDQBL3vXfR+9KLPIkUyTCfzOQ0QYsdrT96PcP+FyQUrprhOVD1WFuIO6SaHAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
	b=wXYsOClg0dtYxnY0ZN0Ftl+kHCZURsytteaDLLizw4MY6ERvNRIZmehH6mgDQNT1j75/
	 ozgf33CQWCm94EaD9wJ7hcv2nNnAfudi/bLVG2PLp9c8PNvxACLekCwhFPX4eltub0LhA
	 IUel1yYrKjmey2d81fiU45+tuZLVSD1yDblHPXH65mXLAonXLGDjg83puziMs0G6LgyQC
	 Dzpju5+qj0F/oBzqJljSkRDXS9C+1CFA3cKt6mpK0x35yh8hpVZgKvL3F/Ud8C/klIVCN
	 vaRdsONKOWksfU6Zx32Ic2ZxaCxL2uXq+d3kj/JAA6g2aNey2WaogRC7WkcPNhMKJJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VStT1ica;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B4606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VStT1ica
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so5006074b3a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795781865; x=1796386665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=VStT1icaAeLfzGScPe9CdBMUfeQwHlELRjWXgQwof7WbcoT3BzVeAZWti+hSkJdNaj
         ZmETPUGZ6uEAo9AjcsJ3i0Kjmli7tijAHBBKi3QGFnxa1s7kAu1SWeo8KDmLxNK8vqVM
         nQ9vsvKapSrPVOTl9yCAyxrgT6JMZLxnZp8nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781865; x=1796386665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=eqfgWeQr5D3jPopWu4FEeSyJU/QGil31S94eoZWYjYTDZElqHtN226cL8v1OhWW4iL
         VCeHJHaUBPC143xmnH7OGREPAalC1sDcXmVbTWZ9TtbaziaJZdKvjAleO1WVv9gW/oLs
         rRsmF3hQNDpRwbKtuVqJE8BZF88mSOpvxL11nG+dXnNiUCrgYwray/kznP/n1SXgt/hv
         VRuUWudJurGITMq0UKcFLlH1kEPuQrN66TYgUtKFVNxhMnjlrM1lSPSs15qNElkrgUgC
         l56IWFUdHvnd5wqGdwhuAt2jGF9SbWZFZC79q8Y90fbQKQLGL1Fn0550uF9EvTK70cRp
         pspw==
X-Forwarded-Encrypted: i=1; AL+hErHbRyy3393UwKbHZhDOEWiBMUYqeDFCYSzIn66jkFJnKpHeIoc03bmNuEI7R8NFT2i57eHn7GdcJjJt@vger.kernel.org
X-Gm-Message-State: APuU4Z+N46ixThEKFC4/sfUFmRtEYUX4TGShRkYnptUe3CThrLLWJC5+
	Ir10jiWROS634yn+lDpRaId0EllTYlNJqeywj+Bowv/g3c/B/aOJU5MuFyEr9NqkV6DJqDDfgCS
	z51LW0A==
X-Gm-Gg: AZFdTZcI+wRWHOTROc31tsjrNfc0MiZdbTAR6Tdj7fu4Rx8D7IDQ66zCWoh46JQ3Dn4
	oOYm/izhIfvbPxRU4UP+IndGIa7psxtWmrD+VBOapCMti9D2UQikiVOoRmOiKU29l24RU8wbe5Z
	MVALXJeEBIk1ymThkGcP8pSUY4+iQvq9lhlGm9123MJjWLvpVA8Rp76p83LmpA+2rmphsUVxAq1
	JYWAE6eJEVonYaICHcU3HQiX1INQiok8hb9KkX7xaBi5emUIdJ6ouOKPv3CCsm/MpQQJ+E4aFfn
	diLyB6XjPOx6GegNEWHrio7pP5nZHzkG3tDcmrx+dKZyHEFPW6VrXpuwBw89xqgQUF9bjCcOIB0
	7d3wGVGVx5uowHLynpUrPL3wzynU9JI7h7FVKMmNHSDzD8l7KTvk6SFw9qcqwxnXEG9QRne3HXy
	x2I7ilk1ZiJ/xXx4S4zLIygPum1EQMF2K86PHL2oGx1ZslZSFtOAqt64UCmf5AbiERVY+ux0+Na
	cAnCI5oS3QKQ2Iwyk8OAPPncEtzilPRjxTrQMjQdWtCZUtUxLKNVIj70VISXlQaz8niKks5HfFt
	X0W9wa77TCzsr6DsDpuMa0JuqhMMvLL4lP9Od634IGvLOcezEeohTosrPINmApb4AbkYXcLk219
	fN2LemL0cMdig9A==
X-Received: by 2002:a05:6a00:2d06:b0:89e:fe2d:abe2 with SMTP id d2e1a72fcca58-8c87c862ab8mr22543581b3a.44.1795781865277;
        Fri, 27 Nov 2026 04:17:45 -0800 (PST)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1d71dsm12614880b3a.53.2026.11.27.04.17.44
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:17:44 -0800 (PST)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so12059132eec.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFUq5YT/qfPanu4CT1AWMuhvgaJQmRLc4ca8PnXjAS0yIvG3B6yPbfyY9OHY41Jpja0RTeyAg0lKTmP@vger.kernel.org
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id
 5a478bee46e88-386b52638e1mr15336839eec.9.1795781862885; Fri, 27 Nov 2026
 04:17:42 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:17:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
X-Gm-Features: Aa3M54pcv7nTzvpglkL8e2ZqGsoE7ZtTuNgXg7WMfrQxU5jsZk3Rpl5MWtMoFKo
Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
Subject: Re: [PATCH v2 43/46] drm/mediatek: Add Two-Dimension Sharpness
 Processor (TDSHP) driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MediaTek 2D Sharpness Processor (TDSHP) is responsible for
> performing image sharpness adjustments/enhancements in a display
> pipeline.
>
> Even though this hardware block supports adjusting the luma and
> contour 2D histograms, frequency weighting, luma-chroma gain and
> others, this only introduces a basic configuration which allows
> to bypass TDSHP processing in an effort to forward the data from
> this block to others.
>
> That is necessary because some components cannot be connected
> directly in specific pipelines; for example, in MT8196/MT6991
> pipelines, when Display Resizer (RSZ) and Color Correction (CCORR)
> components are required, it is necessary to pass through TDSHP as
> direct connection between RSZ and CCORR is not possible due to HW
> limitations.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile         |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  10 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   8 ++
>  drivers/gpu/drm/mediatek/mtk_disp_tdshp.c | 167 ++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h    |   2 +
>  7 files changed, 192 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c b/drivers/gpu/drm/=
mediatek/mtk_disp_tdshp.c
> new file mode 100644
> index 000000000000..31f57c567137
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
[snip]
> +void mtk_tdshp_start(struct device *dev)
> +{
> +       struct mtk_disp_tdshp *tdshp =3D dev_get_drvdata(dev);
> +
> +       writel(DISP_TDSHP_CTRL_EN, tdshp->regs + DISP_REG_TDSHP_CTRL);
> +}

mtk_crtc_ddp_hw_init() calls .config right before .start, so this full
register write overwrites and clears DISP_TDSHP_PWR_SCL_EN that
mtk_tdshp_config() just set for 8-bpc pipelines.
Use a read-modify-write for DISP_TDSHP_CTRL_EN instead (or drop the
redundant write here).

Regards,
Fei
