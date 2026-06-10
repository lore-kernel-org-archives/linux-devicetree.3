Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55A3750CA;
	Wed, 10 Jun 2026 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121558; cv=none; b=XL6SiT2UUpV9k3fU6eWQMCozc64+f22+Hdhs9uALSbD8UhTNVpNEbBVv+YOkd8vyB0Bh0RxhR+LJLERa+5NKjF9TVQ8Ap2lVQAMHJDlHGWPN8VYcg7Wb11GTfEy4OJkh6u8r9d2G6jY/AMPGtEyQgNRUTJK+RX0Bff7BfxjUMqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121558; c=relaxed/simple;
	bh=nM362/82e4cU07NooVJuNAiBZOvrtoWBxTQtUAJoxRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVaNka2Ljo6v+W2puDbsxfInNccjpPJTugDKiSd2m8U7tnkPRZO3sMEGHsRkXw7nTMBNqzjJwrYSvtXCwHbiGl/Bt2Ej008jD6Tfx+bLDMB8sM3efT2KLRHZ/kkW16KShvGN5qNsSFibaizfNkq37WXirPag+NvQit2knh7njZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egayTg92; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egayTg92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5751F00898;
	Wed, 10 Jun 2026 19:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121556;
	bh=bkXpye9Dk/pIHO6X5mwJwCLsWt/uoCZ3k5uhJRXjYdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=egayTg92orJkUYatqeE0I+/Zmr4GzGsO9z78SbWv/LA57zUSjRC/7lw7+BvcdxrCu
	 pMMWDG9u9lTcZQoNm0YIYJsEYmbCSEYnzJ6Ml71H5XIdK0C9UWaQRQ8UYZsPUyLTdP
	 RBsytgE2uqk4uuKbSqTl1L/vmoZw6whyCXgJ/1bZSdTom2JUEUzHdCNIRmhp6MyGz2
	 mjV+b4Dt5TqLInz3GkQJufogP+YhnaNKB8i2IaFG5I1pDeI1vtdhwzEoO/ocxoH5ag
	 e+4lXGqWaljjbsLnjj6Eaf215VPIqhE8706hCPGn4WsQ+ioyrGPpucKmgTU/mGIB+k
	 KfPnzI8lQZeOA==
Date: Wed, 10 Jun 2026 14:59:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: devicetree@vger.kernel.org, mail@birger-koblitz.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, john@phrozen.org, tglx@kernel.org,
	bert@biot.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: realtek,rtl-intc:
 Allow 2 interrupt cells
Message-ID: <178112155552.711698.8665696871186240007.robh@kernel.org>
References: <20260605211646.2101652-1-markus.stockhausen@gmx.de>
 <20260605211646.2101652-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605211646.2101652-2-markus.stockhausen@gmx.de>


On Fri, 05 Jun 2026 23:16:40 +0200, Markus Stockhausen wrote:
> The Realtek Otto SoC interrupt controller supports hardware interrupt
> routing to multiple parent CPU interrupt lines. To utilize this
> multi-domain support, peripheral devices need a way to explicitly
> specify their desired parent interrupt line in the device tree.
> 
> Update the "#interrupt-cells" property to accept either 1 or 2 cells.
> - 1 cell: Specifies the hardware interrupt index, implicitly routing it
>   to the first available parent (maintaining backward compatibility).
> - 2 cells: The first cell specifies the hardware interrupt index and
>   the second cell specifies the targeted parent interrupt index.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> ---
>  .../bindings/interrupt-controller/realtek,rtl-intc.yaml      | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

