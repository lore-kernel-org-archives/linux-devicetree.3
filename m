Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34EB2D9792;
	Mon, 20 Jul 2026 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784566620; cv=none; b=Zc5wdLBsQBEMVzB7zbRmWZaqYVPO/IwF6W+07lKCYfCyOIxbZnaoe6RM8TgiIJNEmurj2zpV8PuLYEDEe0sSxvc8fBGkDqyOEJVoO4IPVZ2yp1gUoTQMOcuTmyfQ2wVwy83Qow1O3S6d4DeBvw9nbE6SkU3nfIJ7O8HdvdOkDBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784566620; c=relaxed/simple;
	bh=2MqH1ZgSquBNSZktAwudZNRvAB//mZF6pPRpwW8M3iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZzgSeZ1MZoTvz1rzpPOW3UYMGDcft/+J5SfK8F2Ic6/r39O2iqcRcud9cV5n8dZ2Ur25dymfL6aOXva4hR4NZiORf+Zxw5b0pDcH4IU/4UbjxfKJDNXpUkpgaW+HavCN8BSXfelIYhewCdH40Znt3/HPusHVQmF8WTMhBJsECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E072VCYy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E072VCYy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050901F000E9;
	Mon, 20 Jul 2026 16:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784566619;
	bh=CL7VZPLwd2s3IweYjUVZvbpDs9ZCkifwypl2mqHFzhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E072VCYy+jt2/yl3Fjpcd/VvtYe/VCVFc2ag8TFOdnoOMSntM1zRVioDV7bQ1U9Af
	 7nYE0YK6eDqTm+S8OZmBou484JFwi3vBx/1wQuvRiGAXv887+e6AFPf4wRMD6ZtfyC
	 jUULNDqcsgPLSR4xytowO4Vgr/GdVsFUGu52BQ6mTWI62TPg1C4UAczuWI3IGp2hUM
	 DGUrvM0stglq0jOG4oTh9TSKqMy00uoym1JcTehq9++bAlBmkvOqQYjJse2WRUTVNh
	 sZdj8bcyzWrEfKuYhRthAvWXJ2rsoWXh4jxws4OLntQFuabi61/MJOXeDN2zLykvF/
	 ZyQVcai0IGtTg==
Date: Mon, 20 Jul 2026 09:56:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Message-ID: <al5TWhx7pLIZguAc@gen8>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
 <allEg/A+Gt/em0Hs@x1>
 <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me>

On Fri, Jul 17, 2026 at 12:11:23PM +0800, Icenowy Zheng wrote:
> 
> 
> 于 2026年7月17日 GMT+08:00 04:52:19，Drew Fustini <fustini@kernel.org> 写道：
> >On Tue, Jul 14, 2026 at 03:45:14PM +0800, Icenowy Zheng wrote:
> >> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> 
> >> Add labels for GPIOs on the IO expansion chip on the I2C1 bus.
> >> 
> >> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >> [Icenowy: Splitted off the patch adding all 3 IO expansions]
> >> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >> 
> >> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> >> index 74b120c6b063a..78f5979a56c14 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> >> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> >> @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
> >>  		reg = <0x18>;
> >>  		gpio-controller;
> >>  		#gpio-cells = <2>;
> >> +		gpio-line-names = "",
> >> +				  "cam0_reset",
> >> +				  "cam1_reset",
> >> +				  "cam2_reset",
> >> +				  "wl_host_wake",
> >
> >I am not sure the line name really matters all that, but it seems that
> >pin 4 is also used as a reset gpio:
> 
> The "host" here is subject, which means "this pins is used by the host to wake the wl".
> 
> Maybe I should take the schematics name, "wl_host_wake_dev"? Or use another name on the page for Wi-Fi, "wl_reg_on"?

I thnk "wl_host_wake_dev" is slightly better in terms of searching the
PDF [1] and finding the "IO Expansion 2" section. This is minor change
so I can just fix up when applying if you are okay with that.

Thanks,
Drew

[1] https://dl.sipeed.com/shareURL/LICHEE/licheepi4a/02_Schematic
