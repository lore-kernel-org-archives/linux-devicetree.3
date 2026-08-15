Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358CF4B0487;
	Sat, 15 Aug 2026 00:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786752470; cv=none; b=nPvbm6SC1f++n/N+Kc6wHRksE0dI3b6j5y520SYqRbKLudLvOQnNLw4AL0cEPN14xHz+7kfJiNPaFvGQRQxRf9ZIoY43LYXP6P5eirLKVvoGNFzeRTfSxLaf0zgq+sbFoERcq2jdkzxKyxFw9GvFaVWwCi6dC+vxXNM87laJUmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786752470; c=relaxed/simple;
	bh=cWUhunl+Qc8/+qYYWcUqkPIZFTiZsoy2Q9GHnGiLheg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcLxsUV03vpo/SSba6wh+R9ajtfTclXltQ+bOjssnXdc9hz9cAT0UzPR0UxWdiJYSgCp+f8wC+WsdvDNwPSHgHXK6qXVkBWi/fLMHdovR63dKcd3bpekFanO493kCHGuGy78TYB/xzeeRxp5TZB79ncsGqRCZi0GQr6pJfNDZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W41gzK+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W41gzK+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952DD1F000E9;
	Sat, 15 Aug 2026 00:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786752468;
	bh=kWSRKvTjWjrBmE8RB5NmAV+Uzzr1c6KdIJcOaEpeRHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W41gzK+nj7D0R6J81tfBjV1umrlbXlj1j1cLCsLybgPX11Ycnp6gGJ8uEmW9Ci8JB
	 tbix5PBHSoY6tUwrRumGl/x1uOLAO1wAQI+n9yJ+SoOqy8BtX47aCCWCpG+19Ed5HB
	 ckId7+AkwOLpkSoCsbDA7xwdzoQejsVTIIM0xnRCJ2jiiIhwAipS9QQTo56dk2XChp
	 +nJnYLEjnHAc/lanj7i8yea7AlbOfq6oMa6gte2v14qVEvzUjvB1W74bdnRzAMKPNK
	 2QTmeEcl8APPdzE45T4XNL/KYYioFLv+ljzCUqDNn6q2Pz/402LckPQhaiJvdIa48I
	 cUG4/lMfrx/2g==
Date: Fri, 14 Aug 2026 17:07:47 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 0/5] Add remaining IO expansions on Lichee Pi 4A
Message-ID: <an-t0_Gd7zar_raC@thelio>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <amJF1g8sPu5RrrIQ@x1>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJF1g8sPu5RrrIQ@x1>

On Thu, Jul 23, 2026 at 09:48:22AM -0700, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 03:45:10PM +0800, Icenowy Zheng wrote:
> > This patchset is split off the "Add TH1520 USB support" patchset,
> > dedicating to enable the IO expansion chips, because the situation
> > becomes complex when one of them (but not all) was added for Wi-Fi
> > support.
> > 
> > I fixed a small issue of the existing I2C1 device node, and then all
> > original patches are aligned with the existing I2C1 node for
> > consistency.
> > 
> > Emil Renner Berthing (2):
> >   riscv: dts: thead: Add IO labels for the IO expansion on I2C1
> >   riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions
> > 
> > Icenowy Zheng (2):
> >   riscv: dts: thead: th1520: remove pclk for I2C1
> >   riscv: dts: thead: lpi4a: sort nodes
> > 
> > Thomas Bonnefille (1):
> >   riscv: dts: thead: Add TH1520 I2C nodes
> > 
> >  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 141 +++++++++++++-----
> >  arch/riscv/boot/dts/thead/th1520.dtsi         |  53 ++++++-
> >  2 files changed, 157 insertions(+), 37 deletions(-)
> > 
> > -- 
> > 2.52.0
> > 
> 
> I have applied all 5 patches to thead-dt-for-next and they are now in
> linux-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/arch/riscv/boot/dts/thead
> 
> If no problems arise, then I will send thead-dt PR for 7.3 in a few days.
> 
> Thanks,
> Drew

This series should be in 7.3-rc1 once the merge window closes:
https://lore.kernel.org/all/178534081274.3143403.4697156662576834176.git-patchwork-notify@kernel.org/

Thanks,
Drew
