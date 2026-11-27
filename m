Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803516;
	b=GcyKfNcAfwWyGCMQbLAJOqx4uklHEYbX9PSK30P6l9ro37k8eQ4qDHlQEuUnPjJcbK7a
	 hcf3djMQTAx6YEUEnBQxgS4sCAeEOPpgO6XllO8K24st8feWjz3m0uT5NHspJngmFmokp
	 c95Btp3iuLxJcs4Hjuh5VaeTc3HJHePpJxYhJGHq3/X/C4e3B+Z9N4/Gv9uFEWEHM4hUt
	 vZxuN+Wsapa+agh4ZAlzaBAIwyOBRVxL7MhMyh7B+XBc/baPsQ0oES2rTOKdjgEwwakoI
	 lruJMvwo65qqQNMD/j3GL30iyG7HHSH5h+XYwU6rDNNl/MlR3Fowy1ICuhQbyC9iUoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803516;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BCJg5KdEXOKerir7HvXSyinpM8/rio61Rq/LE65yPLM=;
	b=YdwhZGf7Xi72EpTDwLS3BxSrYPZ42KXy3mdXBJ0gEcUtgSH3MJNp8pIPCi0oa3dBT0WG
	 CHwAjlosnFfEvEB82Ww2W89fxd+2ze33nm8ByYS7FS62+acJRMJVXJVXOXuJS9FOOgaKz
	 dsa0mfDNgFUQo/vvDaHiZ9c/bPcuYt3Rq1Sb2EoSjGBgjDogsWpGAma3zs+4zRD087aVm
	 rhyb/sy/pZnTbI/4j/KZThWFunjOI1REYsIfGUnzOqzaeQVeIZGbpx/54uOMM3BCECozG
	 pgCx0Qs0fiLfutGuOU4aPPLHOk3XIIaT27AcFWxeXivlNElFbo6c456s9jafOoOTyag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EytNRt3G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15D606A31C;
	Fri, 27 Nov 2026 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EytNRt3G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246CB1F000C1;
	Fri, 27 Nov 2026 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803516;
	bh=BCJg5KdEXOKerir7HvXSyinpM8/rio61Rq/LE65yPLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EytNRt3GLG1J4r9JmqWz3/UC047RRfvPn8JBxshF6cPJyM6l1xlItsB7ZaQonsPra
	 ZQxqYnqPKFTVeUH8m7UPYWiNilvJJVX8JtWkG+EQoCPNKFWTc6l5C6ITsmxEXLlD1C
	 /RkDfJWqScN01jgK292syU+NVOeAVmXMhFSO9YuddVzCZ5662N0QLZhbswNiZqZttT
	 rM8OJ2IBN+IH8p2LV1Rt8Ew48cT6YASosd0+heGbyh8PSMFIJGznr+nsqV0SlEtFIF
	 n/pEDUyT/zjNyBOsORemwXoE6rGV4wcPu1x8iyu+yiiKVw+UFW6CMbfe+J+VbDgzE/
	 UI/dbv2wkwktg==
Date: Fri, 27 Nov 2026 18:18:31 +0000
From: Conor Dooley <conor@kernel.org>
To: marouene.boubakri@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] dt-bindings: riscv: add OpenHW Group CVA6 APU
 boards
Message-ID: <20261127-matriarch-phonics-1e87aaec99e4@spud>
References: <20261126164632.978624-1-marouene.boubakri@oss.nxp.com>
 <20261126164632.978624-6-marouene.boubakri@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="udVk4Ha3Io07rmnV"
Content-Disposition: inline
In-Reply-To: <20261126164632.978624-6-marouene.boubakri@oss.nxp.com>

--udVk4Ha3Io07rmnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--udVk4Ha3Io07rmnV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawnJdwAKCRB4tDGHoIJi
0k1oAP9/1/ilB4QcXZSXlaI5y8jSA/cUMi1Sc4LNhWV6uVzcegD/YMas2mYSVM2y
FXkenTlmKxUNzYatb53FiJer/ZIePAw=
=chay
-----END PGP SIGNATURE-----

--udVk4Ha3Io07rmnV--
