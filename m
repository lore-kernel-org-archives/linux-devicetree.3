Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484264;
	b=dUNn9ntuzOZFfO4dwKxgk9KGkBBzS8Fgmm2W0nPh4AWAxRF+kRH588laWCIAbH+F78rJ
	 lMaVvVjbe97JY0Gj2MJD7TRoqWTxaxUXOuLyfDLWnQM7Nqy8MjBBSkXEy/OsTumYS8uOX
	 dtFLuYGE9a76+cCEceN1m7yn39LIoRIkcEJf2d7I+2iWs23ijABwtuvfMkEmROi8LnRSO
	 SwWk5gwUKYzVHfOrVK+LqIscoCs9HyjyC7lK3p7ta8rvrFFp/x0ZcA8EvWyqIj8kMJ4qE
	 wHvmE4Fr93cLJnRNRD1S2taOhUvYP6acx5jgYgrDoMofb57zz5/Xzr+IgHhYvowGMvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
	b=ZvFC8LuC84dbI4AQD4afj3knwYK/97cN7s4in5oDOVnYlLqCTorUJEDxvatiGwlUr4BE
	 Bi9RxYVg4BFHwag3e94bjJtBd3EPdUmFI7SAkiFNjVhgcwWSqxXlqcq0F8eNt3mppj5S8
	 6SD7QUzT6ijKyeRHBgssM7GhPg//K9oJvz5oGTeqlwNsOX0rBMyhfKvmUrefyvJmTqot+
	 5XmZ97+jB/iakASVZpejxK84zk86o02mUmrL3DgBu9QvfzD6jv6qRYdObBrucKZEJSlvi
	 wIGC9yAZi+cPAD/Y/CaRwFfEjMiQS4wjlneyat3pDSPo+rFlZd2FlnmQwlAcL6bC9Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C5606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D88C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OlaWAyPQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fepBsLRR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfKF51953709
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=; b=OlaWAyPQmxzF+Xys
	250SgtYy6aMFRtP5j1LHgvALDWsPYKUVXeW20Qr+su0AhQvDnkFNb+5slp9+HPjV
	aVrwn4BetA5ZLFO0jg8l2leJ6FyKquLHIu3ILvkkmMk7bhENPP5KYcfndOJJQgsm
	Jmbz91+3uGQSGQhNAVUfUWenSrL4aGD5r9NGcYTiUMdudWCGLXuu10VNODdQEYRA
	gmhJ62R6/qj5T8oQgn539euq181GrKrw8rHtu5fxN7iuPM7vg/tVQJLSutLvCTz8
	1VWNuh/HcATHzYugn30N7xGzkcmHG+Oqk2aoIlSVcscFNE/YFHDyDkZud1qeqc8Y
	3dnBhg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx307jk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:51:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08be1c84so63171275ad.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484262; x=1795089062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=fepBsLRRniJHdsT45aPOuXmbekNHk8qsvgvpZevKY5rpsMdw1kISwUlpHBkv84LPFF
         2a8FUMrAVNPF3ggvQu9UfgAfu+ZQb2cA1T3bosK7TiImUip9gQPgYm1l/bCO41VPI0fy
         lBurt/KIkUPyuiaN+syhejGu6h5pFlpZPjVTsFpthQUf97Y+U4Aq4SqpEPUUOJuU3PhV
         S94Nxmn7RCkTEOdXAJK6FB8FbN8wIzUR04aS4JRhafchAFdVE6iyN0enuPCnjJGCbuLo
         fBZd+7yxoQMO7ARzfwBxPJwdfDJgNqkaANzf+vf+o+qGifh/8pNH5jUAzyvfvEvhGEYl
         hm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484262; x=1795089062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJV05ozMgQQR5oMBTD4lVubnc5m+oMLMSDiH05BrgJo=;
        b=D7IwD9pVt7c1zfW/JP2NqtUsqQl2f0osDIjl9ZVD8aMTSmDqEdyZmaWNKKu/J6dxII
         o/YI8DY1ogXeSYtCStriU61PumLd3X5pS+AS2kbNUZ9ArUMKuhFmelulhsqrZHKBd4Nv
         3E/IK6yDaiwcW1JqJdYcupz+DpU7LIX6ucECeKTBSwm1WHYZz7oDrKjTbMdqo1odnmXn
         xIISIJ+nNdjN405Jg+BQOoIQQvh/ZGrCzcmbjVOHMBFrkTO9ZDdPXnUus+hTRfLtHXxA
         zNOXQzIOzOauds+44qBrhYIUEubPY8mnmcO0lLnXMUH9POFPqIEfTv8Z1TYcXEUqEt6Z
         Kl8g==
X-Forwarded-Encrypted: i=1; AL+hErErTZrsrZvLXQfgnjToulq8LYbPDNRP+H2wJ3UE6aSxcJfTa8mCd3SHHtTtnn+hBEEdGa+ujUbNog/D@vger.kernel.org
X-Gm-Message-State: APuU4Z9rDi7N0UqSgYp+pkwEX+WMwwkY0rdwYhX0Fzy9dXONQWcKOJX0
	Ud4zqGgBEGWFIwIUipYBRjiNCyBTtgzfywP3iyXZ2pyfUFdC2M5Hi2FM96zfAU+8WtCjwOUfn82
	ZVwjBosuzahnH3mNY3i0ftSIjTCwSLTjURnSgacV3UJfO77aSE4MgcxFX5V585TPA
X-Gm-Gg: AYBFou2ZE/TdUojGSAR8XE7s7Awl8h7lnOeOxk5CACGb58r58CdvaDbUxThh+yzdQM7
	AsNz+e035mn+6Fk2XZuwEphnjD2Z8QSRQieEuILsYQ1/J7LGAHXqpbv9W0xwxTUNPuSTf8V3dEv
	0QwahKm/U4yAfsRmuNbuqlVsiZacgalR2Noj9koUzrL0JfQVYczYVZXPpVq/iAAM+v6im5nxuOQ
	/6II7Eahef4L9478okbcxbTOEaFIfX4DsoSYen4VfXvUZF9y24UtJWptrY7arP5UGvbmFgMElgh
	Js6AlW5mFxBbyeegM7XmPx30d9d0HqAmnmq8V1mN/TzgDV+zfkhNyuip0elHQCOAI1wsv3eRYo6
	ifYcPiT2Dqs+ir0CY+8vc1s1iR0F7w9/LjiWBMQwIyXzTUVsJ/Py4JvqVu/CRP0yaqytCEnprpH
	906R0OCDE=
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971825ad.43.1794484262467;
        Thu, 12 Nov 2026 03:51:02 -0800 (PST)
X-Received: by 2002:a17:902:ec84:b0:2ed:130f:869d with SMTP id d9443c01a7336-2edd7acd66bmr55971575ad.43.1794484261955;
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Received: from [192.168.0.111] ([124.123.194.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm33309415ad.9.2026.11.12.03.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:51:01 -0800 (PST)
Message-ID: <6b02b6d1-1bed-4304-b11a-bf2bd3e8f852@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:20:55 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 v6 9/9] ASoC: qcom: lpass: Add support for LPASS codec
 v4.0
To: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-9-2cda302237cc@oss.qualcomm.com>
 <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <85fdd5f0-a729-40db-918d-f1367459e4f3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a827 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=H4FFYLkF8j2uoF0yKy44mg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1p-7M3_SpvjJ0s4hP8UA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXxk4Z2gWRNGZc
 I7wG/dz6qk4rV6fskXkcBOpNLCmYILAaPkbtJEpfR28AT5BreT0KX3lOvrXYJxilQl4z5D4EGWl
 DO9oKzL7e8nWFmIrnmP0qlC/3WShFxWBUgqtghU745nmdqSX9KyhDgA/NnAtQ0D0GIZhh5iPqjt
 BPOpue3GPMeCLGAxNx7j7dZR2q+GOsNnaW7UcfpismRPQ2w7/jFg/N3PjenHTRA66IDOtNuQyOo
 kwFHQN6zu9BCbNVdSYhuoPS6a/KfGKBXo/77XrwXhpdsy4wn+t6KbLDiNAj4qgE1A8jSz93BSpq
 uifrxrH0PEmr8h5soqLPRh4J71AfalsDYMKnhk5oXUQsxR/ZAyozFkQi2wXvibwaAnQCvIOvHCy
 1BB2xo8OBtB6fsOe9hGmq4L+gAbhIWjuhKncdjs3DpvBKRUCswODhWsTUmrP2nPjQvlKU2x1RTW
 +e3MaU2L+Mo1P3meBuA==
X-Proofpoint-ORIG-GUID: QoCMmxmKkOaA58coM79YwbS9RBfy_ZhR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX+IM4pSxLdKEP
 Js/UleQmQXasuHUBORnAyV+p+RDSfSI4gNTYWQxYVW+fyU4Cg5STMIxEpODMhR2DG77ERBmcO2c
 vGuwV++XkEOTcYwigpLwQroZytIqea8=
X-Proofpoint-GUID: QoCMmxmKkOaA58coM79YwbS9RBfy_ZhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047


On 11/9/2026 8:32 PM, Srinivas Kandagatla wrote:
>
> On 11/6/26 12:33 PM, Mohammad Rafi Shaik wrote:
>> version = LPASS_CODEC_VERSION_4_1; break; @@ -2175,6 +2178,7 @@ static
>> const struct of_device_id va_macro_dt_match[] = { { .compatible =
>> "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data }, { .compatible =
>> "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data }, { .compatible =
>> "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data }, + { .compatible
>> = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data }, { .compatible =
> Why do you need this change if hawi is compatible with sm8550?

Thanks Srini for the comments. Although Hawi can reuse the SM8550 VA match data, its DT clock interface differs (|lpr| instead of|macro|, plus|heartbeatpulse|).
Hence, Hawi uses a standalone compatible and needs this match entry.

Thanks,
Prasad


>
> --srini
>> "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data }, { .compatible
>> = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data }, {}
>> -- 
