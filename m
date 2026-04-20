Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C934402B
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701594; cv=none; b=Qpil2q9RT81Mt492rK1UNb1fhLdjhjbT/KIdZjwj43IiEKtMrcz0jXPH1vxa8aGX3Z6MljKC6T35xK1eOQDV9w7U/Ezkd+7GmfKeS6k0JxDfCxgF6ILRxPOa5F3qVhtZZ5ZFc+6Hgou+YVVtTwAWata26dtQdH9GFbHC6jBaW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701594; c=relaxed/simple;
	bh=L9AM2bQQF0XfWMH9A8Edh/2OqoKJGvzkeDd8yMbw8TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ck/WR8qkWOLoZlp8VReGUVGyfhDslliUIizANB1Wt3oEk9HVXxZeN1moEo3EEZndtR3qu/5ukDVY+Rec+Iae2bVBlHUcp7iWv1IV9RJwBOOAx4+3TxiSlwlJpZ5Rc5V+PwdSyhNvOLThMvfjOEngbsNaUthfke3zaQDPURPbFF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4WfUiOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4WfUiOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54200C19425;
	Mon, 20 Apr 2026 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701594;
	bh=L9AM2bQQF0XfWMH9A8Edh/2OqoKJGvzkeDd8yMbw8TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4WfUiOzgJMwerbWOdXSERQ2UsBuC1s6+gIcSsMOLWrg3pgVbuQyRtOyVEWxmOz+b
	 m8pfbCDdLkcZDbp3IQsXUKegPwFjZqcvv2V39YBODQddBVtCdYHMSoHV3wqm7oP/rt
	 ia8TaPrEqt8WwTtrXrPtGKXkJ5nxikdue57wmGfY1JiIRVo+ZadCB4aee+wcXG/R5Z
	 MWsTf+wcX3lkaVj7XqB+A6MfZ38XLr4QiC52TMiMLUrPLOkFNKRhXJkuPwrc2RT8tp
	 VUT3w2X7kWjI2oXf3K27EXFyNugIFniKtI6j6eyKBNDWSYK5WwMCZA3lgLkznT7gwr
	 +i/AsTTrk5okQ==
Date: Mon, 20 Apr 2026 17:13:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCHv2 1/2] dt-bindings: arm: altera: document the Agilex7-M
 devkit
Message-ID: <20260420-city-freeload-46c1fe67ee8a@spud>
References: <20260419232416.68331-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dISHVY2JqMCrDD3T"
Content-Disposition: inline
In-Reply-To: <20260419232416.68331-1-dinguyen@kernel.org>


--dISHVY2JqMCrDD3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 06:24:15PM -0500, Dinh Nguyen wrote:
> The Agilex7-M is a rebranded version of the original Agilex SoC. The
> Agilex7-M SoC has the same core peripherals as the Agilex device.
>=20
> This change is to document the Agilex7m devkit which has the Agilex7-M
> device. The Agilex7-M SoC supports DDR4, DDR5, LPDDR5, PCIE 5.0(x16), but
> not QSPI.
>=20
> Also, now that Altera has separated from Intel, use the "altr" company
> prefix.
>=20
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--dISHVY2JqMCrDD3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZQlwAKCRB4tDGHoIJi
0rwtAP4l/+sIWPq3P6ddYcVaMEpGQwp9/mIsXCC51MqDbPztAwD/VDiQ4p91tqcj
Qi/IUTKwiSLBq+s6JnnNpv3XHpA2fgY=
=Fm9i
-----END PGP SIGNATURE-----

--dISHVY2JqMCrDD3T--
