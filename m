Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411775;
	b=UMtmmCChtmt2UPoTqu+KhB0WsGju0pV/9mbTqoMwi2p5CdpbEyvClmErxU4ri3rUiMYZ
	 QisNTAhpd0Nlshhl+m6dPV8xSqN0ObgRc1X/4PmnmYZfWteKJuN8gm45MfjteX1Eu5BiZ
	 0i358Xb4tUPRcNH4wbnhLjmy+SRmfhsMGaSdObLh/l2EBbpHMhV5fXCixXZyDH8PV582p
	 ffSgLO+Se+Dha8TdPg+7t930+asrbwm3ZtkuDr2CpOFBP6faIgxTb8txjwisa4KmWbm+A
	 OjHd71ghqzFIQ2Ww9LLzODPO88tO6Gr8pTU6FxWUjWhRc1v4P8PIousoH5rA8yQT3+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
	b=jgAXu9b9P/MmFjBFNFUadrcUsbQrtcuV/4gC0+cS+1bwYMYt7ImOetyPgbxYW8K1pWLx
	 sTr1nULEfyuxR1Xktnos43GADESYYXSX2jckARvQ0rYlFoSUcMNLwrBkLfbv/FtTvE7uT
	 7pkbI5xuCFQEhmSDpexCOI3th7AB+vwY5L4sHkeD4ih9GxWy2cqE9iXfUGNmJhPphLUDZ
	 hQQ7aHE9VwJ/3IubCxjOUR5IGfXd5MxOj0eL//DR1GyPz+ym+NNjdVfAOCKBhPsj6VIrY
	 df1c77CEP9qfeJklWqEs7bRrdy5SRLBzsX01Nwv2rNGTGrvUbdUxkx+cyJnERcM7/8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fhsA4Yuf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azO4+3Oi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA839606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA839606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fhsA4Yuf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azO4+3Oi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0DKZ2316073
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ka81IfeeRWUOIRXxY/Mzm37r
	R2+cA3vNQJzHgs09LJg=; b=fhsA4YufaIN+kkNmUeaJjEhXD+Ay2S74Gbn9zVTK
	CL+52LVeQ/1bp/2LFslDYc+04X2tLRxzv07I4P+zXc+39zxf57p5lzyev2ZIhlix
	+/6Mn/DfKG+mBN+cyE5YrV47TWwkbC/xXIOTESGtKSFElRM/Xv7Dbh+MjqQYMjX8
	ND2dQtH85W0vrQlyMkLCLnI9cTpeeoX3TCN2Mi+LfMHL9L3soCWXGC+W9gxjWgID
	PSP7heUFaGzTm/0qUlmXBt4iVwnj3ecINoeUwWKPNGJUvI2QzqaJypFL9a2SQ02i
	lbsDrcA80QUgYI6tkocFBjX5InTBX5JFLkN2bVX5YMhRPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh3fx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 15:42:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so805011985a.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411773; x=1795016573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
        b=azO4+3Oi+qzzKQq+Iv5hBjtQ/I0pnmiZW+zT015e6y+NdhnN+UElV6UFsWMqmNPq3V
         VGmA655dAEND2JS3s/ZvoZUwNeFgIX3ymE8XqngCLhQqDN0p31jvdopxGxUyVODnq/YF
         gw3WqSiU/w136N/PSha7uLDQSHvAIE5UAHZb4LyIx/ovYtenKN7vcBP3vuMvYQK/geXy
         bd8AHH8jkwHd3JFd5nLjF0RAusGSSj1h5Sz6IKqdR+yotU0Gqt7emgmavxY63Rg921OW
         1pWQEtfKzSdapRRbuO8b98PdS1VcoeR+dUlPeJg4WybwAzvnytVe+EE4jZz7BXi8llUV
         1ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411773; x=1795016573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ka81IfeeRWUOIRXxY/Mzm37rR2+cA3vNQJzHgs09LJg=;
        b=gnDlKGmfbB1SWZhsNXjZI9ayAveFPkfSckcwObDKE4FcOmAjMW5/iF+jROS9PhPEwk
         DyVGCt7M25TAxolF4hlgMVC3F4cneQc3RszCRRX0Y70VfkNc5KfDDG7MxVo7UQZU6xt0
         I9f3GBSlcpQ7sqBCNORupOUte3u2MCvAkgkZ/FMcAy58aGJRLtq2CVFrniConJEkFHud
         oxCiY62Xr39rppP8r0oWP/SLcPvVCbDiXM5Nk5SMfMXk3o4ACLKFTNldcBnj3PRNkCfw
         Ai47ZTStMN5FUMOBSWHsXu4wujGTtxlEKy9U1LfZ5awENnNYI/7eWRaC7ySuRov394sf
         K9UA==
X-Forwarded-Encrypted: i=1; AL+hErENBXgTGF+cNJd1GBMln2maia8RECJ43/xAFAljO7YBOJAr2j6o3DwIDdOdRJcx3H7TLFMxmrnZaM/6@vger.kernel.org
X-Gm-Message-State: APuU4Z/9gM64c47mJb1mqGxb4DHrfRIM7nyDAduSIcRz9W7UHqfFzCqQ
	bcJG7xEoEQ4IC77/YfAx+UjRB1EDPf3Il5BLqzc+Z2Ijsk4jJ1JORe5dCj+xGa8J+2BJHo1QD7f
	Mvnz4p2f6mrYVvHe4pqWFG2yRWX+4FyuDOjCtO1GQLm51wxwEl3IRG9U8/lryUpfB
X-Gm-Gg: AYBFou2MpQznBMUuR9n+fK6fIi8O9qvwdt3floHK2j9iAGg39GT07EM91E30y2vxL0n
	+/0+u5CyS3Q8ktGw1j3Ds177rvnMrttN4xGLOzwiMDyxv0q6ICjYT20wiuGezy+cHljdtdYsJj5
	oP1Eh0ZeGobdE8jQun4/LeWaWsYDJEqRl7u3D5lj4RPxMg5/C4hbDZL7VxbYtUWgJsqkiYb3vQb
	gxYzidP62sjJ+0g1YiqpBEdZ4eYyjD/nZAKss5efhhdddkIGmoPYSCBbrV3kbSWFyC44pGsI5wm
	1bxssNkBKMwnTam0KVOHM8gReULnOiSjO/kmoTBrRWFy495lJRXMT6FpE+Z3dl48rqo3155m6uG
	B7GrAdxTK+KZVAhJRKA5a6oaDJhBlTwUTEw8qU6hg3scInnu9sxGPeuEBqEEYYVWpjZZbUhxIUr
	1/vwx1M8VzOcdyjAep3IhWnI37B2AYVr9bZRrt8IDCCJO+DHAgEtj/Rzp9mZf45Q==
X-Received: by 2002:a05:620a:1b85:b0:937:6c0a:9b65 with SMTP id af79cd13be357-947afcd6309mr364199685a.7.1794411773273;
        Wed, 11 Nov 2026 07:42:53 -0800 (PST)
X-Received: by 2002:a05:620a:1b85:b0:937:6c0a:9b65 with SMTP id af79cd13be357-947afcd6309mr364193585a.7.1794411772617;
        Wed, 11 Nov 2026 07:42:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba565esm984546e87.19.2026.11.11.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:42:51 -0800 (PST)
Date: Wed, 11 Nov 2026 17:42:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <xih7e6366voj2awmlhdkmhtyn7qrcwsv4ejp7kz6vvszcxdrlt@fyn6e2wnwlkv>
References: <20261109-msm_gdsc2-v5-0-4a3159b5e4b8@oss.qualcomm.com>
 <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-msm_gdsc2-v5-3-4a3159b5e4b8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX1vj8HFbfphru
 foat31sZjP3FLWMmg9uWFQ2QHi8TaYlvlHvhs+zITpho3ShyiOpKO24IvJgqvrWX7MfI6OMtvpG
 duvKLCFGVbmHX+tnEl1jnYIVOAhsmw4=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af48cfd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=lIS-3JFwHiDYKImdvy0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5YxqeG4yIQUywzpeOvDCvS0Li6nsKGsk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX87nZvXvGStvm
 oofKVqcO/D+5smH5Do9+Rv8yNaqy1F5Zg+bXJk4hW05yfwf9cSLprYfx8mBd6hAEnRBKVEXesKa
 egpY8OwLcS5DQ8VAndCb68C0BmznTzPQoddB7Sdd7i53gFISXk9z40EFANAFZjj7oSmgyFq/KSW
 jnAVt9h3pFV4GP7+5hAKL5Vj+8EbQ69v2xeW3Xtn98DQLQeqBYPtDEmTEUG41tqAhV7J0DaUB5f
 5VHq7erdLpUtYpe7dTmG26GD4AkA8ICvyFgEKM9g6zGJqSRWpW5FP0EdUj+h6WyzaKOTw+ZeMQS
 2vwO5cElST2/yzUp7xi/+Px7X/WuI4JptRI+Gd34K+MP5MhoXkBCKnd2yHEQHytfV6emG6N4myl
 /5ZPY7lZ9kzf7SfH0WMWgDMvJs72ukWj+agjDWxO7u6UEdXNF69OI8uU3TonZldd8tXEQOkMcha
 Gizsj+bKSN/+bhp9GGQ==
X-Proofpoint-ORIG-GUID: 5YxqeG4yIQUywzpeOvDCvS0Li6nsKGsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Mon, Nov 09, 2026 at 04:36:37PM +0800, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers the VIG2, VIG3 and DMA5
> source pipes. Without enabling it, these pipes remain inaccessible.
> 
> The DPU is supplied by both CORE and INT2, so describe both GDSCs as
> its power domains rather than attaching the DPU directly to their
> parent MMCX domain.
> 
> Keep CORE attached to the parent MDSS device because it also supplies
> shared MDSS hardware outside the DPU.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Joonhoe Kim <26rote@gmail.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
