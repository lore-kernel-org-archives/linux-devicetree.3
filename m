Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D337CD5C;
	Tue,  9 Jun 2026 07:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989863; cv=none; b=nKzTgQQSPd0fNULKcuwoGuLayhgzcsdLcDM17uyn/cKhsgN7siWwyTMlQqUTh1TZ/58zqmJrQhp/UCm9lva4mqD8ij1c83Lb5EWIo7Hlsvdf8Sv3f9EM3Sly7Y2RpIds9Pa8+Oz7sS58LkO7J/k8m3QREgFMdZXMpAjfWQ4TQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989863; c=relaxed/simple;
	bh=1SGBH0+p19S1Ew7X+5YjP3OHj09qSijY643HFgXPfMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1uN5qA5E4W5uJSJevkfdpVNN6XGH/j+TzfydhNFQZl9bXLrIXdbZbZovgtLkp9lkWiH3vzfd106mEk0doZn2oWcq/AkH1hgmp3cz9OVHgVzKIOoJhWBmzWvIUCKe242c6QEHPdHfXMKgpZcrHLQAGvxfMSgxhGe/Bnzn5oXXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCG6KX2m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCG6KX2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FC91F00893;
	Tue,  9 Jun 2026 07:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989861;
	bh=nP5nc6+ayGjvJcpkjtBre/TACIZYVnCWBbFhPz6C0I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCG6KX2mqGLppONKgLkFr8y1dFex0IQlMofSyGGxuaNR2StBlQdS6vlKHF6LtK3w6
	 WbTaEJTwvRKl6nGCXoZ7d8I2rO8JCvRr4PNJO0XBYwWDDkouxpSeuHp7a5XPGN0rQl
	 Sg2IcHcSJff5DI1XfuqpmTo68nK5mm1Zk63J2/JD2xgXISi8jT9NEJ8HR95CNmJtD0
	 P3edsicUK602/nV91losjMsu6lw8t/uzuSwnriCIyLc10CZcR5j3vobapJ7AaDo4Cc
	 CRPDwT8nch9UYXBm0yQHhqeLdzdpjHM3SeJWXPQzLRffX20ZUujV6+0nVct9ovl2Fw
	 JfPd4c0aaNhWQ==
Date: Tue, 9 Jun 2026 09:24:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: rawnand: qcom: Make "aon" clock optional
Message-ID: <20260609-aloof-healthy-condor-c3ca92@quoll>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-2-4639a0492274@linaro.org>

On Mon, Jun 08, 2026 at 03:20:23PM +0200, Stephan Gerhold wrote:
> Some SoCs (e.g. MDM9607, SDX55) have only a single separately controllable
> clock for the NAND controller. The actual clocks in the hardware are
> managed by the firmware and turned on all together when needed. In this
> case, there is no separate "aon" clock that can be described in the device
> tree.
> 
> Make the second "aon" clock optional to avoid an error when it is missing.
> For platforms that really need it, the dt-bindings are responsible for
> validating that.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

