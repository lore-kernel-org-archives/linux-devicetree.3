Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4B390C84;
	Thu, 20 Aug 2026 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787249922; cv=none; b=BiAdXIZaHPnQin87t/idQAW6tm4HtI8IiXwcoTPWBtAPFWhk3y3EgIpn6IkTmPYKF+jt22ChAE/mgji/Em7OYlFsZ5DEdEw+rk86yDModuqboskEEkNYO1uNE1rT7QUrI/n3jy33gmTMJlqPBgKWSIo0IMSW9pXN4g1u9cYCLtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787249922; c=relaxed/simple;
	bh=93OHTCytmh6FAE/zzMZCdNOuhYQVgYRFmXM3tqinirU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mj1r8X93zH8DDp2gnlEqKZb4+3iuTjRRZSjxW0Is2/3hWmXe9aPKdY/NnE1Zcb8Y5eMSB42g+1W+DvQ8T8o+puoxm7FZ6sQUxUx4rtxrX7PIHSegfIGiIahseyJrhJqDEvLDD9hNUv/mIOCF24bXT9IDzd4Za6OO744QhUgjQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CESHc8s2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CESHc8s2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762DA1F000E9;
	Thu, 20 Aug 2026 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249918;
	bh=93OHTCytmh6FAE/zzMZCdNOuhYQVgYRFmXM3tqinirU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CESHc8s2XeawxyjSJyqDZpIy2FPMkAJjDvpijPrWdl3t23vGkkChaPcKicwEf6vgX
	 qll54izY/9kMyJKK5cSi7Rre7P3ltjztaA7EOP2gxA4wd1Jg5UIjHSsXm8HNB8wM/8
	 Le0o74nflmXasN+KURJIHg1G4QUW0sMMNfI0g5C+qhi0pDUn8DI7KYgzX4suWLj8Rq
	 xSrFEZNgjyDc2+FMJWUr9Yv1exgqJKCwKUK82GH2qJgPau5K2sMXKzyCQXrmeVeCFA
	 geC0ZoI02Ai1m7gq+a2HIRqMweEg4/7/0oDm6EhOyi9KbNs5PlBlZqrAE5iVU7mySH
	 KiMfLMS6njJwA==
Date: Thu, 20 Aug 2026 19:18:34 +0100
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
Subject: Re: [PATCH 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576
 variant
Message-ID: <20260820-legwarmer-thursday-11a8f853830d@spud>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
 <20260820-rk3576-dphy-v1-2-70e25e8d5e78@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JawdN6ClVs51NZeG"
Content-Disposition: inline
In-Reply-To: <20260820-rk3576-dphy-v1-2-70e25e8d5e78@gmail.com>

--JawdN6ClVs51NZeG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

An explicit note about why it cannot use a fallback would be nice, I
thought from the commit message that it'd not have some specific match
data.

--JawdN6ClVs51NZeG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodE+gAKCRB4tDGHoIJi
0uKIAQCDoYEcNXugLdysUBiv8Dfk3mnN2iReD1BUgcrnKJUKrQEAsopJPUUiczBJ
NkXA7cVVjrhwhsl1kTJQMCJFMDPkJQM=
=ZzYw
-----END PGP SIGNATURE-----

--JawdN6ClVs51NZeG--
