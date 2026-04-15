Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41404385534;
	Wed, 15 Apr 2026 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776291200; cv=none; b=ByEjvLup4/zkGYsrw5w/aXX5x+w6ysnnrBuQVjKJv1wS9M/Dfs9UenWHss1X3dA2+7Su32AtNl3CYFE9zUF7pWIG7j0wa6EkEf3aFyn7MnRKrfnGy67uhWnXNWxazaqQbaqH6jD/D5nprpSBdmMXo779mVJmI5z1Nse2hMXPJyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776291200; c=relaxed/simple;
	bh=qSg+kNESVJo61aBZDdNgiU9KJvIQqTHcGul9KHiHi/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJMcwF0riSb3Gsa9QgBz27spAc5sYMXI59pQxF6fNAWj7VHZPvjwqHe0oAEp97aBeUsJlxqnc/V/OnB+kBJ/SWbHm82NeVpnlQPkCW5UHaNoAr6YcPR/9WG+32S/ABwsbzc51IOZe89aDZwLCCW+gg7wfrZWZUPY82qsUThEMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxNxNToF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxNxNToF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4ACDC19424;
	Wed, 15 Apr 2026 22:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776291199;
	bh=qSg+kNESVJo61aBZDdNgiU9KJvIQqTHcGul9KHiHi/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxNxNToFUFgjmJk98CnKj500nmscrXFmTs1IfgrgSZPhnw59DyVmfurlClhf+rMYr
	 I///l/oCbWV4sZ0F0VUO3JewFiCHHrGIgQJfXN0Ns7Nz9UWl08WCTDSGuh6fjAdOR8
	 2E4PH1Ggh04LhZv16g9lS9XbtJrjFd1fmKl9sc12Yw0Hjtl3ULi8UAWTWMPTPJeZJF
	 4oxpWyqFS6JdjI7/0YDl4r9Yk9HYj6P8+SdskXzIpRCYNG/izu+hSnO4ndHdHg751S
	 E+PL4D0LEyDAmI0q/Swnu+FWkuSWvPFKIVCz/MPm9/ckFZxN1EHV+W/3OKW2T0DOFd
	 Ysohiw6Q4gByQ==
Date: Wed, 15 Apr 2026 17:13:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: linux-riscv@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/4] dt-bindings: interrupt-controller: Describe
 AST2700-A2 hardware instead of A0
Message-ID: <177629119770.789152.6115453884565821746.robh@kernel.org>
References: <20260407-irqchip-v5-0-c0b0a300a057@aspeedtech.com>
 <20260407-irqchip-v5-1-c0b0a300a057@aspeedtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-irqchip-v5-1-c0b0a300a057@aspeedtech.com>


On Tue, 07 Apr 2026 11:08:04 +0800, Ryan Chen wrote:
> Introduce a new binding describing the AST2700 interrupt controller
> architecture implemented in the A2 production silicon.
> 
> The AST2700 SoC has undergone multiple silicon revisions (A0, A1, A2)
> prior to mass production. The interrupt architecture was substantially
> reworked after the A0 revision for A1, and the A1 design is retained
> unchanged in the A2 production silicon.
> 
> The existing AST2700 interrupt controller binding
> ("aspeed,ast2700-intc-ic")was written against the pre-production A0
> design. That binding does not accurately describe the interrupt
> hierarchy and routing model present in A1/A2, where interrupts can be
> routed to multiple processor-local interrupt controllers (Primary
> Service Processor (PSP) GIC, Secondary Service Processor (SSP)/Tertiary
> Service Processor (TSP) NVICs, and BootMCU APLIC) depending on the
> execution context.
> 
> Remove the binding for the pre-production A0 design in favour of the
> binding for the A2 production design. There is no significant user
> impact from the removal as there are no existing devicetrees in any
> of Linux, u-boot or Zephyr that make use of the A0 binding.
> 
> Hardware connectivity between interrupt controllers is expressed using
> the aspeed,interrupt-ranges property.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> ---
> Changes in v3:
> - squash patch 5/5.
> - modify wrap lines at 80 char.
> - modify maintainers name and email.
> - modify typo Sevice-> Service
> Changes in v2:
> - Describe AST2700 A0/A1/A2 design evolution.
> - Drop the redundant '-ic' suffix from compatible strings.
> - Expand commit message to match the series cover letter context.
> - fix ascii diagram
> - remove intc0 label
> - remove spaces before >
> - drop intc1 example
> ---
>  .../interrupt-controller/aspeed,ast2700-intc.yaml  |  90 ----------
>  .../aspeed,ast2700-interrupt.yaml                  | 188 +++++++++++++++++++++
>  2 files changed, 188 insertions(+), 90 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

