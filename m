Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12FA40D572;
	Thu,  2 Jul 2026 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980742; cv=none; b=piDKBn/ECqyz8mwlad7aMl9EeMAPHMFoXL3FznPIAMCCyQNONe2+FahKa3bg0vvnv1LhR4ZGQ7NzVupQQ0//V91K88kvrdNaGzdRruANO3qhVYHSg4mbbfCdfZwtWuCUxFze73PtCsskGSKe3UtoAVNsbRx6u7Cr3glHEiDQUpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980742; c=relaxed/simple;
	bh=nvmSYrY2ZjddaWIHgV/D6Rg16qj79i4tUgCS2+4BukA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYgTmKTrKLd8GFJSNZgJNUtZNO8AP+eln14ANUXxtVdPyRM4ojY4oB0ldudbJvqfkIet3Zs8EiOqOa5AuQl4f9uea2W09V4RMUsYaQnTkvgeD/hdX5wLBfe+pC2z/fi/3CTf0exd984LM9G8QU1oSBKwKU4BN/XgyoaSKVkVlTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQaM1bAQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQaM1bAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FF71F00A3A;
	Thu,  2 Jul 2026 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980737;
	bh=4RY6J5hQsKwwS1bODNyJH4n0AYCEf0BX4FbYt1LmhgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZQaM1bAQ4JjnPHk4nL6I/xL2zRMuxjW8IYTzz1iMgcDC7gq0rPmgrU3aPeZ+Yuh2f
	 LrrpGKLZ1JtGJy6Lh3gbWyHQSVZArAYsxZ53k8q3kPG63seQYLxnbAbkFsiYP+7UO1
	 tdaN298mTxAzR5LHevcBRh1iZrmx6upDRIYoMdLtsLTn0ifY+JkkyeGZtdHA1hR/iW
	 WiannNMPw8hsKAdYGtF70dJgitWc9ADcQtaZCQp6qJEI5qVR6Kwwe2UVmlePHfaHqJ
	 JjPyQG978zg3CsJU+pPrNkJ0I0uKr0+dZzAMantZsCeSCdNtw4VJZwgZb5HRPeRpOG
	 RiOnQvVo7Fp4g==
Date: Thu, 2 Jul 2026 10:25:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junjie Cao <junjie.cao@linux.dev>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	caojunjie650@gmail.com
Subject: Re: [PATCH] MAINTAINERS: update my email address for the AW99706
 backlight driver
Message-ID: <20260702-ethereal-granite-pronghorn-839bf5@quoll>
References: <20260701133533.32585-1-junjie.cao@linux.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701133533.32585-1-junjie.cao@linux.dev>

On Wed, Jul 01, 2026 at 09:35:33PM +0800, Junjie Cao wrote:
> Switch my maintainer entry for the Awinic AW99706 WLED backlight
> driver from my personal Gmail address to junjie.cao@linux.dev.
> 
> Update both MAINTAINERS and the device-tree binding maintainers field.
> 
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>
> ---
>  .../devicetree/bindings/leds/backlight/awinic,aw99706.yaml      | 2 +-
>  MAINTAINERS                                                     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

