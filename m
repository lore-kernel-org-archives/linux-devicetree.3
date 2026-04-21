Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9039C23BCF7
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776745187; cv=none; b=BbNVm/w7nd8gHnanrRs2FtMSe3M3+NAgc2J3dcufvctrUu7rfoo2l4MFhiEFUVIKo+XYwU0nnV+FZnOnxNQNKGSIhSAviALqHs6SC3uEf/PqcncOEcrdQHgT1m6AdQ/V2X4/FnFVq9Cic6CdclvNCiB3Hq5gNcWs5a9lu+xgVcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776745187; c=relaxed/simple;
	bh=S/MQjkfpEEHThR7cbA92TUnpI+4dDVvsU7zpT8ApvpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8HZb97DKbVCFdwb4LO8QdxPx56xWxNGdJ4dB3lBb0dKvGFuDOj0mt0Xb4KFiD+2NrkEclvTXABXqYrkDjkDRRZZ1v2DzD/5TbN7SSZUGbkSlSzCkrhhJeYbU8XjHryyDWD834azwg25No6rfhPZzPXokT6q+mV/xcZBqsQo8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgZadMAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2tJz3q4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgZadMAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2tJz3q4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJOctU1014344
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgkZj8p14OFqDpl5D0zxpdlBxTPKkGk08zNkOauHOzk=; b=FgZadMAzhjyiufc6
	dl8NkEXflBUsTRrE3kJ7Py409CQzMzruHLKxtODgoRmmixr0n8RsPllROC9XbHo6
	tDq9ZAjglKG1crsrP8j5rsHpVJEOeTCZU3PU6uK8+CGpCXLnPZvO5bZpr1E5NMUp
	FXnHag1gsOL8WxNITjvz8/HX/iRO0vcIptd9tdAUN+LdV+KEAjaWtyvw0ReiCoJx
	eY0ALd+xIMOkITzjribbWyez+1uPd1zb+qx3Dv5Qwov5olDSQcsTzIQyTttKCFg+
	Dt025VWT8HU8E107nrtBUTWdTnDpJvCHppsrunFgOm9oJxzc03MtlOM+bzngOU7w
	rfHftw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt901cay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Apr 2026 04:19:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b461b36990so38902965ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 21:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776745185; x=1777349985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgkZj8p14OFqDpl5D0zxpdlBxTPKkGk08zNkOauHOzk=;
        b=W2tJz3q4aaVpy6uSHr2zYy0bIiT5eRoOBT78EkK/8oTgFcRTq4OSsG21NA82tdJUC4
         ALRs2+MkyzbQ+Jd0KHMvp7Pzq9cSyrQfhXmWBCdJTkw1GILOTB6a5q7qm2unT3cPdBg5
         f3WEETk18NHRDWTXK1VlE7JxCn/np9GcEFLW6GnFam8jky425jxChbI63RFId/jOW7RO
         vTc2+NIICetw04lJ/k+D86fojpJwnX5sanycvIiZ67Bg9GwAEVeMjDEpkPg8SzBUxbpF
         cLEQR6QbEJY3F0Cyum2xyaVydNDpC+eh8TNMmbdXcPS1XYzFeuNGZfN7IBq13l+xqo47
         eJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776745185; x=1777349985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgkZj8p14OFqDpl5D0zxpdlBxTPKkGk08zNkOauHOzk=;
        b=Aaew3w2OXITaLZXR4MeMLKUEj8d/yDJOgIH/kp6WMgD1LSYileVnwVnUuliswspvh9
         NGWCpPEHGDS7Fvyz3nAXRM5JvYZrjkaK7eLQU88RXaCaPm0RbXznQJ6xoBx2yd2lca2A
         ek/IzMOFoArHCFDAZSvMZ6xpHyQnWeNohJcRLGmxnkL8TK0M3lw+l/AbpnfZeZbe6wRW
         GbMa2tN+tar4+N7t9h+R3UeeSM54Xe9zlwgvM0+rehLt0bRWGtmP2HgwGSS6kskPlDTi
         bgmpmYB5JrQUySKUShFvpsyJzXyvA5Zkgbqxwd0dI3bM3x+FrXLnp7mNNU1zaFR5X80k
         nWVA==
X-Forwarded-Encrypted: i=1; AFNElJ8oO7E4myP5ZHJSltGy754t2gKmzdegP3SxBl7U+LKrwVgOYjWdwHc33CUjVNJh0F0AnWvuA3PxlJdM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt2l7f+bZ86nhSnCEuHBHotwdbmeRtSb1jdhndV9zkzI4RIcLk
	29WH1kaOAYfNgHBGLukekelIbXAY0SgJH3bPoKO5RGtCV6sIziaI+L7mns0VGSth12520/U751i
	TaxvM8gbUHvIgZ4hASx4E8ymz4mE7LUE3QLCWiXMcnttB0nxaR4+Z0JU5F1hA6tZWHDL+B8w0KN
	c=
X-Gm-Gg: AeBDietmC1mF15josxEpqI+Xsnykii4V2NKwASa00E95ZJEyk4B8ydnJqTTNvQzBrg6
	bkgB+KPHn7twvT3wfHxdP2UHDVhrElNRxp9m2cKZFB9AmZQ54harCI7L6wJvepyjDJFjMBxIs8C
	OoN9P8Fk3eA21EyHSEbw5axalnaKxaAPFTWt+rHrM1VnvFFAyXjN2WzmBKL48S9Iw2hcn9d/jtH
	Ewe2r0rqr7zXehkmWmn+9zb3f2JXcE5EfsAZlFolrEspFmIaxKJyPZO6inD9iNTId2Y5Vsd+CZO
	YJfiMatsMGth8c4kuuOUYUPP9+6m+HLUxFXC2KfgRqzZgL8lLF4uycCpt8wzXHi2SEt+/o5FUwY
	D/h6DqNXNh0NGTaJX5j06ucYajMorfjTOlEW9dKaHMcopsc5JN0tPFZ0OvHV3CO6p4xyaEAMnVZ
	f8Qsm+gv2CpY2uOBff4Dw0KqitbYw=
X-Received: by 2002:a17:902:e78f:b0:2b7:88d8:efee with SMTP id d9443c01a7336-2b788d8f3a9mr8305675ad.28.1776745184959;
        Mon, 20 Apr 2026 21:19:44 -0700 (PDT)
X-Received: by 2002:a17:902:e78f:b0:2b7:88d8:efee with SMTP id d9443c01a7336-2b788d8f3a9mr8305375ad.28.1776745184476;
        Mon, 20 Apr 2026 21:19:44 -0700 (PDT)
Received: from [10.133.33.243] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab32cfasm150643255ad.69.2026.04.20.21.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 21:19:44 -0700 (PDT)
Message-ID: <6810ee8b-8a75-4acf-8bcb-2d503d4a77c8@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:19:39 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord
 SA8797P
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260421040231.1256998-1-shengchao.guo@oss.qualcomm.com>
 <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260421040231.1256998-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e6fae1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wq6Rj_IcCcRUD3ssO4UA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: GAQuN8pgfmozhQBW_A5nWBv_12XaKBVx
X-Proofpoint-GUID: GAQuN8pgfmozhQBW_A5nWBv_12XaKBVx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzOSBTYWx0ZWRfX8fJRi8T5dwR+
 Qy1TrYpi9nqVMbrtMw6e+WdbFFXM5BaMNtBXuKcssJYsWv9gq7BbC+opT/wGmlxlWau119UQtjM
 1yIu3n3jTn1fZFrtnpOxhcZCgBgaPN80bym6s/jfQ2CNMr4G223WSEkVUR9eFLGccul1WiF7aan
 TGR3X282v2CX4Ngam/JDEu6kJfjNFNWyG5ai538iviH2D/9UZ+pv+I7dMz68bVjP+n5MIZpfbbu
 UlB9oLvBOri5PfurdvR0FMdYfZRfD3IpOvdpZu02D+E24bKssMtUO2CcWI1R5cs4CbNohVJWjmM
 W5ApoXVGKt70f9jb6uBwQtxVmAvY6iVY4e7xXmwqkZK1VoEqpME0L5Jj/WyL/V5KYA933ty/X5Z
 RtAm1XbbIkyIahWisEVe1AV1mej2WH5iRqx5GVQ8n1orRvnrA7pLFOeDxkHQft1aLpBAfqAlof0
 u+Cy5FwaJ0H9lcfOeFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210039



On 4/21/2026 12:02 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Nord is a SoC family from Qualcomm designed as the next generation of
> Lemans series.  SA8797P is the automotive variant of Nord, where

Nitpick: extra space. Ditto for patch2

Thanks,
Jingyi

> the platform resources such as clocks, regulators, interconnects, etc.
> are managed by firmware through SCMI.
> 
> Add SoC ID for Nord SA8797P.
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   include/dt-bindings/arm/qcom,ids.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index 336f7bb7188a..be4657417192 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -297,6 +297,7 @@
>   #define QCOM_ID_QCS8275			675
>   #define QCOM_ID_QCS9075			676
>   #define QCOM_ID_QCS615			680
> +#define QCOM_ID_SA8797P			690
>   #define QCOM_ID_CQ7790M			731
>   #define QCOM_ID_CQ7790S			732
>   #define QCOM_ID_IPQ5200			765

