Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A3F3CCFA8;
	Tue,  5 May 2026 19:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009482; cv=none; b=DB/yJzvXB7Ks8O4dDvYzrQOOjXjyBFprxcQ6dacugzWQzvk+PLESDpRLOqKHloDXdNoyDKcXm/JkgtzZ2C0IkEj7/QUMFMFp2DwG1Yy3XapeuK5ODxfNOlwi6dJncHGKFQNCrWA54l/9igdwHkLlbbnvg2ODkVAnT4DcxUXi8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009482; c=relaxed/simple;
	bh=GjclJVRV1WXsBgkEYNCF0uu63ubfAvR0q8rRqvwUTNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlH49GzIBbkFWqa7/GCz/wozpHyVFHJHwEmonmiAW805s1vbJfcovmp4usbpUrsEJmgkvXgMAj+9r42UfotTQthcILqVPHxGB3SIs9eb73hTXsoYrvLcV7+FlJXIqfXxA9tSEtbLKqw1Hi71/ajf4n9QYpib9+pX7rgDClGA7D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cm6P7AxM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cm6P7AxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F32C2BCB4;
	Tue,  5 May 2026 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009482;
	bh=GjclJVRV1WXsBgkEYNCF0uu63ubfAvR0q8rRqvwUTNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cm6P7AxM9wyw8dxiPZS6tpdUdzCAsLqIAaYizqFTF4z9vXs6/dhxM0Wq4Jde05jrg
	 UAvo8feUU8C3bE+4VLBb6ltBp6g7EdTBcP5bQ6dYN8gf1qEg6I9LSF7Flsz1JBKd8X
	 /IVchF2nmdmgogq6q1buJXt1v713NmxW8ZLfQCnM3qoB/8MHdLNhutSJoG0ZE7BIMN
	 zOhKMBhOREfV2AbdaH8ayH2zdM9hosNnKgRORUxz3O3f1Hhk17it9getJNuXKfdAdC
	 XMdYwrTYjflOAkQUZ6zl0oXeojbBPkcIrbbzaZsrqbr/PoKWRHPssYf1Ta2Ed5O7wR
	 AIy3m7dDJ63MQ==
Date: Tue, 5 May 2026 14:31:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Devarsh Thakkar <devarsht@ti.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, Nishanth Menon <nm@ti.com>,
	Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
	Swamil Jain <s-jain1@ti.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 02/15] dt-bindings: display: ti,am65x-dss: Simplify
 binding
Message-ID: <177800947953.3784799.10067421854229298328.robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-2-f628543dfd14@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-2-f628543dfd14@ideasonboard.com>


On Mon, 20 Apr 2026 15:54:09 +0300, Tomi Valkeinen wrote:
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
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml          | 55 ++++++++--------------
>  1 file changed, 20 insertions(+), 35 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

