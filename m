Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64436215E
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353899; cv=none; b=MoBTx/E1mOG9lm1tO42an/l3bP3lidhA9o5yPXVnmnX9W4a3p8+uV33StVhKvqqg1oIUlxpDA4bFNIN5gRcdfIE5gBp/E+lXrClrbmxvooZ/OS5/qvHcgJNuRlUf8+OgN1jExgyFm0IqdtusczQZRzlmFCVT/loqU1N+m1hlcaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353899; c=relaxed/simple;
	bh=lslQASFEUm7f5EbxnavPnTO1MWlZb7ZZGbrNAKvDEck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ooPb2BFOhbgPKraWfdDsiWpFVf9MiCm1gplytEZxNV+rPWZLRY94GwsgTs3EhUHyIb7bbiwqCQ7pdhjfKxB7TkcaDNqpJFZHkdM0Zlo2fYSpsrjEujFtCvlYYnSd5ZiuLlNMq4JXIZqvJWMsWGzPMskMtdonZD7hxIqKczLZ8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsz/q4AN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAxh2SOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsz/q4AN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAxh2SOl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6TsNr2157685
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/2fOEMVVPBZxITj1fKdOBooT5LNiEmv9iLF1eTMvuY=; b=jsz/q4ANigv0XvdY
	qbhjewZxHqEZgr0dqU+bgP33Sj2R0wl8IQJoXiE821UhoR8gS2+b2NRp+WGDvHp1
	R141VBHLn3FOYZPL+n5VLElstgIiPWmT/8Tj6PviF/ffOZBiJU3WqB3gXGjohupZ
	B8sIEEAFRkrRhXeF4rT94iAG2oTZV/197FnNZqSbcTqC3e1+4jvV8xfgR6lfEnyJ
	6MafDfhqBwR/G6xzIy5JQIuGRLEzosFo+bKzQ+XNd6BpVgnlNrHfwhAi5zJSh1IM
	4IZMcQ17UU5JniBdKF3pc7GezNM2h3DC2roqdLjT/7kLoDcaT1rMdLHe+okAncMw
	T5QXuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma42buf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:58:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso32033031cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353896; x=1779958696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/2fOEMVVPBZxITj1fKdOBooT5LNiEmv9iLF1eTMvuY=;
        b=kAxh2SOlMysuCg26/E62mYyBkE67M2IwiES2uOjAwp8gXHsU2mS+zc711AGTIZp4t/
         GEfm+0jsG4DSosGdnzwMwZGyyGlGhJxP916OA4Dcmrlt650LdVpA3ZPlNtVQq+4Zj4Ed
         udfAlKT9Zg8zciO26lvc+0FKhSs9Q++MBHwlATqBkVXGdJXTUqKat/vUGELPxQ9Z6EuX
         9gdYVsDRQqdq2GmR2RysMouRyYULus0aaZ+coaYwzUjsaY8e6rXte0S92Zba4qR3O+sP
         ND1UFQYinmCgU1tp81GPlLJDBmdpscaB5ejyBKps07tbie2lokjtNv+x66d/aS73yuHc
         waAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353896; x=1779958696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/2fOEMVVPBZxITj1fKdOBooT5LNiEmv9iLF1eTMvuY=;
        b=Vyfw2UA2kpgZBlFLUZDdivWtJTAdqlEQLM1bn8w64Kuj3ExotdmSF2xaozeyQ+ah7W
         Q8j5MZZBOiShIEoa5XXxT72Fvu/DuCFLmjgrtf2QsC/8JYTfRGRDKh8WFLtaJAmqRfVp
         y+2Jj6+YI5vUUa3ic9ldEUjG6Zr+jXq9AXMpamterA83IVphoEFVLhX4kwJamVRt4mad
         42DiTNeYuzeAKsqtg2slwbCsT4j9o2D99j6T5Uhu/WtzkA6g2x6FmFCjFV8m2kY59CDO
         YiHuCF4gYNn+XcURYqNdevu44rkMtKqypbzfS3VyU2Z0nhA4yYiW6HN6OSZAifSFRUnN
         W7pA==
X-Forwarded-Encrypted: i=1; AFNElJ+3HL0G0bdkjYGKyy+GLaSfVXBm7oMQn+6GFxjToDBibe6B1iuKCm/cLRIdst0SFpTxWYj53OXQv4+e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1aMymmd1LgLop53CjYnaofzrFh87c2jDi/aKiuSvLxj1ghH55
	JmKagdY82xUVu/QkqGqaesUw3i/XnarObCDJU7ndJv1bSlrDjkv9oQmokh2FGlv4WDxNG+rwb4d
	tDiD32nOM75IlDSkOHpQ/M+UaQdQMcbY9OYi+OrEadA1ZSoXv89hzEM3xOnJoApwE
X-Gm-Gg: Acq92OHsNHfiHtwyny02eOakujP28zBYH072sUe9iDXU6RXKUwimhmhQn0uFmSCAlDI
	6+xNJjXMEn7TmQTwvs6ITK2GLkqfhzbwu9iiN/Ziq81QSNjE2VFeaWR8+rwCHfk8fLp1bJd4XpP
	aOd92DsVpe6vWftmISXERCLEE2RSHDY8796ZCiMpead7q4sng53u+XR14jhJmnPyxAIulf1n7+p
	D+bHk015/o9NX/zLvPATEznSGiIFfvz0DXnHuz8+E1YDBC43YX68GMkdw5Fl36tdpPbkc4SLIQ9
	ok29zpz5i80YqCYlEyN1KYNEXKD0gqc8130bS2PFuHtkiO2p2uBTM+w814WaVNLvRBZv55jFgGg
	cDCuTwNBAmqrryehiBJyVAgeKyBp9xmL+tBpzS1V1rgtvww/hjidtHl3RGujpysKdAIKSNeLm4g
	Liuj/Nmm36oDxxeg==
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17459401cf.1.1779353895819;
        Thu, 21 May 2026 01:58:15 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr17459281cf.1.1779353895437;
        Thu, 21 May 2026 01:58:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6831187ecb7sm8674536a12.29.2026.05.21.01.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:58:14 -0700 (PDT)
Message-ID: <04d53467-a802-4221-87f3-95738136dc21@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:58:09 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sc8280xp-arcata: Drop duplicate
 DMIC supplies
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-11-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-11-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec928 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DTLji_Hh-ueq8nMUeF2cR8IdQeL-W_GU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NyBTYWx0ZWRfXzL+aFljPKFNZ
 UpmxKTQl6KEtcF6NpMIOWAVCjZZhh6p5dOxvmlHDrpNOfiyTxDd1p0bxl+h799JOvnQJASDxHYf
 EEJxwnm00EkaXcxVLRjPXicq5ISkbR5HuA8CsHBnpCllruyDJDCXF8lalhizRqDcnhnypz6Q+Y/
 QXeYvUXS2qFXHvQ49WpQNG9WMZ00dCOktsRtV8Zz/TXVt+qynM4OjGTaKD9Ea7HWgXid6E+Nhak
 D5d7icIMBzhE6P5JBlS7ucOzPlbs3s8vAOqTHaKX0y+lNs6SfUqQzUhJ51xrG2NuR0vmV3zmXcR
 Oy7MDayLjFoDhuO6xCEj0x7d0fIjDO9Rm/UswfTWB3I9VuMpmLEchFgIT+UoLrSCy7IoUMD5GAC
 rD3bsfr3q2gFVysNa4kv8h2jQG6KdiEc9rNOoiltnxWR6TZtq+9px9Yx9TxbEAashcEbYNY4eHv
 nKmz5LcRVnQ75H0Sqtg==
X-Proofpoint-ORIG-GUID: DTLji_Hh-ueq8nMUeF2cR8IdQeL-W_GU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210087

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Align with the reference implementation from the ThinkPad X13s.
> 
> The audio-routing setup specifies two power supplies for each DMIC,
> but only one of them can be active at the same time.
> 
> Drop the redundant routes to the pull-up "VA MIC BIASn" supplies as
> done in commit a2e617f4e698 ("arm64: dts: qcom: sc8280xp-x13s: Drop
> duplicate DMIC supplies").
> 
> There is no functional difference except that we skip briefly switching
> to pull-up mode when shutting down the microphone.
> 
> Cc: Stephan Gerhold <stephan.gerhold@linaro.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
