Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7862E719B
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 09:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469180; cv=none; b=DWSQdEqY0GX5pisc2tBqvfcKdjv6rpt+sRZR4rXgsnoQJDjjNImskntJwQ3U7qB5LeSm2c4CvsRpolQfZQzToYp0cRffJrOE5F28eI+FDHlg56VKjVckxipyjb6m5d/5+vmg+tdsRWfwKPG+grO5ovonpVffGQt537gd1phRaUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469180; c=relaxed/simple;
	bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ly91qYDuv/1bAlqly57dqgQfyjQWPRd2NjWj+4FRsMMQMhHQ6VioZZv3gFCp01C9z6fdFBxKcndXZys4w7c68Uq7a8+5MchV+BOhjIKMP7JpsbiQHXBganpTjPFUbyuCOO1nY78WozKDck7C8LcqD/ChurzycCwBjiyzIdMfYCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHmHAxlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GBayKhZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHmHAxlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GBayKhZR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63692Ft01661517
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 09:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=; b=cHmHAxlBtVEjpSe+
	sKbNkMUhUAx+Of9ES0K0BvckXhh4JfjMhrAhgCuveyNrUMGkNhWT3RptHLYM9Hic
	ANPfRPe0GUuOTAcC2fyyzgwKgWxlW2CGT92LBtguCzXTLgCzMWYyGPaaGmxhyK03
	0QMqI5hkDmA//yIdXoRjrGOWQNPQLFwblRIZz7IigzCKDRSQ1jvyqZc1Z+CUnbQF
	m1NhXcB222hHpQshpFWLzncWL1Lr3g1LPoQbLINt4p8jMLNHWFy20R1nTlUUrttU
	7a7HAefbREQfRke+Tb8phPI2w5ezLuyEbFF+qDMcT/1tJF5P/vHXbLsAY3nZQJfV
	1RLpug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8cp2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:52:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so4153869a91.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775469178; x=1776073978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
        b=GBayKhZRONBCOOkM6vUHCfDjEvhKMdPSDWFIDB27zl+xHcREws6xkheXgcmuT9R5a9
         LQPnqzX7O66TYV2U8OGklh/scCDf/cSx+kSONGLLdJd+/MT3NXGJPiC1/GFL4KDRVChy
         TrTEuyUNpNoxWUcAakeGRiftUoJvYxz7hN9hTFetqOGWknRPpqFChYWWgoo4UXttkugE
         Saa81lJnoUkM1C+9y4vr1X4LX6Li8hDuuvbJlkSU/t2Ozupx2omsLaH+Z2vNi5udMwy6
         D6u/8mFt7ZmlqL60Gk7a9FvxyZ4IXaYz7ha1EYMmoPOHWGoJCZuqjRwMJ+poV3tzuLBM
         b7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469178; x=1776073978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
        b=sBzin1Qyp+iSDqHjlVxeKt1SOqK1ywnqLE9MUYaYqoYC530A01VoAJtfFa0imuTnBk
         h2UCN+xYK1nK8EOQ3oFyGg3plY1BBHfnGxnyNcd/JgX2U8V44muEVs2x5/y1s6CF/JLm
         rD9QWV5/H01+h+F/yLGf4kxgwX6ZOBK63anpM3k+RiNAulXoN23a9wbHmtevcjvo6TXu
         4BZ3AVOSdYtEmD47iiptTN3DQRdi2LqR8ySzGyrY2AR1O7Qhueq1NxaGy4CgIXufST2T
         /mBX9g6HagG0cdXHnFm1Ieg8lPYsRBBGHn0IciJIXlFeZ6uFwY8WuDco6lXNZBURJr2w
         REKA==
X-Forwarded-Encrypted: i=1; AJvYcCUY2lYYJvLtf4uExwLliphSFiqGCepzdlzvguNjYUBANSTjfRaq/vXon3MQYHqoZ2WUhGCLa9r0pVyC@vger.kernel.org
X-Gm-Message-State: AOJu0YzTb4Fe9DYcHK77FyCHgsNALETZ1Es8mu/iRfGxR7oJpyfje9ne
	lPVDIbUBE9EcQupWjfT48UX9G34SRsXu8Vm2qpce3WTVaGjwin8/9z0u/ZhHBfRT4y+CkZgg5ey
	M3M7p3HHw1kX8pTuaH8y0YwOqcaecuwdDDfaw5RS59DI0pRLxYc0AyuZxi4SudnqtO4BNb0K1
X-Gm-Gg: AeBDieuigQLRwGPpYjwdMTNnW6IMab8j+TKvq5lOYacgYCvupBKvY8FyLcOr0+0rBy1
	AhIvof/m0VgqE/DGv8sSiuSr+rsm9mlH3v4G10aW20xZ69gA9i4TDCYqr5449A7zXLxvclbXa+W
	OagTO9eQERcWfFAYNVfbypSi676jFlN2w1FQXKVbe+eX+SXTTlk4sGnJJwDN71mOJwYYxcdshRG
	rR9+a4WPhuDgLFciYCoaMyr4DyThwf+7oJcWI7VQ24bksJXyt81eOpEQZe1cVm5Fs0gHoXFsXUD
	Bbyt6VskfanZVA4SQ9TZv/N5OO5IRtbkhNPJoL20/0nBHwJEdpO9D3psKOleNPo7TKnVRXR3JmX
	kQwFEzE5Ev23NgobEnjt1XIvOFYUcurcRqo2Dn6gtJvJx1g==
X-Received: by 2002:a17:90b:1a8a:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35de5c64a15mr9012121a91.13.1775469178008;
        Mon, 06 Apr 2026 02:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35de5c64a15mr9012105a91.13.1775469177538;
        Mon, 06 Apr 2026 02:52:57 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm17465992a91.16.2026.04.06.02.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:52:57 -0700 (PDT)
Message-ID: <b54ef086-60a9-4d33-b63e-6fd6499c909f@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:22:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <ee23daf4-8181-4ab0-bd21-b2ea636168f7@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <ee23daf4-8181-4ab0-bd21-b2ea636168f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zPwOA-EiPRz1dCT3cdCSWY1INtE8ZlN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NiBTYWx0ZWRfX1pHyRqEwyaqy
 LPkjwXZhXar0QKJyrjuPTlwC/vJCUiXFOfhulEGqlxQl4kaKWDGDwOnr3OehvarwT+CEhSXymxG
 uUKc2djT/vOKAnhQqeMv4NKQzde4U5VIwLKmC0DvSDMAk3Q9Lj5zhS/pIGjI7GT4cuxd5UcAsIQ
 8FQ8a5WMqNcT25zRmGX4KDG86YRZvL5MXrNNG4Mgv4Flo4hiCDVEF2k9FeR4Z4xhzkF4y1CR1pn
 8z9dzH9pqCU8ThIrH3uP0f2j73fBCf0rYrwmRYK0gXl6s9wRSZirSLHgiefS4gTuo6bANwwyEO/
 d3SLVzLltV4JbApt7+vdcf1PZme923h8uDoT0JigeeSHZLCDHrHEJTmchB17X605qvJxf0NTIvs
 y0Us8QPGcgKgrBwTUCaA693fki3RmNiGwb41RIsJ1x5wHHQaf8OFE7RwsCM75f4QstFnDjHTY0j
 oecFWsAWBrvg4nGi3xg==
X-Proofpoint-GUID: zPwOA-EiPRz1dCT3cdCSWY1INtE8ZlN4
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d3827a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=cIAgj8qr3_NMcBLshucA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060096

Hi Krzysztof,

Sorry, I won't repeat this again. will take care in future.

Thanks and Regards,
Karthik S

On 4/2/2026 1:00 PM, Krzysztof Kozlowski wrote:
> I gave you review within 5 minutes and you send exactly the same after.
> Without any changelog or explanations or response.

