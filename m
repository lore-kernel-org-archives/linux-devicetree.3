Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C493A1A50
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360197; cv=none; b=aDA1l+T8byMfLrtXdONOTVjLTlDQYeTZ7P3WwZwrBdRJhxZSnqXnzu+LZgUjR60yqBsWaLRXjBVYrs6w8Zji4a0Q9eS3IaQRDpeRR3zKTxtXO10DloeUsW02dzo2I4YPou4bA/Q0PyroIGBT6/F644G0fgEpPDZnTLjwSYqcWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360197; c=relaxed/simple;
	bh=hsa4aN1OjCTgcLN89rqmUY9jqVcWI7IPnlOBnalfgsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ca3DOkhqxZ9Z3Rf70URr3AvX1ArRYTsJjBuBTNjL0iLpQRqduUeq30qcFi5MgHFiSYN53uUgBtWct6bEjK5xxeCbt3mTiw82RLCMyBMAF7ITZKo4L/T3i3fYrdTq3LPbYI+8R3/8r4BFLOgh+9R3WY5KPccW9PIIGbSfyx41+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osfx2gUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLBQ1h53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osfx2gUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLBQ1h53"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99wNK2491870
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4heBt5g5AQqQzquwafYFUgSu4+erjypmtL5Y7422RIM=; b=osfx2gUub3iiyDog
	JL7mJmurxRJaWrWs3ehfvIk2gMTjnlPAkKmJbAbhC3e445p5UA5DMN1SjfRmLpPa
	myyqp273iWGYMBKP2NXW6ZGeE/54x9Bn5EhsjUuUIVYPDCyUXz4IsJHGZsWv52lD
	PAvRryt9kvTOYJ4AfBDf1xP4oROPxso9yf/rJSJZgMtPdbjH/d0uwvdKssKkcUNL
	74rFMDjkv9Z+lLmQkgTZgIBV6kdZ/fBF5GaDdXx2lvPywQ2gKSc1F1DonQ+pWXzv
	xX2A6RoLiCIRASu1qylbPrb1qwbvd+huupuG4oebWGXe4IhN0PZLCkAFL++/TSjf
	R5IRRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j4jgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:43:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e5d7f4b63so14523441cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 03:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779360194; x=1779964994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4heBt5g5AQqQzquwafYFUgSu4+erjypmtL5Y7422RIM=;
        b=SLBQ1h53+P2lKzn0IexB5Xl1NYez92SbDoHudN6EFLwcMsAwDw2k3DZ0kvu1sikUJ/
         QSgR1plzttu1tZ9go9O8mPwV0gx429Yk90ZT3G2ybK7WYj3mp+uFlWtawb6YDSOmisgz
         HPGi7U8QTiXFR3i8NQ0lyeSAfbHO/u8o2/xBy2iaUY3HlM+dlLzVH42B8vewOa0r85u7
         pL9phlHmuSq7Q9l/ZlytzO+4FJvNH4+rU7o9Ul4EONIcHRu8pxlLV05Kg/OSSpnHOnd7
         ffvd2C5yZrnLvDHamsVmXXBp1eWslMjeEfVYqdeREgPIX0SRHq3oiMVxWDaAvPY0asDK
         bJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779360194; x=1779964994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4heBt5g5AQqQzquwafYFUgSu4+erjypmtL5Y7422RIM=;
        b=FLdoSSIuErx4wZVMeWshlvGfe3pt04DO13/57Pl3CS7XFcW62a+IxHOJluXaIHTNdE
         vQzv66+Phw8WNGKWEGmU2gEnp/zP8cSP2Aa/dn062epPibY554X59JzkpDV0jaognWE5
         UF9R99GP4tznvVoFqEA+Pw0ZubLZWak82qfhXDOxxQUURyD2+H5Jdmwz7YuxPmaym3pQ
         J4jOZFgdViHDC791LvOks2R/CiYOnrKmgSU6JNuS88vl2F6sA76c7gm+jlJb+zl9M7Gy
         QpgkDpomJWdD9iA+zK+hGwhCPPWrBz+TaYh8qOD4pq6obwvSsJU+qrR5OV1o3rjioV7K
         8w5Q==
X-Forwarded-Encrypted: i=1; AFNElJ82S8VwhpLMGWaW1VPwH+y3qIXPvPV+mnkU/MtR4O4N5tF/gDhH2FwUOmL4HJ3E+pUdnZfGJVMEFlni@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNMM+JpTVQmZZnpIoaAO84luS0+jC7PPyQ0jg5Gf8arER0B/U
	5cFG2x3+TU6cKUfGLq8ZTq0d4P9rhtwpc48QHLC5zzJX8b3eaz/JrE55bpPvlZ3w+FkPd1NZd5/
	sucZ/LqrRCtlLlEiqxXS8hNc7YKLxaZpTCFs25+wlCzlHJWJbG2nVedEyp/ENpNER
X-Gm-Gg: Acq92OGheqM+aeUhDvjhYV6B9qRorGzwRpo58LmT/9Tm66Ebn85EJWC8g5tqqcje6wg
	rExV1Hlrdxs/Pwrwaypyi/nM+wZ6pk5U89WiteOY7WTQM+you/c0uAKqjzhyiUp1GGGYIL2/R8I
	Mprg3WSJn65COeVM4vL0Dfv1ZD9ZYGAFKzjVdlnlsTa+ArSUvkQvMlebgI/IDxKLJZ5I1BIFKLs
	A0Zkb61Uh946dtxdnoPedDHl1hpYcJS+5Im09shKRBPh280kEThfCiIbzdssmEqWeDWL4iOAWvs
	+9WJ4Guww09we1KxziySGZKuxWBkcjL4slllWd41RQBPXEpXkeX3pXePSIUqIuLnY/2AI1cPzh8
	HHhGHaBqO+R/nZ1Y/hPAXgZpGzVamn1qDU4mQ3p9+qMmZCvB/AOPBg60uNIgmlU/6vbax5kQ6DM
	lD/rA=
X-Received: by 2002:ac8:7f0b:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-516c54cc4cfmr20463071cf.2.1779360193718;
        Thu, 21 May 2026 03:43:13 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-516c54cc4cfmr20462861cf.2.1779360193339;
        Thu, 21 May 2026 03:43:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a40e10dsm28729366b.39.2026.05.21.03.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 03:43:12 -0700 (PDT)
Message-ID: <07d43281-a14f-4cb6-a0fc-8f32423cd78f@oss.qualcomm.com>
Date: Thu, 21 May 2026 12:43:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8750: Add camera MCLK pinctrl
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260519-pakala-camera-v1-0-b6d897864916@oss.qualcomm.com>
 <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-pakala-camera-v1-3-b6d897864916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ee1c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RSJGUZsyvqJUkUdntuoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: kGgOmV23KtbsxWYaUhHXq45ybn5zRrvb
X-Proofpoint-ORIG-GUID: kGgOmV23KtbsxWYaUhHXq45ybn5zRrvb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEwNSBTYWx0ZWRfX7F8VfyXYNsH5
 9x/N4k5w0Iaa0sAfcTojqTWr6GqV0kyaxm0ykKK4SKKT6dBicR8mCW9dDv8DWP0PokQI5FbWfWi
 gbOI7bqsWEQ6BuiZfzib02i023oON/B/k8ZF+bVEsWZ0zqd8qSKBEOEWK33b48li6CUAO1F5u7c
 FX/fVGYJzJ0uDlqFw6nBlbAHhbn9XJeiwtSj1cJDbi/JBBmUECR1bPeSqFO4BgswHD34uHzs+WY
 IK+rFjzNFYwmiWwkPgU3uX/HNd0KP+ewuvclaDCEjGE6pwWsDaIHcrhXc8sFiNtr5fUvr7cfA64
 /CZLkiWXVvTRad/PH2zWsItFnnpa3IatzJSpmK9dkC4usbM5f3Mj5yOMidNONwSC3QVSR/Q2EAZ
 a/GFFZr6JKwwSiuoQBHnCoLJD8tpPBG3lk+I+eVRQejNWTiL4IWB+y+CEEW1mHT+QkZGf45qOUU
 lsFj0P7j5IgQu1DRRKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210105

On 5/19/26 9:17 AM, Hangxiang Ma wrote:
> Define pinctrl definitions to enable camera master clocks on SM8750.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
