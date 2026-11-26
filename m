Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703404;
	b=Bk05HkxcIebQ+YNXLoAGGHzr/N7sjdYBrFMS97VQgH1CchEmCWtKtz0tHr2o9iHSzYQm
	 ku0oejnunFdZf06TNS09Y3nNvwhA0/JXcQGoOnXq6aM7vx35RgWj9Jrv3F2OnuI05+2R7
	 9BN94qZlIMZIvY7owgvfKKDRau7Oy6svj0MCCZQHs/51MX7yF/yo1CwmmrAIuIgLML91X
	 TVeKBZI7d6+k6JlxEYOiM0/JnjkqSXHIVHqjGaT2XPMZlxVup1LmIrnSMFuaxmgj7DC/X
	 XeOJIdpWLbkARSWCg+bue8SBT/bRM0K0iA8enfZ87tMCODe95JPjRedHeB2ISwDD3wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
	b=Uv8rcoBURFk6ukyx48Jr5rlEzWqpNzYe3JAk+p+VncHc+qETmUs2tikthqsmlISQQ2XZ
	 ZFOA+G8lZEU+gxDTySXxP37xKhqkNn6vUpo+dSW5OBiZbQncq1Q0bFb6xi71aE79LOTRx
	 HnToYo1iMq9KcM2S3WPw3eSzEZHbnInBXlE86ctqhVXqbiofdxhiiMfFdG7f4Aicqld76
	 rfHTB+B90voIVFxztSFyL9l6H4g/8szyp5iE9h+/LlGlcKTKxB4XAENFXRrA8G8Uxm1i9
	 8y5Gb4vWoVCuzrd7ECACl/ldpe7bd6HxtX0DBOY6jXToVklyokD/c++BPlsf32f7Cjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLQJCho7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXWn8OVu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F05E606A68C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F05E606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLQJCho7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QXWn8OVu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNOY3893640
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=; b=fLQJCho7UC8UCfin
	bajE0cFg1J/8Pw3XuXRvnKPdu7FNMrJG5Crue6GGgTXll1dlK3SyvSOE4Esg+BZi
	/1pIR82MvIbclgjYxvznLpFJj6GpU+/1Z4PXPwQT7mC6w5tWNIn7dao2jZ7VNXyR
	JW45x/4cFUDDYvCOoJKvuzdZrTmCCfwMN6Xv3P175H9n7UShF0BVTCCpmJaQn4uD
	Zac3qSfe+cS4JAmkMGlCIyGK9i0PUpG1wM4j9VfNniLHkKc9bP8/B9tnI1h1qyfc
	33i6SxLCYKSMIZvPgQ5FuM30lm3EGm48p8333M248Iih7dxFtyFENs7077KFkAGx
	yCPMLA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm816t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:30:02 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-85f012673cfso1358061a34.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703402; x=1796308202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
        b=QXWn8OVuCOIu9WD7DSH9yQCOnFipNMk3z3IlqwXuBiGLi3I/ANAZLf876MCv3tB1Ic
         QH9snTgaRGec4Xo5y0wruSIZlIbCflnjZCPwsXavEcrBwm69k6b8d3zaX8yAo0o2Xrb5
         wuG+e1IoCfyG3XY6U/TDpX+E137d1Udc59MG+vMq0Yftlx74/XILXMXFMW0cIjdlTLNG
         E2+D5R64zMTIoy1HSWGkrg04AG5PvsVQFfYJw7RFFr898u/HgH+LJC+48UgzQEFVtQXJ
         G2WFmzc3OqZW3965r39frGMXMp+KKT95bL3zIhp6JUKK8Iw1kBq1b/iA1NVrk/gvptoI
         /pmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703402; x=1796308202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYKSqpNm7JmeDVDfHCjbjXW2efJm2SoQYSo8R7KD5hY=;
        b=GADUZSEbQ9e8iOF7/1AZS3lHtbL3VPAUCuUsHB2vX7tDvIgp/KLg/dx2ckcHs7sxLr
         8DYBUT2SuHPvQiEiHy4iMNWE1chliLi6nnGRzsQFjzwD0jo6h55zh89Z5y1E0vGS+VPB
         CrCSArWUfbVUNkN0xs768GBjFw3J5khKcg0VuEupaRx7n2uoakyYdn0b0NaIF70zUpAp
         nfpOv8pniqIeJcNXKplS2f9bT6cw4eS9OF9XHjCftXjFCo+7tbGYJi2q1iVi1f+w9ACK
         xONzq07hHm24nCT3PXxt/teQZ9EO7ghZqDX4ivM067WPVcgB6TbksH3v+uS+aYjM4qae
         CbOA==
X-Forwarded-Encrypted: i=1; AL+hErHzWGx2BuMETRhwmX5PwtcNpL3h0qYgkU7ekEv3Bc/1xUjTfRAGEmLFGQ1hCFrYPEvg053v7ddUqIXR@vger.kernel.org
X-Gm-Message-State: APuU4Z+WUPO8TNNSB8LxM/dAzagBSwFYDLnBJcHhmC3n8aHR92qf1HMl
	MnHUCYl+SOSIAvzwnNatzCHLXLRpkIt5VNyb40mRZV7tzazgd6pWyAFDNmCfZf5I2cUP/iA+9js
	1pMLN24oYgHt0IqQ931zj03YKddzE7B1/B2uXo7ujgC57yqxJxPURwSKNMzTnevy1
X-Gm-Gg: AZFdTZdnOhy1zB92fw3O+vNLlI9puuFQmwmyDk3wKpqkCL3x5zj7z6PLeMiBKwEn6rO
	OtW4vyoIus8XSGM7tC1mfleoxq7JNFoXOAp1pDGEDQVWIqE8TEAaDfsgRfxBZDj9oUfpumi2Q3O
	NXN9Nxie2vbi4m5BEdX6KK894LjTS8K4AX48lrjCzLOdueC/QDY8xmACOQ5RwWPODuiFqchBt4I
	qbbvoYKFdomblAcQov+js6JUKGfIrRybvB191EJ0qdy6w/uKuer5AbIBLHr2V56MaRuftlqEUO7
	IiuXxq9ZBpHKgwMe8PwCv5Mx8k86pWif3UfOn35/b+xBJ14EHiMPCLbmXN6POmKnX/QJOu0rZ3w
	T4YBLYLqhD7SgEMbWvx7rlnjRJoOKrZpKcr3GqRdmecxI0Iz1Ricdjshis/9AvKqr3A23Bqk=
X-Received: by 2002:a05:6830:2a88:b0:845:3cfe:5f2 with SMTP id 46e09a7af769-86314ff95bemr34000815a34.0.1795703402230;
        Thu, 26 Nov 2026 06:30:02 -0800 (PST)
X-Received: by 2002:a05:6830:2a88:b0:845:3cfe:5f2 with SMTP id 46e09a7af769-86314ff95bemr34000765a34.0.1795703401810;
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea28f4sm782697166b.33.2026.11.26.06.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:30:01 -0800 (PST)
Message-ID: <56ac1346-3164-4418-a00a-168323787535@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:29:57 +0100
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
Subject: Re: [PATCH 4/5] drm/msm/adreno: Add speedbins for A660 GPU
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-4-a7175cdd6512@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kfEhP87OKQTwcejiVGOwOqj-gqGq4g1R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX8IK0HT4AkZv4
 TOrRJ6bAy9CrC9rOMYGm7FxMubkK5UmaO3C88NvDnrjAivMyVz0GSqKsusCZiLUwqv+0WL8qeC/
 g1doGiTHzoBMZdCGyOSzX1jMtkjvFrU=
X-Proofpoint-GUID: kfEhP87OKQTwcejiVGOwOqj-gqGq4g1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX+uIkCuBov3Ch
 5b/kF56Efw4cvqow5WntE/13arfGcWiH78+H35JhaQG33CAKQxjxzH9JdMYxbiHFPiSaivPtoEA
 r7cUeXEtlGKHwM4f0sV5zAOk2kuo+Q3dkS/yzRXT5AqBJfTxgiOPU1Ik5Ba5zRfN0RWtlhd9RBw
 MUMpYxqDtznizQ2RNEi7MstsK910SiTTC4qdkxcXrvLRSFXDY9fpIbY5rNTr/CtgoWxfuTTBu9b
 +xhy/IBFrdZNm1X4ZjPRsPdsKejncAMQKlFPllut8Q0gWB6USxuFIzulb3SgCG0JG3Ay3D8aZkJ
 V7Rgyf3FQN64hIqsi9Xo4JCOTz9LvQkBDbaD+ON5yHG8oKVm5AXXw5y1gIkhGIjz8g168KbxfVg
 LooT1dxxoAWRs6HnpsXAg5o9iOjTc31oPHx+vCHe0PA7WCCVAKl8162zBT1sRI7kpHHoRg7nIlO
 Tw6ROOVU+oAAHycRIig==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08426a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Tt5JBQAfAAAA:8 a=LR9blauW7GWGG1yPYK4A:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/5/26 2:30 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> The SM8350 GPU comes in speed bins, read from QFPROM 0x17b bits 7:5.
> Qualcomm's GPU tables for this SoC give:
> 
>   fuse 1, 3:     up to 900 MHz
>   fuse 0, 5, 7:  up to 840 MHz
>   fuse 4:        up to 738 MHz

I only see at most 2 bins, what's your source?

Konrad
