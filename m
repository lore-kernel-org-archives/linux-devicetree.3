Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9471639B952;
	Tue,  5 May 2026 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005321; cv=none; b=LcCY95f7okNt78yq9rjm+40T0ALRSEHlsA6ErHcZBFA5dbfUA7hzQJbH3zC8126kFVX/gtXgJmYNya2In67VcYqrLMx6gGFsTTrdjQZtMyCt++CF9SUQGyBlmW3d1GqvpBkkoH6sMqJ09QFb+v/zteDZyXq18Wn4NWjznbXVoR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005321; c=relaxed/simple;
	bh=Dg80QnqwHoeXnUqe9rwn7zMarrUHuZyBbr8ACpCmJaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZzYcJtcpBCxY3A+c/Vkl2v4OYtfzQ5AXkQjmzJJP4sE40tk9P6oxR4MXmSKg12O57R29Z1gXxD2LIg1pDMQh7eJNonI9SfxXEgSG2CUmXOVF9I1/W/RhLPJ2NGzS+LAqFCFX+qRxSc81+ZVt356Csriy53SDB6z5QOM93Xy4jsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=BPhLWpWM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="BPhLWpWM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+NayYgMtDF6eMt5wHcIeABn7hW6nMct4NLsdgagcCG4=; b=BPhLWpWMSlCd4dQZCMXdrt+E7g
	U1rDZPA7oP8C9wFmkslYXlBEXjttrLKH2kfJai9yOkEmtTdYNfYKr1rTnDBjABxU1J/bTgrwlzNcL
	f0ZPFAEU/wVkrAGPAK26DUonBOQ/Z6y5ItfE/LIYl3b3IIVz373YiN8xj8dociyLc7KuxMBKSwAK4
	feBoo+ybUh4W6huGMs3Mc5308LZOwntKCM6g+OLEDsM3PMm06N/D7C9mNYQYv269On8iKsQo+we6i
	AXrTS3V6IrgMfMVb0r00TDx2cD60z5diWQYRPvuxHqnrlJKkQvRT2Rumx/oBDpzOKrR7vygkqeqlH
	qWzHyiLQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Gray Huang <gray.huang@wesion.com>, Jimmy Hon <honyuenkwun@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com
Subject:
 Re: [PATCH v2 5/7] arm64: dts: rockchip: Add HDMI and VOP support for Khadas
 Edge 2L
Date: Tue, 05 May 2026 20:21:52 +0200
Message-ID: <4540610.k3LOHGUjKi@phil>
In-Reply-To:
 <CALWfF7K+g0sYLDQ9ROo1nGR9EADK44kVKQ_x=zonWD9eJLMDng@mail.gmail.com>
References:
 <20260429063712.2150938-1-gray.huang@wesion.com>
 <20260429063712.2150938-6-gray.huang@wesion.com>
 <CALWfF7K+g0sYLDQ9ROo1nGR9EADK44kVKQ_x=zonWD9eJLMDng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 2. Mai 2026, 19:19:58 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Jimmy Hon:
> On Wed, Apr 29, 2026 at 1:38=E2=80=AFAM Gray Huang <gray.huang@wesion.com=
> wrote:
> >
> > Enable the Video Output Processor (VOP) and the HDMI TX controller
> > to support HDMI display output on the Khadas Edge 2L. Also, enable
> > the associated HDMI PHY.
> >
> > Signed-off-by: Gray Huang <gray.huang@wesion.com>
>=20
> < snip >
>=20
> > +
> > +&hdmi_sound {
> > +       status =3D "okay";
> > +};
> To have hdmi sound working, you'll also need to enable sai6. Similar
> to the update for rock-4d
> e6066edc9413191479b05596ba06c40908f44e22

I've already applied the hdmi+vop patch from v1, so if you want to
do this, please do a separate patch.

Thanks
Heiko


