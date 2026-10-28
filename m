Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192737;
	b=173cMlt6pzLl2vdcUaIPSloJOTSmNSP3K04fgknPWXLrlz6Dv7IWgC3l1KhkBvergM2g
	 ufrg0HYINM81Vg7gJc2SP3cgaOAELFFhO++UnYC07M+jXLSTfButPcnnS1DEdicD3bibE
	 qA1X71NG7cSacdQDjuILmrVR3Z0Hvs88v2BkxFUabndjO9aoBnt5utENSbU0ArX+OgvRP
	 BdSpRY5hkQgSTag6ImvcL+0m/s3mu1o2ABhJ8dJuQYTKdxQ/8Ts1c4nnMJVIyRToEGshC
	 AQW1OhbCZBsdF+w/UFkr750ZGKOR4/qxR3LjMBdp4TLHBKZmdrdTM+A9KRyqJXm9Hiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
	b=gkf5++P0gEZsdiWVQRdCFlFtQqhs7dTnSH5d9NPUCDk7qOEAAetM32/JTta+ni6FEKec
	 Lq8B6lPCfUN0jAaWXyLAsb+xHwFGte0+K8U0NitvhCwPJNPsXhGmQjTJ0oKuS0mSiXLCO
	 BGXhYYEbNrUgaUFgaa4vwNFjH14x24dEdzhzwbN7PoZeJ7ThU21ICVZZkO5uhlIKbscOM
	 p5yQwBj1Qj1rY+v4NF0n6nB5zNh45NRO+llzFlMTjU9SaeGFHodx+OLA1X+2uxA0i759V
	 csZ7GDpLOyqI8UwhfTqjIITUXeuv0lV2HzsK5N3awIURbzJONt3nz2U4dpbS112tVsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B7C606A31F
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B7C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o2nizMZ5;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WL0Dz8Wc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4Gq4154783
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=; b=o2nizMZ5eU4sccxm
	69Zzcq77ESHaWV2GKCTtroabump9QnRbs4TD3zNMeRCvTmiVPPbZMeVmgzyvHOxS
	rLJ16Yq1gxlEs9H2t/7W8WmtsrC1EzYPH1IQJvJce90i+b0XvBFYELU0yZW61lSA
	qUNWoQUjeAC1q6HQtAsgS3JAdQgEKuMLa+BaKYoplaNAErH0Doh7UdV0Ks9471UL
	GWmd8MF0mc0vauz9s/M6JCBqr30zyFXrO5bCD4YHmtGsX4kb8fE8EiYs9TnXQ2i7
	V4XjQoFYhRglHLZEmYBkitbfYSdpqTPoXTJ0OM2bxTLpGPd5QAREzbct9XYC8+DX
	58+GVQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0wh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:05:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ead2112f11so43598e0c.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192734; x=1793797534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=WL0Dz8WcjyVRcZD75T58BfWqCOvMQ31JdAJO36QGp6utB8pzTtsXhXqIU2F+7wUoii
         CT2Y6Hi9YAe4jVfASOWxOG43xWlX2FJYD3ijEVD6Q6KeszLsxLfmLT/yR1jCvjjtgagK
         65o7xk6Wy8/gdHj2FBVrN+FSHjnksXYudNECm3sR3B5pxXdDbknSh0plYXgnYpI6+h8S
         F3+MjobShvwvUBVOMYLVGSmIM0UguwbEspPpAuJINxARERt6Dy5KuYuohGGrVtzMAIOE
         HUQYQkj8abeczFpOLgcZhPLbrdfre7/ME5Cp8ZUvbhd6wG4SNQKIRsKzkhUm10OOL3NV
         3dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192734; x=1793797534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqO/Jzm+FddunCZO8r9oEWKbz1HwGRnAs133LwKnia4=;
        b=O5Mz2p5ow4zVPfxZemIx5X3GBQLRUoW4273e0qkocFx/ci7yaTCYVfBHE/5YD9mzLA
         qzDsdD/2Y7Oy3JYBbUtKf4SGcIWmQB/ODaN7F821hcSkeVJ7mAgB5UBtHEVpcPq+RTKn
         MLQam6p2B69LLqQ3Lg3/IQbwQF2VLixykMb2wQNvL8X25HVtH+lzHaidzfN9chUuyh5+
         QVKfVn5zGAnylelPhhTQQZ0YPSeobtRaNqVD6DNN0bAksGOCdyCUwPymrYI5S+xKpptF
         j2WVJ/ahk/PhgZ2/41GUYBOyiiCw5G7FjgNtLRD0Nk/PdOyizr2WCUzIhNnO/EJoOhWS
         pl2w==
X-Forwarded-Encrypted: i=1; AKwUvBz909aiYkaHOOjkhgxqWi5uKm8vsbnU72bh1QIO3N5j5EXvYrVdZV09WYzoc0MITY6xMNH+6nu6lIhO@vger.kernel.org
X-Gm-Message-State: AFq9FYIa79pdFUdbhW/IWSuQBiC8qBz9io1anCz01Oi+RqW+qANnzNG6
	pWXVZQLJxb/2MmPV69r3uTtJbnfvmvMbXvJfl4G+TSM2/uZnzcXShIfIrQ+7pNv0Wg0/4zW6zis
	rCZtzRbBX9mXS+rl3Bqrx0CpNWkx6kxt+b7Lri341f4k5bP+YMGgqBm/a7olq+jcE
X-Gm-Gg: AYBFou1Fp+o+owW97qHwjaF3dM80SiZka35o5CFw81Jr+Y+AfaHsIXKA9ZV22MAl/kJ
	MlFK2u5x+iAu2tYIoUullmQfE72mOXzEftQreznDm0j5hOUQvFyicgtWYtIoT2ddAMudTICf8yy
	OnkJErXpO9GLbIgGVNOI0bPbVpoVIfkbEX7GQ4DSflhS+xejz0FVml3DXMHhXn7w22XjB0zujbv
	3vv0m/ILGEloNaG7gWYIZsySsQCVaFkDzxZArvTHjfY7gOpa1nddWSJ83owk8X1UY++sAEtGD5h
	wiYTin+obdvGQPq4p7cA1mA5r6m18QQzTEt6f+3PSXR92JxNaNjR3ttxZJXcqeCdt63LcOe0Jnp
	SpFEs8IcLyvktSTIH5zVrvrrBaxzV7LBicJFzNke3urNvqpWlAwVYDmWMF5akKiKMQDUG5Vo=
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814509e0c.1.1793192734182;
        Wed, 28 Oct 2026 06:05:34 -0700 (PDT)
X-Received: by 2002:a05:6122:698:b0:5ea:cc1d:173e with SMTP id 71dfb90a1353d-5ec4caa5fd2mr814465e0c.1.1793192733616;
        Wed, 28 Oct 2026 06:05:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm596617966b.8.2026.10.28.06.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:05:32 -0700 (PDT)
Message-ID: <8156127f-a20f-4152-8b3c-cada25a21dd7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:05:29 +0100
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
Subject: Re: [PATCH v3 4/4] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-4-5d98b2c6c263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gsNv1IxSPlFwPWpt_2l--TUvHo4pS2f6
X-Proofpoint-ORIG-GUID: gsNv1IxSPlFwPWpt_2l--TUvHo4pS2f6
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f31e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zpnWK4eklKcjKML8EKEA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX8Nhevkwt1/Ew
 h8iSUNH2mg3E08KdO6E+qxbraFAONW2WBdGVbWTaxNs2oPdXRcs7kNikCMS0wKeNvtGPWoTa+TB
 uD9lrbUrJvA7xiW9RnDBwruzjafhaflLvpdXC20j1PejsruTRPF+K5qREinUhvs3XEp4G9I/zs4
 jUmiDJfmU5ZlyR7oAdVECIrg4O8iV5P9fkjxI+EO0yt9PeoOIR1TleGv6FS2Mwceq/5+Qw1ddqL
 86pAzTLnx350snsaw4/qT3Z9tdPwE0PaOe8bX5OY/0mCJf5sSk+O/CNO1iV1i0KHPH3cNFFOlId
 HfbKZJ5cIOOw8uUvrbEjFE45sGuoOewgYb/NmZhXHJ0IU6eSpPfPLS/XWMyqeC6oF4y5YXbOCB/
 GRJyDZNmj2hZ+b76wCa0GJX4Gs/Mp6KpVRBxZ0xQ9t95kMA2fg7xerv59kzIoW6uUJ7MKME28In
 OrvljW9r5EgJIWhNp9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfXyJ4uXltu7jJk
 aVBCJ0n48OTYK6GC93tqpWj66xbt/1YkeZxxXpcRschc+etlas3YYfCOHpfXdNJF3GYcOtbbHLB
 d/W4f/U7vam2C88D8ykIejEeDO6qCT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280052

On 10/27/26 7:08 PM, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
