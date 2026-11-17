Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932923;
	b=ewCsoOjTCAc+B53pjliypubdB8MtCovKKB7nojGf1aw34D3UXGn+SGkTTz/AbIbCSjIE
	 zsM4ojoI0wiLIv1o5Xok7I54IxVQSzM0KAHQg3aeA58jt+dbPEEb/7tWWzn3JE42tWlRl
	 1wy8rlZ7KX/5SjdKrS4DtaeM68pI+H9t87ZuvDsdNz/s4bW1zXfk2e4oL06SQz2mcZn3c
	 I55if3VwjHe6hMPpXYgIIKJeATIK2yeNOYQdfecozhcNrVg7u1iFQbb8HAYgjdbUBUsea
	 ZX4pZrBS+47p2zGb8nLbmHMgFW2YLYGETiygNdajtFOFUI3wyFj4dyDyE4kQi+3Lf+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
	b=JUsfRfOIhnE+mKc8JoI3tfhlNF/FOwYOopqGxV4dYegsETEbCk6mtvzzw5zhbT6r/GlP
	 ChQPBjwy7r9z90TI5vngy9cDUqSEKC8EadSb9qthXy8W3PqNYrkdG2BfQUS1CMCp7dYdY
	 jt/9Vz3/vaqVXryJ9vpfOdySAh7RJWp8MnocCidEKnYjUBe4AX9LL8guGxWyC6Yl7hwFI
	 GwV5LFz43pwJdboKx/LkPP3IBZiCD7oDyQvmA9/Q3GR00YvnKrBDY59veuamcDBmuCscN
	 3ROtZE1PidvmZ19YkIdG134UpqcE2olvR7xejPWSEpT7hu3OFdgdaeDnxYGi0hYzVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gYkOXE36;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1122606A332
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1122606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gYkOXE36
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso981984a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794932922; x=1795537722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
        b=gYkOXE36LvPXoQfL6aSBJHmNbbme+s9cnk9acjuy56Vmj3PoJvFZb/K63ZS/539zUL
         bYhAI8uvQKlMiiOMytgcSOF+1zOLMqcfCFnXfJt+aSPPfd/r7xj+DoKoE2MbXqVPtEKp
         38p92sJIeYys8Alu8V1nOqPLNUzrhrz5szblsSwNzd7FPJLb5tyR9Xx7C+XYZegIpdPp
         j0c5BTv//RIvjz2XOgjvip+T4NI93mfkTee/6T8Q80TxYvdnXOiDS+4QTmixV0fFubuB
         vq1M8vt74x0WX3IPF5TVRKnJoKNtjA9db134IkMe5J0IjuRH2IpMxrj/CHXLh8oz/rJZ
         gXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932922; x=1795537722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9knRtCcMgIWWsx+jn+Ep/GYomBKonoGDT8JCXsB+Dc=;
        b=VPTZBcDde1rs7KHxsjKoTAmsbOIgpCEdm/Un1Gq/b/u5ClJAQBKOjFPUwwOeCfBr8G
         uCJJ6A9zyF5JccszG4hySLXyWaS1WHweASkOZaeDOsYJbuIAf6Zx3/GNRwUZrg2NLKwh
         wdyNudM3Jyv636WQMIhykOJ6m1x1My+gsCJYGtvhAsWii79RG1L2a8gasOr+J4U0YoWN
         a3C6Fpjir0p0ZoBSERkVOF5hNnyWZhhCBMbIhIe0Z6nZaGfoUHQAQPVce8zRWB8/wUDU
         Oy+q/JwS/X601MQ2vaJMPArH+oH8xitPzBxLAAARztX7aw9ZbuEtlWcyT4lEwKz/nxTN
         u4Yg==
X-Forwarded-Encrypted: i=1; AL+hErHJIsYVIXcpUFU1Xy15azpKMEXGKaHT/XNZ2Su0FTtXDMP2XIdG+UaYFXG8ESPZIaNn0l2u9uoaAQuu@vger.kernel.org
X-Gm-Message-State: APuU4Z/Khu9+LTnauLhgWFe36lHmrNwXHwBTEz7rAAx74aXMi1NjorBf
	8n3iYDDJCpGkxVCC6gBlSSP82bmoe/6bH8alQoaO+wJOyEyzTkuYBHf+TUWAndNaZhA=
X-Gm-Gg: AZFdTZdq8ILbTyOB7E+1xJKGmnYYWWkNirir3ShhzcVkUxCnD4Q0GXpmrFjMxOkD6ZU
	kBoaLNEZxVPB6PXhkg6i0vntIY9+krQwRUrIZyhUeNqqnXMypgYaMxlvqpO/kL+JFP7BSlnhjtK
	LvSmPZYz8+H6RZ+l4767vn/JHVE1KGabFmHVvjhL4Os+p7oPD9cF/llJUz2vn874C0SGLx00fhs
	42KiqCQoxUlDnUi2dJNl291NDqUqKaqYhYRH7zQqLtINBmsR0/+NzoVhYKsRFKC6pFtZIIlilg0
	oN6UknbAWrueoHE6LsSNGg6HXM/cDeww/2kuOfvRp1mA1I1f/J8Sl4tePrWeVcYeQ2xBABDSS3r
	dyGyRtaMGWCYWZ+G6uYyHqdAYdXFA8Z0l9uo933Oj0SRTNkKqBhKdUEd4/flb5UdKJH4mM2VNH9
	r1sejQS0ag/H27tMLHDq5bU90qE8o2x/+5zCyT/HjF0bul8qrW+4CU9x5WIapljCQ5A5fGB7SCc
	bnllLVVvThZzSScilfSCJsYbVbOwViqtV0YxlDQn2KcZLt175uvOPrPT0Q0C+rrSyKd0YwPB7a7
	XucTAf5FdvuLUWSuvkVeU8eREHaNmCEc
X-Received: by 2002:a17:90b:6c7:b0:3b0:9183:23ef with SMTP id 98e67ed59e1d1-3b1b07e41b9mr15684802a91.3.1794932922021;
        Tue, 17 Nov 2026 08:28:42 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:61f7:13ac:b599:b52c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe8b263sm5082310a91.13.2026.11.17.08.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:28:41 -0800 (PST)
Date: Tue, 17 Nov 2026 10:28:38 -0600
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
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <avyAtmxdbfEBbZ87@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
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
In-Reply-To: <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>

On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> The virtio subsystem already supports a fwnode describing a vdev; search
> for a specific node during vdev registration and supply it to the
> rproc-virtio platform device that is being registered.
> 
> A memory-region specified inside that node is also used for the virtio
> device if a carveout was not supplied for it through the parent device's
> node.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
>  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c946ecd980a5..e833853ae7f6 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>  	if (rvdev)
>  		list_del(&rvdev->node);
>  }
> +
> +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> +{
> +	struct fwnode_handle *group, *child;
> +	u32 reg;
> +	int ret;
> +
> +	group = device_get_named_child_node(dev, "virtio");
> +	if (!fwnode_device_is_available(group)) {
> +		fwnode_handle_put(group);
> +		return NULL;
> +	}
> +
> +	fwnode_for_each_available_child_node(group, child) {
> +		ret = fwnode_property_read_u32(child, "reg", &reg);
> +		if (ret)
> +			continue;
> +
> +		if (idx == reg)
> +			break;
> +	}
> +
> +	fwnode_handle_put(group);
> +
> +	return child;
> +}
> +
>  /**
>   * rproc_handle_vdev() - handle a vdev fw resource
>   * @rproc: the remote processor
> @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct device *dev = &rproc->dev;
>  	size_t rsc_size;
>  	struct rproc_vdev_data rvdev_data;
> +	struct platform_device_info pdev_info = {
> +		.parent = dev,
> +		.name = "rproc-virtio",
> +		.id = PLATFORM_DEVID_AUTO,
> +		.data = &rvdev_data,
> +		.size_data = sizeof(rvdev_data),
> +	};
>  	struct platform_device *pdev;
> +	struct fwnode_handle *fwnode;
> +	int ret = 0;
>  
>  	/* make sure resource isn't truncated */
>  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	rvdev_data.rsc_offset = offset;
>  	rvdev_data.rsc = rsc;
>  
> +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> +	pdev_info.fwnode = fwnode;
> +
>  	/*
>  	 * When there is more than one remote processor, rproc->nb_vdev number is
>  	 * same for each separate instances of "rproc". If rvdev_data.index is used
>  	 * as device id, then we get duplication in sysfs, so need to use
>  	 * PLATFORM_DEVID_AUTO to auto select device id.
>  	 */
> -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> -					     sizeof(rvdev_data));
> +	pdev = platform_device_register_full(&pdev_info);
>  	if (IS_ERR(pdev)) {
>  		dev_err(dev, "failed to create rproc-virtio device\n");
> -		return PTR_ERR(pdev);
> +		ret = PTR_ERR(pdev);
>  	}
>  
> -	return 0;
> +	fwnode_handle_put(fwnode);
> +
> +	return ret;
>  }
>
>  /**
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 1496659ddff9..950d65480be5 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -13,10 +13,12 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/export.h>
> +#include <linux/of.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>  #include <linux/rsc_table.h>
> +#include <linux/swiotlb.h>
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/virtio_ids.h>
> @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
>  	put_device(&rvdev->pdev->dev);
>  }
>  
> +/*
> + * Attach the memory region declared inside the vdev's own devicetree node.
> + *
> + * A restricted-dma-pool region is attached by of_dma_configure() when the
> + * platform device is probed, but it is released together with the virtio
> + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> + * when the remote processor is restarted during a crash recovery.
> + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> + */
> +static int rproc_virtio_init_vdev_mem(struct device *dev)
> +{
> +	if (is_swiotlb_for_alloc(dev))
> +		return 0;
> +
> +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> +}
> +
>  /**
>   * rproc_add_virtio_dev() - register an rproc-induced virtio device
>   * @rvdev: the remote vdev
> @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  	struct device *dev = &rvdev->pdev->dev;
>  	struct virtio_device *vdev;
>  	struct rproc_mem_entry *mem;
> +	bool has_mem_region;
>  	int ret;
>  
>  	if (rproc->ops->kick == NULL) {
> @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  		return -EINVAL;
>  	}
>  
> +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> +
>  	/* Try to find dedicated vdev buffer carveout */
>  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
>  	if (mem) {
>  		phys_addr_t pa;
>  
> +		if (has_mem_region) {
> +			/*
> +			 * The carveout takes precedence: drop the region that
> +			 * of_dma_configure() might have attached at probe time.

I don't understand this part - why would someone configure vdevXbuffer with the
same name at the rproc and rproc-virtio level?  This should be an error.

> +			 */
> +			dev_warn(dev,
> +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> +				 rvdev->index);
> +			of_reserved_mem_device_release(dev);

Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
or virtio core?  

> +		}
> +
>  		if (mem->of_resm_idx != -1) {
>  			struct device_node *np = rproc->dev.parent->of_node;
>  
> @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>  				return ret;
>  			}
>  		}
> +	} else if (has_mem_region) {
> +		/* Use the memory region declared in the vdev's own node */
> +		ret = rproc_virtio_init_vdev_mem(dev);
> +		if (ret) {
> +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> +				ret);
> +			return ret;
> +		}

Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
devices is very confusing.  I think there is value in splitting them, even if it
entails some code duplication.

Thanks,
Mathieu

>  	} else {
>  		struct device_node *np = rproc->dev.parent->of_node;
>  
> 
> -- 
> 2.56.0
> 
