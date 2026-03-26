Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE23597B;
	Thu, 26 Mar 2026 06:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774506834; cv=none; b=FGXH4TXgtrDr/rtbffM8JkaNX3k0uMW6ZqRS8FAC+RKY8x2RWoJNQwwXsA3L/HZJMCWK4DlYIBK0tWl4vwwSqHGmtmSqdKuGNV3rNNAMgh4qKhE2/ScHrcAFh5lS749QKesT+zaJN1sN97qGiIhk/EmBAKqgX8K+By+Z4VWtVFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774506834; c=relaxed/simple;
	bh=om8C4xRL4G5OJYvxqnzGtRDXoa6aYun3rB72EV+Md+Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dbugTebAjp6NBG8rzwD1iuasSSORo0yBhd7mhXeIVDi5tqRYtmEp4tA8uTkHYn8NPCSCYyCsDHwJJ7q8HC+Tfs4PwZZxNG7gxknsR/y1qB20skK/k+yAJI6n/+u9Er9VzElgM/whgzMA22HiwDLkkyg0f4fhbhED1O5OtiTI5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RVchZcSx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RVchZcSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774506830;
	bh=om8C4xRL4G5OJYvxqnzGtRDXoa6aYun3rB72EV+Md+Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RVchZcSxXPFdsmnvH4AnQkN2+1gupNkeRKHB4UHoEkEzw6Fy9/wccbzesTahCb74v
	 fFVTp01572MGe129MFl9h0qdwaG8L8FM57vgieBVBIQ3OfjyDj1PM0EcXma98VM1Es
	 6sSVHur16IsQVaJahX3t+3cTBeWUleQWGaEZyM7jN/9Q/ubIr+TdApYHdwJKKNEBHp
	 rss334e0TEB5gA+Insa7bE/hIDbhw7M2kqr0cvGCPORbmRBwVa0Erx3+VEkYP0BVrf
	 96Rm1Na7Zy9HCT43XSST04jQzJcJjvr9kU45Z5dLezfk9MgjCVSlALzF/Ln2hInT7w
	 6M0alBAbbVcDQ==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF6326597C;
	Thu, 26 Mar 2026 14:33:49 +0800 (AWST)
Message-ID: <0f98ee4fcc662e80160026208b18e655eeb50ad1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Add eeprom device node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org,
 colin.huang2@amd.com
Date: Thu, 26 Mar 2026 17:03:49 +1030
In-Reply-To: <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
References: <20260302-add-new-eeprom-node-v1-1-2bcf87bc22e4@gmail.com>
	 <fd932aa3f0cae64f40c3b207657032e7bf61066a.camel@codeconstruct.com.au>
	 <CAPBH0A9oatx7U2+3dvGVgonHEm+yq5TFM9mTcdStau2Lk1XytA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-06 at 14:06 +0800, Colin Huang wrote:
> Hi Andrew,
>=20
> Thanks for the feedback.
>=20
> In our case the only functional difference between DCSCM rev=E2=80=AFB/C =
and
> rev=E2=80=AFD is the EEPROM I=C2=B2C address change (0x50 =E2=86=92 0x51)=
.
> Other than this, the hardware is identical and all device-tree
> described components share the same wiring and behaviour.
>=20
> Maintaining two separate devicetrees for a single=E2=80=91byte address sh=
ift
> doesn=E2=80=99t scale well for us.=20

I disagree that there's a problem of scale. The kernel's dts files are
processed with the C pre-processor - you can #include one file from
another. .dtsi files work this way, and as a related example, we
maintain two devicetrees for the AST2600 EVB where -A1 had some minor
differences in the regulator configuration:

 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts?h=3Dv7.0-rc5
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts?h=3Dv7.0-rc5

See also my response to Kevin Tung earlier:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

Andrew
