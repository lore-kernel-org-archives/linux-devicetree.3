Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD33D0C09
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537885; cv=none; b=EXSfIoTCLQoNGHHqEEQM2WvNofq01bUQtipgLkqjJWky6lZAaTBpXNTp351vyul9Eq4lp47Ili2hJVE4AxpzGShPCAU+7wT4/4k6+3EYD7r1yo1NXNODMQXXkZifHD82T3W9Q3QeKy74EZCqlHfGQcW5Y+rg4GuLrjhIfudVMyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537885; c=relaxed/simple;
	bh=aeZqJclBZT49HtoK2VISY20DwuQlkaku5yzVolxoX5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WppMvds7dpnthbdMy55fb/kdnUDfdseS9Rlqj++s4lbdnT0VGASOzlSP1R2TA37qcsDLGV7ZuI9O5E5yI0Gp0dnkmyokA9nYcaLywshZifjpUw+fWpXeGOGtn9x3X2Q9OlRbYDw83OzjhTuvQgtLewbJezYw8ApkJSY8xUQZWgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXAfhakj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guMFUAss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXAfhakj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guMFUAss"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7reNk2979859
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKIOBHJU29oE8C/U0GXmXXAsptoRPoNA2oZDBKCXCaQ=; b=iXAfhakjVtPMRftU
	wakDIXTqrt8qk4x5GBUqC1kqhd4va/+9D4/JIOncL36NyfaWHcv1M5cKHYyRytdY
	nRe13lcMtJJ3j/+GUlYdiKwmMgz59sFel1tZT/jcj8mpFFrvruSuLhr2MJ0zjGnr
	jQP5XrtZ2WbNkYXvoCkxecuMXJEAlemOzwFGYWr6w/5c9C/Xf0O7lUidY+oMZrb2
	6+29OzPGikwLFy1swFa4HZg7asLaRiNnU7X3JLz9p8mBP9H+uTQ/wEZkWo/4+Yu7
	cYGC780rcdcN4f8YFCXRxsYMUQ8kJ7CRjg3SgNZMfU6lDA3p2K7yFKjlV83QuQrX
	YdoY6A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg08a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:58:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e777a15so21412171cf.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537883; x=1785142683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKIOBHJU29oE8C/U0GXmXXAsptoRPoNA2oZDBKCXCaQ=;
        b=guMFUAssh42c4MjHjZY1yZMp3amo4AUDoD3U8vw0LTucj57foM8h9KBUmM094+g0eY
         IhMMzNDwlaashkDtNxrxY6tsF2/IbECqzz2Re3aLj7Gx7WE6l1IDQyp9tqSHVnEcWLnF
         VO/24X6kR0Zu9Z4oYFhf73JTBpaCSIE1i2YxquwhhB6Z/GhYtHkX4TDIWqisNkaqva1w
         Xzn4O3HsDIm3f+mFZbTDOjijPV6PvbPDx+9CKyNgkeB3Kc6wY3cxczE4KvZgCJEfo3hf
         S4vnpIDvGvnAOQrGHM95wFGWaEK/UH4JkSuWPOLoL6LqVgaqHFiVNjK+0bD9S1+Ny79l
         SYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537883; x=1785142683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKIOBHJU29oE8C/U0GXmXXAsptoRPoNA2oZDBKCXCaQ=;
        b=kqE8k7jDthHdpGorN5ejnZOMfPu1j636zz7jgQCFx+yXojh4XbG2XZiMOIk8dNDRRr
         Ik1TR2SQ0Wv1vFL4A70wh2z/Cd9RmWhKlbl8Ev1sF7XXyBwKrZJGr9V0EYLV9Gr0N6Xj
         Z83869zPqD6Giswa62uQGtOe1/qVeZiz6inwVSPnZYO3kzJU/n4FIhv/flGBaseOUoBG
         wNGxg6cZKAUKLCfKTa+vDXemrAevYkYj/2LWAJ70TLOAgigo4ywf2zYEWrcNY5Aufn1S
         8QVPOoVl2crG1mNAMaxd7jBL06AWevjZr4oQuVSQWj87W0fsKq4Awwc46QVq3yVCem3E
         beJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW9Th8bHm6zv8b3LZJOIgd7YjBSAkYAISP3ozbIUKcMxjOCPK0Mq6FmPOEhJycjSq9YWIDfcDlENT9@vger.kernel.org
X-Gm-Message-State: AOJu0YweNdjL2JNN89xQAzmcma0ZZNbeg/xbShaOpWeMYBxfP9XCP4OS
	F8L2SzKT3Jalr1UDzWVXSkBzxXBQhQl+Fq7F9yBfb7xsNltfqiiom0qcDhZUtHjGRRjOCtiCSPX
	A4NDkHT5984MBgq0SK9rvFmuSstSTHvJDS9s9dOA4RW2jv+0jVwGBhaWcoYdIAR32
X-Gm-Gg: AfdE7cmNLV+dZE7itQuRV3i6p7QJVK1gn6RXBxYXXY0bZah8+ZnAw2yIwBdvTka7IZo
	Hx5fqnavHn4cwvkSvkzcMrVYPRiAvFN1DktvcUyknz0TLY6675H8iy+e1Rba/XTkhzsEUU25cvT
	+csavkgnUpuUr7MDMLslzDqrSMnTiFmkYIZnRuhh4dU3Jk82zqfJ6joNaoWWKO+ZeBUO04IRN9r
	NQDP3I8BDxkSOchd1/gMgnjVRZaiNL1n7R19yjuozJ+gjynMZGVTQQ0wF/RtS5jIgQe+qPYp2yW
	7SqvqOEMMyBxxgZuiSrjXd+la15CWSWMM556YICnt9YRfrVUhomSF4DhXdbRV16z29FOfUWNmXp
	ty6PApyskzt1B9g9Da4Mr9pvt
X-Received: by 2002:ac8:6145:0:20b0:51a:88bd:95a0 with SMTP id d75a77b69052e-5213c109e32mr75662261cf.1.1784537882775;
        Mon, 20 Jul 2026 01:58:02 -0700 (PDT)
X-Received: by 2002:ac8:6145:0:20b0:51a:88bd:95a0 with SMTP id d75a77b69052e-5213c109e32mr75662201cf.1.1784537882331;
        Mon, 20 Jul 2026 01:58:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4335540a12.30.2026.07.20.01.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:58:01 -0700 (PDT)
Message-ID: <581659e3-9168-42b2-b715-943808d9ae2f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:57:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: Add Kalambo SoC
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-2-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX/g19xCq525sW
 6bBM//FvUm9V1ENbSTh1TXTmcW5F2m7vM1Rq6kgxxW5KFeVt2G5BR9ZXn+Nd/q7ATaBKJwoOw4R
 jntKUlsxPIPG8y4QmLhNCHjKPtrccd0=
X-Proofpoint-GUID: NntAAyziCOiLsQn1zrUfZ-YnAhkmJ10e
X-Proofpoint-ORIG-GUID: NntAAyziCOiLsQn1zrUfZ-YnAhkmJ10e
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5de31b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DNsd2YO3vS8c1Z7_MjAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX0c5OqqXV7cj8
 LkXwN4QTUpexAS8TPGlinsZ8W7owCLF081jsXF9PkzsbraFhpKrvGpaZgUPOp6Wi7sSS+0GkRZX
 hicGBQSGSnmZN9ZqwO3AfutaEONOHPDoBqN9xv2TYJWRvCz+fbUQMh4w+hN7LVDWU+741F6qwY8
 cduDlf8pi05x1n/4xHwVL66wCclgT6P61qjfWT/9gfv3bgTUpClsvelmcbdsTiXiKS/gO5NrLay
 MgYdgLqnHGDcfYzy49DyMf3INi2eUZI/8nbTTSWgyNsdUDtipZngsNuSh935nG30y4GSKvXXsEZ
 EQvQkg4td7Nq8Zw4iI1xKwIBXbseUWuetAWkKYawmRnEOOs2ZaaKga050GQ9inGYG8M1E/acU1v
 uFxk5qAZojv9fYRNidYc4mvowzXOTwCSx+C3X6/CLgOzhV19cNU+epX5rzSb3BsYagoUC3xrenR
 WMjbEixtXqMu/qa8w3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200099

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 removed, leaving it with just cluster 1. As a result,
> the PDP mailbox and SCP low-priority register windows are updated to
> match the reduced CPU complex. Everything else should work as-is.
> 
> Add a label to the Glymur cluster0 cpu-map node to allow its removal on
> derived SoCs.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi  |  2 +-
>  arch/arm64/boot/dts/qcom/kalambo.dtsi | 29 +++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 55d91c696a3a..f2feef362be5 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -275,7 +275,7 @@ cpu17: cpu@20500 {
>  		};
>  
>  		cpu-map {
> -			cluster0 {
> +			cpu_map_cluster0: cluster0 {

I doubt the code that parses this will be happy about not
being able to start from 'cluster0'



[...]

> +&pdp0_mbox {
> +	reg = <0 0x17610000 0 0x8000>, <0 0x1a980000 0 0x8000>;
> +};

Are you sure about this change?

> +&cpu_scp_lpri1 {
> +	reg = <0x180 0x60>;
> +};

This is specific to old firmware, at least it was on Glymur, I believe..

Konrad
