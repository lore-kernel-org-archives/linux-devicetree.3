Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB013B0AFD
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941711; cv=none; b=QD0UoIHtNX9/HWXRgq7/Eacp0K76atIvtP7w26KmCxqgNpXlf+Wni59OqfDyGU5jdOi36XeCZUNN9uaQWqFzUKugjnls+gMcPH6FwPxO9UhS/SkgHVDNlZX4OL/GbgLGsITV13/owbWMxBtQnhcM6VFUpr+VdI8ABIW/g36/CBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941711; c=relaxed/simple;
	bh=B7oNmP6viNZ6qgD7MgVlD0elZ+Qs3xdqUMng7B/CrDA=;
	h=In-Reply-To:Content-Type:Message-Id:To:Cc:From:Mime-Version:Date:
	 Subject:References; b=aQ4sJzk7LZyAFdx3FUb9RL8GFUYLm+uEWwBV/c3mUC/zDp2YMXINhTqyI8VFMy/yknQVYpM0E6D3xrjZADW2b5XuEGcHf8Ma1kfNIQHETyxc/fF3fauDhUdgl1D4HY0u34ETK6lBdFqsP+tiMXZk0eAjHTsPCTlpP4mGP/Yx7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=nUWYE0Fb; arc=none smtp.client-ip=209.127.231.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="nUWYE0Fb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941704;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=B7oNmP6viNZ6qgD7MgVlD0elZ+Qs3xdqUMng7B/CrDA=;
 b=nUWYE0Fb8mMcLD7dHHiIWIENcW9gXsK4KB+jcnrZqVIiTOc9jZnOsK/zfcUs+UTWe8yyCv
 k+/0Wy7QBxF5QHxB9HJiCyj2Omeuxc+i6sFDMKVeGHiZNiWoRrVHy7+MzoAgdK4lR6kyzJ
 3X5ivjOpe7fvw3ZdnIyKQgXgCGgDW1rNT1j89h1mRA8QsbsjdFhoc6RYlb35kD91FN6UQB
 s6ii9uZZTCoKrxbCGQU1OebeH3jOR/ilYZwOOYLK0ZTBptZnXDc3dFTSHa/6wWF7/7FteM
 PBavoQD9LWxMto8wsflO2QdrBkofLntRsWVDnf2eHvZksfvIhMDjCfCwye/Cfg==
X-Lms-Return-Path: <lba+169cb7606+7f60ad+vger.kernel.org+sandie.cao@deepcomputing.io>
In-Reply-To: <DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.08d3c83d.aec5.4c10.8292.56d0380e3296@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
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
Date: Tue, 31 Mar 2026 15:21:39 +0800
Subject: Re: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
	<DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
Content-Transfer-Encoding: quoted-printable


> Hi Sandie,
>=C2=A0
> On Tue Mar 31, 2026 at 3:11 PM CST, Sandie Cao wrote:
> > This series updates Device Tree related files to introduce the
> > FML13V05 board from DeepComputing, which incorporates a Spacemit
> > K3 SoC. =C2=A0This board is designed for use on the Framework Laptop 13
> > Chassis, which has (Framework) SKU FRANHQ0001.
> >
> > The series is based on riscv-dt-for-next.
> >
> > v2:
> > - Patch 1:
> > =C2=A0 =C2=A0Use formal format user name.
> > - Patch 2:
> > =C2=A0 =C2=A0Use formal format user name.
> > =C2=A0 =C2=A0Add Reviewed-by from Troy Mitchell.
> >
> > Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.c=
ao@deepcomputing.io/
> Please slow down a bit. Sending a v2 immediately after a single review do=
esn't
> give others (especially those in different time zones) a chance to look a=
t v1.
> It's better to wait a day or two to collect more feedback before sending =
a new iteration
>=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 - Troy
>=C2=A0

Got it.=C2=A0
Thanks a lot.
Sandie
