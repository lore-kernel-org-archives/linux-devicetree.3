Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016539;
	b=x09LeSXDJsnQhyU6yLqn2VBrPd4jyDUGxqXqiSaFE84qHdW7yzNmhl/npj6qr9P6Xlsa
	 DF7HJnMSo7BpFwe/cbsep8ympJBuLGf3Kh44GbSmOxPJZfTFhLqSj3r4P55bFh5vVA4v4
	 784Y28I+LKF/x9hy7ceW84iM7TrCu6Bjh9pfSyul8ybVEzutPYMyu7ttMEu26IRi3VdMB
	 ezwpownzaobHkyyNy7K55jUxq5k2yWXyd6sdjebXfCG/QEyk+OIeccnkFvClhlFqzLlt+
	 qUbMDaHTF83EZguACTvKgnHPqBo5i6MeYm50f0QY7/uRxaxpwud9G8pLDh8+u+CtYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CN3uhxZTJ97ugRoC/mFf/rnGzVK4gaQ4Bs/xHJQaLBY=;
	b=3fGjjPJ4ipir+5Ej/NCN9az0ePuxVhnEwyyDJ8gQjew/e2SMIFL9+pM9ZcHdtZVBM4MO
	 hJkZcYP4A9ftnFyEpj14+yAvaawcy3DFPNWgeiMgrsB4OQW5RNm+1i65kxT2GCgOSfhR9
	 Hhenn7dez0S671n51m0AovMtZnW0Qd96gz9RW72jLcARz+4Xt5RWV4NZW4+JIaKWmryfo
	 dlouJqmdijpd81X5FuYvky1dpHjJpm8zPBH7V0EH8j+xa59acSkSFPoLMlTp5VTtmi7gD
	 3SnpEMsInAxn3mR0awtkVdCjdexEQOyg59GFwAHs5wQybCTz2dBmDP8wKgC7p7O/XbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Qo9LytuP;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFDA606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFDA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Qo9LytuP
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb628232d2so693921a12.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795016538; x=1795621338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CN3uhxZTJ97ugRoC/mFf/rnGzVK4gaQ4Bs/xHJQaLBY=;
        b=Qo9LytuPq3LOx+0z54BQ8PjbGvhnxuvWOVMI0R3WU9/LEMeouwZFqUZAsAXweRSyh8
         mctaTRMV0HrYwcaNg7z6/vI0LlLIR7vEdKFvaZvbaeZThLqT6m/j82KI2NOvZP9SWqfi
         kYc4AgVgaZeNPX+vBh7K8zi+oQAuoCkCRto34GxnIV1HYRNIyemmT6O6R954ZbOJC6Hm
         Qe2OTJFv+9wtAamYJPIb0psqwYmxQVLFNOQiW05xm4H5xv3Stq3HtBWw/Nu2PVn+F8CO
         RI4RZdAAlDyFEBdssGgII6E856TDWHYWc1CwhNVNpm1odhgJL0Zkiym3R2nuC092CRjo
         RBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016538; x=1795621338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CN3uhxZTJ97ugRoC/mFf/rnGzVK4gaQ4Bs/xHJQaLBY=;
        b=Ic/FX/5jBhypicF0P1J2po1sfKwo7W2gt7Pobl+tcAoHs/bc3oDe2HP61UqMTHGW5l
         lQWES9qrA93/OpOJpUWxncEMc/GZUGQMQV1iMG7Nd2y/4NOMWsdwlRlJ5dFboS3sQdvc
         gWN5KTAr8S+csi9wOoBinpyc+WFpAWMdsV6uUj7SzDcx1rNqN7fsllVWTzJfj6rnVGY8
         ODnbBntLgrH+O9m+nMDbAQWBsvUDNyLFf7VPZeYaxAkLeKCuwJZSPxfR0mXGxb3Nackd
         P2qW2lXJJbgIne4BA4Ah5ZoHV6VxUcXYnS++KDsVHzC2RpwRkLhd6vIwSJtNDnaQug1w
         wQmQ==
X-Forwarded-Encrypted: i=1; AL+hErHlS2rzW58sbiobalZ+TMyGp7ulPlLjzdRkTqpiLFZBGnD59JOoon8wQgouNxnaYd8MtaIkAol3jEEN@vger.kernel.org
X-Gm-Message-State: APuU4Z9qrknxddQudGDwJYxfFXyTJvwuQ1pvlj3wApmTOq9wH22MRKBS
	pMbOl6oLXCbgX3WflmcLmf6GzMR3YsTStphzSUrCkSpmOsI9x3npq4VGQf/oCz0kFQg=
X-Gm-Gg: AZFdTZeYdqPb3YsI7I8K6bBIi8jNDQzuwFGealETH7uF887chiLLxPFIBa/tNufuDyD
	BEBhk9FNDeE9tYDDB9uXAg4+IN9UWsNTSiy+lTNNh/q/KZenIziCwcQxrJpzSm47YQu/GzMmMFm
	68VrM+dCJTmPyW7GG9dWvs3c9lUVAGTxJgz1qWzxziIFtQQDxvd1pHzDGT1n95z/g13tAaX3Hzk
	nrnUUlXpP9k/9LqDFmOluMhYKKn4FzKk5HAl+34J6s4vYrAiNXWdOfB06XODbxMxA/EG2aG1EfS
	juP8LfkYVBBOdVNMAb/kpWtLwODMOZvnLu1uo9rwTSbxFGF6CHi7MYt4O/VTs2zGjrH66UhM718
	dSYUE1LHh1PH9GOlp0WAxAt1oFZQiO2AHsvxIsb6LNF7kweMohGafj4xpMyogzucHFPtTRyyanV
	+wsmdm4CNh5y2HZYofk622w166SVjnlygURpx2QwMFFDBJoyDVZ3bBuxIEGmXVvrCzSaJcdZ9Or
	UKZP4tPf30kcsHLY1adSLDbQMeKeq/g8wUimDNAKDtrS0VWxQpRhUDGPxrqF14o748Ft5goCtOf
	eGqHkXfxucpyRZZEnwX5i3xiU1NkwM/7/Q==
X-Received: by 2002:a17:902:d2cf:b0:2ef:e06c:38d2 with SMTP id d9443c01a7336-2eff756587bmr30526375ad.54.1795016538193;
        Wed, 18 Nov 2026 07:42:18 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9f37:bd39:7f19:3b3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6246213sm16061995ad.56.2026.11.18.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:17 -0800 (PST)
Date: Wed, 18 Nov 2026 09:42:14 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <av3HVh5jlMsyaiq7@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
 <avzQI6R9LubGP7-d@bywater>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avzQI6R9LubGP7-d@bywater>

On Tue, Nov 17, 2026 at 11:18:03PM +0100, Francesco Valla wrote:
> On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> > On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > > Depending on the driver originating them, data buffers used for virtio
> > > communication can either:
> > > 
> > >   - already be allocated from the coherent memory area that is
> > >     accessible by the remote processor; this is the case of
> > >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> > >   - be allocated from generic kmem, and thus not necessarily accessible
> > >     directly by the remote processor.
> > > 
> > > In the second case, the DMA APIs can be exploited to obtain a
> > > functional communication, since they will take care of cache maintenance
> > > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > > feature flag can be used for this purpose: with it set, the virtio
> > > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > > 
> > > Bounce buffering will be transparently used in two cases:
> > > 
> > >   - if the buffer address supplied by the virtio driver is not suitable
> > >     for DMA transfers, or
> > >   - if the reserved memory associated to the vdev is a
> > >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> > >     and from this pool.
> > > 
> > > With this support in place, any kind of virtio device can be supported
> > > through the remoteproc-virtio transport, at least from a data exchange
> > > standpoint.
> > > 
> > > Note that remote processors behind an IOMMU need da == pa for the memory
> > > region(s) the buffers are allocated from.
> > 
> > I'm not sure to understand the da == pa requirement - can you expand more on
> > that?
> > 
> 
> Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
> it can integrate with this work is the main reason this is an RFC, as
> stated in the cover letter, because I'm not sure I understand all of it.
> See for example the dma-to-da conversion in [1] or the comment in [2].
>

The remoteproc subsystem was written a _very_ long time ago and the context of
some artefacts, such as [1] and [2], is long lost.
 
> That said: all the IOMMU setup that is done today by the remoteproc core
> is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
> device backing the virtio device). For that reason, the DMA subsystem
> should not be able to know that setup even exists, in particular while
> performing swiotlb operations. Hence, the requirement to have a 1:1
> mapping between da (i.e., the address the device uses) and pa (the
> physical memory map).

I would like to reserve the current remoteproc IOMMU design for handling legacy
rproc-virtio devices, i.e rpmsg and serial, and only use the modern
virtio/swiotlb API to handle authentic rproc-virtio devices.

Based on what I see here [3], I think above sentence:

"Note that remote processors behind an IOMMU need da == pa for the memory..."

should be replaced with:

"Note that remote processors not behind an IOMMU need da == pa for the memory..."

[3]. https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L703 

> 
> > > 
> > > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > > they are explicitly excluded.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index f1b362158a9c..1496659ddff9 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  	 * All non-remoteproc-specific virtio devices are assumed to be
> > >  	 * compliant with virtio specifications 1.x; there is no other method
> > >  	 * to transmit this capability from the remote processor to the host.
> > > +	 *
> > > +	 * Virtio devices that are specific for remoteproc usage take care on
> > > +	 * their own to allocate memory from the device's coherent pool; use
> > > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> > >  	 */
> > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > >  
> > >  	return features;
> > >  }
> > > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >  	features = vdev->features;
> > >  
> > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > >  
> > >  	if (WARN_ON((u32)vdev->features != features))
> > >  		return -EINVAL;
> > > 
> > > -- 
> > > 2.56.0
> > > 
> > 
> 
> Thank you!
> 
> Reagrds,
> Francesco
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
> [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461
> 
