Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7141C31C
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604118; cv=none; b=FBM7OuHh9vEVeN1BqMhWY6wtLhi2TytRsxbTG4Swj1CaoZxoEZ5FOKktp0hqSLYUALvxeDBaqZnxshLOUWlKnRujQXY1xQRuae9QAPpFzD4Yyxpyzq/mx/QHsg6cqyWxkTvNWO2tcET9ZUyW491QP8fYyukCiubAvoTJ0BVPR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604118; c=relaxed/simple;
	bh=01Fc/ADSOZDZ1YOUFiGsh2Gt6FB2lvIRgd4lvAvm/Qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnC6in72Wqc1bUqOKaGQ6aOFu2IRqKp/9FWxlNl2r3KL9bQZDsLad3DpRKZroHtv+mn0NIRDusmhWICHBh+bn4DoJxC2NS251Wn0Nk3SkFxF1P6DBNjnGPVi/x0RYqaYct2c4IfAgk1GgdAWZVLe9EWr521vpeyAMd7cPTYiaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nyfo/zpa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSi2yTTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nyfo/zpa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSi2yTTB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G7I1St2832536
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZH9b/PeVYJfBxYJerWUqFojidubZWZ7u1DZcm4xfGc=; b=nyfo/zpa+QHaMpyU
	DpNbxzv/6NZIVuDfDz2ASWwLw1jnjwCvfweaEBtHtGRALNvVCIYHX/D5lbtfqlbw
	1YG9vR3Ixy1cX/1b9y/fxWp/3c8GjOu+brdlW3e6oOQslfve0Nm9RbRGKocJa02e
	PFlgFZpQsRG1XxlZyNfTU5opoyJPYbGFlCpP63SMcBBnhPF7EMuTTx0z+XTJJnaE
	nwpc1ofQczzbdluDkQYVbxqtGBFLj27+jXBYyl2yqCGK/zlDxNPeiD+Ye5DBV3fn
	DKQ9PpymV1XvlYKT9ZsonEBOrBjeRqtX2nIhYW+hku6txEV9llM1Bi7hHtk+M+8O
	0sGL9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ysrn6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:01:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so10708261cf.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781604115; x=1782208915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZH9b/PeVYJfBxYJerWUqFojidubZWZ7u1DZcm4xfGc=;
        b=kSi2yTTB6/Jwa6MfrD+Xp5mIP5u96/nUx4npXBFamLpdEGaYi3dTx5w1aMQDBWT7SF
         WaFb/vgXEhmcGgrHfstIg3ifeH/svGIwpjZJkCKMyqLpWdl+LPQyR9Svkoqxr23GhBzW
         bp2yLRjWpexINlkluXDWJucmbR3OA7hDyuHXy7myfI/yNjJSUVOsRb7ur34NmtIXiIEG
         +NzBHR4nOsWgOFGsUBGM0uWevZCELcrIN+Hl2qOBsK+9htVY6gn+Jy4Wq6EN66T9B2P5
         P/mYpPjCnFJCHxHw5m6Qwv5KOGDojbgvQSLzwXNxshbiRz4O2QPcQzXoZVZU4U6e1dlH
         zvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604115; x=1782208915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZH9b/PeVYJfBxYJerWUqFojidubZWZ7u1DZcm4xfGc=;
        b=DKzw6A3OiZdxDvbwQr4r5fZqOzQDsFH+0Ia2XVc0BB9Mgd4ikDUInRk/l87mkrCtyx
         lrrAkt2iBLLDiw/kuF+nvJqNMoIs/iAlndz5Fp9+vuG0EnH62b0uOjnibzj7dhR5wceV
         0LgRUToxBFwIYYtGbeFCPZzeRd5XuG4ayLFgZZtwYYihJR5tfY0bAmjPI7bvb3905aHe
         HX6J0w2lgZsUg9INjb25Wcx+P5AN5iVYsQN07mYpoMUhHp/B9EUv84u5o3zucC6rmNoK
         0fzz53GI8v9hEKiaWQ9rioBsHLpDaIz8IWcZzjcHRsQdMZeemLkfKt80XEWa/aI6UJx0
         Lbcg==
X-Forwarded-Encrypted: i=1; AFNElJ82dCYmiGnegPabscnZ0BhmQd32nG09VbG/HnmZrOu3hZs8pLEX1Xfmm3itHV03sqvxJuT8Kj/h0OvN@vger.kernel.org
X-Gm-Message-State: AOJu0YxzG6zET6nMmvldbYOlln43XlA9COQgCbHQ4ho+djcqXBRA6qzJ
	cwJdm3xRcrZSqO5KDSpSIjX7LJRrB0pIuqoiMTZbFyGny488RcY9Fo9qJxV3JPZ2rifm7dUDENI
	zshPF8Mp1t2r3v0SQh6/Wxf+lVWLklA7+wJSauLFw995/lOVi2A/0Jl8VBLe4Ejwn
X-Gm-Gg: Acq92OHAsmOzTYfvFb/7wOqCbvDJB1bJrNIg+7UT7nV4HtY1rqPCNUfd42juzIQDXiY
	0+Tujo2JbSqbhRK0z9SOo8otQjW6FQfL2Jj7mpFYqen0ujJ3duacDkdQ5tsQCuiX9A/SZTNEfq8
	bmFSb42VD/RZ3HrbkZzPhXHGWrhPvg7MqgABnjzXadNskBXctLeO/91V1AWJPgnWtnHFZAGKneL
	6uuJ+ymgkBIO/4yQysF/LZTBjatR5LHBKqsBYEOvhdronDqsvk6jBiL/d7UNvE/P06t8da9zUFo
	oxCyzG4ObiiWGZJHrxRKxaMrhVneLK3FHSg5TmbnmPecQwZ7zdmqjP+uxrQc0nZZUrQfGo8FqaJ
	phm0E0FYamMLnm94C6sEvW2TV5VE/sXANyvp7IODrlgFHOw==
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr138711985a.4.1781604115497;
        Tue, 16 Jun 2026 03:01:55 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:91c:9d38:30ac with SMTP id af79cd13be357-91c9d3836a4mr138709385a.4.1781604114924;
        Tue, 16 Jun 2026 03:01:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693791c5d33sm4694035a12.8.2026.06.16.03.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:01:54 -0700 (PDT)
Message-ID: <8b8fe93b-3df4-4dd4-acd6-3e87401071f9@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:01:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Stanislav Zaikin <zstaseg@gmail.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260608143329.252033-1-zstaseg@gmail.com>
 <20260608143329.252033-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608143329.252033-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b-EkgKwLcflyfXoPRUxxmguPybw0kf6J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMCBTYWx0ZWRfX0D1Sll7fRlzZ
 fkhznF6PGNk2Ck+4ifZCxs7czcNilU4DndNQHxJ614XiBqqv8xkPPiqAYoT0E9qUeNiz5uKyiCl
 lp4tQQf1DpwzAb0PGyIrZa1Pa49qirI=
X-Proofpoint-ORIG-GUID: b-EkgKwLcflyfXoPRUxxmguPybw0kf6J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMCBTYWx0ZWRfXwmWV5gXSnDDR
 wM1JttSpL6VVC6LNoVhQVZwALRYGLYfL98s6vJIrzPGhM+L5k2t3nhKG3hLjqqjC8d0eRNoXsoS
 XqDJ7DogEiWgAfXXXZNt0tuHTp1cf0mEW7JcmHLMZwo9T30v4UaJOwKs4hHU9inPACI4jne1P6j
 2j5I2YNXwCGnmPZ0GSCh2BkFz5QnvLcvo0ufnyoghHHv5A2hEFafVzowUrFIjxKpakZHsgkoL7C
 rk6fr1Psqf94tSf8/+l001TYLYImznjEUcCyxy2XNkrGmzEUA0yzFE72dFfhJmZ+iBncmvZNLKM
 ouDkn2q+u4w9p/gLNbN5K77v9dKMfZhtrFV2bNRLbTi015f0SSfYifpvkxVPGDfQyp0J4wQoiLo
 elN0DyKGbtt3GBTbNRXmNQe/dFnqSZDt27Gz1qmCLBIevV0bKjbqraRJOoy6heG/xaQIie2ZGWd
 tXICzDjizVFKI53xY5w==
X-Authority-Analysis: v=2.4 cv=JJcLdcKb c=1 sm=1 tr=0 ts=6a311f14 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=yr-2ec9jEi1U7REnfNwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160100

On 6/8/26 4:33 PM, Stanislav Zaikin wrote:
> Xiaomi 12 Lite 5G is a handset released in 2022
> 
> This commit has the following features working:
> - Display (with simple fb)
> - Touchscreen
> - UFS
> - Power and volume buttons
> - Pinctrl
> - RPM Regulators
> - Remoteprocs - wifi, bluetooth
> - USB (Device Mode)
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

[...]

> +&ipa {
> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
> +
> +	status = "okay";
> +};

From make dtbs_check:

qcom/sm7325-xiaomi-taoyao.dtb: ipa@1e40000 (qcom,sc7280-ipa): 'memory-region' is a required property

Please fix that (or disable IPA)

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
