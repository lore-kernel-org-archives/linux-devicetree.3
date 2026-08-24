Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4394437881D
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556828; cv=none; b=S42qRm3IiGPw6byqErfRVEx5bG3F8Ui0HdqWIWHlo5PjsNfZK75oY1j7XxGf0FYQiztm3pzRvKpJE2ln9jgRvIlilNlZPJ1FEJMOrdrrWFSmOeWSF8J1p7q5W1oJR5G7r5ip4eo/G85xrRIFQJo6haskBZHO/+l4qccrX4KlmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556828; c=relaxed/simple;
	bh=AQ+D0CDJcFrq845h7p154JycCUGSb+Pwp+Xd7q7qs2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WiY989w/yrT0eey44aEJhn9D4K9TP8lF8zdGQdSapJRK28LibySQ8a8Vofp87IAKPsSEKh+a4mW00ZVDycGH4SIt+fhBaY0u38wK2jwBB5yaNhNjTbYznDkspFcDlrOqY3+UbqIftj2lTJjeKn/Ogq05PJkC4IxHhKWD53dHe2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdq2CNU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KI7pq62T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdq2CNU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KI7pq62T"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RDV01937668
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPCcKWpI+/pBOd+DBJOg9kxtJnHy9ezQLVrTpqPhUCk=; b=bdq2CNU6LLg4uN7z
	fxiM5yMcKtA45RGfsjy8sszAyei4SwlnHf8Z889rzUfV2rzvxah39Cf5T+5g9nP7
	S5gs3dW/x52RFVZt7CxuQewApWotP1OM0sSVjXCpjEJdEf2t6ahMPF8NZVU5LPcG
	LNyFAW8Q5D6/5I9B9hSjdkVC5OQ9pVttHsha6H9x3B/XNt/ENcUNErpOFtuEQPL2
	Xs7ZGxdFvH/kwDJ3krHicTjWnIjoSSbATUcKSiUDvbZAwAYXK6b1huezRiRes5RQ
	Wbrhi/F+2XLPVAIM4W1l1vusc2/RSXciZPUpQ8MsQvXVvu2UB3fIka/AwcgRBRK1
	3D1dhg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qx07w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:33:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52845bd815bso6187001cf.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 00:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787556825; x=1788161625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPCcKWpI+/pBOd+DBJOg9kxtJnHy9ezQLVrTpqPhUCk=;
        b=KI7pq62TgS4D0rqIfHT8u9bqYf//KgMxhQ1B4n6CrzfXBwpZdkBcF0Ydg0op7UAlQ8
         AqRZpaahu13nK2Dr3sIB6PxJHkb7aRw4xBnBF5adaiMFjS6fALnmJAR/f0Gp0nOsnJEa
         gvQP3mjfSLlZ7WN77vzYgD2XTIQF4El5VGbaE6Ge1gmmcLYOLC7AEIA2sTZGZ7S/kzhA
         E2QXjeG2RW1/woqb58Ub2Gc5x4GV/daIDCdwBqVPplegC58kbeEZH5bqzb2JlLLuRYFB
         Jh9KubbGuvOpGUIPNJNay7j5phWkzfUhktPYE3rYpuvs7Lf1YfaStThpa6oRyaFH345R
         TkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556825; x=1788161625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPCcKWpI+/pBOd+DBJOg9kxtJnHy9ezQLVrTpqPhUCk=;
        b=Ui7aHcyUlJt2bPjleSYTyCgHeJ7288L4UHhbOSYMsRqaSGtmjxnvtsi7Z97GxM5vy1
         hXKV9OE22F5IEVPHduQnR7Cb/NG+g9l1KCqeRh6beKqx5Go1I4EJkBvs6oBa0m2Q0aj5
         EqWts6eA7ViWfLxkfQGZZl3Jbqa3ms9ygDczkFV/AcYE+oU+4toaKsCqHvUuaFNUkVtL
         mHsceKKlTvQAK66R3L7/Acq4tWiGZkPvE9TYhKUPM18fU+UJhacJkCDiSTtWgX0cv838
         tlYoSoN0ziJgBBY7yLo+Hzr+DaSVERgytPZVageI6wtIYsG24++VNWCbE7ViNQ5cifJJ
         O47A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8w3lHwO3JFynFDJ2bHpi7wkgjwbZAylUNDCGYhPm2ikEuBnDVYJQ9F4maqzAPKlqnceGSTs34q9/2@vger.kernel.org
X-Gm-Message-State: AFuF++kCf5U/tOPU2FXyXqyM992JJqL5PEKdiMfIS8PtNU85qtD5aUtf
	sDKp2UYJ+9RWQG/EuD3Yx5GWODq/UlV3xk+e1nJFvGaeHZHLgCx0T9UfAJnyKOr5L680L8bbMQE
	Y3CqOIkDeipxwET8cRrUNsDd3xyIispaOETCvlVBotzPIy/cNwn34vjFybO5nKoxS
X-Gm-Gg: AR+sD13dLa6vs2Cbhvy7A8CgfcnpMOMN7SH0aukvB+CPafv5AovBD9lkwWdLf1mJUpP
	mnYFHUverBOmTHYGIjNzyF/glQKLcl81wTAtFGipuVdwng8LhAGsesZEeBuuf5uspMeywZcyjhF
	4IdO8d1n0BlF5zQXPWIXMeZzXvXqNhv6TlruZHBMwTMiychEz4IxxKGL/nEuZ4s89pQ1Jbdm+Zg
	F/8DdRVTdjt/oTqnKk7gqw1seUhg5pYWLAUtlrtDUnxRrY8ri+3es8eNKcZgxeww7ZWrBH5dfnT
	CjtRq182oYat9IHA2269l41yDFmqNNtLHbAkU848VsW+Fbg+SoIc7rG4xBtWDb0lXYLi61HMfQe
	gq30GdRjnEadzFUwBN8smU0wH
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr170432441cf.0.1787556825611;
        Mon, 24 Aug 2026 00:33:45 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr170431561cf.0.1787556823723;
        Mon, 24 Aug 2026 00:33:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm1095552266b.38.2026.08.24.00.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:33:42 -0700 (PDT)
Message-ID: <260ee89b-a839-4795-b0d3-ef381734bd26@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:33:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable DisplayPort audio
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX2ZwpmfCoSCQB
 fdBJhoIjUk0Mg2d8BwyM+BQ9rrjGqCryhX7e/x65kZ7RS8ybdcqxRubG/ySJOKJdE3FSauFt5hU
 YiPPum3yhImKC+uWP54xbc8hnbOX9l8Gg4s44oE71TGyl9ax7821xQulYbH7d7ckn80Rhu/9oY4
 2pyS+9ZSCXMKsf2wpuv8pifIkZcdjh21fFzwudtSzaAwsxck/qKfD4+cP35nIcY9y/yxCsbt53O
 fTWN3nREm/6sznamtmFntiGLX8Rtai/lHarwgLGCPbCVUzDt1TGGWV4CzTvMYsaPomyLtJMFDU9
 viqYWTBqENomzJs/g8854pLDyIz7iOETbSmvBmzhaLWZQraNT6Q2QL0ZoPmobLJQLguxxRsPS2d
 LDF8/ydN6+9uEzlOZEWHZH7yTjlqbmRrMdto+tKXKlD8mfmTt5bd4J06W+lhFpNzUUDR5s7Flpi
 7acLkSLDM9ccOeM8DMw==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bf3da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gxl3bz0cAAAA:8 a=dlhiPCt_JNRidUjbL28A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: ziWdVgYB40JT2FSKpUzSB-Mfnw96Yi0g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NSBTYWx0ZWRfX3x8VEaB+0uU8
 HbS2VxNwK9kLSJckhNGK3NR0s/M1Mup0aIitlkfmhgAnfbxy6y6x9mtQ0gaOgCmayr/2lt8ewdM
 /UtP5B0oFTidtPcahq0i7+A6vT4U4lM=
X-Proofpoint-GUID: ziWdVgYB40JT2FSKpUzSB-Mfnw96Yi0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240065

On 8/23/26 10:35 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Windows Dev Kit 2023 has no built-in speakers, microphones or
> headphone jack. Likewise the device with the same mainboard, Surface
> Pro 9 5G [1]. The previous WCD938x / WSA / VA sound card definition
> was therefore non-functional.

That's a good update, but it's a little strange in a commit titled
"enable DP audio"

[...]

>  &mdss0_dp0 {
> +	sound-name-prefix = "DisplayPort0";

Push that to sc8280xp.dtsi, please

Konrad

