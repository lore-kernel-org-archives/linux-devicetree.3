Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794534662;
	b=Y+n6NHq1rQSw3Mbnihxp+tbsJGNMTMRjzYHnCswUSPqoDbPuXKclQRgOWnZf4XIlZy+E
	 TNpIqNe8zUIe/wzhLmY84S6kFrMzIUm45v3vs8bbo9d3PL0u2adMOc4Jn6auX98+ZLwrf
	 XvgKATZvnKLWioHvJ2M3VTPWs1ifHmHmUz+AML+HFrK4pxiEXITzaOEkDAzPf6Q0RaEqm
	 LMg+PImdwvAN7ZPPULYUdaMlqnKdB85Ob0hj6JY55LwJNBi3wyAW24BMBmZxTKk8iKypp
	 aMugIYBJsWiLLwqjOLZ8sEPRiW2eX2l35tta4Lig+rdqkNe8styw5fzoUTMAmxRJZbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534662;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=novKq1OxOw0oIDwG/zfIOYXbREIwByAud43VwuRJoTs=;
	b=vREy4jotdIIKk4nyMpzAxmwlOwJNFyIycVlKsPl35aCo2aqM5WtydkeFoL59l9lktEnM
	 hpE3aLjBT4xGBfUKaZOYH4tadCdaN/5LATeahYhVNEvcvd1LIGos6kQRFdn7+4hhAwE4J
	 V7jvOuuHJp2GuiQABH4aFD90XRueZxQJJyBh6UyvoKo7GXroI3KZbT4Z7Iw0/hyZQdBTE
	 3H9XAYpDW2y74oqr4RFTCU0at//QWqh0jPXy9B/XNNmY8hl1OJ14s/LUZtDV19C7uSKxx
	 O7UBvaXJMqznJ/uuntfwzFLrGAxkLHXm6GtUlpHFuVK/G4JhQUbsosvEhhJlfyFMrIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVLUNBM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BE606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 01:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DbVLUNBM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188C71F000C4;
	Fri, 13 Nov 2026 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794534662;
	bh=novKq1OxOw0oIDwG/zfIOYXbREIwByAud43VwuRJoTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DbVLUNBMA2PqCqL5bplgH+6OJEno2/Aob5Qj4YHnypW+ZV6OJyzG6Vf1xj+vvv3dC
	 JFTVw5UY/U23Yw51VUW2gebtZ4VDvPo8DAPn0VHX8566I4gb4vsRCE/bzmsP5KmfCZ
	 ABjK6xS3LDH+9xQ5Pu9fDDn13/nbnTpdg/YrAI9THeJSk9b2HXpDyGXe2Dmn1F6Wnf
	 d7xtocI6ovIxwBBYV64KWKsi0yKL7VU9MbXS3mho35zttMRj8bHKCKHiqARKsmF6MA
	 ipvuBiHxA+Yg2l5E2X8Y/N7SwzSJMezik78TtiuyO1yQf5nYivnb1S8WIR5V2xMYX+
	 LU9daxAVPPYyQ==
Message-ID: <sashiko-outbox-212075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: sm6350-lena: Enable
 Bluetooth
Reply-To: sashiko-reviews@lists.linux.dev
To: erebion <erebion@erebion.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-pdx213-upstream-3-v4-5-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
 <20261113-pdx213-upstream-3-v4-5-4b01c50a821c@erebion.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:51:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: qcom: Signed-off-by and Author use handle instead
  of real name
--

commit a88dbe84a474608356cf7418da893f73d6055164
Author: erebion <erebion@erebion.eu>

> arm64: dts: qcom: sm6350-lena: Enable Bluetooth
>
> Configure the required regulators for Bluetooth and enable it on the
> Xperia 10 III.
>
> Signed-off-by: erebion <erebion@erebion.eu>

[Severity: High]
Could the Author header and Signed-off-by trailer use a real full name
instead of the handle "erebion"?  Documentation/process/submitting-patches.=
rst
requires a real human name to certify the Developer's Certificate of Origin.

Also, this isn't a bug, but the commit message says it configures the
regulators for Bluetooth, whereas the PM6350 and PM6150L regulators are
already defined in the board DTS and this patch only references their
phandles in the bluetooth node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-pdx213-ups=
tream-3-v4-0-4b01c50a821c@erebion.eu?part=3D5
