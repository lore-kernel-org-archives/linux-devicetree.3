Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB83955EA;
	Thu, 16 Jul 2026 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194528; cv=none; b=eQpymE2WBnlYd3E32XyDf9PdefQm/v7+YTtvXIy9PJ0d8SKLyTMsHp/zz6XyQquva+bIIjkpRtNny/EBnaIF6RCFeC/fgB6xfo8UDNPrPHpojg3CBgZC7ijkjWQp2Zwgq4GVPcY0brq1yYEEKBu1M5fkjfApvT0x0SD7WnY5tKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194528; c=relaxed/simple;
	bh=bW+dO2vACxqjT9Xu12ac7glvE0qp6EifSTjfcjVEcgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFZ8VuBdgLdLQ5d7l2UKPICrkI5wGrN0kVdWa/y0iNqBotIuWU7qFyPFeRcTEB90KmE6NLb1IYxVaIJktC6RZhrZmE5lYqawg1zEaZdp1AHhjbjTybxVu7SIF9rY7H2Z/zMTGs/Y3CZ7sqoDkIw1y/AHZw8NH8qCcwcH+3jUV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrmGXHPO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrmGXHPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784194526; x=1815730526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bW+dO2vACxqjT9Xu12ac7glvE0qp6EifSTjfcjVEcgk=;
  b=NrmGXHPOHu4sZxEVzuDic9lDQh9knPdHqwbav4T8sdpJCWypDWp57gGS
   MzCAICGllMKTyf888wTVzWFcGtC9s2oQdeoNG4izBWUMiRHN8eZxq9XxN
   ek8RmpsbEOfpJ5ua4/KYHq8iFmmJf3pZ18oP9CEXR8G0ef/IAOh7j4tPE
   xkAc+1PULYV6C/XkYLhFDKWP1MlWFCON6DBHhLrygUBr9F9iw5L/yC1my
   xhbdpVjRRYHOV5wuDgblkgt5bPO4nEgSVks4NWncfk67z3TPlj1z3fzAa
   15A/hqZaQ47wCqlwvCagDUBjvhV6yoAVzIxaN41R1s0JXEzrEUvOczXkK
   w==;
X-CSE-ConnectionGUID: mwhKOGSgQ6CgmcZ+9+CLYQ==
X-CSE-MsgGUID: QwJv1yS+Q7uZMyE+HsEkmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84939752"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84939752"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:35:25 -0700
X-CSE-ConnectionGUID: FrRiLHdJQ06V0tMLhsDOuw==
X-CSE-MsgGUID: OHs5MyRMR/2sr+xoNGgEsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="294680264"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:35:22 -0700
Date: Thu, 16 Jul 2026 12:35:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/ssd130x: Add SSD135X_FAMILY and SSD1351
 support
Message-ID: <alil0p_s9-dM9j_t@ashevche-desk.local>
References: <20260704080925.75113-1-amit.barzilai22@gmail.com>
 <20260704080925.75113-4-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704080925.75113-4-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jul 04, 2026 at 11:09:25AM +0300, Amit Barzilai wrote:
> The Solomon SSD1351 is a 128x128 RGB color OLED controller. It shares
> the SSD133X data path: a column/row addressing window followed by a bulk
> RGB565 pixel write. Add it as a new SSD135X_FAMILY rather than a separate
> driver, reusing the SSD133X plane, CRTC and blit/clear helpers.
> 
> The only data-path difference is that the SSD1351 requires an explicit
> Write RAM command (0x5c) after the address window is programmed, before
> pixel data is accepted, whereas the SSD133X enters data mode implicitly.
> This is emitted from a shared ssd133x_write_pixels() helper so both the
> damage-update and clear-screen paths cover it.
> 
> The SSD1351 also needs its own init sequence (ssd135x_init), dispatched
> via ssd135x_encoder_atomic_enable. The re-map byte is fixed at 0 degrees,
> 65k color, COM split, BGR sub-pixel order; rotation is not supported.
> 
> The SSD1351 doesn't implement the SSD13XX_CONTRAST command (0x81) and
> expects different opcodes for contrast and brightness management. The
> current ssd130x_update_bl() function wouldn't work and the brightness
> byte would be executed as a command opcode if run on the SSD1351 panel.
> Until the backlight path is family-aware, skip backlight device
> registration for the SSD135X family.
> 
> The SSD1351 is SPI-only, so only the SPI transport match tables gain an
> entry; no new config symbol is needed.
> 
> While adding the SSD135X command path, ssd130x_write_cmds() forwards its
> 'const u8 *cmd' buffer to ssd130x_write_data(), which previously took a
> non-const 'u8 *'. Constify the ssd130x_write_data() 'values' parameter
> so the const-qualified buffer passes through without casting away const.

...

>  	{ "ssd1327", SSD1327_ID },
>  	/* ssd133x family */
>  	{ "ssd1331", SSD1331_ID },
> +	/* ssd135x family */
> +	{ "ssd1351", SSD1351_ID },
>  	{ /* sentinel */ }

To avoid conflicts it's better to convert this ID table to use C99 initialisers
(so Uwe will be happy).

-- 
With Best Regards,
Andy Shevchenko


