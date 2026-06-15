Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B112EEE68;
	Mon, 15 Jun 2026 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557323; cv=none; b=iVf2YdFOi/5oFDYtTwioSle/AP6E8Srl80K8xHmZb7x+ScGOCoWkOOK0kp7vIb2tLYNjfUyVIUGYHMwCPkKQ5SrGvsEJisjXFnZXYbqIlanmXSx7FxkIvrAIO9RS148RAIN1HcQS+wIFrsnOFiE7Dk8vgTgrjxqJT30yl7nOemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557323; c=relaxed/simple;
	bh=QZw37cA5aQdC8S64W8vZ0f57k9jrcFVFXLwCGyygj2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOK0NxCO0/QhTzTNCvYbL+kTxonKcjdgNma29LZ5AIvKgP9tuEIk6tcOxGuKT0C33p9iunFyNM1UWJYYhfQLosZ/vn4fdzVul1TKibuCQigIh53dpOPscMaeYTBHczTxlttYNMJENGxuxiv03Lntl6kH7d9RRnWbmjle2pxIrFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hv5/iCCm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hv5/iCCm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310D71F000E9;
	Mon, 15 Jun 2026 21:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781557322;
	bh=DdygmByCDmh91zxCbmb+NyTdMRmdD4F6g3LqLyz6S+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hv5/iCCmeYJIyoPUhr8t5Sy/qfi6oGh8oN1xxfb1ecdF32sW+kJEVAqVpDxQDUiQA
	 oJIxXI/LuI8avDsTkjf0KPubp/HkfKTd3x+9Fp6YYyhHdDexqw2INy6HS7+zOnD05Y
	 yUIDVZ5NkDBzR5p6f5UisvxSKJPXWYy8x2YL/IScCa2WjC0A+YMkeFlCGsnMsgWOhB
	 KjgYBG8TJPM08OrGGK7eJB4UyV580cr8o7qMMYVFXlB3rIEyHHjYTlBCIzScKECnaS
	 hCCH6L58wxz6Are7y5pQ2YVlKTskBG6PaQLOyYBTerUXzyF3FXLDme4EN50ym3cD4S
	 L44DyPzir7GBw==
Date: Mon, 15 Jun 2026 16:01:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: simona.toaca@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	m-chawdhry@ti.com, daniel.baluta@gmail.com,
	Thomas Gleixner <tglx@kernel.org>, Sricharan R <r.sricharan@ti.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, goledhruva@gmail.com
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: ti,irq-crossbar:
 Convert to DT schema
Message-ID: <178154975475.1640860.7016352484406221018.robh@kernel.org>
References: <20260612-crossbar-v3-1-266747bc2e86@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-crossbar-v3-1-266747bc2e86@gmail.com>


On Fri, 12 Jun 2026 02:42:29 +0530, Bhargav Joshi wrote:
> Convert TI irq-crossbar binding from text format to DT schema.
> 
> As part of conversion following changes are made:
>  - Add '#interrupt-cells' as a required property which was missing in
>    text binding
>  - As irq-crossbar is interrupt-controller. Move binding from
>    bindings/arm/omap to bindings/interrupt-controller
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v3:
> - Fixed typo in property description
> - Link to v2: https://lore.kernel.org/r/20260611-crossbar-v2-1-231d4f88298e@gmail.com
> 
> Changes in v2:
> - Dropped property name change and driver updates.
> - Link to v1: https://lore.kernel.org/r/20260606-crossbar-v1-0-f67f7cb9ee50@gmail.com
> ---
>  .../devicetree/bindings/arm/omap/crossbar.txt      | 55 -------------
>  .../interrupt-controller/ti,irq-crossbar.yaml      | 96 ++++++++++++++++++++++
>  2 files changed, 96 insertions(+), 55 deletions(-)
> 

Applied, thanks!

