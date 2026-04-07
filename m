Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C7D3A6EF4
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554346; cv=none; b=DZux4Y1Tc4D+aAv1huuO3IuAzJBGp3cTu7PEGyW5eLcf2Dck5dQh5S0s3df9R9VLFAq1j+YRIDeWCG5OXeO9oX/8T1sQYkkW5R9tcsQcBGvjEaHEn0ZE3fpuIG+bukBDvzgh4oD64/PNZv4OIY7/9JJPEkc693/BTA6tyOIJk4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554346; c=relaxed/simple;
	bh=3FYqamKMrS6MmNVhAXadCHdnNiqUke0+tYR1xo8s8pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZalRwNaI8ZzH+Vu0gzJErcOOogroZGdDY67p7qEbAdzF5RMVRZBjRJ1TRCtrnmTLyz0Hcoz4crD+viInVgvAbdrg0jEmtitw3TMvp+COzxODmuP0J3bOzq+1HRO+wkVGlrcS7zUONoXaeB4RVxzCQxEFH2hQk2YBCjQBqYLxt20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOgsPHmh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g2pYsZQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOgsPHmh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g2pYsZQD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376qZ4j4009170
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f4X4jgjHKZ+9UvPA3i8Sct9L6+UDMLDHTXqdlnuxTOA=; b=EOgsPHmhJNIdu2hB
	Bm02ClVG+5QjDrkpIxEEjtzGJvVPRfjaSnTNdGW6cFElb37GE9XGshbo1aJRSkXI
	9SSGJk0X8B3TQaNY9/a/xFQRglL5iGhpTBVJZKPr3Ghinyh+wNhfJ0Ct130810Go
	uKCad0zzAxIFAXA2519giHgsS8rmioq/7KVgBOT6QXrs3XTcC9RiN2RW0g3GkNvV
	u6XlO86BqvTlwM0DgjoB1dfm8tqI+LRBUAq2jOQg8G+fjCx57Y532cKqFjZhgc0F
	LEdtQFAdHgdfeZXM/aJbFF8aazHs42ibD9mDZPZ44onjgv8fGIWjimSyYe33QGIt
	zicLTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrkt1e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:32:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so18297551cf.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554340; x=1776159140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4X4jgjHKZ+9UvPA3i8Sct9L6+UDMLDHTXqdlnuxTOA=;
        b=g2pYsZQDRGuehTGb/djFnZuRd4F0pkokz9Cw4l70jIIOA4I3TSOgEHoyPBIZr9Z1Vz
         /76dOfqBf2x9zB3rNSwYUWJr019XZliDhN17nCqK+fC2zT9Wni1bRHXkoJ6Fh1CP7hQG
         4CgdrOTFHu3fL/+C7l2TJu7ABms+Hk6eIMlC7HJP87jat+Ga/DMqDSzUmEQ2MDARG2dd
         f5FwReAIUSUGoIVeZ6K0c2lCZE24KWIPBfVEelMiOslpFyvQAfBzcgzkCV04IA69OTiT
         J+raDxg43Cpgd0FO5CO6SqoRowk68GWdkJ7+SK1V8bqE5Y4bX/sthhChqbtnxt7nStXM
         D0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554340; x=1776159140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4X4jgjHKZ+9UvPA3i8Sct9L6+UDMLDHTXqdlnuxTOA=;
        b=oIrJVoaM7H5Fqo5X3bPKH01TqOWZNR7wj58TwpAyT2rlR6qPZ+YYZAsQnrvhhYaWxT
         3ZTvj6mNVX6vPer6jRXnFb9j+llHX12hMcjapKa8kThEoYH3idFswDG9WSf+B9sZgAZ0
         yqlLCxy72/E1a1zlZ+w2fi2uTBAlBE2I97sjMWwn81HABzwPuYdGvbL2mZW7KiF7+PAv
         pLd7Ui/rpsXjAZya2QxbPvoMP9TogMJKMgBvV7WVptNGFD+YqmWh6Ff884w439zEBDo5
         cb8T+6Lsl4z2QgtcBnGGfAKfVQEdP+r7f7x4eT+FyfhDqTgwLiVOqbDQt22IlBGRVkeF
         /6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWql5n/ieJi4WwkO/GqB885VUX8cHQLMa8c66he/UL6gMpgSWQAfVj7T7ZMnygkE2pqjYfPYgetbMqc@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6Eaa6ns1GkoRTa5kXoJJKRxjoUx6pRMgSLcMkzh4gks3bVmi
	l3SLpSSeMFC29M5oPQ7iLztDfQNaeKKvErNar6UAppqIVnJ0Xe4LO/wl7j5lZCDyVj/SDiqv9Dl
	fxuc57JbSAtw77AxwtTWuBrWO3ZACvuAvJvMK+9fkrf+JptUf9pdhA2VVN4y72yOY
X-Gm-Gg: AeBDiesZgoYfH053hiZ0RBGYsH9JwW3nbK1TF6btxwj1Qd0T0ix1iAsXvCAID7ZOuwa
	0ZDs+e33jlkkORXngid5vzLjEd17S5PSlKjBqWuxPmWVvzxzbo09WAgJmzAHyOKpLaLNLlDFIS7
	18MPjWNtwRtH1FTqMLnIIamGSFw5qocbOyievBP2Bz+++/VTmf5Ap7/e/K8tLZqBhQPdIviu8se
	HTTi8rtRL8yXMsE3HaOmWfdcrxRX6s4/JvhEBglnSgKuWOUa9rCW17OaemkQOjqC1qgNhgkePuk
	qat0qFv9VUE1RX4YwPkY927sAxA8Se5+I0D4TtnnzHHDM2GjxRchgeuzTham4a3m+c2+24m6OC7
	zHW49A2yoOZmWoXcdWt1Ghs7Z5I+1Y2tNDnHlGvMo8YTjscye+22Q8Hhj8KJMC4/HZRcIPqNnKU
	wMnNs=
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr4957191cf.1.1775554339688;
        Tue, 07 Apr 2026 02:32:19 -0700 (PDT)
X-Received: by 2002:a05:622a:988:b0:50d:a978:6ece with SMTP id d75a77b69052e-50da9787155mr4956961cf.1.1775554339333;
        Tue, 07 Apr 2026 02:32:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c99ec7csm533539066b.14.2026.04.07.02.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:32:18 -0700 (PDT)
Message-ID: <4e65c74e-d03b-479e-b9ae-234f1ca1b535@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:32:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: kaanpaali: Add USB support for
 QRD platform
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260406174613.3388987-1-krishna.kurapati@oss.qualcomm.com>
 <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406174613.3388987-4-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rrz16imK c=1 sm=1 tr=0 ts=69d4cf24 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=lzcha0RWJE8jdVfZHw0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: j4Pbnz3RJCwbEi5VLxF32ZldTsWYEY_o
X-Proofpoint-GUID: j4Pbnz3RJCwbEi5VLxF32ZldTsWYEY_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX93PADM5hPKiI
 hGYlQoNVpfe0gwtQSHQJuvH+uX0bTZHBhcUlcYH4d1hRATs2wirwsEQDyEblJEtR0Ci/nhIzf8N
 kvvY4Nt8ylYbzPWiwZsRAgS1kQ3GwA8d/h6pZZYeeXfx2Lt5lnj7IpuDVIwAEQQ23eqY2gbhugS
 TvYv1Na+mXepyc4IhdCw9QljzdtQDhMlujYhPOSkKNU0LOfYIpQiAURB7eBbzA3RiAYsNtYBUm/
 ucP4eWz7lSF1y8CUQ0m/ehhcsZ5erMfMZQReV/TgUHr9PBVRzziyqvlT3kT7JDKgOG1LhkAbZSq
 JZJswZZ+i5fr14EfqWNhqoWjtBDOX190L3d+36SkMFj2fCvf7RpaxueupqpMejjD8CQSEuqX4nM
 NuSzsBm1dwEjVv5gnHvE31/mqau8JaI78xIDMppf8ouDhLgnjOyooona9bck50OU07YvUG6smYs
 cpKFoRSJkZGoipmaTCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070087

On 4/6/26 7:46 PM, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Enable USB support on Kaanapali QRD variant. Enable USB controller in
> device mode till glink node is added.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> +&usb_dp_qmpphy {

nit: the addition of the "_dp_" bit which is absent on other platforms
in the label made the reference unsorted

Konrad

> +	vdda-phy-supply = <&vreg_l1d_1p2>;
> +	vdda-pll-supply = <&vreg_l4f_0p8>;
> +
> +	status = "okay";
> +};
