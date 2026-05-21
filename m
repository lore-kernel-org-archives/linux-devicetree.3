Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246130675C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353553; cv=none; b=d5nA0Ho3O3lCmIru4j3n8Ly2gXB7cVPLoPV2H0fqLYYat2vgFUA731qAuznm1Lpb0pF1IRupWMqbUcn5sfugjYt8LNKuwHzkHiDHJ/erQ2NTQ3dUyW5Juk6bEpSJZbg+q47+VKDowVy7/ajEEE9CCAjxrvN4kt4VzHswKB7pspQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353553; c=relaxed/simple;
	bh=ha3irtupBmq+r5ifKW6qnliRxMG0AjctZC7hsHH2Qoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QysX8yQaiTOqYGXe9j7ZQ219kLbBQN4Z0it8pJuuLUBpPPiJMC2EfhGRZPUTuT9D07ky6dwele15QIkxEWJd9lb9yx0B+2MfRwXkibQUuIhLz3nrEOElOoILuyMPXFeEVX/KM3W1NPUXki45oFN5/35UbiVfUiKtK5gTcSXpvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kPhiLWMS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnXirLL8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kPhiLWMS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnXirLL8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7PXSX119026
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrEtA8AuXxln3e3Nbl82hLH/2uWUXSrq3eJbCHfTlVs=; b=kPhiLWMSsboB+AeT
	pp+xU/5P7YvW+Jjv8sYPZSMlzbkf8QiD2Guf7BPQYt4g1nS3JqgvAp+ZiR8VOXrH
	/KmGleKdiGqbMc18MQsD6n0Fnqq3ouHA3ZvaoT+VSHk7AbJ0VjR2nlKeYvDwPUmb
	8z5I2NMGtbCR/0ehUF55Cr53TPy6HfGXeFiaa8ASDMBHe0hO7PbGz+MU1wsul9oY
	F2m4KLVOO1o17jF4zU6UQOiPWuOi5rApc730tY+kvaNMnVX+aUYVsgh6g/MSretO
	wX3P8jm5FltKthH/vUauCbZ5XCCliTuY5x8N20ybiSR154RYuIjPh0FPrzYXzTUD
	ewCiOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c3ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:52:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso32019351cf.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353551; x=1779958351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrEtA8AuXxln3e3Nbl82hLH/2uWUXSrq3eJbCHfTlVs=;
        b=XnXirLL8GaPEqeOOwdK/fc5uRm596nRMq4+iv5e1fQ4dU3YVfhVVFjQvTz2qCCnpJl
         RwxL49Lkw5rafm4gkL6x8UiWn8pXYublnx61Dz0UbqxEEepwhRhLTiAx65WjNE38BfZz
         VftuIKF/jNF+aMejhDQ8DQMzXU7aI3DJcrKeUXodjxF45PA0MF+78W2Wc+Ir8nCgVM5w
         /978twlspFXHkXoN8TGECiphnoedzVa8Q85nI+lBG2Gdss0fUQf6tm0Fuc0SW81xT5Qi
         8G/VrwGnMWeceSF38M9kTVymQzGQX+UvCvoDQ7fHqeEsh5z1KYvNZtMoqmR12Ly1Ja1V
         xDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353551; x=1779958351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PrEtA8AuXxln3e3Nbl82hLH/2uWUXSrq3eJbCHfTlVs=;
        b=RCjDReIwQP4DQd1RD3w4BV6t+ibwtIrvl0uaTtgETspiZww3Ra7i3HMDnjelJFaNUt
         fq6Pqx2OFOfbrs7c6yA1jSJ28GHmdASMm6lDWVw2s/vJzsyb8kDh91eMBBESDH+8ZmkF
         Pj5mRoZYCzpoEPfbKUgGO9OQb5XkBSqg2s6+bcF90zPWoCrdKCVSl0ubEU9+/N2JbNYf
         hHzQHCVpfw4LF53fkCuPK4o5KXAol0olo8k0NsS12B5dzDGHWctzXe1i/ZT7JVZIQrfD
         D5WDi24Rzri+ujVoRgj6irwKtWOLfSX+vGjxvsmFMquwmmhigbokEzkoX2UGndnxItU9
         IRMw==
X-Forwarded-Encrypted: i=1; AFNElJ+yN/M/rr/8FPpge1VVD22mnNwmLnV3kTghwSyOyLX5WLGuT+nCsrsY6OUitSYFlob8zeSYseT45ecB@vger.kernel.org
X-Gm-Message-State: AOJu0YyZD6C6+L2WMsrg8uJ7yCIZRIaLIS3JN/qVWl+FZIjNHkqf+p8f
	a5uzATiWAb4+67LnShKOnIMUBe2XhV/XM8tOYAfOEPITZLpwgPC9bivgYhS86HGwNT/sjDxZodl
	d7LFaEB0WxF86eHE4BQng7pk74mu1e/nRNfuJNpuj64WYd8m9wwSoFxuWwRO+ZO/T
X-Gm-Gg: Acq92OEvp+3n4nHwWkRvGA5bezIPknvIwHnBT+BJJTlbjmCzUAsw2BsEwEXukr32TTi
	ITlVRyOwDvWizlVVOPy6eNrxiYF0AblZze3XRD2djATKXX6fwh8nuh7uMF2AgWucwhpn36Dkt6q
	Z3OsW72xFL25DyWXihARHeqqP0oFyDFBBSaaCoUk6sT4JU7usWB+CkB8RjID9kwWYnt5ePU2fzH
	Ig5LDO2PFzTQ5APw449G07dJbPCPbSB/rJ1sITgBLnR39K0nbzW4IYeCMpgQTYxOLGDBI5jOokD
	Dv6koUbDAY/zcOOCkFnKDvxGr4wmFXIeQzvdTfL2uqVxzdnO10vowzTALlN6/8Lyr+mfQX5P6H3
	jy2iJD6EfgfjHOhJNAtF0YkKPexTgcrLku7ywUTPpf+OjUmQJOX5wwfkBezD0lOWWqh6+qkw8CE
	EFQrM=
X-Received: by 2002:ac8:5dd0:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-516c560aa11mr16078541cf.5.1779353550789;
        Thu, 21 May 2026 01:52:30 -0700 (PDT)
X-Received: by 2002:ac8:5dd0:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-516c560aa11mr16078301cf.5.1779353550391;
        Thu, 21 May 2026 01:52:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa02f25sm17540466b.45.2026.05.21.01.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:52:29 -0700 (PDT)
Message-ID: <418efc2a-d7de-4c1d-98e1-634f08bc3a85@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:52:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] arm64: dts: qcom: sc8280xp-arcata: add USB-C
 orientation GPIOs
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
 <20260520-surface-sp9-5g-for-next-v1-4-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-4-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0YcFR7kHoPprJ9XK1xrkiUDQBXF6iDhK
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec7cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX0xJv+cRWVGEY
 3iKmwMOLbD7AyRiRHIcWZnbWfOSOrX9mybshinj54r2sK9zdvQhc9abQQR1hns1ii2rWekerY3g
 KTlvyYbUOzBgxjoFRwbCxnbVa0aOqkisPsIKY7AIVVZdf5yWH8q3ZJ+nTHwJSAX6rnYRaBprABw
 2pAuEgb3K/G6XQPhrJXAUv+cY9v2A38fPqkh8+0MViYWm9wTuJ08SlViboBAIf7hPNBeB2N9/Oo
 CIjdAH/+LbGUTDt7nMGJWuwePMuFVQgJGDguE3cJq7ME7xZ4gzt5ANYYmDReW7272yqJnoFAKIY
 DtmTamvSpoJhVNeV0MtkxcJyLAfoOnO+Og4tKwAzYvzvPdtmqieZETImdNDyGETAq2f5VHmgACO
 aX5gr+PPxPyYvCrdSllvKfr6OIVuUD+Wu/Rzg6n5N7NgiCy1gRYWC6Nryu8vPDkHHA6dYEbzuBi
 qRmJi5lvhTaukt9f2qQ==
X-Proofpoint-GUID: 0YcFR7kHoPprJ9XK1xrkiUDQBXF6iDhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Define the USB-C orientation GPIOs so that the USB-C ports orientation
> is known without having to resort to the alt mode notifications.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

The commit message is slightly misleading - there is no orientation
data otherwise

Konrad
