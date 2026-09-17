Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13437592217
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655385; cv=none; b=A3lPUZL12keSdFJzzLsboMbQR5lEC7ttQw+A7ZOIEHaYLpfWtEBQRszNu3p0+/b14M+OB8mmXL2ekaodVlY/BwLum94rLfCc1vA+BWfU0bCAXuz4YHRCBHaWAG8XJR0tnGGExz3jkVZPogcKA1vCh+JJLs+IhsCwuje8+xn4QpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655385; c=relaxed/simple;
	bh=KK99SGOpVo0Sh2l7pX+m5thw7TySG15JTH25D7b445s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuDgpG29JZdI9IomDXLYXRa68QdgFV2Go1uKD8KmFzA/XJSxsYoaI6Z0MOU2XyDzR/i6fsIG05B9iU1PMyc9OL6Qfw5hw6GVoTkq837wOrvuNXcm2eKPsrvHI07WBRL5ZAmBxCm5pTFkX/iZ/rDserWCbA8w4B5vFGkTGAEdh4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YjCZ1zJ2; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YjCZ1zJ2"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a58fef219fso3725401fa.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 07:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789655380; x=1790260180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLUsM28SSrjqBmi4DDelq5Ueb0+ylvS4bDAd6TEXb10=;
        b=YjCZ1zJ2xBEAnj0paJGkrWY8WewXRlexrSxIG+7MouP3+uvJ+F39sfw3XuEI1rnpKk
         GuL54IpC0w1bCVMiiiB677P4z/XBtTV+7MLZGzh667RJy6xLGhIfakH6Tx0NBH+HuTJD
         EYjN5taBqcwBBsGm0uxgSmTLt+Fv6UeZNJRn2htSidUtzYDRaqfouI2Qv6dey6gJC1rT
         FDVOXvNHivxQOBxUL4jpBWLvZYLoF1q+xHZF4pSafZQ/UYbiHkVaOHayUiCZiQGMAxts
         Qy6uOJKrDoQGyOni+zbP1fRjIy834CMBO09/0AGCV7fYfxd1YurrD/WUIM+LDpQLxsIa
         Ho+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655380; x=1790260180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLUsM28SSrjqBmi4DDelq5Ueb0+ylvS4bDAd6TEXb10=;
        b=l2RfdpHokStU7VehhN8skGijBDN7plADE11DIsv0EOKd2q6AqIoa/9PPYD0i3GUcvG
         XWFSsSWyu7ahgtW/fYg4tYjccPhBkYtAkwUxypWWa/7jaB3NocC/9Zr3PUOsc7ZNPGlG
         QqR6VGPQkZzMjyGD87VRfPnqeyuGAgFSLlMiPR6erLIDRA6UQskzAwd8e+vqfJNAGI/z
         w4ECktz161pER2b09UhaSKlP0/ZXMOtu0fpzx586G8NK0i7r+I0VxMZBBNvE9QVfwvPR
         8QckeKjn7qqpOokH9owGubTMLBqYTwthwaOSF5hWQIp9rMa1CP+M7I6YoCIKVH8uq15Y
         z/AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxii9kEUS8jNExTlC9O08FcATnjmU1FcfQxK8bgCGlfbgdi1LhzfrH267PSsIJcTVvPVmL1wF/ipOkQ@vger.kernel.org
X-Gm-Message-State: AFuF++niSr6ybhGT/hdumqZCTkdPz4VO3Di3dr5GsH83qbJ3HFBETWfj
	5R6HBFHlvb4h1kHBqiQ2aELm4Qq5Xe73nVL/zOCMFLI9qqhI9TLe0KdoJFRwEnXJ6jY=
X-Gm-Gg: AYBFou0pyExA+I/hfwA42/SIyxey0NMh8mN/XsnSEr3SnoByi+wTYB6iL40KXHUT5sh
	Xo3qKh0zj1bHTSgUExTDvRmNx/C+a3VmPxK8cYpIA3H9k+IgZ+y4VQz+LJpLXDJvMNxWcbOpREV
	AevgFKLbCGaoy/1AXg0GYgWGSLtPA41pOCRsuIryrT58LmBTTQBsO+X370rmQPH21OMfblgskgW
	B4jxKmYyEtaNK02O19icNWvVFlpMF4gG1e8L0T6Tzt268YlzsffDfPHuVFSFkOgILm/38oBMMJm
	yFHjdNIwJeqeYQPAU8iTnhdTFD++0Ujw7r8nPFnyapa36HZRSJqAxjp3WF+327XzJ476hWzdkmR
	tpwOLDEac0Vdfm7pAQEpYTDu4VYKoIinSen466W7e/XWH6804ybwncRI88ammh+I0bAcbmgHrAH
	qWDxnYWHgKxAQzsiRqLn1qKFC9TY86fUx/yZcjJy+7TC6TdtODu/NAID1JKf+XCvNwHBvsAcVi8
	+YdNQ==
X-Received: by 2002:a2e:bc10:0:b0:3a1:fa0f:5d21 with SMTP id 38308e7fff4ca-3a5e71460b2mr7532451fa.3.1789655379911;
        Thu, 17 Sep 2026 07:29:39 -0700 (PDT)
Received: from localhost ([82.145.119.8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5dafee366sm15755461fa.42.2026.09.17.07.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:29:39 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 17 Sep 2026 16:33:18 +0200
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrea.porta@suse.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, saravanak@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] of: unittest: Fix np reference leak in
 of_unittest_pci_empty_dma_ranges()
Message-ID: <aqv6Lv5EZrziJVOR@apocalypse>
References: <20260917130307.2152615-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917130307.2152615-1-vulab@iscas.ac.cn>

Hi Wentao,

On 13:03 Thu 17 Sep     , Wentao Liang wrote:
> of_pci_dma_range_parser_init() can fail when the node lacks a dma-ranges
> property. That error path returns without dropping the reference taken
> by of_find_node_by_path(). Add the missing of_node_put().
> 
> Fixes: 1a75e81baf4f ("of/unittest: Add empty dma-ranges address translation tests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/of/unittest.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 939cbff45ab1..6bc5babddf0a 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1250,6 +1250,7 @@ static void __init of_unittest_pci_empty_dma_ranges(void)
>  
>  	if (of_pci_dma_range_parser_init(&parser, np)) {
>  		pr_err("missing dma-ranges property\n");
> +		of_node_put(np);
>  		return;
>  	}
>  
> -- 
> 2.34.1
>

Thanks for your patch!

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>
