Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109788;
	b=OL7/k2JHaCAugL7mRQfdLJMZo8Y2pzD9+Vq2/CDqZN4XrpJ2oqyGtp9CEK+CFYzRGzk/
	 RRRPLzMLZ5HcBOqRG8sr4/579LFLRCotafp+Vohs0yYnLnGidtesN/8wglJFq6ggVwZef
	 MqftXF6pMuP7N0/e7RFX8LPRYCwTaYKnuiq4OG6ELSLLbJ2stsy2l32kourZQFhx0JtJV
	 BljE8L+qE563KiW0wlRQtRbnzULuTjaVUo0mM/ala/jX9Ymc80r4T0tT8t/ShBTtqV0gv
	 BvdYSYS+0W8MspxCebG8asG9WiSUjfm1XVv7Sth4spMGoVYIew9LktcYdOOplr1vVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
	b=YL/0hVc+S0ly3qx5ElAxM+8XF6Uk4qHHTNhs/Pwfla+iZcPEvq+/MfPlf/WwOGgCQgSr
	 gksgLfJsO8daMZmaWQpreKHm6WLD5i4HDrXy0lj2T90oPdINx/K8yf5Qe9716DhK0Aodj
	 rbOY75s6k2a8vhdrRuwbTvvr4rwEGbrsxlZ3oeSegFksYVV+lmDMPRaF+d2I/ylKdmBVH
	 bgh1/XBlxwlDTEAAwoaO6x4mhV6sTsvAZ3ZM5/2GtSeLAjjlk84tVanfc/oHHH484o66G
	 f8kAHKmFnM1bSEYJWTmeBRbgFycEa+mWP0dSaHYauI4bQO8etI5W58AJOykzaXKsy4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV1zgTgX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F268606A31F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F268606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a8ewLFbq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HV1zgTgX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo6JT1486547
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=; b=a8ewLFbqdXfjKUjK
	MMA/shdVyvemvXTbn0l+T819XaIhFdb2FIu1ugEAL94GzrVa4GtSxzBND4Mzb5NE
	unrLCM3ZBBsKzgIstFTRN01z28yAjZhkqV1FPFDO1TynSTxQVO4sVvEHKYMDiWm9
	tNpyQx3VQnqF4Ig6ObCEbsY0kYgEmWVur4coSOOrTeA4Z+l5DrjUIBkEAGsa/jYH
	9VZE8yxR/FvTC5Of70GTzWAHLD4Fg6kkg0b29MszjADf6/PlVV7JnozpzMbMwGc/
	jz5HvW54sQuc5Mk857WNGmwAW1Ms9SuX+UfLr8kMY/gdEJkCtrsX4W+CV+vwalsf
	xl+nRQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t9vrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 14:03:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso89591e0c.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 07:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109785; x=1793714585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=HV1zgTgX+LFVFrWYiJ/97rGDJdWSJHSGX9ZkUHK2TBmtFFobWP6Cy7aPl8yT6oxeSV
         QIaIqfpqpV/e1yFPxN8RaNzwV9XLh2+srZU1GSTAdoXhaCnZLEPgUImjbqO3FxCS3Mb/
         0lPfSBvj+mmGqWqNF9YDnhlP24AUx7YRyHq70cvql3mAGFFBQX8nNyORK0vob8FAVyEa
         N/j8ajEnzcmx6cZOj99rfRb/HCazFXK3xMs37iN2Nu8O+q4MOY4DPczCDMXoFzKF3Rq1
         LJuxRmV2maiovJHXE6cOhrqpJt9dZf1mQ0EBI51krBB/aWrMiVTIe63oz2gnRVJT0zBQ
         KIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109785; x=1793714585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1G5sf8KRPdcD7yLVRj9Z+Dtz8i9D/mEcW/PXE5k8/E=;
        b=1VRJyhfoYS5Wy2a05otRO2b4EwND63eKXkmcRtlDk3xTFZoDfFXQUa/NvlR8Yu4RZt
         +vdyUfKMruj+VpvUsTg4roVzyoWE6oOOLcm5upp3Q3PSp8OBsg2f/5EjuX4FBEd8uEV0
         n98IWHvzAgW2+a/8AMu161ghRRew+C1i3g56190kMHpFGDr1opmFD4Q4138MF9EsbmCa
         LkIHtqGVANNUMHf2B0flrwmVDkD9RIsCeslRE+XPIyBvR/+gP0WE/O6Rp0rrStHls8Qo
         azsiXtXRFNGBfhlqBWJv3J8Wkda8Y2vtDBsyxsRWIJ9AJCADZU5kwZAwXgiWaC2vl8SQ
         o/7Q==
X-Forwarded-Encrypted: i=1; AKwUvByL1mBWDvbA/FyHzIcL7ylyWlog862Mmx+k2OBMA3PKgLPd+k+szM1hplqVtpbOj9SIqvfibk8qdQLW@vger.kernel.org
X-Gm-Message-State: AFq9FYIZrSbRYMoH8F89O2AlcwBj8b8aWAJaignzKUQ+Med6CCe/kfhp
	p0fkdc2thyKfOJ2n8FTpcT++dgTl3XQ/p0uMHK5MfFVf3UuGA/BrFqlwOnp+p5EPVgu6SN/jEBL
	i2+fyObmy7n/gqIU8H9navwgkQz/upL69gwmAXk0nViKT0TBV+OFgGcJm1K8iidzJ
X-Gm-Gg: AYBFou1/UyF47LZvj+c/QniCjJMUkqTehj5al1s6ozs0uVuI1728T9X5pi8dWG5lm/H
	jICahPrGc3mAtw1+LQ0Sr3uaOrfa71FsjKQYTDewQKHA2hh1g+8n2s8wvYK8dre365B4XgpElFc
	w7hffLqiHWqZ1h+xWBWakmc+AN/PRas+McUM2jsQJWItCWMYcoYxp4qOgH7b2OnT5bmtneFGxJv
	PFCWQRrUrgoTaM4nsqLl9pYDljZbEjxEe4nPw8qZeKUh3vh+UQg3jwI/sHr8HDZT/sP6Q1b7G1e
	QknVxhVMLpF9yqx9rZfJzr0qIGmZRsBBTuidob8lSoS+CfaOte4QDi7Oa1xcQEAcqHfY/DapK9G
	bL8ZajVJjAAqXp5MovBZjjA==
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420274e0c.1.1793109785153;
        Tue, 27 Oct 2026 07:03:05 -0700 (PDT)
X-Received: by 2002:a05:6123:4201:20b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5ec230af32bmr3420220e0c.1.1793109784529;
        Tue, 27 Oct 2026 07:03:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34fbe6sm459999666b.10.2026.10.27.07.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:03 -0700 (PDT)
Message-ID: <1ae7cffd-f39e-415b-b2f5-ed3179284d6e@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:00 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
 <auCsCPL7gK2lIR5q@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <auCsCPL7gK2lIR5q@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0af1a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=DwHBtBTWuPJZlIKgACQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: kZCZpPhpeQdE-VfBP3LforKqdOSzRTXl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX6OWNk7RyBTWY
 1+4Zq4mojqj9HFXXCwekiRW58GLA3usAmDxP75hVYgNTyUmtcN5y9Ha25RYbA/PZjDWlmP1uG4c
 tKa9YOf0XOm28LryyrWI7jRN6PFplG0=
X-Proofpoint-ORIG-GUID: kZCZpPhpeQdE-VfBP3LforKqdOSzRTXl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX9rZSvJ/m/jto
 hHFypNhTvOjrQp1bK9hK2ZnONHbyDnZR07Bqmzws/OjgjtvF0Qqxck3b7p2xVewQQ+ucJI/znpN
 VkYtMrDp7iGSMvHCZSNv2z4BJNZCaFMHKWebFWTvxOBTw9eYeHo7WEx/1jw1X2hBlMHvBloZjJp
 6WJkwvkYRMX4S8GpX3xkcH0z8Rrb/f4kuLXMWIkO/5GfX5uuvan/PrOIPNtRtVJFWFER0YEmw44
 nr8eSU3SgcWDDJZtrRIR3dRnsMM/Vf9tI8Bt2uMMhVQtYfWgu710xGBPRtEEc7oH7SIh5AkOH8v
 rdu+wyUWJyXvu2nHPSWxRznZgPhWXr3D+loY7Z6Uc4/2U9ih/JESpf4+fcb4+MvpXUzb5XU8wu8
 9GB1bBU2MvBQy7FnJzbiw/ykJ+74ZWFNLwO/9t63fosisHn8g+x2aqIN+UaOSC0bBns6BXBeyWN
 2MypDriT1NKwdpsCGUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270055

On 10/27/26 2:50 PM, Richard Acayan wrote:
> On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
>> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
>>> The Audio DSP (Digital Signal Processor) is responsible for audio and
>>> sensors on SDM670. Add this, along with the SMP2P nodes used to
>>> communicate with it.
>>>
>>> The sleep state is included to prevent the following crash:
>>>
>>>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
>>>
>>> Otherwise, it is unused.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>>>  1 file changed, 168 insertions(+)
>>>
>>> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>>>  			#freq-domain-cells = <1>;
>>>  		};
>>>  
>>> +		adsp_pas: remoteproc@62400000 {
>>> +			compatible = "qcom,sdm670-adsp-pas";
>>
>> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
>> fallback here? Then you can drop a driver part.
> 
> Actually, looking at downstream, this should use the LCX power domain.
> Can power domains be omitted like on SDM845, or is LCX important enough?

It's used for "proxy voting" - i.e. the OS turns on the power so
that the ADSP can boot and set up its own voting (through a direct
interface to RPMH on its side), and then the OS drops its votes again

Konrad
