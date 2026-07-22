Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAAA126C03;
	Wed, 22 Jul 2026 19:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750262; cv=none; b=bq8m0eEPBv5AoJ34ItMFnCmgoWIMCq4gnOw7Zf0MXhCLFyvbH79PSApoV7/QTFLk+vJrJR4kiUHK7mcGM4aqIfR2uM+5+s7ZKpzCh4VIOpODo7OZqLsomE03V9IV53nbO9RfldTybJrzwukohlME9zZ8sUzRTA79GQx0KlUfghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750262; c=relaxed/simple;
	bh=sE4KxM//zl9QlxTvvNy9loe0FGUWV2lsHG/NLo0rpBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/bm8mk9vul83geFy00+G8tRSpmC7aCI3XZoeyI1Youl7oKrQp4K61lnQaEtOTMGu18yQ+OySQwUvTB6ZW2nYlTuRt4onycjN4SAejxci1LW4OWwQIGuSli2QNGRr/TEVN3NT/QSbMNhl1XYI/uu5r2DEk4KBtOdrnal5M2AtdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ppw7Amuc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ppw7Amuc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945261F000E9;
	Wed, 22 Jul 2026 19:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784750260;
	bh=l0f8hOysn5ymCLf58esGcq6d11WZH7Aq4bS7k2BPgjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ppw7AmucqO/1MTSoLAdEAinnZ/SF7ydw39dXDfFaD7iutHln3ZNaQkysiVpVSSltZ
	 3esaoFllLCZdQCB+iukvlw/gb4G4Zpog73WgTQzTAXge2yrJqWWLeZp9Xk3gsoVbFk
	 fIoAFNQDn/J8/7TWY6cu1yXphnLBZLSAEl34SIQx+3i34/otJKMQSSWpxeTwjUrZ8s
	 zc0adURqArjCQSGlzTXAiggeBqkr9ZmHfWQc63+eG4lPafisT8TcKeYVACrvfA9Fyq
	 ZcGsqcZBek0pnLSdFvA+32FGl7+sWKi1HGHTGUjo2mO6UJWC5MiWeh/hPUmIY0L3qZ
	 Y4K55oyDSpjrA==
Date: Wed, 22 Jul 2026 14:57:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Frank.Li@nxp.com, devicetree@vger.kernel.org,
	radhey.shyam.pandey@amd.com, alexandre.belloni@bootlin.com,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-i3c@lists.infradead.org, michal.simek@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional
 core reset
Message-ID: <178475025970.1687978.1532465859692058077.robh@kernel.org>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>


On Mon, 20 Jul 2026 13:05:09 +0530, Shubham Patil wrote:
> The DesignWare I3C master IP supports a core reset input, but the
> binding is missing the corresponding reset description.
> 
> Document the optional reset property. Keep it optional because the
> reset line is integration-specific.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
> Changes in v2:
> - Updated commit description
> - Dropped reset-name from the binding
> ---
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

