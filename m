Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E083AB283
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494108; cv=none; b=X0YU0Xo1pgON3L3veHjgYsHtecFW/aUqCnXURDbgv0miSzZKT1LoXJP3SQoCElPsUktnbx2GX3JWIi9vJx2KP/a6ITuuNTP/GLMb/DOfKOkaOc+SZzsD57d8bB2en9AsC1AFiDQBIuu4YKs4L3+7hUx7eK+nYAKeFF+Zhq7D3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494108; c=relaxed/simple;
	bh=PcENMnEFO5kF7z0Ym0VAGtForJNSos0nHQgajBdaQFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqvpq0qx/S+06q1Ub1T3Z7zM9eiXKNOcNJCAG0tyTgtT3gC8BoonsoAVDIlTwzJjI5Ul9kOUni6cG80SMz1mtQUyjY2mXI9ucF31xMeu9cAtBjFDczhli7M3HWvJeFGfrwCnhujhIiD9BVTC4kYz59fEEr86xRy19voAhfTOQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L1VaWnXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwGW1I/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L1VaWnXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwGW1I/H"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842RVe1638136
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 07:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ib5LxCzSThU82O7yGR/Uar7LLDQWXvQQXKspx5I71WU=; b=L1VaWnXECZo4zUPM
	u5rBXYltVif5rrRRq/q2czSTUr9dMUKFoYoGcmLLFwXSxCcP2kNt6GoGt1tIFBZv
	2rjLCH1CjK6wFtSgWUD3s+63Iy/pM6fvN1i5NsfY0bZRyS/oJKlgnU/Ev83eWqu3
	sEar0TZDdJqomLeXxVO3RgA6OTEou2NhF00UE9sppjCiNs4uhbc0k3iRvgX050Fp
	Kxss7gRDfZI7MxjtV/jJJy46gCFwBl+yfoaafvlUU4uus5BzsRW9koXjr+39PUjU
	fP+Tg+L3P+amUWrbr0KT2t7MmwUii2ga9QMl7npYTgkGclVDm69m9+18ngBoO4+v
	thCWtQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a99mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:01:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734bafc2646so9424137.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494089; x=1784098889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib5LxCzSThU82O7yGR/Uar7LLDQWXvQQXKspx5I71WU=;
        b=JwGW1I/HaahvIUTKEHBeR5kPnU6hn7SeP+Q/b7QMuBXM2fd/WWwpEXZJZswBCwAOkC
         sLzxrxppM/bSRoG3kiFN009yLrEa4r8YN0ESItXSzKMNysPuKtwtUnQ986445vm/p328
         60npWwZq/e0axQBrGLP0IgKWIKFn4OkYkYGzNfz35g3cW9eifMK5L6yZDc+eav7JJmc5
         4waZxv0yjIUgiQQ4p4gVVle7DR0syWkEOulxip1ouE1WpffVLCu/A+vaTcJ2ExUSeTR9
         +Retq3oHFp/ndJ720ui4OoRO3XGz423mHgsqvOtJQUgojdE1yiMB53gMr4IxGuyUdAXS
         NO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494089; x=1784098889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ib5LxCzSThU82O7yGR/Uar7LLDQWXvQQXKspx5I71WU=;
        b=LwXUoMoMjVyu3yPe9a8rLk9zUgiFwCL7h2kRHBdOmjqmjnvY5CUTCdEtUOyU5bUGQh
         qR412exMCxWX5PHW7ny5ItGR9CxaDhjBtS1vJcE/TLvk3VVPIR1xPGNC2tazNitmXcth
         lM5K3Sk7IdRRQhPueSBXVrjQnp7jKfp9u5r7ZNk6+ifeCgu9KDG/Z02OjWilK/Kzw+Dh
         iDWuFKBUI8epBrRJO0jFi4nCwlkAHgeYJQSKTmj+OKY0oZU2dtPc4X+Spne0zn2vpjFn
         v8CXNcv7j3wKLjzOGbtoFhNevq7YHEDy93XhWsKU0iEtQgN/ZOy6IdYN9RTipibOCGEQ
         RnrA==
X-Forwarded-Encrypted: i=1; AHgh+RoroDFkgYrsIqm/66eFgfXiEAcfmhgOLERSgBFfF7LoSCHYkUwPRLVLR2MZL0Z3jyQWyMQAIGlbJoJE@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzZi0PuBc4wBe763Hvv6lS1yizOy1f0YwpVaVlDNbjiV3f5Pl
	cnrx/OmE66RjzFKbaOJ9BH0I6h+sH1W9ZZjEt7ws6l99iPMvjZrLywd9SjCfQoKGRlC5Y7vT8rW
	50irvPgqzcnFBxtTKNUkOJbOnu4uwzk3zW/GS5vmrJFFuhewvignVh5KddujRn/LadjEl/7yl
X-Gm-Gg: AfdE7clWyArH1cgkYangjJnMeMd94Kebw2riXipHL2fr4VEwi4cX+Ako5onmC7R0uen
	80tWbAzNz8cr8SqGVY11rOYgFs26OsnXBvUFQJ3UQMf7EkViaKSoVIrDWe9qQsYGCvw+i4zEx2B
	tJTSRljzT2KcM6t4g/CYp9HAPxPsiyMlUXwKwGNzCdAKlzpS0yPIVGNR0tK8IBSviftK7mZHXHV
	DxjyAuYXQgGNyL3S+SOIwC0l1gY63/TMsOULNtQUC//pa9w9gpmlllBKUeGK8qJrrDJ0sU6hG1r
	csa8vL8jRftItVklSgALR7ntE6oFr90chSuVmGKL4qjJgTQCV5NNGC+EVeZqm7fE9htqIvq2tmm
	rQfSMnnwaPIy9QzqT6jcb4Hs7asqN0jrdcaE=
X-Received: by 2002:a05:6102:4413:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-744dfd01178mr225788137.0.1783494089077;
        Wed, 08 Jul 2026 00:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:4413:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-744dfd01178mr225773137.0.1783494088478;
        Wed, 08 Jul 2026 00:01:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82277dsm256219266b.1.2026.07.08.00.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:01:27 -0700 (PDT)
Message-ID: <e99b86ad-a974-4af3-a35e-931fa56d3822@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 09:01:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: monaco-arduino-monza: Enable I2C0
 and SPI3 for 40-pin JHAT connector
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707163703.233405-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfXyRtMO7D1wbfD
 7IG6T9KqHYjdSLtrDgYoRuyMBk3kL9jjBEkvg6YZuPd4fk4/w9GUz6rfrz5KqZ5/k9eUtnU5h7l
 pCyB5LwjUCD2CLTjKeSTU6A4gGNCeufViLBIMgRR0Qyx78R+v/LvUd+Y1doCLbE317X0b9Kc3L2
 k/aRvGeZAsNpxjs4QeSVIC8sp0clIsMHpxuTBBaNk4RSmLevfZ7+bLSY5KDmKksCtkLlx3jF4Bg
 rdKRVO2260xpddfUXbMb1EpwwEncUXAPIj3iQG092ac9YLSQAOh5zA3tTb69apmCQOzpmMOZ2J9
 3Z4I9i4IgRsIxoiofqoROqDPz35wmEo3c5xrNG0yUYBfQpmI9UgO1hJHqajVo+fFl2LCoqQrZ9p
 VSlcBhaezYe15DSZ3dpdOs12nrqiC4sQoXLGp0nFp35LCC2Gn1smSvWo2Z7kD7dl06/pxYSHU6A
 cttqmDor3yP5U+LoeNQ==
X-Proofpoint-ORIG-GUID: cJ1HtsL5O1AsjdpIhxzm5fRIv7ZhQDa4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NSBTYWx0ZWRfXwPGfp8F3UcDG
 FtuVUGFNktRNdMpQEOgMysQ+tBIanZcy9eRxOXF+iHvyzggEulDs9e4ib7M7Lt1bwcZ3izIDVs4
 pzGecKaO2furDc+YprOBtxymEWSumms=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4df5c9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kjLrY5-yeU0BZg8tZeAA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: cJ1HtsL5O1AsjdpIhxzm5fRIv7ZhQDa4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080065

On 7/7/26 6:37 PM, Srinivas Kandagatla wrote:
> Enable i2c0 and spi3 interfaces that are exposed on the 40-pin JHAT
> connector and add the corresponding i2c0 and spi0 aliases for them.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
