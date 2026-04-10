Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7E37BE98
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810352; cv=none; b=tycuTEZrgkVA9mFLijz3ZWHdvZlm2vXMS3GVhYdZfS8BpEU6AlQjbuURfYucxhMJVP8y/6jQOmGRs4Q617VTNumCrHL6iA9p5pae9SaOBlg7PqW2NOqo+qnFwSvJGCKYOL0QyJroGQmvo/Zwqm5f8KEYOT3BcuyC6z+cKN8In3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810352; c=relaxed/simple;
	bh=85bLsqNq6J8Yg43xXH2WwToGJpPw7K40P7+3iiOLLOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFQXYzUhJrE+PTwDqW42PH4k46NDHa+s1aoT3pXXzd2K89juwzNWqm7eoWyi4f+DY8HnWBXhSLPRHfGQTxD4G7wN8KElpPcrYCKvgcrdpbC+2YaaXIOPjS3VzZk5Dz+jTDdt5/DCaV3ep7cqhjMQPK6sGHsT9CD3rA2KfhCYQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alWKGZxU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGupuZK7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alWKGZxU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGupuZK7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oTp6709170
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=; b=alWKGZxUkjf1lCfj
	4c2KmL5paUVQFq9vBJtjrqqgPLvbOUlkIOo/sUhTqBCZVM+akaim3jzU4SFqoy9l
	oQTlYiUlJH2t/XYN75hC5XNeJ7yXlqn6tMln/pN4iSjrvJzcp+vwDLzk4MrxWu3M
	8dp8mQdrgbiYbd7QzR1AS02EUalYPLAXrKjkU+HsiDxOIyx+yOrSI+K+pETJ2apc
	BOJfSAxsq2AQc+svh+Lqczl6T9NKOZQtjINU9hJmuNwyr0x0PF87pPK5QZxzqvLg
	ZcGdYdFVwbLOrPb83+0oE/93Qr5pAXg4c6gOWbgmCUja1nM6Yw+56H4PCQrvpu2x
	LDIMaw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0k9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 08:39:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so5545376d6.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810349; x=1776415149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=;
        b=iGupuZK71tjKhPplkFTF6lWDd5VLJ+Dz+XF5reAubQMsEoJ5IzvZCkxVSyUAWgalNU
         iIe+4SPOlNCg8Cc+kb5HhJ5P0XnSlptsaZ4Iy+rWzkv3iIg5SqpozhOJ813fjaWmSlFP
         k0NyRaNewDMhmRl8GA7e1x++zr1IizGrE91SxUmAxLBKFxBIbCACrKa/ghTcUWeBXyG/
         2fNXu5ImR8xkKBje+s2CiOaUSdxjNZ/780/8eCWx7g2lEyFkd+1bZikR8Y1bWedlm909
         LvMGPpu3PnQkSS5XyKsdfqbJyRcKI0O40CDX9CFEmLzasoHTzZNlszBuDUSW19DxIaxo
         Dmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810349; x=1776415149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIByjo1CoZnEb+z4/C0+g/E8sffg7yONNqbpK0TilEw=;
        b=qGEd4OA3C13Sjf9QjwWn5W/8kZVOo4byYHERsr8jA5sD3D7sYW/hXlRE2iDF0t7cxB
         RnStHwEYp39OahW5/CFrcxo3745ebRJsgMEcys1IDBr6/0tmTc8vV4fAiHvgC0kULoWC
         +bmDhC7ZWkK989SsepTrpHwOh5paZqVwRTvYhfpvQp5tm78hJ4bhvPeIgQwlsbhAQf0b
         zY1yPckhk1/8spxac5amt0NgSlwbn3cvoMAMPKu7iGrSkDoIhjnTbQb2o0k849p9ih0u
         nEVKyZwBvU/e4PCceA1G+Ktdtn6k1zbVbk0MLy4nivU9EUFjcjabRhl5fJicBcox8sOU
         hOrw==
X-Forwarded-Encrypted: i=1; AJvYcCWdwpz3K1GE0y7+neAh/665QowD9d4oN0hSIwVQNY4WJYAEkYmlNdCY6Bl2wnXANI8dFTt6WMVHDdqO@vger.kernel.org
X-Gm-Message-State: AOJu0Yybtz5HYhtmvdS4iCAsQ3aSwfepL/tAblESKn8rRb9+xqEnlmVM
	W3D/ktfNvIIGIS8SrrcLRGcYBvr9N6SDEmc4YlrJkrSabLJQrZKHKvcQcJ8yLF2AIEZdMPU11Bd
	HtJhuFe0+dZC6UsBGtzHZBZHTzf2PfK0IKtWFzc3EkxIzq9rOmSdsq/cPvTYRTcY3
X-Gm-Gg: AeBDieuqLLw9vIFd0+gr8wEI4LH/QM2/7v8THAYCxCZFzN4cfHEUlOCcE+pbV0uSXfM
	ih0/anQI/FSoojRN800MSI+Loc9xibf1zG93sLf8fvS1mW4GFSeRe9rlS78jCWBLOzYDqNt6yW7
	oV45PfxC94oQCNNECWQ+ZdLGkzQ829U7aNeTbQwslrNLTcXPZnr6wN8YYdvcVuJ4L6jGFfLktw3
	0WG22jKp8Sxi3+v1lbBklGxCFHgMOBMaIvLKGtvIyh0JkUo/AFvoCW0VmHe2BO6fvRuNBc/6z9L
	/Hev2Awms1CrRdvXwxFOLDyLxlfUfFNS9LVNxPbyt1zeQF2NNxI8IaRGvQZOMqS0RDArPhxpSnG
	A6rD0/xuN8qw5eHuizlppWLjaIVeLdcBcoPj5ZhaAnr/K5Gqx+5c2sPBqxTScHnjYhXRjYqxNxs
	PcGVY=
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr19901596d6.4.1775810349586;
        Fri, 10 Apr 2026 01:39:09 -0700 (PDT)
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr19901346d6.4.1775810349190;
        Fri, 10 Apr 2026 01:39:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1e87sm59575766b.61.2026.04.10.01.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:39:08 -0700 (PDT)
Message-ID: <235ebe94-2b28-46aa-a283-bf0647267723@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:39:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-milos-ipa-v2-0-c699b6b8cf27@fairphone.com>
 <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-milos-ipa-v2-2-c699b6b8cf27@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: K4XV-RRLapaa5M0iXjseRDUrkslMAC-s
X-Proofpoint-GUID: K4XV-RRLapaa5M0iXjseRDUrkslMAC-s
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8b72e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX84hwdr2JNPbE
 lWue1yiJbAAuFv8nltPspTiXkFhdc9chWUb4g1eJEKcJw6d59M8aSEjoLfEc7wQSLpgSsleZZOx
 q19HPN5F7IB9HFXncgizXXUJ1WPgG1/8qvVhAAEPebSvdM3Cazn2WsBvscZ2tR3RxVP3R8hd2RZ
 5PtXC6wmXWyZ1/YaiJjKjwP4raFI0rFrwA2TDIoWFQ40IkJPZcPqIe4sgfvNKeLFEd6EJ3cSqIi
 4+4Ty4EdsZYyLB/nreZzyTlVT4FeitBHXrKntNv6S6x8xRfrUYmxo5K6VPJOl2CtBpXfN0lZZP1
 AllK2nuwrHRW56o4JUbLOg8zF8MmIaxx/XC+uySWmxJIKO/yOkkzhgkx+Q0u9S1Dz6lyefYYBoT
 7y9s5Xte8d+TyUgt1/VItk4CgX2SPbhmtBtYgqttxNx79N+K97KgH+zREqXMr1ZnXz7L+TOWkhB
 vuuN2/dUHXb44xOrtuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100079

On 4/10/26 10:17 AM, Luca Weiss wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
