Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581389;
	b=OCIp+2syB/7XdyDFWcDE0aYynOA0QNaC2mDbX6/h1/zQHuv0oFRZPkXcv5u+YGNwLv+a
	 ERrJj2oVEPty+XvQ1wmWpTDLWPF94nHvEofmssHpAyNJSVm60gJl+33zNYi/ghgzTgnyb
	 Hq4Y+kzxUhjOEP8RnLR6C4v1f1jhTkttpD6IBT/hAPxBVn6eROao3Vjb4A7VOMbxXg7Ce
	 BAU3uB8ubRH9XGdUl2fLzCX3AOmpJkvl2GrFeZ94x6pizv7J/bDrP4sQJxLcoSSG23rom
	 qGEFm+6+2NgpUPAdOk78lcTn4wsoUSxo6Nim7I9A5BqY4tgormllbvRxwx4wdsAUIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581389;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
	b=ZqWORo+kXeYrCJDkWkPHMj9r8bP1MFXn9h2kv8oFA4Nk56JWxw/VGd9ncM9iIXCqMP9f
	 +bMfJOCYsiFJY0NaGLU4eTCPfMQdu19o1pHx9EE48rizsFFIX1jlGOmvdTcmJsQwA/BQA
	 7Q+bOEPLcRaelVySAl9GYa/PvrtXxNNj6kq4a0+fWQskGxst2tT0itenL9PN4oMZDnSk3
	 +KUpDjYIPQuEe9Ey6g5QQnpPW+iWjve9eO8/pckbAi1Y0uCYFp/vt5mtCUJFyrYbc+xyf
	 +fvxj3yaVbWA4SlmK8SDSFfzKnDvfZHggSUM+MLMaIRYu2Oeq5KgCS9akZALgpbKP/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlTyuTus;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2XhufjE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84089606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84089606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlTyuTus;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2XhufjE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kaD3015991
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=; b=UlTyuTuspJTbmMcH
	TbrdWoyGP9Fc4ksN8AP603nQ5JSMitl6SGjKkcJL6A1xjJ+RvA5CB4Buzq0FYP6P
	zO/EhRjitSuLTpqfPj/KiOqAZUouh1jnh2a29eP0ZMWFBaAfUiKryACuZmjToJdE
	2+FB8XRZmYUKQupgsJ4TenV8dLAldxr+Mj5TQc+aMatuvNZfCsWHVqAXWRAbxUrq
	1tyUC1rpg33NVSZeVbqngcKuycHB99rNqcs/FMRbujq5Lpmiwi7frL/ChtxIHlwz
	rZqPFNvYjnNBGfgNjsk2MeOWjCeJ55jUug1EkcHLLTRg1rh+JJLh+EjZb4kh2q7J
	fztWUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78rqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 11:16:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so862614a91.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581387; x=1793186187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
        b=X2XhufjEkGVtYy4/0d2hnzt9Pb/ztJzf0nZgZKmXMIWcHrMk4LumNrHjx6qaqjnAla
         PB2f6k5OSmlqUdXhmteKkd/9upF3zY6+xI3ebae8ablMrrcmXhxbmF9iVGwdkBK1uhg3
         au/1r7H84xLfQmi7dsu5WjX3+zPBFRFttSfzn3QvEJYnZ+sOKaZJ9A1Q0SQkVF0yZYJq
         icig0ROEHeD86LcodXb2xeJSaOwH3yzjIJ1HLXOasth0E6JjDsCAz8ZVXYQRbdhuBUDX
         J342jj4aqW5CehgFpoJGHUzaiCrHWBUlfZhB4do1tkl1QwHygWtD3SUwpbmJj6MmedYH
         cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581387; x=1793186187;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
        b=pZgQyYWNNdOse9F341+YRn2v7TUCrzq3nCR1CGTWRHMRg4GTSv4V1YIHQkq5QiTnLF
         L8awzys3Qu9sRo0BC4cm+PsxGIHPjY584BRMBK9e2ZxWa4cFLIHzZDXmmSRy+Ocr8PeU
         1pS79Btir8KmlAF9Aam3EDdI1bVnWDQwIqEXHD4F01y82Fs2alNlSgoC3l8WQjVdmPk6
         ap/fi9VclUvxd/yrsKjExGnpcCi5RcMxd6xAH77h2K+8UQmGpoKfqJdKdLf9Kt4plOGi
         EwOXPLdOyCRBLhTvLIXoWpfO+hHKMv+ZeVqO1ogwXf9EuRmm7OeMIWjBUvXjUs+ubX3G
         rCSQ==
X-Forwarded-Encrypted: i=1; AKwUvBywJmQXTkxyesP34zpxxcC9va5wfHGqLDD2cM5BRsBstcKvNSuGKyRwouYGFlMcf5VE1I1ItdDy059a@vger.kernel.org
X-Gm-Message-State: AFq9FYIBU9wH5M4KG+KNDH+vDohVR08MRL2hRkaesdPFfl5QqqsNYe9F
	g8jnMIxv5/Uhv8Pbs7YJ4L/xRPboC5S2npxNKJRzpjD8m30UtwPZP2lhuifkDDxIIjSZPmyw185
	rJCnLVif0rjp3ZXmFZcU1+Mdf7Z9eag4b3ASgTa/mTOCtJUbtLxC/lp3UMd5VDODe
X-Gm-Gg: AYBFou2TL4UWEIQsBh72Tgp9rAyOquVWkeuiFbiwavRkq3f2KafiXoq9xS/NdDiGymq
	jgJsBtfrptlbRG92MK9T6LiHyf9ctOVd+pUEOAiLuY5TdnckKpplbfET7194Y6RzyVeCB1usSNy
	WGua1AJtyPiG6vMKHHgRpi46gYkjMg56XlqvHHoyduwmyWt3Gr6PddcV434apSC+3hGWFCkeWtF
	HjhvR27cZsi+izCqQK9jDYxE0FU+q+CVJF4vMEs2T8OJYWc9OdAZ+El/jobS1BTtRcHuc60GucF
	iI256Cjjwzl4g9r2RG708JZOPDo42Jr1dKru5YHppCT/WFoatODyEtrAeihne5FCEjRwhCP4gAy
	MjarHJjOxPGs8n5JS7cOFF20OyM7w
X-Received: by 2002:a17:90b:55cd:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ad86f49b66mr1399590a91.45.1792581387566;
        Wed, 21 Oct 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ad86f49b66mr1399567a91.45.1792581387068;
        Wed, 21 Oct 2026 04:16:27 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80912f26sm3948228a91.1.2026.10.21.04.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:16:26 -0700 (PDT)
Message-ID: <425ddb41-cfd7-4032-8666-0193ab6b5819@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:46:17 +0530
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
Subject: Re: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
 <20261013-tangible-wakeful-swift-a38f8f@quoll>
 <20261013-honored-bear-of-cleaning-bd8108@quoll>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <20261013-honored-bear-of-cleaning-bd8108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0I9ChANxW9hpHAwyE52Ymb2Amk6OikyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfXzo9mepVFjQvf
 PwDeeOozHojaowiXuNxCEwu4o6ot//e5VxaOokVu5ej+YKYPJjRv1T0Oe6j2leitnlxSByY5CCW
 HZ6XLpycUKw6lLi/D1l9QYLzfIIOLkn7wNhAnaGG3HBK2kshDvI4qGHwbpIkKzq2btqIyOtHUyc
 Z5xJlfG0/v53r+gpahTd8dU9KeX/0P95u0pew+gKcSAjvzZBQB9uIcDNEvQSuRmPrpfyHQRfEnk
 PxgPj7C1chY7QWQhctX3axk9HZ1J/QRLXbBpv/Dcadyth+DZak3cEvbDdZ/FksDpmI3cEpoS1wb
 c82Vq7lSeNH8oivDwxyRPiqnvYPCDKNvZnStwQCCBjDpbDBOhS5W3PTbYP1+PpVZwy61KR1UyTG
 4BnliKJ5Gx/DhsEsq3cMzcf2gTq68cpDcjqSdR7pj9wGfI5yANLQrPVvYVCiTNGZRUiyqTSCpxv
 SbOKQK0Wm2oz3xj2Gew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX7XqMDi59UZdt
 XUDehQiuRqAgsWpqiFMeW5/aqHdmLDAnkSXzzwGtRDz8es/0PrqRdE9uEoqW+ItwWRlDtCtOJ6h
 IUCFXxhFYZgye2cw2PNJiMKvU4oqrC8=
X-Proofpoint-ORIG-GUID: 0I9ChANxW9hpHAwyE52Ymb2Amk6OikyJ
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad89f0c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D6Kic2Gw2dsiznywmRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210044


On 10/13/2026 2:18 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 13, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
>>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>
>>> Nord uses MDSS 12.1 with two independent DP controller instances,
>>> each exposing two DP cores at new IO offsets. None of the existing
>>> compatibles match this layout, so add qcom,nord-dp.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> Do I understand correctly:
>> Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
>> driver limitation is preventing compatibility?
>>
>> If so, let's fix the driver - just add more addresses to the
>> msm_dp_desc_sa8775p array?
> Or it does not matter, because top-level MDSS anyway cannot use
> compatibility?

For MDSS0, the DP register offsets are same to those used on SA8775P. 
However, the MDSS1 DP register offsets differ from SA8775P, and Nord 
also utilizes a different MDSS instance. Because of these differences, 
we introduced a separate compatible string for Nord.

Are you suggesting that Nord should reuse the "msm_dp_desc_sa8775p"?  
This would also pollute the sa8775p's desc table.

 From your perspective, what would be the preferred approach here?

>
> Best regards,
> Krzysztof
