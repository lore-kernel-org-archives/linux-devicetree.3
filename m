Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55312EA171
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781547168; cv=none; b=k2mwuhuT0ZWN7Y1Tq4XypabukJakwptZdv0aWz2FZ8i5xXXoi5+BtVWBEicBxKWjn/MlUf6sFgaUWpJvvyZDAwtIRqrwRNUy2lMOQP0yqgnvr1DLZDpOWHQpP1TIRNCsZMDm/16uCUsWfwdgARfkUM54rGgKcgjStZxoqRnGCEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781547168; c=relaxed/simple;
	bh=D20kwWOqYJPVmNyffos9da/kORJGvM4WkHV/dvm3Jcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csbRwT5Qrplxd+tGp+a1SMY1CJkNnEA87dauikiwTQKNKigJQww/AMXMyGmw1txyEzavBp26DJvlEtQFbFjGtKtEzkM8XfA1vzZR/6RG1F7Rvca/mZJlkjf23QANujzUTVYxpz4gMG2x/i/oRg2sVwTpXOW0WVlHoJT0nE5bF9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhNqG/Ge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhNqG/Ge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3971A1F00A3A;
	Mon, 15 Jun 2026 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781547167;
	bh=8AE13TRwtglX64I0/03uogqRdP46SfUk7asscgfmP+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DhNqG/GeMp1Ctw3ejPCktiz5PRyZwxNUkJlYdx6Ez/K4GL4ykNKP0ZEzzLXnCnr0P
	 qDbCln6cSMfWMVrGw8Kh7ArL3sIWRuXVeOg9w9kyS5ToKZy8hKqg0Jk0PxI9nO16EG
	 hR8AnmXFi5C/1widb6tS9fcjUA2BHQT2PFih+Obcbh96E0OQ60MhQssXT97P1WCncl
	 ksI1MKvnvFGv89LfHoY8VG6u6Xrw1UU+x6ow0L4m/umrUG4ZmW4yrw/jeOD6zY9wA+
	 gIcZMheoGlPH5mYGWfzDYM/3BKIYK58/gQ1uQagBfT7RVlduSlBwojLbPRVWZZ+Bnx
	 26eXmO32zpctQ==
Date: Mon, 15 Jun 2026 13:12:44 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Gira
Message-ID: <20260615181244.GA1567228-robh@kernel.org>
References: <20260610213047.500701-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610213047.500701-1-l.stach@pengutronix.de>

On Wed, Jun 10, 2026 at 11:30:47PM +0200, Lucas Stach wrote:
> Add vendor prefix for Gira Giersiepen GmbH & Co. KG
> Link: https://www.gira.de/
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Rob
