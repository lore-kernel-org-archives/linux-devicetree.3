Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94063A1695
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791520014; cv=none; b=Dk2pUJDF9p1erkw9MGUUvVwac1AYit+k+UXL+6iKYy7TLQBJlpAht2PJ6h+06q6dyT/bNeRtVQnvaBnJQTNDPbLJBcp0qAo69RQSzLmkeuO5l9mG/wDCBbX5+RhJ/6OU1chhmCx96oFl6zukoBRg1xYjN8jC/YV9hjvvjXdQjAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791520014; c=relaxed/simple;
	bh=iHO4b/uaO+gCN+zq2Bsard44BMW+7Do4OTbQ9oIW7i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePD1P/KSdZYxBD6OMHE8C1iaKpWsH3OTfYmTHm7+++DxV18Ivrc7d9MG7/8jZQ1/pUhjnn+b4oAJlao/Z3il0JCFE8xKca8D2B5aimxl9jwGpgaPH4I127hxb4OglApX+llUZ9x7tbz1rIZa1IxJ6kPC/Cq4SDDzkln7HP/fro8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdAWzzNt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsKQCCz1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdAWzzNt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsKQCCz1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8Vh3942587
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 04:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsGEDyIaWW4FbdgRDyevRPLQTh2H5+7i12alkIu6WYw=; b=gdAWzzNtcPZmV0a7
	bwfl5SBDpVIKI31yt36Xq8zLvBJ6/ZqQlFIcx6tXZ/YkYB1jsefLVLld/yHY4aUD
	bP9rz6z2Lu4w1R3dVWIJF0h2XTAxkWL1hw7Wpg+bzVuG5ryn5bDDAgDJjg1kjAOX
	1UPKTXMAMC267AkfyAIYOuzxxcOIjPJ7O+lgRVzEfdGYdBc4YJraco7M1352DwHz
	vYS4xzRLuvDmEYc26bQVyeGYrzY1dcPzzjMDE+5XtulzlyxbTWRmFtvo0KZX1SGg
	rzcRKhBA0yfuHsa1aV6je06BvcFwudenyI4lNtbthjSGvRKnGOouU9een+Grd3Bm
	Mg83lA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk1vua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:26:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so11413792eec.1
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 21:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791520008; x=1792124808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jsGEDyIaWW4FbdgRDyevRPLQTh2H5+7i12alkIu6WYw=;
        b=WsKQCCz1VFspcB9bXA+4WK5tiRnwkIc9ZLoA0l06DeBCeg+2HEON1qIuqvbSV+TC26
         zDCZmHIV9Fxzt+JIX1wu47J1vicf4tD37E1uSeleh+JtHRte99C7jhaAHj3/xpAJUfAc
         /Yw5+hb16mkoevDaUkPUYIt9gV7+ufQORL37BMxrfmmMlF61a83cfeWL18Yoty+EJttN
         eMvtDTlXjPRP/er2idAChSJYTWDwMhdJI47Dh8sluB7KgL88hLTEEhndS6Z7UKre2BRh
         fVsA1oLQXDdpfLnEgJcKnMN+de/lPyEwXBkU2m2K+i7syVfXE7EdGmTPphk+2mGWNi8Q
         XqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791520008; x=1792124808;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jsGEDyIaWW4FbdgRDyevRPLQTh2H5+7i12alkIu6WYw=;
        b=tnANdSRAKSB/XRDqJYTC9NWfYggVZ3J2vAQ/ovrDpyUep0aEIgHh1i8ILMIQjc+eUd
         kvEtilwDaJ0+CSWrG1MvFEsWWXccpkTMpocgwtTbYSZATBJKyE/Wba2ZyrzZj46Uc3On
         UncSPJ0GBFlSPyUCAg9LOqAyWDY10gbB3zdtjOMwIZ5FtSRXmUW58+MSx6VuF6D4i4QZ
         uDAC43LGRBw3uziyBxghEkmUSvcHKG11vpMBWwV4rPNeKul9UGCk+5xJViEaOQya2uxO
         KLzjlHGtmi8d4AXd0BtBUKwR6IHGbh5/8685hLs9h1lfGAyZQngdIYzzrThO6zXfWUL2
         o45Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCZFSCuHVAs6nYQTN8tdIKfv0ZXwydK3OZK/Jg/7fABFZuBm1TuJUR3E5kopz8/yxqpuyY3IOVdb0K@vger.kernel.org
X-Gm-Message-State: AFuF++mWCiUfttJtBypA1iYOGFxyxyRiVFvkd9ulx/Vw1zFd9Uv1LTJf
	EfhxP6yFnn70Ss5o1JhNOg71WaPhy7YspN1ALJBHhMO3u10ZMRLQYcRnsSm34woNtC8996NP4Or
	lse17sU6N1CizFjPVfMmpeot3w/VY0iyUkotnNikqt6KBj1olybGozWPdnkaW/m+H
X-Gm-Gg: AYBFou3YF0cxYiPlQIn1aqvM+dSjLmqDkU5r7MtqPthWCZ1MvIwPblXiatCr+NaUbco
	7DtdVFxcgRmKHDo4YBX6tbYDhLfZDoSfklNCngDtdQddXYK8C47QyYJ0YSUZD2656YswYVsddgy
	r/bhmZ/Q06EALo4S97os/RLyONZ+dhnQn8MrJFrHEiKEPqz3OBHcj2RoiEunFvfRDdRsEFIHBOb
	NivC0vGTbqaA/O2RKwmtMRd/9T49NC9CAnUNuXQ/+lPJ+WRrINauZDCziuwYtmOXvLb/AbY7SKr
	4HQotXOSbAFiORo7cHNExI7PJIN8tMjypoS2NvvKIzYZXkT8+nlaQbmfZSOo+WlrZrtb5erUqQO
	TrRVs4CuDsQalILJihVkw/OQTBQ==
X-Received: by 2002:a05:7022:e888:b0:168:6ad8:e89d with SMTP id a92af1059eb24-16a5dbfe727mr1098610c88.11.1791520008260;
        Thu, 08 Oct 2026 21:26:48 -0700 (PDT)
X-Received: by 2002:a05:7022:e888:b0:168:6ad8:e89d with SMTP id a92af1059eb24-16a5dbfe727mr1098573c88.11.1791520007645;
        Thu, 08 Oct 2026 21:26:47 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm2624403c88.19.2026.10.08.21.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 21:26:46 -0700 (PDT)
Message-ID: <148c0577-8153-44b8-b26f-681b71f62647@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:56:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to
 NEGCC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac86d09 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=k7uThIiA5Jd16I7bieEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: ObxKK9S3qNpm1vF9Ffkz2VnRwr-af2jv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfX3sxeFW5OPqB2
 3vEyNQ6Cd17IJKbSAmvlZO5YSPKFZA2FX29S3cFyOhXyUGrPB4P0rAC8RJkuo+7CYgvjKBq3nf8
 nYxraS7E1U9vm8PoN3Rk3yKir6r0QaU=
X-Proofpoint-ORIG-GUID: ObxKK9S3qNpm1vF9Ffkz2VnRwr-af2jv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxNyBTYWx0ZWRfXypUypBCfhXIl
 lOQgl+tVx0Zuqy+8fbVu4wkrPz7yTgBK+8CUlUWJB7mUTRIppadFCdHFNpeub8Z+LL2hDULADU8
 PTSN4SiJ2B5U7UDhprlb2hGrpMdnF5nsp+GVjhWkjd9yTNfT9CNeVmMYmnavotcwmTgBW6wiUqH
 P0kMFTMkWTlpSUshR5lh3SOxOarbXQEGXrZNQoa0/3kWAvYESCBS0+vVKSBZQ3zYbPGd0nilVHy
 6P9eUcAgMM8hWQynYmYePCrDzgtryKdokjjxlwe7UliRcs6Qeluk+X3fFdtKPF/jqWHHmxb4076
 /QSFrazzW8It+rbukG13Q8AFaF0uzVHxdGJ8P4xbRms3qzC2UYJXuo3y3lP08xthYJ0nsp76Lvv
 j4Ezm0bx8A7SXWYZGgN6xZ602+8eIvGRU3zZ4UibdVA2F+DpANVYQY3z78FqkwTy6YNJ/fkwUO1
 DxMYTNB2gzKcVOTd27Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090017



On 10/8/2026 2:26 PM, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> index 1ab7d9bc3cfe..5cf90c77838e 100644
> --- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -799,9 +799,9 @@ negcc: clock-controller@8900000 {
>  		reg = <0x0 0x08900000 0x0 0xf4200>;
>  		clocks = <&bi_tcxo_div2>,
>  			 <&sleep_clk>,
> -			 <0>,
> -			 <0>,
> -			 <0>,
> +			 <&ufs_mem_phy 0>,
> +			 <&ufs_mem_phy 1>,
> +			 <&ufs_mem_phy 2>,
>  			 <0>,
>  			 <0>;


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

