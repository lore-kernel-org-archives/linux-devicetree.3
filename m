Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C92367CF
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775337723; cv=none; b=Y4AWkMN0pa2zkW7TImRMoQ61RlpWyjtg6fMQbXFgO8fg9hGNJNcLvW2QtS87KM+ZkaQBuk7fBg/N8T0DMBqP2zGs8nKs10/RLV8etfwqCYyaKWJbvqZ3mviZR/PG+ZJOKBFAegVOn/vSHg+7j9x6xTb2bTnB8D5eP6XC/1/EBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775337723; c=relaxed/simple;
	bh=MK3v7W9Af1w4gsAZjeHQ5Iw1wUJ2VsjJxLx16zxA8Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcN2pPIOcQucVFxuK++otjtcCt1dXluX36XOM5ExC9yAE+FFrw9wPC1i0V8FxD7YCAyCbI6f98fwSqShSQDkbfqlseuS0c+0j7Z9usxWxDzZwoHxxWpPjJiOGHEz5HpOr10kAzTT/ZQ6un2IFTjhowStCpI4c/KQzNTApVUEI/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B67aOBwu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M4ANGaK8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B67aOBwu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M4ANGaK8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634BU2Ds3807972
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jAmb2DJFQpjhoL8lvIGCkQkm
	M7lGqiPcwTOeSmd23U8=; b=B67aOBwuiQxLzL456Kyv5iF3uUZHrZ7/YuIWWwBW
	cCnHIxDaZFbLXD8RpY+R7dmqyhD5M3THOZtWIun0cSoeWL0oJLfPWRijIVtFVFhK
	0KjFBD9G1YwyRJQ8O2BoeAxo7HzNIayIHPwHDJgMuIS6+IzUUokRp4AeKuazoBtJ
	19qx8vXiGR3WGxMNg0Yl0ou04xGIeXCW1aq4G6FOZu9nDAV1dl8639vt0SYO7wUu
	KW9g6CB0yCxPfDxZ65gtlUUYK0IPhNuRAdr/gWCV7tbYEOEpAHRbC+a1MkWxeDBI
	c5LZdORIKPdwvDHb8tmbSjWEY+VooQCgdw0kgPFkzRYFbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14sg5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:22:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so134446811cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775337721; x=1775942521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAmb2DJFQpjhoL8lvIGCkQkmM7lGqiPcwTOeSmd23U8=;
        b=M4ANGaK8wkvzvCF7VjQBrSHVCoqRDqA7XjbVORUywmwfBgBUCI3f1QgO3DmXZd5LBW
         InCVrZ+8bSoqBwhZh6gKd5Gty8+vDgDO9xZJvwjy80sm2QtbAM6lbLpwV1XewD/k714v
         Jz4z83aeLxiJBzXJpU6gDrCsAZ7toCYRgMeomgHdBKjC57GVCbKfXz6kJg6oGl9nG5Pt
         ht5wcEPb5zATTZCCFzUp1hK7sxoT0nWswuk1xq/zfjyagIJl7sgITwGrc9i6rlFfiZdm
         FiPVslxmm2ZC6xfuN/tFHmNKpL/R4HVAV78iqrg3jhW+PUz5udH5HZJvyaFW32vi3w8W
         NIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775337721; x=1775942521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAmb2DJFQpjhoL8lvIGCkQkmM7lGqiPcwTOeSmd23U8=;
        b=BDuQ28mn+GIuhb+g1oy3pT3jjhU4K4f2p+d1+0eJ5SmxAWKpIwNwqw57Qz1QFyyVHy
         Hc6ujlInnuF5+ukA3vDxs+ua/dDWD4w1rlr4dhSsiBNtPms3TTMyckVBBv6X2sjHqeZT
         8wXdXfkeLag26pM6YMEpxlAcSjbNFjovcdp0eaWFGoCKqVIKOkYz6z0sfTlQRmfbzyBG
         zBic0h7KH7WfJYy7talwkFjJAtS8imt6sHVata/pW1UuHAe8Ue/ehkRmhHCCqzG3Rnos
         31FV6LsrVJldhs/eXhyiuqOJ+zw+wbNUVfiz3mmEhfdRSbTwmsYrUMbmdMRtXMkzVxAk
         WZrA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZWhV9+IpleR2K4ZpcSgQOkYLbVOOaHiZa/5SSGQ/tp4tL0Y7lg09gS56b1nlVQ9tkLMSFjXepGgn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/e9tobWxEw0VwqeR/j5Kd4+FsJhI5cNPqrJqiJ6yBcokeG9at
	z+EdzVKF0Jj5OvEfwlt+oKVLFsIKxtRJLd2yNZIHiivTZvWB7iWQPmonQYRUmnbmKznZU1HMXhH
	6IcCdVMWPOEcrRJEQRIHelqoWZkmhWMgcMeuacbStKlRfdAbfhm7yjZLpo0h8royN
X-Gm-Gg: AeBDies75/Q+AS7hBwaqBg9fNoZBnOS2yzHnD2Ed9VrZtj+sVC5R+ldQv2MVcZJES+g
	qraDLbhNce67+0pPRwhjA5Isbd2E3U2MB0OL9rsy5BdffRJamUp86YRNTP4XsOxKZbxSQRiwzSM
	pUoEIjtcRbM52KobgxQPfC5boE5chZs4PzjTpViYMQ6tQ3edCPQWH4aMwhtqeE9eWBk76LBIHn2
	sthtylYKOlckgjvAVtiarpjT5oX+DSilhk/NaDAwP2TS4kyHXSMlZOfy6Hn0k4LPViQP1hs9AP9
	pu22eTG050kLN7wHPBdR5aaTD063Wln0Y7vEUQGgzz+J7oN4UqrBBo+av1czhvZaYSje1FvTmqW
	f4C24+NcQ7TF/E5ghHE/+omPGnbr9jSRfYFJ5jLMbiTV76O1xhqPzTBe7KYwBQ6VEF1y9tvgWFq
	QOaM/2yyagxbGv5CunUPiJFsQlSyYIsnqsPA4=
X-Received: by 2002:a05:622a:40ca:b0:509:26f4:64f5 with SMTP id d75a77b69052e-50d62a8d633mr123568261cf.48.1775337720805;
        Sat, 04 Apr 2026 14:22:00 -0700 (PDT)
X-Received: by 2002:a05:622a:40ca:b0:509:26f4:64f5 with SMTP id d75a77b69052e-50d62a8d633mr123567911cf.48.1775337720381;
        Sat, 04 Apr 2026 14:22:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd2187070sm20755501fa.42.2026.04.04.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:21:59 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:21:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/4] arm64: dts: qcom: glymur: Add GPU smmu node
Message-ID: <uuub6ue4yvirtlg5fzgzobc6y4of7ipud5xt7enmifpnbhjjxo@7gsmb4nrjr4i>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMiBTYWx0ZWRfXwc2QxcY1pr+S
 ULBbwZr8EKN+pPd3CelaL1HBniJCovqQVgLZifalXemA4xAHBUMO0hc6WRXbBkOcQRy43tvZJUQ
 /7X+OtxIhvCNNsrBVRaGLPR0lqaqyF3+oempXRvQIPN7DeX+GYsOz/vr5CVWlT2sFsqR4FMM3AA
 49WoDadamItMMcpW94l6z286QvZ8n3GltU2+CELEqor0wLNMde0kjvr2peeUE1u88j9Mf9XHVez
 attq8eKDOXKAiGb4YPOkkim0ScZeESa/VkGoMtsivVq2B5kpwZezrcXDPmfitD7D5K6SqH+Yyfe
 CSnVdi4KVOqj5qFEM+h4bWM46t19jlPdXSMrwIo+lBXbyrx+6mHUqM4TmTWW8QyiXufUJLvRQxg
 uNr5aatyfdxT/sMnf17eKUBFSIPRqlNe4eVA0OLuoAv0pOJIpCCS+A2OQzOnRmTeJXQO1x8p4L1
 JtZuWxdBqMTYfhqLmSQ==
X-Proofpoint-ORIG-GUID: -qXcmEPkqbFxBA6ZHW2iLa-T4Hp4eotk
X-Proofpoint-GUID: -qXcmEPkqbFxBA6ZHW2iLa-T4Hp4eotk
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d180f9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040202

On Sun, Apr 05, 2026 at 02:33:15AM +0530, Akhil P Oommen wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add the nodes to describe the GPU SMMU node.
> 
> Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 40 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
