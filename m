Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C383C5DC3;
	Fri, 15 May 2026 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827922; cv=none; b=NtGy9SzdWGYK0+HJShSYWOCVWe1IQrYU+4QAQOA2tlGLrzrx++OneKBCZ1iyR+PVLSmxDl1Td5yJ3OaePHIbN7EAYqQHgVG7rs9QextDF/v/oK8vvoqhHsd1cmtfY9SE9hbNsR3JhTKmwrcHL+gR1P1axLMiBujC/32Vaz7jBJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827922; c=relaxed/simple;
	bh=mu7cduG3fQLBUX3auUinfMi71dfcpyVQbNUxXr6BxdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBjD5vAT1nAT8vYvuLyWaJZYRVSvErrWYO6nT1ZaEnZCFzn+72Yme5CNwCLvCpSLzcmS4D2oCsOoZyvb4+YnrmYBQsJWIRjLHPR45G58AJl0tgr1SFYoUuyAsz9XXX2aAcZbCDbQJ+JhTmsyXw0QWAkBINyIJJT5Nm3i3sJ3Fzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha7Strj9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha7Strj9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04812C2BCB8;
	Fri, 15 May 2026 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827922;
	bh=mu7cduG3fQLBUX3auUinfMi71dfcpyVQbNUxXr6BxdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ha7Strj96CO+u39xR7gZFksLweh9aWYnG0XX+mjmKzpO3bLSQPxVHRHRUm04ZcTHk
	 sAlWxNSeJaEXnzo6inxmR/QOPi42ALeDJeDk5qJmpZFilCUszhiQELdtBZ+5yMii56
	 OACJfDaSJJRn9HV+YkOuAG27cz3Q/wCukpfhAVzY62OPuMo+l6Uvmu3wIJ4KRPB7xs
	 SlQb6wv/QwACF33hyI8nDhRaTSDMT4Q5CadJ5GDxqRpvxeptIu7My45CzfVRuUMtor
	 qqfsZU/MFkhb+jMe/zx4HeA7Rvj7VNeL0ID2p+h2gqGLeFGN4OZn8ZuXT8rqX6Qlj7
	 TZUATjZoMN+og==
Date: Fri, 15 May 2026 08:52:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 05/16] dt-bindings: display: ti,am65x-dss: Add AM62P
 DSS
Message-ID: <20260515-certain-honest-wren-f03dfa@quoll>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-5-9e9bcefde6bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-beagley-ai-display-v2-5-9e9bcefde6bc@ideasonboard.com>

On Wed, May 13, 2026 at 04:17:27PM +0300, Tomi Valkeinen wrote:
> TI's AM62P, J722S and AM67A SoCs contain same implementation of the
> display subsystem (DSS). There are two instances of the DSS (DSS0 and
> DSS1), each with two video ports (VP) and two video planes.
> Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
> DSI TX and a MIPI DPI output path.
> 
> DSS0 supports:
> - VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
>   clone mode.
> - VP1: DPI
> 
> DSS1 supports:
> - VP0: OLDI1 in single-link mode, or DPI
> - VP1: DPI or DSI
> 
> The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
> between the DSS instances. Thus only a single VP can output to DPI, and
> a single VP can use an OLDI block. Note that in single-link
> configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
> be used by DSS1.
> 
> The DSS IP itself is compatible with older SoCs. While we could use
> "ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
> on the safe side in case the driver needs to do something special for
> the dual-DSS case in the future.
> 
> Original patch by Swamil Jain <s-jain1@ti.com>
> 
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Tested-by: Swamil Jain <s-jain1@ti.com>

Same comments.

Best regards,
Krzysztof

