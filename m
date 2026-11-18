Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025223;
	b=dhtDdgsIbkCkr99NiKhhF1Y5iUHG5ZcRBEjSCL4i4XW2YtmlmZ08J+457DNAJE99V9Jw
	 388DCBG9t96RKFsaGMVfu0UqT3FU4TUudcfJ5Aw+K5+Gn5cD2nJYz+ECWdd3Pnz1yWm+Z
	 Fgyvf255OE4WZPdFLLOHQeddsO6x1hjyBi3w2FjdhpcHfUrIXCsahSTDTR0kq9sWcngFn
	 d7cQFOszJODHDn+qBqXGeucfcXq7Z9RvpFR4BSIadJMVBu1rQ/7xeKcMkoh0vlax7dq+1
	 4NXJ3mQkiiBmWfzGGws1FK3denXU0Gokk9Qu32atuzh47ePTmnA9JykjmfzJcCHU7cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025223;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6w82fxlooNXQ3FRv1spxGq7tCSr7KtlspMZHNaHW6JQ=;
	b=0BV1vFo5N9IEJanxyM4UWWrYbv7b0/AaD0XOFqRxyYX3ADm6j9cjuG+iYjgie5LThJxV
	 zz52Yb08bE5oYxcvChNVsxmrNRApAucNkMNKUK7VkoCIX/Lw3ytk2ItBc1M0yUPPNNSCL
	 yAxEIUTM3+O7C/an5aHMKdknLh0f0oYFHvqzZ6DYpwBLPOcA1PNF23qcmR3O09ZnQhtsh
	 QpNhaNxAbxnPu5BwaRkt3ox/3rDmLsjy0jhGqRpIhJ5tsJTXSee2LqvOTAZsRG/xq+w+M
	 ETYuGIDRGtF9OUUx6VMnV636kwYNrfPhEr6k2dJ0N7GkGeQxsIxmywQkqOrIZW0SY0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q70UHiDe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D60606A330;
	Wed, 18 Nov 2026 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q70UHiDe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805401F000C6;
	Wed, 18 Nov 2026 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025222;
	bh=6w82fxlooNXQ3FRv1spxGq7tCSr7KtlspMZHNaHW6JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q70UHiDeMAMQsw0MAvhhZ9W6sOlXnopF0pfq7j96Uxl6US4q702R07x57G5EfSOMH
	 vZKPBs8HFH13kMCUafN5GfPNXJwl6G8fDsBbu3gjz1GY6pNyHt4UI8tUgphaiHKHyW
	 kbig+K0jXYGUyiBFK9VFPvtQq6hlo2D8muaJ+4Ke+KeWWnDQtcZQ7zoemel7RmAWGQ
	 TzBmi5v3dmrMYBPSxF4Wo2Rbx8Km8DNMKlb2HKS5HMa70dwtGswThlrkdc513e5LKu
	 pmYT3RPYYvRS4yXjyqKoWSYZLSWh3P9Hbkz5Pq6rTWZtbA8elfPdejp1oukP5ZKe+V
	 FY8mOHOUoedhg==
Date: Wed, 18 Nov 2026 18:06:57 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: eswin: Add Milk-V Megrez board
Message-ID: <20261118-tiny-divinity-920c0b7f3be1@spud>
References: <20261118-eic7700-megrez-v1-0-af8334b88336@iscas.ac.cn>
 <20261118-eic7700-megrez-v1-2-af8334b88336@iscas.ac.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LIM1ykOGY05fRYAT"
Content-Disposition: inline
In-Reply-To: <20261118-eic7700-megrez-v1-2-af8334b88336@iscas.ac.cn>

--LIM1ykOGY05fRYAT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--LIM1ykOGY05fRYAT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCav3pQQAKCRB4tDGHoIJi
0oRNAQDIIAUh/nrsZKHpfMnlgt+ICbZMj8fQ6CLKTflq8PCuwgEAgwVnOJlhSx6k
29KD+La6RdqEaXC37asFR1QjF/UoPwQ=
=6Wsm
-----END PGP SIGNATURE-----

--LIM1ykOGY05fRYAT--
