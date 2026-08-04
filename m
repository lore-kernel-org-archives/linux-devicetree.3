Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571493EEAE9;
	Tue,  4 Aug 2026 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831022; cv=none; b=XIbtBK8O2Qk/SwZtrbDAHpfoivr7FSL5AwBBxfzJL3SIz8VOkDwDlo1DgWhX4DrY77zyCqQZneQxkHzwqBoFXXndcWX6V1Rqv/bMHN5Tdiq0kVZ8g3ACTJUPU8LLh9lWIBVwJU7jrkVnrlna05xqme5L/D6UzpiPJzRQQOvic/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831022; c=relaxed/simple;
	bh=8PITqx3xoX9TFj+9aHOles63Pvf6/qAb3ko95hoT4e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkH++8lxlVOU70yXEr2CflXMkMDf3lX2THqrQil7KZ5RIIaCUAqpxdga+ctN0EY4/uZa7QeM5wPjcsP+EooNIvmxD74K4y6QIng58Xwelu+3ZCbzd7Aq3fdhgHf2L+TKE5qiljQUJ0bWo5AtsD88G2Rl96ml4KWLfLmvgyW1Q3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X76+43/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X76+43/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58F91F000E9;
	Tue,  4 Aug 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785831020;
	bh=HK2mOEFu5c1wB4tY1bP/40iRB3Ii0SZiaq+PZXMRqlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X76+43/PbPHDl32te8uRj5u/CH1ysfJwAAwJRMB8ycZtOwuCqZQJULGxvfXSSSTh8
	 /ketg4WOTnBGaAx5PnJc1LRybShTZrIVfs471/HD+4SmQ/mSyw0KqzF1w7f5A2o6dG
	 sqhg/FdxQr7YhaenUBw32SOFOyftNTuODrwRp/F3cZy4OxOuHWnKilQSntsqHT6qNJ
	 8Ie6EXbA5TTRMFDQvB92RFbaTEFuHuq4HLweWrK/NfdtCvMGdMRMQ8wKDGP25/GSy0
	 fW7vTNB5xOzdqUHs6v1bghN1iDuYEDaFtX3ZeGTGqBcfrAmR8ExB7+MhTC3n1Yk+jl
	 HtYpqeMfDUBRg==
Date: Tue, 4 Aug 2026 10:10:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid =?utf-8?Q?Wr=C3=B3bel?= <me@dawidwrobel.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: novatek,nt36523: add
 the Mi Pad 5 Pro 5G panel
Message-ID: <20260804-dazzling-swallow-of-saturation-696eac@quoll>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
 <20260730-sm8250-xiaomi-enuma-v1-1-ed6d8fb99668@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-1-ed6d8fb99668@dawidwrobel.com>

On Thu, Jul 30, 2026 at 11:52:00PM +0200, Dawid Wr=C3=B3bel wrote:
> The Xiaomi Mi Pad 5 Pro 5G (enuma) ships the same CSOT panel as the Mi
> Pad 5 Pro (elish), so it falls back to the elish compatible. Give it a
> device-specific one in front, so a later difference does not need a
> device tree change.
>=20
> Signed-off-by: Dawid Wr=C3=B3bel <me@dawidwrobel.com>
> ---
>  Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml | 4=
 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

