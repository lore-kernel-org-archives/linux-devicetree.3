Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B12D3AB26B;
	Mon, 20 Jul 2026 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572048; cv=none; b=ZXDR4l78dPV0G2Wdg1aP3HbOw9LiEsVISVjtwTnEKuo/rX/i0usiRBVljXlY6j++BjcC8iPtKF200xd3FOWe1VcPF8DTdrOs2fG6cQKNhBsGgbFutopMy3A0hOznnG4Kw3R6tBkrsXhIWZIneHP/irANgbVd3/8vj92JfiEzvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572048; c=relaxed/simple;
	bh=bcMpiLirrCCBsrvs9Iz8hbDjIYe6T55EmDBfXMxz0s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETtmYXgQZhKw0tCpvgRx77Pgr6/5bfx9hJqPdJBppsRJVtUMikKFM3k/yLzA0hJ66d/KgpB2j5D8WzowPDzmdFPdEiBhJUz/MmogxbEsQy4wgaGJZE9mFUo99wYPZOBb2nFVC+qgIkSVOI8JyPcy2RS/PNcjBkPxYkmwzqxHFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJi1C8dL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJi1C8dL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF581F000E9;
	Mon, 20 Jul 2026 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784572047;
	bh=fpgz63qvHBupygN3mQvY/iJ84B9krvFuOUSphu2lqfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJi1C8dLeB9ahq5RN6Tf2UNkh5SlJQsN/DYjI4AYhL66yHqZDmCxwOtILK8kktbzT
	 +j9cchAnNfyGNPjAPcuNVp2K2F4b8D0IjqGWEouhLltJtieFAwA2jPnMr3Molz5+TL
	 ETsCcQLWIfQ4Zf6U/mqrDwYIEqd9LQm5fi/uEDFoIORROQVzDJS0Z4IPFoyogdeZwm
	 B2mBlxnkQMNIpBDzAIpuMB8yckyTYYO02gb5V/Y/FhXRSWiCUktPK2Dof4Dh6MB2TN
	 3ex/tnqH1oT3lF/oFdDqh2sBM3DBA+5DevppR6lYKVE9ydrGO5VPRJivINUNXFeHKG
	 9VZOY4Me3KIWA==
Date: Mon, 20 Jul 2026 11:27:25 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Message-ID: <al5ojcKfJZkt3mHA@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
 <allEg/A+Gt/em0Hs@x1>
 <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
 <al5TWhx7pLIZguAc@gen8>
 <cb14e077de1722d1c36cd0bd877952289dc90abb.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb14e077de1722d1c36cd0bd877952289dc90abb.camel@icenowy.me>

On Tue, Jul 21, 2026 at 01:28:58AM +0800, Icenowy Zheng wrote:
> 在 2026-07-20一的 09:56 -0700，Drew Fustini写道：
> > On Fri, Jul 17, 2026 at 12:11:23PM +0800, Icenowy Zheng wrote:
> > > 
> > > 
> > > 于 2026年7月17日 GMT+08:00 04:52:19，Drew Fustini <fustini@kernel.org>
> > > 写道：
> > > > On Tue, Jul 14, 2026 at 03:45:14PM +0800, Icenowy Zheng wrote:
> > > > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > > 
> > > > > Add labels for GPIOs on the IO expansion chip on the I2C1 bus.
> > > > > 
> > > > > Signed-off-by: Emil Renner Berthing
> > > > > <emil.renner.berthing@canonical.com>
> > > > > [Icenowy: Splitted off the patch adding all 3 IO expansions]
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > > ---
> > > > >  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > > b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > > index 74b120c6b063a..78f5979a56c14 100644
> > > > > --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> > > > > @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
> > > > >  		reg = <0x18>;
> > > > >  		gpio-controller;
> > > > >  		#gpio-cells = <2>;
> > > > > +		gpio-line-names = "",
> > > > > +				  "cam0_reset",
> > > > > +				  "cam1_reset",
> > > > > +				  "cam2_reset",
> > > > > +				  "wl_host_wake",
> > > > 
> > > > I am not sure the line name really matters all that, but it seems
> > > > that
> > > > pin 4 is also used as a reset gpio:
> > > 
> > > The "host" here is subject, which means "this pins is used by the
> > > host to wake the wl".
> > > 
> > > Maybe I should take the schematics name, "wl_host_wake_dev"? Or use
> > > another name on the page for Wi-Fi, "wl_reg_on"?
> > 
> > I thnk "wl_host_wake_dev" is slightly better in terms of searching
> > the
> > PDF [1] and finding the "IO Expansion 2" section. This is minor
> > change
> > so I can just fix up when applying if you are okay with that.
> 
> Of course I am okay with this.
> 
> Thanks,
> Icenowy

Great, I'll fixup on apply.

Reviewed-by: Drew Fustini <fustini@kernel.org>    

Thanks,
Drew
