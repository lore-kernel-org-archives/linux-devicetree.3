Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589469;
	b=vjg20X7YbmxJoT/CBPkrw8ZEbcbj9jKQhHhCLeb21cZ5ObPNU/jBVDNKxWDD6cufafqo
	 ZMegozi1mgtAAHR63dCc0iNcv1yoXiF5sK0/XAnkv990fKFZkLm1VZTCqCw82wjaMuCFs
	 kcU5R9zNyuUKgBTtFgznd+mloxCZv9jZXiOJxelmJj2UwtKLGzQQQV47ZOoHOHIUwGGFH
	 pZ4LD4EIqVTvsG+MXwJNvVRBujQtlJbQzZkM2Wolpub63c7VPg+tdY9RO5R77g0CDcoC7
	 Zwl4ObR2vDXKFKk9Oy0E2TX1SKPlTAdHvQUehvomgthhLQF22FOdOh2gjh0fUZjTxYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
	b=5bNPxcjNaYtybxQsbhHemf456QW8YvV+xHQe0OaQNLz6DCzE0xNQkIKyEaqq7Ke8MayJ
	 +79C6yUJbI7JWIZTyMK7QUjEW7wBhz0es5Rv0Uoh8ZNxSfot8p6wcSIMURjNRYuC21/hY
	 +RPVHOx8kncOjm2VrMXt+AiEBmkbR1h6GtAdXjxDxKMkrBnvt7jes/3N+tqTVViBcEITY
	 5YezHFe3BXvr+PLOsQ/JXatYydd1OmNbVZXSp1pRPLeQDKR/xf1tDm9tNvtgSwmEJKdqj
	 IiIbEzxZbt/VpfZbyiztC6ZqRTV2RIHeTR7yh7ewVGgw0KFNMH7GZeZfcAGXEkt+S1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pQqs44tg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjtGRqGU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67053606A322
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67053606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pQqs44tg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjtGRqGU
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDArxu683609
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=; b=pQqs44tgcz5pZmRR
	J+PL09h8iGzeIVc2QZKPEASJcxYzDdqWsxf9GvGSnjnYSgH2q75tEVbg6WfA/EkK
	IypXPa01tbkYz/yJYAlPQcz49lACIoIe4oRQqEc1xnyVuRVwqUeA5h3shGHaA43D
	TCb5SR1SRPnd2EAMZG2Hwwacp8fxU/UwM1BOhd2pVh79/ZhNTTadvJEjzXiA3Kjh
	fm7UwyHgeVe0k8G4Crn/yCeH/zseGrSKV1o6CHbvZU1ZsXfbiO0jO8nZPe2OrFwy
	Hse6HLN6cdjp+qRS8hc2yc4e8GKaX7s0B1vg+o4DUbMoCWug/w2wsia9Oo8Qi2S0
	moJUJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r36s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:30:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so23192985a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792589448; x=1793194248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
        b=CjtGRqGU9Qrx5hv/bxLXcKS6mzo3O/w9SHjMBHpu1W8FOCWIbLaW1tmTAh3lAXR7/C
         /r83fi2i3T20Tw9IUwakleR6eE+UNkaohJmhHY56gQDwqV2vRLnARsDs082+0h18zLhW
         FplkvlNhP5k2gkDnfkutERgsWizEBx5eQbLKHPG2s6MtqSE4ZEOVv9h54Y7l60If/IQ6
         sw9Cb+CGfsUG1slkYpFr0Xi7FjSmUwq3A8bWYPi4jCpWBqeFuR87gnEtGrkTD6TcdjwU
         Jqm8QNv4JrxPSR+VpX9sgwzAHmzJTot21LJMVpZVGmox0/r4uXeq4jbaleo32OeBSFWA
         9fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589448; x=1793194248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
        b=C7N3JTP+G23XwP+goo7P+SxzOYXQq+VVclIT9QBVyx9zu5zXRW7BxguWMoI2rMI+IZ
         G8OBn0q0adookF8I7NML9vy/WdjehAAwCft18MBJz0FNhwzvgN8laKGWkSp2TE6CQIpD
         0T9qa9sSKb4XjFuyUKdCYZObvOWaOvUO0gc5TCMTdi3ZCf8h4MG2lr2qvOD4PyEFTntX
         ccpF9LMeLPPiy0ccfgExuZSyLrVsX2a0o20Hlcp/TdgWXXtIkad92iIffnp0wBsuRqUu
         NvoEbTvbVPQBF6L8OA1XOsKQ+GFC1rCD9uVTnT2ZJu7uzwoFrGKMwT6Ka8FTCuRHyihM
         5yrA==
X-Forwarded-Encrypted: i=1; AKwUvBwETdJndGjcctw2Ok8yv5ToJGqYPQjGPW6uEfaDf3qN9cNPc+DduBadPyczk6yb58hXefIoCiLmb0vq@vger.kernel.org
X-Gm-Message-State: AFq9FYJnUnjF7oz9ZoN/B3/wSI6aCGDOZtz9qhbo2/eKdoyZ4OYBH/h3
	h+JvsqlQVpwcNc8I+Ty5Ebi7zLNjFg+lxShcNqyySrayVQxHMMwzegPgTVAdV0HrQ3RoWSX6C/E
	ZBeY66XFFRHMz1GKeFXpzUQOFlHAvkVpu7JX9qjlphdCapRbq36T4ugW6kG+UFBtG
X-Gm-Gg: AYBFou2wjMjaf9a4gb3L1VlQpTbwZVOku9LCZqi+QT2L5oqg9yOxjXAHuDZWfeQekJf
	C4OQ4JKX7iiiIQX8fquOW8Li2sD8V/sma/NXY2Cb6eyd3SlZ9KmGl0GFtPXgH65JC21xwXlGBNj
	AJ1gRa8QMf444wmRiCBgQTkDFgETXtgBd/fE8PDiK8veZ30NUZNT9IyL71QlHDEX9s5cbYDTj7X
	gCuCz7cx4InZ1Pe53fq7Cjv6TgTPp7fH5gQMs0iz05Hf2WQnv6aKBBtSV10p6Ml/1XaqyTPjP3a
	V/uW3+Lz0sX93WgK8jaLBYX3z09xTnefGIwXpaGJF/48poDjaIkFdOIWVSzTLOmENK3JG1QSdrO
	0u1Aj/5qjX9ELxZ13Xl7x4A==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr478787285a.0.1792589447776;
        Wed, 21 Oct 2026 06:30:47 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr478776485a.0.1792589447109;
        Wed, 21 Oct 2026 06:30:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1224fafsm523382e87.63.2026.10.21.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:30:46 -0700 (PDT)
Message-ID: <64a9cda7-6a0a-467d-981a-46ad1f4345f2@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:30:42 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: maili: Add base MTP board
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-5-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-5-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8be88 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=E_2GH4zMFfp-Yox88fsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sNG6YzDAddmUgO58ZfxjUcAupZOHIYVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfX+qIxyJOZ8JA8
 TrfwCKbjYs0XzOks7u8W+8rcSBrkQn+gXIzH179WeGRTsiHUps1b0+f1uCYdeeAenAeKHovSR3T
 uTCWYCWitO51NdrpVWNQMfW5H+u68ZU7UhpsJ/Q2RZPcaeVnaofLaTKEanx+JLOhaFxWpSHjJly
 Ct2yKHUt5fM0ox+evvD7fY6iAH/wG3gXhqL8ns3XEqreV6v1YycwPHsHIi2HqF6ufPm3V8FhO/+
 DuxW9sTiRcXC9BZunnuNK5gbv70ur9M5OncIb7QDeu54oSAqa6agfdpse/tQgX+WQsRMsGMfZgt
 eSSMQu5DXaGJv2zTiyAiWRkbYpoTPuhQcVHEaHr33mVFPX9dEWi+gE7sD07g2l0+mHexNKHhpXy
 +jmHN/VF7Q3mw2Dz7d4cYy27CKCFJPQa2lS7DxTNs/mklenmASsfUY4VGzAg1HdNRjYfcX3sVc5
 zjUmbN9QCWkEkNAxjJA==
X-Proofpoint-GUID: sNG6YzDAddmUgO58ZfxjUcAupZOHIYVS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MyBTYWx0ZWRfXxqi75x8zQ+21
 Q+c082uWNTpUa0BD+UO6i44Ro2YGnZlNzjkkP9FrzzvWhdEMj9Fwns2piGCSR3TssKwmvR2u0t4
 vHJ4qUVaDQ3t/3XtQEVRzEA6iWx5Ngc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210053

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Maili MTP board which enables booting
> to shell with UART console and features including UFS, remoteprocs, USB,
> PCIe, SD Card, PMICs and devices for keys and LEDs.
> 
> Written with help from Fenglin Wu (added RPMhPD nodes and PMICs),
> Nitin Rawat (Added UFS and SD Card), Krishna Kurapati PSSNV(added USB)
> and Vivek Pernamitta(added PCIe).
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
