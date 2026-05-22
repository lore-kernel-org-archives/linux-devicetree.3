Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69093382F28;
	Fri, 22 May 2026 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779430449; cv=none; b=Li+p6UIQBDCBNpPnVgK0WSZG0dECXg6QrMLMLaNJcRAHhQ6+cWc5ngGJKkStUKtcuZ1YLcxx8wagMcwCFI9YRgtulCIKVEsXdI9C72WJqXHp3bUhnueZHVrUvsuwAS3tXLNk0BKpjHp6veEhxa9iq/RkcnDeCvTvQGVB5eznkms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779430449; c=relaxed/simple;
	bh=89kkmmAtW9rBYdm6TOPA0psKVbhGrjCAjS80BcEewi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uXjdsrrTWhVp/ssOr8JO6Cu1eoutVWRLq3PanzjprEep1Ayv88v90XaIQ7I4IjyBrxxjSMyx+zJ5ghc/spcu/c9wGY1z2rIa/ePfufq6SIEyoULbg2wqEMX2pn9biNCSyDAThH9kNcop7joqJMozP80mhro93QOyPJdZt6USYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R97pSxEW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R97pSxEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BB71F000E9;
	Fri, 22 May 2026 06:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779430448;
	bh=7UfpmX7/MODtn1SokXdvqTVXcWilzHPpoH27tIBKuwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R97pSxEWgI6ARSKlUGcZvmIU13SKDvFvD2Uy95T2naeyEmLwp/ibQLi7ny1G0ZDVl
	 7APqujJL+7ZJuBdIv+iC1y5HMMlzzrzw0WY+GGZCkRWNqrAqMV4tdrvSdzO3k4d6qq
	 XEStk4AikRgFOyjze3ekVVQWU2hwUy7f3yE/MZV/BFBf4ssjh18IsZj1rpt4MqwYwb
	 MGEAE3yXRpQuWFH5rZuG1U97nNsxB3ApQaCYbF/kLkyaPG2CC7uQH5hpn0uXb+IMEJ
	 WmoovqXOibEyYciMFQfoCufYt/sIpKID1efWfi7PgLO6w+xkuLa3/B/3Z+kuF+B5pN
	 gGuo4D8IOadlQ==
Date: Fri, 22 May 2026 08:14:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] regulator: dt-bindings: Add Unisoc SC2730 PMIC
Message-ID: <20260522-undetectable-thoughtful-bulldog-0c5d2c@quoll>
References: <20260521-sc2730-regulators-v4-0-1ac8a3b5ed82@abscue.de>
 <20260521-sc2730-regulators-v4-1-1ac8a3b5ed82@abscue.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260521-sc2730-regulators-v4-1-1ac8a3b5ed82@abscue.de>

On Thu, May 21, 2026 at 06:17:06PM +0200, Otto Pfl=C3=BCger wrote:
> Add bindings for the regulators found in the Spreadtrum/Unisoc SC2730
> PMIC, used e.g. with the UMS512 and UMS9230 SoCs.
>=20
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> ---
>  .../bindings/regulator/sprd,sc2730-regulator.yaml  | 44 ++++++++++++++++=
++++++
>  1 file changed, 44 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

