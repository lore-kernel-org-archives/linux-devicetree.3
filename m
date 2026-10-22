Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663988;
	b=sK5Mo1EWN3ZGmA3zOtPQ+CpP3yeF/qNr0MiNnRAotYJKBL1Wiko38Ui2VSPZ+tTMLlWU
	 7FGjdfdsZZX7fncxTOdWoWZJLJKdTZP8Dc4GDvSQKE3pEcmfc33JWF7G0mpmE82vQq15F
	 FmBsV22gmR5e2b1aOijX4kPAN22L6PbUw8RcQfA6WhxM7jFd6iSnqlAywHJ9Immh+4NBo
	 2ykPV+l/BzGZ021OYpZYe8LMbbbo+9ATddVpJQj26Nr8dFArUWSZALPvQR5VnKPUa+Jqo
	 RV0h9f8fKogIU2xytfUZcWVsoBizIOik2BUvqwwE1oIkd21vPPBqH9t1Bj/JT0pn2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
	b=rxpFgfviMolmcB6Z7x5Dm6ysnBCBbFTSjkzgbmiQZLADUUER/1m8ml+EHu5oEproYTcL
	 fw+yJBxVv5AmYbrUs4mMg3al5WxPjYUXR60VUIjiOzkKPC5xJTui57TuJkrX7l1Xpdme1
	 S8v7xnVk1GakgOFsLjfWtBGe36e7zwr7PRLUAO0W8CH09bCZOsECzkVO4iyarSU+dMe8W
	 +LBK2XxjRKNoX90uGwbmcTJ26N1IrBgVHk6NPU9eli/7wn7E7a/90DlGDLMbpUjvKnwAg
	 Zr5ZHZIQGOmLrdWiZ2k8z+0dGaLHUwTAtmuAaC5i0EhzB4cj409uOA1JtAICvaz8GtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jmp1SGKl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="WShl/Em3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1EF606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF1EF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jmp1SGKl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WShl/Em3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0XPq3923220
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lc4RpHjBbggsGE6BQ9ENCcFM
	CUrX4E7aPdKaqKzrj3A=; b=Jmp1SGKlOyA6TeaW1G7X84+B4fb+5UsDjsPVJZVT
	lJJD6oPavf8hKUrCcJoZHe0oQm++IhutkQKSiCtOhNsGfvvGVpIrtVdDdNJO0OlR
	V8CQPhumSfEZZpB8br0wViembKYiLk4ChVZQJuv6lSCP4rej79AuYy1dfBfU/Qla
	T+6W/ZBEgNFTDlQ+CwK+DcalLqKEVbGCZtK9kC2zGrarqeCN52QR3gOMzoLPOTkh
	ihPg/9hDf0O25Z5wqj5RbvkCehd+gtRIZGnC3iNs1DZiL3fYbwpWOEkN1KE9jSc3
	tl2C7LJeUUxjjxIfIvVYz7PKPhLtShQTG6Qr+PsF35NgnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bhupf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:13:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533928ef33aso23299981cf.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663986; x=1793268786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
        b=WShl/Em3RcLXVj8SbGJmsMEzlUFzXKH09Vo1iGc9mXjNDiM09wZ3wTizWQ/7vd9Ctv
         oUzoNB1Fbt4ul5OU8Dx097br2fqA3+SCdWq2kM2Kzwr5ddP5D1VAQiyVxxJTRHcwW2mB
         orflBSg7WfeTcYnIF2hu3Ky/d3+BADrqrwkgUQmxMPJVaXracn0lhjw7y4sq4SaaffjU
         Qpuw9cBvFqdg7psWv2HG2VD1TGQYhVomBQFC2VKphsBz94TBtLklMJyoiLsTVxwVQCvO
         tfsBKq4sRweKsz6O9YCMyCan49MsCfGRCMnwNVTDmXK4CdceQoTAbkP/XviULV1gTPfk
         RzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663986; x=1793268786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lc4RpHjBbggsGE6BQ9ENCcFMCUrX4E7aPdKaqKzrj3A=;
        b=uRO1XYh7io8SOKu5AWWwEaoflLoi+iGhXB2JnCw4fVm8qtJLcu9LHOSvSDbGx7A+Gb
         WbRCo0Mfkx8o/fyGOFDvD9LyKZW2M7h40THwPYSaVwlwvLYXp46CG9IDOFqRCHTTBXfs
         UsPuQQzKd7HQ3MHzBm2/uHhZrwE4u9rpbZ0yU6uzD6M1T6rIWoM0pucdCRPowf6W/TNu
         FkqCvi//wZy9bD+h8TAUbEGBM9drhfRwlK0F9Yq3q7rizNAIeaqHTU6AYdeWBYtTU6K9
         W1LC22D1dMV8Sk/cOceF3eT2dStrRZjqs+iYkaW8205+eBxAWPaUYHqOCDj7CHPpeeIV
         G7eQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6azvCN/jLYf+vkgcVSrDtqb540MRs31Nd1Z2vcmAT0bb6j5/b3jVw9jGN2wX6MWgltb0yXLeFtzxj@vger.kernel.org
X-Gm-Message-State: AFq9FYI03ThprQpaH899CFJP+j1rAaYWctl2dJ9aNAfHHZSOK9qQc0Hs
	K3AYzloSjAlt/aMooyFrO9ETkvP3tamygYv4f+Z4gWqZ9p46E44cbV/FCrNqltKQ31g9KfW+mU0
	ORfGurGAZ7haWOs6/nayB8vv0oxK85ht7P1ONvSt6qB5HCTygbPXPfJNsY0tG8j2W
X-Gm-Gg: AYBFou26t0hlXMrFkRSxoiau5WFD0X2kWZJh3UrQ1A+4GQ4kj1LR8lJ4mmRFRBCenU7
	pBPVNM2b5mMHYaNAp3qXFPilNKtjhE24lYR/EBomWfhy/6Pw6QGkqTs/9YuvS9QLUcjhxJXBBsF
	SEtTnIU3k46p6ztticXnAGYrLfRwQnVbpoTDj1io2D96j+1kUYT01BvJYxWWq0IK6nGpOA2/e91
	Awvz8UfMQiSMT+SNhp1rN4n3976gHR6BQkukg7VaqRoq3AyBwvYyWs9gvmpoCcq2FOYLMfDQG39
	oZ4peAfHiOZYGGDMcPT+t7aR0/OXngwjwWEF+n92CQbUsAJ2zvh2Wl64h4GCUvGV4pHl0sxGgr+
	prvdfiazR57MTLhszm2fy0onkhgZJZN/DpylN5gYYXzMLytIB66CtKdy/31G1ZnfgzlzLlseSuc
	RrVZRAdqAd2ktQ
X-Received: by 2002:a05:620a:6087:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f57f93b69mr825263085a.53.1792663985778;
        Thu, 22 Oct 2026 03:13:05 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93c:c08f:ecf with SMTP id af79cd13be357-93f57f93b69mr825259185a.53.1792663985280;
        Thu, 22 Oct 2026 03:13:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa4b90999sm562304e87.68.2026.10.22.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:13:04 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:13:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: Add DisplayPort
 controller
Message-ID: <d5whwqc45gtqwmb26mh3wi4xdls7fm3wxdszo43qb3z6rhnj4o@22ghfqzuryur>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
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
In-Reply-To: <20261022-kaanapali_dp-v3-3-b5ae8e6083c3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX4JxqT6YZDA1I
 hUSq5RbT67jdTmAk9QeLbtAg54mcljcrRJui7oIgrBQ01ZWKGjBb1t13terefZJxoaanvlOQpPm
 drd0RtZK++hDsKZgARAV5+H/uvCLFbRCXNavV5ayR0gGEU3bzb7drHlvmol+yJCspUOigv231lW
 YVHqWH6upkMymOhqMNtKwEwtxwGGPTJ30sWoYo34Hvw1opWAEWzsc9auT68r3S7Mj2lZ8QiZ8Sn
 Wj8Hvyz0c3mIYveSAGr2WQvFD9fqbdtcZCBuvrQGsofuoXJFUGufR+Zo2fIx1/xEkchdG65qCkt
 N9dFFfJoYqHlcQed/G8/G0dDqCp+fvU6Nw8xADBj6Q6dEZL/1otufJGEZN/8LHZqpYphj9IkbIQ
 Ecn+SHphRqX2aJ8ntLNlY8ZEDjxbAssfFTVYbuoN4XX9+FW1oa96xXPP9L4oSa/7J3nATfYqw8a
 iXXGfvaTFCkxmBjfswA==
X-Proofpoint-GUID: tO0PIQSYgvAKS-DZG09zyLinQezRaxvQ
X-Proofpoint-ORIG-GUID: tO0PIQSYgvAKS-DZG09zyLinQezRaxvQ
X-Authority-Analysis: v=2.4 cv=CMy/zhrD c=1 sm=1 tr=0 ts=6ad9e1b2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=S65zN7q3fX_PurGuIfIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX8nylVgYfa8Jr
 5SdtWq8wSUgxTrHAX3LZO44fu0LuTtTdVFTOHocvuPQhTfFiEQwlky9n+alnQwpzQGvmjpeRDQD
 eHuePuKSfUFdAVm/DEvUvL5gykzX/8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Thu, Oct 22, 2026 at 03:19:44PM +0530, Balaji Kalkonda wrote:
> Add the DisplayPort controller node, including its OPP table,
> controller clocks and power domain.
> 
> Connect the controller to the DPU and USB/DP QMP PHY, and enable
> mode switching on the PHY for DisplayPort altmode.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 90 ++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
