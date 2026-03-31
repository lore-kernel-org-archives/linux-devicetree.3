Received: from sg-3-30.ptr.tlmpb.com (sg-3-30.ptr.tlmpb.com [101.45.255.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24A7370D65
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774939143; cv=none; b=mw9ijNToTCODtuTCrG4vNv7Ub6Dkiuukvuxp1l39Rljj00uUMrc6CLChKIahfes3PY7uHLpqME3ZkHs13OrKU/w1Jw18tKYTMz0tzEhP06t6n4KBU2suRhHbYSOfb/vcHyOWKKkeHujycAsNoIxsHM3G9nlIctni0G7avUQ77wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774939143; c=relaxed/simple;
	bh=IxNwq4JUnKlv/IxnLCJYxLfGCvCAtbvIR9Q4w+rLz14=;
	h=In-Reply-To:Content-Type:Message-Id:To:Cc:From:Mime-Version:Date:
	 Subject:References; b=jLZpEbRx5uhgwtbmjm48uKVz+VBEEa3f/HLmyKrqILqrfc9JjUU3QR5zXSkEXA7ZJ8Lglyov6BCVTTod270QxjaqH6wlEWkAa8qYfHeJSBrKohHhXhmbEdGfAqwaqgT1bAR2lSNZ8I3VKn8PPyAX90oJ5AoIrr28ZfmE0zb8lLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=gv6+Uwwc; arc=none smtp.client-ip=101.45.255.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="gv6+Uwwc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774939096;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=IxNwq4JUnKlv/IxnLCJYxLfGCvCAtbvIR9Q4w+rLz14=;
 b=gv6+UwwclJN5//8x7RSx48ekLmvSt4LLpFnK1VzY1brheOBVCT9daFTfdYqfKLf2Y0wgxl
 1GHkN6YHwpsIOzA0JsGyMffBmmqSoTNRA8k66kPDL3zPq845N5B15c7hR+wcPzGB313XwA
 BAKsLP9hey1E82yQQMjg5BjPWjrPQI/1gLhbnZKgKUEzNzoUJVejD4y/43jWMkn8X0s9ur
 A8F7LbwynN4f4X93AtezB2pe+IHn0HupaRF5yqQtcDXL6mqBh/I/19fjw3uCq69Ww7kBwt
 BQxD0vLScV77HuWvYUCwSkzw9ED7/ibU/RJCv7U/kDw281EG8VcS2ERdYc9KdA==
In-Reply-To: <DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cb6bd5+328469+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.e358f129.78e8.4b7c.a3ea.c90229430d99@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Date: Tue, 31 Mar 2026 14:38:12 +0800
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034539.67167-1-sandie.cao@deepcomputing.io> <20260331060344-GKA976850@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
	<DHGR42QJK86L.10IAY9CB3RZH5@linux.spacemit.com>


> On Tue Mar 31, 2026 at 2:15 PM CST, =E6=9B=B9=E7=8F=8A=E7=8F=8A wrote:
> >
> >> From: "Yixun Lan"<dlan@kernel.org>
> >> Date:=C2=A0 Tue, Mar 31, 2026, 14:03
> >> Subject:=C2=A0 Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add de=
epcomputing,fml13v05
> >> To: "Sandie Cao"<sandie.cao@deepcomputing.io>
> >> Cc: "Conor Dooley"<conor+dt@kernel.org>, "Emil Renner Berthing"<kernel=
@esmil.dk>, "Rob Herring"<robh@kernel.org>, "Krzysztof Kozlowski"<krzk+dt@k=
ernel.org>, "Paul Walmsley"<paul.walmsley@sifive.com>, "Palmer Dabbelt"<pal=
mer@dabbelt.com>, "Albert Ou"<aou@eecs.berkeley.edu>, "Heinrich Schuchardt"=
<heinrich.schuchardt@canonical.com>, "Troy Mitchell"<troy.mitchell@linux.sp=
acemit.com>, "Michael Opdenacker"<michael.opdenacker@rootcommit.com>, "Guod=
ong Xu"<guodong@riscstar.com>, "Hendrik Hamerlinck"<hendrik.hamerlinck@hamm=
ernet.be>, "Yangyu Chen"<cyy@cyyself.name>, <spacemit@lists.linux.dev>, <li=
nux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, <linux-kernel=
@vger.kernel.org>
> I'm just confused as to why this appeared in the body.
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - Troy
>=C2=A0

This was the format of my email sender.=C2=A0
I correct it now.=C2=A0
Thanks.
Sandie
