Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372743D565B
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165347; cv=none; b=EdvX8PrW8kS4ua13kLcugnyrk4k9lgw6NlIahsw+DEgyFSZkckBuqoxz849b1Dx43LL2swC+lAR/5ZGDJHxxE5kz366DtulPi2GNceUWYxujxlrDDcQzVnkdbksNja/D5wvnTCf/3XKieqWliBr2ghQpHCX1emHUd6b7fmh86jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165347; c=relaxed/simple;
	bh=SjZ4EK/3zT1ba/gtDzHBJmT830R1l6042MseZmhzl48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdNr7EVrls9IgA/ulheeB+wSblBRumQNFk+s8G6KHqIQAcm7oDVwy4YoA0x3vPNfcyZ4bMKRlY1hbKuB1sxepNo5wPyBUFEn6Y5YiHYHz0CcvmPiHRqh/e4WkRbCIjcau10dpmZAZeHKbB1j3JuaSTkFJXx72K8psnXlBZHXOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjY+A5cw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0pdT9Vn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjY+A5cw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0pdT9Vn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xGPG2332469
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tr5LOcwcw4n0UOYNCfknwwxf
	xAS2b6tJnboga2qZv6I=; b=KjY+A5cwr/KsLQODf0A23aG6XA7MLt9pe/5qaiQk
	RTPEajtlDCFe7wRc39uxbOUQggXBYn9IWsGyj4rXykoeE1d6Nb6w+pYHP9+kxlu/
	osOtOkcJNO7xSbQLjq53PKmXgZQ/XKPWAuOU4Nv3zx+aMm4MC74ftBguC125l76D
	IY6SYPY1QixUKCMGttWWYBO4iWbOCn7TjoFxJ5FUsjLEbf8oztawlUanTg1IALai
	YtGnRqf7dDuN6FA4mkFdonSwzhw++Bxq05p93VhmcaBTFrinmPH91x0vvjHMtgFT
	PE4pGhGWJ20QEepUNH+sNHzW3m2oKW3jTu2lGv56aRKQjQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq859vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:35:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930b571432fso461048885a.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165338; x=1788770138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tr5LOcwcw4n0UOYNCfknwwxfxAS2b6tJnboga2qZv6I=;
        b=Q0pdT9VnArJ5LvwGaO/WZNCVneadHS0V3Q/MHuFua5Ba8XI+xs6tMfNGj45SdzTPLi
         7kN7VR08dbBTDXvH6fzozuqiPvmOo3S+1V1ApZm6kdF7j2TWORhuYb2Z+42t6AL1o16O
         Q09XKIyWfq1kwwmRxRr9cSpRX6Gs37GM4sUL+f1UxVEU2pjSKezLbVfuGA5zi14Lbwph
         uaPbOWn2POQ9LKZj4TQjGvQEaMUukEMpG6UaooZwM0agDkx3L5bc0z4y8giwWZqh6+ie
         l1+k4AWcZYy2mqCU3n35Tb9k7z7JNm/bO78BugJOaTVR5mgi8q8NEG1JHHyOMjwSVmpb
         gBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165338; x=1788770138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tr5LOcwcw4n0UOYNCfknwwxfxAS2b6tJnboga2qZv6I=;
        b=c912UU7vdUwj+bURbLnaS9R3NvCikaah4y9CSRITbSRhY7R0ISrxDdRNxZUmDasDmS
         +VUG7J+BD47B3RLBK/6CL0xVjIQhWMVmNLzPl5GwJc9SoT/rFDfxk26g2QjxvLs6f4u5
         VsuJOGAftXMKktFWJnmiRoRhxWu1FLy+K37nsvMG5uVIZUaEcrJ31MBxq+5cIzU6PFLD
         OZ+OPpuSkG8RsCXPHmwW6b6d2rN5D6ZOnJJWj/Gc6lMqoCWEIvQwDmd7xFhV2T4U8SyP
         UpjNuZ1BJ3Y6fca9S9x2+OD9DEAngYXwjdFC+mW8Mx8CPF9yAWTkC3iJC+5xvsIkFlkQ
         dEIA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw4yyac8NV1agJepx6Ms7FDMJMz1U2vs2t+Q1SlP/R7B7Zp7aGH88L3q+y703S35ajz4JZHB+6jWjr@vger.kernel.org
X-Gm-Message-State: AFuF++m5TiaC6Y5zQsdd7u7iSi1HMmw6DPZv0wxZijB2JWn9zevZXeJ5
	+01Eq1HNdM2vQnuCIt2CrR/oObsmhzjOCfhZecQHyDEhyv6Q2RDtgpcLhLCeyiKgc8s0IOTvQ7Z
	XgCRglgdPe9B0nIgvXxpCicLMh9JNAO+7UR9oMpI1f32AeRCk2MHUHk12xJJNiudt
X-Gm-Gg: AR+sD11CkZ5xi08r3tt6GK6n2WQ6ZmEsfMibH35wqSvpfZSORHnbSkb/5tD/cVuHuxA
	3aiS7NF+UubDPoU5voq2nMoHrtcjzjlnf1R/zSlkVGACtbJD+POD6SZ0MdGx2/IhJKcGQdL5vDR
	mApeyPZmuTXhJcgvCYXN88ZRiVxfadlpeKydotCWkcRHbCGU5/3815HDk046Q4/Vxx5MYHuUUdu
	YN8BjLDzdMAGWFnWKa6kMDzJ0mZhDG+rKIrYz20IQf5QMW0a8H1z2QYwpLwTY0YkdTNXbck6X6j
	2YQoxfKqDy7Xn4Ipcb/kuwVXCm8fuXKuE8W/9bVlZY3Ns9dP0N2w7mMJBerRYnGAze7Ewc/36vJ
	4UT58T/H2ac3RRg==
X-Received: by 2002:a05:620a:230a:10b0:939:3f4f:7254 with SMTP id af79cd13be357-9393f4f807fmr200877385a.14.1788165338455;
        Mon, 31 Aug 2026 01:35:38 -0700 (PDT)
X-Received: by 2002:a05:620a:230a:10b0:939:3f4f:7254 with SMTP id af79cd13be357-9393f4f807fmr200875585a.14.1788165337942;
        Mon, 31 Aug 2026 01:35:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb2005esm21269065f8f.24.2026.08.31.01.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:35:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:35:35 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Fix microphone distortion
Message-ID: <ys5ikvuohab53qiir22ivycaoxg2crlwf4ujm3w6ghz6auggt7@wdibjny3bevi>
References: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830-surface-pro-11-mic-fix-v1-1-36a53140373b@gmail.com>
X-Proofpoint-GUID: rKLUvyUVeGGHlT4jZAo-amnYvB7LluT2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX+lGUqF/LbthN
 Xuqvz3iGIcRD/fy3mVOckmnHRixV+DbTjZyaf4sRHtTz0nxwGlj+Y9OEfJwrHp6BiIqvf6c09HV
 Gz2ESG+a3SRdxSJZ/EBkHeDULozj5Rw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MiBTYWx0ZWRfX+eGiqbC+uZYe
 qLI8E+aHQPJbaduShlxoI+T4Qv8Li1oOAY3n0iroKac9FgyjTD+MmJWXvqAneY+MXazKNQt/P2M
 H4+Qb7HnNybfN45+ihAp/ebkTX6KPb4uyxcfCiQqDTn8E0zN7fAgkcyTyCDSJ54EB+cOEI6EQj9
 SWPS0HSqBCHl1s7ZMh/Or9BBm9ydBqUFjq6YGozaB0w9/uTFK2GITCmnswseKWwkVQl+B8Yg3tm
 QBhFFIVivX3MnK1ojQUfEhArmosYtB6vI55TZ9Kx7bkFu5x8ol3LeBPrPRmfsasTL4F1iWlXGg5
 I0DB13CPah+MMsCh9eU4VtGyhdgN5r9YRSDJYatCSqI1hclZDrCqN25JIRfjFO3FtbO2ViTxJff
 AfSWqEmn/PmdT1W0dudI32sjCG7W8CYnVs1Wph013WhHYpuiYuizuZxWfoO/85qfPObN/5GwMut
 syRPfh/ipsc3LsgQOsg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a953cdb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1xpzCHDPxV4s1b1w7qUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: rKLUvyUVeGGHlT4jZAo-amnYvB7LluT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310072

On 26-08-30 18:40:07, Dale Whinham wrote:
> The microphones (2x) on Surface Pro 11 are currently ususable due to a
> misconfigured sample rate, which results in a very distorted recording
> with the voice barely audible.
> 
> Under Windows, the DMIC0_CTL register is set to 0x00000005 while
> recording:
> 
>    bit 0 = 1 --> DMIC0 enabled
> bits 3:1 = 2 --> DMIC clock divider = /4
> 
> The current dmic-sample-rate of 4800000 corresponds to the default DMIC
> clock divider of /2.
> 
> Dropping dmic-sample-rate to 2400000 sets the divider to /4, matching
> the working Windows configuration and resulting in perfect audio.
> 
> While we're at it, remove the reference to dmic23_default, as we only
> have two microphones and don't need to configure the pins for a 3rd/4th
> microphone.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
