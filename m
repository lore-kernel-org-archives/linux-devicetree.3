Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79E11D95A3;
	Tue, 18 Aug 2026 23:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787095778; cv=none; b=T+V5a7qXv6xjayq982Fzzjq4IpcU65O/We6NEYO6l4hexSs0IK0I6Su1x3zjkMsyF/PefLWOcuHvskhUe5RoyKXXGU54r3ZJKFoV8Kj3TxOOf5QiJeO9ZVWX47F3b+T5d9lJM1gc/Ewy/4ktgOE8bdeQn+KhR/jeTPeK59LPHvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787095778; c=relaxed/simple;
	bh=tSyjxCwjvXcQO35IyM5GTOG2zXposdPitjacSrurxaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5xCeWrBMEvw8SfpCxpeY/Rd0oIUp1MXEi4CMt6i+wqkTu289/o4AFy2Sx665oTThlqBTshALrbXoMtB1/XpB8oOwboqUl1CVK5HgdGjtgvwBuDXG2ma1QHUF0tNw2oCnk7OfW9jcm1X9vwmei8I1FHf3e6/nWyZ5W7f91GGUTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flXpyoPG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flXpyoPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407251F000E9;
	Tue, 18 Aug 2026 23:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787095776;
	bh=3L7J+3RvgR+CG6vbfS3foUcxpD/Gh1qUulFzAN9WSJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flXpyoPG008z9PydccA7CvtNasIsJihnz63vvpehdx4ffjAzgxH91F7xeoTvoTVUZ
	 PCO/y8mLDZqCaORgn+UqOHFT8CFSmeY2Zsywdr9lny8axM/fpCOziv8KcJ2xfpc8+Q
	 B0VJaxL0auq108d8KTmo44GJ+sEpNVMRL7zstJmEpA/3JQHaVspzI5M638436jLTic
	 y7SNZi0QMPN96EjZ0Ll+P8myKKy59ISssVeSWL5eX/77INEJzM5fZWm2LqWURH4W34
	 Yww9btz9L2DTmui0cJN0M/+39Oiaiy6N2ZhYlhcOo9Jo2yHzKcon6N6oKF7vLl5LZN
	 RzTA4iwoUtpkA==
Date: Wed, 19 Aug 2026 00:29:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Patil, Shubham Sanjay" <shubpati@amd.com>,
	Shubham Patil <shubhamsanjay.patil@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <20260819-spoken-tiring-445e92a78235@spud>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <20260817-spry-attentive-hamster-ea3c0f@quoll>
 <372395b9-be14-40c5-984d-3d725f20cec9@amd.com>
 <003fbd61-2e3d-4a31-9b92-60dfeb3bee34@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="08fKKcYaq9ThlrUA"
Content-Disposition: inline
In-Reply-To: <003fbd61-2e3d-4a31-9b92-60dfeb3bee34@kernel.org>

--08fKKcYaq9ThlrUA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 08:36:16PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2026 14:02, Patil, Shubham Sanjay wrote:
> > Hi Krzysztof,
> >=20
> > On 8/17/2026 2:20 PM, Krzysztof Kozlowski wrote:
> >> [You don't often get email from krzk@kernel.org. Learn why this is imp=
ortant at https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> Caution: This message originated from an External Source. Use proper c=
aution when opening attachments, clicking links, or responding.
> >>
> >>
> >> On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> >>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI =
I3C
> >>> IP. Describe them with two boolean properties.
> >>>
> >>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> >>> capable design is always IBI capable as well. Both events are reported
> >>> through the controller interrupt, which is therefore required whenever
> >>> the capability is present.
> >>>
> >>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> >>> ---
> >>>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 ++++++++++++++++=
+++
> >>>   1 file changed, 23 insertions(+)
> >>>
> >>
> >> So the same SoC using this core will have different synthesis options?
> >> IOW, why isn't this implied by a specific compatible?
> >=20
> > Yes. This core is not part of the SoC's fixed hardware: it is a design
> > compiled into the FPGA fabric. When the core is added to a design in
> > Vivado, IBI and Hot-Join are options that are turned on or off, so two
> > builds -- or two instances in the same build -- can use the identical IP
> > version and still differ in which features are present.
> >=20
> > The compatible string identifies the IP core and its version. It says=
=20
>=20
> Well, you miss SoC compatibles so you cannot use argument of IP core.
> Although I do accept argument of two instances in a SoC having this
> different.

How are SoC compatibles relevant here? It's an IP for FPGA fabric, so
even if you made some sort of zynq specific compatible (which I am not
advocating for to be clear) the IP configuration options may vary
between synthesis runs, so a SoC-specific compatible doesn't help.

>=20
> > nothing about which options were selected when
> > that instance was built, so it cannot imply the capability.
> >=20
> > Thanks,
> Best regards,
> Krzysztof

--08fKKcYaq9ThlrUA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoTq2AAKCRB4tDGHoIJi
0mRUAQCUVBheGN5Ri7cXbx4L9owWPH5dJRoznAlDgPOp5AXEEAEA97+z2zTdFGpA
Pe3QJaYr2Rjuuktm4K4mhgPPlUZ9+A4=
=afvG
-----END PGP SIGNATURE-----

--08fKKcYaq9ThlrUA--
