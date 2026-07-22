Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550F03E3D90
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709149; cv=none; b=lD9dKaGAMJ0/h3UQxQkP/mqXnDM8/JqpCHqx2GOxLN3JFRgbqHQ/P1cQ0s+2c3iD+q0AZNQSYuDu8YsZMuLTwetVXYmTVp2N3fx/w30umY/YYej+RFnd0h3dH40+M0oytYi7ncuaimy959P7fZuihUi6tTHL4g1WEUoGeHVZL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709149; c=relaxed/simple;
	bh=MZmp7vUxrjOsUBaR1+c2ZjLz6Q6u/vJumUfWXsRV/2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUSgVl6eFKJgyjzxBRu9yNhFeQ1ymTwC5X5nw/pLDrfhiuqYPNUhfW3K3kbxD3DQQvyMaopTK6xqVZ5VgERsGtf4KD7fS2IXQGsmoOTOZ1f9neTOz82P1LNSNvPnlKqb+SDbGYKB0GsP8g39ID8EjERmimmqEK0HUX9mR+3LNxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKmG7HaY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc4DVJjx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKmG7HaY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc4DVJjx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M623a7984644
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=; b=lKmG7HaYKlg5DjF0
	a42BSbAn/JCfGeSlRVH7w/dtbmsE7uSmqeRl5LIJ+b9vfqNQyrJw/9r1FQWAQlX8
	0XPlqAM8z4rSbAn0QynOBMckjIZo217G44vJW9AaW9cGtquL02v/VehCQzKn5RP3
	Vc47jclOGQLQuYBshmVFIkW4Mz0AibsRT75SWHe61xVvBRdvji1knDjZsem3G+pr
	RFC0hMJhbj1ciYlSgmtUEC9Gv6292YjPVhXhJgwpfwUuxd1RRBXN+A9hKTSmkXw0
	cX/A4ugKxxl+X0ku0le62r3kistTc1fSH0C7bMGBXVx6FXB6aWV4Uy2m8dNVxy4Q
	a9y1Ow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr838m5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:32:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-520a00c7a03so156994051cf.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784709146; x=1785313946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=;
        b=Zc4DVJjx5pskbKCbAgOfY72LGTbcAScVmvMIGpBdhjx7aLMB8dKH1ADldFE2PI26MO
         2r355H9gpB/LodiBVHerrJVJk4Q/g8qZsJG/Ff6SvLRM7cr1iqIgA4xRkB6IXGBm5QTA
         zsoP8+rUh9IxHfP4JFnQHMbZOQwHmrhorwm6Nl3W5MKAiHXnKM+2sW5pbbrVS2XSluYm
         gRv5wIMqIcazYQSLw2ocdgvm7gGT1lHnwRcOXvnF3KjksKcn4zM3OR2hmltgCVhOFrqW
         oNZ0NG20HKnG7tPqkALYMNi/HzABmrA3WDw4GFhrZtaaPdUfBYfn0GyKbQ6J9COZC2Aw
         cF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709146; x=1785313946;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTPTZSlyeSFAPb74Rz4exIX3Dyk4ERmoK8qDTw4/JgI=;
        b=aSanwqyomjFbzMlkoIlLf3s3NW8yvVCF+lQVFPmixf6xsGHjP5MZdw2aqItHIT+4Bh
         QphrjQ6kAebQjLE3CwEFjVYNgSgU9HOjAAwAhFVDJMppEofGQEjkrzSPowdZbItWuZDT
         RANOfQ+6zyd/xUjMR7jD1sBR9XxQsl713f9L5pHHrxUw6JdHpfc9w4xsTGFhCh76u27A
         W0pKCaa4gE0BtqKsujoUrBRt5TFCBNjFsboVpTBHlRaIPxP5F72FO0uP3KaVo3ArRQXF
         Na0lNneYzv5guU0spQexxe6bv5riQSgLNOco/cSER4jSlhFy+UmTyGk8PWjgbQpYezzT
         yKWg==
X-Forwarded-Encrypted: i=1; AHgh+RrWvtkCZrhgvWWh+RKI7d1NLR8bGDJ8PJi76Ic8AtaCFvmHvlpvyAs7ZyEMqW99rRvCvUEx4i4SMmAD@vger.kernel.org
X-Gm-Message-State: AOJu0YxKFbhWqVPWtG61eF2GKcTCmtfTD24w5Di+dA3Ltf33aPHXYeJ9
	fmU+O86yF9vMDtqVpJNfjOcuS1IuT1hQQvkIdTe2OhngGGp5Nnxl8dTkiNGGvPsS1VFPqfqvn8K
	UAxtTNXP2VfysnWRHc2brddScgont3z4yPEfII/PJ4i41fOQYHBICJA1X5s12QM5rYrjU7tyX
X-Gm-Gg: AR+sD116bUDs1KbzplSU1PrJX8+Ju5PZ35lEMfQsHzPaiYRvlTU5clzpJyQxTWZi1gy
	eLQzFQuxehhMIkvkQpXpgWgFSh1e6paXV2lY0D8DD+XJiBt0GB98SecVrnm12akbjCxQ6Duu5zF
	R8DIOPw6yuhhdeVkNuq5ucLLT5jpPimepcNQdUbtCTRo7TcPgbVZC/ElTJ6ZXgmhmH8T+rMBSxT
	3sdcjbnGd5qraISRfifPp0dALr0MDqsGyR7JqKsZ3vYsUq9/tCjfbFAKJPVxYA2TP0uoCCvHb5u
	P+y9UtwEXGG7WgATtKTi4MCuDy1LhF3LPlz3FG0Q+E9akycxDkZgrRFX/oUTrkifX2dfotYlKK2
	43vrKSZTXeo3xG5cuzBZuYZKP2Ws=
X-Received: by 2002:a05:622a:2512:b0:51c:7b11:419f with SMTP id d75a77b69052e-5213f46e75bmr210124851cf.76.1784709146515;
        Wed, 22 Jul 2026 01:32:26 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51c:7b11:419f with SMTP id d75a77b69052e-5213f46e75bmr210124621cf.76.1784709146044;
        Wed, 22 Jul 2026 01:32:26 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5a2sm4310415f8f.7.2026.07.22.01.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:32:24 -0700 (PDT)
Message-ID: <92187e4c-3a54-44bf-8d3e-ef7e23e7c71c@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 09:32:23 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: qcom: remove the ipq806x Storm audio machine
 driver and binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5sBZu6WAnq6m-RX4_haeXg-7n1zxZjQx
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60801b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jkUNJ2-YqXqEMmPuORgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5sBZu6WAnq6m-RX4_haeXg-7n1zxZjQx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX3S/6ZcTZY0Bz
 LhzOdgXDiwtdwf+0UQ8M/SqTpuBic1ZbpIFUXDQcFPGx2fxqI9kzDIHSTj0kA4N+JHIBEY5D0FY
 nB3g2n9xARyR2aH418RYvIthrf7sablZoV2qh6N5EjabjkszxW6HiN2d1pDX6C4MSPo6XRTkO5S
 42LF2hLB0ILR8m68TFQbYDzcsPNOz3tyTe93vaDWjbGKCgWWrXGISWU6G64Pv+cpzdOBmHXrcCl
 YpIwrJtgIgLfScK+w7Y6YZVsQeW8kGJr2qm1Dq+U6QiF6EBuYnqeQrgl/CjLDlRMdMdb5eO4f61
 wQDBskhSUAbcIqgpoUz18BqTSefaXSp/mlnfnd9prEutskTbp5RbNNSLSifC0N1cwT9Q5ic4lLz
 xXkIa1qNcJNdEssZFBziyB4WnoCi5ucElR5CzhOoFmJ91sKyHI7SxpXhgkeWAMY3Dg+pSzqM0sI
 VNpEIgoXtB427p3Rh+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX4AYBR2bv+j4p
 /aRcvXZN8RW0QQ6DgLOAYhMeXAAeHjBJb4jtlgmCbB/F2MvW+uxZQt5bG1LQrIdMsGtVdziCoTF
 UdXq0VavyfJC/DKe8nrLThRJ010CTa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220078



On 7/21/26 7:12 PM, Dmitry Baryshkov wrote:
> The Storm machine driver targets Google's IPQ806x-based Storm reference
> board, wiring a MAX98357A DAC to the LPASS I2S bus. The board has never
> had an upstream device tree, has no active users and has seen no
> functional changes in years. Keeping the driver and its binding around
> only adds maintenance burden for code that nobody exercises.
> 
> Drop the machine driver along with its Kconfig and Makefile entries, and
> remove the now-orphaned google,storm-audio device tree binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       ASoC: qcom: remove ipq806x Storm machine driver
>       dt-bindings: sound: remove google,storm-audio binding


thanks for the cleanup Dmitry.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini

> 
>  Documentation/devicetree/bindings/sound/storm.txt |  23 ----
>  sound/soc/qcom/Kconfig                            |   9 --
>  sound/soc/qcom/Makefile                           |   2 -
>  sound/soc/qcom/storm.c                            | 142 ----------------------
>  4 files changed, 176 deletions(-)
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260721-drop-sound-storm-7226df1bc850
> 
> Best regards,
> --  
> With best wishes
> Dmitry
> 

