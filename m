Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE353DB303
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093093; cv=none; b=Fy8eG3OUfRJ7N3Q/VpwIWg99GZOz4dOxexOT1Bj4hxpWVkzDQV0oEAkMVeVcGeUgMRuarDtvy4W3qUCWoSRjfxLDM5zU1MXmHj3q1tVDO4Hhwt2/9JBYk2a7MHAgXJnVNbMO2Eb3JyRe4rbONKt8a6AZKuoQQ1/QRurjggyQVGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093093; c=relaxed/simple;
	bh=sb9XA5jIUBxmoa+Co1REyrkLnNvoLNEwcKFBsdJV6xo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=nRRMaaOp3/pZLeUur7RfdvLyZ1kkfLM84ZUsqEhIpnpM60WhIffw2aOMT1xfXC8GzVWkSlAgjkYGTDfMyKEqwduATJq4vibDlC/y0Q2V0O5+MdtnkyEfXibKENWPKwlV/CKubtHO4VyxSUUPriDAuX/0lyCPnNolqn+Ayw0wZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZWEAKJZJ; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZWEAKJZJ"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp04f49c79cd686bca071637304199028e03~UIq410Q4A1516115161epoutp04-
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260911021803epoutp04f49c79cd686bca071637304199028e03~UIq410Q4A1516115161epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=NFtbyzYoNl/zCEgTU0VH6n/v1JONtCfMPfAx62T90jY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ZWEAKJZJVgEC7eZ2jFl1u3xZ2Hhys6o8newPTd3nLC9fZ6xPEaB05tziAoTWtxTjr
	 B4hpZh2sClxvvqyGaHKyBLlKOeTEFD1QXCpBKdO/pa+fsdU4/zxRPhX5y7+skWBvCb
	 YoVT56EZh2H+0zs9SkMUcI3tx4OJ8LfU51XvgkUc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260911021803epcas5p125a2fd347d43b9bfdd2cf660e77fbc2b~UIq4dqRYd1230512305epcas5p1s;
	Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hgyrC15sTz2SSKZ; Fri, 11 Sep
	2026 02:18:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260910155949epcas5p25209000963122d8c73dc18152feeabee~UAPGFN7l72530325303epcas5p2N;
	Thu, 10 Sep 2026 15:59:49 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910155947epsmtip28ec55c8ae2033e856b86e2b9ec9c545e~UAPEp86IB1332813328epsmtip2p;
	Thu, 10 Sep 2026 15:59:47 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-4-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 4/5] arm64: dts: fsd: Re-order nodes to match coding
 style
Date: Thu, 10 Sep 2026 21:29:46 +0530
Message-ID: <2084663827.61789093083145.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngIGdcDsAfk7HAC15QOycA==
Content-Language: en-us
X-CMS-MailID: 20260910155949epcas5p25209000963122d8c73dc18152feeabee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141824epcas5p28e392ad97ca2e5dae47a857272b5ea14
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141824epcas5p28e392ad97ca2e5dae47a857272b5ea14@epcas5p2.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-4-1b755a446b22@oss.qualcomm.com>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Wednesday, September 9, 2026 7:48 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-fsd@tesla.com;
> Krzysztof Kozlowski <krzk@kernel.org>; Peter Griffin
> <peter.griffin@linaro.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 4/5] arm64: dts: fsd: Re-order nodes to match coding styl=
e
>=20
> Re-order several top-level and MMIO nodes to match coding style - orderin=
g
> by name or by unit address, as pointed out by dt-check-style,
> e.g.:
>=20
>   fsd.dtsi:981: [child-address-order] child node @10040000 out of address
> order
>   fsd.dtsi:315: [child-name-order] child node 'arm-pmu' out of name order
>   fsd.dtsi:348: [child-name-order] child node 'clock' out of name order
>=20
> While moving chunks of code, also re-order a few properties (I2S, SPI and
> CAN nodes) to fix:
>=20
>   fsd.dtsi:661: [property-order] property 'clocks' out of canonical order
> (should sort before 'samsung,syscon-phandle')
>   fsd.dtsi:936: [property-order] property 'pinctrl-names' must be placed =
after
> 'pinctrl-0'
>   fsd.dtsi:936: [property-order] property 'pinctrl-names' out of canonica=
l
> order (should sort before 'samsung,spi-src-clk')
>=20
> Moving several nodes already creates unreviewable commit, thus reshufflin=
g
> the properties allows to skip changing the same line twice without loss o=
f
> readability.
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



