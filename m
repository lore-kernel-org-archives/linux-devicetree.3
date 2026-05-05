Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C4748BD43;
	Tue,  5 May 2026 18:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004904; cv=none; b=ggtbErMFM0/xzEP8VkDVFUOf417RsCfqX+YAn4OO0CCwHSu9jC8Z4b90+hmJHWLzMGIvNbY4ppg0f87qr4VryHcE1bHIQIUkcjhbOejxyopfMrNUpdLCEbLd/mbH0VR8oxyPwKuvFa62NClxzbtZJILKknWPo1vbLisooUtajAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004904; c=relaxed/simple;
	bh=mY5ckSV/U4sQODz+6cDbl4DnNfzjCu+HvxWVlVn51ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rddvkC+AjncOvwH05SAc6jR96SnProcrobZllroBX2W4pSVJtiDGUkULKZenqxy375fpohPBaazAAaaA2dvRLKhq37pXfw3ULXTyM0C9qCLd5pmd9UXeG9q/HSGI26BYH0tXVsMGkDRNbGSqjbcZWFds5j0Ypwk4qUpjFEfFPM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1/Iw8o2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1/Iw8o2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18336C2BCB4;
	Tue,  5 May 2026 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778004904;
	bh=mY5ckSV/U4sQODz+6cDbl4DnNfzjCu+HvxWVlVn51ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1/Iw8o28oFmNbhUneu2Pq/ro2uvC89gzU0vmOpXZ5yLKP9Hu/6CS+lFot6eB0Y0n
	 EJH1YOxNGdYDsk3ARDh1IjKFshwJxe+V9Pqd7569pD+qKizUqkJbp6T4yWw2ER0xdQ
	 YAp1EaY9ezzBFwy09B7HDjVXwIll0CDYxz6UpNj1ivYr/IGUuqeyZKTxKnPNNrFe+u
	 y9mElQfw76iWuu0u6D6m1zDfNc8jr3hNImEJ1Po+5DseMoywBSo9aekS9KexBpTw2k
	 NGMCV7jRA7tY9uQaWoqUPqvitBt4U6Ns24Wj6si6Ozz0ltilsZWbn8PIvyvf+jVYN+
	 vsTRqMVTbRRgg==
Date: Tue, 5 May 2026 13:15:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: aman.kumarpandey@nxp.com, lee@kernel.org, broonie@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	vikash.bansal@nxp.com, linux-i3c@lists.infradead.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	Frank.Li@nxp.com, priyanka.jain@nxp.com
Subject: Re: [PATCH v9 3/7] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <177800490174.3674177.12021771110967093852.robh@kernel.org>
References: <20260420105222.1562243-1-lakshay.piplani@nxp.com>
 <20260420105222.1562243-4-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420105222.1562243-4-lakshay.piplani@nxp.com>


On Mon, 20 Apr 2026 16:22:18 +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> 
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
> 
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> 
> ---
> Changes in v9:
>  - Referenced i3c.yaml and i2c-controller.yaml for child nodes
>  - Dropped unnecessary #address-cells and #size-cells from child nodes
> 
> Changes in v8:
>  - Add compatible in i3c example
> 
> Changes in v7:
>  - Fix schema validation issues
>  - Adjust required properties
>  - Add I2C example
> 
> Changes in v6:
>  - Use a vendor prefix for the attributes
> 
> Changes in v5:
>  - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
>    tp0145-ldo-microvolt, tp2367-ldo-microvolt
>  - Changed supply entries and its descriptions
> 
> Changes in v4:
>  - Fixed DT binding check warning
>  - Removed SW properties: ibi-enable, local-dev, and always-enable
> 
> Changes in v3:
>  - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
>  - Added Regulator supply node
> 
> Changes in v2:
>  - Fixed DT binding check warning
>  - Revised logic for parsing DTS nodes
> ---
> ---
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 291 ++++++++++++++++++
>  MAINTAINERS                                   |   9 +
>  2 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

