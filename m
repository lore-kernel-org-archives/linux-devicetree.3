Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303553815F4;
	Wed,  8 Apr 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639045; cv=none; b=ZxToyC2VLDvphtOPtTxuI15P5Wts5YocfAw/VsUXdx/xvDZiVGomc1kxAut0u06YBg9n25jXsbO1I8UhSh7YHrQwOTX5d5tWEUau9B2mHLUXeTmJ+6G9mIkNTsFJ+nkqn0YpM1kEKSYxykNuw5mhdCIKHbTejJil9I/YkVC5CbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639045; c=relaxed/simple;
	bh=wtwB4aX4vGpdDsXQMtAf8PcUF5GLYCxCdtiObzDC+qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Naq2SHiglRAONwxjWbTZI55QXQdGpyNvbEh/VXLLRF19wuqvhwv4OYZE5XWOtC+EtMdtEOijSqPgY+rbXT2ANrR4WwWugKedUpElkhCzSQeEa6CrbtkNJqVoZkBk0x81zCCE8zdWkBed2If6G0MgwMP0DgR9HSZxSpPrCpEBn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5XbOLFM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5XbOLFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9F4C19424;
	Wed,  8 Apr 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775639044;
	bh=wtwB4aX4vGpdDsXQMtAf8PcUF5GLYCxCdtiObzDC+qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5XbOLFMUlIfzCTyM2UGmy/9WjsTgNPbIfMq6sn+eHnHDPZP6ZOwfChBj2eiA8sMB
	 y/Fbk4VNxrqC7SsT7xVoYYK8ixiM4FvG/KmTgB+akyhJQnVFQQT1ZdJh+u1uo8pO6z
	 3xYWfeNKJ0vL1kkEPkKxOIE8ZWBGCXjnHn/zVS2FDs266IkdqEsaLGm3URVK1T0iXg
	 6ZX7wAp+6GHGC3G0E65M0yPGlDyryFtix0ULPskaFNtzGdNY7V971lvwPtOkJ2LQxk
	 RZZeVNd6Rskd1owPVK0RbO716BmnMZ2TMvX07M9Fj0SSwfeOSZbkXhNBrlD48mG4kg
	 GdWfCVi90E/Vw==
Date: Wed, 8 Apr 2026 11:04:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: soc: microchip: document irqmux on
 pic64gx
Message-ID: <20260408-wandering-divergent-marmoset-b57df0@quoll>
References: <20260407-headache-reward-ae93bacdba0e@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-headache-reward-ae93bacdba0e@spud>

On Tue, Apr 07, 2026 at 04:29:31PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Being practically identical to PolarFire SoC, pic64gx has a irqmux
> that's entirely compatible with that on mpfs.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  .../bindings/soc/microchip/microchip,mpfs-irqmux.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

