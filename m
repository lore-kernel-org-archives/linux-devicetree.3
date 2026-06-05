Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3383CF219;
	Fri,  5 Jun 2026 20:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780691171; cv=none; b=iMD4+ZvnJ10utqau3R4W+w6qAhdOQJLna6bpdL3vSHgqHryQDVMiANeY7a/YdAIwW+YD8OVsHMudlibd45rEtP+oz7StdPfdwtGyCAuXKP3VvtZMICdmQrHnOKb6VNVnzx7ZmeUpbNJUwgbPr8oT0k2IP2k5WWwYmka36ouCdTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780691171; c=relaxed/simple;
	bh=9j5asr/zsGysuYEdXttW24pGeqPWjSbm4MBzoSgxFjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3vrp1noOx3SPCQZQ0SG3s7eKZh0LWGt/nTt3qzjSCx33QuTz0ChSKBNluZYpJiuMEwuFH5QfuRP8CNPCfBsfT0hnQnmqE4VlEFAnFncHepWR/XLVYJ8IH+K3mUodaZceefyqVjdRwQTlaoqpyeSrovcEKe4ojZVGSdCWkHQPAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmlBOtbw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmlBOtbw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3EB1F00893;
	Fri,  5 Jun 2026 20:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780691170;
	bh=H4BqWzri2CxJu6pwE+muPny5iZ2OH8Gn8td2afpPXoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CmlBOtbwclUlefCH6WNZfPW0j/fV5z3Y9rsLMwHEol4nSdVupg0g7TDUJ3Fetetx6
	 zMAYUVF9XZC/ET1H20rwgxofDaMs31rzxTPYcelx4AuAf7u+wzkQQktJBeP6KWZt6L
	 5YC48mf2/Dd8uBgbXmCyS7TwDnO0LtkMYRQl0t5kaQWTQ7Ac5ZAHP9VlJGHvVk+hkV
	 SVzFjYs4xu5qfz8FZJ2yqtupgbFxKrC1e91HEemoKVaoUkSdAJ43cBfQoonWPmyTUQ
	 AU4F2gtqY2E8WsefeuSjl3k1lC9wT6LcZvk7mzVCj9MiUdFh6PKHnBQC1DEndAJSmK
	 hQ4pWSbrJ8BPA==
Date: Fri, 5 Jun 2026 15:26:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 phy-next 14/16] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <178069116842.97729.11485900665784589365.robh@kernel.org>
References: <20260603131914.503053-1-vladimir.oltean@nxp.com>
 <20260603132059.503527-1-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603132059.503527-1-vladimir.oltean@nxp.com>


On Wed, 03 Jun 2026 16:20:59 +0300, Vladimir Oltean wrote:
> Add a schema for the 10G Lynx SerDes. This is very similar to the modern
> form of the 28G Lynx SerDes, which is very much the intention.
> 
> There is intentionally no generic fsl,lynx-10g compatible string due to
> the hardware inability to report its capabilities, despite having a
> common register map.
> 
> We allow both forms of #phy-cells = <1> in the top-level provider
> and #phy-cells = <0> in the per-lane provider for more flexibility to
> consumers, and because the kernel code is shared with the 28G Lynx which
> already has that support for compatibility reasons.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: devicetree@vger.kernel.org
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> 
> v2->v3:
> - move fsl,lynx-10g compatible comment to commit message from schema
>   property description
> - make big-endian required for LS1046A
> v1->v2:
> - move patch later in series, right before driver
> - deliberately ignoring this Sashiko feedback:
>   https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
> ---
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

