Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7DC3F7AB0
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104982; cv=none; b=DdDPWmC0trK6JaQ6TAk+6hxVuZUl3DmgXHqTUkxRDb7OoD8QagzzjyO1MsT+CNgKTfyh+q1Jaz8lui9cddax2EoM+oxTTN4513vixj++3RRZMfewI/2Rzpb3hk+4cTnTFNm3j0bDTb3gsv7pj6Ynk1ffMUOS4YvycJDjuuKQqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104982; c=relaxed/simple;
	bh=l5f8SfMk0HODWzWCjI3H1ZlSl+nLiAlJOsvBVqtyL/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlnsLON9oWGEHkunw2LkIwdNkn9Ugl4Pru10TTEr46BeNr/tA2vNqkcR9sG5Yoe5Zcq0zCyy+fs8Sk383ptJ11tOoquoXjK74l1rIsyMbVYBlX7CgjPPcVU6R5uiU9x/fD/8L63I5Y61tfqO7sgBAc8ycsokdIB2VqS5s9IkIpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bs+eh4Ha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxRPWjK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bs+eh4Ha";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxRPWjK2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I9bJ5v3197018
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F0BiEN/sNtTqPDa1PtFNhLOF
	abpHae6776oegoTycxo=; b=Bs+eh4HaSM7xH5fXW9rCZf6q0+iTV8dQSgS84+UC
	i0uxu4mxDnEIHubxq1TA8MxDix54TcgvbA2WLwJvywB1947H6Qw+n+vgbO7goR5B
	R0McpLOscnwucfdk0cGBHD5/TPL0ZkyD0RX40BPoNPNM+9rkI6Yaw0zjBGdjpTxw
	9cJJVIRB3TzpEpQ+DJEWeO8Y8nKWnpy8PmoE1SZYcKaBvRytL08FMHESSdk+5V64
	X0g0hHLn4nh82sRpFmX3NvUyVYbvcj38aWijQg1In7jmF7lIGQmrKgD6euebAxZe
	JFus8vffIJ8pcKEsMkQkMQn4J7pJXtcCz9OgWVUtYf1EOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6x9u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:49:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c82c84be9c3so883688a12.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779104979; x=1779709779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0BiEN/sNtTqPDa1PtFNhLOFabpHae6776oegoTycxo=;
        b=FxRPWjK2db25fwS1eRqhPpy/HPhb8vdYdbR+aAWK1t+xA9dY1/sjaH8fFZdx4O7ZZI
         cfS1zeBNQZwVIp2jFi99pBW1Q1jSK/GO9rB8lk+dUETx9MDk/AWjLza2tOzkCJorxcS2
         vcLxCioJuWlRRJU1uDMCp2Wk0dVEqRHlodFgzRlPkdHFUouy9Mdc5L7pdVGv1FTnwhNm
         dxLbI/I0wR+3P0k8v1lshRKRPOvo/w8Ol7/IFKz70TrMqfJq0XoWDfiYiVOJk1S+I6pw
         yKJfGfKEJPfS+5N0h6u4C4fJZBKTWefyw9OAmiQdE5ggCx3XmmEiqpJ4X9fnBRnNYwnM
         oCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104979; x=1779709779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0BiEN/sNtTqPDa1PtFNhLOFabpHae6776oegoTycxo=;
        b=gFHDK6k5Ox4olz9n5WfJikwpa6hpuUA4ufmoKjsJxoNEUQs3tM1dyAOeCijnoRzxvt
         EbErmxJ7Sa+R1+tQUgsEZrXYIrNlh+ZsG5NuhzCKs21M4i+py3lNA5qlNwuEyTtGhOEa
         6JxddONvmi+d/xvv5/kxMXdn9uzvajYm7rqVECmpLFKSVn/JY/ufQAjPKp5oIGgzaubZ
         M8oiNSGTreXGq0tzfU7nmXdXO8WyUUwf8/juMQwRhuCuNC2M8rIFqvqHK98MQhOUjr+z
         76UhBATxAqDRXMy4RNH57wV74VAmA04LDxHbI3m/2QPSBu3Du9uaf6VPIxkRJDIT1d2o
         Njfg==
X-Forwarded-Encrypted: i=1; AFNElJ9AGF1Ry4RrLEcUU2SQBrOJZ/K1YQ+CNnXZMKd1tDPoX8t9noJdUJBEbJ5ExaqR/XixBBtVWlkGuGZy@vger.kernel.org
X-Gm-Message-State: AOJu0YwWr3XQR2Ba2f7mAEBPnYQT/wrQPev/iFoHqFMoGqJV7GlrRsP/
	iTaF4D5/IfD0u7X/vZ4kDr84EP7zoFAx7uEbqSulYkNET8KwewavFAyzW8BsL/VvH0zjvrNy2w7
	IerLIO7ZrCs8S/NbVIm9OZI0af5HvbvkebLmiRY46MxK2W/IAjxjYlAhszum+p0n7
X-Gm-Gg: Acq92OFtsMWDAkVPaa9TqqWnr9mCcuUT+9LSBBhh4MM3qje5Qpu8jRGWj0j8MFJ/8NK
	BiMLLhDGXCVvQk7Bd+E/CbOA7FkTTTD7H42Smh7fw4P1l7PQuHaC2cM14vYwJQypvLk6KQUrSKw
	bl07QUAJoJ6TO/6AANYuwUKw11UMj7c9AY9VO9f01gEhUDzinY7gxsH0oG+JvQlS78IhbYBHOME
	b2gDov4rDJ4+7XiOQxCWtQ/LzWARh19q7J+YrcaJX163K5AfInkBpLsqhF5pvdMxR+bHpXc/bLF
	2Q38Tpzzfid65umTVnPeYfZC3yYuMe/jWLGQDCxouMx35k0EwMDvo1NWyWGCrAolHIUISpTNlRX
	N3iQ+XNmczlTG98GYsH45b9ZC7Cjc/5f12PNISeMmnQgS3qA3
X-Received: by 2002:a05:6a20:12d3:b0:39b:89e0:2e2a with SMTP id adf61e73a8af0-3b22e6528bamr16398258637.5.1779104979087;
        Mon, 18 May 2026 04:49:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d3:b0:39b:89e0:2e2a with SMTP id adf61e73a8af0-3b22e6528bamr16398219637.5.1779104978556;
        Mon, 18 May 2026 04:49:38 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm13179228a12.11.2026.05.18.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:49:38 -0700 (PDT)
Date: Mon, 18 May 2026 17:19:32 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible
Message-ID: <20260518114932.i5uzdkraf3ividue@hu-mojha-hyd.qualcomm.com>
References: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ODEv6SiZ6mZPGriK8_FGZZP3X9MBGhFr
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0afcd3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yRgZ8GWW88Essw8HruoA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: ODEv6SiZ6mZPGriK8_FGZZP3X9MBGhFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExNCBTYWx0ZWRfX2cgs48s919wB
 PV7JPsWDa8dBTlcv66gPpOLAQNzLelvPcg8cubZz6x26ohkAqdhR9V7SITbM/K+/el07bBu60ZF
 QYEvILJmVR6r/c4h/ERVdFCUDlvDd1xecuZxX0kCnt15RGiuJK0xugyrC4W/OUUQMOlMTX2Jll1
 LcSB0d9vz9IFsrsA1hAsqmNfZIcLH2tAiHArmcphnuSSW3LJKjekxrSxqyevaoJ0SZFghfUXRkc
 S+jCeR837DLGx4mO/Opj66hX3kK9rxylceLBiKUxvRXLThEfuA87/8EyKeNUA/OU0EmSjS7FP1z
 ys0vR3t0DKeSBwu4+yoyTDsBv9ekF5vF7y3ANIUEsNOXz7rf8ArOchnt3/bplfgnMC8qfkdF1zd
 hsp0rFEe5e3NnEsSkdyLgMl1agyK1y16076Uk3WVn2+v0m3Gw1c6+QjPBwpLevCfVIFUa/pkjzJ
 zs+AGw8K1HQr2Avknew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180114

On Mon, Apr 27, 2026 at 11:56:18PM +0530, Mukesh Ojha wrote:
> Document compatible string for the QFPROM on Hawi platform.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 2ab047f2bb69..6117dd1d24d3 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -19,6 +19,7 @@ properties:
>        - enum:
>            - qcom,apq8064-qfprom
>            - qcom,apq8084-qfprom
> +          - qcom,hawi-qfprom
>            - qcom,ipq5018-qfprom
>            - qcom,ipq5332-qfprom
>            - qcom,ipq5424-qfprom
> -- 
> 2.53.0
>
Hi Srini,

If you can pick this up for upcoming merge window.

-- 
-Mukesh Ojha
