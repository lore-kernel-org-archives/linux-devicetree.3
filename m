Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744304;
	b=n1Ke1nHq5m7jTgLgdeTJIbhauG4iv8F+q+YUdRds/zQNr8KxuFSXzKH8idZseRYy92TG
	 gjG+mmBPOJptJeLNCe8UHP+A/i0rEK35y5DQL0RYw5uliCFVX7KuQCfc5fl7mUtgm14sB
	 +IktwGvQ2QLZos+QNcmwBLFvVFXwUDnewTsVNybWxnJzFyrDXUEk8KGRKFiBW76WDdROC
	 PnqnEcc9RSfdJX2naorJJ8c25UZJJ16TWrP4yOHFV/TafB15CojJ4fCzSPKNX7StrG0e3
	 CgGx26tgk0/uHuGODXC25VJ5zR1eIflTd3nLOeXVGpRx0+6SsL1PPdjIxbJNFV1dNmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
	b=2dbEGGm3P2IP2FcGbbE2Sd7p1g/x1kYxOC8uUNn7Agxav5tNuqa93z95AWIHJ7nvaihY
	 FCK+suyMok0anyZuq2Zrgd/28I7L1VmpDbv2MfnCvV4ecK7iuWFuPyMz51nlI1LyeooPa
	 oYcerDyMty93drKQ4uqJ5wOWgMy1iB4ar3MiaVZxfk8eYnAR5q3WLkBC2F/PJmrtTs/P9
	 xLXdHPWbjdZ4NVtTWl9S/VaM7JgUIRyaEyi6dW84rmg9FgLGyasIaEUlAs3Ptl9xEm2ej
	 TZV5/aQry/WYLJo0Ye0emdKBXbcTDjSrMb9qTZBQnWDE4VvnI92U3ls99zyAfHrH9wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Q1I26F2i;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E623606A329
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 22:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E623606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=Q1I26F2i
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-943e8d35f74so11583885a.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 14:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793744303; x=1794349103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=Q1I26F2i7qTnQcDnp/V5gFkScUwzu9WDLkuUmT90rA1siQ07PmAy0n36nD8KQf95fr
         +tKyPWKhlOBBOda01+skyIJqpuuyPp3DDHSk/+U8hTD9jaIA7incIpQF3oHDAeQLGJpr
         +/EhoMfzHAc1hCbSLR5RTn0fOaCUXSz9sYEBauecZAKlJkreZXJ8NY7EPXYljr4Ywwgu
         jl+eovTps7y5WA2rITD+mO8s8owkgFMXwVS4dbSZ1V2+W5I2hBC7cQNezjeLWYI8xpjd
         NyCT8nrnH1kWYHF6iDbzzHQt4NH4+ML26MuJFOEhDbjPMihDs7qZPa47hp67ChOXPPCK
         YHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744303; x=1794349103;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8As4E/KdAw7NAVfm6INK2XK3D5NC24RXlj/wbGRuO4=;
        b=lS0ZTUz4aiMdciRWULowU5WY1FrhfrI+diV8l+rovR68XtbgaGp/fs769401ENbC89
         NhUndkGDWNvbgfck2DFU5/yhRTWG1jkSfXsRqgqgL1NfXF6xZdfPWqfYcTBg1hMXba/K
         nVxchanyGzOYEeS4pa0AE/eGU/HM6oKsBayNUJyk7aELUnu99aYD6Nx/rqsGYvE9wg+q
         o8/kQsekQzgFLzSGyWRm6B6I9zJhD3Psmp/+S+QA+jOt9vDvBoPsKZ4VQSQnevtyrcBu
         eRp1TUKhu7mAfNcHIw1+FUSn19wqSatDgNc0xNvrmlHcN2huD/oaSRulri8IAD1iud4t
         da6g==
X-Forwarded-Encrypted: i=1; AKwUvBxgUiba2LPbY61p+J2WJE0sSqnd9NkzwJ+BEi0fwP29bsnUf41fuH/629gzrUsjjVfbKIC02Oztdq2O@vger.kernel.org
X-Gm-Message-State: APuU4Z8NndrtNGRl4SVcub0zd++5JUZpTb5rjMUhEKeVYiGNqyAxGqRy
	AO3oZlQitr9NciE2ynygwPcuY4w/nWm4BT2k9VdfbPe4rirdBqsEZHr82U/hWUnPbQ==
X-Gm-Gg: AYBFou0YuVe72PXKphMWePPt6Uf6bVKSuK4V0G3xhM4NMhRE0neF9ZhXFgM8XYclEw6
	bCyzpqXOGrlf9EoRIoTHbEnrNdQc7LfWiYdcGvyBBcxe3Jq7cVXcDV8legBIiEkOwLGzTIj3Mwp
	NvK6O2WxaOD3kUwE62kQgqnFZjHTkGKf7beX+XyWcpku5Bjz/maJ8iIyIFohvEuT6PO8tAkZDRB
	rawx6dfotbtq/J0pxRDy9eCp4AmB+CY4gLguikZ4I0qPt8mHALaBnC+hlYlL3G9BeNuQ4u4Z5wB
	uYyjIUy8aLsRgq740uGR2Gu4kNiAqNHNJqjYWh9KIYhijEAuq2pJV+v1QC8UnbWOJvdfSCBmDZC
	ZlrZgvFez0ORySHGtqghbVS+au7Our/1Uucf9alt8839ocxlzpXTiIgk5NeiwHeeY9ebdEQufoY
	K4vRWd2VnudxZ27p12/IZGCVK53c/wNCLFqpL0aXggGIfQceArqWx0Dn9xmsxhn9SIH9A1Nx+p2
	R0TnFFKIOb1PMN53ajMQQUAf1flJSagV1whfY7kpoiN8zqrkuV55bUqWm0FaGh24CXP5IfwBIIP
	yTqHlJEGaahu9ZER/TAJdSqo7LBJ
X-Received: by 2002:a05:620a:3183:b0:93e:f4f4:346 with SMTP id af79cd13be357-94421796ea3mr2392800885a.39.1793744303281;
        Tue, 03 Nov 2026 14:18:23 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47e72fbsm40889685a.18.2026.11.03.14.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:18:22 -0800 (PST)
Date: Tue, 3 Nov 2026 17:18:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, michal.simek@amd.com, robh@kernel.org,
	saravanak@kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-xilinx-of: remove the driver
Message-ID: <3c385fb1-551a-4717-a1e8-77b123cec0e7@rowland.harvard.edu>
References: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
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
In-Reply-To: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>

On Tue, Nov 03, 2026 at 11:47:21PM +0530, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
> the compatible was never documented as a binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
