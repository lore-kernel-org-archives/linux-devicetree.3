Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A579B41F7D8;
	Tue, 18 Aug 2026 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042462; cv=none; b=QsLbwnsY5DARafb96Y/T+Bmut5EnHnpNa8HIl/4Wtv+o89LS92x5aSZ5woNgvbkE3emx9lcSy6yM1Hm38n900XcGLs7srPd7Sc15kakphkm6JNQGpm8iG9tTHdwlDzSHmogca2hg0W2ZffM3BvK6bxLeAryx9xe/V+rMnjK3q0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042462; c=relaxed/simple;
	bh=Oa/B4ErRDtcBhjxdDl6vzU+r+CGXjmtAt52cbbTCtWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCQIS4Hg7fh+4Lg+8pyrNNRPXmnDjbLuNHR4/bL4vTC0JtIv/93VEpFicgsFgJINndoxrsvmFhFN2IMOSKCqEXkKVAVdhMRmeI0S2iDuBWo192WJfU285ozgFnbWAa0mX/odS+3MxUAutFcZ98eyd4+Hj4p1chaNrA472t8yfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hcj6dbTG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hcj6dbTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787042461; x=1818578461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oa/B4ErRDtcBhjxdDl6vzU+r+CGXjmtAt52cbbTCtWo=;
  b=Hcj6dbTG7yUvCMTBylM7TFL175gV7VOxomgFoeeRocHYdWmUme5QTuca
   HDaMsmi0vE57mWITN8QPEPPVxz520u7XtSKJRtfN0jru8Amp6CrLta435
   9CQ8haTGAU/tbAnivYdcKrwuuXQktL6y01ARbmcaIhiaE/elQV3hx7Zxa
   yDoxz5TLous/DIf7Xpx26o6NOBUQyy+zi8WmuT7aZnZr+3L4Hbjx75F5q
   9fZrhvP6+LDsb/9TqZknyirZuVwHtT454seIFM6VihsIQefOUCWZcv8Oa
   LF0gCW9TCCNvrtXHvDCcfhjyhKww3wEkF1CKtI7JlWqH/1gJDnxLxAgFl
   g==;
X-CSE-ConnectionGUID: BoNtD2EYRk+QoZNziJLt3A==
X-CSE-MsgGUID: F22+82v9QWODf65iU5lavg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98892666"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98892666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:41:00 -0700
X-CSE-ConnectionGUID: 8UYax+CUR9yN0iPGYnJXSg==
X-CSE-MsgGUID: GKfjqWuBSem9vlcYvnQ0yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="263432723"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:40:56 -0700
Date: Tue, 18 Aug 2026 11:40:53 +0300
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
Subject: Re: [PATCH v4 4/6] drm/ssd130x: Replace positional ssd130x_spi_id[]
 initialization with C99
Message-ID: <aoQalR40NMFSg8zS@ashevche-desk.local>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-5-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080626.30430-5-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 18, 2026 at 11:06:24AM +0300, Amit Barzilai wrote:
> ssd130x_spi_id[] is initialized with positional initializers, which
> easily create easy-to-miss bugs when changing the members of the target
> struct (struct spi_device_id in this example).
> 
> Change this to C99 initializers to guarantee each member is initialized
> with the correct value.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

>  static const struct spi_device_id ssd130x_spi_id[] = {
>  	/* ssd130x family */
> +	{ .name = "sh1106", .driver_data = SH1106_ID },

Hmm... Is the comment correct for sh1106?

>  	/* ssd132x family */
>  	/* ssd133x family */

Overall, what do these comment bring us? Are those families have something in
common? Because the driver data is unique for each device, so I assume it's not
that compatible inside even the same families.

TL;DR: Perhaps simply drop those comments for once?

-- 
With Best Regards,
Andy Shevchenko


