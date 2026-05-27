Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C563126A9;
	Wed, 27 May 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779888102; cv=none; b=pzrJmHIrovJONTdYhkg8Plk1Z5C+CQBWi5xGEfXuTdYihDCKj5HcPqyjaKf19koe94w9/2ok+SSbMIyIBJGEYajCDSa3jMdx8LUQwrF0cAJHEpUMpP5DnJVBttkUA22ZaF7BKcvim4q6KZP/ilcDA7BOj5fxZe+GP5ZRtq7EchM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779888102; c=relaxed/simple;
	bh=rQtMMId+fRqdTyMRtVl2ryR95b4gVucbefBzxZOziD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncPlESHVa/OmFFNsk2XTPDLCswaNwLqzqV4mUQme8WriR0uVmO/f6p9da6j0H2lQ/rNctqLdxBwEjY6mbQaz9URVfsl6pUWCIU17RBKAeJrnnfUMqqtkZYCvkkxuPJ3VE9OZUwiZrKfGoWagi68mnQfKm1S7RSyeyo6TelP9Z/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmrgDbXy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmrgDbXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A58B1F00A3D;
	Wed, 27 May 2026 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779888101;
	bh=FDMDIrmcq3pN6ji+eFw3Bj7u92MwtOzZi6x4Puo1g2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KmrgDbXyfxohnsGvaizzjntmJ5IgbFcGGHTsKOVxLVZhzz0Kcwe/FkXbB4oqv8k+k
	 R/OdKQDGkHBE7ocAMrIM0xF14w5KnYDeTfedljOTTBCkrokOG4JaaNkxjMKL3oXOSJ
	 5AfJBw6M2c1FT+Pb0VoxX0C57QyYCMEs2poijuK/9qcxYnO9qTqV3LUiJTY+FM0DHE
	 ePGEPZKdL/BwqQ+8qJRYjBRD7/QkFpogBaUurEWc/we4ZmGMUG/N4N8CxbAwITqaXc
	 A65SJ1zMWZhVADhbBdA4neHHnF/PERbqd5OGP1cfv008V9ULF9cnizVJh7axVQEquy
	 5KXfSSqhr0TQw==
Date: Wed, 27 May 2026 15:21:35 +0200
From: Drew Fustini <fustini@kernel.org>
To: MoeLeak <i@leak.moe>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] riscv: dts: thead: Enable Lichee Pi 4A WiFi
Message-ID: <ahbv36NnoOiUnM9S@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>

On Fri, May 08, 2026 at 07:44:12PM +0800, MoeLeak wrote:
> Enable the RTL8723DS WiFi module on the Sipeed Lichee Pi 4A.
> 
> The module is connected to the TH1520 SDIO1 controller, while its reset
> line is controlled through a PCA9557 GPIO expander on I2C1. Add the I2C1
> controller to the TH1520 SoC description first, then enable the board
> specific I2C1, GPIO expander, MMC power sequencing, and SDIO1 wiring.
> 
> Thanks to Drew for the detailed review and for pointing out the missing
> commit message, recipient list, revision notes, and patch split. This v2
> series follows that feedback.
> 
> Changes in v2:
> - Split the TH1520 I2C1 controller addition into a separate patch.
> - Add commit messages describing why the changes are needed.
> - Add revision number to the patch subjects.
> - Add MAINTAINERS-derived To/Cc recipients from get_maintainer.pl.
> 
> Signed-off-by: MoeLeak <i@leak.moe>
> ---
> MoeLeak (2):
>       riscv: dts: thead: Add TH1520 I2C1 controller
>       riscv: dts: thead: Enable WiFi on Lichee Pi 4A
> 
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi             | 11 ++++++
>  2 files changed, 58 insertions(+)

Both patches have been applied to thead-dt-for-next [1] [2].

Thanks,
Drew

[1] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=2f60e351633044dee88b63fb1600e284d2476e9c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=a20241c08385c875c4d0deb6c8ffc15f13f5b388
