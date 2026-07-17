Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4150D3955FB;
	Fri, 17 Jul 2026 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279556; cv=none; b=Ud2PZpWOgDTq9XiLkUJEZMSmOVvTNbgzQ3u8vKRrHOgiNuIaORVxyaPahkn8Fbzi97b0cBh6aNDYORauBY35Jxe2TZZhr2TJszYIa2ajqfNl1fHJ0kTUaL/d2PABY4TtI2LB47NH6OU4eNcV6h6t9iUOPZD4uOEjWzPUwrJyJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279556; c=relaxed/simple;
	bh=s4VUUBMhmIog3dJoV19lsmDp2FKrzRiCV1Ot1iiTxXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMiVMGXMPNgLLfI/foM7wfLVFC1fEle+++rNMw5aKGfNf0SJa2r2VdPnBT3d+2MFJ+RWo6EvmcASeReRusZMzmF8v4yPxarJaSy0GtZ+gUOrpq9y71UrVQzQUhzqWti0p45bn35UwGXhp09aZB5otxnmiEzcGzAMBIrLP6JGHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBgjl1gA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBgjl1gA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B337C1F000E9;
	Fri, 17 Jul 2026 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279544;
	bh=bIvWWTk3vADIlADV5eXwWT0fkY/tKsWP05/vboN1JtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TBgjl1gA0sGd0Ba211yJftbOGGUshwvVUqyHXNPpjEJl39nzOWVwFhZ3+eW3mRBA+
	 9BO9zTTEm03cYwlrnYQG8q4wWJRdyNN1BRK6voLL/bBtt4mWbReJyxoTCG7lty15Zr
	 Qnqd9huJoSBvaRiAFXLvFWGmmTOQ4uY0bbUQaRcJwKWuhHkWgXoR+X7HBPM1aLZJR/
	 frITHKVnppbO9WO269ZIRZt4PH7cA8jR36zg56Y1uzRuE2Znd6Z84zfkIbrgpGpksR
	 W9CKgCu1Vj41ml6OPJXbJIuYa5uvRhkIDczGNQ1am89cd2oJOyakQkUDdtuoHtM/AV
	 uoDEcxFXIkjnQ==
Date: Fri, 17 Jul 2026 11:12:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Message-ID: <20260717-slim-fictional-warthog-7dcef2@quoll>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
 <20260716092859.512306-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716092859.512306-2-hrushirajg23@gmail.com>

On Thu, Jul 16, 2026 at 02:58:58PM +0530, Hrushiraj Gandhi wrote:
> Document the compatible string for the Vicharak Vaaman, an RK3399-based
> single-board computer.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>

Nothing in cover letter or this changelog explains dependencies and I am
pretty sure this fails tests.

Best regards,
Krzysztof

