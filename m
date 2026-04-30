Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D2C3FE362
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539498; cv=none; b=TpFK6AO26cpRucTKQ0nRAT6eLmpdT4XXjUPdqRYTA2Ru6I+RDUezU7e6KNNlS/K9RAdpxMfCUXKrMkr1LjF1pwb4ojy46FSFEw0H+hFZZiq8Xe0SVqV9OrqsvqbBbPsRaGj8lFXOuhjiJLudq876RGGNQHmNEcjGt1pWATLL9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539498; c=relaxed/simple;
	bh=FKRvXDmPBLG+u9plyLD3bSdEFfuRpy675/I3iaHbLo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FBfN0IYbaHgZ6LiRN2h6bI9b5T1lMQ+5PsMA8tKE5e9j3ykHPP/WXQVEbmLe1xJtgC9XrmDtz9P3+rJSiy5z6lPBEjHlobn0ctkE4nTQq76tKhI0qccxhgZb6/D5IMp0dxPvJ5yHUjayyW52U/0M5pVOexlZHOaH1SGOnFDa3yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcWL/woO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcWL/woO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B51C3C2BCB3;
	Thu, 30 Apr 2026 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777539498;
	bh=FKRvXDmPBLG+u9plyLD3bSdEFfuRpy675/I3iaHbLo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcWL/woOe2AFuTD/DaDClgOBoV4m8Cj4B124gB4lVfDzXj97tfLnQDPYGhEt7SiNF
	 YZzUZ5Y2fFBS4dAkCs38JqCDuN0hgdb50tf9MMU4FlHk2f7Z6mcuMnTnuXXza+OCeT
	 TCVw74qqOaIzeQ6E96P5dX/lj1dzfqgJ+jZDSNEwJgdKmjjgeuqc1FxcYJWlVbgG5k
	 EGUDlVbN4AKIyHJWQg00Q0M/dRTTTytwFHIT64Om4DGOA2kVddf06LcyKWInk4lCgR
	 hkT5Cx5ff1Tanjh6pQ0G2NWYedadPlCAnOzm21OTvhya9c8k3b6DXfw2+jerT47W+p
	 geC3Zcz1437aw==
Date: Thu, 30 Apr 2026 10:58:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] regulator: dt-bindings: mt6359: Deprecate bogus
 vcn33_[12]_* split regulators
Message-ID: <20260430-sapphire-skunk-of-acceptance-dfbcde@quoll>
References: <20260429074113.3720271-1-wenst@chromium.org>
 <20260429074113.3720271-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429074113.3720271-4-wenst@chromium.org>

On Wed, Apr 29, 2026 at 03:41:09PM +0800, Chen-Yu Tsai wrote:
> vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> two enable bits in the registers so that BT and WiFi drivers can toggle
> them separately without any coordination. If either bit is set, then the
> regulator output is enabled.
> 
> Deprecate the existing regulators, and add proper regulators matching
> the outputs: vcn33_1 and vcn33_2.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - deprecate the bogus regulators and add proper ones, instead of
>   removing one and keeping the other

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

