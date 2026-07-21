Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEE54652
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784653350; cv=none; b=KVIowMPSNJiTzbQ5ahixWfue7pV1EQQ0S74EbHfo01A79oigQiZHYrB4jEzsLYkU7LwKwtbnT1thrMALl55D5bbBMY2c/FS8x08bnbEP8q+OPZdmqG2eggT53OikshsygmFjdyd2LZb3OjsouxoC5w0j+iPvZpFd6x9FU0TCyf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784653350; c=relaxed/simple;
	bh=CCLHL/9qXuOIxscGN994AkztuMhg3vqvjAApjxBs4es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poOyIIiOAi0OT7FQutj7ttbHgwmH3YvkIn/eX8QaGDVOfFPfs1ka0sYPBJPurjHEiDooFrZwzpodv/EO7KInugvCpDv1ZCKMYYdxsztkPLSUXV3vQZhszgpRwP7KdIC5xZYICD3hGLz7A+XDF0H+wYrV0oJoLOK9OM6PH+aiEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXNsyxPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxdmU4W1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXNsyxPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxdmU4W1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2Th12548659
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=; b=CXNsyxPHF2U7S3p4
	qq2uHYH+gObG9K7eS7z1Y0Y8BsyIlwFQOY6pvyafukarBFWF4V9p0Ig+OZhXExv7
	71gG1/tdKZUL1r36LmsJzMDYBmZX9+JboS2SPU/0JNWbbiD7RLiq+GbqlXKoHJ5t
	BqanG7gbY0QCAZZ7iVkciv9UlQzObiqHe4fHvOZNVxNE6AaFP5RdEBsKbWq51qdG
	kC30T+94hstZLkan1ApWaqrXMUu7zxiO8An90UeJuEcaPPusPOmnYIEoTEroyrcG
	U7KGohJhtpqKgD8+syKC9afBNUpspA4sCkKTfc78hGXJfsWH6T+NkqFi19zB9TRb
	fP48ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3j06e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 17:02:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b81c13b0so35414485a.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784653345; x=1785258145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=WxdmU4W19E+X/dmax9fAaGkFc9z56l0Iavo7Sgj3qStEJn4vx3lS9P3XnQ97ik3ttn
         7tgO0XH9mddVd2FTNmVoObD7ToGgGj+V1zxkYLMyU7Wmyiq1sNkmwbk45WcF8m6mYFmi
         MOwvpqdKZbRLW1wbgz4VBECSOAMzfU3/6eVDwKWIffcS5kdt2ZLdkLuZVu2K2/maZ4hn
         lNL5i20o2e2rsPQH07ynqotX1kAbn3HwYRu+UFOLyPkZR4+ILr+vp3IhGeTNLOqV21aD
         Ta+h9sg3Ssi9H7Ypizd7fw8Dx0qDoAx4N7LghaYwcgBC0ymIX7yyUQxxMqO57m0mT9P0
         A0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784653345; x=1785258145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0quPAI0p/ihpRaYsyDrrGjjtcU8ulVk1wA2nTdZt+CE=;
        b=aBAVuPESZ9ZY1kUBp4VymscqY8TfockHjc7tYxIvy7GwpBhyJWjaU7MynIL3+owQH3
         phT6To4pPRrqQ4Jex9ZDNTGZ2LCaLWRcsGJ3dxP/zv5csuM7BFFfetOmr7TtAKRfJqr9
         3gfDkhHK/HHls3OBqSpFNijMUzXzPokItlCRmfLmdy9FD2lPmn1qsrpMUduFSMsUEA4q
         0a6zifTeL9ayNF/oaMwKIIICsTsZv81Bbf2b84xATGQiRQ0uSR1VTz1HlVtmn3fcoc1i
         tK2RaP6WhtsBYox9hCWV8WiljM7zohKit+LCjHN4BlyYSPxPVMdo1Px3F5Cjk7yhAWmv
         aqkA==
X-Forwarded-Encrypted: i=1; AHgh+Rpu6+4gXcsvOPl+a+1wBKB29lEsy2J4yH1hXOhxKlQGMRH4RKYzOqto4Jp/PY6/aUgop/QtOfw0Dc5a@vger.kernel.org
X-Gm-Message-State: AOJu0YxCvwngxFH+Q1DUwIWyU50a9yD4YgHhzUkEoo28RUs9Kl0SBpPe
	fq8sjql1xytOk9XepvRegx0Fk1Vm1QDOg8zCpSOHfog/MwKKJcVCFbc4Om9elrWWOfCKZL5NlbY
	TDHyFhk5MYB8vwGGE4/J03ZrN4ci+6hvVV79oLaSN+sDuY9IPfcc2DJ0lKIbXvzShPyyJxF9a
X-Gm-Gg: AfdE7ckrEVxifiY8ozTvAxOlhjDf/MZJJcwRCJloA0pwDaZmGvnFEWmSlfRcb+2CVpC
	tL5iLNXJJeiG8jQSRcNl+GgJth3WmjfXyEkHyNz4f7Iuv8R5dl/m/gIvtYPDZ0OrVTNMmnRd+8u
	OONms+vLTRR4kaEx+qZm1gcS8zgWRf5u2507D2Tv4vcCs2epoY2F7aJ2zq4tpRUqvDCcv/gkrUb
	sLpPJ+7onkoZDFl0YMR7rIYfereEQWxIYkDGJonZu4k9Z6xv9o3O83ed3t/wseE/Ggm74jeX+Pe
	vby0iH42HNYfdCAXIEvJBOxN0raZ785IYfWt5WQvcGLG2JM/M4rXL8CnfL3St84Cx6iPCXrJPzZ
	Ly4aBqeRdiHXqr1pbApfYLqSF
X-Received: by 2002:a05:620a:40d0:b0:92e:5023:78b with SMTP id af79cd13be357-930e70adb31mr376898885a.5.1784653345000;
        Tue, 21 Jul 2026 10:02:25 -0700 (PDT)
X-Received: by 2002:a05:620a:40d0:b0:92e:5023:78b with SMTP id af79cd13be357-930e70adb31mr376893985a.5.1784653344414;
        Tue, 21 Jul 2026 10:02:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90205sm635866b.33.2026.07.21.10.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:02:23 -0700 (PDT)
Message-ID: <bb52643a-2940-48bf-b2c6-9383064f3086@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:02:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] arm64: dts: qcom: sm8650-qrd: add SPMI ADC
 channels and thermal nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260721-topic-sm8x50-adc5-gen3-v6-0-a507f4a1e537@linaro.org>
 <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-topic-sm8x50-adc5-gen3-v6-4-a507f4a1e537@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfX3D2QWVr8qi8/
 dxYUlTVoN8v2p/aO3KFMLMGhvZW0LYcFXF4gmVrBQW4Jauz9pLYkRBB/ydUyCMr1W9hsWExCMYS
 HqryGOHpcUjYj7iBRPOx4WN9MvJuRpOqKR6z1Sb4lBn2My7ULzwQ8AW9It5uV7TOCeIqbKVd3Zw
 ksfERXvYna7oPGbumvPA6E6ftcfNVQV90qTJ9XYu4SYRPn/7KcrRgFfuReUPGN3oPwNIDEFohmD
 4UiqYT75J7wzpwPzJhgywPNGEh28iYRRvFqcc9foAZsEiCN7SO8eVdo4vqXoli5JaA66SwaQmFt
 7/FQSMjSdFU6c5z5N9HwR+YhoaE7xXPTwF4znBJjZM8YD+nDQ3D9PjF3d0VppJzm6dA0JJGx6JG
 N8JxGjvQKYKgAiJblltA1U1FzgzDAHWRFzu55zu1lrV6jjKpbLzsy6fGBnOFvq40ele7x6HKmcu
 mT/xaaUyh8qNOB50tCQ==
X-Proofpoint-ORIG-GUID: Ac0QTyTsBnE1TROSJzLRvUAky_jUbXZj
X-Proofpoint-GUID: Ac0QTyTsBnE1TROSJzLRvUAky_jUbXZj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3OSBTYWx0ZWRfXy6uRnpUrR7KG
 nVanyQn/sDKta6jZdziQVuneWNWzuYhRRszjnP8ZdIAkg4MITLp8D71owJFx6Jk/D3UQ8bzrNIJ
 h8E8QVmX3P3HTHeI2x1vzJfKMFkQq+c=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5fa625 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zxsgVq_BHBy1SaPP9u4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210179

On 7/21/26 5:31 PM, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
