Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197408;
	b=wjmS9oOWdLD8mjNIFPwNiI9EjuT51LtfxSo9lKXxBb68S40fU9T8cLx6YDurSNHC1qYZ
	 8AKMXtJ6ynFl2i5knXp2RF9iclfpw1rZTurtT07GL+c9pHaPFLqGrARFtb0GM70Ngb3ST
	 HK6Xw56H4JNgETuf1WMWZ8ArsPuW970nomGWqS5G6YpGCDeeB4MC1d1e4tySS6mdUJSbg
	 g4smc/2ct4KFrEs5GnhaBHWSh7R1oatlrLmtSaAhF6wfkUgXNOWzUKNJ1MCGC6gzmERS7
	 2OUB0Je/M+lxrfGWz3XP7f7ELBIa+af9C+GTEmbHY+oYkfYjI72HYKFaERT3gXrRLuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197408;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
	b=PNw7rtI8FXUn+ZH6YtFtK1ktUGNH9Be6CDEU9cGRietq0N9kXUrIEA7rCAztHJxq57kp
	 w0rtK65WGE/veef7ZqlyrHX/yA/k6Y96QJw+zzf9PifQ1yGD8canLi81M2F2E4v9YuI9m
	 kISUKaUnVAqxldyBvdxnfBTaGrnE0ph4xH9vZ2g82Ce30PkwLkLqzlP61WulIJYDuX92s
	 LYkteqxyzfWvzxSMfmtIk8y7Tw1TqALkSgjalfcxe/IU2crL8hnmMHtgD4qn5jA48rLp9
	 deEOo9tf0llQf8G2mkVxFh7Brk1lqjwm2YDguUmrE9p6pAMe2BppOPGg7m0SrTk1Dhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wt5Z0Nf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvHHa1dC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7F60A2624
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC7F60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wt5Z0Nf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvHHa1dC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6WV4154790
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=; b=Wt5Z0Nf9w4m/p01v
	hCNgRezvewHpHBHj+9SM1eZnOUB6+h2WjJ2GWPdWV98IC/fqJ7yzlME+Lt9jafI/
	NQnjqsrvaY5oCYriuWpwWrfVx/3SeQfXBuAKHINyiHyDUo58EE4PsI3KBh0H9QUQ
	SuljY10Eo+eOzRbwgb0FsfQHLw6gwInFt5EkMsE1jTy7tSAi7bfQw3qqcbRQXQkF
	FoWexBqZ9Tlrk7M4/g76Uvv4JO6lm0e0nXKsF3ID0NiYjc0GVsiJO0lx/gBvGeeS
	k7bLZGQtHRHu74TRnbz5X/clQ3AU3BEhGnB/VZmsxTYzCVslAPlfT1pjCG+5ew2x
	pXHNlQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp17yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 14:23:26 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988bcc2f50fso22461241.2
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197406; x=1793802206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
        b=OvHHa1dCkcKykwMEfTAL8VairYPRBTFDArPU3fLKtiBRLHP7ZYLltu5KZoaJHHgHYP
         R6cfOHiE1+tQ6cMpxunIojHqRm26PQLCHgCkElW5Py/gFf1FuvEne/3WYE64mMaGKHKR
         2JZtpbpykOe+EYN91PEAWtRUmcBEPVoBnXRfuYmIKnJF7m7yP8eIo2pEXL9zGjnrO1Ua
         IYcYGv7ilb+Gnf14CB/NfnCFlu8taRZiRouQRsBQ6fGsnjRRPm6BNvQMz8zYiBWCo9Zl
         VO5OtDO0ZX8N6X5+E5ZVHQV9hpubR38PKp8dcrba3kE6+B2PYhrw6VXaZV1iFTar2P29
         rYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197406; x=1793802206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Al1cJvSPJpi6xUcSP9hpYsXeFbQquqZX2nU234sBEc=;
        b=sf+tmPbdLdfEuAG8DuI7heJHE58qCuq+pfqfG0ocs5HxxE7VJVMQ1gXcOGx27/JX2F
         h4ELu4BLBpqFd0mqpxCBS4INlT+b+pKXqzg8HWfk6CkCY1x5smkto3etWF8HGXPRHPFX
         4fWMM2EKJBnYA96sAvKM0JezdMpXgKqwxlNDg71SjUlCGsX9/VWPKZ0r6zigkWd/QAUs
         +FMIsYEUHlr/NtsSMSPmHNftsgLLd3QeOd2C/ooAjrLlge/16VFRvVUJ6AGPoUjk9K1O
         zscUMEEB7O1ZikYMi/Lv0YgAJ6WP//6JLVkcnRdzT6zDVYUhQZG1JoTlmFB3D00XgWbn
         ED4A==
X-Forwarded-Encrypted: i=1; AKwUvBx+BPwjzZ4KhFIr8N8pO8h1T1qu3bNCIrxzG/nsJN5T2lm+wFbFGnrPdhXN0+uxwbnb4UvOQD+lhAqs@vger.kernel.org
X-Gm-Message-State: AFq9FYI+SeK/FJOAl/Qx4Nbvr/e8vM/IS/xNAoPURa4Gq0kAQKr0HWUV
	tK6Ej5JtbvIm9suC69y8vMEn2Em4XjMYFfRl4Z9JgiPJU28+0704K00+aNzN/SMSyLI95LRtLZV
	ST5LdOBhEpCkRNmMVsdHRlN/MLgZVksuU4b8DyOHAuiupSLnHfsPuMirapzvgBbtl
X-Gm-Gg: AYBFou3nNNI1GOwiNNVp7Ct5dEBHTgvNtv7BCgg7XP0RX1DN2vuSx7v1qi0Ba4pViPl
	pDV3qcgAqNtkKlKa05RrK3gQtP2G4GPPe03kgzaF7BHzh5/r2fzfWa3A8OfUMe2d0fjVdFzUHSc
	LpdfyCv9rkDvK0kvWOcQDfzuFtzy+Bz1vxQ3rvn9gf7nJ9N2Chzbi3ESwbMAVsSNxRxc6jLDfrt
	IFV/mfjUSchDGHL8Os4GsT7EzoJQKMMbuMHJhn1DowogXKh3fkuqHe9FTG60j8tETeSjfFu5NrR
	d/X/CbdG9P8ytejk2YKEUn2PVG9AuhDBadCTPYPGcsk/ou01SKamt4EJRxrEonEHMsw3qBNzDYa
	YK7+NL55TuuUpo6xqzhrG/FPwefdmc5yg0IunrO2zDZHIDyrDewZLYYaEvzmReD1m5dlyAR4=
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1515584e0c.0.1793197405429;
        Wed, 28 Oct 2026 07:23:25 -0700 (PDT)
X-Received: by 2002:a05:6122:4697:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ec4c8f7e42mr1515533e0c.0.1793197404874;
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm603752366b.74.2026.10.28.07.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:23:24 -0700 (PDT)
Message-ID: <b4adf2b0-5a6f-4f87-b6a9-ed32fde3bea6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:23:21 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FoDwCMfnHV4kdUFyqKiAU5_qap-GpkAs
X-Proofpoint-ORIG-GUID: FoDwCMfnHV4kdUFyqKiAU5_qap-GpkAs
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae2055e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX5Sxi1DInSlNz
 pG5SfgsQC9tUpeN1aP2Y2fobmZicvvVLroP1wLVGNoCydyj1/x0n9jdTbq2NUTHuzjyXvWL0TO9
 8G59xzS4J1pxkJhz0bDWELNM2UDYeRPjvI2LjSTXcYyFw5+qjxTGd9Ya+fYWoz3rzaKJl2i6EVy
 3Zjq4CpcAb8mBEyZ3VCGRqEIOc9PSCYTN+BvvdcOkXKWw1ORCsejLgdtGB1ZgmPXmE2AbfQ1DTs
 Gxt9o07BdHBSawJ6/q0iitWfaqmxVky5WorXu4UXNHOg92JfTdhBabJOjYXsSNzJPfYS+VdNl6U
 awL0LQKpuuX+/lln0T1dKbdwKyagWt4jywh4Nu+9RAxCn+H3jQBS2bc0UYgx/IeHspkHN9QUlVy
 0PpJAhAaFHKeBEyChfmo+w8ZL++SO+iDrmK9DBEuQamPAvimwlxWaGqUOmf/zI8Q6hLP+bY8kjv
 YA0DtripwXvWNI4SKUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX3evuwYRH3Xv3
 Q92GojSQE5rtlcg1ZygOJdgi1O6A2/Gx76bJsh6zGt+8ZWl3rMaqQkHtsGGE578tuyXCH8Rn+Yq
 goPEE5aRcPwzzHqMKms8IHQVgAz+/yM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280057

On 10/28/26 3:17 PM, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
