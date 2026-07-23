Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEEA37C925;
	Thu, 23 Jul 2026 04:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784780032; cv=none; b=htFQu1odLz/ifVcKNDC4AxJNDpMHGcj5TTelenuihkbNYbODTl5UlDxi7G63puL2TT3dfZk0WloO+gnM4SxYjEiBxkh4brc6tEaaiN36yPdHJtjc5rDKUN/NBwqftKDv3JsvL+RDXSoIxcHzipmklnJSTOBiqhs2PFNQ7+N2VqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784780032; c=relaxed/simple;
	bh=k8LYK5qC+M9hHvqgGKXh0i8U4oTUfM/KiQ1deSQTUBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=at2T6smgzinIXoBtUuKq6M09IzVKTR2FJowPBvKXfPgc61S48XWBfDBiieimozuRh8Xe/bntFBHKRd5m7Iu7E7OC3Sn5odJ0mfZX0u6npkkw1HOwdAzdEifL755ex6lCNaQXq/l7biWWchJ4zuPXoWfFsT+CpsI564biedxd/AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=E+XH9OXP; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="E+XH9OXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784780003;
	bh=1CNvGj7dz891iLVwt7dBaj1OEv/TlmZnFAcX0NW2E2s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E+XH9OXP/w2dxS8B/KIVBxE36CT1gB6cvXTlb9xoXFDorIlXxfB5A9CiOg2E8TY2/
	 0vJaoMwSwVefDlf2t/b23LkdA5420QSR8v3AnhdxI/6djGdOaySel88Z3w/9cTPwce
	 WN3GciiG88uDC0NM9fHdFdnh89x+UVxuYeCiJq2qOFLtpvJ8+NnCoaMFYveReLOvdd
	 loe383NY4q+pIHEDmqpAKq03RrP+AaBatzLpFV8b8lzcb59Ph4bcdkxSmWh3PrYAx+
	 Viq8vzMA/lANaFmLa03sjl7hqCBNZN7YgoG2jUQRuXsgEoziPdZgSGJiXC3hEIbTKr
	 AKErYsmUxS/HQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 47054662E1;
	Thu, 23 Jul 2026 12:13:22 +0800 (AWST)
Message-ID: <afa321db51d5e6cc8e0c15badc7204faa0925251.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed-g6: add pcie-kcs4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
	joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corey@minyard.net, devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org,
 	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 13:43:21 +0930
In-Reply-To: <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
	 <0b97a66762efc05c9073c14112cc489624871947.1784732161.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-22 at 15:11 +0000, Gr=C3=A9goire Layet wrote:
> Add pcie_kcs4 node to the LPC bus in the ast2600 g6 common dtsi.
>=20
> The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
> interface on channel 4. This is a fully KCS-compatible interface
> that is exposed over PCIe.
>=20
> This can be used by the host for IPMI when the PCIe BMC Device is
> activated.
>=20
> While the datasheet provides interrupt numbers for KCS channels 1, 2,
> 3 and 4 over PCI, not all 4 are described in the "PCIe to LPC Controller"
> section. Since only the KCS channel 4 is described, only this channel is
> added.
>=20
> The pcie_kcs4 uses existing "aspeed,ast2600-kcs-bmc" compatible as it's a
> standard KCS interface.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 56bb3b0444f7..a93fa4cf5d8f 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -617,6 +617,13 @@ kcs4: kcs@114 {
> =C2=A0					status =3D "disabled";
> =C2=A0				};
> =C2=A0
> +				pcie_kcs4: kcs@914 {

Nodes need to be ordered by ascending address:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html#order-of-=
nodes

Note that we now have scripts/dtc/dt-check-style which can help catch
such issues.

Andrew
