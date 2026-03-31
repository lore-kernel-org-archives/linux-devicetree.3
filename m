Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0A391E41;
	Tue, 31 Mar 2026 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941384; cv=none; b=mQiuHPXilUCkLNBu0JbwjVmr+ovx61eom5mowwPVRMK84PBzmpBFcGW2XSAskLiGRiou/co5QlftRWVrpx8YyYmt0fNqb9snHWZ9moKCzuNmwt7jmsSEpxOQ0VJJYx6rql71n2Kdv+DZ6NLqMXxnipdX88WsGilpfYVKr/s9NPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941384; c=relaxed/simple;
	bh=Q+Sh5dKsSASh5LsFmljR8zZTQU8zGlCs0Fs1daWA7vA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aOy+Nd7BuwGLnD3s/H0D3FpDDefmT+QywbZs3iJ2tUQwCfOsL0vDRaoT8mc9TiRf4N5Cs4VC7rlNpDCyqqZqyjYlkBj3hsLZd0I+Dnv7IHlNQl1BOZqGJ7VIqeMaU0HvPe2lWuEpd6tMcTtBrdbMaoZ4d3bpaXirUZrRC08TSLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kkbKps3Q; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kkbKps3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774941328;
	bh=FMUkMUxgtezj8otmGMF92Nid+Gsbj62Jf5IU2WL2R/w=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=kkbKps3Qoh3s1fR4xyEgZwnUnTGH7mXhT59kPp7JVxRzHMTXfceDidZ4huJI3zE7A
	 iWRu5PRFerGdngsw72YJ5x408nYZSICeNm2Vk1EWbGw6yjSOOpaCgHz6rei6XcEVbP
	 u7+WaYLaGCyTjSl1vsf55HygvBxEWpZr9DUds/Bw=
X-QQ-mid: esmtpsz16t1774941326tf5a2ee7d
X-QQ-Originating-IP: Cm+r6MKhV4qTjGje/QFxDUQM2Xm3nEaCpKy58BmZF+c=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 15:15:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16497226984384082408
EX-QQ-RecipientCnt: 19
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 15:15:23 +0800
Message-Id: <DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OAOHw7tUGLQOt5OdeXFS36/JWlPRfV0AsJveg/cdPrg5TFXt31c0pDJU
	ht0Ryk1UI8/EQV4WBVVkQVxzfRJC8vFM2GVzn89SkVIruTRdmfHleA7pX9omBU/8uSVJHM2
	MHuxzKV3snPEb9RUrKptqmLjeYtcHeJvTnOqHjyvz+/rOK7R/joqWChsoc1at/5STsWnMss
	BuxF3u8eGPsSvznA5eoyIqOnK+ldnBk1E0clihK7MLToRZJqslfr5uBWchE5xKjl+EIvrFt
	uq99M6mzsH9hC1iv2csl4VDEd4Of4PViluyVZmKJPxtmMmP/6GiK+T8D6nlQh5lWkCroWY4
	QcFHxbWVRcozAvXgO9M7265WA7VklyLoKKAonGCsbuXDtWnciNCeSihfxGb6SRRZqUsF/nS
	WcNUjtWhNQZzg7bToqSnpqnkbCt35PxbbUHK9wcv/HAFC3boIhzhAs8p4QgCgn7qWSyfqQF
	XQ+LDPwNuojk38IyYLtAnuglihmDQYeYT00b/m7Wagze2pHtYQVFVUxTf4E0HiPf+ZOcfMB
	1/DDz5u/QCGWis+3/rY3KFGxpe70+sIqV1PBBvxEcXRaYbBaE0/roYiplzBYUm3q8JJHsfY
	g86HomeynstL2NhwHTWAmunpWj343m6rXtE/EdxlP07v0qfNC9Qq0kyyhYi4pdoPPEUc9cX
	xiSJaqjfuwg4t+ivU/IxFOdjZW6sl4k9Y9VE7ThjuWY/XrYoeT7wJo85OEMjiGGaBJhVULd
	FsRYwsm42FHCXiDU8cfI/YZ8UjH0j29+r3pDqpCMy7bG5jHlpoqJZM4GxV1TwAntCpA1L7K
	bwfG6YHLpRKTAPOvbqZp4WFeun+V6GSdMWR4tDe7HERTvx7U7nymN1prvMZlllb++b28Oxz
	5Y+XVdreat1jURvGTgsCcpHVUoPkYwRnBkYdf6ikLYfImbsJIIcp5V4SlV6M+N1PkvgokT0
	j3hEjXOAWZyhvyutAloGZqKheig/B1L7gME6AzG01UGKapPui+KwZRCpYPV2a+zNzNHXKL2
	IAfAgCAPKoHz+jR5N3PCVasyuO7ESxbAo/ho2Sdays36kFSBw9G9AKSh3NEYldig09yeck3
	cwu6/XUxU9II2rXLAbGmEQ=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Hi Sandie,

On Tue Mar 31, 2026 at 3:11 PM CST, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
>
> The series is based on riscv-dt-for-next.
>
> v2:
> - Patch 1:
>    Use formal format user name.
> - Patch 2:
>    Use formal format user name.
>    Add Reviewed-by from Troy Mitchell.
>
> Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao=
@deepcomputing.io/
Please slow down a bit. Sending a v2 immediately after a single review does=
n't
give others (especially those in different time zones) a chance to look at =
v1.
It's better to wait a day or two to collect more feedback before sending a =
new iteration

                        - Troy
