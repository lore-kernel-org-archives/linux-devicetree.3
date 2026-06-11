Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD825FA29
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195775; cv=none; b=n4L2+9I1ikJhE/vuHyr8hQzuVuz9OJaOsjwA22yiTW9OvsGIlpisc5IPteM+DGosxZqcLDDB/SDQkzq8vG6KuF9hDdYsQgj5gu+89lWvI2ErjtkuRZWElAJ/Hlc6wl4Lq5BcLqL/nNOp1ZxUs1dtI2DLV71nD7pVWSxjzeCza2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195775; c=relaxed/simple;
	bh=Iq4XE7TZqG/cdWV0AtybQzOvyi1Z+wi0YN/Ff5nygms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQcK0K0LSrQy/Q8Tc/F3cZY9aauYd5AOe1wMH3ICl/PnazWuMcYkdqDR0ixj9BGqq9DAGAhZRzpWlSBOJ0cd+eMuxY9vLqzXICuYU6wqjgUPteHfD6FOLhnd/W29KV+6YWiojKQGuZzPecCdcSuQUm4hQ842At5syqQcHCwWbk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wsae4kLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wsae4kLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB5D1F00899;
	Thu, 11 Jun 2026 16:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781195774;
	bh=2N0qWoXrfak0xGG1eIGg2FqAh+x5olhBjGsCNYaVpCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wsae4kLxtUl5dSecyi05jZETMu0MnLTgTd9dX1xJpZVA0fugJ/oWGd7l42UxCBzJ+
	 k5yhUosRvgEsU5bd9XuFGhaHF0X+iFeo4ft7z82b1FYPxkUr0LIET6KbF/Va6Kf3xB
	 iEGcy65AnqL51YqqEPGg2gFvDF0Ow8HIAAwsnHggODykbW7DPgMFiWtvZUMsHfovtW
	 ZhrJdTuEds0REUghF6LVj4RvAeiqYWcNBLQ4p9cKZ25g29gpOugOxVxY8lphwEH3qk
	 GjBPOU61yVw4136AA/A7K5VnfMZdoB2ZjSztp78xD8dZQUTLx72MkMEywbRs5vQxV2
	 K4gBNmhPIp+wg==
Date: Thu, 11 Jun 2026 11:36:13 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch,
	airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
	maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com,
	neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org,
	krzk+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V7 1/6] dt-bindings: power: supply: sgm41542: document
 sgm41542
Message-ID: <20260611163613.GA2922314-robh@kernel.org>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
 <20260610144407.438846-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610144407.438846-2-macroalpha82@gmail.com>

On Wed, Jun 10, 2026 at 09:44:02AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Document the SG Micro sgm41542 battery charger/boost converter.
> The parameters of input-current-limit-microamp and
> input-voltage-limit-microvolt are defined as such since they are in
> common use among multiple bindings currently.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Missing Conor's reviewed-by.
> ---
>  .../power/supply/sgmicro,sgm41542.yaml        | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
