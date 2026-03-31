Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7587B3E2758
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964239; cv=none; b=VMrcXVNEQHHanuv+NAc2aNlAbHlfBfkiGOWFdQ9cdVUttlDz0Jjgm662HlsFPWJc2+EwzlNvcRz+XtZ4JRj8eUhmu6DGCYtZWq4lct2bvAcQi8HHVCD9p0LbvEqW41Fb9x49JvtYQrU8WZviGjgMnJ7OK0Zck6sy2p0sgP3+6/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964239; c=relaxed/simple;
	bh=GFKlivnfFDiOn9cyPuw+fFKjZ45ioQooErK2zXqHbXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4Rbg79SHvoF8ZQ+nogYDgj7PfPC9TRNxbsJ1kASH4+i/IUYlqNVFMr6BpIRRz5uVQjaj8ygvRfvr8WjZTMNiFWUqV1v6Hj4jP5m4+m4TxzPtOXT593h/iDVKYlTrmRNO1sAkMlaCqhLzvl73sHaPt/J9sGqp9D8Vodq09koUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMC8TqSU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INciBXNY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMC8TqSU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INciBXNY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V81Dec430980
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWjDQhyp71MI20S0T4dy1GKstt/menChSWcPwdT/rr4=; b=bMC8TqSUuUqlVitA
	y8PWKhEF7rvX3g9DCu4JrFXGgRHMeEQ6n8ugtgiWQLRnJxlqSf68i+/DzmsGrXsA
	67v2Hxt0je6jb3Xj7frTEQIw5+06KfUhuh7Lg7XwW5noh1guSF3gbYLFFym5zSPY
	g/3FAr4FDbQRdJNCTR/zPzx/fOcOh7Qn+LD671a9SAaS7ocTaTNpe788O6kdfHAF
	ncIS54hDXIpGLt+kaTLd9OMUq1Oi+3TNrMNRo1hsBx7cfyYYaQ/2Ajnup/LLKvQ5
	sFHloeixGz5I0j6k/XwbrLKfcECLcln8huDhHFJd36ahJIFP676r847Y1Ao8yLgk
	ozatdg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d84bfjqq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:37:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50947db2e97so15434351cf.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774964234; x=1775569034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZWjDQhyp71MI20S0T4dy1GKstt/menChSWcPwdT/rr4=;
        b=INciBXNYp8WWCuLLBuRh9uX7DW7LppqtA8HcIEjLZj3suYkK5uZ5h9YT+d3xHSQ5oe
         8JGvacz9NXZa9+nUzv+X5WQTOaS63s/xQVycY+qiTzKTAxAvoiytDPgwThNSs/h6phPN
         kVGaPJbWvr0N3uOSlHPTi6y5Q6Pz6Q8vk19CBtZmhZ9pR+0gCwAasg1jMRJxh8dJQ2+a
         ghBevZ17+2FkVp/14WM5b0XjzXMGzzOsMdzd/J2yDhVgEDh19QTr6CbXIrEewPs9NMFD
         V+ajBo0ksIcoKHf4lZDntuW79z4H/kxe8WT4rDrzTMqoUrkGT71lKBPA22n3B/8cSnxr
         gkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774964234; x=1775569034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWjDQhyp71MI20S0T4dy1GKstt/menChSWcPwdT/rr4=;
        b=hnkwn6Pnt+1Zq26kD37BESitso1/rQ+ABap9urggcNNKSJegq+TA1+K8NqdlApq+F7
         t1MJFzlQzYKp3FlvWrjV6HPnHuLumizSexlMoZSozDajuG21SBD3NwBtQjGQ2ZivG+Pn
         LFc4MgD8292R4TrgzIXZ0gNnkM9kzZ9Wbxxu8IzvT6mlAhvLgZT7vqX9RewmSXOpvSUx
         bjTPznmZaXViZvCRl95RQ0nP9mkUHSY2F2MIybVlS+hu/JY5wzPG9+P9bNW6IVYSg0up
         aycQXANCZXjqMaMlTXr0uoCbQ8zlR9oGh/CrHsWsJECOE9x7e+zD866T9mBFmiJKoJqB
         qXIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnUpcQVTyuWr15BR+mlNdT6p/ys5rU4i9xYdISXksMyoM9oYHMFz7Qlbm0N4KND+9YVba7XnYS1lmU@vger.kernel.org
X-Gm-Message-State: AOJu0YzeJi7nPRcL4itKr0gINKAeVtbDlG/W7lfFyE8CefeXPiD3pyXB
	cIXFy9cB8bUfRRrfb9GsgzqcBgsw8flzPu/gxKmZIDuHJGlYEf4BY82RrbN9fJPU0K+7HPSNVsi
	lLVLi/m7EDiLSthei4oRzT8MG0MbxPyNL45UIoiwfsj3DnDEN+hfTwPfRaLxHU5MD
X-Gm-Gg: ATEYQzw8TPIRH5DZnRCxgFEm1XAMBE7PGIV04IAiDYLEbHjzGIpMgB1KXcXKBySyC+f
	dVvEEoGjJD01GN6ZEg4V9pqV8y6gEh0h61IhiVDDzOvxfqqX3o4Ino08gQmhSzK0sEiuCPHd4Gy
	KI1BYBmcPB2XnQheCRrdZRG5RwZB1nUZQU14/VRSSnVSOoj9PQfnacM5LPcEElG9M+MsI1U0wIw
	AgVYzgJNyEh8JOPmb/PRHYDw7pH1mL6gpJT5el2ZSXS17BfN5RpiiuY7Ebn0upe4scw922kdBfj
	O+G8+/UmeRRpj3E6XIWyrJgEko5JKPvXmet3/CElFtrojzik5co4Pk9HgVT9rqU0X/bmBZj0DR2
	nk2AAS9hNA0B/9Et19yQduwrelxb3yba4wbqvYllraO9OVMnZKJvEQeYP88HUj2M6ybq+mPDVfB
	wAzhI=
X-Received: by 2002:ac8:7c53:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50ba3819907mr171956421cf.1.1774964234330;
        Tue, 31 Mar 2026 06:37:14 -0700 (PDT)
X-Received: by 2002:ac8:7c53:0:b0:509:47e2:9df3 with SMTP id d75a77b69052e-50ba3819907mr171955411cf.1.1774964232959;
        Tue, 31 Mar 2026 06:37:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72978cf2sm3560420a12.8.2026.03.31.06.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:37:11 -0700 (PDT)
Message-ID: <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 15:37:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=INwPywvG c=1 sm=1 tr=0 ts=69cbce0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iyPJuOvhaBYjIUodIMAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzMiBTYWx0ZWRfXy/o1SQqCt4D2
 WI2ZyozTcAKFgegvYZXq9AkjQrP0tJjCAkcdYtiEH0O+QEU8HyqdyIlqdcXtqBvsr8M+oujCcKg
 PE8AycJDWMPDGxcv2nFHGVUjfi0igAFtEo55gzHT2jkd2fFkJ+54lzmqv81EW4Z9zQ0LsLnXTGx
 mT0XPMll72gguX7W7ZiLDSq1NBr3w6rNxde7+A9anipI3N56xYQbKXM0zm1/KGrmvlbTJchJPD+
 q8x48V+94WjZVwlms6cCaSWWBWSRbF/w+VrdumnJ70KK71PzrnYJP5bB+TZPr/xQ10aiqvUTMyU
 pzYV1GfiXEslWqy4cPx/vme5FBOn/PeQFsPI7W2IC7bWJDcYlwTc6sMTwCzXMuAJf95w4Srq+d3
 NnFDHUcilCdXB2dA1DphzMoLOMkQEACH9XAYrRcAWYf1YMS6dlgyqvgIGP9Nqkkbe0sqy9fXRW4
 uhUM9ysmI1DGxt/nJ9Q==
X-Proofpoint-GUID: xUsPUBt7_2TAzw97QSQruYNREEv6ee5M
X-Proofpoint-ORIG-GUID: xUsPUBt7_2TAzw97QSQruYNREEv6ee5M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310132

On 3/31/26 12:37 PM, Abel Vesa wrote:
> Describe the ADSP remoteproc node along with its dependencies, including
> the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> 
> The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> combo PHY and an SNPS eUSB2 PHY. Describe them.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		usb_hsphy: phy@88e3000 {
> +			compatible = "qcom,eliza-snps-eusb2-phy",
> +				     "qcom,sm8550-snps-eusb2-phy";
> +			reg = <0x0 0x088e3000 0x0 0x154>;
> +			#phy-cells = <0>;
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;

This is TCSR_USB2_CLKREF_EN


> +		usb: usb@a600000 {
> +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";

Does the device suspend and resume successfully?

Konrad
