Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033759;
	b=W9w1mhhKsD4rFiNdHbneylVsGMJKCyj8E0zCAc1mNRZ+JIOMZB/DdRD88us5MDGMK/FD
	 G/xWSFjEaJ2WnDEjh7erk6YycdU6tsO4PWvwS7VKt1lFoELqaw8gq4h59nU3fBKHawhNb
	 Tece43PWEjsvMpyjm+rEbV7PPkai/9Fk0zv+Q0Ag5293n5aEcX4v/r5pIMGW3Q21au9ik
	 6erFqaH/7ZWyd5dvTAuS2dH9jUQtA3rqx/B9xknu76pKm615YJZ7LZa5oxwU/w0u/dFfO
	 v34mfPsNQaOJ0SMyixGxOzUVLQnuERB0LQ155DCuCaCzj0wLEM4la1Zfc/YMfkp5IjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033759;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EwqKl+MD6unBoWGhgL4qwXB8TJabPv9ipmvcp8Dekmk=;
	b=wsBG5tvySSCWVyrXh2/ZQ3634JWq8WIRBcnHnt68iFijWSHokH++kZZCGbspiBEUCS8R
	 iq6p48BhBHvbY5RmW46ltJud9vZ6HkDrmE4l31oKpLToYD7fW5m+47g5GvSJsyOpX032K
	 16rYJhCfnOs/Tu3jpI39R+7io8nYFZQfzoE2rF7R17kult2hRzLAmkZ3yKJg6CH2h7+N0
	 9mL5hNCc2GH9mN4E8ok06BEPNXx7vjug6dErmRoVyOZBkOnmak8ENsPZRJW6wiqh0B+GV
	 8uGMF3Z9cnQ1KapaoiZwrjm6NMVFYvY3YykRq8IjZMsBnHYcQWjzsDdMj26TsLKE1yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQ+8H9mG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE4606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQ+8H9mG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A2A1F000C4;
	Wed, 18 Nov 2026 20:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033758;
	bh=EwqKl+MD6unBoWGhgL4qwXB8TJabPv9ipmvcp8Dekmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RQ+8H9mGGATKMX6YhAA9DZO30d1QBRqJhioxtgijibt9FH/Lwy0kySws2nhtax8Qb
	 wcZrmeJVNUteZglHDS0KhNZQUy9o7Y1MphQUm3BbyP3OeBBm17AcCzxFPjq+r5yqzY
	 f2c6rYsfz1YibVmEyx0sMlZZp7vQvbUYgy6zxLij3gVJsJI+oj4sZgDRMiFh+hr9zm
	 58kSF1ra7XvtNMF7mwrC4Sx9K7pS7O66PZvDOOOow8nAHCbVFTB8fDBHeaCeVpIGPF
	 IskWVHskos6k+nItBHxbac4Ly36SvDQ2eMVvnpwvJ3LQfS3CXKudyiaiScAvkqkcV/
	 A7QuBDk5peEIw==
Date: Wed, 18 Nov 2026 14:29:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, Frank.Li@nxp.com, p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v3] dt-bindings: display: imx: Describe legacy display
 nodes
Message-ID: <179503375565.822852.3824919130625575783.robh@kernel.org>
References: <20261111203656.725823-1-festevam@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111203656.725823-1-festevam@gmail.com>


On Wed, 11 Nov 2026 17:36:56 -0300, Fabio Estevam wrote:
> Legacy i.MX LCD display nodes have no schema, leaving their properties
> unvalidated and causing dt-core.yaml warnings for fsl,pcr on several
> i.MX25 and i.MX27 boards:
> 
>   imx27-phytec-phycard-s-rdk.dtb: display: fsl,pcr:
>   b'\xf0\xc8\x80\x80' is not of type
>   'object', 'integer', 'array', 'boolean', 'null'
> 
> Add a display schema selected by the presence of fsl,pcr. Describe the
> panel model, framebuffer pixel depth, interface width and LCDC settings,
> and reference panel-common.yaml for common panel properties and display
> timings. Reject properties not covered by these definitions.
> 
> Keep the LCD controller schema limited to controller properties.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v2:
> - Add a separate display-node schema selected by the presence of fsl,pcr. (Rob)
> - Describe model, bits-per-pixel, bus-width and fsl,aus-mode, and reference panel-common.yaml.
> - Reject unknown display properties with unevaluatedProperties: false.
> 
>  .../display/imx/fsl,imx-fb-display.yaml       | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx-fb-display.yaml
> 

Applied, thanks!

