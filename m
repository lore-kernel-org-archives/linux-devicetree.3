Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE45D43E08D
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066043; cv=none; b=gjssrOknpn3y+0m7FJLxj1KNV/3JvmP6HbSwmGP/vXeR3D6jyHTflE7YDYk3lINxayBhu7vwdZRzHJ8aaUaHHSUNYpZBK2/W39apAjvdsL2XdEp1jwEfRptq6QrtGWM+dbY5NfVUFZ4lwLkobuXj3jTLurSEtmQNPkNVa3WYjg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066043; c=relaxed/simple;
	bh=Kxrml2VY72/8kAfNTX33X7/yDZ2SKNKjCqydzkwOnFU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d0xZexYCKNusEi8ecOrAeISAVPM9bdFkAg/34EL015MyCQWIPrB7HBBhzVYld/AWh+E0CrYX/R7mzQ6GEC5Sf90g0upG3auq2td4m29PdXKK9SJ3ObuYdNoYweL0LfjUdGDTGHBEp2Yo6db2yXK0QlFR9OcS18zDGHUE2Csm1ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqIVL3Ls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqIVL3Ls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BAF1F0089A;
	Tue, 22 Sep 2026 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790066036;
	bh=/SDi0OD4yb4vGZpL4OHYz/8iEm9ZF7wRoArpDPnmxFo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CqIVL3Ls9sUvGNpa78dpuymV3q15NdrVtAQPYpakT5wreDnq0GVv0RNB/o3eV0ngy
	 ECLIrBzYPCNHUicyGOAcGv/0FNvGUUFMnRfNL4E4hMzeXRi7QH410tmFEcnzrrcDef
	 VaLENBThripY/TeOOs2xu4YbcwH+TxJAMo5UN5jkjfxk66eYtV9Z/1xYRIh8KzwyDE
	 TTX7sqMOzs38mUOGdNrVysfCMAw6IC5/mltTGiJOZ/OQKk63jig88ux3NG8nYLIq97
	 nllQQaDzPh9t/ZrGHe3eXpvtktt4ikYJY85Sm8XNYb6XvySI2pf0MG8uufzzeaq0G0
	 xtsh0BLccu7mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: spi: renesas,sh-msiof: Add support for
 R-Car X5H
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <b8f4648eb1151b75d41e561c6b2adbd9bc4c0782.1790065451.git.geert+renesas@glider.be>
References: <cover.1790065451.git.geert+renesas@glider.be>
 <b8f4648eb1151b75d41e561c6b2adbd9bc4c0782.1790065451.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 08:33:55 +0000
Message-Id: <20260922083355.B7BAF1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: weakened schema validation for older generations' d=
ma counts
--

commit 339efeecd4721be8f1b5b945500191b6aa6436e7
Author: Thanh Quan <thanh.quan.xn@renesas.com>

dt-bindings: spi: renesas,sh-msiof: Add support for R-Car X5H

Document support for Clock-Synchronized Serial Interfaces with FIFO
(MSIOF) in the Renesas R-Car X5H (R8A78000) SoC, which is the first
member of the R-Car Gen5 family.

> diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml =
b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> index e0c7047ae8adb..41e423a42654d 100644
> --- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml

[ ... ]

> @@ -100,11 +105,11 @@ properties:
> =20
>    dmas:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6

[Severity: Medium]
Does this unintentionally weaken schema validation for older generations?

By relaxing the global maximum to 6, a device tree for older hardware (which
only supports up to 4 DMAs) could now silently pass validation with an inva=
lid
number of DMA channels.

Should this preserve maxItems: 4 globally and only override it to 6 inside =
an
allOf: if-then conditional block for the new Gen5 compatible?

> =20
>    dma-names:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6

[Severity: Medium]
Similarly, does relaxing this limit globally allow older generations to def=
ine
more dma-names than supported without generating a validation warning?

>      items:
>        enum: [ tx, rx ]
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790065451.gi=
t.geert+renesas@glider.be?part=3D1
