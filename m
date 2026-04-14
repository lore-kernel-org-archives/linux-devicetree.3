Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866638C431
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154068; cv=none; b=PLbO4xoqLosgH2gHrly2xEnfIhkd5FP0JtRScWRrDQbEe/pWn4UrCxVESms1dWe5jDKP1ossoojQFg4Gd1f+3KRRQTtpxu+e4NLHSvxQYIUd+pzDsRhjbdVXzcV4LxgWQCrI1eXGF05QZM6nwhDeIznxkO4Kc4t+oImbkWOaSEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154068; c=relaxed/simple;
	bh=OLKOuGsif3V56u3r9kWEhyinaZAk4o5fTK6aRtlhGPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bEWGm5UHIRofUwOD5Ns4ZxwK9o4LQdlEa44YryjJkA57dhmOlXVcsB7Xn+ENquSE8WyNDhbnM0ChpvoWGFHJZwo1QltxeL6ZJDewLwtSm+9rJv9G9KuCVkYXLb4M1nMXKJnPP6HkVcXYNgQjC3MvZGmATielQ84X3+QhEZ6Fdt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EnLp6ODn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aT3zwIse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EnLp6ODn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aT3zwIse"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6XvZL361811
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCvJGpb4ACAKcgA6XiUMvnz54WJai0NryWLAKWQbpm8=; b=EnLp6ODne3qDdvqS
	yIfdoQNxYPHN9fl6GOGTsOukGYDaKjeaXKZ1zOXLmJSkxUyQm7AfQYN226zNTQqL
	S9gRLD2hmdtrMemFRQj6MlnSheOKn5CwC8bWhRA4hcCDRrbfmmSYLmBjPYR6u5mV
	TEUm9BEqhc0UrrWFKUKOTzvEkvF6flnhQ+gVkTG52yXsXczYAPtZp2AkY3KMKU2p
	d8ZZiDix+b1NqgJ7bCtVDTpw/xMFWdwseFWzb3SkKzrO71xObNj2i6yty5XDU+Ef
	lp/mamo3HuYM3BU2kUCHH9E5jGNm16LRa3Hg5nc5uwdtae9uQAw8MMlSCv0jxk7C
	lXH9Vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870sqg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 08:07:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d63aeaaedaso129561885a.2
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776154065; x=1776758865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCvJGpb4ACAKcgA6XiUMvnz54WJai0NryWLAKWQbpm8=;
        b=aT3zwIseGz8spfJWsIkHraVuy6K39GGTJTT87ooJ1+ZdafLEEbZkM94c442GJKINGe
         9oWJCLMSR//eJqBKXAy5xm9EnMM8+XLOHZsNr8xbMpdSxyekv0vjzNf0ZWTGIJS49EgT
         9h5pQ855BK9ecDmzHmQq7uTgi+0lcbE69sEalmX6rJNBckhle55WW0EQmeZ3sTLb0VWh
         mb65v25k2rZv0P0CGqwxbBHy+PlHonbp/2QtXcrzb7uPh/zTbMgPQWarDRjnIEQdTRmQ
         HCKDcrsvfBuDeRELSaGii8uPB21m2ehwD31D/lRboFYN0u1RUZTxIqWXJLOuCsWg2BUP
         LVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154065; x=1776758865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCvJGpb4ACAKcgA6XiUMvnz54WJai0NryWLAKWQbpm8=;
        b=nBtg6Z50FXNLjUTnOjUg80sEqCy8xrIp3dzuyv41Q7VKqFmI5R49ZhGI5tQT4tF6qt
         LHgdqcd6rd7wB1O36cTy79y5UZ9H7zxa2WAHU3WMEXxFQufNTGctvd3IfA7oYQ84U7iG
         LdWNsDLVQ9qotP7fXiRnRqRHumMlsliG+ik2DDno0G0nv/lk+rAaBmKqDgRDTn+FNv2a
         yvaFQS/T6TRSQ2tZifarX7v1ZtvAhk5q85/0Sl/BoOF3z0BBTh/obRTpoI/wS+9kwe74
         DuTJtcXP/U5kCnQjmjbnzGVGNpK6Kz5zRAOcFi9dacEqHe5+og7WX3SkoHpl7R1+IvNA
         rtvA==
X-Forwarded-Encrypted: i=1; AFNElJ+MtX8BiizurJ0Wq2my8SgR5PN+6+qvrhVs5Yo+XPHzLgl4qCWZIivtAlWM1IlIKirCUKMXCD73M7GB@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTrZ91QzDAyCE7RknheGLbxkq/WkEZBiaKiPQqbnBAYftGdRo
	5e6YsLHpmR3Rxavj+JskaDtGWp0i5zIqshcNUPVBIz8n1RaCqmcazVKdJbj9oTvbRtPzY0lV+tB
	v9j+wl6HsPpKor1oTFUtsqsRAzL4wyqV1Cy33GBIJ+B/9ZP7nQdzGM+FxsqiofK2c
X-Gm-Gg: AeBDietyXEpOqlCWhC8h59vkIm16GPa/X6G90Ooxp2qx7fhoZI+vMLrDu6tFghEwPkW
	D7pRkvkgZnbsC6kGUTc7KjE+vnvwdzKUCbIODYFsy4R4EMU3LcFRsxGKHsFydsCfckTjc5HymAM
	7XD3vkX7jQn6cO3RvETeSBuWUd/Uez+3oULHOCfDh5Lfh/g2g178SHhqgT+a/gvty6yT365SIKr
	OVKh+dKkZz1RDbC/16y0xbZpmg0oa1r3g6VzIf8q+6QXOCfHZ2nE7fBKtl9azKdsELrEZD/FzyN
	jwRgj856iAghD8hiQkXWIapYxdWOhQA1tyfpzJuo1oUREPzPYySYy7qxPG6yT7R5lvXFZ6CgoPo
	UEKN+ysbhe+1YNEtJib9gdMnrpF1QcCYuWBs2tIfQadVgRcyByc+tUOaeqRy7kdxDfeVqibx04O
	3Lng0dVeHD3aapgA==
X-Received: by 2002:a05:622a:1f95:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50dd58548f7mr167580891cf.0.1776154065129;
        Tue, 14 Apr 2026 01:07:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50dd58548f7mr167580671cf.0.1776154064640;
        Tue, 14 Apr 2026 01:07:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm376075166b.38.2026.04.14.01.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:07:43 -0700 (PDT)
Message-ID: <caa589af-f026-4664-8fb9-6b23b0e087f9@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:07:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
To: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
 <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c63abc0e-e060-4825-b595-a46ddf262673@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69ddf5d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=wxLWbCv9AAAA:8 a=cgleJTQgNJ6gBMWI9rcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NSBTYWx0ZWRfXyNlp1U/2PgL5
 T9GkPvYZlqn7ByNW7XXl8ao2ljJduMJIl7l5OhUb3CHc39MKIdoUSwg8ld5VNOMHhrPT9d1DFOi
 fqqQJhT+i+gFnuZzZQamssPHy+ECtZDED6PchiQ3e92VpgWb9xqMVOK5hNYE6dC3ry37qCkNdgR
 //T10zFLnPcgZ+8NcFwU8St9xfyk7ShZCEAuReDSif6Afr7NGdb+oQ/xKmzzxQsOJZr+sZvjGgA
 y0q1DgcdfDlB5itmEUHAvSRhHUjhEkO0jddPOgL1yz1f8Bf0nGcCn9d/Rl5bnFNDFbLaFOlJl+b
 de3NDS2p3cjaUjTq/7gikUA+vnPqPg/11bjspYqRtv/lZVXXfNb4ZCIVY6rHYsFFmgPmIUWIjdx
 fgZ81FPkQ9C5aRDIfXDBLGzaBvsI4RLGZPlpJ7FhClleQro4S3n1J5JjWzGbB/SnXZLf+kjuKgt
 pNOrOXpGqFpzyafnvpg==
X-Proofpoint-GUID: fPfMX5JeLT1rMRahTN5AU1FuAlezI9iH
X-Proofpoint-ORIG-GUID: fPfMX5JeLT1rMRahTN5AU1FuAlezI9iH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140075

On 4/14/26 10:06 AM, Konrad Dybcio wrote:
> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>
>> msm8960 uses the same clock descriptor as apq8064 but lacked the
> 
> This doesn't quite seem to be the case, some fields differ and
> apq8064 additionally has:
> 
> QCOM_RPM_PM8821_SMPS1
> QCOM_RPM_PM8821_SMPS2
> QCOM_RPM_PM8821_LDO1
> QCOM_RPM_VDDMIN_GPIO

Ah hmm, the MFD driver seems to provide *all* RPM resources..

Konrad
