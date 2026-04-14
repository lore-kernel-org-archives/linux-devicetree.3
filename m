Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10E3BAD89
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158894; cv=none; b=s/YRbIalH3M1dvKVzt2KI8z73SCko32RG06KFYYuYf7bR3lRr2QqTQTdkObbyuYXp1/BBG5ce6Jp0J7lduH7h5XEDNVYFNnGpXzu/uyCssw9tst9ZquYBDiNs4ZsNVHUcA7dp6Vo/UmH9eoChi2GDo3EpvDeru+aW/WpavU2XDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158894; c=relaxed/simple;
	bh=iZrJZpPtINLl1+luHqpDgYbeh+LfMD/d1VjoI+UmY1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CfiHYcpFxZsm3Ytgc3Ybw4gvukJz41VRfPOWJ3ZHkfmd+vREtpRnaYnimcaqQ9ZeBWD5XWtfkIDuA4FSV7mVzjWKP2xcBDNHh7cKNnvU8AwabYFWWHEewFYbF0+VDxEPE6FI3NjKLKPmAJSG/yr3aX3o0cem8c8qwb/v/+9oxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaIu16jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8kkIH0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaIu16jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8kkIH0T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6hgmx361498
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=; b=PaIu16jvI4eY6nNj
	gtcJ0rCxXZdrTIMciGXAddLHbSyjqOVBDSlnrJpyngGt8ieMty4j/G9uoYSU/Z9/
	vRBy3Ir7ot7z2vOFU5GYGWxZ8vAagQzlWwS9wepfMQPG3aH8KKwGsfYbKTkS2eBl
	p6hbuhwiac5HjK+vrOqwiyQLaoAtoYR382RBKUqJwrRqC1AUyJC7AOydSrOqPqe0
	1wLNmfbieNyFNAY1oAIy7/bTlXvl/4splut5XooIUHwhCKyycdwfagVR7B/wINYl
	FB6ezFKEmrZidMLMxjoW0f4ydR7MrDoyBfUNrRlloVvmx7Yi4tEt0XnRwXYxe8yE
	vgMMAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t301-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 09:28:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso50699331cf.0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 02:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776158891; x=1776763691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=;
        b=P8kkIH0T2zoWl2LUwuyeQVRkodEfKJFNuSb0TjjbfU5Dhsa9XspkuMAYRA8K0JK1Dh
         Jbd/0IRoyC3MMv9P6aoXhEADJslcQdQnBUK6eu9jQ+L6IQYyEYDgd0jFre2GAr4yB3S1
         0nH/kyfzhhyrK9JoaqhuP0D6yU3PJtl+1oiYqmKMP3QDy17x7eGh0KZwIviFamY6KS6W
         eqY/GYukEr7YubQTv9LFnvqhTXEF7SeROYc9VK13TdQfNybvo8kC/0BEfkrv0ZCzSigp
         Lg1Ku5UR8s420rGNcLRYo6xg5/fxXeoIQCdqqdE8TVVsrmW/w1jbvPUEE8so4lmjYxGY
         e/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158891; x=1776763691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea5I0KaA8Qymx5nhITN+82nJTFAWzwV9uv6f1CEHdBQ=;
        b=C+dT7n+B5Om6SCH9s8/qMyEyDBCmSw/+gzUicfzgfSelkJWhoc1qlExysldnUq8jy+
         7QSiDavK3Z2rCyGJUBao+IbQaAcx2pYE0i+4efQvy7/i1JY2bHxk1ArcH2lcSb/h5lMW
         FQJz+1IVM3SwpcCXRAvZJZDDHUSZe7lsBB7tfxEAT+O+FasRNts3XeGmrQJ7PHegudiP
         Ku5sE5L3kMeCtcAylTffX0k81WkcZSJkd7OwoA4IJ23MomTGg5nnt2F7eSyFgttLdGPR
         g5MKtXMDLmjPtVnG6s4kE/QYw5LhVWZ2Ehaw1hZlF32Okb3cSoH4ovFy5odkbzOtBz7O
         6IPQ==
X-Forwarded-Encrypted: i=1; AFNElJ99dmXL3Qh8nitXMoJrUVNn5pnnckRf4L6l3jhlf3uxmmntzKJro+lnjl/9hdyy2OpjmdFJbNuVklyz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0/cDcV6ulXey6UZy07+O9/D9l1uEatiop5+sONqOcFDjWRXs
	a45VQkTnL1vLy1baDk3AVX6csKDenPT3Ky34qINHJ6HjqX/6Vuwp04ZXJgKhMqDDk11JM/Q2A7Q
	73QWyILrQ0KXnph+I2ggJuq8+qMBz1BvG4/v1jiwQ8oyg9KiS2DRec2zNY/iVk6C0
X-Gm-Gg: AeBDieuQUIj9Eis3x2hX0HRym2/tW3J6OqxVImQuGqko3BiNXwcFHtoqRKar3Tf1gVJ
	Xb5KRZCx7nFcwY8X3npKjocRxRFvPEKCuy3KZQyuU62Q0pneVmy5djetI0D/ErNusqb1UIzt0AA
	OoUjg4OMEEJ1A9Pg9LDzqBIZ2Zz3luWVA12//49z2yCJJO9MCEzEtrYEJkuFRBe4+hC+NmbNcyA
	TEqGmYtdALQHAElZqOKsvQRdqtOsIJbzYG/a7NFZnEFHxD0VyNK93WmkpRVOsYJYesQOMyLIKpM
	evJ5wGDlkJFthzowy7/D33X3gcjCUVY5j5kJzSscRpPlqKRARF0BavSQnst2p7I3Y+RTo9UXKNc
	Xfy+Pbx8LNWoyiK1ZLjP02ESosXUTTq1X9z9VeWGhGuUhIyybAFlwz+8vaWHKikWUlnx7kms9eM
	kmcAj/q+zVLsgfjw==
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr185509211cf.4.1776158891251;
        Tue, 14 Apr 2026 02:28:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5a96:b0:509:15aa:cf03 with SMTP id d75a77b69052e-50dd5b76641mr185508941cf.4.1776158890861;
        Tue, 14 Apr 2026 02:28:10 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-671a15577f9sm892094a12.17.2026.04.14.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:28:10 -0700 (PDT)
Message-ID: <150d2a51-9fc0-444f-8009-9b2401c5bc16@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:28:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: qcs6490: Enable DP audio
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de08ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L-W2jZRBQ8sxs3TRFuwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4NyBTYWx0ZWRfX6HS+s/pMo4Y6
 JGlEbANzBBEVry6d+e8sjLuhSnJEqjk3zOkeETNjJvwrQj4Gp2h5DmPfd9yvXlmRND89fr83/vU
 gLFFPsZttPdxRHhZgdlGnLwNLLzVGgFu1FeuyJWWAwgi4LXzoZ/jc1fQL/GScvmx+k726B3BGUQ
 2j7svbzI3xReLNntH2XkJlJnPibs8vm2rD1gpBc3Uz6OCfuOmwXyLqwN9xHYKJ/uqD1dg1kX5aG
 xACa2wLQxinK197wC3qGwJUymBfVDiOs+tLQieiq5Q79OzSRr3tYFdxOc1jrev+onPxUoP0s3Me
 21j/wkYThsbmzelXFkP6kcYx14a5ejwEn6sgegMr8FlZElvqNucK1vGj2+UXTejeckTagKp/0EG
 2LLYQeHIVJhi56jJ1KLTekvWb8/yJYjYMRPk0zNvpe0GZF3NQ7wE839bjXwCn9xuhDFyy1jCbAv
 V8z42vcHZ5LlYqrhMvw==
X-Proofpoint-GUID: _w7yVAg_cA-k5xG2o4td4mbt04U5IUTg
X-Proofpoint-ORIG-GUID: _w7yVAg_cA-k5xG2o4td4mbt04U5IUTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140087

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Add new dai link to enable DP audio.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

subject: qcs6490-rb3gen2

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
