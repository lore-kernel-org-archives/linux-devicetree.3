Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200438;
	b=iUNkUAZKsw0Ne+W0wQxnQlLMue7cVSJ1RPt6bURL7NRUsRGz5eKlBCUeIFuNGuM3FNuM
	 C0qgn8MJbZYqVgcfo7saRWulE6/mRKluHgwOi+49d94CsjBX1XYH2aaDOSNfokwjrfRyk
	 ZOCH4+0/4HfJrvd4azvw5gsKVK8wmAujh39oQwo2VCHC6FmRpKV+MY158Nh/W8R9yodWN
	 E62TxirOpU+i/k6rYk8vmbQdrsXt2VCTcKQgQlzhTmDGl6odUvlrCLkiuapCLfF2KXyer
	 ZqhgaSVvYzU+5jxTrK4ZAwwKMw8V2x6Jc0cjTCuKdfNNwMMXFV+Smbv15sfhPxFV+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
	b=oZ7WOVtIhCMB6OIiw/GWZxgCWKAFSYH904TmczYeQwd8p0P9RTxfelHsVrt68/ZlgxXX
	 CUpZO/Fp5En55XW2G5l5k8WcfOyW+nBU8N+7B5K4IYMbFD+R7+pVdsyTfMqDtOEUTS3yV
	 U7yP8hQKbgkITaKKNncI4X6K9oycHcSG5zaSouHY8Vp8I5bYOUBKQJ4+D8WMV/UfQXF7m
	 WSTLSRgjk22vQzDNlDIpFwg+q8oXYENfcoNeollpu2jppklsZ417gJ075oMOpE4k7cbDH
	 Mub4AbqZvRsD/JSURCNnIUFy5P6Dzf2WFCE6dSlPKomqqH1FPofQEDNqL118kE5snWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsoq9tDF;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F360A2634
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 237F360A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsoq9tDF
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso602721f8f.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200436; x=1795805236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
        b=jsoq9tDFY2Ns3Pm1V3FdvoAq20Pzi3f6JMVbc584HhPkZtwkO+zehPRvvxTe5RPBHg
         nmSQk5MHg8Mhk6lFf0PaI9ROCSLNEsIHScTeH5JEJPA8riCmlMKQStsX+Af6zwBHx0/X
         3CaBcegjGCscrOK6j8igh6DzGEUYw86K6fJ4t+drn9d08wwJdd27TEzLMwWeLyRm34h0
         XLQOIIBpD1PTm2Lk/u2y/XQWljOBImADeAxcL9vYuOpkQyktyf1fIOv+G5eFE/26AILw
         lWW+gyvlKRJnHCYv2Z1j2uRN+p0x/JauPGflgDY59dXTbqUat0ITJnmosPeI66+83sJO
         Ymvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200436; x=1795805236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
        b=lYxSN8q4NRHRkhp+8h9qQp9TxPNWQc+UQx4DEJDdP2q5mKnqzQgPFPIF/e5HDuafqq
         8fQQFWA7vVktFX/dQXdU2x7OIh6L0H1Brf4L7xKFmaJejfYjiVWML0D1r8QPaDpLSyHL
         kliv8cWy8tjT/LfY6PZohdiyoXEsYO/H5OdIoCbvC7ji6/Q12xFY1xgZH0wwDL3D37KT
         3STq3j0WfeTmJ3LoV/00ryg97bz/gzbxJvyAoomYPIU10S25I8VVPEw/fC23Fan9EtAb
         9myqF8wYj91enag+cIzg7p/2P4pHoBVamnjaLPwtAqlE6K7zU+S4iMQN6BzNL3vpx2H6
         UqiQ==
X-Gm-Message-State: APuU4Z/Ok1DBahS1074Ojuz3b31I47gmhYTjCYOfaYpw9A0C8kyz7wve
	Qb1gcOAB74Nw8HoS/Co4YJqiez25oUBMMTKuCBHqPAc/WafmkJNbntiC
X-Gm-Gg: AZFdTZdkAuxLdqOI1J2lbORzfdSQF44sziFTRvy6FuoEf6aHUb+IdN4SSrP65YODlc/
	Y+t2F7LMauNWPiX+v29G+xYuEDaRZSh2xwjVt7XK8cV7WpfCWAwtg082KBwGSg3CDPmJpXvug2t
	nQipHdDYynr+jjAX8NZarIyYx4TPSs+LM2BeJ0v5NpZsqPJyDDHw7lPhTiNvoi+ElQF7MSUFqky
	qazJicc4DSivc+Z81x0NFYZPCWcWAPu0WsScW1Ia9+d+oIm7mIlVm/GTS9Mk1eOMcCb/v2eHD7n
	V9g+3PicmyPXKzJ0JAmvRzdYbEiNThFq8FVJPvLv+wK0i984m5OGiwgEoylWq6Ye/pSQrtClLVr
	cQLPeqxJq4AoVuycwwkITerZ0tdbbR/eVhc+UYZylSX6GeWm3LFrPHWd3u3vk6Slbpr99DFtf5/
	qi027y5IGflJAHJiFFCjT1xyV8V/n+TgLr2Y5pLAuXxOF+BijmJhy+4PMDJaQFRdXVGMgjJvEg7
	jxywWwkca9LmTns/Hza2HcQpXFVema8Mf+CY3+BkdzCBeVR+szZwveWDjsnnSFa2S7BxztfYbjY
	EK1F4V48wpbwiigu2E5jUPg8fmhohj9Bi8nx7xh7Rf+OrLtKKwZ6exfz6sGyNmorpvny9In012d
	j+aCu/Z1U4DqlnlnsjXQ4VRcglO9jX7tKIN8b5JDTrXw2tYDRdwmFzHMiHYu8NYN59y9SBqVAds
	E=
X-Received: by 2002:a05:6000:178b:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4abaf740208mr9570917f8f.13.1795200436455;
        Fri, 20 Nov 2026 10:47:16 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm7490817f8f.31.2026.11.20.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:47:15 -0800 (PST)
Date: Fri, 20 Nov 2026 19:47:13 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <awCVsf3BF09a0ukI@GLaDOS.station>
References: <cover.1795197853.git.stefano.r@variscite.com>
 <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
 <sashiko-outbox-225865@kernel.org>
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
In-Reply-To: <sashiko-outbox-225865@kernel.org>

On Fri, Nov 20, 2026 at 06:44:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: freescale: imx93-var: memory@ node names break
>   imx_rproc matching
> --
> 
> commit 3b76dce88eb56af58d06bc8653db1a91c42100e4
> Author: Stefano Radaelli <stefano.r@variscite.com>
> 
> arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
> 
> This commit adds Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata
> and VAR-SOM-MX93 on Symphony, moving the common M33 include into the overlays
> and reserving or disabling affected peripherals.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> > new file mode 100644
> > index 0000000000000..51ec0beea7c9f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
> > + *
> > + * Link: https://variscite.com/carrier-boards/sonata-board/
> > + *
> > + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include "imx93-var-common-m33.dtsi"
> 
> [Severity: High]
> Does imx_rproc recognize the reserved-memory regions included from
> imx93-var-common-m33.dtsi (both here and in
> imx93-var-som-symphony-m33.dtso)?
> 
> imx93-var-common-m33.dtsi names the reserved-memory nodes memory@2021e000,
> memory@87ee0000, etc., and puts the region names in memory-region-names on
> &cm33:
> 
> arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi:
> 	reserved-memory {
> 		...
> 		rsc_table: memory@2021e000 {
> 		...
> &cm33 {
> 	...
> 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> 	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
> 			      "vdev1vring0", "vdev1vring1", "rsc-table";
> 
> However, imx_rproc_addr_init() and imx_rproc_prepare() look up regions by
> index with of_reserved_mem_region_to_resource(), which sets res.name to
> the /reserved-memory node name rather than reading memory-region-names:
> 
> drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
> 	...
> 		if (strstarts(res.name, "vdev0buffer"))
> 			continue;
> 
> 		if (strstarts(res.name, "rsc-table"))
> 			continue;
> 	...
> 		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> 					   resource_size(&res), da,
> 					   rproc_mem_entry_ioremap_wc,
> 					   rproc_mem_entry_iounmap,
> 					   "%.*s", strchrnul(res.name, '@') - res.name,
> 					   res.name);
> 
> Because res.name starts with "memory@", imx_rproc_addr_init() leaves
> priv->rsc_table NULL and ioremaps the vdev regions, while
> imx_rproc_prepare() registers all six carveouts under the name "memory",
> so rproc_alloc_vring() fails to find the "vdev%dvring%d" carveouts at
> runtime.  In addition, fsl,imx-rproc.yaml does not allow
> memory-region-names on the remoteproc node, causing dtbs_check failures on
> the new -m33 DTBs.
> 

This series depends on the following commits, already in linux-next,
as noted in the cover letter and in patch 2:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

The driver change replaces the direct calls to
of_reserved_mem_region_to_resource() in both imx_rproc_prepare() and
imx_rproc_addr_init() with imx_rproc_rmem_to_resource(), which reads
memory-region-names into res.name. The binding change permits that
property.

With these prerequisites applied, the generic memory@ node names do
not affect resource table or vring matching.

The reported issue applies when the series is evaluated without those
prerequisites. This series needs to be applied after them.

Thanks,
Stefano
