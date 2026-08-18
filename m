Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEDA3B6BF4
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048195; cv=none; b=gzmfeTv1l4qwrEqGkDmDjuo1L5ztrWg1kr+KomUFz/lp8w0R53QZcv/6EJaUPdKMHMqpllub5P+BT48tVWGwjrnpdqGYBV5nMSUxOSIfJhXOt0giC3prNh5t9iCc32PHgeCV2xeCZx3Ro19IlgR2hUbBkC1byNYjiRC04iUB+Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048195; c=relaxed/simple;
	bh=NjdeBq83ZgzUZH446kdw0norRIo1mBoehc01XWmr2mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICIwiL5p3IR26dUJ2bjsRBlfXZJ0jsumnmDLs1cddyd5UFf2v/Gx41imad1J2iJhmExsjYTGfNf+akP1bbrdSAtsQcgWyHkV6xq/6WuXfhQhNPAt+i3dOR14iZOEcwH26rDcnF6b3XCITTGikF+PpGg3yeQ5kf2hre2CGvy4dgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgP2Ndtx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuDw8IZ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgP2Ndtx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuDw8IZ3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABXTJ581253
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7gxToVkREhPO6dQI34HddITtzydFov0LPEzCVWHmA0=; b=TgP2Ndtx33vsCXf2
	jHtVVdnOXv/sHLMw1LbpDKjhI7H5PRJaRwJyho/UKK6kRoOPxLvUbLO4ip//A9gu
	xCMqU0pkrcmIvMeXX4GIbNTaDDdr7KH8Wq+dZ6GJP+GzsB4cfgdIiQX7J5teIx9c
	ZTYqswQ4h/mH0vQQbypj9iyRn50tpjNXsm0CvlERw490WIsgC79h5vveamZPhxf9
	e+7NycubgZfVBmB2DOWL1nk3KloM480cCTG3VV0TwP/yJA33tZy+pVoDYJ+YdhXe
	oolWFhvnxMMF0DPvbxLsadQsq6Uu9uO/MYfIDcYht0pYzr1e64KbbD2JKeaMYhS/
	EJcWyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9nm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 10:16:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so949831cf.2
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 03:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787048192; x=1787652992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7gxToVkREhPO6dQI34HddITtzydFov0LPEzCVWHmA0=;
        b=iuDw8IZ3N1FNfaTbiDHdykUk4LFfQ0hMWUvPuJn0xLCcI/b4oh+IU5ZV1EYq0FeYIu
         1G7TDDcH1tc6bgsHKxVadS1kIrZUizQX6nDfqI4Aao0lJE0tUNfEvFkkDoEaKq/GOeFq
         6yQfrkA3zsGWc1sD4D9DcVJ/wvGG82eOPNqj+hzAPnuEwvoEHLB4931ttB0APjplqliE
         KLcNnB2LrvSiw7FYLQ9BZj78a3lEvuYbJctu2+RBkG9jxc1bcGY34t/oogT81jVajtxI
         LvhiMsHoJulGALptAEynorQkOS5AKjBQ99+Tsxpi80ZSTkzA332CR1rdAFan6/8YD1wz
         CEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787048192; x=1787652992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7gxToVkREhPO6dQI34HddITtzydFov0LPEzCVWHmA0=;
        b=eTBYVDlnBw+n7cdKhunjZLhzNrlnun+mkPvKXf4TiifyehQWEay3/qqovdcWSnbYKP
         pZ30dtOjccNEs3HX2ClpsghPvm+uVNTnp21aAnRMQ9HhIyaCGV12Q7wvCYhife6L3b+W
         5D6r3nO7xhBiiwU/kj5tMNKZaawzF6KgzvH/W8G8U2PPIcAqSnGYE9wWPMl17vfuYGlW
         mi9OoQfzHvJBfd0c1PyEljjGE49eQpiePB1s7hlME1ykdeVMgj5mW4MIxfx0pf+8/o9p
         Dbj1CJrPuhy1o6SvXk6hdlr/Z7TD262+ukPJ7B1knzG42tbU1+7RQcAY/P2x2cKDmVIY
         vxlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUrAUYlJZwbc4siVyKk29H+R1Vnv8+QIAMkcNSjJpaAqO9YoE4NwaKnyzSEcNXrQmiSkd3ePBa0kcD@vger.kernel.org
X-Gm-Message-State: AOJu0Yywx1shAuIKDEpPvNZ2Fe5DmV/F4Vag5elLth4lUI4LHfnbGnw9
	WFFUti+vw7fzzvq+BDUP0CSTmP7LIirlwc3HZu87eSfR70Wnx3Z65WD/mElQ66F/nfwHEkXKgR7
	iloFiVZUfD0LyrWkxzHCHTpAuyOFe4Gpua53hBGYG4TZIFo+L1ZUvoAkap9SbHW/XcCiYXoNu
X-Gm-Gg: AR+sD12zDOdXIkDWNp0nPBCD6iNv7kRGOKjiSW21q4p6LdfgP0/a4OFQEaRAezC1eNM
	3neriFnK4jhYmzNtOyWpF8AFJsNX/b8oja8NVBVXD7TgrNItdE7peMIBLtx3z9jC0kx/1jo6EJ+
	mHz+0PB9VOYWTzs/zyhLwYVXcngqtGU5F+wQ8j6JeX5HxbxGmfIEJpV/VGZI7O+iMPBueT51tKb
	Nr8d1Rw0RmhhLfMlFi+El1dTr5F+LiU1z40shtiSIpSf1RekjzB5IJuVp6JOHd3laQOIDMNC6dp
	YhLGTVNTEdEt9EqifWaRh2e2mwIXq7wzoxt6TmYLWIdvXdkKGaJifybk3y1FUcCklg9F5xtG/tc
	pj8bXUxSAmeWSQnzddEymhSdc
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr251850061cf.3.1787048192289;
        Tue, 18 Aug 2026 03:16:32 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:51c:2324:666 with SMTP id d75a77b69052e-52d85425e6fmr251849621cf.3.1787048191916;
        Tue, 18 Aug 2026 03:16:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217ff7e231sm164114966b.20.2026.08.18.03.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:16:31 -0700 (PDT)
Message-ID: <6f11fda5-43ed-46ff-851e-e571be749a31@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:16:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX21iX/FmeSAMz
 3UFGn6nOcDA3OTekEp0YLpAYHJ7vyhdKQVglUFOyHXdMXqXMYLhtRuFospHwwFxesxI+3w+ohNk
 NgrSBjGgAiPRH7nfrOfxYsj/R2OaxkU=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a843101 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7gRAf5yVggz7YA7u_AMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0VdBz3-wj5yO5KlT3v2Uan2Kpp1DzL0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX0ARtSZOLCNMQ
 0xz9aQwosxvYmRSP6XmAWVstcDg2Vrq3IIwelIIttigkvAp3feaaIEU9I8tkAXuQk+uaZRWYLj2
 8zAwBOQmF/FvDKXrwSndPmvYyF3Y9sYwenfFdfynsioeBUTmaLf48p9mJMbRpOAZhsK6i4JIxLs
 JTOy1uE+nq2xH59RKASVkBogEW7MqFIqOWki7nkDpGbIz6eflKe67Ru+dQJHWS1MQr+NEE9/BYJ
 wYmZsSDKWC/dUspPiRlT/C70sYfhcbycN1JsLktcT4T4zGix3clYLPsyUP8gpZqupFSAnhSxoRy
 tHqDPKzSJCLYcnwNd6xle6s/JAGt0j4E3zFWwjL7erYKtP5L70NVR2jISKiQrYf4Sp3BhQrUYFc
 SmReri78JPCDjAsafFfrAvozzv9oWpE+B4bZK0YN3dRsbMjdHgkyf4t8WirzFNY3q37MK3Y61Mm
 qAI4R4zb5n8JVXVCn6Q==
X-Proofpoint-GUID: 0VdBz3-wj5yO5KlT3v2Uan2Kpp1DzL0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180074

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The MSM8974 HSIC USB host - a third Chipidea controller with a
> dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
> described, leaving boards with HSIC-attached hubs or modems without
> upstream support.
> 
> Add the controller and PHY nodes. The PHY is a ULPI bus driver present
> inside the ulpi subnode.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +		usb_hsic: usb@f9a00000 {
> +			compatible = "qcom,ci-hdrc";

I see the driver determines whether the controller is a HSIC one by
querying the compatible string of the PHY.. fancy.. would it be
desirable to have a separate compatible for the controller itself, or
is it more or less the same vs a non-hsic one?

> +			reg = <0xf9a00000 0x200>,
> +			      <0xf9a00200 0x200>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 148 IRQ_TYPE_EDGE_RISING>;
> +			assigned-clocks = <&gcc GCC_USB_HSIC_SYSTEM_CLK>,
> +					  <&gcc GCC_USB_HSIC_CLK>,
> +					  <&gcc GCC_USB_HSIC_IO_CAL_CLK>;
> +			assigned-clock-rates = <75000000>,

Do you have any docs that would detail whether we can run with the
slower, 60 MHz clock here?

> +					       <480000000>,
> +					       <9600000>;
> +			clocks = <&gcc GCC_USB_HSIC_AHB_CLK>,
> +				 <&gcc GCC_USB_HSIC_SYSTEM_CLK>;
> +			clock-names = "iface", "core";
> +			resets = <&gcc GCC_USB_HS_HSIC_BCR>;
> +			reset-names = "core";
> +			power-domains = <&gcc USB_HS_HSIC_GDSC>;
> +			phys = <&usb_hsic_phy>;
> +			phy-names = "usb-phy";
> +			phy_type = "ulpi";
> +			dr_mode = "host";
> +			ahb-burst-config = <0>;

need required-opps

Konrad
