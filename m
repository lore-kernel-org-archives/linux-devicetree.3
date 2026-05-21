Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3303335E953
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353598; cv=none; b=uk4IVPQ2FkPOWrfY22oawAPM61AhRKTUDGpwXbJ35+y5q0rR2o4FDYcbsQWqInLjSkCSvclaibw4se8J3I+hwo066KFpwe2s9zF71H7ZZE//L7NtusxIQcbDw5ZrloN3sDO9VZ7c51UX96YrGn9yAp38TyfEX5N9d5Pe7slZG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353598; c=relaxed/simple;
	bh=eGD1n2Ion5p1/DHY8IcJMRs8e/fMsqdh5ittH4YWLhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cljhCSbjYu513aVcKKxCw0O8bSBL7hEJpEbkgqdCRQxOJr9mko1cO96Isc4p2FpMflqmK3SHvkxB6HI7SzudFMzOs9c6yo26yICaiSlM3qK/iZrtHiL0fgdx2YJ1GWk6l5NdahH4guR+4y/rgQCcTEHzScI3lKHb74k99uf/vTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRm4uhJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kn7OzrEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRm4uhJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kn7OzrEx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6PdFJ1798819
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elzPaWmOKLsXoiTCtcan47fSW0zgacEY+5u9ATsGPN0=; b=GRm4uhJC+C0BghoO
	xgoXnCW0+nOegy3A5BJsr/Uo7QveiulOO+hu1TjUf2sym106+1XaKJnpQxNOhjfK
	TRstywF8S4JJkXLrbHpTyebeyftvFsSRd+yAIKMwQHzoXPzq+93wcDr2nESMoSng
	E5Yl3c4WI1xxKEquiCcr1K5P6Q7FQv4BusnTQrBK/4bNicVa+cKt/L6sCy3fuABh
	69KvScARtw5RiCUDd5oxvBdgBsjuB/hm+g+6rn5ERoojPec+3zMRdRIARc6kdD8q
	q/loxq1+N3OCTQyBOE7mfePMn1sPqy9XDqhhFYlRtHDCV5ck1CtzjENsN63bRW3O
	KdwDwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4437-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:53:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91345d517bdso123339885a.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353595; x=1779958395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elzPaWmOKLsXoiTCtcan47fSW0zgacEY+5u9ATsGPN0=;
        b=Kn7OzrExCIu2bqqW/6kXjcc52NlTWoIsKzO0TX5Nm5mh7KxIbU1IMmO8gGP5z23xt/
         02ShlK69K9blWFuxqYEVfqDG8MOZHcyHe0npYe50vH2t0VVFBDoZRI80hQl7/8XThOgU
         waThd/tU49n6X5jxfF2cX5ejnhX/moHQvQs4o/R9uNUwOxe5kNugiaONVum7soNNxfDZ
         oFsps1kEjYu1gpHdvny+iP34aKNaz/Zfun/LEUJYdTF87tZ9flpCJy+HR2xc0QG5rjlk
         kFU49fYwSdo3jYhbbqzW0JhjVQ8MOTWKExeXQ2jg5JSPbswmFKZhCs6d238vA3NNGAqh
         6OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353595; x=1779958395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elzPaWmOKLsXoiTCtcan47fSW0zgacEY+5u9ATsGPN0=;
        b=DvvMs2l1HycnwcRE4LuOV0dSagSVNecuGXiA6sCsOqomV+jEdi/icmDEp6XpEh5YU/
         WUK3NEwYrcLJr4GgGGUrIM0HvYuT/BZEQ1bXeEn8n/hffJ4Ghi6w8TW9fkfC9QEajWVL
         qQRaGN/F0Of59Hi/t34LaKVi8Dc8wKupnSFmk09eOeuEGt0g9wQLj44xSVFw7fT1WPuI
         AJd9msxwgKErrqENKhZMLYNYuatZbEBegxt+ZAsQfdcqoTu1jpf08DZRlROo2hJoR5ik
         LBvM6tOY+anwPG4GdcOsC0l0Ml0Mbe5//lO4oJjLGR+iUJ2N53y9ZPZq1jGlDNxM36x1
         M3YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+L2eOpXIGcqrxcyMHn2e6JpBR7y+Y5ExXti/e0dTVCDhQPQ/VnDDUWzkYU6iddJODw9PNva/5FkefU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz39KJT5qGi5aLN9CIV8flKDDKeDYhV5L5RPKxLb9PdiSBgeFu
	OydcSmDypqgWPUrhBjnL0hE7L6R4dZ8KPLtlPdfPEVdlfJIgm2GvCFkEbOFtrOXJWUOlm3szF2f
	1jZW88mRoEmg3aa1JdK/rsw97o1TTjHEGDyMb+dtYTwGOispIkLkZriWbvABbh9Sj
X-Gm-Gg: Acq92OEEEM0sjG/vTX55ECFT8pvAqfCNntURHzlpqspxmTYd1UGMyD1Ik8NOQ8WtO7r
	kYD7TFkS5L3VlUa3T4gzEV3s5GvI14o6lKfFKqlWgEAxyGFhf4/WOxkxprCEZiPTc4rDrt3Andq
	TZcIEj4vhBFhtjM6NVbag0XC21DH77FXUDlxI1cKdItzdLcmVPCtyYYqg4rR1nQ3EE4nx1GMzcj
	My1+79+bTzpSYH21Wt5HhwyHCGg6Uac8twj9EwoBPH0DxC+ReN3CuBM0WXQx62JnZphT9+Xtgmi
	hiCekllmP8PCqAFG6FvSdUxxaBlpd1ihFbGKgm7jI4mgfcm211GZhS8xfHi/0HVIVkOx8/jRFA9
	oPHGVjNzFwrLCZI5U9ofbjbkSyXbOYQZnzmCsSOkyS3kwXxarwMwh3rOaLUPa2N9M1iDxx9dK/Q
	kZPqw=
X-Received: by 2002:a05:620a:2909:b0:911:e556:c7c5 with SMTP id af79cd13be357-914a2d1a4famr157592785a.8.1779353595216;
        Thu, 21 May 2026 01:53:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2909:b0:911:e556:c7c5 with SMTP id af79cd13be357-914a2d1a4famr157589685a.8.1779353594684;
        Thu, 21 May 2026 01:53:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6882442b03fsm572015a12.12.2026.05.21.01.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:53:13 -0700 (PDT)
Message-ID: <990a0d6b-ef5c-4d7b-ab63-e75c37825397@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:53:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sc8280xp-arcata: Fix top USB-C DP
 alt mode
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
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-5-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX29DOsG6+m6GV
 AatF0wt2JaiiG0juJCAPuLlOpb9yzylrhgXhm8Lz2UiT7k44jcTpblN2D3a55iPOMk80ip10z30
 f7gHSjRHThXy/D1SGGfhL4sPk5dAK+caWZQTmd7/3Q6sXtHd72ZR7TwkReDFTVopSWGG+1qGU+G
 hzk5GYEQVfVPZHVUGJ8h5KQUotHWb7sutjoj1hKSvXap4tan/SLAOX+b5rXFBzEzRsOQ8z5q8XH
 QiKGVY2eHOkbqmpZNbz3MVlhvciCQSx5x11aardZNbX4SmTFTSrCMXc3n2M6mqxnJaIrcoCDNYV
 iieQZPZwyy+dAR/0+A9fEdomTRJGdFdGhwHGKEM8gtU86qz2m39rhVfxYQT0c+ETQj2QPM4cV1x
 0Vo3KEiM3L+zOdxHnGvsiWnBVhqU/5IHqSfZZYI+qtfbSM05tMRBu8uvkJgrzQmDENDi5jCHj8A
 6Fk2iSClLINgpo8UQPA==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec7fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3tLAdUXkJK0rNdSNFTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 6Z426lgmNLT2JF8gLVcGsjGxD1_xpHd0
X-Proofpoint-ORIG-GUID: 6Z426lgmNLT2JF8gLVcGsjGxD1_xpHd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> The top USB-C port (usb0) didn't switch to DP alt mode, as reusing the
> same GPIO 101 as on the SC8280XP CRD or Lenovo ThinkPad X13s was not
> working on the Surface Pro 9 5G.
> 
> Investigation [1] by Jens on the Windows Dev Kit (WDK2023), the other
> sc8280xp-based "blackrock" model from Microsoft, found a reference
> to GPIO 100 in the DSDT in addition to 101. Switching to GPIO 100
> fixed the issue on blackrock, as it does on arcata to enable
> external screen when using the left-side top USB-C port.
> 
> [1] https://lore.kernel.org/all/20250609-blackrock-usb0-mux-v1-1-7903c3b071e4@oldschoolsolutions.biz/
> 
> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Fixes: f6231a2eefd4 ("arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G")

Fixes should go before your sign-off

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
