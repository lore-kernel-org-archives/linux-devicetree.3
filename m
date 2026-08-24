Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06C236EA93;
	Mon, 24 Aug 2026 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584945; cv=none; b=EYD/g4KeK22tK08QfUnE09HRlNW45F8WsmCezxUlAszz+5x+MRVZd8bSytBawVS4EBWzYtXP6BV0SE6YD2X/nzEuITn73pHVg2c7mgS6VQ2UHTeuvZ+T+yansTVM3iltCjz5HhIuQK75Ms1UsHLvU0FqeQQU5N1eer6oYnHYplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584945; c=relaxed/simple;
	bh=uS2xIZbzLdsQ6jGYoq7awlY+R0+yW1/utnd6qsmgcdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm77gxpfjRw3tec1oB/32nljpo6zWxq4vA2wDZlec8ZCGuXghjEwSva0UaDggPnddLbKGnVyEOpdQjnDiKQmpUOde4sYrcVdjjRV0jzBrQo5Z8C/BZNMfOGTOi/t7aV3/BlknSiVX3J3xiUSKPHEEGbMNQx+N8T8/gYT+aGmm/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7df5qoG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7df5qoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787584939; x=1819120939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uS2xIZbzLdsQ6jGYoq7awlY+R0+yW1/utnd6qsmgcdc=;
  b=l7df5qoGTaLAylOQ2AdaquUunGj04nfaex8g+QJapdLsuofY/5ER9Ong
   e6hZa5RUgILF1iSo7z3F75pQqG/gT8QLEZ+8i3CG/lDRyDpfBcbLi1rfi
   wQEDBWbRjivWpYlTea0osepAOJX/M2Ces4DcU7sA9AGQMyMZhq1s39cHT
   M9c2gRzloH1hT8gMrzALanPkaOfrLuJwTGeKyC9kHLOJ4qlu+dvPm3SxZ
   c/qqE5kOxbTNue4J1/7We/41ykqFnJtrgSYbOE6sUS3TONUR2pZDJTLaF
   DvyOTyRUhrOinhIwa3TneR2rhg5Qtv+BtaRGV3DKamAKLUsvqEsTMC5M7
   A==;
X-CSE-ConnectionGUID: rPgByhwZSzWlkOadW8pzTA==
X-CSE-MsgGUID: 6txtC/O6Soa3hC7Y+V5zNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88241425"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88241425"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:22:16 -0700
X-CSE-ConnectionGUID: JL6v4/tISb2nj8yZowLCVA==
X-CSE-MsgGUID: ub6DQ2ocR+y3ihV+537KRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="271238495"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 08:22:13 -0700
Date: Mon, 24 Aug 2026 18:22:10 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: javierm@redhat.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, holofermes@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/6] drm/ssd130x: Change SSD133X color format to
 RGB565 from RGB332
Message-ID: <aoxhoqad_F99VtBL@ashevche-desk.local>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-3-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823111959.17029-3-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Aug 23, 2026 at 02:19:55PM +0300, Amit Barzilai wrote:
> SSD133X screens were driven at 8bpp RGB332 despite supporting 16bpp RGB565.
> Switch the SSD133X data path to RGB565.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


