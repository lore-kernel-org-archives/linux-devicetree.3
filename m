Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0B3D47A6
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369291; cv=none; b=eUWUyMPEiYM3VdhqvXFI/A+ChsD25T5lhaw9uO9lEvTOi0SdjJErgkuQ1Z7bYkVRkhF/6qQw7J6gPetblHrs4KZxSy2cyRjnB1xPpCB3b6tXezMb4zURusyPm9wCttMu+qnoGlAyUDg0giVDlAZ5hS7jcFjEx9SwuUd69qKDVI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369291; c=relaxed/simple;
	bh=0jGJqIEvHyuE2jd3yZfBzTnMNJvxYmCxBDEiDeKiL/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IyjneumwtpG9AxZxjGgmfF91sxHZbObMqz8M49hpkHeRp9rUj6vYKUlq2umyPVJWi6IZgGOC8X63UbDOs5O3U6wBLlBCYrz6q8UhhG+AFbZFXrdV9+RJlCweTOkZRKjQNnn/pLBX7tU64D5OlbKefB1pb00TQPjbSEUpBMD9SxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANHJD3Oi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KAgFyEI3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANHJD3Oi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KAgFyEI3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S8KDFG3123516
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wnKHfK8K/F+/mKvBliY5EUv22XSILH050ZJQu5YGI5E=; b=ANHJD3OidzSjwTJC
	D6vAaI3U05MLMhATgvzD8bqSZlaopuRWFCrAN6QjrfpvOpkb7Yi9I1yAJtGBVRWt
	LBu0fGjTtfEw+g973jtTGwY5gwGwj1RWjs8MjI3frKi5zF5UEt0GST1zK+Kf89dg
	N/q+ZCH4drFVqBMgdJpkQJH1hyCymLizGdTFMDyKnEVICe6U2h934In8wQHr+tVB
	yJ82++EvRuu+JRb3gcPHJ/0oXeypEfZPKGfiyUwOCv4wRE/+DDDaamqdrOj5/Tmm
	Z6G6FIX1jZQ7j7Qs33qn+xtwLtt75xF2yd/fybmPzzd7dw6GCtz9a33k2/gHMJko
	jtBciA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgmw3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 09:41:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8edcc885cd3so188350385a.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777369289; x=1777974089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnKHfK8K/F+/mKvBliY5EUv22XSILH050ZJQu5YGI5E=;
        b=KAgFyEI3ThUM3MHNvvLlN0Dy40NjOHWCmmuQhMnUSoxz86hWSZfbPYOrBvBfcnyyKQ
         Ij63O4Gqgge+zuAad74Fo/2Srde9mSho6zLweZy4TC8LOFLj6WTJNyhabzV3looqryUl
         uqmuxSLAxUSVEDNl7ljjsFZMd4JQqTL9MfLVzF7QRPQjCZB/SqwFlQr1VRc5G0PjXMQr
         anOIDueLFqA3u2LjQgGaflUIOqXZc6EfdFfX5nScq0JxaM6D3VmK/AJBiy8Xl1wjYBp4
         TCJqS1cXR92gJPDViS+VHhJmx7ul5neAOmz0t/ik+FPC4PxGOQJiBFrQUChDSDmj2Fxd
         wPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369289; x=1777974089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnKHfK8K/F+/mKvBliY5EUv22XSILH050ZJQu5YGI5E=;
        b=OJtIft9i6DH/LSHBsLd0uECy6debctdUOL04HczNaOJuHnJhuo4w8y8fyjZamdWWP0
         O9ZQ/T5L4rEHx+wvY2vjSWdGWK07t9lB9sWcRRnBXTyXJWd5nzsaexFug9TlRb1pEocV
         EOOqDY93PzUSrb5F+Bcmf8ZSOjpxJJjYIwRo9PfM0vYo/FZYZg8zDgS3RBgy+MJ7HaLR
         bE3+vMgp9rvpqdZTgCKqUe6UMldthe09HSwEQTnuHvSm7lLc0uImR/tuW98v2yB9Q1KG
         7s3vcuBDr2BZSay4amsJtlFU/7EBynu6BksWomSvyI7L+B9aSkp/qcT8OEz6vU3DvtW/
         dFgg==
X-Forwarded-Encrypted: i=1; AFNElJ9xh7P4RNnvbcyJdgfbhhw0Vp0l3KQ0PXbhSFK+t7cUAPt39PFqr2tMvPKvAqXZ6IIABst+QpqoHVNO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5ciMIJ1oO1QwGGG8xO/bsISrcfWfnzrWkdJErM0mT9Dw/wXE
	VJNjstLLMp3MiniR6+rOdz6Zv5kq9SyD3D8iWYHHwcWhShAqnIEyCQd20k4Nk6fIdjTKr3bftWf
	gdqDxoGrDhg9mEfgs7E4n2quEKPrH2OXcRSkyprOnqJoASFcmCXVt2+qo2yiGhAri
X-Gm-Gg: AeBDietFYZrNRlyHc33inyVaNqUIrfzN4lS/Sm3VKUcfEx3ImDL5C4Rhfm/6N2CaRXE
	imzItYiRZXEuE60J94ZwjgxE65h/HqgC/CrizCxgexo0wm1RTmQwEMxmvf5vYF/SsZiI+HSey2/
	0T9h7qW78ddgG0tV3svX2iof4526XJM08a+Z6CdHHsODITHojZslz9OjMhadvDdC1WuwMdFnLWD
	KWo+4kbjFouLS+dkMbYcoB0eEzM79b+sqhgGfuNtmBbzEdJzFFuqetbiW3NOEE0X53ZeYHfmxDY
	OpsB3e+nuN6Rvj13S5qdlwlKKr9LGXZCFhlZVWr3hakNnlgErevjUoUM5N2k74NwWIpEAVxDjB5
	UnISeODD3QT/bH8wUveYuwajnfwuJ4xGH7n1DffiMu0M0vkO3EqOEQnI3ydmZHC9d9VnuXly84q
	WWrH8Ytn/WgreWwA==
X-Received: by 2002:a05:6214:5099:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b3e284647emr26420656d6.1.1777369289024;
        Tue, 28 Apr 2026 02:41:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5099:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8b3e284647emr26420426d6.1.1777369288549;
        Tue, 28 Apr 2026 02:41:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb80c581f6esm74064366b.63.2026.04.28.02.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 02:41:27 -0700 (PDT)
Message-ID: <fc786276-6397-43c5-83aa-1352b4016f09@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:41:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for Shikra IoT
 variants
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
 <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-shikra-socid-v1-2-6ff16bad5ea2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4NCBTYWx0ZWRfX4AV4f0/dGv42
 ugYYL2xLYHGyGb0LQE4aKqDeoFNLE6iyknQ6cTOoC1LS2CZsYRB4imae+Dk8VKK8y2ajftSRLBC
 84IaqlE1YrOgDpqTtLl6ZRXhFYfpMQzfa96CVUp1bzPCydkqQXhYFlPDLmviqEw7Aq2id3Zfs1h
 F9n9N2o+T/GGmqpwrq/JcmhotAgB1bDSoebpKvOolk8GwFQuQyDJCv7PpjDnslaSeQ/R4NQmCvS
 AJ2Fovz/Ia6SSqw0sxB1oCAgO9/R4WvErnR9JOPAXLZYtrFjqbZ7PgEhGI+dFJjxn5rnnxCa7Uh
 61WhQpYJ4v16B56agtXCKlEIHocRrZoXbwrh4UHu01ykN7TVUa5F6oHtzqh2qrSJ71Yi4jNyqO/
 4vNEQPw1xs6I9g2JObZM9hVoxTLqFNMP6HdM7ZVYewx8dlT6A5cDlKpAmJUcKTQ92MYnOYYRNLl
 9gd8bHX0NISrAu85w2Q==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69f080ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vUAe5X8XSJDf5Ne0D5cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4uLHNSqZBstYeKA021V20FwCZ00UrT3M
X-Proofpoint-ORIG-GUID: 4uLHNSqZBstYeKA021V20FwCZ00UrT3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280084

On 4/28/26 11:17 AM, Komal Bajaj wrote:
> Add SoC ID for Shikra IoT variants: CQ2390M, CQ2390S and IQ2390S.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
