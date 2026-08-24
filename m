Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3680C4334D8;
	Mon, 24 Aug 2026 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589467; cv=none; b=VEjTlUkl8nb8uLOsXfdhjXUKJ45pDc0q3uDJeTPP25KhCgdYUnaw6zpL123EwiMC+kw+X108GObiAdD3b+eSsluZu8RrrtzIgj2W/gp9dwFPLfthWgYDyrV6tqrWojH7uM7wg79fMRxydBACV6ePfjIg8QrxRGAmNqOGEAKJ8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589467; c=relaxed/simple;
	bh=gJGQtW4sIoKhZrCuxpAlR8Dqhx9vCjMcwk/oMHXIs50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfVKHCjrSOg2+k205wLf9ilT+tfVvsnJcQ9jgKVP42fAaq1Pq1snfHQkuDzI/vB547t/WtKWPgkkXrEx76OK0+k4qlm+hbPaAKEUPT1pMkeS50oMOXhpsf/EVCkc0/h/qmGrcfW5Q45meAZL+iOkesr7P1aqCUp6zrtNJ181SE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2xe4NNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2xe4NNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC6C1F000E9;
	Mon, 24 Aug 2026 16:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787589466;
	bh=gJGQtW4sIoKhZrCuxpAlR8Dqhx9vCjMcwk/oMHXIs50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2xe4NNXWW++OZBhyr2EriuhovyO98378cuTdUvAfUip1QMgt8MdCZL+GqVwYXdeF
	 XuC6nDdg4bwGx6wVetflk5jMab3paG5VTBreAMg+gBOn72Y+/WbNOADBjZY9RAwja6
	 ZH1FzNhLIfoGjuBEzjPEA2ea0HGsNzBxD2diYxcm/8ZlO1ojf94WdT5aTITdyk48uP
	 2j+tNgpzF3DSBzJKQmzqJSSIM9V4i7noUQSQZcyc4zBMN2ArUF4bKdO9iiUD/3vBCr
	 8dunG8lbmz+Td7KfRGyAw9XwtT7PkPhLZcDdOMYuILCx00dOpS7/b6R+TVk0Sb2bxe
	 gxZY7zH9ApB7A==
Date: Mon, 24 Aug 2026 17:37:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Cunhao Lu <1579567540@qq.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add LubanCat 5IO board
Message-ID: <20260824-swipe-retouch-b939b9bbab42@spud>
References: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
 <tencent_E56643A62E2161842C400BD1D30FBB698B05@qq.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AEhvoi9y+ptnrf3l"
Content-Disposition: inline
In-Reply-To: <tencent_E56643A62E2161842C400BD1D30FBB698B05@qq.com>

--AEhvoi9y+ptnrf3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--AEhvoi9y+ptnrf3l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoxzVgAKCRB4tDGHoIJi
0iQ8AQCRl/htJ3119CgeolmVupS9rncS0tYgMZx1DbihaHnS4gEAiMOADZjRFjzJ
kFkCyWLQiw0FaP5uexa4wvM24dt41gA=
=EXCZ
-----END PGP SIGNATURE-----

--AEhvoi9y+ptnrf3l--
