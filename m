Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588043F5BE6
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466041; cv=none; b=iAyB3Z1tgP14PyZyM0kKAJZc5BggVEmS0D8Mh/OO2OVfc+QjtIonryr+UprNjP/EZmdl5gqFmWgWv53aCwGSrhersqRVwWfSUHAGbLDb5b9w7ZLUXMldMbG1XCcFMRxiMpYzOkHS+Ibhm4YejR0GWHWMnLeFz6wEY3vzYB+0k+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466041; c=relaxed/simple;
	bh=5oBfPJ+x239lYmq8/4KXIZAlWyktSzNaDIv3WrYRGOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQqIrSUU5dhdxs0XJeAZiZ0YzzqyaPB6aLGUxhq/FBEbt84IdEgqkxilQb9lTC9q33fV/skiRFwNOFuaw87vV3a270CHHNVDa0wUsyCnpwvSZgs2wQ5gVMY9slDS3mCvp9fJoGCtSBl6NHHZ0AZ9XrItj1y+aJJaw9zZFaS5UcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KLK2liwT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+8XYPV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KLK2liwT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+8XYPV4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hBYm3217675
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pF/QF/hhxoHrOKiHFcOtOanP
	8OYOtIshKOaIzZ6HLNg=; b=KLK2liwT8BmNgKS33FVJjQLjLmDLdquSsUYoHrqq
	hrg3EOqWjk3mJv4Gm/qPyKVJAo0/oWHqTNmKLSpCuKkYmbeSDZucfHMwYGZnL0GI
	jD69y2mBQdXOcg8geyyJBqNB5PD0p98bqHlfTL6kq7n8fDwlod2R14f9D9uAxg/i
	Y1YqCDk0wYBfOtO0zdRDWA59X/7Qg2FxLUxQezMGrtgXGQqNtBOv+dapzgPRKxT2
	ntMOiww9EcP6OSDIMIGzae61y29M1pXgIaG5ijroRsjokQBaowPa/7IJMRo/7dDv
	9JMAKdCQrJgs6mivmcFBDh4nlhCYZn6NXxuIBMn5PTaICQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2g8dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:53:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939d6c515deso865367585a.3
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466036; x=1790070836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pF/QF/hhxoHrOKiHFcOtOanP8OYOtIshKOaIzZ6HLNg=;
        b=Z+8XYPV4QRqXPYsX8gBxTnQkWsXojSNuhgommG9/itLdEvnnysWgI8tTK0XDxicioS
         KF+bP4DdXSFDbNt9/vkZBNqSbrrMqe6QGftQvWi4rDaFGK4oKVw271AD2XX05WvOA9z2
         sMqnKmGg3qpH2bCM6ze567VgCg7TnAIL3zsuZsIJmTqM+PrL2FCcFTB+kZteaToMhaUH
         kBLLwbmTAgxlWdFdQIK+7skxsW7wRl0cVMBJ4mPssRRvncKFOXU+iAcixBqvUwQ7fGof
         BNLsikFQK+iRAKM/GNbl5dEpMbP/SJCz3e0tkDjVnYpUJjQxAcIfNpnNK7DmfOoHuw+o
         Zv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466036; x=1790070836;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pF/QF/hhxoHrOKiHFcOtOanP8OYOtIshKOaIzZ6HLNg=;
        b=sVOS1TXvKuaQlGP5IQbBlsDHb5XJERXuwkfjMYEUqghKCK7Bc6pPwk28T5lIGSpJ1T
         ZCWWgRAxxDHEnTy00v1eqi7npo1rCxDOvCOIbJ76kyECNePd/Etj7Wm0VDN3/CHx8qjp
         l5Zw4SJ1JOYvtkYMpEP/pTdVyATIodqY2JZgpoT3imhPx7xkDbV1QFPen7NaDSU8mJq2
         0OerxLoERFtVF0dwMQfbUoGqfTxvGGwSnmzwmOoVusyncuykRx8gjHA+oUZwWl/wT8Y9
         yU2OcY1vk5M2PUfJIj/cnfPP9mNFHwRHgr+yP0duP/51VxA0bqk4PW0y1w44Zp2ggGQV
         ze7A==
X-Forwarded-Encrypted: i=1; AKwUvBycXjLzy490YvSeQZXPK5FjvavuthMWVBGBkf7Veqj6X17BpPQahN6sBGrPEuj53mV8SfX4Lul6Rbuk@vger.kernel.org
X-Gm-Message-State: AFuF++kVVVa8jNhtjAoz3YvskdZIP6dSjccgoHKOH4kSLH5KKK4iMpEX
	XHObsSbqBHbiCoCPU+jDX0KAFhBCfyQHRQS2OpVGMchkzW4K3dNOqeZZVb2IwpyCgsRiu3N7MK6
	K0C6TeDqtkwfbZWDLLa4UZqjO0RXQ11M2SqgJyQKMjX/qFkAzvz12x51JP971njbb
X-Gm-Gg: AYBFou0aAT0KzcmswGSkLbkjpTKiwwQ73Blcn6OoZlqZqt4CwnYM/jB9LpLYmdMc/pW
	+w9eLR6E0xtG+TvetVeJEwbsiQOm6aaih2RwWfnNU4s9JT1EuxzdIiY/m9dWmX5r9HHU/Q1H04j
	B5HRHvkxn7rFhMY9kFeCODmkczhMDlgYFr+kLPYbB1jAOmkehZw64ah042cbbDBBzGCLUvJ7lB8
	oB5E5JOElPQQjGIXl15ZDajVAZ4xNUXy364CeOiETwUXVHGgoQQqLIQGn6HhodVlbLEbFkkMBj6
	/WnCPROyfpM9Sq+SDoeemIdzqkxe/HgyS7/JH5WzvjcVj4G91bbTGLWkRfbJuU3E1T/gl39BG3C
	U89lCJ1D3mfKKTw==
X-Received: by 2002:a05:620a:199c:b0:937:6771:e7e7 with SMTP id af79cd13be357-93a299f58c0mr218163785a.30.1789466036460;
        Tue, 15 Sep 2026 02:53:56 -0700 (PDT)
X-Received: by 2002:a05:620a:199c:b0:937:6771:e7e7 with SMTP id af79cd13be357-93a299f58c0mr218157985a.30.1789466035894;
        Tue, 15 Sep 2026 02:53:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e8249e3e8sm4523405e9.12.2026.09.15.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:53:54 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:53:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <saph4ecgnjpxd2fxeg277aihe2lnybkfk34ipb2nkg6wamxytw@qpm5cta6cemz>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WUb7e3x4d1JBiAzTQMGI-w4SRuzx7efB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX4tQUpXw97lGn
 8oJPcvH34mp868gKNi/aFGGkh7NRUS9xiMnlcXTYe/FKGWSD/wusHi7soYHagSzxMXIaMtYvOOb
 11XTvb0znFNSJKppLte9QVCSbV5pHhBwhwvJY+n934WUYIhqJIIkbNaH4bRAfKyKUqKTFMNiJKD
 G0amcfkgy7L8Jay+BvbBkcyA54N5I9uFLdrrLgDMqk0J1UDbZOmT9t9/J6Uj2vBegQeFS/lylQH
 kmVmPgaygkpUbC9t2pwx4cpZXfRjfZONvmkZ1gvEms2xgPlmqt3vsAxyYxol8ZeijZEQbOlwnGZ
 3m8mEInGU6MVO6q2qGu5OtmwNpvWBawSUVXC6qAhpBK0Cwt3PsfFJv5MVQD2gzNwXKcFf2DBYrB
 8LRHzvO3Xf5C0C1Oau0wNPc7Qgs1MJ/BZu0Is88Ak6lnGe/37Yyi60UBWZA3tTbuUoh/tFCGKSZ
 sWwko9Zo+QxsRaOXJEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX68dQ1IkftY5o
 bcG0EhVsF7LLm679asHThm8ch1DwUOLWSPNVS5cV6PLdlvSS2/W2JZGHdqW4ywQwo/Gvx1lZzzw
 14r2SXPG2+x3S15L0egGkmay6txjt7c=
X-Proofpoint-GUID: WUb7e3x4d1JBiAzTQMGI-w4SRuzx7efB
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aa915b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OUGWfBxzjYAD_LoOebAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150141

On 26-09-15 17:27:50, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> the display-controller (DPU) node, alongside the existing MMCX
> performance-state power domain.
> 
> The MDSS node's CORE_GDSC is unaffected, since it continues to power
> the rest of the MDSS hardware on its own.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
