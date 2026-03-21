Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF333E347;
	Sat, 21 Mar 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774087731; cv=none; b=paoGN8W1TAvVl174F6wfVWRKTz41W3lw0C6KEiC8mTgiM/fPAZC+iyinbWBXmNlblZkTkKjn62hPTr68VS0T3hDdKzZgLOL9GoKMl4pM7y6I3VEwR3TWsaCn2nT6oEuE09ZDcPRz0Y4TeN/KihVNqZiLCJkJG9GoLf8aJjC2L4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774087731; c=relaxed/simple;
	bh=2fWlNaWdZ/tdjFqi2lRKYZQDaf5ms4z4Yeuk+Z1lf8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjRXEz5UoLOoJgbVqwhSU6U8zxBrw+Kni58CBvq9OWnImh6Kxs1SgtLtRYjPfx8NPUz05XOrEHlGQYdkDh8snHAEDmT6eyMSLE2GZoRebPPl5XXJc49YJJG9Nn089zwsizPSuA/kX/82zTuXRDm2EDAUbFDEb0q1DtXCpb6PYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpWrLTVb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpWrLTVb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED44C19421;
	Sat, 21 Mar 2026 10:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774087730;
	bh=2fWlNaWdZ/tdjFqi2lRKYZQDaf5ms4z4Yeuk+Z1lf8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpWrLTVbn+M8bb0HpAqUVUSsepxwCTkgW79n/eZ6KN12+NK+1EA7llo8GOHO70oDG
	 6j9L3XwxpULRguxcFK4reT/p/eTFtDrpTkZkUkCL4knBhB5i7AiiItb66tWeQRqJvi
	 HvapDFML696kTrCBGeSuEKN8jtf8bGvcLzCjaFxWJGk/BFLjFig2iC/2Dx5+z68rEE
	 Zpe/TDGCrKA61wLBtvEejuGIIYwqjAbBFRJXyavrOzneF5xGVdXn8cNiIcl/UUk8ou
	 8w8qHzB52Z7BntjrNoptEzF5naInpfCGIitJd42ZfJCeDjzyu0+opICpy4mhN3/FJ1
	 PxZNyq08xMIvw==
Date: Sat, 21 Mar 2026 11:08:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pet Weng <pet.weng@ite.com.tw>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth Hung <kenneth.Hung@ite.com.tw>, 
	Jau-chih Tseng <jau-chih.tseng@ite.com.tw>, Pin-yen Lin <treapking@google.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/2] Add ITE IT61620 MIPI DSI to HDMI bridge driver
Message-ID: <20260321-albatross-of-terrific-prestige-95cdbc@quoll>
References: <20260320-it61620-0714-v8-0-0e70271cf5a9@ite.com.tw>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-it61620-0714-v8-0-0e70271cf5a9@ite.com.tw>

On Fri, Mar 20, 2026 at 03:50:40PM +0800, Pet Weng wrote:
> This patch series adds support for the ITE IT61620 MIPI DSI to HDMI 
> bridge chip.
> 
> The IT61620 is an I2C-controlled bridge that receives MIPI DSI input 
> and outputs HDMI signals. A single-port MIPI DSI input is converted to 
> an HDMI 1.4 output. This series introduces:
> - A device tree binding YAML file describing the hardware
> - A new DRM bridge driver implementing the basic functionality
> 
> Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
> ---
> Changes in v8:
> - dt-binding:
>  1. Clarify the hardware differences between IT6162 and IT61620 in the
>     description (IT61620 is single-port and lacks an internal MCU). 	[Krzysztof]
>  2. Dropped Reviewed-by from Krzysztof due to description changes.

Description? Like text? That is the reason to drop someone's review?

You ask us to perform the work twice, just because irrelevant thing
changed. Read carefulyl the docs.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

