Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0E388E4D;
	Fri, 15 May 2026 06:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827878; cv=none; b=mOEI1FCbQSHtZXeHzIVfCq0zq5pFELUre4Ckvn0EgDlef9rJQ+zbtm9feaZ8tOoVW6cvLl2wUS1uhk0zSsVu2qmPCi/VjRMO89fVJolG1Xq59xBB4hc1GPPiQhG5jHCQt45Prb25uP2xIq/BTJ2ZNmp3IVxqevauCoyjqIuWMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827878; c=relaxed/simple;
	bh=E/EwGXyxuSs3Lty0ZqKdaGmckUJHhYIkau4tkuPEDzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEx1zDtMWA8bxKbt+wKloIXuPRu7m3Ye0tKjKHO5uVQquoREvmCgLLUDGKqLAwCHtuKhTaEcs945J8mRA1OJosdVrIpZeeLX37DA2ToCn010G0ViEjLLhJ7a/up6lzEh5Q2fOvckRqeCg2zjXT45oT44QNqF5hkeH8L1nprV2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtXj7cNE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtXj7cNE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FCCC2BCB0;
	Fri, 15 May 2026 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827877;
	bh=E/EwGXyxuSs3Lty0ZqKdaGmckUJHhYIkau4tkuPEDzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtXj7cNEso7W7cF6Ds0KgIInqkrBbGaRZqMvNpeNQh6A/Fe2Zk6PavBtfOZeA0uFn
	 rbujdidNF5yCsMPRULQaOSeNdUO8XsywFzgsa3Q+WO3J2btH2qbZ6VAkrL2OYJcNw8
	 zaRW3zgT+0qsfx00a1JMKKyZZ4QQiBeCr7WIjx8jHElFnc4FcY32Z27itElzBPt1v9
	 R0a7WKKEreCKDRnRLy2CXg9ihiGyyhAfyQlBawYAGPCpn1oJfbZ8+NGht8d3OQFvuA
	 r2DwbnaUZb3O2tDgPTlBg8B+AVjiMKGVUre7Tx9gr1G06YS2685n7doT4BlpqEVy9o
	 qsFdplo3wkMGQ==
Date: Fri, 15 May 2026 08:51:14 +0200
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
Subject: Re: [PATCH v2 03/16] dt-bindings: display: ti,am625-oldi: Add
 optional power-domain for OLDI
Message-ID: <20260515-devious-dragon-of-prowess-abf1a2@quoll>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-3-9e9bcefde6bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-beagley-ai-display-v2-3-9e9bcefde6bc@ideasonboard.com>

On Wed, May 13, 2026 at 04:17:25PM +0300, Tomi Valkeinen wrote:
> On some SoCs the OLDI blocks belong to the same power-domain as the main
> DSS block, but on some more recent SoCs the OLDI blocks have a
> controllable power-domain.
> 
> Add the power-domain to the DT binding.
> 
> Tested-by: Swamil Jain <s-jain1@ti.com>

How exactly? You copied YAML to the device and executed some commands
specific to that device? Which commands?

Or you built something, like run 'make zImage' command? So every build
is a test?

Best regards,
Krzysztof

