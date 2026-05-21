Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31D035F5FB
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353681; cv=none; b=SrjqD1ktmEPzqEcw+xZjeFBZM/TPBE6cP/W2WareH+lx7SxC53X4C18ZON5gtJMuCkwq/QBAUyXWhNCUqTokHmJmualPsoor1NkXjEL7N0bzdDrMt6vHTwG5FAv50QV6uMVVkLXUMwcXDf/cWPQ5YrMIXBzlVBJci4I9W4/Mn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353681; c=relaxed/simple;
	bh=UXSoyOzUcwtpZz17TlJjAUrPbDYCPmyHiRdYez+lk3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dd7mq+Ymm7ulCqayU1mKMaJtm4LKYdv4ZXr45hLiMjeSrMNWUGZ0H7E+cQa8u0H1Ra118q9p+Eci5JP1qbQ11q1VeFr19QrFeK2r55NoEq7Jt9BFuEsVH+6+fYEeN1JsCqcQKvEGlzOpemhfIQkQOkl6FTSQ5O1vJfrsnJ/nEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/GKHuJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnm4xU9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/GKHuJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnm4xU9L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6fgUL2158102
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KneU25sMeS+sXuch2Vow90gK/BMf+EqfUeuRaPhtrQ=; b=d/GKHuJOcJy9aAq9
	FBVantGqilVVHL0saJSTV+k7LN6lLwK0JOU2gZ96QsgGhWEBN6oMGy6vBZMyxY1J
	/PTZUiZzJ+f4D0/au4+EWasMAfdEecBwmflhz+unCszt10qRkwtLjvUAYiZp/0lm
	e5NpYJOe4ZE7Z41RTsD7hP/7sqFRrqLzuvIvKA1lM95f3efj5IpfoZxWEKI0ZrN/
	7OGR6p9TvR9hIjgn/1jMD0LRl0YxALRAYT+0tdRYwsoCGCwKov6pFFoc4M2eKJvw
	7Q3L4cmF8qWXqvx+Ff65XBrmfEZynlT6lKdsf0HAPJcW7MSnDsiux1PcLVz0f1i3
	D7EpGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42bbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:54:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9114b077480so138503585a.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353678; x=1779958478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KneU25sMeS+sXuch2Vow90gK/BMf+EqfUeuRaPhtrQ=;
        b=Xnm4xU9LTfIAc+wuCBMN67SSt4qOJsKtgNVUbFPaZlmEGAJwXBgehm13tRsNHSOD3m
         9zLUu6c/PHm+Mx0m/CCFrv4y/T+FWceUZbZ1xxvT2cy31TeVbAfj61tZhMmQ2yyXLn59
         HiKmxqRLazaypj+KzBeEMHemUpZb1zE/GNha/QEqy5b30Veacx9na1Tx/5nOqTSP+4tZ
         qXCG1Cpx9ThG/4HmZ2TPK3sHHkuDoqfHlwGmQHOFs5hUSaUiUi5dBEgGxde4AZI9EabC
         b8bOckFISiXTcw/zKgnY8cLYQZtygDweIy+bv5F7FUh7CbD20vP+SPSM+6oWc7tHz7+n
         FNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353678; x=1779958478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KneU25sMeS+sXuch2Vow90gK/BMf+EqfUeuRaPhtrQ=;
        b=oAwyEL7nmaBeDso+D16Go9xrvlY8QUY21fEOMikL66jMEjUs/uHx2q9kSUP8zkF0uo
         Bs75DVcFS1/6FFuS3JL31sIjotgAUG10hflfVXKzYRdCEJOsoYeClsRwyLNs5dmIKmrE
         eE+htFGZNTjPxm2khouBuPHM6s6DUPASyuHzTqnEDs96O1UP6u9bBj5l9tXT/zp6HvFK
         h8taQ0+EYDDX+dUCTOgWVr81z12G4GvlHly8ntKFO/jGTmWKNv8Cu8/E/WJavYxD/5Y8
         AWPVO/JTtddKZFCAwMnI/OmT9IUmYM0Z4P7LuNWyBjqAjh3fQIzZnki/zkor4uu17dcL
         Pjqg==
X-Forwarded-Encrypted: i=1; AFNElJ/I8a0Ucu2P9C7Yac96YYyioLBh3uVRulIRwb4o78E7MZCjhL+1ZNEF7fO8Ne40rc0vbXRF1E2yR5Ur@vger.kernel.org
X-Gm-Message-State: AOJu0Yz61YAHMY9MstyEEDx65G0IHPAgeWDGI5DlL06xi2RXIPnsLGGu
	WdRNgEsPtMkaXEPq+FOFMegJNFoFWSsbL/35evhYohcizLapyaI7C9wbLex4t8NQp4pDbnhG6yL
	kPSWMbORhIjKiiAAslVjOVQvzFDlBzQGdL9skDqsU3vTd6YWrOMOwKspRYMuYCH6u
X-Gm-Gg: Acq92OE0COfofCTL1jPWfAhO5VROX5VzfdmiMmDFOULcf44SY4hWP1WSi2STc2H+AcO
	iwrpehAKFr6ruVGB4PczV2MuSstF504XfaChmT0IltcL52BblARcIEnf0HUNGaVX8CFA32PWfsx
	KlICteJ3lftiEQBSda6SOocBl1GTCgX5Bi31zgzNTNSA4GTGTXreXLLjbemgqmCpubyUABYZixZ
	Z1EXtrH0O3xMLkQEzLMH5hzIfHbfh6fjdp7AdqovhKQWZodu5l/IBHWEfvhy649hTX/Yzen3UEi
	AQ1n4kOiNSIdc0WNTCk5cUx765W9mEdD/8m7CLJR+PzVN11183mjzH4xWBnhsZEKfNOnFEOHndl
	wQ0eYqPEx4Fu/rOrjME/Jw87yQ33tFNA2KjFvF3vbL+synD9aqEdI897XH2RpU0ZSOO+VZUQdSx
	oqLWc=
X-Received: by 2002:a05:620a:198e:b0:902:daaf:22cd with SMTP id af79cd13be357-914a28e7ed6mr175366285a.0.1779353678071;
        Thu, 21 May 2026 01:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:902:daaf:22cd with SMTP id af79cd13be357-914a28e7ed6mr175363285a.0.1779353677649;
        Thu, 21 May 2026 01:54:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa03d4asm17888266b.47.2026.05.21.01.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:54:36 -0700 (PDT)
Message-ID: <1182d92f-f43a-4a9e-8659-3eaa5a484c9a@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:54:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-8-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-8-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec84f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SQr0zt342Wqls0xQXHCdXd9HaeedqHyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX9VBEW6b2wen4
 JibFIUaPRQ8rw4gzaqEz4rMH1nEYefst4XC4uvLRPm/R4E2CNOlFbsu0Mg6CIygOv4YdGznVEBe
 WoXxoAb09PouKZlSWjKj7BkPRAm4Sp5SAMGp+bq9/JMrYbxgmvrnIXMdSevDGZ7o8T4mCBCzn4w
 +NMjIIBjZkKxQkji4IW/YiIVOEB0wA+9Z3ai/AjO6xEQ27JGo7WuSkyj3BpYs6AMB8QVWso0Ui5
 sJBIx5aOMeNxXWQYK/T2L9NCOUTCtnsVfceZzQ0zqTCAJnh75Bqfnaa8/sl4cVBYqkVxI+7MAPV
 41YaM2Il8al2/MRRkwiGZbIU+6+6u23yW16GDoNLkhzSZbNakN5o9niHJEiN/JFQf3oAJfR+6az
 ACYzSXtie2C0beIUKF9yGq+0nRrINLFw2j7zA6MRFsIOZDkPeTaVy27SnoZm30a/XnakYORfxJb
 SH9L8pB2r2+3IYk2DZA==
X-Proofpoint-ORIG-GUID: SQr0zt342Wqls0xQXHCdXd9HaeedqHyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Enable the lid switch for the Microsoft Surface Pro 9 5G using
> GPIO pin 180.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
