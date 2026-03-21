Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9C375AB3;
	Sat, 21 Mar 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774075941; cv=none; b=nF5jcmb+hGBx3oHG3I7FN92C5RDKJe/PFx5vme1/8Br8dAUwbjkcTDStEDidd6RsbaqxMrMVhLssaTSaXLfLnbFiyHyi+bl7XszifOb4nuZfu2+ngq6pdN/67lpDrMOYpOvPmneA9ITLKsn3E0KS6zk6qLOvWWcul/MTR6kmKWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774075941; c=relaxed/simple;
	bh=5hN8GNC2UeiHkYN2VzH3Ub88aNzFIU2LqylzWXKFvvc=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=LL49yFk41+ee65WnId450IE/mQ4jFYmx/6ic4ZsBYRttev+Z09tLcIswWY1KOtL7L970998KqY7CxIYBBL9QJtNQG05peOJ3FcKxId4Q0gL7j8+2w0JSDBN6WaLDZgzCwOm+bXX/wi+TkuGG/CdcCC4O9wHbp8lpJH/BdNiEpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=bXlRLg4T; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="bXlRLg4T"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6XtsZWAGk48YVYztLl6cAEeAXe1IPKu+44shW3xOrgY=;
	b=bXlRLg4TwkHJ1RiyPirjTWfv5/n5S1rURH/vmeyW5+fGRIJyT/9Tn3N9jAjgAIOuIQ8tBZJXP
	znGmNesxk+8dCkNGKaXeT3O4ep0JEHioF+3VlwVUpvWyAAOHGftOFPTcGLKJcgwu2WqaiOXIbTT
	bNj3OjIPrtPri/qeurXk6iU=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fd92R746Kz12LFf;
	Sat, 21 Mar 2026 14:46:39 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id B41F940567;
	Sat, 21 Mar 2026 14:52:09 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:52:09 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 21 Mar 2026 14:52:09 +0800
Message-ID: <69BE4018.6020600@hisilicon.com>
Date: Sat, 21 Mar 2026 14:52:08 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Shawn Guo <shawnguo@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3798cv200: Add missing dma-ranges
References: <20260227072210.1350159-1-shawnguo@kernel.org>
In-Reply-To: <20260227072210.1350159-1-shawnguo@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi Shawn,

On 2026/2/27 15:22, Shawn Guo wrote:
> Reboot starts failing on Poplar since commit 8424ecdde7df ("arm64: mm:
> Set ZONE_DMA size based on devicetree's dma-ranges"), which effectively
> changes zone_dma_bits from 30 to 32 for arm64 platforms that do not
> properly define dma-ranges in device tree.  It's unclear how Poplar reboot
> gets broken by this change exactly, but a dma-ranges limiting zone_dma to
> the first 1 GB fixes the regression.
> 
> Fixes: 2f20182ed670 ("arm64: dts: hisilicon: add dts files for hi3798cv200-poplar board")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> index f6bc001c3832..2f4ad5da5e33 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi
> @@ -122,6 +122,7 @@ soc: soc@f0000000 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0x0 0x0 0xf0000000 0x10000000>;
> +		dma-ranges = <0x0 0x0 0x0 0x40000000>;
>  
>  		crg: clock-reset-controller@8a22000 {
>  			compatible = "hisilicon,hi3798cv200-crg", "syscon", "simple-mfd";
> 

Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei
