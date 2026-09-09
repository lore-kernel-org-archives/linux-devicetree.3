Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EF3550DAC
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956589; cv=none; b=bX/6VK5g1mKh7VOxzGJ57xtGUCk7LGWJiBA10+H7kTn4nPIpkOyF3dcwAi5Dk+YiaVHPoDDJaIoYfye2tzxqfz8HtE7EmazJAewY1XorHXrJz+bIkZgtr4IxsAs83I72J4O0I5Gl2m7tDqCPGPrWAseazApMfte0z9eOxXr2lXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956589; c=relaxed/simple;
	bh=I/m51bYBFJMIfVpaVeMrWiBZ03B95wWcbnMIQftSxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psr7MUL5s3NdR2n8kxsWvT0qdQ3glZyYvfpW/4cem0DH3WSurAhse+pbtNFFM1aov4W9mhW4gkwBo6jbpnNnupwNjKyPujoE3vc0bBtEzHTs4Pgdr3kEGwDfa3N/BByAH3yA9enNAIUFZzuStSrUTlDbDmLmTMT4lf4sWFf8BM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPW3IlBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1gK5BTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPW3IlBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1gK5BTs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2IK1723075
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 12:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=; b=hPW3IlBfKZFmKUS+
	ffM2FgnGgsgP3nq1EAFrAT1ViXYE88EcTRI608VdcLRzmHRpz5w/UjvJaZZoMWpq
	+SvQ0UBf1DCi46g9SXCWJkvuMO3zjJj3D4O0z2Ep+eGcOiPpY07EMgS0fYiXIQQl
	e6NqtxN7r6t6t6rkseRLed04oNv3hvK7Jn7zXQC6XkKfH1jjTnO8dfXGo4sfQRDG
	9HNRcztDEse3o1duqBAYwDH6KeIbOjLBuDa0nX7f4rDW6Jr+bgFx5UeUKFuDf68V
	/+tKbfITucs6YG3cLE6ZC5dM9I7PIWPYCGRbJtXXqSXQHmjKbL5thLbG2oGV3/fd
	qNjtxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnrghk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 12:23:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso74190285a.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956586; x=1789561386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=;
        b=I1gK5BTs6pDXLBxIVnWkZbMPA+fJbfAm+yV2JDbfLZEUAJ1CRPaFVbZtNcybgDT4Jw
         65QapdLgtOCYa23kMTg8qb9UYiGNViE0n1L80QPqrOxWLhKnYkRqbJ17ANExLbhwPK4j
         E9fckUoGjFeDscFirU23g75uAiXg7Q0tzmnm9No/iCMXhNIwrHud/iuVtKCblyNf9e9t
         C3DHcqIqpUazWh0xRmSBQ4dO0RbaqXTznSyeF03uLJHOLekmSH28mg2KriBgfVZgJ7ga
         1kk9t8JUnK4QEyFv9gJMGfpBBKOdSGnICvltt4Jqq7Mp0zfO4Q/wa5Suk6H4/UhN+fjE
         z70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956586; x=1789561386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=40mifBrIeRbLpVD8ylp/3JFiU+dqxXaEMYvEwiY7oQc=;
        b=I95cOd3eRJ3Jtb5caivq+3zAum5KuTxF2qI1GGCSAIBwCjaAWL6IhbfPGQyeX9TRFo
         D4PcgH6O8QepyewyWcUIFVWQiUwp98MlXff/rtHNd7RZEbsOwTKda6lLPHu3h7YpZyCQ
         PW45MiaUOgahZq1DzAZh0o+4DkYz2I9TbpKTg1wtOixkSPclA+QkGOc3iic8g9zeFLY/
         yvJOcOGMB/3+thcBvpMe/xdDs0qYYQMZYY5uOQGQ6CuFwMBeGxKnNK5qmm2yVrEPYK6K
         CYCqwl69OKoqQjnaqzbOubDcUWA9o8cp8lvB1HDzKlfgN3dd8dsQTITnldMe1gGtg1b5
         7d/A==
X-Forwarded-Encrypted: i=1; AKwUvBwtjZ2zT/hXquVFewOHS0gWXE9XTITPQmbKAUL7TW5qQgJ2v1KFNcSOJv/Kndk/qmlNkuDx3HEWU9/T@vger.kernel.org
X-Gm-Message-State: AFuF++ksLppd6ULRJ9RvKOdji4kdgC6tBo4WMQqTcxJM8/jHwnC+0Y7X
	DF4MGMzw7yznb4DSSZ05TgrDZz2RpLNKZRpbhM6r9TpB4qK4xXxpE06hMrygZdTa3tOkxgXUsbV
	xrGWw59gdMKSZCrpiENQqaVDxhTYS1kKGijznXccHJ6OVsWqO28JUFv1bdlAEr8Xe
X-Gm-Gg: AYBFou3VIbCbIM1rpzIG1xiquUD0KiNZ9jCrsKorCsOoB0FiLV3Pbw1autPU63y948W
	+IgnV1T3Kyt+wBdVzlwE9DozNn+4R2FPw3PoAsmR+CWVVPnopavek+axvXmeNNZw7FjWqnemmDK
	bbN9P1ZOxtNIoacB6s/lhJYlcTgMnbxIpnEwKVbpo00snP+n91oHaXoDrOlI8YCcQ2dsf8k9CME
	gBwWmI/qPpRM5DJSc7yKLdibtPNgnGA7TeVYxwiSDGZqrdobwYVg5ES4zHIrhEoNVpBq+bvTB9z
	szAgRBN01ZbykT4OsHPZdBHSZPgcPNGU8KCZY6BWQ9elYXO7cQs+r8BSnmqNS4JnA1gL9cGPedT
	RDZDklKGwwFX/T7+7C6jk7A==
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1176466085a.0.1788956585521;
        Wed, 09 Sep 2026 05:23:05 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:b8da:1242 with SMTP id af79cd13be357-939b8da136dmr1176461385a.0.1788956584896;
        Wed, 09 Sep 2026 05:23:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm759612866b.36.2026.09.09.05.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:23:04 -0700 (PDT)
Message-ID: <179b5e05-b08e-4023-a184-bcd573213be9@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:23:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: nord: Add PMAU0102 and PMM8650AU
 PMIC support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SvPyJ1FmM57ca66cbe4tIFFPzlf-OD9T
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXwBkg8x9KTeCG
 WbfDvAf620a86PxXOtie49QkDyICODSl8bzenYtG+bEMftsnG7ULN1C5JQQ8H6flQFcnw0e61rQ
 sLYWMZLUSNL30sS3lETR3+pyRCDCzAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX7SyAk0o7K7Cp
 uNx8Lruh0MZJAwaEhEJawNGEjZSndJIFMP7B/6W1xkNipngSwSqEAXTqDuPDQlQLNuPkzpUkn3Q
 1uA/sbV5zXdhqSnJIiivh3OPxqawj6lYE4y+UyweLNhYAODKgNZzI1p2y+9uTA2cYIv5AJbtosh
 PpXOouEiLUhczq4VocXQTsMnjEMxXOIvSpwQb3wjl6rsJeDzF4nEyI7GrUs9g/AT8Nz+WEQQoUh
 z+HP2c/SW+q49sht4z54kpaZlkzo2EnF1v/FPbC9L7yM7RmNFJO7MLm8LXZyY1ydTxZ0V/Kgded
 zDM4iM3t7HAb6I46V832kdgnRcTEUO1qbSEl6y5pMKqQaxOdnWzNeVV+xv9amfAZla/FE212Yzo
 PtHPT3Btsu4NAxksIEZ9oJkQDwkZjGLkEwcmBWywBaYYzqPqbrSdk7TRAPwgb0dQff4bYRXKRxI
 IoMKyk8ZHIGIP0FO1Ig==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa14faa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_OBMBAdlUt7QoIKPFOgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SvPyJ1FmM57ca66cbe4tIFFPzlf-OD9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

On 9/4/26 10:16 AM, Shawn Guo wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> The Nord platform is supplied by two families of PMICs on the SPMI bus:
> eight PMAU0102 devices on USIDs 4 to 11, and one PMM8650AU on USID 0.
> Add one dtsi per PMIC type, following the established one-file-per-PMIC
> convention, and include both of them from nord-rrd.dts.
> 
> The eight PMAU0102 instances are labelled pmau0102_e through pmau0102_l
> after their board designators. Each one provides a GPIO controller, an
> ADC, and an MBG (Master Bandgap) temperature monitor that reads its die
> temperature through a DIE_TEMP ADC channel. The monitors use the
> qcom,pmau0102-mbg-tm compatible with qcom,pm8775-mbg-tm as fallback, and
> each is hooked up to a thermal zone.
> 
> PMM8650AU is the same die as PMM8654AU, so pmm8650au_a reuses the
> existing pmm8654au ompatibles while the file is named after the part
> actually populated on the board. It provides PON with a power key,
> a RTC, and a GPIO controller. The resin is described but left disabled,
> for boards that wire it up to enable.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
