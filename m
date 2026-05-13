Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024923890E8;
	Wed, 13 May 2026 23:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715504; cv=none; b=dXXpo+hTgewNL+qEa/rESCF4q8ZXQFIRa/G271ANNX2Oe7ovhemIWDe7AqBRqe71d8pDQA4bfFIsV8emyp3jUyDQNh8AR0Y8JP0YHv5Zq9agulkcJ1k6tfj4yyXRaml7eJp1WLym4C7YVAHUK6wiXFrBiEkTviL2jtojxuuk1w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715504; c=relaxed/simple;
	bh=d2UALDv0MmPHTajabTGVMFkrVWBmz2128Gozj64Y2PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soeEBZjcor1uSccA1k/T13dQEYxhzYKnDt0pixIHt4pBtTzzdsT6TyYurraggD56jtL0r8JGzSOaPFifgBkO0SR1xYDhr8AhucfDrnFWRsNSuZymGDcsr7wvw53uRZDyWu2e3dlVcXHUfClvp4A0kN87Subvdb3XqxP97rTa/YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bm/n/qyu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bm/n/qyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B38FC19425;
	Wed, 13 May 2026 23:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715503;
	bh=d2UALDv0MmPHTajabTGVMFkrVWBmz2128Gozj64Y2PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bm/n/qyun+G15cXN7LBd7nI1VSnQFijVvVjZXMvnq2d3l1KvJObYDQEqRP27Z1Unh
	 zEGguN0USvmwQdxTJc1UP+b823n8toMssQKXmPGD5pphvpZH31uSMbBy56Ye7lJsYh
	 PzMl8pTEzYAfuNfeJPRIt+Bv8O9+J4+Dtc8EqO+PcuOtg6gh9BHns/y+ciKP5bVYp7
	 0uRJgJrijyNhrxk/avpD9rl85PmVapzzxdyEFvIjZNHvGUim5FC4zt+/je739hxU2L
	 PfnAkUzy3w4RucHYw2VgxsN5gdIgIm9mHgqPA3lnjMEHnGxUOwdHwTVK7TX3RCKWQs
	 ncBoUA6lzNxew==
Date: Wed, 13 May 2026 18:38:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Andrew Davis <afd@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Bryan Brattlof <bb@ti.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
	Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Message-ID: <177871549917.2312246.2169010198859833404.robh@kernel.org>
References: <20260508230341.1891450-1-jm@ti.com>
 <20260508230341.1891450-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508230341.1891450-2-jm@ti.com>


On Fri, 08 May 2026 18:03:39 -0500, Judith Mendez wrote:
> This board is based on ti,am62l3.
> 
> https://beagleboard.org
> https://github.com/beagleboard/BeagleBadge
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changelog:
> - Update compatible to: beagle,am62l3-beaglebadge
> ---
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

