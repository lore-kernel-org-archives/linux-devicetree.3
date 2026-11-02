Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623810;
	b=Zk+WjALAfvo7nrLCGTnuCj0bEiufm9mcSwLdwwRVFa0Uw4f87mwgglkkXg6uIT/6kHdS
	 1M7gh2Rdf88RSSZcMZg52l3ZntfoYnDQ+bklPP1mrPvWWiJ/uZKIHb6nEYnE2ctdMPhht
	 qpY95Qn/KuTRpCaNjeQesV+VwJIDgOG+cGla0t4oOAEPg9WAyKqVhpe7LV/5jz+A63t0y
	 VUHXKii4oRVWu8JFgYsNpmON2f26eYjx+h45FFccAW/GCMtkhE+bOuAX3ya5JEzukT5ph
	 zQPh5DIVpeRZ8DrCHlEfEu4VUivmURsrZ5MDO96CA228hMy0pcOQMrIQNdBiMAR7lTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623810;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=hm27p5Bag5WeuOJdRWSnyY5jLMTOFJna4FtDB76YqPU=;
	b=QSae4LFSdSzj2QbunQzIPKadlO+0VJ7NyEKjbevyFEuX/ht3OyVEkKQDv9MfdtMHDqdq
	 4R5oIe0GLeOWHyQ0CELtReOB184tm8aHBh0o/BDFy6P7ZOYs8hXjBXZLHgcqfNcgZTNjv
	 Q5lZqzfD1nxPZ/giENpdaAiY2E3XD3vocPQDcNzpw2r0qVazErD3+/tYcgdfK6egHu/3E
	 amOs/N8x6zLtxFjzaMam7IUbJxGciic1KmlPdQQovzh/m+iWxzpfcOg0lpcDdU1Ck+FNV
	 HHabkg6HiPEW0cT2R5/dxP4Bb6XpqcpvhXB4lQpAOegZT30TB0eqIn2M6MQpuEirq5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqbMKpvJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B42606A327;
	Mon,  2 Nov 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aqbMKpvJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E4A1F00A16;
	Mon,  2 Nov 2026 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793623809;
	bh=hm27p5Bag5WeuOJdRWSnyY5jLMTOFJna4FtDB76YqPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aqbMKpvJN6Emx+sfYDpw9KQi56GUOSmVooBmT4N+GK9tJGeq+pJkjSp0VgCxKytEa
	 HmNV5qYFvtn8zOPYAcF4d/grrpUUHBGjEIO6P/37armi1TQSxlx3yRmsVdb5+d5AVn
	 7EGga+rZ8EcP8sgreMDqoeDL0qVtLK8z7I9+IfPIyEqLhgmMYosYdnfoRL82bAtaQe
	 t9xyUcno+7YD2raSpD6pNSzRQ7cAPpzAbv183I+IpU3jYmf/Ry/xmpymES4rkHBbys
	 UBFv6Vwglpgmq8/LIGeQwCxIHDP4+JW+4knF+6Bwz/GQc+mA0VqiTBZcIHuGFSQ9pq
	 fdNZMnJRZ5ytA==
Date: Mon, 2 Nov 2026 12:50:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, linux-regulator@vger.kernel.org,
	devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 0/4] regulator: add the Will Semiconductor WL2868C
 camera PMIC
Message-ID: <0b7aa07e-7771-4ae1-ab0b-0d6e692706d6@sirena.org.uk>
References: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
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
	protocol="application/pgp-signature"; boundary="WSI/xIQFV9D5+mDy"
Content-Disposition: inline
In-Reply-To: <20261102060458.461372-1-xiaqinghuan@mail.ustc.edu.cn>
X-Cookie: Used with permission.


--WSI/xIQFV9D5+mDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 02:04:54PM +0800, Qianhui Xu wrote:
> This series was drafted with AI assistance; I reviewed and edited every
> line myself, and I am responsible for its content, measurements and
> decisions.  Evidence for the review-driven changes below is listed in
> the text.

This doesn't apply against current code, please check and resend.

--WSI/xIQFV9D5+mDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrohvwACgkQJNaLcl1U
h9Btmgf+ILsYgGcLQ4DxtiSgcOd3pUrxO5f1vd/qyo2fWUvB5oK5x6+Z7/J1ZCzb
rnkw3GPOlRwA83qFDT03/1VLOSIqaWQQ2ziYcCfz3XXDm7bynOV7TPRs4NS+c85R
i9zS6JowtW5jU/HMpuSbkzJjV/YhXQgxN5eCeIfq7dds3WgU67Pab145TLMLphow
uya6DK4W/wvhN5QCCFZ4ZHLaR/h7/8nbG5rxV4Oy+GHVzlrjnufxezpsD24DyA2f
lJeHBDT6ZtYRQNWsLVCtBjkQefWEPwGyHnhss7GP1f7Pq3ugmPVOX4RHfdO7Xfmy
w600r/afcURf5W/n5wtHkv/SFaMCCA==
=57UF
-----END PGP SIGNATURE-----

--WSI/xIQFV9D5+mDy--
