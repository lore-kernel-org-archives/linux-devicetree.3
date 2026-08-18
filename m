Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1DD41DE0B;
	Tue, 18 Aug 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787042277; cv=none; b=HcePQnQufaC2oikLiYo8yAf/QxwhZ2Eg15gek+UUDPjwu7Gz+r5Yi3tkbUp2lkRj5rcbzRG7djyxjor7I0K5cBX1ivbh5ZmaaCgKAr9MZkN2B34JPu9qo1jjM5eGhRxdJbhCsL2bNn4z3PxapJI4g9bu+zuQ17HBnhRkghV6ZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787042277; c=relaxed/simple;
	bh=G6sf36lxpjs+UKAI9HoAQBgocUntJgL3ULkaxxLNTpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rW3IpyYHNa95A0OI5zkIHZcSB1NJZ/swl3wA4PH2rxaEmD+T2RHzvXPd8RIFS2vhhqzVombc7FodRI5q/8p0yl+PyYUO0RsUnr8u3ipGSf2aXiw9gReCcOHbWASXDlssLJ+arkaOLZyx55uVK1R6NJcKCadTR91Lzpiz8OvHMS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8R29f8l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8R29f8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787042276; x=1818578276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G6sf36lxpjs+UKAI9HoAQBgocUntJgL3ULkaxxLNTpY=;
  b=P8R29f8lJ+gnyUvE3DJE5ME0zh8xf3bTSThchrPfTPcgN2jv26Vb0iv+
   wRLV0sSZG/CUDgtht2q4tJf18rPoI5byL89QQ2IpN1bRCCFnsh10k4K8D
   8OtkSCBzGPTeo4ygJEOWcRu4JJpn/9oev39blHGaRyb+lAdNUdeqZ6a5r
   fmdg9dcM6ShzSoMIeHjPeOxVCqzqk2O2B2E0UeCgZMG4oOXsB/sSZ7GXp
   fnaIupz/jYS+sZq0hRM1KtdMWiq7aUtQwn8pwSjfWpSxX5s1F4gOe4RWP
   6upWqEkuQiS0o70vS3rX86NvyKBa/+tahejgewykb/eDIr4lO6iCqPa+M
   w==;
X-CSE-ConnectionGUID: jQobfd4rReGK3itASbSFRg==
X-CSE-MsgGUID: qXk8T+oZQjK7VhRqFxhCZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98195442"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98195442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:37:55 -0700
X-CSE-ConnectionGUID: iB9MBv7oQICw7Sjos0KUeA==
X-CSE-MsgGUID: G2b5iq79Sziakvn9sXovbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="289974521"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 01:37:52 -0700
Date: Tue, 18 Aug 2026 11:37:50 +0300
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
Subject: Re: [PATCH v4 3/6] drm/ssd130x: Constify ssd130x_write_data()
 'values' parameter
Message-ID: <aoQZ3u_RoLHviJo2@ashevche-desk.local>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
 <20260818080626.30430-4-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080626.30430-4-amit.barzilai22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 18, 2026 at 11:06:23AM +0300, Amit Barzilai wrote:
> At no point does ssd130x_write_data() change the bytes it receives via
> the 'values' parameter. Constify the parameter so const-qualified
> buffers pass through without casting away const.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


