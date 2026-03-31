Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9751392C27
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774937733; cv=none; b=hN8A1PO/oLYFTHKNHpSMsxBH0G3j5F1GxUDUVFkx2m+wWQGloDPccCD6m3wJdBOKkDrhQ6dEUiZkOuB/5Up5VhAMRQVX7D83skVRhCxRcm6wf1upJ2fEYQ1BrjQ3NrwyUOgVMa9Jg7Qhz+spdo8Iw3RggCvDx/EhylLsPUJsuEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774937733; c=relaxed/simple;
	bh=pt5PETNepaQ0Nw1NJHuQ6irwi3W5lWviOYEgUjg/xA4=;
	h=Message-Id:Cc:Subject:From:Mime-Version:References:Date:
	 Content-Type:In-Reply-To:To; b=Hoj84L10UTe4W8JzMGFVytHeeyMUITKDj/jofZUklLYttWqn49WLu0NoxtMqbyINMGHt3LjLwuQ7M9nnFYH891JUJtjWTWZOMXrVvmkoNSpBVDe2l7eN1mN5spWqnnsWHm6oNvAG7u+buSHTIYFrh9ccgNkXlBwXLHr2pPI1qUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=mS1VllzW; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="mS1VllzW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774937726;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=pt5PETNepaQ0Nw1NJHuQ6irwi3W5lWviOYEgUjg/xA4=;
 b=mS1VllzWGaDrEX1/YecDnor1D42Wk3YStwdygl6pwbSLoZ6IkT5QQtgJEOQt1oUB4e2jYP
 BiKUqDE6RGJmKYZcRXdtD66PYUp45IKurYxPfv97q381rFnBwkH9EHU+gbSfj4YzcvQIEE
 SY8BpEESwHjaniiOSV3Jz86MakTyFWSH9phN87kLBPBLE91hIsQ/z8SeyDg/rS/CYCiNlG
 3b77gHDKRvaFfC0tVYsK0K208MN1JbmtF8dhZYoaPdRzWc8EbKxJMFep4HSUBu/GGHlzGk
 g6RLATAt0MntoqTIah4Uz0TbC8PZDvunKFM5ETwmdvy78ECLn7ndUD40oPMOAQ==
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.d811f619.24b1.431f.ad4d.c0bae1097eb9@feishu.cn>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
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
Subject: Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io> <20260331034539.67167-1-sandie.cao@deepcomputing.io>
	<20260331060344-GKA976850@kernel.org>
X-Lms-Return-Path: <lba+169cb667c+431f1b+vger.kernel.org+sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 14:15:22 +0800
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20260331060344-GKA976850@kernel.org>
Content-Transfer-Encoding: quoted-printable
To: "Yixun Lan" <dlan@kernel.org>


> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Tue, Mar 31, 2026, 14:03
> Subject:=C2=A0 Re: [PATCH v1 1/2] dt-bindings: riscv: spacemit: add deepc=
omputing,fml13v05
> To: "Sandie Cao"<sandie.cao@deepcomputing.io>
> Cc: "Conor Dooley"<conor+dt@kernel.org>, "Emil Renner Berthing"<kernel@es=
mil.dk>, "Rob Herring"<robh@kernel.org>, "Krzysztof Kozlowski"<krzk+dt@kern=
el.org>, "Paul Walmsley"<paul.walmsley@sifive.com>, "Palmer Dabbelt"<palmer=
@dabbelt.com>, "Albert Ou"<aou@eecs.berkeley.edu>, "Heinrich Schuchardt"<he=
inrich.schuchardt@canonical.com>, "Troy Mitchell"<troy.mitchell@linux.space=
mit.com>, "Michael Opdenacker"<michael.opdenacker@rootcommit.com>, "Guodong=
 Xu"<guodong@riscstar.com>, "Hendrik Hamerlinck"<hendrik.hamerlinck@hammern=
et.be>, "Yangyu Chen"<cyy@cyyself.name>, <spacemit@lists.linux.dev>, <linux=
-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, <linux-kernel@vg=
er.kernel.org>
> Hi Sandie,
> On 11:45 Tue 31 Mar =C2=A0 =C2=A0 , Sandie Cao wrote:
> > From: sandiecao <sandie.cao@deepcomputing.io>
>=C2=A0
> Can you use more formal format for your name? which,
> Sandie Cao <sandie.cao@deepcomputing.io>

OK. Got it. I will fix it in next version.
Sandie

>=C2=A0
> >=C2=A0
> > Document the compatible string for the Deepcomputing fml13v05.
> > It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framew=
ork
> > Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.
> >=C2=A0
> > Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> same here
> > Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=C2=A0
> > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Do=
cumentation/devicetree/bindings/riscv/spacemit.yaml
> > index b958b94a924d..af8030242bdc 100644
> > --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > @@ -29,6 +29,7 @@ properties:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- const: spacemit,k1
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0- items:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- enum:
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- deepcomputing,fml13=
v05
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- spacemit,k3-pi=
co-itx
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- const: spacemit,k3
> > =C2=A0
> > --=C2=A0
> > 2.43.0
>=C2=A0
> --=C2=A0
> Yixun Lan (dlan)
>=C2=A0
