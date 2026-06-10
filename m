Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B7F3AA187
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081660; cv=none; b=X4deXBjMGnIGv/kytBWWrC38V3LIi+LLryAKxBOBFVDOQrrs8MMSWnUiwktsqskHBZ0/HR3qru3hI/tevGcr6SYm5V1iCF7wACmqfYaWjdgShArofsJYGSkjaswiq2GJQ82UXnJ+8HG/mN4I20d8gPF5WkkOXD2ydmVJsAoOlpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081660; c=relaxed/simple;
	bh=+Xxv2iMVAb9T+aphjK66OgMMwBlWTragL+FjrC9B7yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWduj9c9j4NTqVxR61OQZGvzcg6BpY3SNXXo2x3BhpSDvppRXwcV0eKgDgbo3HTVah0FGccEUjt4hYevvHUGt5c8fXnuFQRZPnXfcdLZbgMEUI94vd+aBFVoHfPKm9yNZsN0Vtebo8QokwblFE02Ecud+LKAFmmnS2Xyy/ZIbVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJP9iZHW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkcBNvbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJP9iZHW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkcBNvbI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7j2OH947971
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=; b=hJP9iZHW9ePXHXOO
	iu8Uw1cwKZd3tZXTvQoIsGzaybsZmhr8X7bPmPZCtbIe/L5Sshp9yji2VkFGU7xI
	5iXz/YWnqlpuOaWBJZKxbWdFuH0PcqIUPS06iWtusxJKL64K7Luu0veDngGu8Uer
	lEomhNfVZsnn0xGyhUWib2sxwc65T5V2X9v+JIeIWPzjpIOZWzCqJGM67KxfCfH1
	4Be2c+zrS7C4hJ/kNcAms9YYcmHMd7kbnA23lqA/zBqnnS9pvEdyRFj72QN7rCNi
	kgVAw9l7nrI+jqHTG59kj0ca0aH3xY1LoMPZslExNexBV6PakjQycgmwIKxEoDlA
	LUQbSQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnsm8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccef0be668so13220706d6.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081657; x=1781686457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=;
        b=AkcBNvbIIOw8duPTeYxs7p3+BccTVbxaHrOZWy9btlDsGZ6OEfpHE1zEgULznuUzUj
         ngLYOSISSXDVnW9ejV+Q5J7olCX7hNMrs9hTCNZGCM5/lMG2o2gzDp/L9lw1lkpsEw6d
         YZWAdhWxz9ARfYENQIhvUI/iwWJWaxlVnsmlwZbXmyxFpUIKXnU0R6yTkpGlopqeZQ30
         zCFflSGFqzmoD9Qi1yQWJGhISrgBvljxLPQ4z4fXdnOgzcbz9/0rAmigk9yDBUK3PmBx
         5sEq4W8RaUWXnwDCXNQiAh3Y1aXgF+Yf/pgOx6G/qm3fzG1vUGgMVE9ADDtxsY+rZWDq
         FXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081657; x=1781686457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=;
        b=ItOSbIWBPJa2T/AshSWj/WIlhYr5JhYpSwvDxlH7yo0pqdt8rZrjEyySVp+Sj6PHDa
         x4AlQqZ0yJR3EP90ZwGSDpDudbNauLFhQlVXD3iqSSzsh3Xsr40CpfFd7zWga2v13INy
         7Pe8lqjzSEMO/z2N3KwNbvPW0uTJrOs3ZkXEP2IdtpKAYMweGAcySKPLmgwdXmgSrpVz
         dGC5KpWoM+plqnqDkZ/gChb4mBkdwD0VuxOzFQT1chztWSfPSYlpXY9I9F85CLwl6Q/n
         sN/WhRuZbsfFQFx8NGiVj31OQUxzwPF5d4+dqH/YSHayPE2MPUQE4ocRoBsZ/XDaM6Iu
         Hb5g==
X-Forwarded-Encrypted: i=1; AFNElJ81AsMvK4kgNPyalD+ra22yTOFFf0FA79kSgHOORYSAd6GKFpj0Mhfo5A50756Zrtii1Ef14m/qeswi@vger.kernel.org
X-Gm-Message-State: AOJu0YyuBPUXQssqePEjJ4FTarxpJVWXhNDQQjXsQK5blcLSgItjLYFh
	CJM7I/facZHg78GIeShS7RI44IiHPL+aaM7lQTwLrVA/sdrnT28XPPk4GemhNq2wv9ufuFLkMjb
	hLzib6lGrb2YOxM0vdBIIsyyEF9LpkkNAOsDEfsDVUEv+CWniV1epVPsfWZP6mPzj
X-Gm-Gg: Acq92OE3bW7rju3MhVTW2eQxMk24N1IAcmKdFjS/jsC2c9EGscdbvuMC5tis0U/Tz01
	1T53qW6nKeO7w7fwEUYivRvNvj/ZZFK7QWUI3fC0aqnp9iInBl7XO4FeUl2bsVaS6jT3uuhRQVY
	2nz7LPLjWMw7Y+DyES+pYGGdrpP8KKIkY9n7vbk6ZpMFgevfO8ETkG3RHtPWcSKiLhArg2lOPwa
	nKvot7UEf2jUJuVIVsgaTAs2xwxrKKmBdyXrWwtdQFNTttEf3JOZEQ65iDP2rCsDSAWiY3gF+ST
	u04F06IUqctiZrZTfNZTDpU5XpZRPxtxeAEPk45XcBE/mV7xwh9G5bR4wjY1sqwLD/aTYbyUqUG
	04J55a2RIYjasLWMz5gme8uyoDL+Hs9K3jgru/ec2UuqNnSYyqMn6sP59
X-Received: by 2002:a05:620a:2892:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915e6baf76cmr725469885a.0.1781081657431;
        Wed, 10 Jun 2026 01:54:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915e6baf76cmr725468185a.0.1781081656950;
        Wed, 10 Jun 2026 01:54:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm1183744866b.32.2026.06.10.01.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:54:15 -0700 (PDT)
Message-ID: <49a0e51b-a0be-486e-acf3-5725551d1715@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:54:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
 <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qwwc4BmGDP3C31s_XFtBNeQw2IYVJ7i_
X-Proofpoint-ORIG-GUID: qwwc4BmGDP3C31s_XFtBNeQw2IYVJ7i_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXzCOz9Iy8O4aN
 8VsIe5EfcihgX3Z58D6azil96bAf+XnPloFBCkL/mUy1y0OHT8d5iT5gXHGv3SVHvbD/v2TKJud
 ngLTBY/iiGtIUBWm0cDo31eu5FT/M6XyBcOL/NIqiPurfqdpY4rxejWgpQtI6gsXg8rbv0LhkbO
 MInw+KcVT6ZbO6ABmP+caSZM6l+iuvw9Ez77L0GNMyp0A77/cLyU5R1FOE4vUMJmFugnymvIpYw
 y1d0n7TK3XLZJGAlrocgwMlcN2Ir0c8dL2PG2fPEFzcpqWPqZvp1Bquo/d7reJmLkGy6rYGg61b
 /BIPqpXAa72DtnvmS5z+MGWSKcFejcATvNs7oyR8ndUBckVC3KPGGW4YY2qS0kmCOViSqc/ZUOC
 p/Sqc7iuV0craogyXCsMf4TLxyBRXOHKi7/YKf0nzgxJc7tYm+uQmjUrL4oacWUOG3gGa9z4vJB
 C12cH5ZowlryHJJabIQ==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29263a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=STQ2a8oQ04ts6E9hehUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

On 6/10/26 10:32 AM, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2Mohm shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4c8f6b7712c5d340b20be1b9217c..a526c8a07b30c22820f54b54644916b268496209 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -291,6 +291,12 @@ adv7535_out: endpoint {
>  			};
>  		};
>  	};
> +
> +	power-sensor@40 {
> +		compatible = "ti,ina232";
> +		reg = <0x40>;
> +		shunt-resistor = <2000>;

The commit message says:

"through a 2Mohm shunt resistor"

and the bindings say:

"Shunt resistor value in micro-Ohm"

Konrad
