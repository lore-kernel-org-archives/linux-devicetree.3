Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397BD2DF152
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566173; cv=none; b=nYkZVgGCBSkH5evxpfRpO/l26VnKtqXtESrAlFaeSWrOxWbolo+u40tpNteNHkSnvXJH5bGBDDmTiITsfCsWMD9h6fR1BFgDzlp9t/6c/qshfrzICyxJtdGz2VlaDomEsGfd7xeNDu3mPSsfvg6A3PCuYjHP6VYQDqwvyOVHWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566173; c=relaxed/simple;
	bh=sHWeHro7f83t/pbIMwX302HbMjlK/IBrGWBOw0IgvHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9pFK7KORt1fH1N6FAsn8XVKcjfJzAS1KnMBGSUtEOiYmjg8C2yZ9/j0H6Pp56LC+KgpwzuCvT21MbdQ5Tw3BR+HsifuGF9txvyfMg3lRRbKT5ZpXEAcVpf9iHrDYEvCcRJpGz3s4J46GsxcCPFIztnanmDBbcHhL6JMj7ujkFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UX1Cs3Fp; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UX1Cs3Fp"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B57FA4E42F16;
	Mon, 15 Jun 2026 23:29:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 668A6601A8;
	Mon, 15 Jun 2026 23:29:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 164BB106C96F3;
	Tue, 16 Jun 2026 01:29:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781566162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+aFICluLxl1YQYB539NIMAyFqzwzwtH7RKM4CStfk/g=;
	b=UX1Cs3FpiFya0xBUfd3tQH777nYyMi4aNnSLzptl/wn/o+t8d09saDwOdZHHFvMCyvlirz
	BKrQUYF0jq4TBEwqw4yq6o/v4Hwn0qmlWJ0lcaRmlxW8/vzdTHIUbaRMmY+BU86IpTBq2J
	0z3IdUDx3fwYg/oDWZDKTXoTqgjK9vHcPhDQaVKhU/cZo+V3exAj7AbAchKT9S8ZiovjTc
	SrDDim5yV2kyxKNFkSOJoMY3koD2W3qsW6T7p9DEesc8daJP04z8NF7tFZ5ctWZYhj9Teo
	KCvVUc2way8YaTZFUKdJlgshEeSYWdPtl96NSyBJN5kbadVVfhttVZEdQQE6og==
Date: Tue, 16 Jun 2026 01:29:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: vikash.bansal@nxp.com, priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: (subset) [PATCH v11 0/9] Add support for NXP P3H2x4x I3C hub
 driver
Message-ID: <178156613342.628917.851293723714358205.b4-ty@b4>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 12 Jun 2026 16:48:07 +0530, Lakshay Piplani wrote:
> This series adds a driver for the NXP P3H2x4x family of multiport I3C hub
> devices.
> 
> This is an MFD driver integrating I3C hub and on-die regulators.
> 
> The series introduces:
> - Core I3C master enhancements required for hub support
> - Generic I3C hub framework
> - MFD driver with regulator and I3C hub child drivers for the P3H2x4x I3C hub
> 
> [...]

Applied, thanks!

[1/9] i3c: master: rename i3c_master_reattach_i3c_dev() to *_locked
      https://git.kernel.org/i3c/c/79c41666b397
[2/9] i3c: master: Expose the APIs to support I3C hub
      https://git.kernel.org/i3c/c/8d8afa428318

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
