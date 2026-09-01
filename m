Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C14A368D74
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268679; cv=none; b=c8RTf0nHAb4VFy1xZBFRw0iu1Fzm/j4ySAHXNMQAtgIRmn0T0xlSrk2lZ1mj98b+JJDw42rowAttS6kLrhUrhU6j8UZuApJUyuhYlqSdU8A4u6xAGl9pEeAqewop4VmLsVqU8m/WQPz0UXIRg1PaDcGfsXGrkMjrjzs3dkS/AdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268679; c=relaxed/simple;
	bh=vaanBrWBtt/K9qjvJi2FisIQaJGmMcAWPsrvdyQ2gEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWM/AwB5ebFksCMEIGrZOXbu2ttABlKBShQIhzmDIr/19pA6LcCdlz0xOHAAQ6qQcCGC9KWA3D3T7TLpeNZM7HCG5muNLY+TOfPeXh63taSF0s2yjvQb9//JMi8sckAIFg52HIpn9FqKDMc1tFt/w3WI3wu86aGwmiIDh1Q5XMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uc1AAPkC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PfcBaIQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uc1AAPkC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PfcBaIQD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJoZ31767575
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=; b=Uc1AAPkCq8yaPHNb
	K1v5peehXwLRGrA91Ar2dWf73/ZrMNfIqgFj04Cvkzo+qj7RAbUoGXUiYuQb+CD4
	Fm2OxH9BmijnVtpvFkMq2FH0i8v3K7c+Dy93rnZGxUQ9+3u5pcKSq6+ykSWt1kMZ
	3JGcj8C8tmt4+r1lRDeqOm0DHNfraXlQeSqPXmAdzZA5Y8xpIT0nZx5dWtsVjbVy
	dsLzsHJhdJ7br9l6Q3a8q1loCUuaYlRFwk04pSiUCQYmFS8SbH6RT1NmFs9E+LiN
	HYnH3v09g4IJiwaLgwOkVMPZTWTB47AhXEgFxgw5LIXZ3J7iQgCKKRlBz2fxkj21
	RsqITw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3crw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:17:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7570225606dso117420137.3
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268676; x=1788873476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=PfcBaIQDRMz4463xfzKr+VmNR0WNvf/U+y0O/t05NmmWL1OIrShtMBqtcZr171K4Ho
         Vs83QWcCVbJX4n6R1QTPGf2eOXeO3gx1RzlJTiKe6fJBUesuonfPKsk3sRnCrI2Q9TJU
         tJG/1qpGzRsrm2lsXDik0mNgzY5n0Msp+iy7ybhZybVq24CURHsdt339ABgwXcxgx7WA
         ojAsvgQh2eqKX9G1AZmKtrYwGJxBSv34cKHgc26OvzjqKgC9VlKETzadrl3qdfYzJ0rm
         SLRhzdS35SuRAGnXePo6vNh1KZ6vTrTHmpCeGaq0rFKchiOP2n+6ox1sWporJqeV4ELp
         6NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268676; x=1788873476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOER/48Fz+cCbdlM/AT+CckMCyjyIwiBkZBX+c/Jivw=;
        b=sZMDMQ1mYv2LR3IzKP2SGvm8T+upUTO8AHJiBfdUz5Y+osaagr4917iSGg6sA00UTU
         21AZ9okRLnsdl5Vymx9SGb07fP02WNaqTyfBSt2LxHQTfpZOfO3Zot+S7/QAR0RrUNlm
         GZS3yAfhxEnvPjp4DZ4V0MKqOZYZam77JUjjq7QpQ+uKGW6ZZxTaJ28Ldv0sOlDXEK2m
         Yr1sn5IbO0w3A/Xe4XihLVNoi8khJXB9yYa6djuk/B7K7qaDJuW9/5a9nwOqFZbtN3mX
         2Lm6lp5D7YD4dGlFrEb/r5qjKCPwi4UW+kOfZZV6RBQOdIoyKvdrKOt7QVId3WauU/19
         RUTg==
X-Forwarded-Encrypted: i=1; AHgh+RqGXn4rEYkCVrcUhZ5vUO75uvU8gIXwM98jJZjXE9EZ9Y21xDcv6lRnoO+NUgHj5UkxuXJahwV8kfos@vger.kernel.org
X-Gm-Message-State: AFuF++mfn3kAeWzEahTTMPJLDKSD1q4XHvyryTAvNL7CWq7mFssWpdoo
	WxrRH5fv/Dkt71YDmVR/0duIJsIkKROKYJEiKBPCR2YlXPFiSl15InkVGEdbAfK4LGYyJR9PZ3H
	BttOjkgH20wQsfkXUxvVgiDkCczcQ1sUCBVizVAegCNhp9TEbJsoh591g/sVtKnz+
X-Gm-Gg: AR+sD10Sd7+o+2rXftpdNKbk3OjWM0Wb2ieMRBeW/BPWZz2YbP+d9MFgLXrti8bxDGH
	dcTtmiTno4jhtTfg3oYhUh6kW5pp59LttTuX0EZdEFfAJaS4y29BTqnyT4yvXv8jZ49pO2myJXZ
	H6+BSqvlOAq9B2WFdNK0kYSi52yd+rW96QymDXB3aSrwYjH0PSvfpuiC4FAS6npJP4e9Cc6Zfmh
	G4JRej5im2I4j2nmVNdRkU4Z6ak2M49gOSEogoV4kx+LmcBRdDxrT06iKaDjFS/i4fUSrcrFSLU
	utj6CQa4i1PYYk7V4+GQG8Lz0icUgiZicVEjfjwX97yc8YrA7ryTXgCW6ll/DUTNhe/6jQexwDj
	RP0WjBSdiepj6XlcaegWjsg==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422334137.0.1788268676413;
        Tue, 01 Sep 2026 06:17:56 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4422313137.0.1788268675877;
        Tue, 01 Sep 2026 06:17:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89d3e06sm2866547e87.26.2026.09.01.06.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:17:54 -0700 (PDT)
Message-ID: <5e7cc36d-73d6-4040-b62f-88fe2819ab1d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:17:52 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Improve error handling in power_on
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-6-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96d085 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=xCqKcKfuVhzOl_WxAlwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX0hz36ypc/BBz
 EjVOJC+8tiMqHa07/FaYAjj7+QAYp3/jogp3N7kfLYEMCurNyI3RsL248eZ4WhlbnJy6bHWtKB7
 B2DwZwXn29wtgkWCDnJmf6C+mO81nns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX6RmBhXFzj426
 infm9Gh6ubln0welVdPEaZKBPCdYuH/5Z3BICJxlQqJ9A2K9cwRz1sUs/Gc/koIJgJd7FlNHDms
 AIRiQI71xFwfT2IizpzlyCdvOo+wkLYJOfzrZr9iAA6mv2R6P40Yk1Qx7vwdL48CryeK3dt0I53
 aTJaWAqGnrdJpfgltIpQcHV3xKnozfZxc6SMCldaBRBOHY8IPiket5DSfx47931UnnRgJyJhHDX
 cFESV8Cpq4l3o4RpsC5QepHzO7KYov8EHT7Y/GRuIsHHuukzQ6a4LJZDsrh4hIQqFg7pDIE1UnZ
 n70HpI1znn2lrwFQmFjzaVqA3JIZh32Mcj1h88zb3k0ysDQM42i1708pRxIcEH8V50m2wSES672
 3E1H1Kys4bkrXLBa9gqQ0pFTpiVz8wbENBPYA2nTZkd83QTcn7omdZaF86EpZsydc2GWKJB6ekO
 QaWDoJq2jE9dD5YbViQ==
X-Proofpoint-GUID: UhF8VHjdiFa0gW61Ggjmy5T-E1q3P_c8
X-Proofpoint-ORIG-GUID: UhF8VHjdiFa0gW61Ggjmy5T-E1q3P_c8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> When the PHY fails the enable clocks, it leaves the PHY out of reset.
> Fix this by asserting the reset before returning the error.
> 
> In addition, language correct the error messages.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

[...]

>  	ret = clk_bulk_prepare_enable(phy->num_clks, phy->clks);
>  	if (ret) {
> -		dev_err(phy->dev, "clk prepare and enable failed %d\n", ret);
> -		return ret;
> +		dev_err(phy->dev, "failed to enable clocks: %d\n", ret);
> +		goto err_assert_resets;

This is a single-use goto for a single line, just inline it here

Konrad
