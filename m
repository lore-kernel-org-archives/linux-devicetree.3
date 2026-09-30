Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E46E3E763E
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764376; cv=none; b=ZWudUmdNqy6UsPDQmer/JHxFIsRzttPwylCGik9/bBh5l/JsBtohqnmlYmsL7rKdaAmU3WRnZyl/lwES9oJ2BzIJEYGoUTux92IPlYuPS/aLT1tF5jQ1r9dvKqqQDCTpAngTNsLjY8rumL0PkiTVyBT54n1SffJOfGgLwlNux6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764376; c=relaxed/simple;
	bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3BH/BSPVCMoGTa0AL3wJ9RU+C//YwRqdLl1gglEugXiG1oOCudvZKg6YIOtlKxPlOtuUpbVXxdjQlxCZpD6j0lN3oTWKFFFGPNGO2MgD0s6rsQzI5L6Fkg/ofglGs8ddy9z1X3xBlocx+Eh16oeg5jfROwlpz7y5zUHK6ie+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYmEqs9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WruygaGA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYmEqs9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WruygaGA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7dOHn3082239
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=; b=HYmEqs9WutxOa69a
	OmWATf9BkDwYYv4FkJDlY64AaUtirh84PFYtB+CNWdzGQcUhE7oi6tCqbiaXaqb+
	6r/Xc+L+lt5liw4SbqvkO5r+SSOsGmIghGx1H0xv6oxdeNOMZM/BiCWZISknnGv/
	gWdH+Qfj004GR6fOl7WaOGuIEHJy8ysn84IPJvVO4VP4QfIp4sV3izuSWCG0cP/X
	1LVXk1wBT6uianUh4/6lS66MH6B8QrVhYioNYoUC2ptvJWLXI8vG/A7S7igPK0Im
	yQZJtRCpvYyc/ivq1h0nRHQNiNUCFPbCTh/+0HU17sKCFjBpbCpak5cHDegT53kE
	7U+JcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w1412y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 10:32:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bf3eeb42cso84392185a.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 03:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790764371; x=1791369171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=WruygaGAb0DL8RpebvJBnFCq0p9dA2bvadk6O0890Q9Uta9mIR3iAK08j1u4BwNhHU
         BDhghA6ZgVr6gFrhSIELeJf1CxU266c+B5PzDLbGDb9I+vKwbVyFaibjvzILwRVMCLJH
         SebaqIXByd4/dmngAGrjS3+ClZMBnhSs1l4REtVLK0RxtmImRBXM6irA5sXxmlODyRnI
         L8pv+/1b+wCn9xEpr8Fl51889volJL5QD2bK4oN4Nuz7FsqcqXakFBvZ/jupAF+OqdMh
         OH1RvRGzV9jcx37IznOpelvntjB12Yy++lHywdxiWLpVTSY46Tnf3BDHSEtShMN9hB8n
         8dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790764371; x=1791369171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9mLTHUMGbr6BKmkS0Hof+NTL55zplajOCmN+l8Gqco=;
        b=IlWCHu8P1N7ZWAn4ad2Sqq3irhj4R6ZnqrxxfugJWqu+6/Vtok0GR8a07gWjoDVhii
         sk9FjB4NIwMr6kGbZWEx6AE8kMy5yY+NL8FHlNaFK58LaG77ssfpSYOBJOcoVxAb24LD
         wTKV3kuysMwa9maejLs5TeX9hxXh58sfp2LT2zAjtRPgLyHnt7rAPiKF64enuk+hw6ib
         fEoZx7b7VZCPPylFqpAU4b7ii0/eB9ZWpnVEzT/mLgLwsiewetWh6FSd088tD1s4EsIa
         oD5byQ3y8UftQb0B5TlLzDaWu8ySnOjv15aXkGjtnVc8PzHZdB0X9NVqqPGbcW8jIhHR
         4Ppw==
X-Forwarded-Encrypted: i=1; AKwUvBwyadCqVeZpfN58yQcg6eDNLhGs9nQWR/Vepwl111iQvu6V/y/cK6WySuNa0j4drvvXDFpwlyo8PUDc@vger.kernel.org
X-Gm-Message-State: AFuF++m1hh7C6IgxBOIJzqfRUvX12IiZAIdSg1mq40JTmCFbioiS30Vf
	GftCz+0mfxeYbKQVW2dGH4VehU7/Zj/ZNTQtx3xOLmZJfpBtl6CcFVTUJTc5G3IE3Z08tETEu5r
	bLgDrJNlTvlcYzKecCHbPFa+LWg2TVyPq00wRyuWWybuidKSHBtu0JVpRj0R0HCn8
X-Gm-Gg: AYBFou3le2Z9KDAJ23wOhCRezviZKOLeFUGCVPGBsPkZwpCbTYAzRaomJiDI0KDhl6e
	QOiIeGPFnWWqtqBvhtogCxWnUO3XUDvZ492Fdcb6D7w3LTHN8jpwydF7OqyFQsv8mbxEk8foIVd
	SbwJiI97jnI2oG2z+Bote2n9HhAlU0qEenjpX18byor1GC4t7pu+T9valUBPUwqgGUkxTqqGUUg
	y3oo6b8mU1S/SKBzC2BBHkfysHGrxbATKYsSYuK4mZ3MHReMudD/dBVwBhAnvyHMWy2btgp/weY
	bNyL3SXvCqf9GAuU91QWwysq6A4NgZ1ZxsvICh0WeAiiGSO02Q5vgtULZEjP7HWyrtz+2+hlRhh
	S1SFVFHJX8+WBLRkWr3orNg==
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131781285a.0.1790764371139;
        Wed, 30 Sep 2026 03:32:51 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:93c:6a0d:762 with SMTP id af79cd13be357-93ca93365f1mr131776485a.0.1790764370645;
        Wed, 30 Sep 2026 03:32:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f7f26asm44710266b.42.2026.09.30.03.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 03:32:49 -0700 (PDT)
Message-ID: <543bd0a0-e0ee-4bc6-8988-00f595334167@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 12:32:46 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] arm64: dts: qcom: hamoa: Add Iris context bank
 subnodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-8-0322ca5dc10c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX720EqEYygzWe
 Yu9Che47YEnnu8vcSK38VjvhTijwXulRojLXXK/wu5rHLMbbduRjsVgJ3TaKQdTi69saIHQwo9R
 UIpse8lRly8LCD5c/dQcmwnYOenNIp4=
X-Proofpoint-GUID: UDz9encl0FuWTBez2bDT05i6pj7qGXcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MSBTYWx0ZWRfX8D6a/KYyJgYF
 KJJfAsKv5/hzwqdOoWOiw9q3nEMU2NTES0N8yEHXvrkSEhRLjTw8uR0lMPxmUKd7EuycVhhKoic
 EgfnkqjA4JXo7jCxvQYA7KsiUr1s2/sGoN2ICbyHZTkzk30Zx8fmTUe8DHL3s6PQIPRGLqaJCHb
 qiXuFAikwtNWYBLyx2DeUSL5gDymJhB0vV0GeCA23prHzo/Dwe5UTake6iSrIgqSr5k7kqtIGSe
 dG/WDqffyCs86dDdAJufHgt2KU54NOWSLdNuLBUI2dbM2uNF2mWqoTIiIVwAaJKkIOcQn1MFPKZ
 37rfj8/ehKj2w76XrBwQG18A8Pp9910Wj3VXALmJlFfEyGRYLM7tgFuge/BDvJ2TkAO8uTT5hts
 v/imy5TU1T7uBTTAG4MYyKXOhMVnsOxxDiUw+lXA3soPS5TjTvxEb+uVTdhkNIKaoFgeO3kgXeg
 J2atS6+ecaI1dwMQgqA==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abce554 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4BULcDCo1EIeXDFKsSoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UDz9encl0FuWTBez2bDT05i6pj7qGXcc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300041

On 9/26/26 8:34 AM, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does
> not give every stream the same addressable range. The non-pixel stream
> cannot address the low 600MB of IOVA space, while the pixel stream can
> address the full range:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
