Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBE030E859
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781440180; cv=none; b=Uf2F5rIsIPfW3jnrMfoYCjshva1jrbSceJWW3EB/na+aTsOKYCqJEwnQ/ZWE2HtadjjlSI/Lu33n8sKfm9PIR05TRgql8Drq32vC8Z1MH1Mdmdp52DgsQDcpYMfJQpzQpZDOt8kGhAZs7cNb2xZYXzUxPyDKcg5jp1u/8Hlv6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781440180; c=relaxed/simple;
	bh=IQSjTyjS8hNRnK0DIocyeVZNIoUq+jWIAPq7VzDKUBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyVzo9fnDL1FNmXsGRsh4Hlr1yJdn9iSn0QhAInOkdCcrlS4UPCbUGd8g0CwSM6PjUMVMZQdIXNqyw4MBK4QiPOmk1lY/Oj6959Q+Z1edovNdKRP2XCsu1KiqGZIES8IU8HvlTs5saWAlLgCmN1z1lA/rg9O4WEhxShGACHurEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iskren.info; spf=pass smtp.mailfrom=iskren.info; dkim=pass (2048-bit key) header.d=iskren.info header.i=@iskren.info header.b=ZSydUS+S; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=LDs6mJtg; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iskren.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iskren.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iskren.info header.i=@iskren.info header.b="ZSydUS+S";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="LDs6mJtg"
DKIM-Signature: a=rsa-sha256; b=ZSydUS+Sxie6wgLyavL9/rY2x92XkLI3EbPlJg5Cngk1W+nE0fsSiX/N1hr3/+UkE/ben6P39PwFQqdRJZWjPjjZl4YqwSplchi6Mc0JUE42c0lrJ3uegEMuvqe3R+yDyol+PnzbtaZzK5Wku7PL4P5iWkVKVXqAWCM1onSUFUnj4tryl3y8f9EfZ16G3n1lkYPZ5Iq+uA0dvkkB1EjWlbFBGsVyxkIHuNUQJiKiFKcWH8qWMh1luf4ZAV16VmoSG0RhR/koEj3svakZBPS7s69hL+yDQUKqfVHaeJ5rb/aKQzlHocvNCgC5qzAencLqKeCkPOdl3MsRhBr8TTFZyg==; s=purelymail3; d=iskren.info; v=1; bh=IQSjTyjS8hNRnK0DIocyeVZNIoUq+jWIAPq7VzDKUBw=; h=Received:Date:Subject:To:From;
DKIM-Signature: a=rsa-sha256; b=LDs6mJtg4ZpamSh30QeGss5dT/n2Kxd13MjMHysYnhchh/ISMmgxnS3rd69WxYLnmTIljo1+uVQuuXxQa6Nyxgk9kUcbt1rD6v832bI6n9EGSEsQ38Yypnb7ZfQkABFuYEnCYSQzt0lh0B3DV5oEkA/G41cMP2VjLoettsadc8R6wydcttNAs0HudfiVWnBvZpo+tq4U52/3WIqx3vtkzmOLBx/IL65QX5kE0iNt8lLIowkSD81iwfMmcC9aPejYXRyTZJkfB9W8nZPi4sIk+tO6ynpeMqgeM5EK1ipu28TsATz/GacRJttZQuIauoMFaNrkvEqKS0ku4VeL+erLLA==; s=purelymail3; d=purelymail.com; v=1; bh=IQSjTyjS8hNRnK0DIocyeVZNIoUq+jWIAPq7VzDKUBw=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 10275:2339:null:purelymail
X-Pm-Original-To: devicetree@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1565696518;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sun, 14 Jun 2026 12:29:11 +0000 (UTC)
Message-ID: <5b474af3-f651-4a64-a5b9-c18136e589eb@iskren.info>
Date: Sun, 14 Jun 2026 15:29:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] phy: qcom-qusb2: Fix SM6115 init sequence
To: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Content-Language: en-US
From: Iskren Chernev <me@iskren.info>
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-2-d7135980e78f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/26 3:04 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.

They came from DTB extracted from a running billie2 (OnePlus Nord N100):
[1] 
https://mainlining.dev/wp-content/uploads/2021/02/03_dtbdump_Qualcomm_Technologies_Inc._Bengal_SoC.dts 


The phone was bough early after launch, so it could have been 
wrong/updated later.

> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index eb93015be841..c304ccd9f31f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -233,9 +233,9 @@ static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
>   
>   static const struct qusb2_phy_init_tbl sm6115_init_tbl[] = {
>   	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xf8),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x53),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0xb3),
>   	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE3, 0x81),
> -	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0x17),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE4, 0xc0),
>   
>   	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
>   	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
> 

