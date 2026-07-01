Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799193B42C8;
	Wed,  1 Jul 2026 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889550; cv=none; b=D78xTWiY9Gt6eN3rlYZCxJrieuZlvPj7Kd1xfZTlSWOd0367sDEGc/tKlHHkRAfoqI5gtDOpD7aiGAyEhIyOT20nFQTP5hC/AhzLo3wnxqoKqPu4V0Z8DrcmeghpPdUJdOJt5eT/fQ7yi5i/mqFlunsMkAfK6QSEW0aN6qWIV2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889550; c=relaxed/simple;
	bh=BQDkF0ET9AepSf1JuiVVjQqjkNWeshJ2rxfpXZYlT4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTXz3jMhp4uuewL9tX1LSqc6HwQuwFLsySdjQyiYHL/fquptbar2Voh2OjlW2SxC8z4C8QM2Gc5vsRTfVybaEcGdygko0umxDAZWVhWZNlF8VUyb7TzkuIaTfKdwqzhZUY/lA/8fkstu3mLednGJHEHAFMqy7Qz9vTGb6A2OZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5R2/nBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5R2/nBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358041F000E9;
	Wed,  1 Jul 2026 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889549;
	bh=zrAlCihXAcC59ghuysxR7ERdUdRQ2ao8tvLWADCyLyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5R2/nBlCfCHCXjuCLpDJtsz7/SIw7qGduvxvd5fw5Zfl6TnnzPfRivmKTwjvV16w
	 X/+6te7Wyh+eSaWuKU83dtJiPQ0/FJghYe/7h79Ceju2+slZ7Cm3TygXYBvyLz87+d
	 yc7OuErLnEHDBIkBN8zDqLuCS1LJmAaij7GT1SHT0pmukbbK2f//+6wUMiCQPCLSCP
	 y5680erjdCK+ATyrTEoTNpY2CwB6R4ywlQVR3sGBeryYMG0Ua5wo1pqP3EceTKDPe2
	 ickRjDeybUQNoHNfbmE8cFhIen49xZ+fG9ZfWrG+j3X1BIvlO+O95cEygKPAA9qKa7
	 8iBfkIbmEQKNA==
Date: Wed, 1 Jul 2026 09:05:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add graperain
Message-ID: <20260701-sturdy-imported-oryx-dfc12a@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
 <20260630153810.3574714-4-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630153810.3574714-4-coiaprant@gmail.com>

On Tue, Jun 30, 2026 at 11:38:09PM +0800, Coia Prant wrote:
> Add graperain to the vendor prefixes.
> 
> Link: https://www.graperain.cn/ (China)
> Link: https://www.graperain.com/ (Global)
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

