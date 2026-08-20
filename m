Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A37637C90E;
	Thu, 20 Aug 2026 18:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249808; cv=none; b=qMW48DsPh9gSMxlfnUfMvCs0KiJTpxVFg9H5OAd7Yp/cPlEfDw8Z2e1qak+mwbTT57k9VpQyH2dz3voQ1x/dm1ZdGp02Aj86TmnlFFMmlL7p0B6O3vaR86nSJZ3xmmxYSV53S1oDF86USEH1nmHERhVhwysn9haGbRF6KGNU+5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249808; c=relaxed/simple;
	bh=GDph8o4VJsVzjeS+fQHhLvixFjAGCCc70Y2IOH3Ghhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+3pdFfKG3JULoG5HGxnu7jdzvd0/E6cvAfnYXS87nFFWiLvmjHBfcJiRLYOnNTzSlVAIh/DtNH3G5JfbIDi/U8r7r1Tk4Gu2sPZcvjio8zr3W+sXIV01nqGt5xsEv+C5YBr8rOJAnppHb2vATuQbXHgyaHymsdM/uiWsAWy7bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctgg8Edw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctgg8Edw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09D01F000E9;
	Thu, 20 Aug 2026 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249807;
	bh=GDph8o4VJsVzjeS+fQHhLvixFjAGCCc70Y2IOH3Ghhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ctgg8EdwAgOtSNLiVR02WIq7Y2+WlLj5WEpQigvdrcsFB1bAjhJ3AN3ElmLXP7M1F
	 nnP2GqXEHef/oHj/E3uUOx6FGtf+3B/6dzrgNK793MybmoIfm1aXbhgf8MshvpDHdg
	 sYeEpvAsM8BnwLJc226FXNNlIg5L/EAEnaWUKTpPRqz/AZaR/fMYGfSQupe0cG6ONg
	 FkBQdOSro5RBVV48fVw2KAPPVAfbltMFJ6UAwEiiPqM281zYgiSyW3KcKFqBWIkBB7
	 Hvq8pxZW3H0ReibpW+YYylLJIzktcEbGK/xdIWiMtv4T6rBHm70jvHWHpiY8AETEI5
	 wXhgKh4itFYUA==
Date: Thu, 20 Aug 2026 19:16:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
Message-ID: <20260820-subsoil-likely-9fcfb3b9eb71@spud>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
 <20260820-rk3576-dphy-v1-1-70e25e8d5e78@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zA/ukao4qz3PmLj6"
Content-Disposition: inline
In-Reply-To: <20260820-rk3576-dphy-v1-1-70e25e8d5e78@gmail.com>

--zA/ukao4qz3PmLj6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--zA/ukao4qz3PmLj6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodEigAKCRB4tDGHoIJi
0hPSAQDrdcFSqcxVVQmda4opS9E6UCYTtjVUW6+TGRlOcuuG6wD/YhujDFzzEr+y
o9MCV8VkHtb9nb2JQ+QcoABE6gn4SwE=
=2g6I
-----END PGP SIGNATURE-----

--zA/ukao4qz3PmLj6--
