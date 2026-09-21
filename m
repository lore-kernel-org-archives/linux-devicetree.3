Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F4A4D17A3
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005681; cv=none; b=Twj101jCC5ZZtfLR7rmhTsV4zWaDTowif5yQCplU8nbTbcp+y7UUbDiibmJ02P+xZxOwLHT2HqkMM4oddYh2lUyv30+G12mEhKFBBbH1MjxtJJlBazQokSBePlPoKO6oGx0p0rOpgBFkx2M3Kz3ApTP77doTnQ2oIvFMz5Xly/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005681; c=relaxed/simple;
	bh=xGLfA1m+bcd6cQO4yshQSi+ud4HVrdOAi+ou2Af706o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LD2XMl0Pm78qUyokXPx8kavVlH89kftAswuKDQebTdDk7NF3+yKv3oStXi5CDitLarThNYqK11Z9FBfyxVLH0q4sB2Z++/J5bUiD5cOT4u1fhePlhoiYZF1KkXSqkzXXA8OfKHGYWvUlnZDueYpjWbW4Wf2d27AuR/KKVkeIe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ilcriJut; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ilcriJut"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2651046a91.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790005678; x=1790610478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NymQllFGW/d7T1ecbWk0XQBpiDM3En0PKGwwReZs9hI=;
        b=ilcriJuteKpgJx9w4DIEzTEbyBEvAaCunudqidvu03k8m6NT+bwGHE2Bei4elDFfg0
         Vb0+eqKHd0re1ADu81NZNHOR++DOPWnF3VNPWJIQh6ltQ8MXEDgyNo/Rf8I/KDYrFpJ9
         X1O/6oMK34h6d5DjkPb1QZwaI7PzKn+TX5caDME7e1XhnvGy+1InDSbtz/lW7wi+GZOG
         otPUvZwAZtKSFQ2uKUhpA3dvKGinJxk2ajAm7zI93Xg+pSxZf7HIeZkIXqQjDW8Zkucf
         6ufxxoxRozBD80crQCLfh6iWAyAT6MajCYtEc9vwFFmDYq2jkITULatv3I3+jKtfna4b
         qg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005678; x=1790610478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NymQllFGW/d7T1ecbWk0XQBpiDM3En0PKGwwReZs9hI=;
        b=Hqx4as0DrJCDXabjeW2v1LzALgYZgPzjVYXSRfW5CMDtJpo5Dc56jz0rzNDFgu8Vxl
         Z7Q386bZCms/vJs426C5Tfxl5+FW36qPzqxyivyy8mdBV9/1ciRH3CPDmx0GHq/tzXSR
         dYBY9H6Xu4/qy0lz3Rfu0fFc3H73aPCEXh2j7+P2k+ZA0pJHSNKXykTiBrTEDdc0Yr5e
         +hzn5iwY+K/Hfgo3upMawD5YW3P5qVX488UkHhx/gbG2s3GRaZsZsoxxNB8e5cIgOb4Q
         EdtmBUQUx5P/Eeh4L02wMk3ewO2kW29uaEVurlTYi6dtZ9hSg8HJwZx+fEDuGidLw3Vv
         QXTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy72SeF468SOpU/OC/YMMmHKrEQ+AHepeqZn1KY2JkBqukH+2whXP4L/Pby/eC75nrz/EKFQrW6KJ8@vger.kernel.org
X-Gm-Message-State: AFuF++ke6X+bNOPZSOEeul7KLp6cQOSHEl84xKjJPcH3vYigGTCfMruF
	nBPGKUiRd5/+0AcoN8QgFiw/Tk4NcaXvCg+2HBd6lo0q3DfdH+QfRV4EIAtynh7KHl8=
X-Gm-Gg: AYBFou321cr0ku2IbWY46WeJCKaxs2CaeXwdWgMM3oxF/Cn+2TirhgpieOtfk8x7G4c
	2KmmfrETqG4ZodcgZYGx22cGFt6G+LHQnpWgDCWGjK8ScUipqSyhK+QwAtpT7oExPcet6PQzumB
	HRekh3nMevRBgkhym/PYiCtJbFGaGpzNkUl/QS9I401Xjm9MA2V2Z1npqL0GaicwL/JfR92iDzn
	C7vjF9tBKu9qZmwXoX3dVTvi32uMk9mXT3pl7xPJ5Z3qTY6NPBQuKVMThi82kx/WYuGyGKxN3gI
	ZLXzmPwItlJdK0rKQwYgzPuNghqZQZsZ7mctKtDaDrTaMRznKPMeoRxXMXVJ1iyyqnbqCOsjt7u
	KFSLSEpKOp12SA1CDb5xckwxepjMFl7ACtiuGjLsv2Ka8g61epdjDcJ7i9kVuM89k8weJlEeqgv
	xgj0+ghKv4tPFIIl8ZB5aRg0kl6cZPbU5176xwtxqHgA8bRUeRyZnjAMZJZCGPNfFINqh+D/FrZ
	Q==
X-Received: by 2002:a17:90b:2750:b0:39e:6c69:776f with SMTP id 98e67ed59e1d1-39e6c697934mr11058030a91.24.1790005677565;
        Mon, 21 Sep 2026 08:47:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a714:d1ef:56ba:be47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55c9cabdsm7471419a91.0.2026.09.21.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:47:57 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:47:54 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	imx@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 05/12] remoteproc: always report VIRTIO_F_VERSION_1
 feature
Message-ID: <arFRqopkkJf7Nlq4@p14s>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-remoteproc_virtio_map-v1-5-dac8c5eb4aa9@valla.it>

On Wed, Sep 16, 2026 at 11:10:50PM +0200, Francesco Valla wrote:
> There is currently no way to report the VIRTIO_F_VERSION_1 using the
> resource table alone, as the per-vdev feature array is limited to 32
> bits.
> 
> Considering that the VirtIO 1.0 specification is now ~10 years old,
> always report the VIRTIO_F_VERSION_1 feature, as some drivers depend on
> it.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 74e0da970f1d..cfd66d9d1c9e 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -249,7 +249,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>  
>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>  
> -	return rsc->dfeatures;
> +	return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);

I understand this.

>  }
>  
>  static void rproc_transport_features(struct virtio_device *vdev)
> @@ -275,14 +275,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>  	/* Give virtio_rproc a chance to accept features. */
>  	rproc_transport_features(vdev);
>  
> -	/* Make sure we don't have any features > 32 bits! */
> -	BUG_ON((u32)vdev->features != vdev->features);
> +	/* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> +	if (WARN_ON_ONCE((u32)vdev->features !=
> +			 (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> +		return -1;

And this.

>  
>  	/*
>  	 * Remember the finalized features of our vdev, and provide it
>  	 * to the remote processor once it is powered on.
>  	 */
> -	rsc->gfeatures = vdev->features;
> +	rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
>  

But I'm having trouble with this one.  

First bit 32 of vdev->features gets cleared and then bit 0 to 31 are assigned to
rsc->gfeatures.  Why bother with clearing bit 32?

>  	return 0;
>  }
> 
> -- 
> 2.55.0
> 
