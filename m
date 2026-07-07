Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA06C390C84;
	Tue,  7 Jul 2026 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415571; cv=none; b=a4XV2Cou5tXdTYzrNEyceuRUB+2n/MZm2Q2j7+y7CA8s+GT4QuGSvqZTSHvyuBbCQemVruesIc8nT2QvY01XtEZkXG0sEUbji6lFHVD0AlZkQorxbwO36Y4rJ5CkOZwrUowLuDYYsS0RZSEQ2zdxQtcx8cAbMaR0B5TKk4KvfkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415571; c=relaxed/simple;
	bh=d6xUVhdl9Yc1Ig8QnEf4pI4GJ5y5m437TgylJ9F7094=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type; b=t0JbH3I3fize4cmiQoOjSDTriTiQDH96ef0vG+XniPxqGslk2kA/hye0o39dFfEB4W8mmNvySuiISKjgfPHZm49xFAW+hqSfrgGuTlu6hL9CLeA1o8aZQH1iO7vScxY6MEpGuZobCerXPtfQ2/iluUV3rThfRlv+AfhJB2ab40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=dCEr1IrE; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="dCEr1IrE"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SvRq5CdKRK+cXuPIl01vwgEHpAzifmdPRhufpqKIi68=;
	b=dCEr1IrECrVxXkkww71i9eXle7zGxMWVmIeugpng72TeD4oJpSaX53iRVOsawEEzVpdRNkpiB
	EEjQkTHpJnuV3+PTt2SjX0qAcoYnZGLK6mZmpWcFVIdeP/EJBv+N6rm9S9zWHuIpsv4CZYQZM8c
	rpLLp3fo/zqlgxG2d2uoQDo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gvZyg4qhZzcb3P;
	Tue,  7 Jul 2026 17:03:39 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 082D240538;
	Tue,  7 Jul 2026 17:12:41 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:12:40 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:12:40 +0800
Message-ID: <6A4CC307.5000606@hisilicon.com>
Date: Tue, 7 Jul 2026 17:12:39 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3798cv200: Drop unused clock-names
 and reset-names
References: <20260625091335.106951-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260625091335.106951-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi Krzysztof, 

On 2026/6/25 17:13, Krzysztof Kozlowski wrote:
> Neither Linux drivers nor DT bindings ever described or used clock-names
> and reset-names for this SoC.  The binding allows clock-names only for
> atmel,at91sam9g45-ehci and atmel,at91rm9200-ohci, but not for HiSilicon.
> reset-names were never allowed.
> 
> Drop them from DTS to fix dtbs_check warnings:
> 
>   hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): False schema does not allow ['bus', 'clk12', 'clk48']
>   hi3798cv200-poplar.dtb: usb@9880000 (generic-ohci): Unevaluated properties are not allowed ('reset-names' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index 2f4ad5da5e33..e5010c9d4c39 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -633,9 +633,7 @@ ohci: usb@9880000 {
>  			clocks = <&crg HISTB_USB2_BUS_CLK>,
>  				 <&crg HISTB_USB2_12M_CLK>,
>  				 <&crg HISTB_USB2_48M_CLK>;
> -			clock-names = "bus", "clk12", "clk48";
>  			resets = <&crg 0xb8 12>;
> -			reset-names = "bus";
>  			phys = <&usb2_phy1_port0>;
>  			phy-names = "usb";
>  			status = "disabled";
> @@ -648,11 +646,9 @@ ehci: usb@9890000 {
>  			clocks = <&crg HISTB_USB2_BUS_CLK>,
>  				 <&crg HISTB_USB2_PHY_CLK>,
>  				 <&crg HISTB_USB2_UTMI_CLK>;
> -			clock-names = "bus", "phy", "utmi";
>  			resets = <&crg 0xb8 12>,
>  				 <&crg 0xb8 16>,
>  				 <&crg 0xb8 13>;
> -			reset-names = "bus", "phy", "utmi";
>  			phys = <&usb2_phy1_port0>;
>  			phy-names = "usb";
>  			status = "disabled";
> 


Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei
