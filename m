Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD14549B5C2
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818564; cv=none; b=sZ6rAOD2qqUOqQtje/otN9ngLUatCrLczQdNNyI4IMMtn3Ugnq6iivILOQk9PJmrWn4iaNbk6sLbuni4m1AF0vGOPApkQEq4ZdiJndeNW1vwysd2TlScEB5IhNjVoN/7vzUsz8sUHDmL5tiTYfcqyD35l3NlJpkEmFX9cS56mq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818564; c=relaxed/simple;
	bh=wLO0SDg8LbE5ewjmIzhxAYd/FbDV4A5e2FGlHVhYGSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOxKzpqYeb8BOME/diwLcsWELQ+eGWrLEFE900Qk4KDCLTNDwhJ3AMUUj6WxuODNONdtU/OXIsyqKUEUSFFTp2TWqdt41+U6JQNGRu+kSkrmRb+90EXDmWWs4F4TVxFu/ACetwVurFwYPsYIg5AsJOsf03erXkx1QBIOTirg4/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrpmS9YM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxzfVnkO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrpmS9YM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxzfVnkO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09AP3292338
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=; b=KrpmS9YMU1iWHKP+
	7y8K2Tzd4971JmNE8pvRL34NzAb9Xy9s5Eaph2D3xU9nUukxOwnmrdeOfO3PPUCK
	FPx+a2XUTOt0MiGCvnTHqQ+Iv1vO5A7F/v9rp+2255NoaCyGGHZ7r2AUI2fejU1o
	fHtkKrwVdUt8knjs4wa6ykkCWn3kmOPZAa7JGLtQClZJ1n6MnAukqeZTnwLWBLtJ
	/bSZ1bZVHV56WlykdZ6PnPSKxe0rb+BoRDO7akVz+Adwb6NaMdBjwsuFURHM5W3g
	wnzJXqgoYSuiaIrbffdFLC7q0joYk7uXaP9WM/Aosc2uqePdC8jHEJqSOb+EoY5L
	Hom40A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j1da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 15:22:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0e2566d30so38473137.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 08:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818561; x=1792423361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=;
        b=RxzfVnkOM0dccjk9oPy5wsEMXr/MPC2kMMND3mpcnXNd5y1Ie1iR20oLPoPBB6hSYd
         DsbPovlpyh612d4cVIv5aFoqIF1pq2PDurTPNB1SJCnhvWDCjI5DWG8TaQJ0S/0Lgf6K
         c5P0E1O78/U8J4m+dlolUK+C5xvVNzuzLmdS6TgZUO0gnhWzDjzX3enp2HA2Kt+qqXFK
         yQm3xss85SO2+ipq/2szpc+jcUEBnoDkSDgsIv+GeDm0lHDNqiQpOaxe/86LJybf97U5
         JX7/QDwf3YnhpZ2qlUNu6Yx8rTVGP9z4Pv5PEHmoj/tsdVs4+BiS9ylSBpIXndmqhqXh
         u9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818561; x=1792423361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4v6rs6hZatKqUXv8cQFe2xzrddKsExWmxLIfwuCePs=;
        b=jR4Ww3wibRih+FkRMNzGBdhrAFW/DyHPm/Icl+sGm/gN4We7cFOLthS5m6xS5YmYgb
         TMcB4NNv6gbggBz/4w4m227ddoEYiY8evCGlGhar2x/D9ES0KkiSX7dO1V2un7PL20H/
         0oJCeMAr7hG92HI3C+IhEtyUqbfx9bxXUIxS5I43LlyAUsvPFiIHJJ09YUgRpBzoRaNI
         KtKmtcEOj5PlI8qvBDbWP1XrvCv6uUKXoYbwX2eerYT5MEEuLYYUXHptKyTBmSZ0j5X2
         WnsU0YnufxnslCT9gI0X6Trmd91OG+7aAnHQ8jW8S3cVWuz5Zg87fzKF2SL48LIJYx7Z
         15xw==
X-Forwarded-Encrypted: i=1; AKwUvBwqJkcY2rbnWB4Ftas9u4UQ1Sp5TQBBiIw15t85kh6PyBxKDDZoKthY0ofpo72dxbPhw9P18THGVqnO@vger.kernel.org
X-Gm-Message-State: AFq9FYLxTBB4nfuz/VbHpyAyvLhVWkmGuAiYqe9oCCeSrcswNtI9GSTs
	swsVtVRD0nKhRJerwk+Y9+DgJEK1Gzpnd2WY0uCd3Hv156SFEEaOLiScQQUWOOMEF5ifhk0QTNM
	l9VHYpiZgPsw3e0wXhGBiD+XutMwQhVH5jQ3fF0XhMmrgqVDIfoPsQDDM+KmZhdZT
X-Gm-Gg: AYBFou24ORjSvKmX7vrENQi9QQ6C/tsZxWHLfbBRXcaxt0Oa/rPHuMI86SeNpNDRM4L
	oDhM1SPNdZyWfEdqeUy+5G2pCs5OlHWnDsOeodzNx1ZqWV4AOboCD7FBJgPK0NlCrVPA/ZmwO8e
	5vDx7qUrVRkolPzpHrcge2zSXdzd5o4Uq02Sl5N1f0ppREuwx+7DfMKWylFgOyWV3sj6g2uLwjs
	GSCkKibKh99qXYR3JJIn0YBqUyqiXGG+pYidU7s9NdaMg3vxVeSTFTj8n7gaaccdVIS/V19Eacn
	yKX72LPw+nvdOWzRiMuKjtowp0+rBn9qVHMs+k+YZiIKdykuON998GHM773Q2TeWMDWomLKtNbg
	vSgBRe2I4umV9yjcEJsYWCg==
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr1995738e0c.1.1791818561199;
        Mon, 12 Oct 2026 08:22:41 -0700 (PDT)
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr1995721e0c.1.1791818560645;
        Mon, 12 Oct 2026 08:22:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9f776sm472745066b.48.2026.10.12.08.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:39 -0700 (PDT)
Message-ID: <f90e9e64-ea08-4264-85fa-79fd72e06e0a@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:38 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/38] arm: dts: qcom: pm8084: Remove superfluous empty
 line
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b04cfc8ded6fb16cf87ef9e339274763b0c8fe8.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzZPU6OtJieDP
 t+aJGH2J7xWii0oAam00Q0ONLDqFY5lerQwYsbcM8lM4yukWet5Yg7u6YMceD+1yJ9TrnK+eaVX
 RQxH2jyjZuyzA7Q1B1uk3bO7jZsKoHzM2c0JLY/n60RWvMyazW8Kwwws6HzrZdWF4R84wO5RJ8a
 YgyaQhozMMrgnmJfa3gPLThG1FDsPtC6fcxVTHhCch4CRqsEN+A/jPbbuOm/cU2n1pQIRNG8wd2
 rSGNszj+JOInyEn3b3wMI5rCP+obCSG0Z8TItc/s4Og77OI2WG8BuxEL0y9oVcDGD3mG8eUI/mw
 lP9IXNtYQ7mgqFfBbOV+javjydHq44jRtw0Z4ymTeQzFtfBtEXHfNoTAgFiP5MdsEql7GSAlpiK
 nhKB09GVgyX7TmE3U6kWWedrpRWuGiEyEk/akeZ/GUBdjJoYVfo2zN6jlPjPCImH51+9lzf2JW4
 cy47WVWl3wWTqLRFcSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXzry3oyWM2YQM
 3weDDQI7O+TmlYX4+/rD3k3sp6bb8OUL5DEYkZvwvGGPwB9ryvPsbV62E0aZpkpVT5JX7YDtkXG
 E99hBAIKgq7o03N7lQ68N/OwGovqVIE=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accfb42 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=YXrApte7LvgGaje0e3AA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: nj1dpM6lMh8boICVJU232wZjoQ2APBUm
X-Proofpoint-GUID: nj1dpM6lMh8boICVJU232wZjoQ2APBUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
