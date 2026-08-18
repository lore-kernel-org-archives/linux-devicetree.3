Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2007422541;
	Tue, 18 Aug 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042227; cv=none; b=kom2SSE1V1lrziJ9xUkmH9TQdP9g9dxFQvTOC0PCtQjmt5jFsIXen2T06QybRNOe67if0vbJm3LOlw8a4zVm1qrFjnL0wn0+b0HMQ6/eXLHNp5w8y0epwskWeJRTUJD3JmkovRztXD/jDMJdg2HWS+YVOoEKjH429fNIN1l2Pp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042227; c=relaxed/simple;
	bh=4b7I6huqeATBrGSn+Z3OSgkdRFOhUFuXxaN24NMCxmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4I95eApHKsF0sGTqIOif/cWntQ2c21VZLTlCBZh0lMtU1nGFWwyAxpgByv5n3PcmV4wm4MeNyHAPoAM2QOhIPPfUSneU1f3zrX8uQE/JTVe19wQU9v7/m693/PaXaRzF92L9U40YKqoj3aA0DumTJozNXm3tLBiDZSRDk37+pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSjBpHDa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSjBpHDa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787042226; x=1818578226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4b7I6huqeATBrGSn+Z3OSgkdRFOhUFuXxaN24NMCxmQ=;
  b=mSjBpHDaNpWfg7ytaUDHfbAgDaEFXLRJQW5TNiUQBuzCZtocWYDU2b3G
   27JnWYjOstCSMkz8neGegx50fNrHvffGPA21wttNHjpmAu2UtYeXrwLcB
   xdKt+7jXWOlhdwshe+Dsl8weSwJ1vu1Q9xSKxxzfOOrfvHEzUS2pLATLn
   b0puTsJc5KUL06IOlU6+yP6VvhtJP2vnPmpMQMN4NmlbLdYxyVRNwHVj4
   eJRodsLRfGa6b6639t954ejcHPyMAxeErxZ8rWaPHgd6yiwTD1985Hemx
   Cd44egVCuUIS5vcPuuY80YPNx/JUEMQ8Zv6G5TU7MWvdffZzgShnJUouK
   g==;
X-CSE-ConnectionGUID: zM74EtbWSkiJeIQilaiqYg==
X-CSE-MsgGUID: 8AUlBVkLT/6ecHAdqmlLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="90040430"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="90040430"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:37:05 -0700
X-CSE-ConnectionGUID: dbiVEkfwSVqyGrHS2NSAng==
X-CSE-MsgGUID: 2MyR2/xpRr24LqqdGdKAHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269007555"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:37:01 -0700
Date: Tue, 18 Aug 2026 11:36:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] drm/ssd130x: Change SSD133X color format to
 RGB565 from RGB332
Message-ID: <aoQZqnbqoiOw6MKt@ashevche-desk.local>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-3-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080626.30430-3-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 18, 2026 at 11:06:22AM +0300, Amit Barzilai wrote:
> SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
> Switch the SSD133X data path to RGB565.

> +	/*
> +	 * Horizontal address increment, normal SA,SB,SC (e.g. RGB) sub-pixel
> +	 * order, COM split odd even and 65k (RGB565) color depth.
> +	 */
> +	u8 remap = SSD133X_SET_REMAP_COM_SPLIT |
> +		   FIELD_PREP(SSD133X_SET_REMAP_COLOR_DEPTH_MASK, SSD133X_COLOR_DEPTH_65K);
>  	const u8 cmds[] = {
>  		2, SSD133X_SET_MASTER_CURRENT, 0x06,
>  		3, SSD133X_SET_COL_RANGE, 0x00, ssd130x->width - 1,
>  		3, SSD133X_SET_ROW_RANGE, 0x00, ssd130x->height - 1,
> -		/*
> -		 * Horizontal Address Increment
> -		 * Normal order SA,SB,SC (e.g. RGB)
> -		 * COM Split Odd Even
> -		 * 256 color format
> -		 */
> -		2, SSD13XX_SET_SEG_REMAP, 0x20,
> +		2, SSD13XX_SET_SEG_REMAP, remap,

Strictly speaking this is now initialisation of const object by non-const value
(yes, since it's a simple integer  there is nothing in between to modify it,
 but still...).

>  		2, SSD133X_SET_DISPLAY_START, 0x00,
>  		2, SSD133X_SET_DISPLAY_OFFSET, 0x00,
>  		1, SSD133X_SET_DISPLAY_NORMAL,

-- 
With Best Regards,
Andy Shevchenko


