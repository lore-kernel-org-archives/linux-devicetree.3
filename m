Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E53B4E9F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081643; cv=none; b=hQBgKlDa3IvUEa7Zs0ghaD6Mkxugf/Nn79tNM5Vewr81Sf5h/t9Uy4meqmU2rjkCOMU2v3oUasvY1++ilGZNYySvYqMjMjcBIN5B+IaEE+/AZKkPjLIrkSeaFDlDLXQlvVinjui+meUFP1WoeyDHsBeoQKE8deQl/5R/u7hVfsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081643; c=relaxed/simple;
	bh=rfHKo2BsIFf5LBDvYisQeztCD1wHPW4yosK+6jx/jMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqAc0zSQ1sshY4JBvuse2xDePGB+Vler8kDWkhaX4lVNFd+KxTC3MWx7BDaJbdI/9Z+g/m959/Mw0oscoXkFQTuQynhJKTUENs7cDzxlE8/f/OHzzzhIb1ZmVyS1V/5+GzoPiwbBYHQmR8oZkIUx1OGI7X7C8rzL79ZxfjIceZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFv1vv9h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFv1vv9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1C81F00893;
	Wed, 10 Jun 2026 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081642;
	bh=C9A0mbzrOaNvpsifB/cslG4XdJoD+uBzY6C1wWrtac0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LFv1vv9hDxl5mOnEUllg3V+dwldIZla1he4ZiXOvepWeYxtqnfIjvoXExDu9dFhdL
	 39yVutNM0m6XP0iYCbMxDeCaO+xUBDNcpFU3GvhwNXWgOEVCaspWvcgj5ZX0IzLb4D
	 D6VdU6AvjPl1rgd5WNrko7/kS3iTlbsnU3s/DVIwqUY7VWpIgkDxRW4dJtiLMeiu6M
	 2397zWUqu97+6cYcRr+n8yjV2gghHe4kstCFXrNjMb8Lh+tPM7TSH2iTTzRg+j6nmK
	 6j/onNEylcaGbdZm6AwyDKi+ySzRa6miGQS9JI1x9KeM/F+9kb44qTT6c6F194JpBp
	 2Bb7tndsbnDMg==
Date: Wed, 10 Jun 2026 10:53:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, 
	devicetree@vger.kernel.org, tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: ES8389: Add members about HPF and
 clock
Message-ID: <20260610-belligerent-chocolate-tamarin-9b9336@quoll>
References: <20260609071732.20939-1-zhangyi@everest-semi.com>
 <20260609071732.20939-8-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609071732.20939-8-zhangyi@everest-semi.com>

On Tue, Jun 09, 2026 at 03:17:32PM +0800, Zhang Yi wrote:
> Add members related to HPF and mclk_source
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---

You already sent v1 and received feedback.

You just completely ignored it.

NAK

Best regards,
Krzysztof

