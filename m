Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36638A733
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681747; cv=none; b=KWvkuoaIyPq07W00XVQJFGjUKLeQJrJcIIRB1xUA+PdazYbT0snKh+i6WHjgvAA2ktAn46+Ifd/nrh6mxidktoG2Hhke+RlUdgl2AufEowlktF/HY3kWOo0Dl54+wEi3osVoeE+8EkOGoem45NueL0TAR75um/OL/BNKqZzr0bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681747; c=relaxed/simple;
	bh=8XZn89MWbru8bQV6AMh5Gl+Q23Shid6hu2LrME/cXmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnG16bbByGbgWBIe621GrV+0u43qd91dWyw+WIV8OGyPbShKoJl+i60NGZmeEaGEl2EeWOy6oOlM4WjrpY4zhjf0ebNvjhzv/MFnNaEa1tc0Wm+HnDl8PlencvbORvflZfjliXSGbyud3RYVged8jrOB1wGBMtbE7iqF9MHqh2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAh8/W2g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PExMLQag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAh8/W2g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PExMLQag"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91Tsp2281735
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40+cVj4evBO6ID+RLEdSE4gIx3HZwIHC0OLMB2i0UfU=; b=OAh8/W2gjiaSA+KR
	hcy5VXQD0bjZizOf4bFpk08e+q/Q/u3UDbe/M//Jw1d5KlYh7Lbg/gcsSYg5eCY2
	EN4Y+it+wEWOQVQPR05SUn7cZJ9PEkCpyOq9NVcJwcw8p3ZWDNktnKEEuH/nW12P
	FgP+rrVVzELpM1toR4kETpk/lNsuz+J8HVJSAPi/iPKXunArYmH8T7uiyJNDVVHw
	dphnWmBsP8r5Erv3eLFBJ2Tyal4jPkG5dUxWFvRdZSzv59BVVfyj+iPnf4RwsIej
	2wxX6fLl5wk60nlqYIGfNoNVaMbY/0O9hb/zC/Zat9TvO+ACs4rX3V6nnAR0Kz0I
	IbYIbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598c75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:42:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24e9b4d82so33885425ad.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776681744; x=1777286544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40+cVj4evBO6ID+RLEdSE4gIx3HZwIHC0OLMB2i0UfU=;
        b=PExMLQagJS87vLti+jtb3z5e0CnmiROuSuPa8rLYvuJ6zpC6gfrBoonGi6BSOrgi9p
         HFV2swlbq0Ye0v/mwi5XpC9qJNXk/2VeX1QnhpfolRRa1AxQR4s33vV58JxTrSr7c3il
         ApKAMonSNrM+K7IJaDnCvx/6PfCbUjmDUFZngiJcSXDaOG0TQZIaA7byHso2/WdfYTcf
         iJshSYOWzsqUyu4hFE5sE/8OliX2mTRyzQGENjaGHfi5fYTboQL4Tx+if1meNL1EOo5+
         7Q9z8yo4cm2aiPPhGAlgHWtdpJhu+WglS164LjIdO79JU5Lsr7q8j2VwtwEie2asKbv9
         bL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681744; x=1777286544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40+cVj4evBO6ID+RLEdSE4gIx3HZwIHC0OLMB2i0UfU=;
        b=Bgr3d435icoEHhZ8+tnWK+EMUKpVXdtgUrYpUNZmGcbadIvVzx2HxS8DK87Ur02uDS
         zAvQtnE+tPF7QGPzbuYitGCjTA7ENYGcmNCtIrpvAx0eVyR29FjehrY1zCAutaibpZFM
         U27MvI32WkTLnGMNd8WjeJjd5NSsFxDzhVdAo0llhhdWjfhjlbbaqN1ZdtFQWNvzA8Dk
         hfo0sGTTHbnow7Y3yHdzAhdsFTvI5NwlatnEXJskSrHT8dT4RvcNSqui6ESsjPIMq7t3
         VW6Vbx4tUgH+NXQC0422foAGDAG8ZeIj6jaJkT6v8Sv4AixEcn88e5RiTkZq8fI3QRCP
         xjYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8f5+eSgiK/kKSJ7uJo5W14w1UkEjFj9lgueyXgBG0b2rdKn1+FboBNTynjnmPXDKywxnsw+0F1hhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07iFZKabAWcMdXj/5rF+osexkqGuIDplYjaGWX4sDaopx0Csd
	DkM9hqXvM1VmklWxSM3I9e6X2ijMOhY0osQ7jw2yvjriB8oCKkUrZWnDZSE70xUvWLziSE7lpYX
	amEzCTV0POhNR6pnXd/8/03VLlgQwTTIPGw2vuNSM/oclSD+3QFb9C7hNXh5nKImn
X-Gm-Gg: AeBDieujkv4ViQjgFYOFA3zHQkESLlQVmMTtpoEah2u4AKJhnufxzJqaZ0cAvdsIkAT
	GpZD4qlm9hNAdo0vAa01kpXZcbLwrh5TWu+JHLdwxJwcI9Z0ccJrRewI8//5x+dADAsAZoLC6he
	41mduVgpByUaqU79EUpvRRlYrQ4xiwaUx5zy5MvRcfvubTl70+r8FJNIkyirCBRd+VG9LLjUegm
	3W+N5w72vE1Hs5WzMOPgyO6in2O+jEOr8BijKhVe3LV3Fde0gGMBQ9vqDnY5zFA3pNXgwCDU0lg
	p2pRTChHEDusGRbpjkRz6rPMGNU6xDGJksDttEaeqaV0Exu0vJDrRl+BwN/WcKpL3hFSx/7V9YM
	esB5k9J3Q8TNnV8nuJnceNAizMfNPq41R67LxKBTc+LhD5ic1r6OjSvEpFcM6
X-Received: by 2002:a05:6a21:790b:b0:3a0:c285:e511 with SMTP id adf61e73a8af0-3a0c285f10bmr3732458637.24.1776681743844;
        Mon, 20 Apr 2026 03:42:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:790b:b0:3a0:c285:e511 with SMTP id adf61e73a8af0-3a0c285f10bmr3732438637.24.1776681743390;
        Mon, 20 Apr 2026 03:42:23 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981d00sm10066770b3a.5.2026.04.20.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 03:42:22 -0700 (PDT)
Message-ID: <03861088-a1d9-4bc3-8882-755860db9c89@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 16:12:18 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-0-f6c7ab3c889a@mainlining.org>
 <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-3-f6c7ab3c889a@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260420-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v2-3-f6c7ab3c889a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _xbFQvEiQ3kCgVGsx8Ri4cdfLW-7tvFh
X-Proofpoint-GUID: _xbFQvEiQ3kCgVGsx8Ri4cdfLW-7tvFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEwNCBTYWx0ZWRfXxj6h44/ibh6n
 sFUkqDywvL0TCG7ubPVQcC8ReD1B+0ej0dfuAHdUEfkj30htJL/PzkV8dFEzbeVJUrMWZUY32d6
 Tgawu0sYq3Rphh05StzPTdO0WDeIQgGaJXYK8LbXciJEvAbUUX8V4+oiPIZgtFuZ0hcWhtpc9FT
 Va6X40jS186rsD6Oyl19ScZhlqrlk0MQ6h3WfLMOBMIMwLBMNQe6uNz93Gl1kXH0KhHe6lOJ+hi
 OpymxB5Q42qK4VKuuvhxnDo/TH+y/hu0yUu6h0zfZ+BUV2nq/lWfMpROro0/CWcoYWlXB48hwHo
 VsstaQ4MxWhTXqIAFk/RSiDf01W0avAbpMx11038baJfsNRz+B3x3l8Je2U/E0dttnN45nF4q9S
 nuvVSKPBpfy9F67//1mbgYfmq/0YnLtuFlKAJQlkrc0VCNKiqs2xPDRUFj7wNrLeLlXby3ImdTW
 zoyZwhei/6nYqtRFOLA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e60310 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=_9h3uwt7-hqOWLc0GMEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200104

On 20-04-2026 15:12, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 4b47efdb57b2..2dc53814aa55 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2455,6 +2455,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +							  QCOM_SCM_VMID_ADSP_HEAP>;
align this line with <
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 

