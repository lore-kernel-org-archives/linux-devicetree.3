Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F03D0926;
	Mon, 18 May 2026 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093101; cv=none; b=PfmcePtQyxKCX2az1OCmCio2JCZcTlViHQ294mtzwcQVSzpz4t2R+pkndloOlIGo11uMXt9OQ2uwUfH8F1N2JqcUDyHL8Vu0hBBA57Np1vX0nd9Ah3AEehiT3hRw4KuvKNZyIV8hqZoKl0DsuMJGliOtnstPq4Jbqe5K52Rj8Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093101; c=relaxed/simple;
	bh=a1bPvnSui04etbPsupENCKmqCkD63kCvB6XyQYW7YJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QeVmwhq/EGJlUK9PGXPgnPoN0SLTLjBlck4bQBDf4wZQSnrg/q2Dd9RAMr+R03XHmg93IHKX77svDBu79kpoqIthNT0lvaPzbeBZfIKdskFfYi06E0OBYCLYT+rlxXejfSpDmB9Dh6j1IZnv8GJUMgwhg9OsqE5O1UT1C19pGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtzVkvkM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtzVkvkM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52993C2BCB7;
	Mon, 18 May 2026 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779093100;
	bh=a1bPvnSui04etbPsupENCKmqCkD63kCvB6XyQYW7YJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtzVkvkMxf1G63FkvOpOHF8lp93COjWRb6VxZWsbIaLzyw/e0c6WqOufw5KkNvDxW
	 RVuohaROLrMpk4Kdrmy7Y3DRNvBGxMKkEqLuG/Dqzk3wxexjBKlUskMLBsPxVxZj83
	 o5020xzeY/x7jkHNRw56sA/GdnUkdKy3D/OFjIoQ/dWu2WKhJGN9X2LCoUsljw9C5s
	 RgEkiIA8pMf4HCNVe4QeE1j2KQbYQH4rCAhffY4qa3Bkb9ctxe+waz54jTjYv2Lq7Z
	 5zn9A29o+hrBrhq3OXxpyaErpoYP9pGV9R5RtFbuIhQ9WROuMJFFUXFSV274YvI9Tq
	 Ftd2tE3pXslLQ==
Date: Mon, 18 May 2026 10:31:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Chipone ICNA3512
 OLED driver bindings
Message-ID: <20260518-vehement-koala-of-passion-7b2a51@quoll>
References: <20260514-icna35xx-v3-0-c304f04c32c4@gmail.com>
 <20260514-icna35xx-v3-1-c304f04c32c4@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-icna35xx-v3-1-c304f04c32c4@gmail.com>

On Thu, May 14, 2026 at 04:29:16PM -0500, Aaron Kling wrote:
> The Chipone ICNA3512 and ICNA3520 DDICs are high refresh, low power
> MIPI-DSI drivers for OLED panels. The icna3512 is used by the Ayn Odin 2
> Portal and the Ayaneo Pocket DS top panel while the icna3520 is used by
> the Ayn Thor top panel and the Ayn Odin 3.
> 
> These ddic's are generally compatible, but some MIPI vendor commands
> differ between them, so they are not fully fallback compatible.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  .../bindings/display/panel/chipone,icna3512.yaml   | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

