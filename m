Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650923B19D5;
	Thu, 16 Jul 2026 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222856; cv=none; b=AufMOwjDKhoBd7mNuvr+QiUo5rpsemABI9JRi1h/TyIuD4RUYg5viLunsZwDf1nMtL+DWwZ7kOPQ9nR75TVJ/T9StdaaP71Og+scY92l2foe7u7GWSPGrxdVNdaTCbBg8cB4T5CDta1fa2Bgu9vWGCH/NN0rvGcDaZwgN655RxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222856; c=relaxed/simple;
	bh=4gdxKsGJhlOorwAzJny7Z3/wX5DGmtVW6peLelERwtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqDBGJzFKrkMEQSbqNf9mVTr1XjgAOzH40Et7gcF859BkYaExcAiWVvh0WiUkxei2ZcC71yFdNyZF/+n6f8eMzWilBoH4Wt3rxKDOV7lf9Q/MuruJHFnyQSeLUMKi4BDPkQlYZRFgsYBZ3oKmc0FYQjGCAXgwbwzc1yojr/27eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ri0X19bM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ri0X19bM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35B11F000E9;
	Thu, 16 Jul 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222855;
	bh=C7Ri43wnBZH/LIFHL9jN4Nlw6bbCudsffErXi9BbAO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ri0X19bMgazH6mxlzhILR3c+9vGgCmx10wcV51E0x5hNbOWjUdYU9uzFCj2OfLpD4
	 sneVATBmk1XNecfir3ZmxmHgRd+noU+ZdTkjz0PfjW+jj4+fz2HCmyVGLooBR9i7Fh
	 AIIX7nM4vFVyuOu8buayBGzoqSq1LgzktSS39odvxe1hhel+phBq+QBENykoH/WXNn
	 3C/0FLAcT8cb6c242npGzG/J0RUyOe55Nl5nVUluW+8Q0iGhXKSUXMyz2M6TTFQLX8
	 wvMbi4KVadUn618fubfEScJ8J+Rt6IXIlEd6FjKdku2OLBbObnZR2/FUDH/Em/sFvb
	 o2nqbINCuxuqw==
Date: Thu, 16 Jul 2026 12:27:34 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and
 CM5-IO
Message-ID: <20260716172734.GA463528-robh@kernel.org>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
 <7e27ad59-0ffd-4323-9991-d00d69fde098@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e27ad59-0ffd-4323-9991-d00d69fde098@smtp-relay.sendinblue.com>

On Thu, Jul 16, 2026 at 06:55:47PM +1200, Jiaxing Hu wrote:
> 
> Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
> CM5-IO carrier board.
> 
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Please don't send new versions so quickly. We all work 
different timezones and are busy. Krzysztof reviewed v1.

Rob
