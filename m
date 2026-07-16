Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EEF3A9DB9;
	Thu, 16 Jul 2026 20:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784235142; cv=none; b=juDtRHMo4ZvPiKcd51W1nZkorCEDip6eWT3D1ErtyxSnAF8apfAWRFxS+xeV9Qq97e7zjR5J+38yXPq9Ytsw6Cv/hIoAUPO/eFwuFNDcenpAfhDiJ/b8MpErvo32Ornc/oE1j1CdB2QZNjnOU+LzZK0Eh2hj0CeGA1SGFVSdaEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784235142; c=relaxed/simple;
	bh=P4ur7KH1USqo37RI8Y107cKQ6V6XDZPI4OdyfCEXuOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsHCX5RjZhTXwJJbtpbdLBbiRnbUwajmu3dNTQIiXmC7IHvFiO8pDenv5EopZPd0HypvCbbQnJcCDuo/joCSKCv1Is5BOHo4fwbOdRDKaOJ3EyZZrFbESKwfn2wk3MSLsrnCqSQ+u7POMDk7ihDiWrhjv/nguJvToa4djr1ZHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTNnjblk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTNnjblk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9051F000E9;
	Thu, 16 Jul 2026 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784235141;
	bh=EvHV1pVV4qzoVfR956q6ToCZBhjKMPu1tVO7pvo9JGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PTNnjblk9AdZs4ZbqjHCDpuk6WCRWxsb0WiZuQZ4SQlv9CyXF23K+ZAe45/6HZ5Gj
	 0jcRy2hqglfqsNSnf9u+TPgG6/WqLDocT582AveS3gO5AJHmr2ed1ytiKWThZZsTSO
	 ja5uaut5qMB0RyzJA6o6hr0gLXrePuL8oN0k0+WJDLyoMgXaiN0QmNRzKBynqR6cu1
	 lkNJI4hrkrTaXVFryRfpJJeSScS9fhD6j7VbB8+xZy7H19WlBeX3+r24m76zdfNcxv
	 NTTEdR5vQtVAu+hyPbIaIeC+Vi/DpttckPgkHuqRpQ8LhPuCh4HtP+esdLxSvT456q
	 +JvzMPkqZqiWQ==
Date: Thu, 16 Jul 2026 13:52:19 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, MoeLeak <i@leak.moe>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Message-ID: <allEg/A+Gt/em0Hs@x1>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>

On Tue, Jul 14, 2026 at 03:45:14PM +0800, Icenowy Zheng wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Add labels for GPIOs on the IO expansion chip on the I2C1 bus.
> 
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [Icenowy: Splitted off the patch adding all 3 IO expansions]
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 74b120c6b063a..78f5979a56c14 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
>  		reg = <0x18>;
>  		gpio-controller;
>  		#gpio-cells = <2>;
> +		gpio-line-names = "",
> +				  "cam0_reset",
> +				  "cam1_reset",
> +				  "cam2_reset",
> +				  "wl_host_wake",

I am not sure the line name really matters all that, but it seems that
pin 4 is also used as a reset gpio:

  wifi_pwrseq: wifi-pwrseq {
      compatible = "mmc-pwrseq-simple";
      reset-gpios = <&ioexp2 4 GPIO_ACTIVE_LOW>;
      post-power-on-delay-ms = <200>;
  };       

Did you notice that too?

Thanks,
Drew
