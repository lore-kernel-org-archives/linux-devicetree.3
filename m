Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454733;
	b=cd3nUJkl+Z0vuagZyUkuv+UevJWn8FDgWUnUrIPPx3s7kochHY3xor0aiHjWTJYxNyeR
	 zJ7dxRBFMHMcRUJJqM2KhZEODVfUtuMX5zJs2Z2EPz6lqhWfjuxVJDHG+f7dYQ0L9bjSw
	 hjSYQp++nY3IffFblaxR9MJtrZgsYdQqfw6j7OYiaY8in3RNugPOFwhmBvsQJ1DVDTqql
	 Z3ETQe0e5+mmnAAT31bFNTmlMh7CySJFJXoKoCIIf53SqUZPUfGIoUJO8KyF3gg+auem2
	 zy7CM+Q6xzERl8fwQVudq6gNyFyJUXCmbyR1jMEnnQpgEcj/+/06FWaVT7K2zKcFrUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454733;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
	b=CInFyL85rqd1A1YT7CcoU8ydSJzKQ8fa9S4kfTAjfUN/AEvG2/czE0AEtBclCAZovS2x
	 6xGAZEoMdwhE/blmVA6Q4kuZ8illVW029rNcO1m0jT3462BJQ+/2ThEyI/InoQegyAzaz
	 hKRsesZezj7ph2T1DZIODl1DO+xGf4owTGmp1VoefGirfaBhYXvdXDWEjyNvqidiZtO1d
	 dt4iLo7vlAWu6k9oa8JJvHwdCSM9C4sCrXrfh4VUDiLX86rcPd74I69077YCSSQKLiaK8
	 Tx2Y13GFiwp09HO0gRSAYwNjPX43iA6vBZoZ2I7Ix3Fo88oPu5iMIny/KqiuCGfdOCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ES/btqeW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF202606A32E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF202606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ES/btqeW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IRw1kSt7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxqE2377199
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=; b=ES/btqeWk9Ry0Y4v
	sPoVsd4C6na0WcfUDwzbpyMtnHs5bhkYPybKr0Ecn5CNPpAnGtJ2KRoTSefgpWvb
	WhW4cG3J1iecCApouM0FOxcwsEPDtC/Dz+JZXNw+eJ+pABSjSMhYtz59XtGFdTeD
	d0fR+0wd+MQXKA//TVuDVjOYxcoUdchjCyvRjRsu/RcjF2KOoLQgHzN/jOWEUilb
	cY4R496mMi+8iksuU59eHyMhnG4+gSRDuR2YiBV6/Pwqa9Kqzw2Fp8Cfgk//Kqx8
	UH5imSinHWeiwAFLJ2drOD3iW/aTwHN3iVnrpD8swI+eDjvTGggOp7mbUBRauXCC
	Vue6Iw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ushbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:25:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99c3ff9015aso40107241.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454731; x=1796059531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=IRw1kSt73pjEXYwJdclzKQgGlvG7nnxBJ/HytOijac9G7jNTPElk53F3x9kII9r1Yn
         CO1pum/eIjjS4OM+EZL2yMK5oXbpn/4qlTZcXRRc0Yl+oxI0h9qHAC5jdlUficg9L+qp
         LPyPVTBqvLJHbTt6VsipJ7gVzRfzq7deJC9QNLCfoC1HZHGBn46a4FwYH58yCrBFsn8Q
         9Zhm/+KWB1fy9sZTGLtklj/ImEvRizE5gMORGcpkuPZJRHNu4AgKNHaAJAauO4MO34WM
         WoyDW7p8Y3U3tMEmDrf4nemtv99eNd5Ban3wGfyGPenvxjjcRlVHHMS6lbB2WpON+9i2
         73Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454731; x=1796059531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfhg2+/rNBhkH2W0arnD3tR/lai12P2aVjqQX7vl+Hc=;
        b=QvZI/0n9HVeZWVzuH9DuOWUdy8nHWU/YVNtaUl+zh3PhbfZm1wuRBnT2xDcohHI6B3
         GHIgx2dzynBRLGMHwUPkzZH+lvp34xTwOQ17+7hYPWyiGiPjRoVrKBZmzWNEIdilKHjt
         z01svS1PrS8UXuQAvhbGlLXhyawUfsVWUM8rVQCb7CRHG81p9FtX9/M/lC7T2NPlR9PB
         fDDocscHaEodPnJZ4K23XJTuYCqlSVA+e2HZM8IlxREQtoYVnnRLOCofK/uoKRv9abzC
         49lN5f9WeRz6B2+97RcZbhs5BbibEeoAG+hFOeRbxJQRU85dpXHUipLknKvlhA9PTdle
         KOJQ==
X-Forwarded-Encrypted: i=1; AL+hErEY59TzeyKEdXyiHqE++nCqo5uGS3Ti5nNFdfktl8i5VEmpi8zbB8zPFkCciIUhpV/cpK2Ul5ZiLpBb@vger.kernel.org
X-Gm-Message-State: APuU4Z86zC8amAclu++BJHi16q4sXDAoRy95zQDU4GpQE0Zt0L1KuI7/
	RTp7n5rK2m2oCPsUk1LKJAreeE/KtSnMYSZshv8Cn7R/lfvfwlv1M6R2CzWrSuesahQuhoPA1mm
	swXWfiiEy8xJ1++gu140L34I5X3wEzVoIdlRhCrrkCtFtQZgn8tsnv7b/2ieMfCoY
X-Gm-Gg: AZFdTZeRFroIPzq+1Nz9W3rQ7s8j2K4oZdFuZZ/hyoo378joviXsFz6x7WhB0+tY3/z
	ZOS8njOQ5AOQOLeQPlznni8lT4CEBWt8VS4MXkEgO9XnbHx9cd6NobufV6vSbcBwYE/I8pn9hOa
	+DL/XnDu4UEiVXNQDFWfRpcRDcGb1R9ks0tLF8jdHhU+v/CEsKnOP9JThlSYda/nwkQRVA1IvV0
	7UtVpZkF7Qfe0Fdo/NjYBgwfQj7mQOfj/jCLe515A4JCmG9zQcZFwPh853mq1n2xpXT+PhH6lFP
	dxNFiM8A/P6A6EJsF+Pcwkxcqc67DU6GqHytMg9DkZeEJcVai0qfA5x2agluS2wPrnQFE/o8/at
	3Jr6RklwKNt/TtJEoiC6Zwdh2nSYVnJQPL+wN9LX3UUT+/oAwd/aQcZIC+KzhB/6kd3ytHI4=
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450531e0c.5.1795454731029;
        Mon, 23 Nov 2026 09:25:31 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ee8af8d7bfmr7450472e0c.5.1795454730544;
        Mon, 23 Nov 2026 09:25:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm432664066b.63.2026.11.23.09.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:25:29 -0800 (PST)
Message-ID: <97ccd0d2-6410-40f4-9c0f-c08931dbeb10@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:25:27 +0100
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
Subject: Re: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
To: Hikmah Gumelar <hikmahgumelar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123152722.168879-3-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z0tpvcE7Oi26vddLTJc-tEJwz0CKZTkH
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04770b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=2S1_hLxhzeHvXZh1LqAA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: z0tpvcE7Oi26vddLTJc-tEJwz0CKZTkH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX7agF7MSquZNg
 U02Uw5WwGLu/meOCghb6dtS4HuYS/JJIfIXydZkQvZAKOM2vTaN/7xcWxIaFnnpwGdynfzr2snZ
 VIogKn9O10WnSI+kN3WalXVDz7f/54E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OSBTYWx0ZWRfX2aWXnYpblq5Z
 kwSfa65r7HCtwKxvkTwrb0n5PD9tL2MnjMP4DpU1M2DRm/qxP8tyZ7Q/TSWaA3mgWhuSXVNJXgR
 cpNlhmOjOQPs3/TD9asNdrcr6uiBSARGH5fmkVg7ApaHuF+KY8fDM21eBPyh30Vlqo9HLR72VeY
 XuQaKzlX2L6xEE6lg6ZoEeXKdq4srMAMTnRN96ZGUj7dCI0dY+mGaaFAWmC+nK69A+i+hi8yusf
 /pKKOuO3/Aec6NmeQYvf5p1urMlNqT293R9lmGs7AE4+eTm0lZ+Lg8w50gM3YC3/3Oz6M2RL30h
 E4cNrxuR+mZCoAkU1E1tB+5rv63HMwnaTgudXaNmGVBBwEjcfADkLjW5e1ytUn5iJNmYmVzRMeT
 vk2H5cV47twHiNP3tny8HzGJaYxi3+tt3AiDZEAq/r3pNAtVtrTq/xp8DUPLd0NnvKTGDuGSoL6
 kKfpk8+WMgbC/NYetBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230069

On 11/23/26 4:27 PM, Hikmah Gumelar wrote:
> Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

Please wrap the commit messages at 72 chars

Konrad

