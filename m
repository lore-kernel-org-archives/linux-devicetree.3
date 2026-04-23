Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58C63C9ED8
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935398; cv=none; b=a6knZ/jW3227Qa+vrVQXtVheMwrZ4ckKGalIzm/OLr3ceQTEaNa9Sm6lR9Cl0rJrOSnWOQocJH6P1ruZLuISjDXUHSvCK1ahsAZ4+i++cl1o+aIYcSzNgnqBWXapuXwb47Cbu3MdFoThqAyMI3tS9MnZeSn2i2+cjcoxL3TajcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935398; c=relaxed/simple;
	bh=AwQFahNGDeUjudI7/2xTDoyVRPp0z+s2cGtF+OXeNfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XaxZOdojxdIChlYzRAM1zheHQpcPncfd0Z0GSrKH7AWeqGLBZPlR37EcpIy2dDXYXAf+yO9P3Fiw+Sc65pxaXpSEOMREPHoLcNL0ReK4iVmWQ+ejcKXE8OV7UkKjzMLsCVnAEic35UZhnqA6xf0lzjGNaQ5fea8H3zwyjcCFhB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pb8sSy7p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brajNyf0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pb8sSy7p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brajNyf0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u3v03768918
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8aFIJ4j5Jz6Z57em9Thh1ZmNsrVhNVdHn/+TPUU1f8=; b=Pb8sSy7pR1D61DW4
	ta1Oa3H69RbhzhJaX2g0K8Vp7fUODVKEEwrsRVTBcYQOH7seaXgJkD9vBJ6SoCEb
	4bzjAfyvqWzNUmOMLuMDIndSdRRZU94NzjlXY4X9jGJ7zy3MWKhwErvI6TipeHnf
	PaM3vY+6PsYQcWNTgqrJXH+r0bj349x6Oj40MeXENqJAjVMKz4kAgUUkmJBfCO9r
	FplpfUKOeOCcuOYUrZ+L2XfKzUY1Oas4r9ByVY+uvKXqGqiml+rsfdo4ovpWnQ+H
	T2GxKoUmPaXulOfNC3fui9VV5ZqA/erZjGBrbITKnrTQmlW11hrFJxa6aO7nOQPz
	FYj+5g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq32kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 09:09:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa366fb79so5603058b3a.2
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776935394; x=1777540194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8aFIJ4j5Jz6Z57em9Thh1ZmNsrVhNVdHn/+TPUU1f8=;
        b=brajNyf0uJ1idU0Fzd1x74sCVzV6LSy4Tv0+CB5uvNP+nJOBAM5TMoMrHishEXgRDN
         l/qwpj09Pn3WMnvKLoG1pffnAzcgiicCOWAXPl4WdkNYqa5BrcC+MJxMa9fVpAgFO1a6
         95siSizNN6wzc4FJ5meqUVKXwGzLcK9HADCq4gYbINuYw+u4Q3793ojrJhAvR9il5ivo
         tA+JKCVoT2btvfbqgpbPHNK3YZuMeQPyneExOrBnQWqCT7aoBRVunPFosIc0b5d55ohh
         qRZfzNOmtQhi+/6HIM2/ceSHUmUwLoAJvbcCzIc8RBxVS9L+09J/2J/LZTi8y4AG3tZR
         ELUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935394; x=1777540194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8aFIJ4j5Jz6Z57em9Thh1ZmNsrVhNVdHn/+TPUU1f8=;
        b=OYe2Cvjmjx4ceyVCtPq2mHvYyvovmyD8b1XKGOikqKMAV1wa2bhw01w3YoaKwwIB5v
         OcRXBVi1lwQqE7zLxWEo/+VV7cCjudriqPpo5MUWIg0Cni25RXm03B0ro9Np+kXgkFFu
         PWD+jCC/wMfqg+2rjolxXn6V10Zb/bD3dk2c5ROUR0w4BiHfqsaFVJ2HPLxRRsSW6gfd
         ARAnOzluXCxMXEF4QMcciAAs7kqTMus55cQELiQu0zL2eg7NIu0tCq9iQ3xHlPRJpUTK
         K59uYJLHVv1/ZZa/46ehOiL+/SUrtR8bv1A4ZL2uxwyJwYlfkfL12/upCrD2Qi8+Ve2o
         tLkg==
X-Forwarded-Encrypted: i=1; AFNElJ+tWDEuYTu44j+/GrnOM7ew5EL1GqYAtSfEr+2w4thuZm9WEeKpyvIP2hvO1x8GUECuBG7LfyBBmAnt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfy7Yv4WZ7ZrEaZLMHsBcH2uoXVRLoOgmrFbu5jOXlzhQMaoul
	EhsCtVmjKPPftqrXKlY/cTB6Vd7DftDCXv7c608NdHJv4Q89DZ1abd6CzK57MlqV4Hb90k9f9dO
	zpp+yi7NyCTNnpdDspkhqU4nEnI8j+O6og6jvPlRNvDzcS/D0UzJJyey/8MfWn5Lc
X-Gm-Gg: AeBDieu8E5VlQ/O2+6F9O35fBjvDvke1cWdjTBO1VhZpBgyQtgF4JZAJoitnUBpBZ5D
	kAnRchJ9YKtPZffQ79fNv9402Is5IVC2LKiXpNehbvj4XnltI7ojMovyjvXCuEjJ2hcYe2npsEj
	vZtxkBNWHYaVavwQAEhY73zt1feLaP5wUof0iFcsNfAbargZ8BcoltUWgB76kKNaCwPvG6D/NnB
	YZ5EgvemsoaRlfvx2661LOYo82jA6ymEuJtoCJdr2uObJU/VOi6t3zPJrsXva+0WOPxW0px/4h9
	QPVMsBYwf2ciPCT1UsDwhPAgOVBERT/fueBQoSDDdbUqlSOclZ0Jw0GUZPZu4/uIBrP3KQwNVgY
	8NmN/GpAXulQO+2yYnZ8GXcSjJNhKQAA7R7bfGoBnpwi8mOjW/H5vS/6+jKfb
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr28147133b3a.21.1776935394164;
        Thu, 23 Apr 2026 02:09:54 -0700 (PDT)
X-Received: by 2002:aa7:88c7:0:b0:82f:42bc:3386 with SMTP id d2e1a72fcca58-82f8c889b28mr28147087b3a.21.1776935393695;
        Thu, 23 Apr 2026 02:09:53 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm24438425b3a.45.2026.04.23.02.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:09:53 -0700 (PDT)
Message-ID: <6da8a5ff-0e13-4be5-b373-71d6ea925e2c@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:39:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
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
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA4OCBTYWx0ZWRfX3quslnWKGECL
 B10t6FUmTKKPquDngauumEkFl0SVnjbK1vWNQRYQqRVbirBkZA+E0hfqkDgCk+0ztmKYPCjDf4a
 vcQtyjT+zTsaX32vmMsAbQTW6yWAzln6LqHtgYAi2D1Bob5l7Hpf5rs8BtYU98lZ7NB9ZUFmWtE
 MPXc8Z94LdEPzbJBJjjVptp5b04Xz7OgoRouUfdSuSv/FrMmxXVkGxLCPPBGPJYv2/KAsieSjeK
 pXMqFamQIqXVU+AOGvdEY+xj7QC+ITcs66IKcc2KFZWSrb7sTqF+Nv9VZhZ5jIpKXpQdz5Nafua
 0rA9GZX7Ye3WGNm3WJhOe4R/7+/HsxGS4U+VA7Jse0SvbzQyuxEkU1BWydKQmxb3+HUBk5ZC5fS
 G+VSMyYqfUcc8syY80fyryRCdaGCbDOx5pPjViVZLmNUBMXPuVHQMFNZ2CMoS33VjtHG1Mqtpa5
 Nk5KdDUMlsjeMs1oV6g==
X-Proofpoint-ORIG-GUID: -OYn_7Cp62J3wZxqsGfUW7cSgR7fP9tm
X-Proofpoint-GUID: -OYn_7Cp62J3wZxqsGfUW7cSgR7fP9tm
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e9e1e3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=SsaAUIoj8nFF_dU8A00A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230088

On 22-04-2026 21:09, Nickolay Goppen wrote:
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
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 36b419dea153..af2bc29ccdad 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -2458,6 +2458,9 @@ fastrpc {
>  					compatible = "qcom,fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  					qcom,non-secure-domain;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 

