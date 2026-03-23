Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA772BEC55;
	Mon, 23 Mar 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268601; cv=none; b=VS1JqlqEEnflxWuKr7Z35aMWShfCT8LDM0WUN4+A96svuIVM2Mz4VBOHpCc/tNkx1CYFuVLXAahe5e8saYNkzazg+d40SKM3zH2RzdQdKzuv5Jyfo1jAI4t308xoQj0wZAbXUSPY3Geh+VHfWi1gFK605K7mgI1HnIL7hzffVCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268601; c=relaxed/simple;
	bh=JX4TgtdBbYJ060GYQApA59ZWtTG9tzZH09xFxM/DGHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqJmXMZfARnYskh7E8J7KS02XBuC0lEPgBHLSd8xAg0VaBL4EuL+uwOaZwQCYPTU41eKLVcGJ1mkTY3YnLMtdsY06cyUkZyKzjn9wvOeoLtaXp40fCfMtGx+90JWBMXpqczM3dYbkatq1ZhEjuhaZiAsmgrEvsSpCFGUh8vcExk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6rTEf8w; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6rTEf8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774268599; x=1805804599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JX4TgtdBbYJ060GYQApA59ZWtTG9tzZH09xFxM/DGHc=;
  b=h6rTEf8w+iGkkQh6HRqmyHR9QId1U2zZp2mOTNQ/ek5+1HbbCMBwOPV+
   +Fwhe9Gqxb9oHcwpdX4AKwpabxJX4w+I0h7+nhq0ai+ps9NntbQ2aOcgY
   CB05B8lUrrIL9SazYCos57lYlW13RmvaFroKN0iklAFGRhGLjd88e1NK+
   NFFsTTfeCbmsR3HRn/hnR/Z0sQeIt/dcdIGXZfAkljDXAosEYwPJrWPz/
   SsakbmnTacHMB3ZjUvHMBusq4L4Y6RXthrFUkex8G9Ymclh6D3fo+aJEe
   i7+h3Y5zuizHg+IOM7GI1rkjV1DEq4V1C/abGtJMa5J+BTHbPQaOJ2er2
   g==;
X-CSE-ConnectionGUID: /L4UiNPmT2ihr8QbH34A8A==
X-CSE-MsgGUID: yBhIyjsrSce2ymYWbyO7TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86335275"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86335275"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:23:19 -0700
X-CSE-ConnectionGUID: XPmoU1ytTbOUMr9Tl4j53g==
X-CSE-MsgGUID: oIw8fvH7Q2+YhjPUv4tfJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228484323"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:23:19 -0700
Date: Mon, 23 Mar 2026 05:28:59 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Eckert.Florian@googlemail.com,
	ms@dev.tdt.de
Subject: Re: [PATCH 2/2] irqchip: Add Lightning Mountain irqchip support
Message-ID: <20260323122859.GA2594@ranerica-svr.sc.intel.com>
References: <20260318-irq-intel-soc-msi-v1-0-0e8cdf844fa8@dev.tdt.de>
 <20260318-irq-intel-soc-msi-v1-2-0e8cdf844fa8@dev.tdt.de>
 <87v7eqk8pv.ffs@tglx>
 <6b059429a3db61dffd53a280dc2d6278@dev.tdt.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b059429a3db61dffd53a280dc2d6278@dev.tdt.de>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Mon, Mar 23, 2026 at 01:14:41PM +0100, Florian Eckert wrote:
 
> > #2 NMI routing
> > 
> >    There has been attempts to implement that before in a clean way. The
> >    patch set dried out, but the underlying changes for NMI support are
> >    still valid and Ricardo (CC'ed) is working on them again, IIRC. See:
> > 
> > 
> > https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com/
> 
> The v7 is already about two years old – let’s see if there’s anything
> else coming.

That is correct. The series is old, but due to renewed interest I am working
on it again. I expect to post an updated series soon.

Thanks and BR,
Ricardo
