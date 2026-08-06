Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCE9380FFD
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035251; cv=none; b=nN7pmgvktcXvfYOlkVgaegg5LFT/mjbpBEHgb6O1KZMX7SZALZDAzmnS1g4u3aqlwJm0ghF8AQNS9Bu/O7FgAUL993Ut4eHSCgopThNp4/58Y522py+2NUZZqNTB/bomAwR9D2K6xCNRIjfm+xPUulZ8xwhjBiLJPCpUDjDKdJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035251; c=relaxed/simple;
	bh=vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhTMSqiQwkSreVciRAPl/2G2aTUqYAHtQ8CrB0O6ukRLrXt5xIRxL5hk3Gpokc+Dd87gQiLhwU5AO5VtYvT9a9QmkG62euzryWoe7eDNxTlOgVqTLLQRJ9J0ETHoNiToVFeuD+XvixNybxzMQAEJ7K2CYLQMcVKDsN0Cy0xQeRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXV4lJ8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSnJEGEz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXV4lJ8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSnJEGEz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676EmuhG2279830
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 16:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=; b=aXV4lJ8akAoLS8NI
	jknaC2am+nyiMewAdf8W6WZC7HAPyNsdPBYtk2eyKRPRHsGVDFKf2MlwzLYX5Jss
	F2+/fjVerkmydZLVVNOM6cUHXRLd5J24aJ6XcCiJ5cfoeb+fbqRFzulvnHwy4SZX
	ukcMvtOdHM4B7cD38yuztDFrN3YkyJMXy+BiodQ/6a8uwjWk8qmPrmZMzImRad09
	KjiYeU5bBExRLs+QtzndibYJJ3d2UkaPwmwvzCivAK3NA8i9E8Xw0niUdGxRr8jk
	TUA0PEj8w3crCUAKTf9at6y8oXrVuBdYbTjRlyFjT0n6kLLP4ZZ7S7s+eCUVUJMR
	1L4phQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8kjbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 16:54:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3534420a91.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786035248; x=1786640048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=;
        b=FSnJEGEzey+N5oOrxLTQbaZowpwKNwVXmjbSxzQ1oeF+adwauGHg+tNG4l6tuFreQL
         Af+kw977IW4apIZGcZK1on7KBgASjK/w++Yoo5kt2NLlWgKNkr8u63Jase8C/fcsB7C/
         ej6f3c7GLaOkYKhp4BigRJCwLmPy6bXCUTK1Nccq7DfOMAXMHQiKI1EyPE3edzCJTEcG
         fGfz3W1TNAD2pqaP+rDH9xMDyyJLBlOewlnbGmavMZMbLZWoGdZlErkHGL8RLYakd+ck
         czBwgh1l+/anxty7wlUl/YJLKTA5MhbXOXH1txjqaZA8JzpkiJFX4GteoGmKgaG/v9pl
         K6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035248; x=1786640048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vef/5r6uU1gPTr6I6ajyHBI08vZSWzfF6Er0iL1Zy84=;
        b=VN04wMSR77wyyxwWjALwYLx1ewTtlM7SnhGG7ZpLOtrv64N8FFH1tE/HS3QzJSS9jd
         MFd/cmHrjEfIbJD/GZytfM6nwjPhhEAprO57cVv5B7RMqnJDsRSq5tVIx17cDo2DifhL
         WFUJBZ3n+UncG7LinqmMRaHDtxFp0hq7WklbJo/1QFIt/5Wi9pcMMizXDwCRp2ly62jz
         uzf4nLYp/lareLHwrW9OaTDha2zfD9mNgjwUf89rMl0XAjdLVS4HR6yV2WHLI4seuIKM
         d37a6fXjjpSoI9jyZzPAP2OnbOf5BEg1PlzeRaDIlpQreSdgBfXpJf9cL+OuUEfUmbes
         93YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAwozCFyiowsmLAVKp6hQB9Qc/GJefx7zG1c+DrmyhImYaW/lQFSbbZzcKBhwk033Gvc0he7sOQoNY@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZx7Qi7rwcYntrWZfWZlKGoDMCL4IgAiUOWUrOUPv49sxPIPI
	wcKXoQ5UP8tVOqEvawVOzJ2+k7RTazVLdSb57vdt5ViZbYHWHQEk4SJn9ek74oQ5i4mUMOZxiVO
	lRZAbN5dUZr0vvU30rNHg7rZpX5RWW8x5VYS7TvfUxejw4KdebXx/Eroi8ymCkoiXRSGeEkbm
X-Gm-Gg: AR+sD12ZCgcK1Aspf16mOse3+7ZgepzQoUWiBox2NDeAVnRtUeu4Ut+MTLzh0RiJKMV
	NAzu25K/yNVwSv8VMGh6VFGsSx9uudhlZKBKRz+cwzSg8dMVSa6kD3CahTaGC0LMNGZZ0PLA/gL
	HO/USHwhb+4Q5WDWCT37Gq8queNjsf0KsmiKMiN7xRKmynaOXLw7lsGeA/am+uTE3UUfEknZBMs
	hRzsRjZBEbqeZROKmPk9RlSWD03lLoGXsXXBYvpKRSwOsIzhb/tHZmBfLrj92kGvNR3eGj1mx6C
	MfyccK4rI2pfmKwn99KyplZ5Hu7IyzfL2M8W9QPxUg56VPsdL6Kwk+mB4c04aQ2bcnwpQSsQZxO
	3mFLNEeiM18GWeond4oORmtqBJ/N6/jhT
X-Received: by 2002:a17:90a:d445:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-3903c66ba04mr17215691a91.20.1786035247570;
        Thu, 06 Aug 2026 09:54:07 -0700 (PDT)
X-Received: by 2002:a17:90a:d445:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-3903c66ba04mr17215621a91.20.1786035247060;
        Thu, 06 Aug 2026 09:54:07 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.111.196])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca9111b6sm25952515c88.13.2026.08.06.09.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:54:06 -0700 (PDT)
Message-ID: <d59efb31-c498-4d93-a277-c628c9eb6083@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 22:24:00 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: qcom-geni: Document device-gpios
 property
To: Mark Brown <broonie@kernel.org>
Cc: konrad.dybcio@oss.qualcomm.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
 <50834ed2-a3bd-40c6-bfe5-98a7f81856e6@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <50834ed2-a3bd-40c6-bfe5-98a7f81856e6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ifMpuDWVujFnnf57pNCL1BkshQhOOlLN
X-Proofpoint-ORIG-GUID: ifMpuDWVujFnnf57pNCL1BkshQhOOlLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEzMiBTYWx0ZWRfX4rIUSg1Ui4vG
 FARPXMEr2PP3hhRFWiiV4WIeepFv7iWJqe+xX/FGAlW3ZKCD9mYDU1Elpj4/IBWrQUarQTYu7mx
 OXsR900TYaBR19OXny2EW/jafzBx4bmUS9UzzBvNVArKFRqoAAeLjNbey4kV1/ah3y+tGJ3JCGT
 V72cHVHF0ZHsQsOHOfhueBJ8vqyD833HRO9fCuXg4I7ksg/tSDp7sP9glZ6hPgz4C6XhNaT/ATU
 bqe96aa41cX+Ub+TdCjAUfNxTu8lEKHJBFXX/UXcHhzX0ZLiyH/RTcNUPoRYI7zkL11lPr74x/E
 b4LO0vSjNAi/8gqY7SLxeg0vIDItu9BLGkL3qNiVuX4HEX72rECT8ylGttLsFowPc6vZ4i6sIsC
 1+9ErX1k1Bcsy6CcmqrNu5TSP+XX5tKSMefj0D/YM9y0zXdcdKk2JYEbxFB8pkSbbMVlcGT9jPA
 MHns6icQwUXVdD+HFiA==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a74bc30 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=7DW+zsgf7PPjz/i6iZMG3g==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YUQeh1lwrLxke3GFIuoA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEzMiBTYWx0ZWRfX1Dv8pIC5eKAJ
 3GukVqjCmKlFRj6JCwb04G5MOZNXuRv0lrfOsUx9F76Hr+vd2T/ODBQUOoATpnNMSJSkeyTNa7x
 JZLIHW36HGdqN4Y5lycXdAwyc1y4bXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060132

HI Mark

On 06-08-2026 22:17, Mark Brown wrote:
> On Thu, Aug 06, 2026 at 03:43:44PM +0530, Praveen Talari wrote:
>> When operating in SPI target (slave) mode, the GENI SPI controller can
>> use an external GPIO to notify the SPI master about the target's
>> active state.
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.
Sure, will update in next patch.
