Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC9378818
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971064; cv=none; b=pD1Z2ERkrTiUq/vsyLDNywSH2nAG9FpZClxMvAPWd+9svfy96/hHGaGrLbVe/Dkw9wuJj3KsaQNajXkleSiZ59X0riOvgNNSduLCII8pChX51KaK6iFJSLcd1Hq4sLy6BNn6r2mxSjCIONa8knjC0UYbta8ZGRb4LJsbr6FqTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971064; c=relaxed/simple;
	bh=0MY4VkCsVdTlbUk4kGmQi8tRo8dtw1l6rdIz9Yb8ER8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeZx2uJae/tsBG9la660IcL6NbKHrV+lh1YuNWbsUARYYk8mcWG1NOTMSDpK6bSHhTot9OZFZZHKI05Po3AWy1aoSwjxjRPgV+mq6rsQdBBjx45yY/wCl1MfarxcqaHJ/NnhJ4fNIAv1kyYzNbmd/AByOmxAYwhVJeqKFBeMRGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjhwu0Wc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsoVRuo/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjhwu0Wc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsoVRuo/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64503IWS3409309
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 08:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxIH95d1A5WcBtuNvKRyFf+Q5m+ChBTJGIFLAPmJO7s=; b=mjhwu0WcN2RYztsO
	92ZG+QhFa1kZeCBXD+ekfPen+2fNGxJL8VJ3AMIJyCNd6K6EWIebQw8Dk+4640o9
	h/ctGAyWMV5ZDBqx/fG5l3ddAel8Ixl1Ac9jZN1/KpYUHytdodrjrc2RTM4Zq1Ea
	DtOscmgZfa/UnNhe/wMjV8pgeFOGQ3Y5RPe0y23IyR/cjR7+TPBqPH8Y4RNZevky
	kyyj6zF9nlQkVIqAPZHEebCLTxZX7jFC7qScLNdZaMGuT7mbceZQ87wcKzFw/5X0
	ohg5O0wXHIrOMjJWgt1ZnUYXrPgG81ERpxi5xSzCbW0EchbrzvGKMZcd3p3/EV1S
	OUM7lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00u63b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 08:51:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36531a0f95bso2222168a91.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971061; x=1778575861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LxIH95d1A5WcBtuNvKRyFf+Q5m+ChBTJGIFLAPmJO7s=;
        b=OsoVRuo/d5avbrWn/S7OT7BJ+cJj1hEz6rNI9gB4lwsiv9Zm6hdRmZFKKTFCHQNpvj
         RimVQZ9ZUTlrT028PVPSp00qjufsX9SZK27NLvdRwThwnFmGSrKl01b0PInUMmBhqyzV
         2yKjInu63KaJyUNbSMC8PGyFrm322MJXkfc0aJ8WzRo1jJ/FHpfcn1KgUq8m9RdYkdLv
         8VNcE0QqPL3JYHc4jsugO64sUjBe3RYTFRzBsv6Gd/UB/w36AchN//MpC1QVpXxB8EGC
         YUlQfJ71ih3BAHkfWGNa6xNL1HPcAEkB8j9NSVYK4chuZZzLcJp7BsVbskZ8RClluzog
         ciwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971061; x=1778575861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxIH95d1A5WcBtuNvKRyFf+Q5m+ChBTJGIFLAPmJO7s=;
        b=Hw/9pIMFRj3faWqiMNtdO49Qc58hAHK123cwbd9ZbznNnenh8CDHiZC7r35yRKg9cp
         HZAFynYi/4l0lDMwrZZ+yaGMN7XmbmdKm/hFVu4RSbW9oA48lru19nKPr/bShbQc8SRd
         hWR7TaiqJai+Jn8Kw33ICz5cMUDP075suGM9e89gC1woTokdQSUA7K0qbGctadI3s6Zg
         FMj2jVWU20/rVJfZz1MWMDc8dU/wWnYT8+XmJuGbFjLmviaJKHhBNwEvz5FaMAXSIX8S
         +GNOhyf7mKyt6/jQ6gTr6VXNDbli1Oyxesfwux8xnaqNnfswNfIkNRqRKAl27pzn5GkT
         f3NA==
X-Forwarded-Encrypted: i=1; AFNElJ/dCMyt0Qq74UzciZXQiApOiJfXnaORvS3qgJN42O4NHASp8jNHKAZROmjFAviYAaQ24rpFedPYfFWx@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGNUZrAQ0fWo9aaL5CPZROHkWV6a0BA53BEpYgVorSyWQADad
	zcwXo4wp/bbZSwp0r3YlB99Su10Epc2TO01EIGNeSlUY5zs9+QWaxuVgyo7JtJKd5HNoyVBL73w
	lNlQtuMeprRNGEAlmviFfGo79q82qXj7CNr41kMoOonEcw/SbS2tkaxZsNdOMbLQ9
X-Gm-Gg: AeBDiesXVQjXI78W6Fi3JaNPoN/DMmZ9HgTjovUOTMUSv6wmvdCnT8AEoxE9aXUA1j9
	1iDun3NsAiBJF9JPmr8gPy/TTEcOASaFRVw9GQGRUz/NXAWTdwz/XCcx7Hj+v/8Spr6o2mdwF6C
	XbAfFvqlD5rxxwF9KLRilUAg4AyctU6NAn6/DZXUK9y7HXvdgH2stRn/BXZsX5mhyVGC2zepYZ9
	/eaIIDj84b06RS2seU9soGGEvwKM9BblZvuozxlAisfy0BJLz0P5j38RsSh70TuSjwBo4cUitwC
	aPNdi7pfSkgI3s1z93NMGiZWa74WUlQK/u1jRU1mmw+4NTvoZi9QSerTRRA61yihFQNgVn/PhgZ
	5z6YUOaMI1uo2ntgTEhwuOsd5Jin9EQXelMApCYu/tufv/N+mjaMs+dme11P3
X-Received: by 2002:a17:90b:4ccb:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-3650cb0af61mr13330952a91.0.1777971061157;
        Tue, 05 May 2026 01:51:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4ccb:b0:35f:bbc0:e570 with SMTP id 98e67ed59e1d1-3650cb0af61mr13330920a91.0.1777971060662;
        Tue, 05 May 2026 01:51:00 -0700 (PDT)
Received: from [10.92.198.125] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebf2affdsm17983212a91.8.2026.05.05.01.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:51:00 -0700 (PDT)
Message-ID: <8101e2c8-0593-4325-a701-84f776dd4b0a@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:20:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-1-c78b95f53b91@oss.qualcomm.com>
 <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260504-fuzzy-wapiti-of-ampleness-d8bc13@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f9af76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=4FMMPcsxIOz9NaBSvE8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MiBTYWx0ZWRfX6PJFmy424W+I
 hz5vSHwjGOXTzIu27oy64KYJhNCeQEoMAl+0mPi34B3EGUNszY9lQpIagAjkBTAB6VLwRTocmuG
 0BQ1L/Gl9M1n6OKm2kMFEg624ZCmzm/+Y9t3yczTwCznx/VjkwMwKaHX6aGpFxf+Jf4IXBLbcmM
 PjSTtlq7GClbZxeMqUzT2nFKWwp9XzKvMgjljCn2WrjnAFgi44Mkrvyz+dq+3B5MKDeO0oHCkwY
 Kr9eAbEVqP1WR+X5yslOrY0US/i7Tnlvu64kYlFLw22S0BMB9i3Avnb7OjJN+A+5fsKKe3DJdqw
 jcxJtIevoFufbbgAnCxldXmLNxH+SA5Xk5pIitcVxBkUggQy8h8GIUMfBKOBWmDFHiKoeP5pnPm
 KF5cbCMlNh6ddvuU62cn0Ca8wXdXAHXILAsHiPydv5Y8JR3bU76tJA11WD/wxxyg5qPscNpml7Q
 CuXfp/E5XngxG2lBIlg==
X-Proofpoint-GUID: a7FIJdBwILEJ3_5EFHiTjNoMbsOG5mNX
X-Proofpoint-ORIG-GUID: a7FIJdBwILEJ3_5EFHiTjNoMbsOG5mNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050082



On 04-05-2026 03:53 pm, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 12:45:44PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> qcom,cpufreq-epss-lite to represent this constrained EPSS variant.
> 
> The entire point of having a generic compatible is that it MUST match
> all devices. If it does not, then it is pointless to push that generic
> compatible.
> 
> I am speaking about qcom,cpufreq-epss.
> 
> That's nothing new, I was arguing about it already, but now you have
> confirmation of the mess introduced by generic compatibles. Solution is
> not to add more generic compatibles, because what will be next?
> qcom,cpufreq-epss-lighter?
> qcom,cpufreq-epss-more-lite?
> qcom,cpufreq-epss-high?
> 
> Same was here:
> https://lore.kernel.org/all/20240828203721.2751904-17-quic_nkela@quicinc.com/
> 
> So that's second time I object and do object for every new instance. No
> to generic compatibles, they are proven to be wrong at least for
> Qualcomm.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,

There is no functional change to the latest EPSS hardware 
(qcom,cpufreq-epss) in this case. The Shikra platform uses the CPU 
frequency scaling block, which is a predecessor of EPSS and is referred 
to as EPSS‑lite. The only difference between EPSS‑lite and EPSS is the 
maximum number of frequency look up table (LUT) entries.

This constrained EPSS block is not specific to Shikra and can be reused 
by other SoCs that implement the same hardware. Hence, we have added a 
separate epss-lite compatible and reused the existing bindings, as all 
other aspects of the hardware behavior and interface remain identical.

Thanks,
Imran

