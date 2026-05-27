Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC8940B6DF;
	Wed, 27 May 2026 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887970; cv=none; b=P1hp6dsUqS7xZVK9v68R/WH80MtaYgkztTQDnR+kRE2gLS2vLBJDqAgKsK2dXs954Q+UFAb+i8xZaRKI8Wiuyk+eXfB7h8C3ILBN+z31oqs4IFy6aakomUHrU3xiYcrKd4pYfVw4Xg+Pe8Wwa42aQbM3qYTOEgs42x9i+/sLZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887970; c=relaxed/simple;
	bh=82cr3OEuGhC6VA1rTHqxuULg4YDVH3kphMyOxqvilqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjTDFysyzSFEMSPjaJrDrOwnrUStnGX9CL9OOD/YQ0zFe9PFMuzrCiy4NlO1E1SOK66IHcBgJ6+rCK+Sne9dW3leoYIJ+eaFCmf7EI2obi563GvQC0of3HG9tj6u6QnCVG+WnkS/ReIOK6MRIwwprVunypa+jlxmwq+nXQDAe+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbTboMG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbTboMG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D7B1F000E9;
	Wed, 27 May 2026 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887969;
	bh=Q7gBymELBCrfCbrF5Z/sbLkfLJFwnO6lYJgd+STHmlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbTboMG3MVEg45WS42Zwiio8fOKqRvbmN8/hhkoiAevca2Z5ZuEMVMnBb8JgeqDW9
	 5VB08ry9tOpLXCYgAkXExBW/EqxCwmFh66V+BrN0Eh7iqP+Kzf5eThyknd+RsKwH2H
	 fIkhQ9VkIcQq9K0SVKzWOXvol56O8WMri7v9Ai331s3xrSpnIDdpdixntonu8G8xVk
	 vGN4DSGz3zfJvQh3rioXDqnxUVwghbUlbAGl4Hp+xHfZt0TAXCtpCKhh2VkLLNZOOz
	 37kQmYlVVDmCcipJHj2qHshZkNPvFnyHs5EINCSd3g1UBmZ8/TdukqC6vI0ZJYqSRb
	 eM1N2PSdCipaw==
Date: Wed, 27 May 2026 15:19:23 +0200
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
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable WiFi on Lichee Pi 4A
Message-ID: <ahbvWzodp1SsBb5a@gen8>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
 <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>

On Fri, May 08, 2026 at 07:44:14PM +0800, MoeLeak wrote:
> The Lichee Pi 4A has an RTL8723DS WiFi module connected to the TH1520
> SDIO1 controller. The module reset line is driven through a PCA9557 GPIO
> expander on the I2C1 bus.
> 
> Enable I2C1 for the GPIO expander and configure SDIO1 as a non-removable
> 4-bit SDIO bus using an mmc-pwrseq-simple reset sequence so the WiFi
> device can be powered and enumerated.
> 
> Signed-off-by: MoeLeak <i@leak.moe>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
>  1 file changed, 47 insertions(+)

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks for fixing up previous revision.

Drew
