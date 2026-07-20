Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC1305E3B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537357; cv=none; b=WIrCrtjbrfGiyY2KeA/g6zeCMAh92rAyngscYiYt+qPN0iRaVVSVQq2yIgjA37+uuPyx0a9VAifp4R8R+ncIbvwI3CHN3alIvO4705W14FPYtwVeHUxmt0DnZ76uQ0aCyVEVlyEEd1IGuRLsETT/SOhNaqNyw+2lWNueROhn/I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537357; c=relaxed/simple;
	bh=U4TRP4xvSNyVfdB0JhE+MCDVlr664d7Kp8RiMueRA6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVyEKpoHypaLKtAJxHnVz75xlSGDXxfw8BAZV8kS0FkUhPnJ6McOOcJgqPpMdO+JtavDVrNep3E7qSuiwMkCBHaJvwgZJxxlnW61RE5qAevpKIUtQH88gEx9N5SLTXZVSYI30YmiZVHGljtoaGNfyAzYOhg4JuIaVohrozJBudg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnyNU6K9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBpoq8Tu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnyNU6K9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBpoq8Tu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RWbR1420204
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4TRP4xvSNyVfdB0JhE+MCDVlr664d7Kp8RiMueRA6M=; b=FnyNU6K9wMRETmm3
	ffdq5+3smol+CsUirmq1E5PsavHznKprjhjpPiFM47faouIdRRKLdcpcTNeiVljd
	YafrqNokQBsGQkgCYQRJGTKcbriUr7EFjtI/jK6M1CWbZ+WtF/EY+dRLwOJPyKVD
	RAuHg9zZ/CbFi1w0wa1TTW7t1bAnxf38OaUtLrPLTAwpt+/mX/bsDX9fWgMrOUpW
	d4jNDqU0VAGWyvLpXcr9TPi1eKnjcFkdxAlQP1wPpCVu/JlnkyJ1gNHhkVooVdHe
	lJCsZkDHBzEAfEray95brZs44Mj1ThNUXgxLy7mF0IpTFnPor0Ao3IZllhA6hWNP
	GBlyCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7w75a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 08:49:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6415f279so140164485a.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537354; x=1785142154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4TRP4xvSNyVfdB0JhE+MCDVlr664d7Kp8RiMueRA6M=;
        b=DBpoq8Tu6s0jfHOHMk89OLcqJar0OgIy+KhSUHFgo4+4xjld5QD52s4PdegjqNfMUl
         Srn/t8ZNrT5cYcWVBRBia5sEk7BHwrSGLknVEHsMx9xccQIIK3VVgfMSJPsSGMWgla8E
         DdZDA1FSVZq857zThh7aOHUwr1PJbXdgwR8usRTQbwD0WTVypu+n3dt4uXkMBPAFpkJX
         wGZXT0bgmomgHObf3zyE6uHltzP81xjvHFbPdtgYjm3+RQGWBlfPV3tGMwAcEqMU/ZMc
         TDdvt6vDCIe9EjQYG36NuZR6vfuGwxya6rE1p/vKimDOWiv75DeewZbC2d6ZC9PaH39T
         JO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537354; x=1785142154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4TRP4xvSNyVfdB0JhE+MCDVlr664d7Kp8RiMueRA6M=;
        b=LzBLLNmEkPZSaOtWB771cqkFAlYWS29vQlKLpGZvUD9dxLpmu9K6m2Vv52t4DZxvyB
         J8QnKxIxTl9udxfbjeg6OOFvMeGh9SZHTIbb7npuHKXqzg4Tb0oN241Fhh79hcOMH5kk
         OPYBUNi0qPrbF6zQNn+kz9pqZ7G/9d5jzyBCQcNKgJASH3jeII4ZCalQhZFUYzjxpEye
         4AtNepQVl8W46Rg7T3dGNKr/E/nVhw5ZMW16+JaMIjrmkTO+nTy/L9WHBFCf1CVXYuGM
         Q+OA4XIDaMmlB/E3AROJFX/s7QTSMXbq7pZCwoB/tnayA/n9bO4ZaxwSfvKlF7nfqJ1a
         BYPw==
X-Forwarded-Encrypted: i=1; AHgh+RrRWN3ZCupslgO8Mb5WmKzTcKa83mytysG7UFhresBG4IAYVssVvQJ9CaOiXfKGquC0bn3XEtFLXm9L@vger.kernel.org
X-Gm-Message-State: AOJu0YwS273iH0dEC1vgtWfzSJ3eYFizrCDOaUqGma4/vgsVeAswFAou
	8Rh3WxMtdN8epSTL/YzZwCTz6MnJkRZNwoEft9nWSvhaIMAzFBpDCwXrPyqJ6vk3XFMci0NRTWj
	oK4TSj4QzhPABCTtuaqn0JoFPB2a6sI7f8sdAz/WqJgINv0UcBM05/s9e8D8l4V1d
X-Gm-Gg: AfdE7ckbN8noLS5VgpMlRPi2HEa2C9OVtDcdCA3Sj7+/dLwPbDDVg/iPBt3erqYAxyk
	0tKd/QvTWFa0Qr9hwDo0xdXs9PgybdzozeRPQTMuNTiWGj4VV1eupeQ1eumWkjdzvfsQ7y1VvzV
	mp3jB7iIaebtkpWaqh9yKncqABTfHSWXSeMdDzCBa1iQbep8ez66P/YAyiRDoG87maFtRNSlRcj
	3caudxgXnajWQRVZOsxDhxivfJPwA13tRxS3enZaq/o+4AimgC/MnLUieXbr73i95r7JkEYxcMH
	BWZ6CXEYgSWBvfvHixlll/SrdGS4Xm5ZHkVXzVPK5naW9Gqx8ftRr5vD4gizHQJqsZRegEVJl88
	aWEnNcpeQ2HIAsZk3tKL+0Bmk
X-Received: by 2002:a05:620a:a104:b0:930:a08c:cf9c with SMTP id af79cd13be357-930b3ec7093mr873167485a.2.1784537354352;
        Mon, 20 Jul 2026 01:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:a104:b0:930:a08c:cf9c with SMTP id af79cd13be357-930b3ec7093mr873165185a.2.1784537353970;
        Mon, 20 Jul 2026 01:49:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba1csm4327253a12.19.2026.07.20.01.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:49:12 -0700 (PDT)
Message-ID: <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:49:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX9hfXteLdik9w
 xLTAFUSiQluMhNEBKzLcb2Mo2DNFdsPrYlj4wr3v1f4DUuwxulk/p2d9b5XAMOQ4TNxHKZyzoOq
 ln526c6BAKpVBxrmp8Chu0faON0EcWJLb9u2f/lv/NkAXlV7V4w2xDXewMzXLhRDM8IGgMJb7+r
 te3fk8T239a9ncsRIJfBIKLy+o1rZq/YyHNnMczyRhYU91D0B4mOsoSPgRcwfiLUMOyU3veJzwy
 CjmDonXyMsr61/KajWKNYAXNIDLJdKaKomcYGIuMOkoC0BlRNstEkChSc8inXFY+B9ezjnP1JX9
 GLXUEXKHiTJhasqoAvWoX8aq4xoetT1lYvVQ/zrvqzPLWZiCxjBiZmBZd1MmCtLjEWiL7NSxHVw
 VVNwqKxXdYg8YMocSNr0tCu5Zbflu8QpXqXEJG5ihnav4pR3mKv9V6kg5JItyehFla9doAYVHxj
 c4OcrXZsWReFx8TEW6A==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5de10b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pV0AlQ-m57JRmlyrAwkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: RiJAL-RrSthVRlVZxU4idb203Dec_V7z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NyBTYWx0ZWRfX0cixbzCqKDjW
 lwVUw6Sa/SHQNvbmXn05zkPKAvC3DqYhYecWhxe8PST4f7N9ei7FL5DEqXjgkUC1qV5O/8JyvEr
 q2M8UQZE4arcOPu0qohwe0DjlXsCQRY=
X-Proofpoint-GUID: RiJAL-RrSthVRlVZxU4idb203Dec_V7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200097

On 7/20/26 10:43 AM, Yongxing Mou wrote:
> Kaanapali (SM8750) and Glymur use two display power domains.
> CORE_GDSC powers the main display hardware while INT2_GDSC
> powers a subset of SSPP blocks.

Can they operate independently? Does INT2_GDSC need to be
powered on after CORE_GDSC?

If so, perhaps changing the clock driver to make CORE a parent
of INT2 could be the simpler solution

Konrad
