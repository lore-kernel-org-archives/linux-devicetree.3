Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387432F9D98;
	Thu,  2 Apr 2026 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775162121; cv=none; b=pGwuwcYyu2WtTc33+jhvpEYdxKXFNqOaw8teABXi5nsJ4LftY122AYdB3W2afywCcpOU6wNIbX66u9D7KMKyZ5mRT+15ioPOpwksn0YGYdzsGW+1WrE1UGGupopXe8YVkqzFlSBHhUmKbq4wYWS66SWUSG6YC5jNOtVfWe7//PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775162121; c=relaxed/simple;
	bh=aF0Bco08LkkAEkpaK3jOuUuwB7Ty2o9ujhcoSQQ91Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGeYRxh+vMBE58hXGeNxmdB6BUi5aJdApehY+jeyrRjiibjaLr0AV3kqAudSBoP/RzSNsN4ZIO/9tmj9rKo+WFgJJk0MLb1NThIA75LlgFo/Yq2qE0oD4TRb8ug6ftfikpBL5cL+BJno77krH5vyGDe0HHOOGAMU3wjMN32TpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dnfV+iXx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dnfV+iXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DF2C116C6;
	Thu,  2 Apr 2026 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775162120;
	bh=aF0Bco08LkkAEkpaK3jOuUuwB7Ty2o9ujhcoSQQ91Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnfV+iXx6qFBtQN0XRZcT7XMYrXpz/LPW0F2B1t6IX6OhgI6LYhafQRQC9/8rDOgM
	 thtKhMZcMgIXti9dL/KIhvM2sRYGdtfIV8hLTa64uu9hK/PyxRmuj0/CouANmQwgEm
	 zQ4E2Tm11Yf+AhPmdbzI8Gv+9NZygdI9pUoBKEnuZ6ZVBJVcs3cTClKgO+fr6AC0AZ
	 paN4voqm9AN6FioiMP+CyeDQ64dycPxkL3hVnLbyQYkEJTTGMGG5uLqZ6yd6o+8vOh
	 SyZ8mUzMjVjqj8DRds/qySML2Wk6y4fCpag8l8hO5CizJr9U6CpmLcldsLzWZCdMyZ
	 Hr/1v3nOr3sCA==
Date: Thu, 2 Apr 2026 13:35:19 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joel Stanley <joel@jms.id.au>, Joerg Roedel <joro@8bytes.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, devicetree@vger.kernel.org,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <ac7TByN3oQGSUpyq@x1>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>

On Wed, Apr 01, 2026 at 11:57:57AM +1030, Joel Stanley wrote:
> On Tue, 10 Mar 2026 at 11:09, Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Extend the binding to cover details specific to the Tenstorrent RISC-V
> > IOMMU. In particular, a second register range is added which contains
> > M-privileged registers, e.g., PMAs and PMPs.
> >
> > The RISC-V spec S-privileged registers remain in the first register
> > range and are compatible with "riscv,iommu" so the Linux driver does not
> > notice any difference, but the binding will be used by OpenSBI and
> > potentially other M-mode software.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Drew, will you take this through the the tt soc tree?

I think it would go through Joerg's iommu tree, but I could if Joerg can
an Ack.

Thanks,
Drew
