Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6EC3EB818
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 17:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779385720; cv=none; b=jbToO1QgBS2oQdLs0OHc7DAs0yS1WVTbcd+musxkha2uyurwCwYRwbLx8ed3N5GX2NZE8gx9BdQZEQe3vdintK2/JMppWdNjOx08Ebxo0EJzpY1OlGOOXVLF/ub5+y3pNi5o3f1/xjplBohXLcBiZdsjA3Wr5LOSkGE3yhCtfcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779385720; c=relaxed/simple;
	bh=7y59o9o0M7WwtNmzO+DTpfwElq6b8BxXxcgrWPNx/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liJgDTvYpkCpwGaB5NiIr55Wv1lRo+jK0sD6aASMVwjSrGU3OXN8j4oKgBDE+sJuPCiOFfeppWi45gJB2dVh2ZCkXYcYiViFCkJEp76AoEbr+mnyZY2c7ie4VQipKpDwu6SjxnO/Rz7BRh+gJRU/dj16B/51mYbLLVbbqRJnbhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLzbKhjU; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLzbKhjU"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso2930042a12.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779385717; x=1779990517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=;
        b=SLzbKhjUWkZOfplG4kV8tuBEB5EJSJ9VzDzPvKDtUVNui7oyiBIS2lSZ3AlOU+dtQf
         qmQlFCv/7/6PpwnVtZkvvoLktxR4mUBnT+UoNMFxDzpua5vYmoiIQMNEamyoWLDwp3qD
         ErG4nYtDzW0QtkaS3Wfdfvie1b+5WG8Lmyuu3zFDjeGzTwgH6wvz7hQBj+qNKab0iSmJ
         5YYVxNWbMrBMZ/vmkHzbtyiLpoq5OC/lsRQGix3a/sFrNVSRPND6MuJ6/VefdCH52lvb
         HpJBW58znVGTpKBM1XVe9jWkW6ZOv0jHsdFrb0/pbGxtHROchp95ioFre7OG864xUiMx
         krdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385717; x=1779990517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiN/SkcIQjWbum7/p7uPRaQeyYXLwJ51hfK20HisxH0=;
        b=QAOA1n80109f3rbRX8Xd/0lLAvnWdBUlrG3nSN1p+2GVcfjFiD8vmhG5nNh/E8jJuj
         JHw9woRQJ3j4mo6J5W9ZDHP08R7O2pgBI+GKLJNnQ8nDK4Aw0onCVgM/PkkPMbhKT7dM
         J90t7nVmB7hWCIgtDJL8A01AAVdnJtjo0EVJ0qSr1ktPoopiTVrRpG3cKLb6ebGr3GFn
         00aiMEGkBjnbCo80JCLK8qJFwlf3yAMqEDiUGuK5xMv5cGm86o1Ow0t/GtroCjfGzRKK
         tUyT4NHplkfybfoEPa71GMNq7GLI6Tf/nAmc+jVbenM7sY86vzOwpoGzFhSdanQyqxTc
         N1LA==
X-Forwarded-Encrypted: i=1; AFNElJ95hV+K2eDiXGi7+1aOx7wEuJMaoUVmhbMaDode31es+yKUC1uCxcdYAA8x8Zv7SXTK13nbk1E+huRx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy19WXMABlsjbCkBCsoXZlVFTK06r6xYnhEAtttI4nOJfjuY0ja
	xhA1fY9ztp6uf24lJyKPcUUyMAXdm1gXfSusHEv9jcNIeqsjRvvhVx8u94KSH0dMjEc=
X-Gm-Gg: Acq92OGn0ZiV8EI6xx4gLnxMiVdlW3fG6ISk/vzvg7Ev8OpHG1iyY7cNiKSIFtY81jP
	wrFwEnenIQTTW5L+SG+nV+H9bCff49jfe6WyIfcSxwFSjP9Ln4IR624qaW3nbmC4+stARILtGxu
	ssLXcko7k0WHpg7vSnr6UlqzvZ+GADbj531nSnSQmJWM/Nm4EMmVV+QJgiIXbpvrN1VFw2mIet1
	1EVjwK2oOWZKK9kSYR8IavnmNLM2cgIIwXCRSBOnc/DOjN0wCX8qkhUY8VLn6oUoeqTJ5VyYmdn
	4lQXmIG1DLK+aV+5lfDBifoeX9QMCtkaabZpiUJUuRxysX9as1PWQ48qe41ZRpl/EJAqW4CcXM2
	YBPfWF3WvZ6J+U9muAv/UfIHYMIP+SGcZiMZ+xdNgCzIpkOX8H35JXxhhW8fjmY6ys/t8UKtcEr
	nwY9lzJfDSpMMR89DT6l1XOf05LzA=
X-Received: by 2002:a05:6a20:7491:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3b30883a17bmr4801497637.44.1779385716400;
        Thu, 21 May 2026 10:48:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7ba6:1f4c:9869:500c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85197ef536sm952270a12.8.2026.05.21.10.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:48:35 -0700 (PDT)
Date: Thu, 21 May 2026 11:48:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] remoteproc: xlnx: enable auto boot feature
Message-ID: <ag9FcXeIIiJWdld7@p14s>
References: <20260501143707.1591110-1-tanmay.shah@amd.com>
 <20260501143707.1591110-3-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501143707.1591110-3-tanmay.shah@amd.com>

Good morning,

I don't recal reviewing the first revision of this set.  Can you provide a link
to it so that I can read the comments that were provided?

On Fri, May 01, 2026 at 07:37:07AM -0700, Tanmay Shah wrote:
> remoteproc framework has capability to start (or attach to) the remote

The remoteproc framework...

> processor automatically if auto boot flag is set by the driver during
> probe. If remote core is not started before the Linux boot, and linux is
> expected to start the remote core then it uses "firmware-name" property
> to load default firmware during auto boot.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 48 +++++++++++++++++--------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..652030f9cea2 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -899,17 +899,18 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  };
>  
>  /**
> - * zynqmp_r5_add_rproc_core() - Add core data to framework.
> - * Allocate and add struct rproc object for each r5f core
> + * zynqmp_r5_alloc_rproc_core() - alloc rproc core data structure
> + * Allocate struct rproc object for each r5f core
>   * This is called for each individual r5f core
>   *
>   * @cdev: Device node of each r5 core
>   *
>   * Return: zynqmp_r5_core object for success else error code pointer
>   */
> -static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
> +static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)

Why is there a need to change the function's name?

>  {
>  	struct zynqmp_r5_core *r5_core;
> +	const char *fw_name = NULL;
>  	struct rproc *r5_rproc;
>  	int ret;
>  
> @@ -918,10 +919,15 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = rproc_of_parse_firmware(cdev, 0, &fw_name);
> +	if (ret < 0 && ret != -EINVAL)
> +		return ERR_PTR(dev_err_probe(cdev, ret,
> +					     "failed to parse firmware-name\n"));
> +
>  	/* Allocate remoteproc instance */
>  	r5_rproc = rproc_alloc(cdev, dev_name(cdev),
>  			       &zynqmp_r5_rproc_ops,
> -			       NULL, sizeof(struct zynqmp_r5_core));
> +			       fw_name, sizeof(struct zynqmp_r5_core));
>  	if (!r5_rproc) {
>  		dev_err(cdev, "failed to allocate memory for rproc instance\n");
>  		return ERR_PTR(-ENOMEM);
> @@ -932,6 +938,11 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  	r5_rproc->recovery_disabled = true;
>  	r5_rproc->has_iommu = false;
>  	r5_rproc->auto_boot = false;
> +
> +	/* attempt to boot automatically if the firmware-name is provided */
> +	if (fw_name)
> +		r5_rproc->auto_boot = true;
> +

What happens when a firmware name needs to be provided in the DT but you don't
want to automatically boot the remote processor?

>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
>  	r5_core->np = dev_of_node(cdev);
> @@ -941,13 +952,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> -	/* Add R5 remoteproc core */
> -	ret = rproc_add(r5_rproc);
> -	if (ret) {
> -		dev_err(cdev, "failed to add r5 remoteproc\n");
> -		goto free_rproc;
> -	}
> -

I'm not sure why there is a need to move this to zynqmp_r5_cluster_init()?  Is
it simply to make the error path easier to handle?  If so, please do that in a
separate patch.

>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> @@ -1280,6 +1284,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  			if (zynqmp_r5_get_rsc_table_va(r5_core))
>  				dev_dbg(r5_core->dev, "rsc tbl not found\n");
>  			r5_core->rproc->state = RPROC_DETACHED;
> +			r5_core->rproc->auto_boot = true;

I thought this was done in zynqmp_r5_add_rproc_core() - what am I missing?

Thanks,
Mathieu

>  		}
>  	}
>  
> @@ -1304,7 +1309,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  	enum rpu_oper_mode fw_reg_val;
>  	struct device **child_devs;
>  	enum rpu_tcm_comb tcm_mode;
> -	int core_count, ret, i;
> +	int core_count, ret, i, j;
>  	struct mbox_info *ipi;
>  
>  	ret = of_property_read_u32(dev_node, "xlnx,cluster-mode", &cluster_mode);
> @@ -1390,7 +1395,7 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		child_devs[i] = &child_pdev->dev;
>  
>  		/* create and add remoteproc instance of type struct rproc */
> -		r5_cores[i] = zynqmp_r5_add_rproc_core(&child_pdev->dev);
> +		r5_cores[i] = zynqmp_r5_alloc_rproc_core(&child_pdev->dev);
>  		if (IS_ERR(r5_cores[i])) {
>  			ret = PTR_ERR(r5_cores[i]);
>  			r5_cores[i] = NULL;
> @@ -1435,16 +1440,31 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  		goto release_r5_cores;
>  	}
>  
> +	for (j = 0; j < cluster->core_count; j++) {
> +		/* Add R5 remoteproc core */
> +		ret = rproc_add(r5_cores[j]->rproc);
> +		if (ret) {
> +			dev_err_probe(r5_cores[j]->dev, ret,
> +				      "failed to add remoteproc\n");
> +			goto delete_r5_cores;
> +		}
> +	}
> +
>  	kfree(child_devs);
>  	return 0;
>  
> +delete_r5_cores:
> +	i = core_count - 1;
> +	/* delete previous added rproc */
> +	while (--j >= 0)
> +		rproc_del(r5_cores[j]->rproc);
> +
>  release_r5_cores:
>  	while (i >= 0) {
>  		put_device(child_devs[i]);
>  		if (r5_cores[i]) {
>  			zynqmp_r5_free_mbox(r5_cores[i]->ipi);
>  			of_reserved_mem_device_release(r5_cores[i]->dev);
> -			rproc_del(r5_cores[i]->rproc);
>  			rproc_free(r5_cores[i]->rproc);
>  		}
>  		i--;
> -- 
> 2.34.1
> 
