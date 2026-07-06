Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184363D88E5
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324898; cv=none; b=pwpKTGR9NYka6B88j33DQwneGGN1aCUrF8+O/wjBFd6UR1+/4FSZ16CJjudfpvFFPiC47y+5f+NG/DQI1cIYEd2cIQxZXm+0qmTiDw5FCRrS4xHuv0oiwE+g81/SPqizXEbafY4QaHpfE0UbJwEwGyk87TJTSHkzwW+OMTo6/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324898; c=relaxed/simple;
	bh=xbTYkIXpXUee3gvvOBxk0kUVHW03TTov1eo5uXnvD3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DdctANFMl9kblVMGB66EPtmfel0Gxd5t8+iPyu04TpWmWEDwJH+4j0nzi9v9J7uTr/b2V/+xEK27DInTFkOETDjq3d5GIAbgoj1yM0HtJ0DpsO1mliYqVh1+pyIrZg2qdADDaLg+R6llV+MS8OAotBYei+DeoeGcChTBe9DAMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNJc616W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4YOv6Ea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNJc616W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4YOv6Ea"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641re53624737
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=; b=PNJc616WMWAi/P5h
	KzviJ2QOcmxmWXrNJrOBf186e8ISZSGtk198bVxyTL1x8Ul2sznEyosF6vSU+S4o
	1Iidcvx0nJoQ0rt1im8IZc8p2GU6PoaLmX0Cu6oBI1wjZIHDlvbj9GeTL4QEWcSo
	UdL8TInLCrszGVqnQRAA7vKM0/0QKz0fAIrUjxHcJ5Vk5gRH8FU38XhDAEwh8pUb
	efJLf0/aAi3C8d3e2nd/6vvEk3QoG02CApQOj/ngfc8Oqpwg31zqE+SnHkk2kpCj
	/A7aZ80v+JQV3/90uYV2iFw9EGC9LN2hFw6xV1ivi5vuW5RVfoYOs9owJxpaojO6
	lDdtAA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swa53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:01:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-734f7d8bb37so97604137.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783324888; x=1783929688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=;
        b=h4YOv6EaIJ3yH8J6Bai5P4/Sy441c5iyrUbkFx03ZjIvufVU3Awb55bhJoXkzeitlM
         3zCUIFRoH9sqQy1Ye2xmwfiJNTT6ryIVZOHwa4+CA1mi2ADnhtBsfFb3zsiZPEsyQXY8
         XKf8WCeMaBR6AfL1FVBZZXg6cM+M6PvaSRHTNR/I51SBirAC/a4TvmlK13OMHaG7AYb2
         RDH/sROUtuui+fuoW/X4KuKSuLpp0sOh3Bn9gBPBJJbKmgUs92SqWtw07TYI43lt9RQa
         zHGVkaSgDrokAQcMVc7z80Ii3J80FQ2hglYuek22DTtVBljgAV1uyudqDMFiytNV9aa5
         jytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324888; x=1783929688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=;
        b=d3Ql5YpMR41M5TFmGGB1GCD0JEfXqaW3ZBGlcKGpiimNhiCdyUOMkURS3yxe4lAXaE
         xrpH23B8mPMUAtqE9QqxbUe/8nr3+LHOpuoLCx1Usx4MrjAjGJ5Ghqm4QNsJA67uPd8w
         eSfv54ogKQRGFlVR0RSm5q2IwFaODuNggGEBkHTwLlXe480mcmJBUqBJTXAoA2HO5CB3
         tUq4zJ593Wf3xT1Q6SnrffuWRR/bPVvSJzAHpnQ3zhUny0hPf4Zrcb0ezqGBYWla9H5R
         0Nds9Bn5h2OXO3rkWZHEeDebXEaIRsukscQ2CqzZu4RkfkujjKgapqX+RHAnJjYCnkqI
         rnOg==
X-Forwarded-Encrypted: i=1; AHgh+RpB2T0kKwF/iQUT1UNIyVq+icqQFSfwBj+87G6S/kIeVSi+Vv3ejqetnAMxaEZ3F/o9x0yW4PIFURUe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KuJlc6/4iOPMtacu1FN/9zZaELZxHsLytjVDIsxYmLo/YyLf
	fELTzERyyhsvoPVKkGfK31v8c9V20rvAC3HaM5oLRZFZALe4TQrfjRngOSqmW65Ffl8j+bK6YTS
	+KNcXA8pvHn68QVRE5ykq4TwHFsR6r0ZWGi4AFmaw9eaB+XGBAC6MRiTltQOuCadl
X-Gm-Gg: AfdE7cmF0GFQr20honyN0XyInwOhJVp1RcTKji6zH96Xh5Xi9/lNvTp4w62SLYMLzA2
	/8U3rxueWLrJDoFKOlRa7NbT2/4N593FQ0CQ2oSdhC0s2vZzD6XoHaarPLNsFReR8KekZ4qAUx+
	RPpwdV8LMWiALDIhL5PxENpLwm8d5kvaDX9mhfYj6k1I3xDGj2ll0D4g292Dh1D+Zfcv59WBrMy
	V0uvnenX1myyHfJfanBxxyORVA9mmqf8HLEbU7JtR+KSpJJlYrF5Ij6/IXwSPrsfVksmuRT65W7
	VzXLtkKDM1m4MoxBaxfmuyQr52A3tVGCIbYdFLqlumloTnXWQYY3La4e14eFtgRBpsc7Uk0M3sT
	75epOIBvA5pbfCqKZVClR12IBeLDGyKFOTPs=
X-Received: by 2002:a05:6102:5f02:b0:633:3bf6:977c with SMTP id ada2fe7eead31-741f6b12922mr1165587137.1.1783324887391;
        Mon, 06 Jul 2026 01:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5f02:b0:633:3bf6:977c with SMTP id ada2fe7eead31-741f6b12922mr1165550137.1.1783324886847;
        Mon, 06 Jul 2026 01:01:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d786e7sm3638842a12.16.2026.07.06.01.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:01:25 -0700 (PDT)
Message-ID: <f55c20ab-681e-423f-8d51-9c1def0f13ea@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:01:21 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3OSBTYWx0ZWRfX/0scKZpOjvTB
 GPl6xz4PvfkYDPM0iaKpd5ZAD2IpE2Y3Xs9OpB5JPhihFwKnn7VMLwmU9zX1g7gjD/AT+2PFs8F
 0xEcjikgwWoWjUK2s/dxh5K4IRZtcD0=
X-Proofpoint-ORIG-GUID: KJhr_cbQxHsIYWnqsDm89_EeMwNkt5bz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3OSBTYWx0ZWRfX5ammvNiij7dg
 KuEsmUQxy4QE2rozB6GWqZg3wx+uKbMWMaF3u9bT17QBzD0hY5VuhgUYRqKFEcH9rFRPFfF3qHR
 Gjfk3+pmDvbCMqOc4jFP9hhshMkhedoUzzzPYu/sT5U/6TdIH8l5B4GL2K3JA4dvWoGAms2fFtM
 kX8vvlunmiK+y0QS9OfCOQyvS5GByqJh9qRQSEHyjdjgLeR0f8Rj2TniH3CS9L8npRI2q3Jwa4U
 bdPAYnzesA43KK25lMKZJuwSV/kEQc4jm0bQP2cumNRMM4jLenEVQ9X2naMZqNJTWIaWpzWU0fC
 +j2Q6LUkx4/Ea11HHoiqSdHTvEmkAyjl69vsb8OdOdzG1adC/K9k9g1Bla9m8DjXG1I+qOPxLQf
 2i5i5lQjKN2vs7al3FK6zvOE57jTsKjVYwYGvzp4uZ5VBHZSxHFkScRNIjZqXBYrB7Z3/lcn+wF
 sFNsdzrj3EW3WR6nmZQ==
X-Proofpoint-GUID: KJhr_cbQxHsIYWnqsDm89_EeMwNkt5bz
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b60d9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dZuxl-eQfz5dsBr31XEA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060079

On 7/3/26 10:34 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQM EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 269e11bd44f6..8206dddcfc75 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -50,6 +50,14 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/shikra/a704_zap.mbn";
> +};

Move this to evk.dtsi

Konrad
