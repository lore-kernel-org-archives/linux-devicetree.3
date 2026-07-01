Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A37741930D
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902156; cv=none; b=QUtrxIMcM3Kv8inKqNyf7o4LVFO9INFS+rP9RkeJFCXxwWbCXZ76CMlpLbejuC2Xwv+lmgE42H00gSWGrudDKgxt5TVoY80c4sqS4syIOqA3dl3x8Hl1RitTI3m0snt4rIAzrq9qUq39LnCzNkfZAaq2aUmR3JHsuCmd35tW4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902156; c=relaxed/simple;
	bh=ibzGN0UnickCjHY9cF2/FSKFRK1vfLPRIBwk5Vf6y7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2S16FI6V+lSjq77b67LNUpauEtJACaEmrkryrNbcBv6RFiDpKk9CTr3hlK1nzStB3/ALHsUlh15AkC3Z9UgKPo//aFpvnZMo/gokeyMNf5SX2dM8zjWgPlypwGsnH7w+i/20tzj5FUDr5em1xwo3jusSHFSO2xtoggHldeSxVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3KY1ZzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h3tjlrwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3KY1ZzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h3tjlrwa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8dhY754631
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sp1BW3QUmZcO7rug2uWKHnR0pXWl/4bf/P7UglPwEP4=; b=P3KY1ZzWVReNOhM/
	D6Ye3yqrlxmRkrCYf9SpQ7JO2ZvZR6oI023xwSHtmDaoMdPXlmlrFc/CxspbyGvj
	4gXnqgr0ul3Nru+fOHlI4Lj2jpZIRihUTMKD8jydjfhLLFgnQE4+9fCGk8nmvqDa
	7twj80oGQT72H+bAE3r2nV6HURaY5PzV3ggji37VrRWzEjGtuUILVKYUcanXlb3o
	DvRL8gbW/kMuNseiaKXelCW6j5yUvVpIG5q2HbQzQHWv2iJOmG89l9ClKA5AqZZ8
	LbkxutJaq92h/6dGQx17Uks/kR+hQqS9trB/kcn52rovEUw1whSpJ2+68otN+t9s
	/+lGgw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sqr4y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:35:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f2747d334dso1899516d6.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902153; x=1783506953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sp1BW3QUmZcO7rug2uWKHnR0pXWl/4bf/P7UglPwEP4=;
        b=h3tjlrwaPfH35nOt1IeqzA3Nqs1GQzOwXn/hzTdUUQe02pIoQ96arFpLiSweGgq7x9
         9abxmuL4pB/S7JcqpVAa9ml/H1cl9JOURAEWuQymwjCSt2LuBM2+zZWJqJlx/UCAEt4U
         WILScIdmYzw9tOQkkLPY7/J4Rd4eSegcZBAW0kLJM0JwlvMw6ox3ZgiHYuDdX1Reqj1l
         bF20B83wbat88rgJDR4M0CjGCfI0N5d9luXS8tqTZfYgqCukUYLHPfNQKzEEHlefa6Xa
         LR2CdH7whzFzgyD8QfKKDB24MDgS+s7/KnBUbl0t/7nbjPrOm8yWq6CL0f4YRCcZzyBt
         P8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902153; x=1783506953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sp1BW3QUmZcO7rug2uWKHnR0pXWl/4bf/P7UglPwEP4=;
        b=Yn6shryePyT7ds6N/7y/9JTEDuSaCt6A5BstuMJR7IQ7IQElDqa6oaPEfLZPTJhueU
         o2M2xBrd0OcCAL+IGsezT5ez197Qo+sPg3UPmxkhyCRybNGg+NQn27FQbtkk804oSn3o
         8894PkpPzQo/mA+J+Map2zRjG0Wn5ZmYdOTn0OEVVzXg3UXtt5JJ42yfKaZ9w63afxvl
         rox0yEwrZtHO06FEHWJxzrs5zJRI8Ed9SkxxF5jLGxudFKno2ED7JSvgM5UWj1/Z8qAt
         /cXIX6Kp14QUoXzyl4p4AZH8chi4Qz09i4N3DbPZ5ecS5le+7vk3nXNFAK58tPJHP3ta
         qMZw==
X-Forwarded-Encrypted: i=1; AFNElJ+kX7jxUNAYH9uavoPcI1rVacLGeO6t7PjPWKsv03998MyvRv8bA9yYEll7hQfzodsoefw88D7W6JTY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7j0KtIh09pjQc9jv7X/wi2WCHx7w8H/RzZpOpxW7myMX8b2hg
	P2jAgpGgZongTPZxhU/SC8oifs8wFc82XzIH4W+FFD8WPl6C+EGKxiK4ngjMXHUmWjBMSD1uycB
	h8m5iL/8Rs0kgzpTCmUzds3M2MQlSE/ZwYG420X1P0ZPbR8CFqL+zkEHk/kCpDTm1
X-Gm-Gg: AfdE7clhEmkD+RTVG9bwX0mW4wcn4MTSOB+ESosdQXL/YBn87MckqbTDlFD+hMZi8ep
	+NMxA/1rDYN7QquJmlxKF0FGXUigneonLXEbMz9OtfWCeyNxyqADvVqEE4I/pc3F2Xwt9IGrSZI
	yzHzpMDDBaXQDVR6pPissDe//UgGNstgj0SSSrjHBWBc4BBjkAmR/mqWRBoRHkLImm8swCH5D/o
	qLt5rPV+cNBxggn+nwCu6ktzbxhWAA1M5oGMlsYnWu7UH8KT+4RGMPFkk++xaGMmEngj1/8lxWH
	kQXOcB5IJDYtHjjkXV6v61LRPi2caTsQuESPNxrIUgMyjUgVW05C5e/6ALUnLPW2qFJj7wfB1Yu
	xKjR/EMZ5yaBDeZ7FeXcPKbYCJJZcUnednaQ=
X-Received: by 2002:a05:620a:4587:b0:920:798b:e290 with SMTP id af79cd13be357-92e7851d0ebmr89817785a.7.1782902152585;
        Wed, 01 Jul 2026 03:35:52 -0700 (PDT)
X-Received: by 2002:a05:620a:4587:b0:920:798b:e290 with SMTP id af79cd13be357-92e7851d0ebmr89814285a.7.1782902152181;
        Wed, 01 Jul 2026 03:35:52 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289176eb0sm255472666b.63.2026.07.01.03.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:35:51 -0700 (PDT)
Message-ID: <2efcd4b6-0a99-4bb2-b428-4cb4805c20d1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:35:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] arm64: dts: qcom: shikra-evk: Add TC9563 PCIe switch
 node for PCIe
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-shikra-upstream-v1-8-e1a721eb8943@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JRWCOho-TI9WPcKF6PEPzU5JgL0be2rw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX/52hd75fb4Mt
 EaCtVfUE25o7ug4DQSJH1Ae4yRdGf3xjsdQkhzzyvzzvOQ6PQi9INtOYylsxaRBpk0ANtprWKNm
 6k4DyM1b85xMF0ZluwlepoiJyFnO24o=
X-Proofpoint-ORIG-GUID: JRWCOho-TI9WPcKF6PEPzU5JgL0be2rw
X-Authority-Analysis: v=2.4 cv=ceHiaHDM c=1 sm=1 tr=0 ts=6a44ed89 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qSWERiRezZrDuvaUYp0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX1gk0C2RRuZh3
 A7HomNK5yvs1FnTM3XKVQO1pw0Vyg/eJoZQoVo1O9ucpxML2txNmZHBrMaRmkgX59L88QNAojyE
 HHW0cu2CUCkDLhKmzG5G81G3XPBgqNHeO04W6GaCx1MKwiL9tlnRaUEq0OSTffxlC0Yv3zjU6Jt
 PIMv0bD4nPYCXhYwRRDG2MHIm76PvACG3YcxX2kAM7S6XkAdzJ6MfO9lwXI8bvvxBxMucJcMR/F
 3n+Zc7+ISD7JHdXERkNDAUFzc/PT0DfQN9JQw80v7QJgfDQSyZ3EDSME5jDwWBZpfEDh0Xn0ReU
 53ijNQN+gaGixRwPrPI029KLv7g8LEPnH5TbuxdJfk6JEbsgD88t3Dfg9HqBtlMnY9kHQNX74V4
 NUh8DZqtZ3CA2e1HTCZESrG284jRG99l6UCRMfBZSrUHWk4TF2HvQmQIt2Vt/pPuP0nHzqXhqCQ
 NiXk2kjBuiwebHYLiYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

On 6/30/26 9:02 PM, Sushrut Shree Trivedi wrote:
> Add a node for the TC9563 PCIe switch connected to PCIe. The switch
> has three downstream ports.Two embedded Ethernet devices are present
> on one of the downstream ports. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, which
> are on by default and are added as fixed regulators. TC9563 can be
> configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

[...]

> +&pcie {
> +	wake-gpios = <&tlmm 119 GPIO_ACTIVE_LOW>;

This property belongs to the port node

Please also mention in the commit message the reason for the
PERST# pin remaining undescribed

Konrad
