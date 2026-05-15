Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5F3FE34A
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778841455; cv=none; b=IQNMDK/S2xkw5p4c+qJ+Xh+Lzy1AUXM9hmPVeXduoMmwKD7Vfvlo+6mfJy3VnII8/py4EK6y3uoU/tjRY7i0KqQhsIGFupH5MzgoSURziRFKCKF549XJxdZa0lhzIPR3SRUBJtNT1HxV+0nHjGddYgC7LZl2lPyM5THoTjdSSzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778841455; c=relaxed/simple;
	bh=Olhz024//a3T39nWj7aqngNz5zRyYEO9Z31uP3Yw8LA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lY+cnWnn55YA8r12SDfsJ0RvunZR9CjjCGXRCKY9yLAKEotuF5UxE04HGIGwgSwO/3ZvV4ug9ftdrC8TCX/j+0n+B395IuUEtD7YwQrSqgkDzgmioGwuADgn0uDo6cAUESPmV4X1chpjjGnYRnYA0cDTFPHMSLx5qN0HR5/Mwjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWVEUiSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVzF532M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWVEUiSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVzF532M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5N14T655050
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvbGXS2kE9zWNc5GpgcccNRZaDS08RE8hpzanRVUMOE=; b=GWVEUiSA3y599VxP
	PumCYLmwl71QWmb8uCw1z7y5MHaXMEjidj0PZ8v6NjmdhJrCs35UooKfmwl7OjC7
	yT1d870mm/U980fmjS0xppCjXxTmjl3nt5vEDH3nzJPqnOvY2mtLHXwY91aRdpyJ
	DlBewtmCX2dkvh9m583EB95DcaJRIvv3U+0DqYzZM7X4pCrOj88dtSaFIauNqVM+
	A0Vo8QnGwp25YTCDSw/DQKDa1rYAGQgDpiPubOc5Oj7Sd4iVqGD6ynTfnwMPOBuf
	y9YQXQIp2l3zoCf09CUXMPLgCo9/SUscDJawRtxZQGVRdTX6Hg6lrraVu7hL/aEB
	u4OG5g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ptx0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:37:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6314bbea08dso392362137.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778841451; x=1779446251; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvbGXS2kE9zWNc5GpgcccNRZaDS08RE8hpzanRVUMOE=;
        b=EVzF532MfX1gyXSXi2xGpO6eNPkvwVbe7N9xbJOJ+TGqngyYIU1UBvkZh1W6A0pUX8
         1ZzqlT0x91MWJzfK85E+AJQuLQOGLxGDOX/mVKEzMfGnfJlSBDnvenT+xkG3aEcTiFE2
         PJ8kGxQ12VSX4NlueEiXDKrg0Lw6Coxme7bLsyaviUk3lfFJl8jFqKk/QoAeiRKANuVe
         ozDxUeYwTpkvMy65s/rLDiPvboz3VsiL2C143KvdFTwV9skOT0BLSqaFjAUsVxRXCTTK
         7iISovupklVJHetKGr0j30Qj9ntIYxHbUhyu2mtYTdvVyaRjzsyb7x6IXMiCBnPNtj/p
         gupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778841451; x=1779446251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvbGXS2kE9zWNc5GpgcccNRZaDS08RE8hpzanRVUMOE=;
        b=fKgj1Regf3UAM2d8XvoYhL4bTG9TKS1o050Psi1drGr2qd1YQmYZp/0LMCTSaJqNML
         wrut9yOUjIaZKhE/nv8F0f2ZPOc4ChfHZjUJvllSo+mB+bkyZKVBthED7tOlVyaWL03T
         YOem9/J0bZuKh5ojuapKBlPwj8u/M6FU2YpRbw0zJ5xbhZin649xV7vN0pGpLAedEybt
         38ecqOFHFyocyhxRpDQ02ZLbQgc1Y9Qd9JHJ5YRQv1+aKvwdLjZvjstEYHObnVEmE0f8
         jgJ+uWNeP3r41whqBmYOvLGyO37sQkc9hv5srxGnAngGRpsP+KSGgu960WT6u6txzWBp
         W26w==
X-Forwarded-Encrypted: i=1; AFNElJ/pKRPqi3P7hIUiTKcCUcoqGiCXRJy8tcV0YtOWy/EMmjzDJHQm9hfBmznq1wZ35wUbl/eCppZWfaD+@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKTsR5XBMbOvKDKwaSdzi4SqM5WiPXOPqqC4WKgMeqBLcSk4J
	ngqOB5j8DXETCuXj8WpFjazzj4aicIP7jblEFpHHk2XJhV/sTab8x+1CC4fyfyDbxKelXaktpWw
	4l2pXhq7vFp0t2lkY96ifnKroW8sVwKdusmIoYw4pUbVp6fE5XOQvRmWnV5MIFAFP
X-Gm-Gg: Acq92OHd2aezRuWADokJmagOU8hmb6KWRj5LYulYqg29ufj3KIUE8rquhjRDEyQE+dr
	M8aovMw9u/PbEk8LYI7Cq4R1s/7eeGqyMe/Z5E2aiRlyOVE97aSew1pOeuFLfVO9fqPhwzyDQa9
	QtQmRG6e+MLyNkRQdZb/Xj4cdv1i+Ft0F117b7B7msJAXgg1t6fX2qTrH5zZR/4X2bFAyem6u6w
	30uA0NmaRVc6PKe1jd0274PczMDFB9gVJB+1P0TAYfUfSlVkmbywsexVYDjz03HRY2YGktKkTxE
	piT3BPz+1gdvLYCq49hKPZG8HnU22QX+PjCXXLnymWN0ma50Rm/FzxSEacOEFHPOxMO79q47wEG
	d0IhxjhlLD4H+Bp+czkqLwaKVIcduGBgteHXR2jiwwdVY7c6xKjmjUMBmzcwtLN85ldyG1iS7hI
	fXbRY=
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr406161137.3.1778841451395;
        Fri, 15 May 2026 03:37:31 -0700 (PDT)
X-Received: by 2002:a05:6102:2245:b0:631:3ccc:42df with SMTP id ada2fe7eead31-63a3fa98b68mr406147137.3.1778841450885;
        Fri, 15 May 2026 03:37:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ec6548sm206391066b.62.2026.05.15.03.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 03:37:29 -0700 (PDT)
Message-ID: <ced00124-9ba2-49ca-9200-62abd6ac3340@oss.qualcomm.com>
Date: Fri, 15 May 2026 12:37:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Introduce Shikra SoC base dtsi
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
References: <20260512-shikra-dt-v1-0-716438330dd0@oss.qualcomm.com>
 <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-shikra-dt-v1-2-716438330dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JUZlnNk65A1XRRIFJGtj-xrG9tZy6u9m
X-Proofpoint-ORIG-GUID: JUZlnNk65A1XRRIFJGtj-xrG9tZy6u9m
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a06f76c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ids9KMZMtRugHLbRT8AA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNyBTYWx0ZWRfXxFGDDyovkynu
 SAh1i45oW5x0mT0vXruTY8GjYlB5FzLNsXfZatZ0bl4fOYUMFaU5WanN7pcHi4ueU9wNUEMlwDM
 8bkAwL9OcReNH16OOCeQv5j7f5BQkBTc2dh1gyrQuVHZJJBb3p+eVYE/OBBSpWpimZTtgBxyTDy
 BesLcOnyu4qqISraXL+Gp0alo9M9Vpo6rwg6NgaJ14VhLs4kFv4p/QOcGaQ1pMTPcCkqc++CSUn
 FvEczUTDkM4hpkU4s1u3fing06IGPr5fiUMXF7Bf+GMOkmkFRifE4c2Eg90EeAtCrF1iqtq14PH
 6PvRa257vGekWwpv/02zK+nrDzNH3MHPRBNxkZsSzeB5WyZm5iMaWnAS1CaNPj5Meo2koq9aPro
 0RStFUPouHk049yAicyeKpkw/P1z8MWoMj3hwkcvtg/kX83Gs5zU6wrvH6Iw2hmUqPpKKx283HW
 wvnBJVSEeYpJbsX5+Eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150107

On 5/12/26 6:08 AM, Komal Bajaj wrote:
> Add initial device tree support for the Qualcomm Shikra SoC,
> an IoT-focused platform built around a heterogeneous CPU cluster
> (Cortex-A55 + Cortex-A78C) with RPM-based power and clock management.

[...]

> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;

Considering there's 2 core types, you may need something like:

9ce52e908bd5 ("arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions")
2c06e0797c32 ("arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs")

> +	};
> +
> +	psci: psci {

Unused label, please drop

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
