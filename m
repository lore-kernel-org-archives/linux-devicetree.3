Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D59388E4D;
	Fri, 15 May 2026 06:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827904; cv=none; b=f3h2wjewkdPslx4Ta/Dyg2AvioJqlcwddr9lKakja9HaPc281POUIUNmQwdfIYpfpkveic4CC1P4nTfWi5rJfAcW7gv23e6avAyZQSYEFw2ipqtiXVblW2kZvZ3fQvhx/boUdGX9KwfEJrwAXx/DTSNDKVeaL3pjNdAV08Qmi74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827904; c=relaxed/simple;
	bh=xetCbQQicxOnxA/cAWCBNjO1sljv2AqnFgNenly9yms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKRyrPezksswldCkyhcfmO8iWsPvTBbfQwzpZ/4yBZIFRBTj5u6epssPHmbSViXcPLypo75gW3gdU2bd2Cye6MzGTWmWorlBhSt/5h7QGh0Up+WJ4e/J3MNtKuog6Q+vrWWBiHvNo3H+5pF1ofLEuaquH5j6nZgYyAFGJhHAF0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krXJuO9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krXJuO9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B52DC2BCB0;
	Fri, 15 May 2026 06:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827903;
	bh=xetCbQQicxOnxA/cAWCBNjO1sljv2AqnFgNenly9yms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krXJuO9ndCrzCUWxfwt6siUoaECBWzO7J6x035a9dcURhIVBefNNnH4pZUv2aKhf3
	 80KyKhGxol1OUXWU4jwiqFj6ZfRQ+21TaszZO/xevTwbwbrrOYL0tpcTfVlTOAH/wx
	 V7/j2I8tIZ1Ifxi/wzYtObXtCHRVF9OUrkkMJCteQ9FDsltRuESAIMQdPY5BWlBeec
	 a60j3O88yB6W3BoAmEcmsyostQgj9CfXIXUg/RpSeb2FzK2Tq4HYBRiHDCEpTdqzJg
	 WeEZouBq5ijvovq6UCrDlC+eH+qPOjS9M0BFRZU+jqjdJxQ6ENrZsgh30yLaqFwkz3
	 Y22hpb8m1qeWg==
Date: Fri, 15 May 2026 08:51:41 +0200
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
Subject: Re: [PATCH v2 02/16] dt-bindings: display: ti,am65x-dss: Simplify
 binding
Message-ID: <20260515-hidden-devout-numbat-dc6c9e@quoll>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-2-9e9bcefde6bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-beagley-ai-display-v2-2-9e9bcefde6bc@ideasonboard.com>

On Wed, May 13, 2026 at 04:17:24PM +0300, Tomi Valkeinen wrote:
> In principle the DT binding for the DSS IP should mainly cover the DSS
> IP. The current binding also covers the SoC integration topics outside
> the DSS, mainly via the endpoint related rules and descriptions.
> 
> A more recent SoC, AM62P, has two instances of the DSS IP, and while
> both DSS IPs are identical, they are integrated slightly differently
> (e.g. which DSS output goes to an in-SoC DSI bridge, which goes to
> DPI pins, etc.).
> 
> To make the bindings usable for both DSS instances, relax the binding
> slightly: remove the explicit endpoint rules, and generalize the
> descriptions.
> 
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> Tested-by: Swamil Jain <s-jain1@ti.com>

Same comments.

Best regards,
Krzysztof

