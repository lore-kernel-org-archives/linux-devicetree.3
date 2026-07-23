Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AF0372B50;
	Thu, 23 Jul 2026 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784780057; cv=none; b=J4F3DCtWWwhppIG1WVUAtl1+Xwn+12qZlYV4zvca1C6Aw3zkVkxwYWSltb6NJoNRo4kgOp9jlPqYhU+A5tLMruko9a0gS6JHP7olnU9WyFLpzRG9GrMHRtCbMFwAAqc8cdu7O+6muWJ/c0u2TvHqOXNSAU0E8cqcyMhcuOLMFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784780057; c=relaxed/simple;
	bh=DqfZ1OMt5WIk2m0zslyH6GNh4HLPMpZGn9ZQlsM7uo8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aojj3XR6BeeMfOEQiXMz35kjvat36hW1jfTcPTY0iVF+F28AUhTSWwE2MyvwKoQ3lSn/Ux/8kzXp/iflsSiAcRtHf0P59uFC2enI4IOjBRke393vH/H58KRmXEsxGnBPS2RNAQM+t/EqgWQibU+ppKLzod/OgQCUTZIPiyogUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Xalw6wZg; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Xalw6wZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784780040;
	bh=4kyZ+8vlhDWQseod3wYamjQd64WvAC5QZs0pWsqKRcc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Xalw6wZgnkGoQBzHgP6CqdIEpb+aiwlBxYf42u9tZI5FG5JAd78Y4AEGIaDNNQf9u
	 bGKHWGrQXyrJXzXedEeKpcXQVGe/cOoHD5ax5tsjgUjQtU8IlIRBxMPwqeFmi7y74g
	 BO7PewybUvcNES/c7ahMAGrF4Fbv7L/GzQNlB57wgHDmCpzUuGeY2mmGCycAlpRVzy
	 D1aZwy62RSdi1YF5jrRGbbRxujpw4+eTmH941bqo3vat2Cl8A/NrWT7dmH6BkgXcxP
	 3qBfvgywzRAuhWp0DI3lXBn1oxw0NFIudB89Q1GWtL36ntf7R6/gECmmZfPhXqru/c
	 To1SuFTJbI47w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 828F966DF3;
	Thu, 23 Jul 2026 12:14:00 +0800 (AWST)
Message-ID: <4622688c45db99274e6862c15fe665268c9efb10.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over
 PCIe
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
	joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corey@minyard.net, devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org,
 	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 13:44:00 +0930
In-Reply-To: <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
	 <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
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
> Created a 5th KCS channel to match against the KCS 4 over PCIe addresses.
>=20
> The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
> interface on channel 4. This is a fully KCS-compatible interface
> that is exposed over PCIe.
>=20
> The 5th channel created is only valid on the AST2600.
> This cannot be used for AST2400 and AST2500 chips, as they don't have LPC
> over PCIE.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
>=20

...

> @@ -373,6 +395,9 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_=
device *kcs_bmc, bool enabl
> =C2=A0	case 4:
> =C2=A0		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable =
* LPC_HICRB_LPC4E);
> =C2=A0		return;
> +	case 5:
> +		regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_LPC4E, enable =
* LPC_HICRB_LPC4E);

This one exceeds 100 chars. checkpatch can help catch these types of
issues.

Otherwise this seems okay.

Andrew
