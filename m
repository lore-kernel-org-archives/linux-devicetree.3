Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60BA382292;
	Thu, 23 Jul 2026 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825304; cv=none; b=hWZoOltMBWiGzj4cbY9xlTalhR/x2FRZGxJfC7TwJqWHJY++szrmnFNwXgyJIVUNWM/DiFMS7PVDNCtMOtW15ZIEsWTR6eM2IGBTteKwAy89/RMspT9DL4jIdzTi2bIPaNZVP8um6pXOQNqSZ7KE74ksmBu/DsXRj4x3HKSfp5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825304; c=relaxed/simple;
	bh=AdYLHsy8jd3fUNnhkdTtWdLLSzaZeURJR5fMtW0+mTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpD2564jVa0ZVbToZZENVHCq6T21dsa6YAz1AxirvBEeIWyTk2m9LhWOmixYHi51uWWeUwl5Z6Oikn4vnRMmoQmwiP2a0PNZaddBckkUbUSkSWRsDLAGYHY1XgOHOdSXjnSkJP07giAQe3jT8yHxqoxnelKuAdYfX77mL44YyyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsgCI0Ab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsgCI0Ab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0531F000E9;
	Thu, 23 Jul 2026 16:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825303;
	bh=3P9xI+pucfFbCBzQvp5irY3d0mKfClOOD5/mrlfuM/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nsgCI0Ab13Z/Of9oByHdIIRnbyP5zi/C7dSPzQXUokVFUGzdcIlrlKm45s1Q14isF
	 aVu7PO08VMNDnnC6tWBGqhsJoa/wQRT4DZhzhtB7bAIE5u55zMotEmOF9fTdSjxY7Q
	 cwRr6ca9jHke2Ir8TlsVC9k0a7IGsYsaj3YQ+119IlgZwGdc8SiN26TRY32gFxxa7U
	 ugTtZBm9qOojhSp7PXkAlyfTxi/mdOXoV+a6+By50iAxHZTu8uDZIhS2Qv2d4W+WGM
	 PWtwkEojYJ566qOYU9qvqaLBbdwgwM9jD0B06TfQtThFV3J6qC+7jO9yvNfykyizyc
	 VvJehO+bNUTbw==
Date: Thu, 23 Jul 2026 09:48:22 -0700
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
Message-ID: <amJF1g8sPu5RrrIQ@x1>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>

On Tue, Jul 14, 2026 at 03:45:10PM +0800, Icenowy Zheng wrote:
> This patchset is split off the "Add TH1520 USB support" patchset,
> dedicating to enable the IO expansion chips, because the situation
> becomes complex when one of them (but not all) was added for Wi-Fi
> support.
> 
> I fixed a small issue of the existing I2C1 device node, and then all
> original patches are aligned with the existing I2C1 node for
> consistency.
> 
> Emil Renner Berthing (2):
>   riscv: dts: thead: Add IO labels for the IO expansion on I2C1
>   riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions
> 
> Icenowy Zheng (2):
>   riscv: dts: thead: th1520: remove pclk for I2C1
>   riscv: dts: thead: lpi4a: sort nodes
> 
> Thomas Bonnefille (1):
>   riscv: dts: thead: Add TH1520 I2C nodes
> 
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 141 +++++++++++++-----
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  53 ++++++-
>  2 files changed, 157 insertions(+), 37 deletions(-)
> 
> -- 
> 2.52.0
> 

I have applied all 5 patches to thead-dt-for-next and they are now in
linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/arch/riscv/boot/dts/thead

If no problems arise, then I will send thead-dt PR for 7.3 in a few days.

Thanks,
Drew
