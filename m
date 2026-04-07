Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A760A27702D;
	Tue,  7 Apr 2026 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587498; cv=none; b=mm15dKeW8wdAESIHSNrsR+cGPyZp6XFjOt1+Ihnq+K2l30UFTdMsfl/mmhmXapCngor1FgpaOY9zd/imFo5Z2hS+k0FWUeBptT6q+5hYDmgamHbQlA47Z1RJUgQwXDgSdjbv5PfjbG+IH8RK0iGXrRda4luray3AjX7LVSEfJSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587498; c=relaxed/simple;
	bh=RfoCuSdIyOP4Fpm9kXSutxGN9meBpEZjFRVOEcgj1aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zz4EPMz/tKX7BAv0z/EheqC0zVdaSw5VhjYDXm8MiArAilDfTwzbQUmhYDhQyQkAi+YSqYzEURTcb8wcjYpO2dfycl5XXkFX87mSakHZzCajmsJlYVp0S1NohwL0AiVUrOMJgaD44eFb/9F+qE5XCR6pEx6A+25CUiBkLJ2RVjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkZD1cxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkZD1cxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F6FC116C6;
	Tue,  7 Apr 2026 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587498;
	bh=RfoCuSdIyOP4Fpm9kXSutxGN9meBpEZjFRVOEcgj1aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkZD1cxBKdN+1FjGJRZwk7GdvwvsHf0/DaPIVcsacSzG8dPIBV6byoiBAH485l2Tu
	 n61IoJ55UEJpNTpqCg4FX3/KUAVvIYDocZ9rL4h6vAIdD/KvW8AZSPWio7rZ5Dvr9S
	 M+edeW6vgcKIUVUPGjkkxGFdl7w+sYdl3Z3CXC85FBSyxHy1i93sYl2TZ23GMbmCJQ
	 9mk68FvEgLmkSXWK17IFq3JFpLhHgtsnaGW8gSyINAFNZyz7txL1CMEbprwqb3w1vR
	 BHnb7ipiBknWtPKP4MLrEuyqilOXfefBp3XGBz2s5oX6IJk2WDyTiOG/MBUNpCQ+0G
	 AlEFq5m86kdJg==
Date: Tue, 7 Apr 2026 13:44:55 -0500
From: Rob Herring <robh@kernel.org>
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert
 armada-380-mpcore-soc-ctrl to DT Schema
Message-ID: <20260407184455.GA3369046-robh@kernel.org>
References: <20260327114653.593582-1-padmashreess2006@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327114653.593582-1-padmashreess2006@gmail.com>

On Fri, Mar 27, 2026 at 05:16:53PM +0530, Padmashree S S wrote:
> Convert armada-380-mpcore-soc-ctrl to DT schema
> 
> Signed-off-by: Padmashree S S <padmashreess2006@gmail.com>
> ---
>  .../marvell/armada-380-mpcore-soc-ctrl.txt    | 14 --------
>  .../marvell/armada-380-mpcore-soc-ctrl.yaml   | 32 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 14 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-380-mpcore-soc-ctrl.yaml

Please move this to 
bindings/soc/marvell/marvell,armada-380-mpcore-soc-ctrl.yaml

Don't forget to update the '$id' value.

Rob
