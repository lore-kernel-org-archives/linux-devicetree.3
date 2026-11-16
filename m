Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797700;
	b=nAOPw77Z7QlZ67G2n7DOxIygOMkoiPqZshCZkwKtFxjCvpY4UV9wA+snAbYE6/RpposH
	 ZpOwM0HE8Bpv9Wpe/ekkHw7MPwsxMDalF8h6PISkC0mNFXKu4RHgcroaOf8V5ZgiF/06L
	 0JaRjkj2Pem+14bdeB4hyyj2nI/njOUgijEJnUB2SWojIb++l37tJNzJicv91l3tL5/7j
	 bipdCML2xZShzzK8qA1NruAkNipawFMoPsAXEvcb6cI6j4qhzed9miRUuuwgqzaQj0jew
	 OW2hImeedmSTjWxFrOBWH9wfaKA34JFyBLX3OxwUhpmTRgQinrsC+zXhOm8s+8cAX3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797700;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:Cc:
	 X-Lms-Return-Path:To:Subject:From:Mime-Version:References:In-Reply-To:
	 Date:Message-Id:Content-Type;
	bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
	b=0hQ0bvDr4oO0fhLTzde0wR+MEMevSN/y6maxeDsD0z/C6QjPwObnwk6LuBiyoDq34VUp
	 ulgh/A+K+54p5bnB+E15daX1890PglaA/nl+SW7aXCgi7RsvWCMw9A4BzWApW0o1Pi+NO
	 1643AbvLK4D0c+IuPN39dfJ6Sjoz+zTe7WJ5mFXfKMHPVs+WpI2OwGzs/xjTxY+THpLlJ
	 MpRAw1vAS+NSIV7pCH30sz04Z14y4WS/4IPH2Fgkuu4m80osGWf6TGW2xZeDlVqYHzF/6
	 SFd9sJQ1KW1mW4IArfduSaNmr2D/kkqHP270URAkvveHaz84VNNpIIqAtemgUlrlhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2C606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 02:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F2C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=16YLyYfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794797682;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=LFNkNbE/BJjMMZVJ30Nnj44+C1fdsFY5EBU4BEDDicQ=;
 b=16YLyYfQbcyz3cZNUAjyKBpGujVF7ypjPj8iR9/eaz7hjdUx8OZ5ZjEKnowaNINjZBtUl7
 90/5zh8XeyB4QE3S/1fBfRxqb35JLHitd307jfJcuDaOkYsjZnXcGTpKOHCNshptNS0AW1
 1nyY9anLM55fPLVeWkCCvBWdirSH4j8JKMqhxl4fO9/o9oNEaCvp+yFlWAS+xZ4OYrp24G
 aJ1Mo7ht+71askjNKTQKMQps6NbnkxHCNoZvv7a+BtUUyIDerRXbirUEc+Bh3iQEa8/SU8
 8Yed2XoDZ+rqXz0qkCrRqnUDdQlQR9Tcg0ciK/70kHS+qwc4N5F4uhf46dTKtg==
Content-Transfer-Encoding: quoted-printable
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Lms-Return-Path: <lba+16afa7070+a5d044+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
	<20261114073025-GKA100523@kernel.org>
In-Reply-To: <20261114073025-GKA100523@kernel.org>
Date: Mon, 16 Nov 2026 10:54:38 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.c24fe633.1394.4ffc.88d5.f9ade9d7763c@feishu.cn>
Content-Type: text/plain; charset=UTF-8

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Sat, Nov 14, 2026, 15:30
> Hi Sandie,
>=C2=A0
> On 11:33 Mon 09 Nov =C2=A0 =C2=A0 , Sandie Cao wrote:
> > Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> ..
> > USB A works on otg mode, it isn't configured currently.
> Drop it, not really useful to mention there, irrelevant to this patch.
>=C2=A0
> Currently, No USB A port support is merged in mainline code.
> FYI, Chunyan submitted a patch for adding peripheral support of USB A.
> https://lore.kernel.org/all/20261105103125.2727341-1-chunyan.zhang@linux.=
spacemit.com/
>=C2=A0

Ok, I will drop USB A in next version.
I prefer to=C2=A0 submit a new patch for USB A separately.

>=C2=A0
> > - 4 USB-C Ports
> =C2=A0 =C2=A0 =C2=A0 ~~~~~ USB Type-C? less confusing
> > =C2=A0 =C2=A0 =C2=A0- Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
> > =C2=A0 =C2=A0 =C2=A0- Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (=
4K@60Hz)
> > =C2=A0 =C2=A0 =C2=A0- Port 3 & 4: USB 3.2 Gen 1
>=C2=A0
> For "Port X" here, is it a naming from FML13V05's schematic?
> would be great to mention which specific USB 3.0 controller (Port B, C, D=
)
> =C2=A0of the SoC it connect to..
>=C2=A0
> >=C2=A0

I will correct above to Port B, C, D.

Best regards
Sandie
