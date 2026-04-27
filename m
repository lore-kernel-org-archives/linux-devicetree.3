Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5D3E8663
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314174; cv=none; b=ovQJCK3m2eXxzqmf+dI9Ih1L1iDzxod0AoHx9/zcLMA3LyvNztFkNP5waVZyR0oGltZxDYBVAKVsOfbULZXgxFXJAVATh67DYc9H0KY9chDDN05TnxbobTmi4J2LWd6sTlA22ZqSc5WTAGaiG5GWthrMFYbFzzLWnVTAGIt0/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314174; c=relaxed/simple;
	bh=tw51MsOyz2BGDthyyDgyrXoxxkiUQ3siRaQ/WT+H4yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8krThkeLDRT/s5eazTgUvQa4EDKEpBVHoRmGCq7FSVqR3PpID5EsuhGzKuscMjPEfJ+6imaEJyEO/KfVRs7pLxgJqoHIjqTOedZeopbt+Hy3gHmLXy86ZtT1IDpWW6bBmfHI2lq8v0UASkFp5SLCcltVagxDyQ9S4g0yOmkcR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8SjaOC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AL4EFtdg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8SjaOC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AL4EFtdg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RE9nVF2913944
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JpS1yWQaR7R3cfgZ/X82WKAagfHQOei/La+rB06jiAA=; b=J8SjaOC674MV6T9d
	L0YRVlS9g9EnTQVUWETDg9vZnZEdEp73FX99+6PaBscKm4o/XDCxFONyDm4DCjdj
	GTEyNO+4wPw6SLLIvzh0gHoO/BQHR8yZfv+Cl0TXrSfQmOOfDbOmnsPC1rPpf3Aa
	Z0O4VTOHb29FaPIcnUPhBSTUqjRPJbpXz07D3tlU0+XAzxQZOVd4z4qWauljwqGB
	VfGvdLP4gIePExL14+gAl28rSbW47oGGq0nPT+SFvRloDd5RIcvd5q4O9Qo4b72+
	dr30bnM3QLrTaaT8ArNBpuLGpLbFuaRcgNkUKZJkbbgTvXSnuMFUTTiNfWmG3XE9
	IDf39g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xjtqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 18:22:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7977177675so5385999a12.0
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 11:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314171; x=1777918971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JpS1yWQaR7R3cfgZ/X82WKAagfHQOei/La+rB06jiAA=;
        b=AL4EFtdgL1iRj5IIhvsm993f7cF3TstL9Cp2q2guOul7voleEs80wtcyo5IRI5EytE
         HgdeaUOyw9/f5o9fZAvgXQvwNKb/YX8Bc7k5QgEwk+OvI+K2nEGwwFCtPjTG/Ng0WPeG
         uVu4b/k+nxmG6kFq/ErTrwCWDijaRCLKRvJcG3+STdpCRWQ8GAJdfH1lKyDn66OaVgHr
         bERglixADwwzOfsLA7HzRoQ+oOVdbB7xCOXJzxd5aoYNgsx4iZxQ1oAD4N4NnQi2PYFn
         B2upL+JLudinoqH4XtRzLL07Uu1h0CXggP+2W5580xiOP/DPyfz5VDskK6REpP35LOyV
         KNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314171; x=1777918971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpS1yWQaR7R3cfgZ/X82WKAagfHQOei/La+rB06jiAA=;
        b=i4qwvRGU2RYqP2V/Do40cfCA9FL1xQTKwx0ySC2z0WXzd3Eqv6Mn1NGhwNiYuLqc/A
         ujpZv4hK0Wzmx6UrZqx6xz0b5PuhFCs5kHYnuO2R08EHZOJMjeiKMKwt5ebLKY9/vujz
         EImDw+S4W9TxpBGhsAp7DpwtzranDtzXOJAU6Uy2nKe1/6bwW+hUP+TSz0IPdUhLfa25
         HIyFa2MgcsLie7rITNVEqXNXaRT2cGgM4ppmE0wEmGLT38YWmwT+DsTFzWI/ciAy79d3
         h0gQ2Fcycoaw5yzHaPEWbXOEdnbMdlygEySNEylUYCnWzm2xuuIVDRcngpUKJ3XAL+Ri
         ZOxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jExl1aypfh995rzpkJ9VgYfYgYsrbC6aInunxBsMHpMW7xusNu5INQqt+5OB+JnntnBbmtOfJ9Gqd@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGJ05l048YuiPYj3QeRzB29Hwy/NenX7E5xnNZ9fV7Ptvn6qj
	pxGTymmei7Mz9zinzmLW02SRzdLmz/HE6MVy6CLRvmoLokvBT1CUXWD6r3f7cL9qgBSjnpW53KN
	GGL3RP/3LJnNlfn2jozTmlzCgIoFT6Ylkf9T6wt6UQtxk+Mx8SACqp5Gfcrr3G88l
X-Gm-Gg: AeBDiesc2T9y3flruewZbqH6NWKic1MGz3o++b0JLVjhcGWZowU2XiSCfM1jd0VA4lx
	LNulL6vq6YflVzUzB52eZ3tGf8rAAR5jJNMbZXiYkO4UTY+tHz5kXu2PQZw6nzDmWVkGmiedSDK
	iFJh/9LrjH3Wjgx1xDXnlcFc3BIfJNdS+u7oeGRgbHVyAw8VefxVgJlA0mwz8zSN2X4KgLvUzQ8
	4A6kSZxq06Xp9/7TLgauYFHEq8U/943Sp2jaxe8LuuJxYKzNAFnZann1yOVqkWfX8t7hvahijRe
	tE76mLWsPaWEIzFDkUr3ZsJWZjCbdlbqb8BoQZ4QqMa4QyJrk7NXCvJ4W1Dz8qYttAvDe0anHMe
	rjpsJwDoH17pVoKntwZ5wF67rfes/snoGpK+1EV97sZHC2ya+3vMTqA==
X-Received: by 2002:a05:6a00:800f:b0:82d:24f:2511 with SMTP id d2e1a72fcca58-834dc1a9445mr133719b3a.12.1777314171130;
        Mon, 27 Apr 2026 11:22:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:800f:b0:82d:24f:2511 with SMTP id d2e1a72fcca58-834dc1a9445mr133687b3a.12.1777314170528;
        Mon, 27 Apr 2026 11:22:50 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.232.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf6a1fesm120638b3a.51.2026.04.27.11.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 11:22:50 -0700 (PDT)
Message-ID: <2e727c3c-f3da-4b4d-8f2e-953f0823f142@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:52:44 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable Adreno X1-85 GPU
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260427-hamoa-evt-gpu-v1-1-5434b5be76f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nppkok1cdJta_5AP1ZRfVwWjKsh7j0s3
X-Proofpoint-ORIG-GUID: nppkok1cdJta_5AP1ZRfVwWjKsh7j0s3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NiBTYWx0ZWRfXxUnYOyrNqOBM
 aZArfwV/HgMa/GzAYi6kv1vdgKXy2v6evW8eFTGmepeQE3GealHCZvpavjzkvGzVQOqKpVJKRP4
 rygPzMcnzTfjHboUopXAMUItDG3+di5PL4dTGTZjHa8U2fNK7c952fMe37e8/S52vjlQw616VgU
 cRfomWBzK99ff+cFpARl5atk80YfhTdHo0faAV8rR+xDh0B/zfnhjvYZfDh94Z5fuaiz/RNw+QP
 Hpvc4C+rvDGt8RTZYgi3Csb7Sq6mUKuJ4RSosj2ofT8lU0HkafNUZQxLY2jUO+BWSPYqCm85gdw
 k+a+zffTz0b8b7KEeO6syRQYDnVMsQUE0AYVWFfwhufF90U4bF1TZVVkEhedz2QGw0qbsLD6Mg5
 i9mmmAUoM++XKyXfIZ7AaF4apdWXVRvbH8va0mpbxKAlLYF2fcdmJGvMwZoTNxk6MM+QbKDQ5P8
 QGwKScrRsJKfschfyPg==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efa97c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Okm+ZZIDgIQWz23Sjl1oKQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eBu_aoQerpSAkrlkAZQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270196

On 4/27/2026 11:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for hamoa-iot-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 460f27dcd6f6..b2a2538747f5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -729,6 +729,14 @@ vreg_pmu_pcie_1p8: ldo9 {
>  	};
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
> +};
> +

Ah! Looks like this was a stale patch in my stack. Yijie Yang aleady
enabled GPU nodes in hamoa-iot-som.dtsi.

Please ignore this patch.

-Akhil.

>  &i2c1 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> 
> ---
> base-commit: 6ffbce0fdf09f89d4f970301f6ce6d6d88d9393c
> change-id: 20260427-hamoa-evt-gpu-dea01004ffce
> 
> Best regards,

