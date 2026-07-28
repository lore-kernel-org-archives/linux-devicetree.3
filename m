Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E972D423EA4
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 13:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785244211; cv=none; b=Z+C4XbIfGucdvQP0CgSHJafIZ5V7pSPVpUWXJtXFtwylADygVC5lH36uw19wS4xLMHGXbRCitelDj63aqJjJ+56V6GQSLXQO8d7NkN6CPYFqzYFTIszDauxQ7tVGc2TExX/tq8VFoiQuRNIPzoZ11l3L1pxp4XOFPDIGnWwgk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785244211; c=relaxed/simple;
	bh=U+tfHN98ncg01sZri9VJ7wQMLRSk81hMN/6Uv1K769k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2ZMm9NzcJ9ng1mkS1YC7/a0B61ahkfRLhjKMWC0i3US2hDAFUHuTg/O1fTyGvRy44cZ76M07ZSLtm10qmJ7luaQaidLCduw2t38yUnB+fXRGvCrdOzaAAGHQIQFEhUR1CKNoyDRki8NO64r9ju8kY3roWGjpXUGdqhm86jV4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iGFsRMvp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p0p22kzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iGFsRMvp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p0p22kzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785244208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
	b=iGFsRMvpJZAlooHC1kvifPbLYQV/8DOBqDFH5Iuu8EaCfl4aAiZIl04+nV2Dizo1DakxZo
	C7xr3o+6A09+kFwEId/WCxc7Bj5Brdp75+PuDwzZAulA76QM9SgzN3URW65VKjfP0BgnI0
	Z/CIlCldvJe2xzFt3K550RjvSrp2tuc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-e0KPWPULP8unnKf-0u4lIw-1; Tue, 28 Jul 2026 09:10:07 -0400
X-MC-Unique: e0KPWPULP8unnKf-0u4lIw-1
X-Mimecast-MFC-AGG-ID: e0KPWPULP8unnKf-0u4lIw_1785244207
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so483540585a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785244207; x=1785849007; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
        b=p0p22kzArOn2T8sq6ks/AGowrPuUBT7HpW2XNFLjdvA5si2g0Wq8HJhmYsNIgOWLGS
         FRzVg5AbanEFCpcwnP3AjOCvpMQTzPyOEJRjPbH/rsIegZegtAgIZdzYTN0D94hdCoqf
         5Ou3S5v1B5S5HEW9CfqXZf5fm04x+G2ePGoeXHSTH7PJIBFrxu6yHbHv3bn1z050Hlor
         eEYGzQ8BSAXgoIuyYiakK4DRqq7KAEYkoDNc+ZNbhcBPHb2D+US+ljjfOzXA8lW6MU6V
         3zeyJLe6N1cYu3YEia9nBr7k/ePbf+b4YvCehNsFBZnzXbtzTRYRn4uf9126EIszJkob
         wmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244207; x=1785849007;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxbqXLAunmT2qGsW55SMRVrOQZR4H5ggveSMTVA7VUM=;
        b=RwcS8ewU3uf7G3KqNDYmGkCPIwF2xWjk9K89/F+wdD+MbawyDz2GKMUOtVGntMJVTG
         ZXGM2PEyLBRNru4mGkueVdsH3sDuBphBw78ulyUOCbp+a2In0jFvzn0yvlcTPT1tj9IS
         BqflwuIEA+w0PxZYFgPlqmclQ3iEG9PjOeXd3L4sLzvMXHbsv6GXT3OzKGC1rJLCWUaC
         bHlOJrYPZdQ7S5o9Vim0bhdh8j782jnKDvyZKoRdQbwTRsz80dfKz86GPfo24O+A1pEx
         uZg5oIn92T6R0FMdkCTQVk+4fRK+gmRDaIgvq7oOlCn52LjgwucdRGEWgCWunE5TtxBc
         HQVA==
X-Forwarded-Encrypted: i=1; AHgh+RpRxefQOKLG7IRklhBUN2CN08ZE48qJaranzCGUzNUBdEp/5QYJ+zbVSm4lpaGMByufvoq93k6Zag1K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9oM7jW0iVixBtFgnw6L4WfXPVjZa5JloUQMd2ftfyEJmrXZJw
	gWvr2t16I9wL8jambIgajPecXvovrH58YVMSQxL0EWqNhK3/t9WNrwEebxBLLQOoBcgLMaFS3hR
	OSuO0/deAlQS0F/xlCv1rL78de2/H7lmNXdo7M8dmRp/iEpNOjJOrzpixFP0SeeU=
X-Gm-Gg: AR+sD13+mYywf7OngR4vfnNFvl6LuYTxHAwF+PSm8p+ujIqR86wGXd5X5ZlYuLoN8D7
	aZ6YGpykffGjbjHnSR1ZwnPTvzpSgpXr05YMqDM4x5sxYFG1Dfj4UVtgWNhl/lw39S0fTZgpaCa
	eq7J5r5zp7t5NcfK04DVNoH7Yt0hARWEj1nIKd1eFfz+OpySywqqGXlgOWqk2v715d+wDu+stqq
	dKew5Q2W/ipEa5WLEuOjG7M6cE86ro32cuAkjfbRG/qzX8CSaLO16oelopyS075IFzmIz7l7SwZ
	wRCI8FXH2BTbcwSP5QuogZsuC/btOGjXiDWPqDwXaZLqgeP/4SAXDgZ5A5Cx/U46JqRbhou8Chs
	SDQmZJUHqL6cElZgFza6okqmdtLYR5wgsVEs=
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215985085a.27.1785244206190;
        Tue, 28 Jul 2026 06:10:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4446:b0:92e:7a3c:add7 with SMTP id af79cd13be357-933025a4606mr215965785a.27.1785244204887;
        Tue, 28 Jul 2026 06:10:04 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de635f6csm831797885a.26.2026.07.28.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:10:03 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:10:01 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
Message-ID: <amiqKRkFItYwD6oL@redhat.com>
References: <20260728091804.382753-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Chen-Yu,

On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
> 
> This is v4 of my MT8173 PowerVR GPU support series.
> 
> This time around Mesa was ready for basic testing, using both vulkanmark
> and glmark2-es2-drm (with Zink). Details below.
> 
> Changes since v3 (all in the clk driver patch):
> - Changed pm_runtime_put() to pm_runtime_put_sync()
> - Added missing of_node_put() in remove function
> 
> Changes since v2 (all in the clk driver patch):
> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>   - Needed since the driver implements PM domains using the generic PM
>     domain library, which also depends on PM
>   - Fixes build breakage (kernel test robot)
> - Fixed "RST_DELAY_CNT" name (Brian)
> - Dropped unused mfg_desc (Brian)
> - Added check of clk_prepare_enable()'s return value in
>   clk_mt8173_mfgtop_power_on() (Brian)
> - Saved error value for return in IS_ERR(data->clk_26m) branch
>   (Dan Carpenter / kernel test robot w/ smatch)
> 
> Changes since v1:
> - Adapted to changed DT bindings
> - Dropped driver change
> - Use same power domain for "a" and "b" GPU power domains
> 
> 
> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> some Chromebooks.

I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
go through the clk tree? Patches 3,5 go through the DRM tree?

Brian

