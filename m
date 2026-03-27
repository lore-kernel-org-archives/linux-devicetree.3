Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F6303CAE
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625036; cv=none; b=Nz89sy74ErSbdXRv/RcuV6PDEEoe8PgBBm1oqdHeHt9B33GIyVDNk1ATCOz+VUGEHxdBBgTn+N5ap1cixPDF8bOtX+yKkQAkuj2kcV0EbieXZrB6N3fHO5O/QMfXswFp5rMWO7SQWRfsAd4rylVsjvEOKuCiSgeSCO4yYouG9E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625036; c=relaxed/simple;
	bh=CBQ/HTj/+gacw7tT3f4qCTthPnRKgqCdg8MA3D487EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV0/oA6V3qEIIdJnavcKX4b30r5ZlcaSwaKSaG08DsmiEULyw/z4d654FMmUHnm2Hii65sTNhWxvxRESNfYa5yGYh/k7WRc+rraQy24RBSv/dMYPcMupswYdXMpmnkCjXPQY23RTpgFiGikxmO0fooe4WxdweMJLWuZgNVTGd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouw+gMEk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/IrqiI9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouw+gMEk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/IrqiI9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhHh0881573
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cJkVB7soZuEH2OgjtJtIPgf7
	yoWxt/8TCdmxiXUUzOY=; b=ouw+gMEk7leJbxOPZqtLAL9CCBgFJwEvWJZv+7xk
	Z7KaPbkQ0empzPJKynwwlq7GGqwsGhcPepMNI+l3VHmXsf6bnsvyhq1N7IvounGT
	LpLUZb8HoawEtvoxoJE37Yl/PQnu7qI8JThzh085dBSdJhAy5NA8zBI7PrsLgG9c
	/WMVXebZ9wD3XYJddhTWFmh9xW3FCyYzZ+1yaVDBE8Zu/vxbNmjltw5oJuD0/CB5
	TzzB2xVxp+T5cDawDEm+S64AZuyewR1JzTEIunUUK5N3eGl+UcRHVZ64j74EYoYP
	Km0Tsc71GgM5PoWybSf8NH/DRZhD/5Xc7yYozbGUcFBgCg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6kb8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:23:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so54910401cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625033; x=1775229833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=b/IrqiI9hFMbh9ya5GXRwjKLfusb0zPQazs6gaqtaRuLztKhLUcdRU4X2Qs7g6Lshg
         /pZCs0WSSXSPHOksek0hU/wOsy1iMcQdjBjk1Gthf7cFZtnbFAYPDBZKpvRx0Ro/eNcb
         n4h/GR5+C9/Kwobm1n89c/0ycgAQwFUTQ+hcubUkQB8+aM+n8Etd674UptWXZC6lQJJP
         tztKdbQOKZZY0nkD3ACZMSAOslfQ2SIzlVH+aW0PqsxOwg3TPp/JgADtuj9Er9SeWlK8
         JzxHArXFtNEcypq4qD+Zzr7lXt6I0Ef6LjwJKkAotb+RmrBwiO7HuQS5Nqe3xnO9Hbeb
         S1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625033; x=1775229833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJkVB7soZuEH2OgjtJtIPgf7yoWxt/8TCdmxiXUUzOY=;
        b=HvnyPLScjmdZ+LayCLLh6+oXFlzA7xSdkkomTTgYtVHMGcHySlnAwjju3yAeFleDYN
         DKog+qzCG1MKPqP+V9ygbbNxGbAGYvQNtBWKrR8U3MoM0w2F4ZLzFyGwfDvpH47Irpkr
         mm2NBEihgbZEQMzLjBiAtpbbIt+AHNbQAB70NXX1ACyf0DFIoRvMfXwZGmR3NfqghvgP
         COyw2H1ScQ+83sbnZzvf0BoubFrRd9/whKiKHZjudWrJdtVp/B4Q7kc/FngH3MHUfnKs
         yJBezVu6sSRWP7dXVT6NlV8N9qMAHXUCcwAtt3d65v4JLLgy96ROicQU164iY3LPyr0u
         F1Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVIzDKgiEioRfXv2MgM3SLH6dbKGl8wOjA88og18YtESeVRP7G/ibpxsz6mU+VZzy06WhkPJCMFE06W@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2L6WPe/uHOQSokMxX3WbMX2fQpKcPhtWqay9SLxnxTdFEsANE
	YEaOf5Ll1WEyjMTNJ9IhilMEKYCtjnj3Doxofi77mBcbAfBW5iERUjE9UAZvftGAeAb+TU6yoxJ
	qfqd5B5zZL/dAKcNUGp/R/3M51OD0TLzgQ3GGHT4oAxhU9+ZdlOmStWEiykDaok7a
X-Gm-Gg: ATEYQzzTzlNSGHS/UCImC0CyEP5DGNQ4ULkJwADGVuXic3xekq+jKKlKyx3lhMsfJVc
	8WGJ+5x0avsYAWn97BoeldYp2lgF8J3xaFIPmT+pMtQAt5Gsh0rRplg/iKiW2LKXu0j3oAu2XqU
	75tiHQ7wmbqMDwGJ+aBRayWCHnoRblGMZibybS7W0bpVRJaf4b6i6BV+iCmG6org/cxH5FfdWjx
	KLOhXmsUZWPWy+T3Jg+s2p1q1+LmA7FrUxXsOE8taS8sDzdxAhajR1jJ7vw/mpNxyqTAWa+8/J8
	dBy/Iv/CmEJFCBcxpo6vANaihriD9Gwrvqg5UWrB0SkToNnOXk7TTkl0qzSHJNJTF7W/8VqPyCD
	YqILnNDNy8kUcMmW03eD28mQxv8XVDAeAEQ==
X-Received: by 2002:a05:622a:5c0e:b0:50b:551d:ca87 with SMTP id d75a77b69052e-50ba394afcdmr35393691cf.54.1774625033307;
        Fri, 27 Mar 2026 08:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0e:b0:50b:551d:ca87 with SMTP id d75a77b69052e-50ba394afcdmr35392991cf.54.1774625032756;
        Fri, 27 Mar 2026 08:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2aa3e64f7sm684285e87.62.2026.03.27.08.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:23:51 -0700 (PDT)
Date: Fri, 27 Mar 2026 17:23:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Message-ID: <4pzhuqyaxemr6tde2duzg2isxa63nfxa27le4vpvohxcjb3j6f@jxlql5yibs4q>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c6a10a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BYiauv21-j_JhOubGf8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NGCLuebQFVl9MMnJv4zlljyN9-AqQ1yW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfX8qrZgLrhAmIV
 PUt0IyPOSjT6D+AG+ZzqFOW0n1pcwDl7tEdXhG+QqjZpvvtZr1kZphQ6Rf83kYvChgqDZ8KIInj
 CJUOBogcaJN3DHHlJhFZQ3tQ5RtJ7wMr0niXd8cfD3lS/SQwQgwsNs03PEUfpMauZajU6tttbPC
 SHOKgdV5dFKGxbBMMHJ51Unsvzf9HF9ynM3isY+rdq8SCR4hIVwvWM1Ol+aQX2ak7XZZQragnNM
 IDuJdprOfW6hvoCXHxEK9AiZTHJpFTa+4sN7+PJzcB2OLH0ucyIMZo4tcDyXfwmJ5sMy5sosMLO
 3z45tyQd+3JqHwEga6wKNvxuAUAiiqxLL1tmMXTq3NPgSIpcbrRSqcIUisHm6gzhMYApU2jKDUh
 LMXOSAucmPLYz5utTddkJQtNf7CobVcfpSQE59osebg0FD9hG6wKkdNI2bwB4vdt8q2tV4pIKLo
 TZFrmuMUDaMsONozKvA==
X-Proofpoint-ORIG-GUID: NGCLuebQFVl9MMnJv4zlljyN9-AqQ1yW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

On 26-03-17 17:57:57, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
