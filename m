Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E041D4FA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331328; cv=none; b=nu15zEdCPM3A+EGCMYQ2DIk6jm7EU8s0njRLBJWU+fI/3SNVMLIbKB4MWSm9XHayJyLpAlPC01ZLvWc1tS3IenqjXQoqi2SfS70Rl/HgJTNGt+JM+R5OrZLZ1//0mLLq8tPA3C2jg1Hfaal9SQTfVvqsVXJlP1qfMDbEA3fZZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331328; c=relaxed/simple;
	bh=4BevZDInq0oiqXuLYccCivQ5oYM7+LFPzVWpZcVwfjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tqZpXCqUjRQ3XkRjE5NC6vPo0zAiA3YN3+yxrovAMtmOcaKLiTlD/RZpH2+hrvRMgHlR8aent34TeB/T+iQLwx6urGzqUN11LOoUvlpLUOlDAknfaMXWVpeoMBhrHwdvaDH26Ogllzq7LteFlOSqP8uCH2YcbyFAfaCTS1rw4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhObwOTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3f8s2kq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhObwOTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3f8s2kq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693tsu4108055
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 09:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFt1cnbmquIdfT70CB57ayQHnGhwtJl2NHixthPRKhk=; b=PhObwOTc29nLiodc
	CZCGiBHZfL3dA1JMeSxw38x8TQDbJ+1vvtVoZuXOjBQsU9OG9+yvKuwmcF7eenPj
	vtjLg3U+vND/uxag0UeKVsjYSBQpw6Cf7bJpU+opyf4oPyMW/yYgRigctyVclM48
	thuneTrycE7LIC0Yp9ypSXRsq6a/s+NyUbbnCmeG3Gr4F6dganZt7xlig4Y0E5aI
	ZrbPYm+2MmfRlXzjEX25NSBi24nHqG6C5c2PYT9TP2iqZhJSjgjL9fzVYhctzZEZ
	cJnWLEjUAQg9TYE7ABA5R2lE3cC1ONafwPC3D1Z/oYYI0nBgHiSXYZdjsZznZcqg
	BL5qCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrmd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 09:48:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e7579ded2so41567285a.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331321; x=1783936121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFt1cnbmquIdfT70CB57ayQHnGhwtJl2NHixthPRKhk=;
        b=j3f8s2kqDpQ8xKDwJbaa9zOIaCRYZru5MOHlsYk/Q04yUaOXsUt2//SnM2CY2SaZpQ
         MkYDdQhDfpn1dqx9eMRQX7l4hRCUbRMdKiqVtoVly+oy1K1p9UqKh8o6cQpyySeai+VX
         0CU30zPENzXn2bQDrJkS1jbWmMPz+n/nz0kx+AyXa8oXliYP26zhOF/qi5zg9C45GuXq
         Vb7P+8mbfbPJ1FdCK+2ZvLraRdgu4PpFPHrBRW2pjI8o0MDfapyTCZjHkJLg7UOMO8+A
         p8WWjyiXgedzIp4h71Xq9aloCqKn3jfQAoElQxEvf/9godeikmMUcZoLz5BIZtAFXlKE
         /GNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331321; x=1783936121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFt1cnbmquIdfT70CB57ayQHnGhwtJl2NHixthPRKhk=;
        b=i/JMQSSRmHEvydA4IBPFR23J8YZbeEqPFEDvtU7xup/NtyyVnu3Ht9+kB8nKvYeUPh
         IQhHPH4M2+xv5CVhCQnMSbxVVdiwqTdYQQIadMPzAspVGr9pyhxwmQ0n6Gacxz6UgJ3n
         /QuVZhqZFAui3xSumiRjaCHgNxWfNQTkkHWlYG/GhoL5+vAoFa/SdWaF6jy6rLiODMoy
         /F8GdhBBPFaCl79k33U6VrtnBsdAi7WeCIwo7HytQtNWxdlTxpdWrvX0PgX8YAKkvN9G
         BPkL8KGoQF/wv4gjAXagFUMz/zmNdtM1AD+qNBLPbfHPkpjsGlqe8ZvCbY2jJxs112wM
         bHjg==
X-Forwarded-Encrypted: i=1; AHgh+RqnxkeABCTX1tQXkIjSTrzpGpOalAogYiEn8S+5RdXAitlE6ANtXcMHGNyYaX1Uc3rxi6ehJgm9Cq/p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Rc6/qoMphOVWKsnGOdryqSWNQk3CphViHzRiiNbhiZPXbz8g
	o5HDcutiYQMcuirj3eRN83tNTo5D5wJ8MDB8hY4VgbTVVGH4BcibLZF7bwnHgaqtAXyCJV4KV1m
	Xqg3+Dgs8hcXSF5JRtQsDX4jAq4x0qhAFRrS0yqBdj5XjrQdbxmxUsEV3ON78qWCD
X-Gm-Gg: AfdE7cksqP5yXZMZPIiRNwZA4l3PUkC86fwm06DQVRfRhELWM3XRek4jTy2cpHJQbRl
	WSby6g4F70ComOg3wCRQqxIX2DXczcoUxmDm5HNk0vbES4pheIixrthWlBlj9JYt/GNwqPznMRE
	OA5/pjNSiaoFmnePB//BgBwbsv9UT0l1zOspJqLU1zYRA6MyTVvZEfYkLZGM3y237cvIFxdpBEO
	rQg1uRf89egDNJGpBfaleQiB0gN7UD93PeZse3zl30e7DJZMIkqXevS7YQJKiQfcMODi5zCx6CB
	9fgcuMKJ8vZOoGJOTmb830Sgs0Y3pia9iR6fJBx01/5ejBRa6PrvpjIwfz9Fq98iodyPQD0mZku
	cFI/hZ0m7jWrXpHeZsaJhI06yr52ja+0eUj4=
X-Received: by 2002:a05:622a:40b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c4bda726cmr88366631cf.1.1783331321340;
        Mon, 06 Jul 2026 02:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:40b:b0:51c:d8f:d77a with SMTP id d75a77b69052e-51c4bda726cmr88366481cf.1.1783331320756;
        Mon, 06 Jul 2026 02:48:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62907ffsm715403566b.40.2026.07.06.02.48.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:48:39 -0700 (PDT)
Message-ID: <6b8ad516-c368-413d-94fc-d70844a2af07@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:48:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pQ6NiXYCBjq-3-WMGOMjg02EOZyCYKAo
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b79fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=9HhW6uXCempL9KpAJskA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX5jf6vvCTkC1V
 PPf4r91wqdq4Reju2jA+XRY1ZBr5yDqeaIRD+lAYnVrMcQSnd+BovpYoekpe4vJWgbRLCHElzHs
 1YjeoHpvNj3TMvdlvGTlqn0Ucqmu9HM=
X-Proofpoint-GUID: pQ6NiXYCBjq-3-WMGOMjg02EOZyCYKAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX7vLbEl+KFwkn
 uToNZL2wC9wk4Gyr8pvJipTgNiO3pfruPWvD4GLh/maPIPhW/lZV+MlZH4cBVtreNNFgpgEZLFy
 a7N1hZXCXJgqHL+Jn4k+RiGg8yvrzgwtbsxCXqh8qlUsKvCzfxF1oo2OOuXeXuzmp8kCJ40VLDZ
 K7oi5eKHfYgzu3c+j0gVZHuqpI77O4IYn/jzkDOZ2WB2Bn0uKjkNn+mwhzsg9CF65c2ICZU01P9
 5Eb4LIWqX4f6LGtt/ZXJAcDd/eOPKlmQ/xDcMf/ssuqXr37baLjb4bfSDdWppiQuNH+KcuovY0B
 T+0nnNd1SW7If9zlYgCP6JR85lCkbaC3g+cQVDqiMJnnMFMRzyT3KYQ3gqacH/Q0H2KpvBG7nhd
 8Y/AKN0mI7uuebQuz3wLcczqcabAATmdu3OZtZHHOSDOyOS3pl3qh0KUm9p+LD+wqwv9Kh6AoJ7
 UnPtYTcxURztD52v5UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060099

On 7/3/26 1:13 PM, Sneh Mankad wrote:
> SoC sleep stats are present in RPM message RAM and subsystem sleep
> stats are present in SMEM for Shikra.
> 
> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
> was used for subsystem sleep stats since those stats were populated in
> RPM MSGRAM.
> 
> Here is a brief summary of previous targets and their stats
> configuration, along with the drivers used to display them.
> 
> +---------------|----------------------------|---------------------------+
> | SoC           | subsystem sleep stats      | SoC sleep stats           |
> |---------------|----------------------------|---------------------------|
> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
> |---------------|----------------------------|---------------------------|
> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
> |               | (qcom_stats.c)             | (qcom_stats.c)            |
> +---------------|----------------------------|---------------------------+
> 
> qcom_stats.c supports both the configurations for shikra, reading
> subsystem sleep stats from SMEM and reading SoC sleep stats from RPM
> MSGRAM.
> 
> A generic "qcom,rpm-stats" compatible only reads SoC sleep stats like vmin
> and vlow. Add shikra rpm compatible and config to read subsystem sleep
> stats too along with SoC sleep stats.
> 
> Below is an example showing sleep stats for "apss" subsystem with this
> change:
> 
> cat /sys/kernel/debug/qcom_stats/apss
> Count: 2192
> Last Entered At: 5498618336
> Last Exited At: 5498708046
> Accumulated Duration: 2046572620.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
