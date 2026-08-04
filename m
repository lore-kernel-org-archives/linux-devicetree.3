Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0687130566A;
	Tue,  4 Aug 2026 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829704; cv=none; b=Hw1e1ZIXf8Bf7Rr98c7E/6SMzOy1TWaiG+EJfXWzFe1YUUy/DZpCATJLjGoWRaHVrNec18fz5f28Q5pOyNzOI7E0+0UQbs0btzl5/IMHEcDobXanuYkrgpmtDuruhLr2K+xk7X4HcUGB7Lfwqp69+I5Q7kca6Bk8RXc4aL73cbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829704; c=relaxed/simple;
	bh=afsBes9TO9uWmCdyd4/nAFvt7d/3AITXksKBCyufGhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC5uBT05J97w6gEFP3TZ0orB/R5bI0kj4ZnfLrKHKDiMQy/YKMwWjT0Xbj+RJfW1DK3IaX7xLZimx7km3TlaFM2gZATLblA/WAURLswH4NaXb9Ikyx5hH0FkP4Egidfrbic6KZTm4YBtfHL2gCTcAE96D0qsTyEP/GWd9aOOVjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ec+VVqvT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec+VVqvT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8A51F000E9;
	Tue,  4 Aug 2026 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785829702;
	bh=NWahUvJ869KYcFwOImwjqm6rJ8smONrk+DtdT/9DldY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ec+VVqvT8ZS4ECZoClUqLkK06Smr5R69Pq+jFikyeNXwxq30k1s/kkf41IHV3yruF
	 jR2uOHklLLgd8iT5y92wawagNy/Nm9X1AxTxktqc2dhOzrRrHSaCLTiHZ16ArNAu2/
	 /u1t0JDwkn632r1L4wyKEtR6a4ELqVKykRe7BnyX/47IGx+GvVMtqJvkmqWQThYBX4
	 DZjNFVbxugjj8BqaSum4J7YE7ESsYLRCrAewPhe83IKkpb8c6Ri6Yq7tnXC3QXeW18
	 1z5RdpEL0+8gLnV0p+mZN2h82cj0ijuTUkNIkbZvcv0fv3ZKfJUAsDM5EkPkVFmnPe
	 tpGlg/33rsLDA==
Date: Tue, 4 Aug 2026 09:48:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <20260804-unbeatable-fluffy-galago-bfe282@quoll>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
 <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v2-2-803017e4ba7a@linutronix.de>

On Mon, Aug 03, 2026 at 02:09:25PM +0200, Gregor Herburger wrote:
> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> and in a c Stepping. There are two separate dts files. The
> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> the d Stepping. The d stepping does not set its own compatible/model
> string but uses "raspberrypi,5-model-b".
> 
> These two steppings are not compatible. Booting with the wrong dtb file

Not compatible but...

> causes a crash at boot.
> 
> Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
> distinguish between those two steppings.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> index 127be0fc27c2..11a38cd53401 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> @@ -3,6 +3,11 @@
>  
>  #include "bcm2712-rpi-5-b.dts"
>  
> +/ {
> +	compatible = "raspberrypi,5-model-b-d0", "raspberrypi,5-model-b", "brcm,bcm2712";

this tells they are compatible. If compatibility was wrong since the
beginning, you do not have to preserve the ABI.

Best regards,
Krzysztof

