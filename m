Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2804B2882C5;
	Tue,  7 Jul 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415608; cv=none; b=ZwzpIgR1x7lqbc/OiMs7c5+NJNCQbL4aSZc5mQH90NdUL5Xp9JmgO45a3CETNMx5pHBkVft4FRHSk4ZgHpWizSO8xOEWK2vnMkpVwj6MPKHCXS9nXrRv0HT79bxZMHDU1haa9zeWqC6dvAzxLppibXvYOs/yrGaaPF7lDy/sOZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415608; c=relaxed/simple;
	bh=eFECJNugRKZbuL6n1U9lqwBREck9LY3aB0HHjAcbHMw=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type; b=TX71mXzHivgqTAX+anzDBZMP4zGdz7ku2ot/CpcZp+NeJDVecAF+Y2Dhvmjow8ggeP3wEvHpzRi2Fjdlx559ogFnyIm+tjipc9TcAgfpruNYOXizf/LKDMiGij+rleBxD1jmGssH7e9W/TImCQBZ2LbFtXmrLsv02bAhZw8ielk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CetOCQdF; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CetOCQdF"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aSekE6dvDeDQvelifwwcLmL8oUBRYHW/qRvmMWTd8K4=;
	b=CetOCQdFLf5hS4eNAV/98ZiKXKBd981ByPNc+SE0+7EnCqcIoMxOCf+ylYODrZsr3R99Z1g4d
	kElsizsa7U4jMmAbcNN0jgCHoSp5JaUzW2lxSxoqqXllw4GggXlO3G8Y/J0+lLYqQSoITA/WkYH
	UqYQ3jb3MWaf7YU5KG4ex0g=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gvZzH2CTBzRhRF;
	Tue,  7 Jul 2026 17:04:11 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 6CCA440561;
	Tue,  7 Jul 2026 17:13:23 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:13:23 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 7 Jul 2026 17:13:22 +0800
Message-ID: <6A4CC332.3000906@hisilicon.com>
Date: Tue, 7 Jul 2026 17:13:22 +0800
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
Subject: Re: [PATCH] arm64: dts: hisilicon: Correct indentation
References: <20260706093500.273922-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093500.273922-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi Krzysztof,

On 2026/7/6 17:35, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hip05.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hip05.dtsi b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
> index d0912ca5f237..2d376b3d30dd 100644
> --- a/arch/arm64/boot/dts/hisilicon/hip05.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hip05.dtsi
> @@ -236,13 +236,13 @@ cluster3_l2: l2-cache3 {
>  
>  	gic: interrupt-controller@8d000000 {
>  		compatible = "arm,gic-v3";
> -                #interrupt-cells = <3>;
> -                #address-cells = <2>;
> -                #size-cells = <2>;
> -                ranges;
> -                interrupt-controller;
> -                #redistributor-regions = <1>;
> -                redistributor-stride = <0x0 0x30000>;
> +		#interrupt-cells = <3>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		interrupt-controller;
> +		#redistributor-regions = <1>;
> +		redistributor-stride = <0x0 0x30000>;
>  		reg = <0x0 0x8d000000 0 0x10000>,	/* GICD */
>  		      <0x0 0x8d100000 0 0x300000>,	/* GICR */
>  		      <0x0 0xfe000000 0 0x10000>,	/* GICC */
> 

Applied to the HiSilicon arm64 dt tree.
Thanks!

Best Regards,
Wei
