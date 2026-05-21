Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFB634A795
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353504; cv=none; b=MSe5HIV4BbkPSeritOQmtqCro7oL8pdqspTnv390riuMgq1+l0DJ6d1u95hHpUWPhJP70VdeHNdY3KOuWA3N71BZEUCSX+AMG1yVVib7YwplZ3bOY1HRP0mBCs3fXgVodFBBNYpoCFD5HSYcC1kZZuoYz8rLDd+meT6yiKQ51kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353504; c=relaxed/simple;
	bh=ErwPZrvEfQjxO4h3WypskrsVZ+b3FJ1jCyYW6NCn+/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqxmeITIP4HNr/GCwzC4EbhHwKyjrnoh28BvYHL9se9G6ocLloRbUGGz6sN6C+jRTP6Ko7ZzpLS6YV4CX7ac+Z7aZNDlmlWrTV9CBnZ6TFMMmb0W3KuSE8ZqilBkRSv4PuzaIUhyOaE185rql565qKzUU4DcwAIutUdRvmxNshY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GcRfYq3F; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZwMEa5Z9; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GcRfYq3F";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZwMEa5Z9"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1779353355; bh=tboziFN+P1ZHSCtpnTlFnif
	oXEx/CvZ7qbR4+LAHbVg=; b=GcRfYq3FC2ZG2tG85sYa2zzPtoXV1GWkmCd+DfBdpFhEvcHKqw
	9YCEV4+VOqAOBohXRJfrIz9PL0+lTDBJR1dQHJ8sQncqk0mM07t9WW9QqcJbj41UVZu/cDfWwp9
	DxC5hOJndfLUDdOokszLDOd7m1sfZnZX4umbw5soH2sZsukd6uTSNUC+5hk2cq6r0yW7wz1VpW+
	+FwJGhqOyY1yjT7LbA6YCBeTfHpgUxYelxdSQlftTcb8qJ3A353/ZHpB9nBEqP0Ngzu0le6krc0
	DZPz0TNaersdxVVXrqMNJH9HZ9X6qyBuKoya3CtG1PYMe5qhHCwhK45hJa/PKqYchVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1779353355; bh=tboziFN+P1ZHSCtpnTlFnif
	oXEx/CvZ7qbR4+LAHbVg=; b=ZwMEa5Z9ssHwbtLxOKe8JMfUOHSaEd+h6PFWZvoBfqUj6gNw8p
	7wUZUI0+uz1hoXkzfvgc4fg4poReBzfYgcCQ==;
Date: Thu, 21 May 2026 15:49:10 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Tobias Schramm <t.schramm@manjaro.org>, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vcc_sdio regulator max voltage
 on Pinebook Pro
Message-ID: <ag7Edg9sgEXLuOc3@meltbook-pro>
References: <20260519094439.7918-1-hugo@whynothugo.nl>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519094439.7918-1-hugo@whynothugo.nl>

Hi,

On Tue, May 19, 2026 at 11:44:39AM +0200, Hugo Osvaldo Barrera wrote:
> The vcc_sdio regulator supports 1.8V to 3.4V output range according to
> its datasheet.
> 
> The current DT incorrectly limits the max voltage to 3.0V. This limit
> causes issues issues downstream with u-boot, which refuses to apply the

Just a heads up, you can run mainline U-Boot on the Pinebook Pro without
any modification.

But after looking at the datasheet for the AP6256, I can confirm that
this change matches perfectly with the recommended ratings.

Reviewed-by: Dang Huynh <dang.huynh@mainlining.org>

> out-of range value, and falls back to the minimum in that range: 1.8V.
> This is insufficient to power the SD card, so driver initialisation
> fails and booting from it does not work.
> 
> Set regulator-max-microvolt to 3400000 µV to match hardware capability.
> This matches the rk3399-orangepi for the same regulator.
> 
> Signed-off-by: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index b5c05928142c..f21fcdc1b49a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -526,7 +526,7 @@ vcc_sdio: LDO_REG4 {
>  				regulator-always-on;
>  				regulator-boot-on;
>  				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3000000>;
> +				regulator-max-microvolt = <3400000>;
>  
>  				regulator-state-mem {
>  					regulator-on-in-suspend;
