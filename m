Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9F4E8E0D
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065753; cv=none; b=MLRG0vbZHI1+qbJ5MkP2XSrMVEquWsg9ivrASrKqN+iL3w/3ZcT/qgbSN6msXc8HaaGT8vHAyVLSgORYbe6VP2lSgWV3o2dAsOsDpyea+66BKOhdTKZn4/RDg4CWDK6/0juJBIbpsjDpRvZcpMsVIZuYFaCuAAiPHl6GyWUtzFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065753; c=relaxed/simple;
	bh=RW90kX5UXhPbMuU773cswcseDtRVTNo/H9SZj3A2zhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqdaCr+VR8ovldu6gesM86v+m0oyp2OpJUOG5pvU6hF0j4Vmr+WFijUzNo0Pw7bMxvB/GEg/MHY+crXKR09SRCBQ0nR/TI0R60LcIWjnxvhe2cZfSc56E62VnCxhcSAsv9D9nrs4q7MO4pjNSQSLzNnjXX4LFiqihZiwkVaGF6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RO1T7zJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HabZOHKQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RO1T7zJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HabZOHKQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jOGr2114144
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=; b=RO1T7zJENzrvXhIg
	kZIGA6hBp107Y2ZD3YxOskODR/SK3vv+O9N6rpbOmPOi7uy9zaIJ0ZMmgTjwMph6
	J/ci8p92bafH3WGxWJ/LRCBtHIreig7rai0GT/rHF23Udy61e2jw85RzTIJZjbcj
	coanBk27K8kCtxLczcKA8P2N1f09oUNEkXkQu/9jmbdWI8X5zCrE3V5E0l+mHo4f
	A/Upnd6GnOZSvbHwyfbASbpgavZJPAxsPqsU1whYHPt5Dj1j+BWO1WtpZLKzbcwO
	E+fcG5f8TkPBbk2qKREDZrRr6mx5ly69jXfDt2tWYcQ1ZHCzRgPB+rd9yt6zXR06
	BntBWA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmyawum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 12:02:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e705718bebso180263e0c.2
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065749; x=1792670549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=HabZOHKQPMg0anH1NWHqmDM+POfhX5NYL+IOLhEXLT2DqovFa9UOE8XMUgBeD0Jce/
         lYEnqARs5w/EOyMPcZ5nej6B+0yaJsLPdP1DO7lm2RjJH3smU9aPx9a++p37DDkgSgqL
         3KO0ZP/b8UhSjXnxIU3sZKSVqgfc/f+ARNEpsJ9o85iZF6xxEjY56vZCsUHqq5r5aAfU
         dtbwVZe/z4eYeqcwuZmFTWBtTFhF/ey3+sGvTIRc7Gbd35E41P2hv8JtwMmHbl6No0tR
         lHNAJVvl0FyoiJowCttHToRdCsQmC38a/W6ltE0ju8zJoyUotftZwQVBueK8TSjP4N2O
         /MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065749; x=1792670549;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5tUO2j5Cw5lTw813p08QZcgp9r68LXyMwBdh7jIMAE=;
        b=wayyHJGLfjaU5cNyW7vCURDqGkwTWvRUJJdkuINKJX9KRgP/fMfi3sGks9kcX69gNg
         peKmbOdJ1SSQ/w2/frEPGJFYCWSuiO3Ktu8u1OgKr/jBoujmjEHPdz4n1rpDA/SP2Afd
         gHiFIFzxV1wfWKGXHwFOdeXMF1uEma/iaXOmpAZV5LLcWb3fkh7uUUhw7KMaNSEQC9uQ
         HagB+xctjE+rtTyrsE0k17OMPPVF5CViL3ujqxkG6eQX+w0DPRCcEHXlSEBJrjKGmWXi
         Xriw1rV+4/FGDUiAbatI+wPUaBIvMhh7F39i1OP9Sf9fEJetEwOJ5dnXEH4HoQaJ1g4v
         seqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEcyJGPkyWnpl8wl3nczBRyLWQEp0J3XrRz8j9yyMjG86Xm/d0PB06ORTyixjJg6CGF4wYfe7uDqjn@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6lBq0ngB5U7T9buXy7oduc/cntjMEGhuOhEUcCW473zFjGJ70
	F8TAnV18nxlkftmJJ2FTct6sIjCwZ0Vxu3qZaFXwiI1nIM8HJuq/dpOqxl2e/uO03lzhZE2dAFi
	a8KOc2nI/CzaTwUXYw/TxP6BV7+M66ZrJlBklK1LDoY03NCnLVzsMSfOxhFXmg62X
X-Gm-Gg: AYBFou1ychPBAjrwo42UnvFWpinMah+vebtGS6sWhnQ/vhELSXu7Tl0tsJ8g/jpZBnE
	kmQzBMOxq+JrKCsWA/tjP6DxZpiEba7MjU3jKwN1vEOUJT7RUG8YtIBhGHP4JdyfWO7gGN8VQrw
	i834jsV4tF7TgI+cemp5OKZydSS4XybIb4qLY9fk8YXn7yyEOwsS+NsMu1Ego5TH90PzMZIOcB+
	vTk9JhzFxMcIOJzTJO/pvc6YWBQM4jAQBqQA7RbeckZ6tgCcuWGn3Lbp1pLYH0XDb5WywEdC4xf
	ql+NIoMc5mFtq3WCb3lj73M6/TFKeBlNuPaMiG4J0v1zd8KQUE1XW442Ye5jlIr4U2JO7/EL85G
	1RMFsHAc3JMEj3Epz1bvbMQ==
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2906045e0c.0.1792065736353;
        Thu, 15 Oct 2026 05:02:16 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c8:10b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5e91ef9f2b5mr2905083e0c.0.1792065723319;
        Thu, 15 Oct 2026 05:02:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda6276a5sm114642166b.71.2026.10.15.05.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:02:01 -0700 (PDT)
Message-ID: <8cbbdd41-f3aa-413f-a520-749abb8543ee@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:01:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z6RAqBvxEm1j64ECljMmw8mRR2b0jHQa
X-Proofpoint-ORIG-GUID: z6RAqBvxEm1j64ECljMmw8mRR2b0jHQa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfX+3OjVq8b2+QL
 vY9ytlh6VQPMwZk9H24AjDBkApYGV1pXOftaFj2Vcq4N8FeMaFcPjU+2FC4tdHgV4AB40Rs3XoE
 C83U1emLB6eE/11ee8/sMbxkyaUymYw=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad0c0d6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZWiXTBPgYML2d7b_3NEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NyBTYWx0ZWRfXz+WnJT7fZC2N
 xqLA2dlYaPhLXiECmdBYlQjOwZZYDjahYa1+NaO9kiUZrgSIdNezT/qGDv/gXYuqstboy1vsVHO
 uhjdWpvKKdFoV25fJPUo7gycieQPMo26UWDomx3sj/Jl+RSqTN7wP0aWi/ZPisRsqPIA06L5wWI
 plmwN/navIZBq7EU8b+k7DCAaaZOEfTS8JK8yyiPQkLvL2HaTt5XN+2hNblaUCvj4TgJc5l+9Dm
 SkXHkqC3bmr0cN06OWyf8y3e3UGn40kvQVUdKAT2PifhkbT4xjYrRUn9QBCUNi7oUolct8W6c+3
 pNhgB27kTP53o6T1Nc0zC2NccHlFFtD/qMXKqQ6FqY8DNUBJFBEjvkBd2jfv05N4ngmAnWMvsjb
 OlADQGBejfAwMa3ws0Bt8a23kruWw8mt6P3mXofuLfGVsYgGqjt54NUGI3dri3vlzbTNmEeS7Sf
 G5MqxKRfnkfmfYgRieQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150047

On 10/14/26 12:32 PM, Jishnu Prakash wrote:
> GPIOs used on PM8008 and also the upcoming PM8010 have fixed
> functions (reset and interrupt input functionality) so it is
> not useful to expose them for general-purpose usage. Drop the
> GPIO MFD cell and associated peripheral definitions.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
