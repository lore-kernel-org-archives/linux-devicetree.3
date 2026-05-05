Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634EB3CBE74;
	Tue,  5 May 2026 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009741; cv=none; b=SZcbunD+SqHhsOyb71JBOmdXV6YadoCBD5iqkf93Ywhf3VGuLAWLeydY8amZUMuqLU3tllvDEJiX6ZmvN/ZrK/JAy698O7OmB0mbwd8JQlHP0Sr3aX0AzEg3CetDzTGofopij4zw/MyZS+zbjEUDqw0sLuU1vEy7PzfFf6KFEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009741; c=relaxed/simple;
	bh=P0xQWvqkG5HbL2Qs5vliqZ7IJtLJCrMcA9mw0zBM5bA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4kHheLWkxakSdbZd7nD37e+MGv1lWLGzgh8bvk5WnM3CYthzeL9BdjoMVXLn4aFBChhhatJR2LruZ0Bqgp99jwisIBOeT/oAYyWWxfjYVjd0T5Hzos9cE5JMth2N2c5O+liYS/LHoS9eeHnXcHZG2fPFyFte0hC/M/V+u12jqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NbvT44tr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NbvT44tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077F6C2BCB4;
	Tue,  5 May 2026 19:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009741;
	bh=P0xQWvqkG5HbL2Qs5vliqZ7IJtLJCrMcA9mw0zBM5bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbvT44trIrer+CaoL7bvNBTBzqPm5Vaiz8uaxZcm5uCkC0DRfQfQDMyParpd4jEkI
	 iCe86Pw9imHp9AEsjHpZ20qApsvep2onxMYVvWM9MFFPMPqQzNTY4gY3Wk05GcDMH3
	 PyO0u/GAON11E60giGNjCVlJRLkmXdaXiDZWxkUBEAHjG8v3+MhqDWSJsEcfxPGdZ0
	 8+l2xxLD5oB3JzVlMdAdYJrT3l0KCNNXnK0Y1tcRZSVyjUlS8Pn+lICjX4S5dzqjdm
	 i+nCBD1h5G9Riilw9nUDz7rp7/ZyJeBD3IGZ1/sHvGM50Gzbm0ENBcVEKn/OzLXLtW
	 kaShwQeg0zLkw==
Date: Tue, 5 May 2026 14:35:38 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/15] dt-bindings: mfd: syscon: Add
 ti,am625-dss-dpi0-clk-ctrl compatible
Message-ID: <20260505193538.GA3785056-robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-3-f628543dfd14@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-3-f628543dfd14@ideasonboard.com>

On Mon, Apr 20, 2026 at 03:54:10PM +0300, Tomi Valkeinen wrote:
> The DPI output pipeline in K3 SoCs contains the display subsystem (DSS)
> which produces the in-SoC parallel video signal, and a DPI block which
> adjusts the signal to the external MIPI DPI output.
> 
> The DSS IP has registers to configure whether the data and sync signals
> are driven on rising or falling clock edge, and on some SoCs these are
> automatically conveyed to the DPI block which needs that configuration
> to properly output the MIPI DPI signal.
> 
> However, on some SoCs the DPI block configuration has to be done
> manually, using an extra register outside the DSS, DPI0_CLK_CTRL in
> MAIN_CTRL_MMR_CFG0 block, which controls the DPI block's behavior. Note
> that while the register is named "CLK_CTRL", it's not really related to
> clocks, but the sync and data signals.
> 
> Currently the DPI0_CLK_CTRL is never written, so it's always 0, meaning
> the data and sync are always driven on a rising clock edge regardless of
> the DSS configuration.
> 
> DPI0_CLK_CTRL register seems to be an independent "quirk" register,
> inside MAIN_CTRL_MMR_CFG0 block, which contains general purpose system
> registers. The registers surrounding DPI0_CLK_CTRL seem to be controlled
> by the system firmware or linux clock drivers. So, it is just this
> single register we can map, and we can't create a syscon node for the
> whole (or big parts of) MAIN_CTRL_MMR_CFG0.
> 
> I see two options to handle the register:
> 
> 1) We could add that single register to the DSS binding as a new reg
>    block. That feels wrong, as it's not a DSS register.
> 2) Add it as a syscon node, which can then be used by tidss driver.
>    It is a bit silly to create a syscon node for a single 32-bit
>    register, though.

Is it really 1 register and nothing else in that h/w block? That's quite 
unusual.

Rob
