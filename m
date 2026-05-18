Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A873F58D0;
	Mon, 18 May 2026 11:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104324; cv=none; b=bjeKVH4hieRqWDvkM6huPNUSs0mQ8CBbQvpUIkvQUHOMLd4RNBG0VnM7ZOX5PLpXc9esYdTl862MryKrcn9nhJ/coNsC4BznodTCmaP2nONS0lQMlsZ8yUUvRvYeUjbNVDU2WdmLMOXdowfNkE02nBsTI9j9PIW7OxKquHTwFFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104324; c=relaxed/simple;
	bh=W6SMd/r6Jn4DX2gZlZ0PLt/2frDcuzAR/SRnm0Q/NPo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CbRdfxfiRWCXufLNR2BJMyTHK70ktUr0s/NE4O8+TfAzQCeyAZSN0xIAbuntyIwf9ztm7U/OI6WT+bPu0bRY2MbDrzoeoIDSG1+oAY8kay9XIZnpto+Lm4yttcoZpS/f65kRcv0rNUEiAzN6KUDuUu+DHqLfpaF5M6V7tGtDUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Z6pBIkpg; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Z6pBIkpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104318;
	bh=nzsDWOOYvpaUy8TXIH2yV7CTdJ93Ilwd3B4S+TiEyrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z6pBIkpgVu7nBeQyqo8FXqPA4g6Igx7OajR/dadXsp6OogcgWVhRx4wZ28No1SQTd
	 lRAHCuby8EYWtCq4wI11yf6rNXUpehbiilnIkoZvZzxJwRVh9ep5FcxMPRNBoPYzhU
	 lGFNBMvANxjU9q+4x7RRYR5IDDStHPDlqYkQ1cuK45Mz4lXVvtLvbVhyTTXAVjlSTS
	 Q/iFw7YKvgq4ZUJSTMMEOSR6sLLDEUiiSwVQUvuaJL5fOxeUGKc1oa5mfcCrSgPt/2
	 Qx2T9cg7QA54QEL3Ot6JZHQJSzWgB7uxD6x8OpWrSLwQdLUVSCuPNRYwCgOOTOVz1H
	 +sCDeIZXrjWBQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5B0D66024D;
	Mon, 18 May 2026 19:38:38 +0800 (AWST)
Message-ID: <26a62f67c2aa5fafb019b59893d374047d2f5e70.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/7] ARM: dts: aspeed: system1: Enable video engine
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, eajames@linux.ibm.com,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>
Date: Mon, 18 May 2026 21:08:38 +0930
In-Reply-To: <20260421224551.1611818-3-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
	 <20260421224551.1611818-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-04-21 at 17:45 -0500, Ninad Palsule wrote:
> From: Manojkiran Eda <manojkiran.eda@gmail.com>
>=20
> This patch enables the aspeed video engine support in ASPEED BMC for
> IBM System1. It is crucial for facilitating the BMC's video capture
> and redirection capabilities, which are integral to remote management
> and KVM (Keyboard-Video-Mouse) over IP functionality.

This is a real nitpick, but: The commit message seems a bit too
grandiose for my tastes. Can you make it more succinct? Writing in
imperative mood to avoid "this patch" is generally recommended too:

https://docs.kernel.org/process/submitting-patches.html#describe-your-chang=
es

Andrew

>=20
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 488d0b3916a1..0ca799893791 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -531,6 +531,10 @@ &lpc_snoop {
> =C2=A0	snoop-ports =3D <0x80>, <0x81>;
> =C2=A0};
> =C2=A0
> +&video {
> +	status =3D "okay";
> +};
> +
> =C2=A0&i2c0 {
> =C2=A0	status =3D "okay";
> =C2=A0
