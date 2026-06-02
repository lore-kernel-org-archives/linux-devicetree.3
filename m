Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51533EFFA9;
	Tue,  2 Jun 2026 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415246; cv=none; b=em8cOCDG+a638JS46WqpAfvOz3fyzw8BZchRe/o1zwA/1aTVorBMrLVruy2etaASfiSQ9rE4F4sSceXf4ThOvIMFmvkT6hWw19CYikdT0mUUFLP5KS4IV9GE6eMc79ZAGF4+BlsBYowaojdn7sLeHIMqTH1cKTiZdzLmIzZBHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415246; c=relaxed/simple;
	bh=fB36J/SRW5tgF6/JUKwGX6SJvzrzKiu+kMVb7HNYsjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GezRVkMD8sVAuAJWYA98jKj05TVIDPSTHrUFQO2+fMOKlSgEXtQOw/YBNMTXtLRr1vpQKOtJWeeTbQ91RoMpNSFGuEiSzT9QfDMAdAqH4A3bG56AWexqJ7DB1m1DbOY0yk3WemaGEhEdV1O5aKoUxgafL6rW3v0GU+mnQCLlCes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Me99jb+r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Me99jb+r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1271F00893;
	Tue,  2 Jun 2026 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415245;
	bh=rLJGRrI9wchr6WhD1/7j1dssOLlHbCro87xumtftL1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Me99jb+roHbsO/55bjAd+JNvbH/TdJt1UxA/XQgPQfLSqmRbKhL8X1rzyQJYHNu9I
	 KpY4PF7EcDOgd4HKie7lGi/vELjW9kza3vmU5640mOzV2H5QRnySYvGUXERZmIkfDY
	 lK7rvXLEBLZP1i4DbxAG+S8znCGyoHQtgUB/F6Fj8lXSgjX9ujhoWeMafmBzHu19YS
	 v4fvCpkUKfiZ8OQ+1m9J1ENk39alRzyAZy5XjcPigyfu3vpExICv8IWAngBeFXGCjj
	 bTf8zrdQ3Z8ENIA5/7C7zBhFe//4oPXzUJhVe4Nvd4appIZONfMBbosePt5T+9qxZp
	 eyRB8nFx6pGwA==
Date: Tue, 2 Jun 2026 10:47:24 -0500
From: Rob Herring <robh@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: vendor-prefixes: add vicharak
Message-ID: <20260602154724.GA399800-robh@kernel.org>
References: <20260601162143.170030-1-hrushirajg23@gmail.com>
 <20260601162143.170030-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601162143.170030-2-hrushirajg23@gmail.com>

On Mon, Jun 01, 2026 at 09:51:40PM +0530, Hrushiraj Gandhi wrote:
> Add the vendor prefix for Vicharak Computers Pvt. Ltd.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>

Missing tags. Perhaps because you are sending new versions before we can 
look at prior versions.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 28784d66ae7b..504a691a33b9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1791,6 +1791,8 @@ patternProperties:
>      description: VIA Technologies, Inc.
>    "^vialab,.*":
>      description: VIA Labs, Inc.
> +  "^vicharak,.*":
> +    description: Vicharak Computers Pvt. Ltd.
>    "^vicor,.*":
>      description: Vicor Corporation
>    "^videostrong,.*":
> -- 
> 2.47.3
> 
