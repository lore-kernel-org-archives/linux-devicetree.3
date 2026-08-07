Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE41377550
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143420; cv=none; b=LeLVyXIWmHXQSviU0G+utdB99k3t8zRLprrGpVV/SPrlK8ndk779+mxd7gwvw05FDwF7XEGAMCStttAVbiHyWvty8PWOW6MtYM322pdTwww7dO3pJdyk6QxHRuJMMdoonN2PdcVBadj+Ciy+kL+eIyh5IlkkagBO9++aEXLOo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143420; c=relaxed/simple;
	bh=kWDE/FTDl6sqiYTfUg6YnEwEYtS9ZEf+xZ375s7184Q=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLVDA0VlSvTcmAGwDA1ZBCOwFi7UH2oydNIyFoS+avTXjbN0B1gY7YV5CcYvxLOp2ieNhYF8YeuScH1qgteqhi3EYI+PGRleJn43ObW/MehHkGlGC8iUB4fFgM8zZnxN8lC7q9t4XrRqH6c8OZO//O/rImgb6SBhV/voBMUFI8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJixRRmI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJixRRmI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49557167508so592535e9.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 15:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786143417; x=1786748217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=;
        b=QJixRRmIndx9ZPIxLfYBO3QB1JSPTFp9Z3Yaq9rivxfiUadYq2HKmsZPW2vE4Gtv0I
         P7IBx6zhMlAtelVgvCrg2MM8v28AlLRihOWtt84Uzd44ZEMg6koBsAs6YN3x/rRNUKoF
         u+QeVNhxQkzOGLVtlJBfs+K+H2AfjrO8QLPO5J+WqXBi9mBHAlMJuOvLJxY1NWWpv2yy
         bdbf7iqXqsSV/JxtNqwp2iOALnxUmmTDqGYDqwDrrGlgdyUNlhHTnJXWiP+kPgrvv6Ie
         zVZXUfnTfvr5Iiu/P+qJmxtmRhXvYSobSy0sVLpmPH0j5LF9TpWCuhlNv1S3E58QTL33
         NlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786143417; x=1786748217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=;
        b=IrCgcjsgWEGmUS7WyPLFlVVW5gu4XN3Lvxb1F8Gli1fBAWd45dSKrRiiY6+H8hcajG
         4VG5LA2PVS9ZlwILcDObepHD7YoqgD3EyFuXEvPi/U23ToMNTCc4VK6S0Df8Ikk/lB+d
         n0Lm8QMI5+quYIJ55KiSPNglDSAn7kq7PblhDGDT2o7JP8Ux4lkqGsOnVrO+OUqm9o+U
         EgtiDHWqpJwrQ/yP3xsZInbfPG71X2SN0+sholPNLfFIuGSb/Ij3dQubze0iB3CcoJCd
         VWjONwbINUg9TKfqF54QxpkmSHx1+JlTyEDFGR0eOfZS5JIxRmpf4l8cEyYL9qsCUBC9
         uowQ==
X-Forwarded-Encrypted: i=1; AHgh+RoivsuwWFSaDdXYWfYvXIUIp1twqUnZLW2WvJBoSUJK2CI8KSJkf3pFYiD1DnD1PWiKrlwsA7iyl812@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+HzRGNTq94eAgMljijwFcHT3eCpNPN9gyejco87gvLroO9gz7
	g1v7z5B42eDlAnBHw7RbAHXKWt8gM8xb3wWGZsIZ0mEamTMcommFIGYt
X-Gm-Gg: AR+sD10r0voittzJQD92AZW/X6woarYSsF5qa4XR6+kyEzacOm2Padx+k8TnaGA0ix3
	Kzt80M7SJdMj3N2x3vDFqe3tjgYRRKH+ULjJq9ybFwtIqNmWgFRthzX46McLyEv9rZktSDJJXf4
	AGE0en12fMx3CPAhhrAxLG8bwYE87dXb1EFdcSD+lcvxx5tbvW6l2gO0RqlOfYZMtmM5vwGJCkM
	r4aROYZDRZYYWnFEEvjau03Ndmo0k/Trvhqr9T43g5JTFE4509QcdvjxpuV21vNGnQeF+8jcjkt
	m+7RYznOBzsWXmt5l99Wevn0oLz8I1yaox3ZbL3GN10EwtXwVN9j3UEX4eBIBWZmh0605Jjtc8Z
	yMHZjKuTFnc7h6PUGZBX+YneVveyNlhYLopCb1NJLlyS4XEUfsGbwFKNJ6R661VmAvrAyQCL1Mj
	qe4qgd/AHjmXehXjpUJcvf19m/p65IYjMi5TW2NXtRIuS0b1UrqtxMQpCrcHncyQsIqeyz8B1I3
	ztkdOu++8qfIkpq6kYA2jaJ+bo9Ow38yNso2W0dumN+2Yo=
X-Received: by 2002:a05:600c:840f:b0:496:c1f3:e8fb with SMTP id 5b1f17b1804b1-4994e71ffafmr333123705e9.8.1786143417357;
        Fri, 07 Aug 2026 15:56:57 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm180639745e9.10.2026.08.07.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:56:56 -0700 (PDT)
Message-ID: <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
X-Google-Original-Message-ID: <anZitWJCkH5j0Zyg@Ansuel-XPS.>
Date: Sat, 8 Aug 2026 00:56:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
 <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>

On Fri, Aug 07, 2026 at 11:52:58PM +0100, Mark Brown wrote:
> On Fri, Aug 07, 2026 at 10:09:34PM +0200, Christian Marangi wrote:
> > Add support for the Sound system present on Airoha AN7581 SoC. This is
> > based on the mediatek AFE drivers.
> 
> > Also add the machine driver to create an actual sound card for the AFE.
> 
> This should be more patches, the machine driver should be a separate
> patch at a minimum.  Possibly PCM and ETDM drivers too.
> 

Sooo you are suggesting 3 patch? one for machine, one for basic pcm and one
for etdm?

> > +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> > +{
> > +	struct an7581_afe_private *afe_priv;
> > +	struct reset_control *reset;
> > +	struct mtk_base_afe *afe;
> > +	struct device *dev;
> > +	int i, irq_id, ret;
> > +	void *base;
> > +
> > +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> > +	if (!afe)
> > +		return -ENOMEM;
> 
> We allocate afe here with devm_kzalloc() so everything is zero...
> 
> > +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> > +				 GFP_KERNEL);
> > +	if (!afe->irqs)
> > +		return -ENOMEM;
> 
> ...then we allocate an array using a size read from the struct which must
> therefore have zero elements.  We also didn't assign dev, either we
> should assign it and use it consistently or we should drop it and use
> &pdev->dev like the first allocation.
>

Nono these were just my mistake with moving code... I already fixed them...
sorry for the mistake.
 
> > +	/* register component */
> > +	ret = devm_snd_soc_register_component(&pdev->dev,
> > +					      &mtk_afe_pcm_platform,
> > +					      NULL, 0);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
> > +
> > +	ret = devm_snd_soc_register_component(afe->dev,
> > +					      &an7581_afe_pcm_dai_component,
> > +					      afe->dai_drivers,
> > +					      afe->num_dai_drivers);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> > +
> > +	platform_set_drvdata(pdev, afe);
> 
> The component registration might result in a card being instantiated so
> we need the driver data initialized before we try to register.

Sorry this was asked to be moved in the previous revision by another
review. I will revert following the pattern done in other AFE driver...

-- 
	Ansuel
