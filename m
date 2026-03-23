Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966939A7FB
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269703; cv=none; b=aeoJOH2VQuDYtebrkk3rAjUpYw7gRf1w9TVc1n3nhGl3Q3bZ1uBurJSVnQ+cbheXYXqwYc9IR8HSPqJI7QdK4Nx3RPLzvDeGET7g3GZ9FS0EmkvBAGxGsreFGgsrYqBHmcB6auFot8agN1SSl1dHrDX8AiDmTRFxHh5r31Knu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269703; c=relaxed/simple;
	bh=at7pijiQmc0UKem7dJHzsfklr5nFo712n5Tk4Rm2WQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbOydx0DpDIWiyvwJJ5D10xD+qPjRpv3AIluI5VB8NFPhArklxPQqA1sHp89OQEr1MO1TUls5dKFKo0BSlWOoDVcFNKH06eEvJdr2kDJKrzCdjS7oWtGScQtquhp/HyGMdbIvbfDMh3hvcy3hbPr2+f8DksAFdXzSkuOwUMhJ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajuX0Sab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjUy/ZUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajuX0Sab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjUy/ZUA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCegva2475978
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=; b=ajuX0SabHe3aggMz
	bfZQ8h/56mKpWC3gKWwTSkE+M6835xHcU/Hez405OoMhxhrkMn3P8H+ElZYcXrmx
	54Bg5Gw3KBMvqQOhwbqmBUZBBaznnsbIKuQSv9wntCQXMN+Xq92qx5WOZcxlNvRO
	aDqAQyiguyhRXhY6aie5CX5YzUacFFVDQigQv8n+CJuS+QJd/pwTfO26lZMbxQxG
	bCpEdvI0E5xEHMJ/qF5uW2WrQHLG5SZmvmLTvrtDkp1mEHHqkbIzaHfFN9eoUhT3
	jgCtjgUChqNKp0U+V/kt9tW4nVwcbYzRYy+gxuJRzLzpu3bRY8v41EfaSfgaAgQO
	6f4SMg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2005c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:41:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so41655401cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269700; x=1774874500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=;
        b=XjUy/ZUAeyOKdxC3MVvg30odpKUI4bVyhYjsWhtPDkcKqM0e93hXkiTHwyNTlcfGaa
         hiBuOD4XcnMFq8aet7lBAbtNtMFzjhpRQeL5BRypof+2Dyi0y/zEBcw3+kIE254qwPli
         Z3z2hseZpL63rSnoQs3gSGsyMM1cmZyJ6fL1q4Q81MTUPzg7A7pITLw5Kby9UdFRVFp2
         4hSW3yUW/r5HHQ/nB/wG2yxr20bsXHJYrKq5tzGPls4IiHT5cnut4ZLgslb5fbqAGcnL
         4Uv6KKuAdMTpPgPux6pWGrHyVcTUvO6wiyGRTa0IGm2N9gisZ7GeElfDWXpoMDVadpZ1
         upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269700; x=1774874500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=;
        b=HLaQ0b6ecUNA4bllcrLckwLI858z9vi7KmEmrHt3oms9l/o0sc99F9S25v0NUlI4kn
         mAWZMsN7gZaJZbV4cyMgTaScYYhaTUr3pd3//oFBqzMP2psR4ZsoltiHN05D41y5kybR
         pW0jCXsjWaqcpFejnnya5F38UyKGxegVzI66NYq7cM680JedPezclf193Gldy78Y16ip
         HfO5D5amXSl6GnddCpCZJQDLDDHkICjzIKe4H9DEaUjYKSGkNqdxDbr1xDFi8dJHm+0v
         SKrJhvqbI9ijdQQm1i0od5Bs5bm0bzVZKv4iruUs9XRELtK/ywRcKMTHHaLj2F8Rbjmo
         8hxw==
X-Forwarded-Encrypted: i=1; AJvYcCVSuWjkCSMG8RRTvPUrAGfkLJVM5rXpxcUOH28I/IQUMwu2corJatt0Iduiy7GRLJRezF6qPc02Rfjk@vger.kernel.org
X-Gm-Message-State: AOJu0YxDn69FOaH61AeU/EYsJHZsJPEr1JHSjLAZHDW0ZXXTTvr7qGjK
	k1kkEwaA0fwE7yBeSl5ObKr8xyu3D4v1ZLCOjL8tiS/58X4OJnhakI7xYWc54cfA3EBxtrzFTt1
	HFQ19X5oxAsdVxjWh8DHnZlQJSSCsz+4iRJ2lmEtKR6cy5K7eqvomydUwpGieSMME
X-Gm-Gg: ATEYQzyl1hcOCOTMShXZC0LE+Ev9Ll25ebNYGS5UxhH+y2zt9woRtDzrdsdOy78SCY3
	H+gtaQasIXqJpxAWFDQTx9nVOWk9hK+leEuiPUtWOSbto5a52DZ7iiRtJoij7laq5E7bqUOMne7
	5UfRKWPQKDChuiOIGc5q6DaczOMk3dqEm4oavjI79G0TCaMZQ6oEzMYMl7ReqHwTM9ozePCz+At
	ct7a/SnwjtDZqYQ1o1Z2iSlt8w90pGoXW2fwg1pO46+4sj9pDziEwAuQIVC83F4TFXjNkY6bCOZ
	HdcjR6C5j5TVcoB4et7wbk61dMPhC84VfWnqBWXGRu7hpXwoG6FmRCHgqp4jOWaFlXocAiBKQ8/
	YMTatbE9iXadyfhUdtguXCOVmMt7TsaoYEyvzBwefMB4izrQQn3EsOCVcwOR6Wzfl7abLEFMTUX
	A0SqM=
X-Received: by 2002:ac8:7d48:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50b374f7649mr141639361cf.5.1774269700110;
        Mon, 23 Mar 2026 05:41:40 -0700 (PDT)
X-Received: by 2002:ac8:7d48:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50b374f7649mr141639161cf.5.1774269699645;
        Mon, 23 Mar 2026 05:41:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a1adsm485281466b.45.2026.03.23.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:38 -0700 (PDT)
Message-ID: <33d5fbc0-ceb8-463a-8adb-32bcd3e70531@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:36 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13504 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wBgx0QqB7cFJGvLgnJUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: I-pp1hUYXINpYVrnUW0LRQ8jZMQJr6QC
X-Proofpoint-ORIG-GUID: I-pp1hUYXINpYVrnUW0LRQ8jZMQJr6QC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX5BoyKxOVpABn
 ZVczcCPLlTcWI8m8zSpc/2/C9U+u2uON84nHMqvBZcFJTxC6g7A6aWWZhempTDfYG283E6eUaN5
 k+aE57EVO5z3CxMouzY/X/uKuiAVZi0lCSmGLxnaxbOHUBs/LpZqEuu0jbOYzsS9TffMXy4hfLt
 IpyAeQPbTI69SG3NAdtgWykmEJLRsshUVLXQFJYTSlmT8oFv1ZyWNrOTwS3J6vWfcn2u+KjyeXv
 uWwfUeu/Ate1eup2pFI1mr2lKypWuyMwddu1b/Fr0q+YOl7UAcOFSEOagUFAvCNF+3mJJ1Z6bft
 3wGzER4nZ1yGz8MKpGq/LlGfejfMppMdTQFLaMwT0JZDrxusJ91ox6L5FMQeWaQIkCq3XIxAGyx
 vbMSVuDb++ZiD6YfgVI9z8WaQu1jXOyTBYp22T8j+g3DDuZ4+fGOM052+emi42rgw/EFP+1dOeC
 HVur80jBG1ghk1d9WZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098

On 3/19/26 9:55 AM, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW it may be that almost no one will use this UART for anything else
than bluetooth, so I'm not entirely against just smashing these into
the common DTSI..

Konrad
