Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6890388393
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776673407; cv=none; b=Agr4cCRumFdKbTnfpxIHESfPxQrUwW6S9OyZ/HI4x0G3utPReMdBvm8F2ZFX82VbnQYWPB6MD7voWHCqSRsrrLJGwUAcLnbqDLShJcxmfarz4EoLg8RAHqKn0To0BIKdHq6f2mi1CeVg1U6kMfabDIklXfxDdY82qrAjJ1evhJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776673407; c=relaxed/simple;
	bh=0CwvkLCghvI1PVZevLuiJYR05WEEBn131AMmrY9kUzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7q9HWI+Jd8LKJ7tWfC28ply8CkMeTI7dhgVc8fa+0K0EE02hLjM5481dR1/00klPINrGbXOohHwKfc5qCGGj7lGVHGpNQr0ksgyHqozlbxOvtFAav0ezjmAzEmynslEivpP3dme54+ehRL3pCPud7n1dOLQ3p0ln28MPQLQn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CTQPwg5t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNg+nT53; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CTQPwg5t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNg+nT53"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79VBV2675344
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPr/mgvvMG4JgNqktiinFpILBYdemUMXeGLmKapPpaQ=; b=CTQPwg5tNMc/yrxw
	UiLoey7+/VuzbBI0tcxr8V6D7iUCBxM5DhaqwxLGHIQpWLuwlH46ouETLen6r3Sp
	UJxabM9CX0o9JzE3aEQEI7Hlqwt3PyYMIIquD5W4J+5veYfyjP/xBAOzS7UrD2kd
	Rx6LP/2fd9xMvNRdnctJsG4zDKpjTZwQlFfyDytDKQ4msF9oaM+nb792ZDGy7ZQt
	igG19iRcRNVvgei52CVp6huT/Px+CuChRP5nyhXIIYC3H8jTvf14G9rPJSTaNpfy
	+myC1hmwKJVqMPBVvXo3dBYygPqCXNutmhJb2M5F38E2UeNus2rC0FDfkQWoMCwo
	QTRqPA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y652cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 08:23:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f1b94ac9dso879111cf.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776673404; x=1777278204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPr/mgvvMG4JgNqktiinFpILBYdemUMXeGLmKapPpaQ=;
        b=XNg+nT53rlqIfFFaxQ8glIfokMZXD4cu4E29/egdO58KjoeI92s/H7pBYRg1pNSKkt
         nbKGHGCwrC6YUjUK6cZK4zKXjPbDvClMdthA/9nBiuM/gYmw75Rb+TU9jAGmrtp8M2jy
         Tgkr4OG6hu+/FmMFVtRhwLDzARnxJ+g5fZGmk88Cen4NtL/IN6qmLm1yxmLKNdk+zHEo
         +WhXOtE6Jp9tFWvsamkNPHlu9WMlu9HLp/mrE0q5VZe0HbTG2xU6H3460TCiMT4N1uwH
         KiOg/iGODEiYbzQlDHJaOe5bW/6hUUDC0qtuEaM0KuthxulaxCnUYTdploIdeepoXCT8
         iwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776673404; x=1777278204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPr/mgvvMG4JgNqktiinFpILBYdemUMXeGLmKapPpaQ=;
        b=r8ylQMOcHA9nNwsGWvMmEDHheOd9LkEoiiOiv3vslh8z/Zh0UOooAPiIfRJnzf7XWx
         HrTYurZTmQ44K3cQskkcXBpaDBXsvoJvExnnlnjTQfwZSbEzbAWfQiJXy+4Xv+kp8Ulq
         SbDXKAUw61u0hpV9cEUO+nzjpk0qHMLpCHTSaGWl7F+eCtPZSQSMn1dBSbv2vEcW2D5q
         txDhJ59Ii2Ag9ioh5S3zaQ/3H+3ltn2w+madwsv/3TMhaoLZQ7NCZAeW7/HAY/cr3hxm
         jLI5OqL7MpF+X3TXOyP5BnqVHPQBakRHVlh2CKilqldeEZ4+jWUm5s/tsa4sQ3EKS7rm
         AFfg==
X-Forwarded-Encrypted: i=1; AFNElJ+QsF+yAoqbMGWtFGB1FfO0VYp6OTpj+QS2TJclSKvvYj7dPYZVaryRTA2DipdZjcbJbsxx1op2o/jS@vger.kernel.org
X-Gm-Message-State: AOJu0YxippgJiefj6qDn5RrO2sOi6UGR249laKbuH1mpL7tfzDm8T6CU
	3b//xTfbUJAGTicqRKa4AnoImHGGkezzxG9trZ7JQhx2pIqY56Cl05OH5h0kjpfgEaPXOloqL7t
	Vo6FOpqeVH5X4dTf0S7Oo4li7yBMBfqTyZcYyZovAsQThwzR/+ADjPBDnVI5X1xEf
X-Gm-Gg: AeBDievCWF0lKWVusTFtzqWzRSrinq/ZNF3ulUlffFGJvRLPlsG727ZpgC6prW3XfWy
	0pO1o2aRBEMZCDABnPtogXfFvQn+Y+Lqx7klnyWQfCUVDHmkz4LlpcLvLU8UTuVbH9V0oLU6zmK
	vDaa/lKW4RXg/zyepvowV3n3ato3DQJh2rNyatFyuOt4moPPbj91Uw/iztsLg8atbfXdSyi2d4X
	Aq6k5PscnoGFZWa56G3QvF+YMHMih7/Y7lz00limv8lvXksbqhmMkrufQfvQAaHHSMOMVTyTSNR
	+E14c/YQePVK7QTn1Dv+raC+QQc1J/xvIojwgJFL4zI+4AFVbuM2RZElw14rVpZW8Hpj78Hybrn
	lDz7OZKPNPlp+IQzpCrMaNucYx+IWsjzUNs3PBnkBe+uWfF2o+Gbw3JPEBZcANKGZuyD3Y9i/bp
	wWzlldygBhtFTVjw==
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr7229601cf.4.1776673404093;
        Mon, 20 Apr 2026 01:23:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2587:b0:50e:a1ab:67e6 with SMTP id d75a77b69052e-50ea1ab6a40mr7229351cf.4.1776673403693;
        Mon, 20 Apr 2026 01:23:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba538429115sm259109266b.15.2026.04.20.01.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:23:22 -0700 (PDT)
Message-ID: <0c2425dd-0ba4-49ac-853b-b157eec1fdfd@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 10:23:20 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add CPUCP mailbox support for Qualcomm Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420034932.1247344-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x0jLa3qZt7_WGP-ag-S70NppsFnoxCA2
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e5e27c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Ivwl1-a15JezJ7RitgUA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: x0jLa3qZt7_WGP-ag-S70NppsFnoxCA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4MCBTYWx0ZWRfXyNhafCz+/Fu5
 YOs3juJaIqRc8Y590PSmEwWQ/2xhPdXc08v1E57RTchX8vVuHAeGDpq/H9IAW/rNdH5rLiDUpwv
 M0QUKk3Dz1tlW63W7i7GpD7E3LuVoZ6E8wgqm6Y+WBIwBJ8l+cKB7rrvfTs28+KAiAPjlne5Xqa
 Sd1wSFeboMsNRk7bTbE0PZHOJTbt0AnpjPrnibmEsBQob+1q0P/5ORk8+vyje4QMEJQ03a1cZTj
 h3u048DzuT+lRsuIEcEdRlQNLW+DLlHyXI6Ve/VB3XF9coVSY6X5nVKoyYX4yfzqn80VgwDY88G
 DeOE7hlij774gQxS1wiN7mtMMzoKLun+j+ySYG8OxlTWAP7lf4Eq7xrvPYChVHjvEIh7FUjNwFE
 DYnUUaF36eyj09AlV6hBnD2dXU4ENUOuHUoeS3ZqSETsDr/5Be5LiMh+fVz9t31xk5l3XauwG4c
 4qki0s9GwrM+Ac+1LtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200080

On 4/20/26 5:49 AM, Shawn Guo wrote:
> This series adds CPUCP mailbox controller support for Qualcomm Nord SoC.
> 
> The Nord CPUCP mailbox is functionally identical to the existing x1e80100
> implementation, except it exposes 16 IPC channels instead of 3.  Patch 1
> adds the Nord compatible string to the DT binding.  Patch 2 refactors
> the channel count from a hardcoded compile-time constant into
> a per-hardware configuration struct populated via the device tree
> match data.

What are these channels used for?

Konrad
