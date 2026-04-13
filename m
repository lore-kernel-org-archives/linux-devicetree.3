Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3733AB271
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776069423; cv=none; b=fmegmf9sQ7GHAUHGtVvsbFr6pS3hTjNjNByeb/lC/bbg+ecsaQi9BLm9Z/3+jX5gM7Qp/M++zI1Wy+z5AiXCkfdDF8+0a/AJn4o2Q27p+OnWtix7zP0icyGvodQC0OlkEJKSka9P8AcNw3wd1XuYRcqOI2o5xTz/hN+KVu6YVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776069423; c=relaxed/simple;
	bh=OaoJFLO2aBVpD5kCuT2SFUReZuAlH6eEsf5E0yrjLPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChUu2YH1z4UJfKISUAViNNhUZfRSPYKuEc1A4vN6FuwN/atshG7HCYIMDjMcrbXh2EXJtxu7pICyhpVeIjoismvZiWX10TFUH/Dwdrwm2zE5s07+kN+Et/SW0dBXXk6JVyO3Qc44rqX3RBsreeJ3UHEXffN4BdxGF70Oz8Dy2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4kEE1Zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Quhp53+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4kEE1Zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Quhp53+j"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7EZf51305286
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=; b=L4kEE1ZrlktZkdyu
	CO4Y45EQXohbImpf8FQCvojNhRzSXqeqEV7nqmFSD74/n1leuEFPZV9aQhqv1jvl
	G0R3jVtPqZWfqe9HoNTiFhgvvCnwcgtq5f8gDmV/5c5RUvMlGINp0z8ZDXbLHAv3
	YKgq1lX/WVXpSRxXqI+g0K5tn/ok1BUJsT3Fqyxenw1KWmktBmTBNQxltoc4eIZ4
	3vZFNqIMnhx+M5iEWjUlYYPwAFzSDXitMbyOoFxEeBrMFIYwFdmhZGxm6UVBSt1+
	9rR3TUj1+HjxEvb9cCE/Xh0ULyGtRHjyWm++5wHVwOzI7pqOhi2aNrXUMDKJtFBL
	OlsPEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2bcfcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 08:37:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8aca4966fe6so4594636d6.2
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776069420; x=1776674220; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=;
        b=Quhp53+jrEHqWbx+p8UjVSr5CFM6MJ52N8QZ89DtJML/lD/37L1nzGhipphWLzwn/s
         Fbg+ft2Y7siVBX353zBovugzVvQbJOwARhT5A21C7iP9/II3vE/mCOMLgqYmVl+Wr7Xu
         rBtPNnbbWYXr0HdLwJPP+FRTMDQXXYqUsAZITVNUpRaJX954Y4x7+1Gwjnxz9z1b11dJ
         ipHd/KGjXO3RKoEnMGcwLuUgEwMXjFRjBW+iOfWVPeXRX0YutiZ832+qnhZGYjF9zpNV
         rxomkLuX+mQpUWRBchEGMDT4PGiv0xCIEHAzBZOoJQSjDHbqn7aVWYUFztyssw005uIx
         M/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776069420; x=1776674220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGsajq/vn1yB+1MJRQzoKNoOQK8FQWz7uCTZTI7fQDU=;
        b=lKJ5vGXg4d4I1Y6jMfSrMxc9+nz+K+OaDXPLRQoLelFSM+y0evAt4cGV2Wa/LQvkMe
         uDnVJ8vsMhKUNBm3nYpR3ETS0lHwNpPujLweWtXL3bM3nsnGag+ZOwKm8pGX/lpHUrJS
         VPOWztK9sV6jENZqG9g3a9YjNyvz5qHGDMczHkGR94FVInMmWuX9cq2JqROpB21rMAgk
         gVAYduAl3Kep9ILY6Hw2ku/QoxfRwctAgpYJmClepQlMPwndVgfgPdn7JlpjiEQQ01Dm
         QxhxnoKnjfpnJqcypXJjptIqN1z75ri1PCKQD2kpi7JR+8p7KUgytu1FB6nLRrIeEqLC
         A7zg==
X-Forwarded-Encrypted: i=1; AFNElJ+49Ce2jIelGD2lr95xC5p+hiG5jvOincKZn1ksqZB2E0rGO5rZwzCEclb1O8cpYUCmstRVZxcryuSU@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCGUQXoo9dHU8NKYAVNR0yTDEADYxsQq900ETIPrNs8vL51No
	xIwbUvyyVBOzXAsvfhrec8sXc3F/z96GtI6pUmVEDop7R2VMLdggRDOcgA6+hUB6qHh7luLG4lg
	3e+w+PYh3j/Svvamp4MA5kSMoNqBcTPj0gdZWQCB+VQSYR/qhb7B5pzRcZzu5xr5V
X-Gm-Gg: AeBDietgF6Yp+hk6IwrpGsqExwmpUDYnueAFld40QZmddRbChqOWpIbtTmzDET9zasg
	4zYA8hAbEvUMDB7kaC4dKVifqie2bayfmJ76uXQqmEliGbNLFULYafc0P72V/TY1K/FsXVwzVhy
	m/H9wVhMLdr0Bv6YoN7v7sgcJCcXlK1BvQ7j7RL/277JYJuSjZX5Gqlr6YviCAenOpzJoLmttIk
	lpJ7Q/9k7RXvPg05hb5JPwu0Lp5BXhN4/pdu3RW/fELW1SyYKg2yHHm+u8Ao6RZ+JZw+gIZ777x
	FfCTt+fVK0x9E2TwPKg61S3ci20w2VdWw/ZrDpc0G5aeR7zrMCZfxiQ4dBcGMi3AWBjqvLDifhP
	FnoBqAK83YrniqAGPzepBzt+U71epXm7u/M53KNLj9T9bqt+YOAuxzyZXdJ95dsh9PZTPENKxbI
	HML04=
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr127314296d6.4.1776069420496;
        Mon, 13 Apr 2026 01:37:00 -0700 (PDT)
X-Received: by 2002:a05:6214:230a:b0:89c:5473:bf47 with SMTP id 6a1803df08f44-8ac861baaf7mr127314116d6.4.1776069419933;
        Mon, 13 Apr 2026 01:36:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8492sm295448266b.47.2026.04.13.01.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 01:36:59 -0700 (PDT)
Message-ID: <8d2d25fb-2adb-488b-aef6-79bf3bc1cf8e@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 10:36:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz>
 <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260412-pixel3-camera-v3-2-e26b090a6110@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4MyBTYWx0ZWRfX4eNFZX4fj7ry
 Iba9xRRWt7P0Jo9nnaYsj9ji5CDMbu9+pARIFpOJu2YiD26+qrQ+U90gjk10vm0vVdtbJbhRlBY
 73jDbg24HKNgRwgJbp5x/cbBQ7zBpiA55k0LPFPjb8eI+vezc9hAV1yIDmS8W77JJqI2IHFoq2M
 hguVI2e2UcxOihnLt9aup7DhlDISrvkifTojyCi1Diq+MlIEgtzRK1OhGQqFiH9f1h+Tt/mBm0f
 /4jWSQMlg11GpmT9RIblMjxlH1dzTrdiZHUkgk1Y1FKaG28zk5o9LFsXm5/nk46SCo9cIx5Hd1n
 Ej5A4UNr7o0LVnoVKFFXMMPuwMRaWUy4L0olXbNc5uhPA9wuCnxgsV3mQzZthW8nhj9B4G4CCG7
 WcYmBWrvCmInQm4jDODAN2ducY+U1gnyTzrS3mFcrP7EYNwjHIa7kNVJbrhWrF5RZhXdEaWDdM/
 AKR1MSFYeHL8UAvhV/w==
X-Proofpoint-GUID: Yn_8dp8eloQy-zbROgqs5jyTUYMLXnQs
X-Proofpoint-ORIG-GUID: Yn_8dp8eloQy-zbROgqs5jyTUYMLXnQs
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69dcab2d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xIeCYdN2kLphDQboBmoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130083

On 4/12/26 6:35 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe the white flash LED
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index 070023a9813ce..e9d9842cb8674 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/media/video-interfaces.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> @@ -596,6 +597,19 @@ &pmi8998_charger {
>  	status = "okay";
>  };
>  
> +&pmi8998_flash {
> +	status = "okay";
> +
> +	led-1 {

"-0"?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
