Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3AD437849;
	Tue,  4 Aug 2026 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785831061; cv=none; b=R/jk3+ExsaYCpnCiAecqMDc12wxq+BTykMYNyUM/amlaKDorBWHwZ3Hh7CCBGDHyM3SnIjUp45/UJbbNYeOhyseX5FRrEcAehRYfhzz0hTcLYMn7Fbj4TgwaFxvaYW2T987NGyUAUy5FCf6jjvf8HgJDRwc0jhoz0Mv1xLIC7gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785831061; c=relaxed/simple;
	bh=pKvJOL55x4lkTYkPFpnF9rcIufP5p9swBtbNcv/KU40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zm3L46XjXFEZUmz6QH7CkfcOyDEfkP9K9hoyTR3VkiV+N6LSTwJ9tgCofT5F4BnM8cpPMI08uXD76GT+xKrJjzbRM5JjEO01wOf7bAcv8ZvfrP6gax4MRB5g1tFZv5tFkw5iMTcq78EWGW3ukJMvqjiHDj5OI2oPDwJi1EmHNhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efHoyFr7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efHoyFr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6461F000E9;
	Tue,  4 Aug 2026 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785831059;
	bh=Vxt3Gsgbxn5cm/fuapSJug3XwT+L+wuPC4HoZnkEuEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=efHoyFr7Jy2Z8OYNZfVZMKIPis4v2qQ/W5hXsO93K6ld4pIpj0+CsZaIs2Sa9dE6t
	 W0aguUimwYqwv8N9Wsoc0+i+9NqAn+RvMMhcuR7xJZL5fuEQom5F7+LIcI3Uxgq3FT
	 42r2LYvr/UcqXNYrwq4b5+gQlYOYFAzdL11p9FdKMYNNfBBjT2S+b67UzRdauq5fHG
	 1JXDmzQHGI3ng+4PQuGWoOMyDi9TTr5vz0Lt4yMibt5OSu4x/8c5jSGHFsk/iV3rqV
	 dQziUwG1T+rMtlvGUsGAi2iAMG+JKDeJlZ2TGDhn4EYPK05/y8THhU2iRpOw4yEEMw
	 8p/UI2FTUiLeg==
Date: Tue, 4 Aug 2026 10:10:55 +0200
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
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8250-xiaomi-elish: label the
 WiFi node
Message-ID: <20260804-glossy-mastodon-from-sirius-db9aac@quoll>
References: <20260730-sm8250-xiaomi-enuma-v1-0-ed6d8fb99668@dawidwrobel.com>
 <20260730-sm8250-xiaomi-enuma-v1-3-ed6d8fb99668@dawidwrobel.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260730-sm8250-xiaomi-enuma-v1-3-ed6d8fb99668@dawidwrobel.com>

On Thu, Jul 30, 2026 at 11:52:02PM +0200, Dawid Wr=C3=B3bel wrote:
> The Mi Pad 5 Pro 5G shares this device tree but needs its own board data
> variant, so give the node a label to allow overriding the property.
>=20
> Signed-off-by: Dawid Wr=C3=B3bel <me@dawidwrobel.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/a=
rch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index 19aff83ecf7b..12a2ba48340f 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -817,7 +817,7 @@ &pcie0_phy {
>  };
> =20
>  &pcieport0 {
> -	wifi@0 {
> +	wifi_0: wifi@0 {

This is pointless on its own. Label does not end up in DTB, so your
patch has zero effect.

You miss the user of the label here.

Best regards,
Krzysztof

