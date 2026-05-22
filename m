Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC62137CD44
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451649; cv=none; b=Qfj7uamHM1UJNlJYEc95AfvvOCGgNl2INUtjxw6j2trK1kFe53Z097fepsUIDvDqnVuXjYjOK0myjauKHCN5JJTsbj95lLmdggRWUYtF8Ps1zADwg+0NpJlE8cZiqSq2w/EWkKzYji+XAsNHLB9X8RRCah2DjlJtzJd6haNY5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451649; c=relaxed/simple;
	bh=Fj1A4b7g6dvijlX3WGGYJg3amw1kuK5FFTiSfqI3LZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODUsPAShGPjrd9jb0Hx7JLn/6tBQ19dMaGE6idhZ4HhUUEpJLa7DpwjAAZumtE7yrRqIyZ6XAoytrKP1zFLn6FY+mbVFgmCJT5ouuGR9yZKVmzy7m7zs3rmWH6/3dng8pvbnx53FiB8xYRoFRWNIWL7EA9o0c0B94r6PyjlppdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOVJNU4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHokcY59; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOVJNU4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHokcY59"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MAIiYd1800723
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zE6lEFfxgQ65YExek3nLbR2SvRi7Pjb1+wohwnY48tA=; b=LOVJNU4CyqKj/p/s
	QWN8jTv7RC+lKqSxMmHFkDFEaiiprnestt70R4eJ1ol8L1+Ym92QoR5ly+MzB2je
	MXK+iK/yqUzTGy7xO8bpXJJstcFVxx5wsJYjSzIDCVpQl1KEiBgC9EpcloabzCs7
	ASr0chuN3EDEU6BTGW6se8CF9CLuuASxowStasXAp3cSV5OLUHU/TZBwCAuXZV/U
	+Y3oaoZViWwOh/Fu/MNiFjh4/Fq+GLfo8NnvZbUORGiVod+lZUncnWg2ng52ezbt
	i8wQHKXwBJh1ZMMTBX/OJpASj6Zi0ULNtvxJ6STeFvWN3zffHlgspcXOyb/OBNPL
	WbL/uA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g0b8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:07:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914b9d0162aso14581785a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779451646; x=1780056446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zE6lEFfxgQ65YExek3nLbR2SvRi7Pjb1+wohwnY48tA=;
        b=AHokcY596oJX8cHOsOckgq2k8Nl6mdD1jXdCBVFTnoUN/T0V/USLkQpAIAIIlby/q7
         6E9AD71G4C+ufFeobKNvs+SZSjHRkO+AMTKRS7fUfdaAmOYkO1KOOGx1iVcDDGk8M/k4
         Cr9q6SKcQIEj3xGtZD1+0vqF7H4dBq5an9QUv8Wr49NWqYae1DTplAas2W+g3g7BUcnM
         QISCa7z8x7dBXJMjKn7hbv29+Dm0t4GF0EfBgeF+LaFTdXNEHxp+sotIYP9sEXEwqNxl
         Ty0rZsq/6j5bxoQAtMR4/0Fcow5W5OUvNDvB+PqBT9+YwT7W8BGOgunlacvtUCM0fDCW
         5+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451646; x=1780056446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE6lEFfxgQ65YExek3nLbR2SvRi7Pjb1+wohwnY48tA=;
        b=HzdCA2TGb0tUjnWMJ5mhcRhPrDj9xYKv3cJt+3imCCJnitXxb9Id02vGTpKYf6/L+y
         d9RA4TZ1N+fsjvR0z1Z/KcervhezBknSwecIvGJgWbZxBnCSAhe5Sp5QDMMG3J3bLpeQ
         cHBtPZ0EuZjmY0VYktMciwsGa0OlqX/kQusmPUqcyPKyE+b6R8p8px/wrmpUPByQhASX
         3o1eKaED4uCNoVTpPBopkzHh14he2HE2M/FlCM5fRFKzBwYqi3Cb4YKWGdNjUzu92RPM
         j/u+HnJ2Gy0l5XgA1m3D7+k1Y+e0d01VtMYcFaaKszzvrpUCYHykzsgbNquxHNdpRaHr
         BygA==
X-Forwarded-Encrypted: i=1; AFNElJ84qnZ0vb1msG3YFjhAkFdVeyZic65JMSurzdCP4n5a7FbtnUbCUXDxC2pgXacDg1SaQEDZuFzbmc8B@vger.kernel.org
X-Gm-Message-State: AOJu0YwPzpsf0C6yaxG2X3YTrTcRyDrnUmjAu8yByr1AOhmET+VuSDAU
	s5usrAYcQBrZ+FU6ITeOaIDOEDc4VjRgdLR5spVuCmvJO9tLRejF1c2vxTMaSin8fAsXTmhoG7b
	XlK4f5jUbsoRPhiq1XX/WPzoFUJSj/KMAE7j8n8ibziUWY6iG8wEW55+axxdlYgjc
X-Gm-Gg: Acq92OGrigmUiiGKis44hf+NrJ8jLURTlq/8cYVq6KhM5J45TStLZFafRz3C5buKdhk
	ZKaX8r4Y7ywaR6Ptfrk0xKJDHydqjsmQlj03JzpgxJiBf3RSyy+Ltmitf8ze7JVNPQUXel/NyCO
	L7IMzaKQt4pShErbiiXb/VYFVWTXsZoTUo87pqOcub7W6Pbdd8zIug4tNPetE2BURwqTKIjxD9c
	f6t/JVk1oce/9X3O6q77y6aXG2EqhuoZP46J9ziQ9IZJf9fOaz7alK5XZ5kUHPz5axF+EodeVzW
	nBE/2CgwOGqtWKV0alKOGsMoDMCNj6D21e92wP7GuTQAnHTfES4W66CK2CghEZy/vIkIS+Fu00p
	/LWcJNcsyL/loqFiktOniFrH5EER2jK+N7xSCsgkd3dm5bw==
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr346773385a.6.1779451646108;
        Fri, 22 May 2026 05:07:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-914b49a070dmr346769185a.6.1779451645680;
        Fri, 22 May 2026 05:07:25 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb133f7fsm599416a12.23.2026.05.22.05.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:07:23 -0700 (PDT)
Message-ID: <29d16d2d-3a3c-4443-8f78-b99a5c3c2279@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:07:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
 <20260522-surface-sp9-5g-for-next-v2-3-dd9d477407f5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-3-dd9d477407f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: __G9VULQuVsNtQmgYGngRx0HrLhPhzrL
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a1046ff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=N2VbTgOPUDbNM2pmtP0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: __G9VULQuVsNtQmgYGngRx0HrLhPhzrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyMSBTYWx0ZWRfXzWChwhtvH5ES
 HEeFOQJ+qaub31oZsN+qSbGZdSLSiZhB9M8f3M9TQdChdsgA1wteseF0ZKUbBEj45zqG9Sx+bSm
 NZK9zAwPfX6J5RVFFITgelrBfseEdGizZh7jWzra6bQxpjD0znIn/72Cf68OGrBFXEg9RR9ph9T
 DC+Rv3hD87sBxDo0V5cdAbstdaCrxTLQxU2vdR+jZk3eIp/5Dg+w7XZ5jJqp3IaZp1EpPBAe8fM
 2xPxnuir+Rl63CUq2d/vaDI6jcBlxC8Lo4N4cpTYerQe1VbZynQG+PJHx8n9pbgu4yHUkci6qno
 cLYep4YuTKGFvXDqFM49Xznw/WDX1yiYk/j0nWUJ2cV5YP8caOYrl6iQTe2HlrI3Oowxag9fnlq
 kBYfEBafrGUcSY4a9vDtI0udwBbpNteOgu+sC1FA7GwhIzAceUHybH9U7VZYfXhxvyCEoj9J9sK
 f93sQalPy2iDglnEGJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220121

On 5/22/26 12:43 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Define the USB-C orientation GPIOs so that the orientation is known
> for the two USB-C ports on the left-side.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
