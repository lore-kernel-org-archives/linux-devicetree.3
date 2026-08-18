Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580842253D;
	Tue, 18 Aug 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042642; cv=none; b=gdu1vbu/oeeuJC8Ku0UZVvluwNgCSwx8rvjyXo+QBH7IDIYAv+PsScHUrZKkWYFp4MWiKc9AUjy0LzDZo8TdXaY8YS5eGUJk41Vbba/9vSnr101vc7QpMOqYUVNsEv0DLtFYq+A9dGPcaioGYFSsvWO1gh7Bt3MoP2cgeHXh45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042642; c=relaxed/simple;
	bh=NY3IeYryUEk82RGOycc9xMIx85glSlGzJpLBvZbyy+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaZvtqTnaiqgHi8cr8TxiuPzFzUEcconaAfVk3Ut2oqVHYV7pnrwTgWbLXlYL454nwNoE9/E16X+B/spWUtroSnXnIDi6pPR/YPfW58FHwODg7uQrvHbfV/sH90NtONyeZNslhkR4UDN3TDqU6gCq7CRTHCW/R1yzcBQKQ4Mnf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOE+1gYS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOE+1gYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787042639; x=1818578639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NY3IeYryUEk82RGOycc9xMIx85glSlGzJpLBvZbyy+E=;
  b=gOE+1gYSoMXLmOdJ7pfOy8MlyAFa1kRlR8LxCFdmVvAcq32SFuQCpyHC
   6fWA6KYLcKzghdAozjWUKLl4OEIpIVIP6yCtLFjzbs5Ez+vgnzkg+5eji
   dIHZtr5pYSAwBC1CiHb7mVNSgTED4S454NLGBdLVHBRgx7I7G8QYyA5II
   ZFfYyOaNbDyOcE1lXCE8QYDqgddTztZLqmjPF5AzemOF0ex0MQ3n9bQaX
   5o/xOmzpkJCLs6XKa6Bx8GzCU875koiwQzj1tnLaU+PLCECsCvWogD4rl
   HBI+gZs9KjgX8ncOgwaS6vaWSBCUw/EhFIjHARuM5ECR9iAMZoQ0Vvj0A
   Q==;
X-CSE-ConnectionGUID: x2MoCO6sQZKHc1r3OXHNQw==
X-CSE-MsgGUID: BbiK1l3XTCSOE/H5xebt9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98682397"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98682397"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:43:58 -0700
X-CSE-ConnectionGUID: ZPiuLXAGSJG5Ask3BQL+PQ==
X-CSE-MsgGUID: WNcbX40hQ5i8Pt0hGlpUdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="303390206"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:43:54 -0700
Date: Tue, 18 Aug 2026 11:43:51 +0300
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
Subject: Re: [PATCH v4 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on top
 of ssd130x_write_cmds()
Message-ID: <aoQbR8lBza8kmar0@ashevche-desk.local>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-6-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080626.30430-6-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 18, 2026 at 11:06:25AM +0300, Amit Barzilai wrote:
> ssd130x_write_cmd() and ssd130x_write_cmds() each carried their own
> regmap_write() loop over SSD13XX_COMMAND, differing only in how the caller
> supplies the bytes.
> 
> Turn ssd130x_write_cmd() into a thin variadic wrapper that collects its
> arguments into a small stack buffer and defers to ssd130x_write_cmds(), and
> move the protocol comment onto the latter, which is where the loop now
> lives.
> 
> No functional change: the bytes sent and the bus transactions used to send
> them are identical for every chip on both the I2C and SPI transports.

...

> +static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
> +			     /* u8 cmd, u8 param, ... */...)
> +{
> +	u8 buf[8];
> +	va_list ap;
> +
> +	if (drm_WARN_ON(&ssd130x->drm, count > ARRAY_SIZE(buf)))

For byte arrays sizeof() is sufficient.

> +		return -EINVAL;
> +
> +	va_start(ap, count);
> +	for (int i = 0; i < count; i++)
> +		buf[i] = va_arg(ap, int);
> +	va_end(ap);
> +
> +	return ssd130x_write_cmds(ssd130x, buf, count);
> +}

-- 
With Best Regards,
Andy Shevchenko


