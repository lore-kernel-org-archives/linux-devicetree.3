Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1586284B2F
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269027; cv=none; b=WkldACMNFISAlZWsjaMTgQmDbkcyVY/3iKFo+/Ec4zq4MvPxjQWp3NS2onzOmwoJ/zfGA3goIrqTGEQPBMi5p4JAlnVMEkMn9nP4kMp4YhrHMgtvxJB9aeP2XNMzs/kGGcRbpttuh9sBLHRTGBWyZ5XmCkUHI9MIO8JgQaHydZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269027; c=relaxed/simple;
	bh=9x7lniN5GJAsFMj3P0W9gPl/pKxdQN/5KAvPk77QBL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VsF175gJ+NkMGiQivTIhTraxcCqQUV0GiQt+Pa/rJy8cMQPbs8DTeq0aomYVEDLpN2guhuHqR4C67HP/bR9hxn28tnyfXE/laOdOTPkE9SJgwNJ7RYddWtxGvwMBN/M+QKjBa+bkUhSWiNnjmT8CAPM0hnzGwcU4C1WSHpc6wuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbr/RJJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=es5s9zuA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbr/RJJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="es5s9zuA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJaWt1137412
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 13:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQHYSREK4hwFbTXr21RMHwdL+GeLgmeBuXTfbYEFYps=; b=Pbr/RJJq46Fs4uv8
	6C+/IiYh4GJgR6NVvP2PYk0A7Uq/ZqBwAz44c3DPn7jF9qmrLmupNkOBX4yOQcA9
	cHsSrUFsL4q8s+x7vtqkn0RHoogJ+QtSIY2IEdR2D7+gk3YTGvqUMgJhMP17A/O/
	8nfytJFWC56TBiJCBdjdC4ky4tvKLUirPpVa2eAOzjwmvP3trHOTchO0mBGg4DFJ
	uviKfsICRGHSxHz0wmrSvg5j93ma8TKTAu/lpUbDW6U7bBnSgZp0oZ54qORny9Wx
	sCcJn0ryz/4NyNHxK3Bl5UzmSEotWp0EgYU4wkX8MrHgn0Grmu3Kx7nHnXcNpOwS
	eAnxhg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsj1ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 13:23:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so101704e0c.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269025; x=1788873825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQHYSREK4hwFbTXr21RMHwdL+GeLgmeBuXTfbYEFYps=;
        b=es5s9zuAb9IPW/taakezLbDPEiwNfcoYtw/LJZGzXmxAyNyG80HQbgq41RTW9Cb0WV
         TxtDc40O5gLUMcm21CTODqsCKU9LCBOH0zuwd4D1CLcfVwo9hHZsBj6V0vylbMrlA1gb
         eKJ+5F1zCH7NPYzLWu7cn7T+McjblF7Ghh03ugxBVQqtC5Q6pCuAooNEbSVxPYgBkw2H
         Wqd8+zBlw4ttPCmG9PDFm6QXUTLC0+rpbOhfq+/NvrHzM6esLOlnMklRAFdixVdaZf49
         gy38Z7UKmEDzgo0mn9Bl0Z4e5l19tUU9RpatvjfWl/bfBjrKinI+cpSNuUF2JHvUlbQ+
         d8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269025; x=1788873825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQHYSREK4hwFbTXr21RMHwdL+GeLgmeBuXTfbYEFYps=;
        b=svyTWpLYWg0eA/8H8hRPsvmMbK/bwz+zKe3fJGpSzBWgyeKuKmZYxFKJVJHJH0uRs7
         DMwdJkXj7+AKJz/P/PxYYgc+IpK/VMYZtBaudhQqq5SHFKag2mMOesz9KUr4jCZXpDn3
         1DxIbwpC+cB9lLdsu9yX0w4V43S66/1Ej6PRAgodCXICJXgOQI+iilNyFm9xkw/Mejf2
         hq4kxKrtz84CyQSfRlOVYeup34mQh0nRQAaEPxoCr4itZuyZSC3P3bjOtQtFFyw2OvSx
         4yZ8om9hUh8RLrPXQGItvc7cpjf/sO/DskUNrq/xHCFtRmPvukzblcTblymu1WhO4rKk
         cm4g==
X-Forwarded-Encrypted: i=1; AHgh+Rqp8QCBn9o8ZOvtrrhckMqG4r3y8kn3l4V7wdUjjRZTd1jFSBj6s3AnO4OQhF9ZMvb0m9mRI+Xwy0Ie@vger.kernel.org
X-Gm-Message-State: AFuF++n0z/dET8AuExCEeCIgUoQu1bGZbYlTw7gAjHg/NRrEes9b2fWn
	0raeYKNHrCWiAmu22Iyln7vdYo+dxYnVGUWhpDV4IRBBHHmluYlDqSfj8VlYanUZFkCNG54XBOk
	A67r8P4IuBJoj5Fsw2b7wOseGTsYtlptB/HuRRNjXufSckgVy+s2uoouXBdzLBUnb
X-Gm-Gg: AR+sD12fFx6EtHsUFVo1BwKo2PgQwmOT2fX8SJXKPCfm4jIztbZ3VOY7r+PpuOB/7mo
	N5KlnyAbIx7SnXJdy6CpyuySqv0Fd2WLKOSl3qt4dpHblZAUbhNZlkE1D9VzKh/1Tdixil0G6Fq
	e6RYlVM4ka9GNPvZenjXft3vagAzDNJEJDQX66GUTbU4Jl8Sa8jo1rklFjsN61Dziml+8/9cby5
	mqM6sqX5NYkTsopY3cp9v2O1HSNpjMlLNTDC7t4Lu27JWDqLMfJemeXrsktaAinbn+9t2WOMlS2
	C7FGI1+ldbrXyiohtg4LKyz8KIyKch3CoC8cky9+5DX8lrIZMahxW4GYHGnBojkziwLbLH4H8qv
	t6NizoMlFsXu/BDQBpNfaNg==
X-Received: by 2002:a67:f091:0:b0:789:3f43:6458 with SMTP id ada2fe7eead31-7893f436636mr1692799137.0.1788269024965;
        Tue, 01 Sep 2026 06:23:44 -0700 (PDT)
X-Received: by 2002:a67:f091:0:b0:789:3f43:6458 with SMTP id ada2fe7eead31-7893f436636mr1692794137.0.1788269024570;
        Tue, 01 Sep 2026 06:23:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89ce877sm2884326e87.20.2026.09.01.06.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:43 -0700 (PDT)
Message-ID: <e51660f7-5913-4a1c-b15b-0ab0fd600e61@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: ipq5018: Add clocks required
 for USB3 support
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-10-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-10-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX20o2CS8/YtIY
 4s8m1FGOgI3YyCpm34GQMA/KCXuiIXZNSQ2mJQnSSzjy0lPSD0421gz45JgJKayyBBVr8LVkloC
 Fc1dZ+qsseNZMYMO87YvUWtyLAClQTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX7jSjolMasPgp
 U/SnoOUT/w1DbBkEOpemSbX+XiR5NZlptm2C/3vMi2zWz1hKW9jcwEXdbVdkTFc5hvB5931U9ul
 rUU76kxWh1H/EXjACFSk0I5KdknJYdVhivCWStqA98T1ccQMAr57pFrEkJ+ZtNoseMq7PYI0BAb
 AmcKIS+SdLFpK5H8MQ4i7xmV0ii3dEWs7x8cwgeBblSVqnNbcPHl+VlFXPtgH1ydx0atxd2artG
 p5zBvE/d1MzUln5r6BlfTnGdBEPuaFDwqnZ+6yyEQiuyxfLyujDC6cvE0FnQi0aRTZO63kkv3z1
 43Z9FSPpAju/2mqtycKPks0QayxSMrChEgcFV8NxY4InbcTM07Ys8ohZcSAQpqg+E8oiBrHU7U5
 sULtEQpxlgVVWiWQv/pCS9+Ybqj9wAfgruzLZ6ZpwJQlBjvlWus8P8MuthivBqUwJR4T3fy2Eaz
 KucL0VWCT7eUuY/nb5A==
X-Proofpoint-GUID: SKAd8nq7EgZYdcQUXhfkFIddDPIzZyvL
X-Proofpoint-ORIG-GUID: SKAd8nq7EgZYdcQUXhfkFIddDPIzZyvL
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96d1e2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=6stDa1oDzhWvrrRwHtwA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> These clocks are required for USB3 mode only and are not needed for USB2
> mode.
> 
> In addition, set UTMI clock frequency to ensure it's parented correctly
> and override the clock rate potentially set by the bootloader.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
