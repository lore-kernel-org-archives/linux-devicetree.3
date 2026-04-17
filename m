Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D0377EC6
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413800; cv=none; b=ZCsJhiDud1ieYypq+w+3We+wsDr9+/ESBU2cEK1ejkrgB7F7EDzBPbfqMWf+GVkkBsMu8W1mmG4iSf+5nuFx857DjkUGWVbOqXTncyq4pbNyU+mnLaresRyq5cx44GlgL+3uCfX7RLPJqQs71XBshicL5PVY3pFjMxpJKj8bpzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413800; c=relaxed/simple;
	bh=RKY2A7kQUG4Vyi0JdkewaYZmzvqOE6urqPDc4FCyexc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzrtLAgaxNZ0nRQbclhfu9OyWVDaY2kktG6fBQ4T8+h5esxSRDJmobwDoF4IpxYz0sm8sQGHONhMTIAb23XUc8OWBi/Rdoigk9PUS3YU288kezWO1XoWy0SUoD9N3lQNQeOY6Bqxh4ige5iig90nn13Bc16yT3o+RZ+eYTbE7iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyvDIrnk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQcOnZ71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyvDIrnk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQcOnZ71"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H88T8h869603
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fKKtiLeF0L20pmIMzyjroAV629Hy56qQv07GTI/Es90=; b=SyvDIrnk9jeKdhO8
	pvOHtbSPffdT+heP01d6bwG100czvaG4QB6vOWk/D7Wv5xX3C4tBr4aDoDok6tPk
	HuEZu6hHCbGZEhcljGTYXDTHVGmsDG5PfRp+d/s5hdSlCwB72y/djAMpnQKZNKxf
	oAQAGN50rcE2/gihfixOggFapsSSTtt3YtOTPdMh7r0OHELjpDLrntwtH51JZBqL
	yxvmgaPdmLWBZ+DF5ddzjv9K4P5BoLwxW/aSAXBZXytH5ljK8NUjt/Dj/i6/n6uI
	gLulQbJVVi2T5WxXxb5Gg9aeiITJA/YD/P8RAyDSayboMkiK3JKm3ty55YngHNI2
	XFlt8g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrucftj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:16:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a5bf7ee420so1175706d6.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 01:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776413792; x=1777018592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKKtiLeF0L20pmIMzyjroAV629Hy56qQv07GTI/Es90=;
        b=TQcOnZ71Xyne2xbpDRpAkGLxUR2dNEhz4bSGTsSyhkQlN+NnVTOfbp2nRSMQpZPQu2
         V2A2AJ9Kh9l7BJbr3DBVSbFc4I8cXhG/Z1xZSK30GI1wlSGX+K0IH1H4RJvTD2iMq+Uh
         08obGxTbQQo5OOchkLJYL4UD0Eb0sAmKM0/n8FRzdwiDZbLGUzZAvG8ET/PM+6TZjzno
         vrFysyryR5kBC5InbNQsH5OWxKizD2ajpR7DQDRUcSR0NjevBKI69HticNymjhiLrDKv
         AxW9ncu37V9+hTLHMxPucsbd8FMYsv9fIv7tu+2RfE+PPTmEa7eJ39rVyOSTsDQEd7CF
         KaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413792; x=1777018592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKKtiLeF0L20pmIMzyjroAV629Hy56qQv07GTI/Es90=;
        b=NhC2+Y6fTFjxblL+T/4Wdem+yEDNWSAZJLfS1O0du7mFl4IBPD/X7V+naI8B2MW+9b
         pAWvmk6FzaWi3KaUuFysF9PtRRt7RuogpzBflE8B6rkgGkbCVIFnLEMaX4KsBX+l0yir
         /EgZVliYssfwZxBgUZHkuPe7Yn/3+bZG0njKo34yHvu2SbHWa61Xr7M0CdZSbvBD3HyI
         6NY2bXHsrlx004mD75yS7+aOAb0IMmxD0T166/Bd78EsBYQlej31405sXR/xDaw06tZC
         XnrM+ivG+YvsoDWzMQbpzZ9W1F7WmqbaXR/2CiBGIYsqML9I2XdFCYqlGbExvyB+UCl4
         q88w==
X-Forwarded-Encrypted: i=1; AFNElJ/KWWDkzLwvFHefaNpNc+P4Dl2W84mQ40BAbm7w+MIJTAKkb+EFjMgKehEhlBqcdAzVpn0TjkwU3rWN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7LpmDfUXqLCRhZpavWMG8SlxcGo6XkqHVfxILgP1eONPBGhC
	W2ZEzKlLqWzzGuKq/p0eyxwz4bMJQ6rchHxFxStfLwJX+P4E9WlaX8r/ZmHuf1+SutNZypUJoAZ
	rMPVzQs8Qa/nJsY12L0ZkRh0mVkXcfGwCz2o21t1CPJuTidpV50zWSjNPIdP0DER/
X-Gm-Gg: AeBDietZ5d6ox91XZCgi8lIripMdrXs+PEBd5mPkVF3KAPMjYuM6dlgplPYojcFSmVL
	xyXRZZJWPBJ/Lj0Xgy/7skYoWB1PUw9o/UyHAU0eqBhGbU3SwdMe7XMNk6iuu6RgLrAau9b2H+k
	yPoc75dxWAGHA1wkH/xzXG9RxhYT33zt2sUOA8M2VX/bmpIP/DIfsk6pyYIYVLGu+HGHgc9vL7I
	F48Fq4njUQFMioqsSUOfWZ7gQt2xNb0KkMCdCfdF4MlTBqO3ZJQ6BQWLXlUkVLigOZXL6Ye1kev
	yUsZFcBu9/BMX+5UnNSAIF5PgoqIMs8lzdCxT2+GuLdXJPsBuNGr7Etsqt4rIzLiiUcb08vQgJe
	NcatbxJHha8vEQVV8UQp1tteQfiDvSrK1IPPmenOIt+wYjYrKfJCUe0LOB8lyCKqS9N9JXlHVl2
	c1XUx0EouTE4joCA==
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr20534726d6.7.1776413792374;
        Fri, 17 Apr 2026 01:16:32 -0700 (PDT)
X-Received: by 2002:ad4:4eab:0:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-8b028181327mr20534416d6.7.1776413791886;
        Fri, 17 Apr 2026 01:16:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bab1sm29948566b.35.2026.04.17.01.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 01:16:30 -0700 (PDT)
Message-ID: <8b5a49ec-8120-4bd8-8aac-8ba1ab3cfdea@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 10:16:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] dt-bindings: net: qcom,ipa: document Eliza
 compatible
To: Alexander Koskovich <akoskovich@pm.me>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
 <20260416-eliza-ipa-v1-1-f4109a8e43c4@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-eliza-ipa-v1-1-f4109a8e43c4@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4MiBTYWx0ZWRfX2qPNrX5NTmC2
 u77Lk4u3blIUvgINMv8Fir0M0REe/Pak7gX9fVCvVsYKCkqWP6z7I1dLAK92jRywP+Lt/zMl8qe
 4y2cSZ2ejv2CioWgz9V9JRzi0FCixlu4ta7buPc2JT48RYFwy66Dj1u1nZSHLLsgKa6Kh/s0U8K
 7dRboivpbKOW2jo2/O5nvs1/IJlmIhmlyKn0+1keKoax9iknbuIqupoOcuIl1azvHsGErHMtZ+C
 zGt+9ljrW8ZYYFA+CIBn+QrUGnoe90GpWZIhe13rq5Us1DHwzrCTJajX5Rdm2UFIi/+Ce0i9tj0
 J6fF8lk1lOG4POXu3JndWzI7EYP0V5msAHQQU2xJgsDt+qV95ro2adFmaFN9Cru2lsOg4UfT+EG
 9rUQc7TVkxv0MlV7zRyFfS1aVCVsBN2woFI3SYsX6zsRSaG819HbSl6dSAAE+ebhT+I2s3o+ZJo
 A6c74gMKIcTIQ7o255Q==
X-Proofpoint-GUID: EZbWGdY3DfAa7-FrSbSvEC5-tab-dTdk
X-Proofpoint-ORIG-GUID: EZbWGdY3DfAa7-FrSbSvEC5-tab-dTdk
X-Authority-Analysis: v=2.4 cv=GcInWwXL c=1 sm=1 tr=0 ts=69e1ec61 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MrVSDPw3tUfsMvSpUigA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170082

On 4/17/26 12:40 AM, Alexander Koskovich wrote:
> Document the IPA on the Eliza Platform which uses version 5.5.1,
> which is a minor revision of v5.5 found on SM8550, thus we can
> use the SM8550 bindings as fallback since it shares the same
> register mappings.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index fdeaa81b9645..38a5a337c34f 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -60,6 +60,7 @@ properties:
>            - const: qcom,sc7180-ipa
>        - items:
>            - enum:
> +              - qcom,eliza-ipa
>                - qcom,sm8650-ipa
>            - const: qcom,sm8550-ipa

FWIW:

8650 -> v5.5.1

eliza
8750
and a couple others
-> 5.5.2

Konrad
