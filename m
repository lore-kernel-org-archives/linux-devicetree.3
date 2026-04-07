Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C139C00C
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553165; cv=none; b=eWEVGISOZNMRWRV98Mrh61nVQ+tIyKMaLxFuQe3ZncbfMPBxg3oHocYq40ul6Zvgavc1LnL8+ODPHsUFM5lfIXtdyuJdF8MW6imp8ki43VBp09sb/LyOcPFtyzNF6hTO/IQ6Dfrkr1sfZSQSDTj8mOFdq1VS5pL3xCi4vBK0KLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553165; c=relaxed/simple;
	bh=m4OOjO1VZrIFqaVj+/tWZtl2Q2KKnNTdWD448cP9p10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEqXE1VitndyHakGM2jn/Z6Iz8WpvLjLU9ruepicHNk5hshRNi23Uw8AI0zpt2Vsxi7+wu4h/VU0MLPByCrxwNqma2vmfv1WViOkYm34vbzkbTkmDa4bfNMXIYjmYk/PlPbwVzJu+PITtp2cT8jLglJmWj6AL3QA+FrtZ9xLExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwOTzdze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea+jMZII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwOTzdze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea+jMZII"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376XZ4Z2550172
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 09:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZH7NJeeL+W0a0G40QLryaXbsSTbVab4mx59PHbCSQMk=; b=mwOTzdzegibL1bSr
	r/heC0qre9CYMHscG2vVaL5iFH3flu0z/iRSiHX3GR3HS+PE5grXy80vnbf4xX5+
	p4wT+Q2Z4gghcMPJ0V9zbSrWVU5TwjO3Iff8KqDoV1vYy+34XkxwBaFnuD5fd4bc
	4ZayZbW8/zgtj1JF814Xiu+TsCbzOv8BCVA1mtiTBu8MW8u694zbqFLPqsT7nCdv
	M9m7gAp1lFaXYoE6jC971Srnmh3XDM2C2PLFwrV81eTPfHGea1SnMxVUHLtNes82
	/n1YkGfhs4G3DzqpfERK4V+nvevNVxH/qBadqmWCwSu0Idvh7dw3B6VOciDLY+PK
	8QlKAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrea07h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 09:12:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d63aeaaedaso80745185a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775553162; x=1776157962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZH7NJeeL+W0a0G40QLryaXbsSTbVab4mx59PHbCSQMk=;
        b=Ea+jMZIIp8vt20on9d0VdK03PPqKu3zphrVEel6SFzAwP7gUJz+dxHQD+AMyeJu354
         GYDp2R5bbNZ245kuXRGDHTDbrml9YTbAfpGZkEIqly7YZPomNGUFiAPJteUDi8igs84r
         yAgkdM0FHtwlKeMGVyFKgZdJTTmD7OLdoBdYiY7ts6ZgcQ6vJzIZiUNM4FU6kB6ZuZs2
         22So9zniOFsVgtoqo9WLSwWr4ue5RpFIJ37CGd3g35pZbuh42jM1Mk0Lg6WMLcunUYSC
         l6H8GtJX/irVOI2H7P/FbQSnCi+3tIPc5oJLH5dFFUqbwLHw8bFYo9I54GRgsw0DEOiV
         tJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553162; x=1776157962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZH7NJeeL+W0a0G40QLryaXbsSTbVab4mx59PHbCSQMk=;
        b=grHTNlc/zQmY2HT1ADnTNWqnf6x8NVGGNg7jcfi2x3Mw4SasTQG0aoUGz2KqF8IK/0
         Egx11NmSkNyp0b5LneOC0/XEkvoWOEnsHo3Qsy3B81syeG5UMQ80nBeIAwj5UvBvXGln
         BVvDFMn6ECVY9Q99pOKDCl4ojBslHjpQPVz1qxVAmSP+RSWkEKbXws8RfZEG/eMaEbJ8
         JrhwTwGqxWalu46NxypmoAfYy1YhjxnIli2QQWvWrCPlIX1bcK+a0x7KOZJCHVyQNXKl
         98SF3ArE8CNOS5kkWjARFX0+oW87jVhGi4Pck8qFLOK7rge7xYtO2tHydk9dWBSNssnJ
         u41g==
X-Forwarded-Encrypted: i=1; AJvYcCX4DwJdNDvArDNQHzoTjUs5tFZumDbGzalhn74MbKEFE33hKrh1yAecwR6sr2e0KHmDXcG6kMpladVv@vger.kernel.org
X-Gm-Message-State: AOJu0YxzAUs/gSBofKfzPuIFfkjEnNw+XH/ddYrL3rJQqDM1OXAlDfy9
	2Wx0AFsy5ahyNpHFBXLNdwiP+EGGvuuKKaWCN93kzpkXzmUZMI371550E59Oc8fp/FXxAWrTpm0
	yQ21oTMdL1XU3RdKS1oGDribLhaGNFLZqRRUagLRT5kJ4HxyHMVPvcrqSTrXR/y6s
X-Gm-Gg: AeBDiesjgDPsPlEV1JzibV94nba3sFFiADqPFXJuBg++zX1jCMd1r/0FK1xxZZnLOMH
	Acj98baSpaj74P5zpx+i0i95hDNtrdu9Xelm+85xOUaGrjLHhZOFKqe9qlTgJcKLlEPlALSQx5t
	S71x1ucs3jjaI3F9Sx1o0Z66Nx7OC/e24ArBMbm08EXxUoDlWdG+QTPjw4kH70W/tj8IGcCNj8B
	IxqpkhJpXU1uVqUA9t94aAA9WapWyMY5kcnhzVx14qI9axTPoB6g3wAOiMWBwsRzsQTV4rd5PBm
	De9da6KH39RS8diykvCUYS+iU+BcnYjAv8lpe53uGvJz4ARZxW7nOrKtt5oNmZXgPGXFPuMoElG
	hEdwyAnK7p8Y5aWzTapfxnJoQFYD3rAjrZcbIoHwrtskWAAWQ0lcgQaq+LdKEeRP1Rmt8IG6tH1
	b/CE0=
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr2878431cf.1.1775553162410;
        Tue, 07 Apr 2026 02:12:42 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr2878061cf.1.1775553161873;
        Tue, 07 Apr 2026 02:12:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d0edd4264sm19703366b.36.2026.04.07.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:12:40 -0700 (PDT)
Message-ID: <d986e1b6-afa4-4e39-a586-2ca119ccd42c@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:12:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Correct DPU VBIF address
 space size
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-7-daa54ab448a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-7-daa54ab448a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4ca8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fzqTxgmSy3qf8bfLeY0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 6vfCqHUGCakYYs8pAzkbNG57TJU6XveZ
X-Proofpoint-ORIG-GUID: 6vfCqHUGCakYYs8pAzkbNG57TJU6XveZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4MyBTYWx0ZWRfXyAv8PVjK9tj5
 Uu3qzycPne72nCnznxuXtFZGuIsph8rkHZSxm57IRDrMUOl2rQC9hF8l6t3FTeZDFDBOXC1UCsD
 gUFZ+whsJ5eGFTt6jKpeN+rAqZDCi6Uxcgk9xg+6Dos8GZ/5+v6g3AbL9zfiYephI8U+D0TfBXc
 AZYjcPz+URPM0iaBQkCmhHqJdnileL0+ekrIBb6pvZ1cz2DD/TEQBjfnWEiVfVJq0Die76Bnni0
 Bt9Yyz1c9thqsOE1hyfNafuTAhzZCM+qEMUNL77LFh+2utIyU+QVSH4BnAqhc81h0FWdFFrQwLB
 JVpRsLVK/5ENCjlbgaFt71QFSK6g9xSHoq+cbA3waE/9EGpw+og1sl9lhRUsvINsXxyOIYrkXul
 TxVwr4+rOJ1lfJZW4CAWWfAgiLJCrs22PkzhEXzvqtaF1FTB+a4lMBxX+VKcPNpL1tr3LmPGyIk
 a3argFe8JuDwilTk75Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070083

On 4/2/26 1:45 PM, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the code even though
> missing part seems without practical impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
