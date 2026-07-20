Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D04418F0;
	Mon, 20 Jul 2026 17:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568574; cv=pass; b=IOxaLotOiLlwxjjjZ0VR0ZYqoiZE33VnC7C3gTPBuQqP0AcigrQrv3pzAFM0wildbv6FAEs4G4vGBIoK0m78LChY4uhXIOmLHZG05i1vg7D/u78X4FNOHa5LAVdNssQDBGu8fNDxgYGEevlrElyg+XdE+ARSilPeQYqxVOeeEQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568574; c=relaxed/simple;
	bh=yZcHBC92SnATaQhgTp3nU0VxZC4n1CSFc/9JkPlpVFg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XyGPrlZ7rWBXe8nMSXk6aya5PY97zqeBz+9xdxQz78FS+vTk2Y4x/JDxSeapVDcGVN0OinA1jInhV0rvDJh4lY8QoPxFYiipOdopBZ2S+tLf/Xm/CM3eJrms2Y64HrBtS5c2fHMWyM6sI+0D60G4sD9MUPuXrDcg2ko46Nh9Epo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Dykojnr+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Dykojnr+"
ARC-Seal: i=1; a=rsa-sha256; t=1784568546; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dcgkDqZzH02+3rhs8JhlEu+dt9qN+QvrOnTuPkj0evGWoyk9rKJ1nWpmYLIFbyx75bKsYJZ5FLh473qLxbAn2J63KZuAG1a7Lc4/C8EAkaLi6Rlo8ibUh6z/tKqKuPHofeUbk5K0l5QfmzRS94cvHIci55a5BPncvgB56LWpNS4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784568546; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U30vcVgNDbL6Q7ialsGqcvS1rDzUWs+db9ulvIMrdnk=; 
	b=LdFulXqgU/HJBxf8Z9uHkJf69EzM692RBeThzO6kHYg2bdI/ALtHirAxmbrAtR69vQsNVk1KGEqP0lutcmMiPzzM/3ZvQJeGTjwgjikXs/9Prpv3DV8jQw+aY0dTTVVFNNNyiyeZ3gTHdzd6DPV5HkZ8RjkLV3HWCYQuqFEJ/WI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784568545;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=U30vcVgNDbL6Q7ialsGqcvS1rDzUWs+db9ulvIMrdnk=;
	b=Dykojnr+V8QoR0i6IONblIbtqKkiHIVnyMz7hEFux/YVZX1RDnTB6qxP6xvZKvWc
	klE6Z0uz7vubwnOiiZCwjbsr2U7q7OL6nyCAcQ0uOJ+Ph9O1vBfCwAKAzeQBjkRwYhu
	SPnXAj4GwKSIzmOCG5+z5hwhsPLzAJyHPERGG/tv9KtKkeuWMekxldG4v7oM9mVeiUt
	7JHnxGaW3Sg/CMEhvsdnymYUtGlm6RweStkPW9lzscjW647eDr2B2TPdWEni63d1vk/
	lAugkMF9o6Hhb7xwy1IrxMAMSy1rnoTPJRuGnmrp8nCgfu+qA7SSbqkwOfM36wZYF0h
	VcCwYTwSjg==
Received: by mx.zohomail.com with SMTPS id 1784568543822170.23306213464105;
	Mon, 20 Jul 2026 10:29:03 -0700 (PDT)
Message-ID: <cb14e077de1722d1c36cd0bd877952289dc90abb.camel@icenowy.me>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, MoeLeak <i@leak.moe>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Emil Renner
 Berthing	 <emil.renner.berthing@canonical.com>
Date: Tue, 21 Jul 2026 01:28:58 +0800
In-Reply-To: <al5TWhx7pLIZguAc@gen8>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
	 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn> <allEg/A+Gt/em0Hs@x1>
	 <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me> <al5TWhx7pLIZguAc@gen8>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-07-20=E4=B8=80=E7=9A=84 09:56 -0700=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Fri, Jul 17, 2026 at 12:11:23PM +0800, Icenowy Zheng wrote:
> >=20
> >=20
> > =E4=BA=8E 2026=E5=B9=B47=E6=9C=8817=E6=97=A5 GMT+08:00 04:52:19=EF=BC=
=8CDrew Fustini <fustini@kernel.org>
> > =E5=86=99=E9=81=93=EF=BC=9A
> > > On Tue, Jul 14, 2026 at 03:45:14PM +0800, Icenowy Zheng wrote:
> > > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > >=20
> > > > Add labels for GPIOs on the IO expansion chip on the I2C1 bus.
> > > >=20
> > > > Signed-off-by: Emil Renner Berthing
> > > > <emil.renner.berthing@canonical.com>
> > > > [Icenowy: Splitted off the patch adding all 3 IO expansions]
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > ---
> > > > =C2=A0arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 8 +++++++=
+
> > > > =C2=A01 file changed, 8 insertions(+)
> > > >=20
> > > > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > index 74b120c6b063a..78f5979a56c14 100644
> > > > --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
> > > > =C2=A0		reg =3D <0x18>;
> > > > =C2=A0		gpio-controller;
> > > > =C2=A0		#gpio-cells =3D <2>;
> > > > +		gpio-line-names =3D "",
> > > > +				=C2=A0 "cam0_reset",
> > > > +				=C2=A0 "cam1_reset",
> > > > +				=C2=A0 "cam2_reset",
> > > > +				=C2=A0 "wl_host_wake",
> > >=20
> > > I am not sure the line name really matters all that, but it seems
> > > that
> > > pin 4 is also used as a reset gpio:
> >=20
> > The "host" here is subject, which means "this pins is used by the
> > host to wake the wl".
> >=20
> > Maybe I should take the schematics name, "wl_host_wake_dev"? Or use
> > another name on the page for Wi-Fi, "wl_reg_on"?
>=20
> I thnk "wl_host_wake_dev" is slightly better in terms of searching
> the
> PDF [1] and finding the "IO Expansion 2" section. This is minor
> change
> so I can just fix up when applying if you are okay with that.

Of course I am okay with this.

Thanks,
Icenowy

>=20
> Thanks,
> Drew
>=20
> [1] https://dl.sipeed.com/shareURL/LICHEE/licheepi4a/02_Schematic
