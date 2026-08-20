Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD6236B932
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261304; cv=none; b=iwYzbjtfR6dlc2crqNyRPEeQNTSdO1jC0uI0vpFivYe5ZO5EMPkVGGnOtsDelZN7IJJo2JVlqOBlLbCQUnWHSmM4oY9yAcmLy8LICFtU0r9JvI9NXVOS4YdXP8xCyR2U00rkCoekX65al0SYIaR0ENcydAUbICrnKh/Q97xidf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261304; c=relaxed/simple;
	bh=u4kgO2/2wz2gjwwb7TIIjeJpsK5bfiugLEQD8MNFyQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COD25Km6v3Qlfr4Zhv+SKWxy7Lv6Drs3aJifq9Z86giDKx938tcfb6MVabGqe1hRE197JmXxMylsmWrJ9Zfy706s/w0b66vnDieiebbyWmv6wtAiWRS1paE8CWhI4b1TMDowbssaVHms5OOzyzfil/o/1HBMAjhVKS6VsyBWQ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ve2Put/U; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ve2Put/U"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A54F81A1774;
	Thu, 20 Aug 2026 21:28:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 611685FF59;
	Thu, 20 Aug 2026 21:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 593CC11C7682E;
	Thu, 20 Aug 2026 23:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787261294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=IHftqMDQp1qFZH7ap9yC4efnQITlkKIOCtKwMvcMT4I=;
	b=ve2Put/UKsEc4Lq6ej7u9gVw2B5y65UZo2eb4Ig376S6MgG/hMM13q1I2poFIT+3vq60o1
	afpSjjOwlPqhmb2D/4ma5f6Fbi9WLYvGjdcpPpzzr8BWDnqsd5kdvSKxu+q7mbDr+mj8ll
	r91W9TzRLxq5p9QUWaDQBa2tMpXshNoNXiusr9R/VHF0J0oefqx0ngL6bvCB6noJUAstoc
	olujxIY7F4AO0tMqR88RXO2Rsxu8ABnma3jsds2v/YdPz0OEVEWPZYF//x7bYPRiUQEXn9
	HV5x5U87+JPtzXeRnWGy4wfR73Yt1fzJRvbOj/UTmcwp5a0FlnRey/3JcER6+g==
Date: Thu, 20 Aug 2026 23:28:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Cc: skhan@linuxfoundation.org, me@brighamcampbell.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] dt-bindings: rtc: microchip,pic32mzda-rtc:
 Convert to DT schema
Message-ID: <178726066524.423710.8633898586846334625.b4-ty@b4>
References: <20260703110442.205026-1-challauday369@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703110442.205026-1-challauday369@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 03 Jul 2026 16:34:42 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Real Time Clock and Calendar devicetree binding
> from legacy text format to DT schema.

Applied, thanks!

[1/1] dt-bindings: rtc: microchip,pic32mzda-rtc: Convert to DT schema
      https://git.kernel.org/abelloni/c/1190db8edcd9

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
