Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB832BF4B
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781100131; cv=none; b=RWpfKjXFO/eI5VDJ/dGMdRnrgtHDUaTFIqRPlnORD/Jk3LQXMDNV2YxZIWz+uiAKOFpFsflh6fZKOAEZn6doGEUwYvQ92D0c2BupnGVEPCawzl36Go+JEbFbCDKA2rSAuqR4d5XqppwqWARivqHXrKrlzAvEXLzPmLFZ4/nA/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781100131; c=relaxed/simple;
	bh=4aRBrc7GMNbLZwfXxjQeKOfO0ZRIiKOr0XdQ5LIPtxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ci0sOkzAzG+ROO5AfImpAnmozMBnCpR8WnMrUdHyibziYngg50a27KuHT0BZcvIexmbkuT8rtIM7KSMNGV27xz9HJI8+QWpXyFdFoc1NXGsRlOqfM/pNiU9ZOcixqd2xwpL0bLZ8LxGuht6WhOTGCahN/IbzskNLUrXomGz3Jqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONHsKdyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gbhu0kpp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONHsKdyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gbhu0kpp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBj7Q1137530
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=; b=ONHsKdyrD90pUARE
	/25sk2508YJoj2ibC3soquTYX0XT7jbkJdCj5QPePwRX1jm25lMOc1nuLc867ZrN
	iQWTiNxcIVMFYMyUJATKI++oRfOk0LcmKLLpwlvpzwO1gXsV3Bho2pAERZYqnLi6
	p3VK9bOqraw6ns/KhZgXzyzKF2SRTf/ELxPLPYHdNC08udz7asoPeljcVcdtxXrx
	ZUlLGnqywHDSNmLoeEHHOvs8ZsxaeGafLfrh8f4o5QKZge2cKzLRacu4VHAqtSbk
	+hraoSmKLJOCET9kqVbfRnxfrFEyaFrBDhXtaCeeY3pmTabhxvpsdKnpQkrkQlQ5
	OhyOew==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh2tgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:02:09 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69e00f4120aso231101eaf.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781100128; x=1781704928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=;
        b=gbhu0kppqsd00HmQp5MPG5riniH4qWmY67k9W46roTAbkrq/Tng9tGyzNNQW9hsEzE
         nr66lmoPMpXeV0YlDLQdX/bJ4v0tWCZ+yy2zt9ahxt5RU5v650wK6FSwp46hTkCN5NDf
         cuDkXu0gqprV24b9LFkeJFok2axwpsOpxnidiyC5ybIwTtsI+SyvZTr+lhD+5K5V6xF+
         /aAnK/vyra13/6f96HpxjwlubHhlZYbfvAwnpjzf5ABU1Qd09l7p0qyJfu5bl01zMMwF
         M1LZfmT/fpaC2qYFGLjictaITH7Ei8xFSCIfh+LyR6a7tZuTAwMNJiW0dxjobSbv1nnC
         GczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781100128; x=1781704928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+FLv+bHJBS4e8Wwg0U4YPV0Ivz1HTTKfm/O+8VDvBk=;
        b=AydKP4+sZinFxUK6OQP0aGLSKGNgKkwfyd57boB6icJvWXm+tn1WK9lOEH/7xUTyie
         qQ2GGBRlxnrv9//mCsJMoxc2M37d87oBuDQyil9y3B8hUCbvfDo/9RswegymnyUo1mXq
         50+PTOb14qG56RjKoeS+dV9mnZdEf3T2CiFpu+yimIdg43f2Zvjov8uMPOzXiMYx8ZKW
         MNKm31+PXZIDi+wobdZ149o671gLcsmvIMF3tfDQWv9Djy3ydyMo0fp2Zq0RpYC6kuIl
         YxkcrFaKDqUgetDxpxgSbdbwz/NCouTyeK9ihoy61fqWZB583+9t+Obdch43oX2TbS1Z
         M+nw==
X-Forwarded-Encrypted: i=1; AFNElJ8/3rkphhKJdowRWXkIS6biTev4WVAGrHB5wE8FFLAgaXTdT1YiUuSTHhIW0dv+QzFY/jarp6yWtw1I@vger.kernel.org
X-Gm-Message-State: AOJu0YwS76DIYDJc++SI00kaLEWVy63ZF6KRNuJ7oYvm9U68dJsSGErQ
	6yrvO5VO5uo3DzYlIIdam5flC3nH+MY5kPMCVCKhuEMJEs7rN+SDXD8hDsi7Aqw3D/BYYsDvOhe
	qeyar6V4j6057w/ENdWSNfRSJB8GAeRtrPkD2dbk784wsujMtCpbgWrijC+RrH0ls
X-Gm-Gg: Acq92OGI6ZIduQvWy+jcn0Xg6+4G2b30QOpGMj7hnpdEHrq4K3zxT0GJFzQ+815p3/s
	3EYGfh9txzTvTyVf2cykR3j7pdwk7VwGD1KPvVMTSEvJmsmgT7xefHZVdF8xF1RwNdELAKvuf/0
	WURNSXi74Fzr73Xg1Bnyqsi9M+q2nXunwrM6hBJtVtmqwDvAtKY5tHcMHqLeWZIevWqQP/lzIOU
	WWJ9NC09ORwWGSB2QG5JTTLcveczMJ4cSQYPPxAKJL02Fqs7/2bR7ySVTv3+9RobcBK60I3oXT9
	09sP80dWZj8O9ncrDVqRN7PmDyMrd2244MW98Pv5ZvoHtusOA6IgGmQ0OUbVjN/lSeKMARWi76c
	I3O0LoaylYPpEJI1W19mF4A+SnSJkYeH7LOfTQF/3H8YvipTXKed7nVsW
X-Received: by 2002:a05:6820:a20a:b0:69d:6026:2fc5 with SMTP id 006d021491bc7-69eac971679mr1794667eaf.1.1781100128031;
        Wed, 10 Jun 2026 07:02:08 -0700 (PDT)
X-Received: by 2002:a05:6820:a20a:b0:69d:6026:2fc5 with SMTP id 006d021491bc7-69eac971679mr1794612eaf.1.1781100126676;
        Wed, 10 Jun 2026 07:02:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055309368sm1176605866b.49.2026.06.10.07.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:02:05 -0700 (PDT)
Message-ID: <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 16:02:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and sleep
 clocks to DISPCC node
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzNCBTYWx0ZWRfX7b0of7PHs2Dq
 Xwmdr+sQJnOqrYtonpl+B937mnbeT688lYWMMlKZsFDUQnLhbMCg37QBa/KQwwZagErXMtrrQaA
 3amDqI53h/mOtY8ovFzSsZ+eD6G4l/HYIaumIwH5XREjZ/uMqhjjKztREKeDr5tjeIi05XMVQ8p
 bhIQg77vrv2XpSECI5JXSiHXSpylcCl9RVnu0opO1bM8nlKw/YUYbC/tujYHOPaK+nFMHjPMuMe
 7sdm+KCxCuVP3kelWD6GZ4qCbVzAQsFMOA+wZ5ic9aVToeDMDwnP50Ojv8Rk7UyJGJzZsYAyE+N
 4+5u15kQYj+HR+5JHE5ZjjC2qOV1nP+O6DkQTDsapYUUmnmeig4LQgKxoO0YuKZCBrNZbcX60UD
 w1sSfs11yT3UY73ckPISFLVEWUUj6w==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a296e61 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4TAmcUqLxasSw5w_aJMA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: -i3dEV5MkeqSBKcDigtjvfKxKDkJzFcP
X-Proofpoint-GUID: -i3dEV5MkeqSBKcDigtjvfKxKDkJzFcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100134

On 6/4/26 7:26 AM, Imran Shaik wrote:
> Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

The Agatti MDSS doc suggests there's only a single DSI controller
and PHY. There are registers to support a secondary PHY, but
are those just leftovers?

Konrad
