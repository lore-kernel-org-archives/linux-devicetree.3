Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F832566E9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 03:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282890; cv=none; b=UhV+3fKSwqQh4/YjFBof3KPZr8/Eri7S5tvFlAMVAUNzD2SMDyMlJMFj4DTxdIt/jaAv6vNsMptCZPc2gJBKA2+0sMd7YKpChghaf0LMUFBHmDhoqNZSiwn7hddWH7A39YQWYTrLotkzTct+n3Yo0HB1HaPn/sKYH0RqbXKj8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282890; c=relaxed/simple;
	bh=V43roggDeue7KGYIxDOJm5DBfzT8v9TGwjS0aX/8l8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tli3SP1+ClsSZXy7l76fe1l8h5wP+lixE4UtFerahYKT+nkl00jpz6WdME+tAGUK7Jhpvu2qIcTPv7LaZfnoJV8SN4H4IL5GkM3vUt8lRexYtJ2bo+73KwSQKQVm+dtbHmiP0LTuALVpiermLt9fUZVHl1JiJJEx11dYe7yi1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eiv0R4Xf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1x9E+O3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eiv0R4Xf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1x9E+O3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65120Hki581303
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 03:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=; b=Eiv0R4XfCjL2/s+u
	sCliQ+wCJIF51CIwJ7+eD+JsmjOR11IEpy2lpSU65GfRo8Mh2UI4W9zWpNy0xkOm
	OSB1ttB2d0uKtJf3G32tdV2aSqzu1AYlz5vF6X2i1ix+6cFpmemObcZg79V4fHFN
	1dcRu0bS+NB3KsiSIjqJ7ksvIKLeMoQ3Fl+nIwOXy+ZYgDpZa3l9Dml5ttvdtgVd
	D5P04boDeWl6hsSUTrXFBWejYrjX3WicswND/jyYTIH4pm3oRL2k5t+z1wDINmw7
	iX1QWM38cC18KED/Jwtw0xkVvfiiEswkP3+7v646bXiFCyyNdePBm2aZaLVFeFUB
	XEHgfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pnyr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 03:01:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso2553963a91.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 20:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780282886; x=1780887686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=;
        b=D1x9E+O3qzCQ0h4zu3NwwaC92lZHQLLam89aJDggqFkKNsO9X60mp7lberHswU3mQR
         3HsKYKAV+mVnp1MQAaGCp19mnZfr8S10+nKf+3cjjsLT+ySS4NSuE9jZ9qikg/UuolJi
         FJ1oeFlMwkB3fHHbyZHDrG1vodr8FD0YXKLfbuK3Zfoz74Y4r5UaTJm/qRVJqjl4o7VD
         Iq68Idvg9oggSg88HYiBwDpPbByyeJc7hWF9rFmS/NrY70nTb5srRtvo/U/VDg4OIoIq
         iDzae4OHyvwdhf6N/1OXQUFZBliowvUEHSE1Y3PWvzGmKVP/qEb3cQkuQ3CdFd8myaz+
         lGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282886; x=1780887686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP43wrZkySat33onj8AR4kzar6kKVaip+fGpyAmVilw=;
        b=WngO1PHJbahoqnBrye5CvtS5H3AYD6vsK+6S4r8zGr923aMxv/6BMZU2oaJzrxe2XR
         rJb4Mh81MPviWvUuJPlKOQ1KuSPUzdqhxYL9Pnw0TMV1V+h6dmWmf2rlHBcDwFbN9mms
         jt0NWrQb+dDs7xGntQqVNnZL0IPqVlBWoqHtiVKMZxqWXIYqsP+hETYGi6YmJ3WJGMvw
         mhFuAslC+7FtpAVicUbK2VELhdvJlAsJGJiIZkjJjchsqTuoc74lfXw5+xamGAN9vAcF
         o4JVBef9kXeX44KNiIGy3WjZiPWXBn9EoHKz/6OtSB4GtT9bmloiyAbfdA/5p5o2EQU9
         8L0A==
X-Forwarded-Encrypted: i=1; AFNElJ+kwfH5a/LX/JK4fDvg0WMvsMPsde8znk8andY0Eeoo64nZc0Syf1oFSE2FlYhQC8jzHBpeOevw1QPV@vger.kernel.org
X-Gm-Message-State: AOJu0YzcT5OmvpMYfGvBvqqCF/5tz8Xvz4oA34vDc6/akhdth4YVSh4p
	YDEm1ra0OkdR16WFzC3yEIDM8VAfpv1cClMzYonaXsXHsBY0ESqibfIyta8Yc72EDJJXxpjgExs
	Ihf/Hdqo/Vw0Fjel5QVfbfyhLsV9GZAjKID/MECjx8PXOXDfrzv6cBFsXuPrg0EJX
X-Gm-Gg: Acq92OEHzG55L0D7pF7C2v7A8AFM7yc2qYngX069nOvcJwlqtbdaAvI4fGL9qnfAI+V
	OXnfy5Gr7IoqrSkPVUvtr33r3YB/d05eAjaKEartqvKw/tRWzl2AFiCgJHGEHlmEoqHWyQQi7/u
	L0SMp6I6Jw5nM/7NQ9M5EANlD7nqYr3d3N5mc3IR2IpjLfnBdSzzcF3QlVrV8/JfAsx1aqAPHOt
	n66454V9aEG5LV1R3MkXC4gL6GktdVcgfoy9yGxPIVsnoCSzYzRSo7Io7+ARmAyyo7gSYyZsqg8
	tp8UqqCzUIxegLqaD8ryIOdG1mLDYJHR6u+PiQ4ZlVxEvk/qQK2qgNA+ijZwC6d+yjo5iuNoJlv
	SbrPCmyNZE6X9H0QwUKDTEkWZFTvPdR6j/rvbWaCsYFIM/J1iUfrKv5T/cEs=
X-Received: by 2002:a17:90b:5292:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36c2eb8be57mr9526843a91.0.1780282886596;
        Sun, 31 May 2026 20:01:26 -0700 (PDT)
X-Received: by 2002:a17:90b:5292:b0:369:f48a:f24b with SMTP id 98e67ed59e1d1-36c2eb8be57mr9526823a91.0.1780282886129;
        Sun, 31 May 2026 20:01:26 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02b8b57sm9545856a91.7.2026.05.31.20.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 20:01:25 -0700 (PDT)
Message-ID: <16d030b5-5e37-44a3-b879-e016655705fb@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 08:30:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add the definition for the
 USB3 DP PHY reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-1-6d9e7fee2998@oss.qualcomm.com>
 <20260530-venomous-ultra-sidewinder-42bccc@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260530-venomous-ultra-sidewinder-42bccc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FJKsb92Q_3aVv_qCjK2VlvsVYX1uUF20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDAyOCBTYWx0ZWRfX3rzI0J7AQYxo
 +HW2maF80x5YzehuaG4/TMVu+m3nAYUdSsXcYkRSKW6kf9RNx5gtz0nbql5XrvZBOU14p1m0JKW
 XPy9Zl9kQI3v+9ym5pEHrGIP7fSuYKmLQjkHNr3hjiCNkc3UoT+UaSvzqES039RrfS1+kv2h67E
 kS6z10L9QsAwv+cXqr4hVZI5rV2imFTPB50gNA7y8AvHALiMsGB1VjEQZReNhdUnMheZkPEDEXW
 KlcGLEtJOdurdqRZ/ME56hn5odD6Wo+Hv9pki38ZpZAMQScw1URTAUzwkObZXnm+OnYlGhrb7t0
 l/fmt8RfTbpO53u9sCVwbG8Hfhy06BHoaiu3mGZkTLj1ap/2ww/HwPHYfq2rzUK/jAa991RW2BI
 8fw0LZEqusMr5QokK+LCRtzTK0ZZ+WNeZrNm7CW392cfOC66fSzIp7jlcv0iB9kN9gnufz1pQlQ
 rZkTUrKqEVibJRGEZfQ==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1cf607 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ywhEO0bdmV-DYKbozKoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FJKsb92Q_3aVv_qCjK2VlvsVYX1uUF20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010028



On 30-05-2026 04:59 pm, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 06:24:44PM +0530, Imran Shaik wrote:
>> Provide the GCC USB3 DP PHY reset definition in dt-bindings for the
>> Qualcomm Shikra SoC.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
> 
> So just squash into the dependency.
> 

Sure, will squash these changes into the GCC series.

Thanks,
Imran

> Best regards,
> Krzysztof
> 

