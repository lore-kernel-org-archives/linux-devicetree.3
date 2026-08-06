Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5A37D133;
	Thu,  6 Aug 2026 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035001; cv=none; b=mbdVYcmMeobe+YrA7eq/mRYDJbVHNxJmiIMasfTg4N1tLrmcjXIY4taASiTPjSg3NWb8rSpdA9aHS9teL2nbMsKHLAkZoU9L5JKfqh0pweP9fY/YZFsrVDxnkSnOJf7YINjEfi8qqD1cnmgCclz+JQIAjA4V+EK5Cn/PffBDktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035001; c=relaxed/simple;
	bh=dK5yUfx3FdMBU8KUaYIFACVYvUrRVBjS6ceDK7TAAtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C24/t5HDi6JEkpi7gQK3kICGfvMkhHOEfStsH8oYWBQnKvva+LdYC/JBRsxcGHoCzdXVEMX38yy8rSOJP551HdKG806aeE3Dupm4ec9GgjbHlYlnvKWtZdRxSc3vrEfD3WceIvFBZB2cw7l23ID3L4L/HARIKHFUrIIVE0ORtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQb3UqCX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQb3UqCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C741F000E9;
	Thu,  6 Aug 2026 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786034991;
	bh=HS0j9CSHJtdR8jylToYQH7EbtA4wpAyzLO3Ch8uZ+II=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nQb3UqCXwIojFYjCbZMD43DQGEPe9EY97jfB6qvZIqkXeK5dl7dHGb7TBnlS2wsii
	 CmrGVXMHyum+wdfRi18sfiHWN8MQNRjrXXU4lKZkXLL3pAdptkZMJnLM+ENyQLsE+D
	 IWQH6KrnBtLdXeL+gK8M/8FnNVUZmIXPRaQ/g0GPQKhd5I+2fpCsoKULKMO98dy0v6
	 Jv+pQiSDw7YNmK9Fn9UIdk+c2dWZzNehlMB5bE1OnoIt4/0XookQbPnJpWlJVQSgld
	 4dfIv9dHFY3vnuMS0NnUC2MwhMLYyQUusUqYGw7o28kJky2DVQ11Z0wn6qHuUt6dOd
	 Y/49AHFzYNUig==
Date: Thu, 6 Aug 2026 17:49:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Yixun Lan <dlan@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Guodong Xu <guodong@riscstar.com>,
	Michal Simek <michal.simek@amd.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>, Icenowy Zheng <uwu@icenowy.me>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260806-staining-delay-2e2de73acf04@spud>
References: <20260806122553.182449-1-changhuang.liang@starfivetech.com>
 <20260806122553.182449-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pGHOTuhWQn7xb29Z"
Content-Disposition: inline
In-Reply-To: <20260806122553.182449-6-changhuang.liang@starfivetech.com>

--pGHOTuhWQn7xb29Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2026 at 05:25:53AM -0700, Changhuang Liang wrote:
> +
> +	clk_uart: clock-uart {
> +		compatible = "fixed-clock"; /* Initial clock handler for UART */
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};

I can pick this series up on a provisional basis for you to work on top
of, but I won't be sending a PR for anything that contains temporary
fixed clocks.

Cheers,
Conor.

--pGHOTuhWQn7xb29Z
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanS7KAAKCRB4tDGHoIJi
0iagAQDltB0ubxtR+ENC3xsC5IF+brT2jfIXMGw9MNI8fr/kdwEAnhEVjBsJUsO6
ShNhkVqdAqs1XpPWOc7XmlLKcWDd/w4=
=SOGA
-----END PGP SIGNATURE-----

--pGHOTuhWQn7xb29Z--
