Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1110C3FE667
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547816; cv=none; b=d5rxMTKuP/CvMeZC6Kvyes6QRCYUPqeCRujsT2V2AFCbdPoMboLP7TmPlx49sQD8GhT7z9xmps0nQ4JlOAjFFMNoMjWTOaF+zcysKguRdzOmTqUQ9X8oZ+KMypLjEeUonxddaMrk22UaaZUkl3k3JecUeaRUPqBD9xnjJFFRlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547816; c=relaxed/simple;
	bh=/dvCoBVYNVmPRiVfTmwrULhts28zI/9Uhw/p4mn09hw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cEqttqheg/PG9gIyDlhlZn78NsjcivY+llsLWHhi59VkorwrmKBr/DL9+jFreJVF78l4GVZ1ixBtxMqydT6HziBEQCg5ESbF0HQyew1C05Aue6tXs32ibdnp9i6Kz/Iz+3M/LfIacyRHVcnxlXJoIE2+xTBTob4qmdPqJdth4Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIOEbmRJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIOEbmRJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEAB1F00A3A;
	Mon, 20 Jul 2026 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547814;
	bh=dYwbtcQ3pgnVEMKM98ztrlHwiXmlH3kWdacZ0nNN3os=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HIOEbmRJcBjl0aIeqKujpg7irU/YidNNOYpVgQA7nEt4ByDUGc0+PwbckSi08sGVB
	 yicolGEC6QCZ759QTJXApJALCUHbd5HPZDWh9zFm89T6C35LbOt70B7wfQGEEcLGa3
	 8/9IfgNodKnd7FSIXmGQ+9JeXFG/TtSr5TFh5ebY0tyDaMvfYlFrtiR5o0eu1dMDGi
	 WqU1V1ml+5JCdqdK8NY9cBU1w1rkpPC4N9zyCDSc7+KtxDFuQcbrqprBg8NgE2LMGH
	 aQHlCO6BRQ6Ow7xKdJMRB4L7WYpihE5Z7fCH+i2rrdJbIJjRgQ9LsRLPGeshq46p+S
	 FATWp6n0oLKUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v17 1/4] dt-bindings: crypto: Document support for SPAcc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pavitrakumar Managutte" <pavitrakumarm@vayavyalabs.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260720113740.64960-2-pavitrakumarm@vayavyalabs.com>
References: <20260720113740.64960-1-pavitrakumarm@vayavyalabs.com>
 <20260720113740.64960-2-pavitrakumarm@vayavyalabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:43:33 +0000
Message-Id: <20260720114334.5AEAB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `reg` property size in the device tree example is incorrectly s=
pecified as 0x3ffff instead of 0x40000, representing an off-by-one error.
- [Low] The first sentence in the description block is a sentence fragment,=
 and there is a missing space in the title.
--

--- Patch [1]: [PATCH v17 1/4] dt-bindings: crypto: Document support for SP=
Acc ---
commit 7ed8f2fc8bca4b54b48a471d2592cf36275dd72a
Author: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>

dt-bindings: crypto: Document support for SPAcc
   =20
Add DT bindings related to the SPAcc driver for Documentation.
DWC Synopsys Security Protocol Accelerator(SPAcc) Hardware Crypto
Engine is a crypto IP designed by Synopsys.

> diff --git a/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml=
 b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
[ ... ]
> +$id: http://devicetree.org/schemas/crypto/snps,dwc-spacc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare Security Protocol Accelerator(SPAcc) Crypto E=
ngine

[Severity: Low]
This isn't a bug, but is it intentional to omit the space before the=20
parenthesis here?

> +
> +maintainers:
> +  - Ross Bannerman <rbannerm@synopsys.com>
> +
> +description: |
> +  The Synopsys DWC Security Protocol Accelerator (SPAcc), which is a
> +  semiconductor IP designed to accelerate cryptographic operations,
> +  such as encryption, decryption, and hashing.

[Severity: Low]
This isn't a bug, but this first sentence appears to be a fragment since it
uses a relative "which is" clause without a main verb. Could this be
rephrased for better readability?

[ ... ]
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    crypto@40000000 {
> +        compatible =3D "snps,nsimosci-hs-spacc";
> +        reg =3D <0x40000000 0x3ffff>;

[Severity: Low]
Does this reg size represent an off-by-one error?=20

Device tree reg properties take <address length>, rather than=20
<address max_offset>. If a 256 KB memory region is intended, should this si=
ze=20
be 0x40000 instead of 0x3ffff?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720113740.6496=
0-1-pavitrakumarm@vayavyalabs.com?part=3D1
