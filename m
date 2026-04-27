Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B95B36C597
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290643; cv=none; b=QkEhHSeDzWTATUDS49xFKVaIC5OUBDSPlFh97brUUm1PJcxQeeWW1/nhqfHiSIduG8HB6cAx2b2BESgy6tTexyxKS8RT/IoTnYKFPiu/G3M6oeVUFI/aQudVXNpeXxgPm/U65o0gEDwi2EoHcEBIq53qqmfU7OCZPD5a3rdLTIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290643; c=relaxed/simple;
	bh=SFZTLIYPmD9OV0UY7jeV026g2fXysy6Tc264w83FgXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFoKXmLy40ri5mzwGYviA05DnxJg8Ll8aHuCmwgfAfAt5HK8fxMIsJu81hqW/TiT96UKObEjkVFWqux9RrYPc8hm/KI0j7LdCVUUAWrCxM9UtW6QEChQvh97WlSFpNKiGxJFcxtVFpHlt7olhLrgNQhaeG/E3Jd8gPBJtPSs21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEW+4o5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSRIesRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEW+4o5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSRIesRP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T72v2913796
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1APo1TTMY22TcpBh/JlL3Mzxh0kBkPiNm2TPJHD+A6A=; b=NEW+4o5G2RldYWqH
	rQjMzjl25jvTYOyHZHpLlpg1Qu2AmlLAaOuXi+GHM00gpEFHpRNrGjQu7FHgou0o
	AFcJYIA/1L82AhAb+NEDiL2OEairKt15A5n2mrVOHVusvxz+YmhGy4feVr7Nd12j
	BOJDvNk5wZXREExROUGHT3cwrEbHYckkqmxfFLIRxVb80hSGcWBDmiFrrMKddw6K
	K83C4Og7BGNNlwyRV5LkXFH9WM9OBrE6j5+ut0VJ+3N5qDi+yYYP351hW/YuiOo5
	MUjG2lJN/2y9C321C7/sYkFtnJX4FBAgQNodUIA1lIlTI3HkB4JToyjBSv5VHFkB
	WWzLCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xha45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:50:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso96272541cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 04:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777290640; x=1777895440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1APo1TTMY22TcpBh/JlL3Mzxh0kBkPiNm2TPJHD+A6A=;
        b=fSRIesRPtD2Adme08+QyVBiD4XUDTHJNhbukJfSgpewhd1BD6pk/O8llpQlIMfa0rX
         QI5XP3u5qp2wqEeLS4qAVz4K+oU1Sy4fIcj2nxwq7O5PV/itQpvb88U70Nid/N6EXgXI
         zlyBXIZuZH5mp1g6lkUG1n9W579x2gtilZHq/ARRUpxNFwlwwDER5xQDPETuQrXGf4b3
         kNEoEyoC0IQGIFl2PHI4+ed327NmaxA386ounFFINwE5hwfmmkHPdjHA/hMarE0YXLO3
         G0+Jbc2S6OJXZPzjkJ3xHFFw5wMNoHFmqaUpcpuv35I8+CBXiHNHtii0svicBpEclLWO
         /yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290640; x=1777895440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1APo1TTMY22TcpBh/JlL3Mzxh0kBkPiNm2TPJHD+A6A=;
        b=E1e7hdj+H86WLxVAWbR0vONdbIeqNK2Mpx89KTACPiFVW6t2hx6GnV3j1qN11J1H3w
         Hr9e1sCvJ38gcL5YaFSAOz0oinc3hcXnm/aoel6Va3P1yppMGSEFU0VVW8GTD7dcaofm
         eAh9bS6/hksnFuz3tyW4/bteJOqDKwfK1DuCZCX9oJnw/bpttGVA0AgRSE16WK6h1l1q
         FrrpdHp9zyASOA5+HWpDeEMQP5GXLfgFIxH3IOTFGWPNIKVjR+PP0ziaTdzzs95hymT4
         xD2j14KvUvYVEl+cILzKRAjjKomMMGiRJhSq327hWUskw9TV4eRix494jlNfVvI2XCjz
         0Ztw==
X-Forwarded-Encrypted: i=1; AFNElJ9NaK6tF5qPPNG5AMWvJ68BhbwV9ysxqdqWfuJWDrryhH21ozHH0dALXnsljXqodYJS3RB4JdXwJXPF@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7vmymJ/u8Pt2o29hlTnhjpglFHcXgHW79IIyqzRufsznaB1N
	bWSeZW0JorJPqZuRQVgCydAEGnVuVE5M8PLdm9ZOADHutdTe5EgS/b9EUJsVGYEP5pS/luiEdyM
	Xt07dennLaf+1QLF4h02GjatayEZZJ+mnXO7ohj6ka8rzQx7qMcOWzVRWIXU6MKju
X-Gm-Gg: AeBDievIJfiv0OXXRw2aEWYtyn/KX5ewTKCSdZ6lgBpj7me4w/s3qQf7EIgrLhYPbYC
	vKLECNjOkznjS3t4rRfLdscHvSjkguDH27VWXpDKmAyfYZISwupDQ4EcbC+K9WENK3QfcXDY0RX
	vhVaepYzu1hoeLpswcvuNwYkQs7Gyjio+IJ4p1HW+GeFdXvSeCeJ8WwkydNN4kI6Ec+nNo/Vvu5
	K2cpURAqy/XeYi6+KDxJDbVPpBtmSRlzGaAv1x+g4mZBe74tyecQ5r5YDNv4RqwY9TQjZL4r+hx
	LCBxduVV1ZJThAYkcy5ZABZYtZhgttZz08pn+0WVb7t985urTwZ2gFeW6xuY32Qxa0Y9+LqGWkZ
	20RW15gs9YXuHNGznJMYagnCENER4hgVWuyHQJ6jExYSXCcgsEZL45biRip75GJ9wje/A2y3kdb
	y9ULm/kGXkPNmX3w==
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441526991cf.8.1777290640563;
        Mon, 27 Apr 2026 04:50:40 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50e36c9d407mr441526611cf.8.1777290640127;
        Mon, 27 Apr 2026 04:50:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504379bsm1106684466b.42.2026.04.27.04.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:50:39 -0700 (PDT)
Message-ID: <ae88fbf1-c0f8-4daa-a6b1-250d3245746f@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 13:50:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konradybcio@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-0-ee5257646472@mainlining.org>
 <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-5-ee5257646472@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v4-5-ee5257646472@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7-oOBqTlM_6TPzLcBEgbYGt-pcDWz8Pp
X-Proofpoint-ORIG-GUID: 7-oOBqTlM_6TPzLcBEgbYGt-pcDWz8Pp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyNiBTYWx0ZWRfX5/fEmvZqBGj8
 TISjMPpnr4uKI/shXF/JsC/BbS+v9YYGXmfCiU1nDBiYQfy28viRUTMoS8VU41i4hVpEgHVyQMj
 m1tUMblzGvx+JKHKUDxEYSTd6M1DL4ta/RJzwimmTX+6k8v0KcjbT9hAp6OczEbfW/uCnudD0ei
 KQQJY7K2H/5qvnqYHfI98pFKh5Jwb4O+eTaGLIheM3GwWPmCDxUEaabwznLqW5+MU3s4OuxYprW
 h7ZaoDugGlVLcYwI0X42j5Z3ZlT24bn6iVfXFYTSy2w8jp3sndGgVkIt3taerEDHvWLOI4aaJV1
 jRESDMFZtAGOnCEJ59VYwl6PcAu+2lyIEdm/e+SnZVJI7F/hCRWBs95iC5bjJ3HnVP6zgFoRtu4
 EK4euvIZ7GiS3pTqoi3qfd1Og2WKiUF/AmhPF0f8EmNyfrZJG96xEbi3zKHF6niusgj2aGThK06
 Uue6rIJ3JH6PwdUwreg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef4d91 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8 a=iy5XOAXv690njMnkD8cA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270126

On 4/24/26 1:13 PM, Nickolay Goppen wrote:
> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
> assign it to the ADSP FastRPC node.
> 
> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
