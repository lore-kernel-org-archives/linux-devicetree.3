Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5803CAA49
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177760; cv=none; b=DrAs/d3y8d+VMMvxgLqMChTbHU1SAgB72kgo1t04e6MXNpOMwN5DUq4+gmL8RIHBr+3f7XTpTUzl+pykKzlDk8pkHuEyVTesIWEWk9QNnSRhT5ToRi1DkuJtyVs2oQoNOj5BbbsWnWGHVKm/Iez63oYdit+dn/eFlTlxD9PRomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177760; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tp/APkuQl1X+wcjTjddKgfIJQLGclO47LnXFbcNbWZSt7mbrXSFKNJZTqaHDNVCSML+TuWMmentfzed7nGvEtCPDIXKDsxkVz+wg5DzKLQVSrmSY0LDmh3J+ttJChmju+2RDmYVg00ApPeTb+kVNKe3x4JtNeDN4+oT8GBAfKOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiw4/e9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyvOk9gl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fiw4/e9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyvOk9gl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA03G7318908
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=fiw4/e9kllPWMbLU
	Ie2uDVEGZV4NJR/mKgCJ//WQf10ZCDnR2T4MktsE5LCmKRRv1D85s/f4y/YWenBU
	I7Z4AWLsGVKgi+MBegyrs74HhzkqT9DlASX+itJ7DL2rSRTmx/x8KIDVVsKuJNN8
	LJAmk87lIWth4ZXaVCwe0rKzhz9E1r1SkoxY7K8VAt0aRXKYOgDJjQbOFYKi5hvd
	twOg7DaYC9X9xFDfvVHPF9TxKPrdyH7Z8J8u7ROpKx6ajcmFBhdTuWeDaQPFUXml
	LgHKnkmFDfcGeCbpzrBZw+1+s52GJBU/BvuTtQHiM6MEc6oCtas5dKzI4Z1yeunD
	mGlPCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk7dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 11:35:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51757324dcdso16830031cf.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177758; x=1781782558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=SyvOk9glSmpdNhrZbZ12rpr3sF0x1E15B3BmEEz9BCrb65wiSdKu/f91g/fxAvKlRA
         yZu50kbprCIWTOQaPAlK9UYGMvh0morCwNRAnZrIt7EoA7dBTum5IZnCZNhZnqFiUp9I
         JJbsM+5eRZqnypxgzlIhtGfnRPkZG0FQoRaENkzR3nIqa2As/xZ3Ds+tuNCG8pxdW1HB
         tRHoHUOJBon+W6QUQpXRZduxmxNmC8W/YMMYe/O03qAVkCKVxGm1hlE3y6dc2pFaj+Wu
         7//yYyfccYGmCKK9OFcB33tK5y0jrnRhuvBhWwBorof2v3c4gA1lRs6a+c4zh3ianJuD
         Loug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177758; x=1781782558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=bqH8HdUkINOyr4eUCLUAKf++2xBLvNCNc4aIoScEHvzXXEWn6EbMbRHqJut2F4Ecx5
         qRBJhpBbqTqGPKlSmC4CubQuP68G191HR2NeAF5Iv8weg21t58jmXRg2ZMsbjaIT00/r
         4+DoNIAtiyiedPArQV4h8xoxdZvRemuM0Q2JoqFAB4hEwddsAtm7+jbE8RVNm4XxIleU
         2NavbbsgDLnMMJmIAN6AmfkBylmCiSgxQe2f8HWVd9D2dmRf5D1yve+LiuHZREv/DLbF
         0gzRqc6zG+273AzE9lFDiuhBl1VVxvwn/+/M9ewn7wWnaPnvO1Fv1M6IKtIkz4l2ukZN
         HEFA==
X-Forwarded-Encrypted: i=1; AFNElJ/22rXNBOytGN+GtFfxOmt5Fsq7znNEeVi0cV8gTYJcWLMIX0Z5WXlvllFU7/ByBp+U3FcNa+jqlzBa@vger.kernel.org
X-Gm-Message-State: AOJu0YzNUBgLlM+ALwfEg14e0QfdruZ70AQBERzyj8jwgoYNZkZQ6/Ss
	gh7fo719k5+JKoXd8cszkX7JDs8RZCGDXSWdMl0xQ3U59SZnS2I++P9vC2PWlnO1uFBp8TC08Y2
	4GRJX1Mm3JFQPOi2mBO6kc4/yB7gJZVd25KKGAD2g1WiI/gNL3eiCAeNW+5ePGOV0
X-Gm-Gg: Acq92OExOxiNboH12EB3+g6w2ehu+0mITeNlATy8xIyGKXjjB0RVdJRYSKRlka7w6Sl
	QqAsTDEANA/go57y/8IfWEkghcAG90E1MRFNB3l0O63+7MWtXgenPKyw8kGe0tKVlnKOZ8N3JQK
	gCyWkKSb3k9hj8m6/1C8O+8n9AkfAu+VN7aoDpCGvM16jYYkqIi/5EYkjiza+65BxJZ1nJcP/e1
	LoTZxck6wWjaE131jf2XeTN4lqVZQiiMYQWNzKEK0EdtZe0/zuB2xnQUWqnDXPWZafxOYOf72dF
	86AmqIfgJpxA0KQ3NufObrkWU7h4yDOxp01/ltkH4E35dlsJo3e+98Elw84+fGMxIaceetxQdR9
	Mb62XdLuHE8hUoVHGhog0XNoGzt53cR5VGWMESCy1m4HYestKxQNAF7SN
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23862111cf.0.1781177758373;
        Thu, 11 Jun 2026 04:35:58 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:71b8:ee37 with SMTP id d75a77b69052e-517ed7bff68mr23861701cf.0.1781177757752;
        Thu, 11 Jun 2026 04:35:57 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cedd4sm50499666b.42.2026.06.11.04.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:35:57 -0700 (PDT)
Message-ID: <0468f9f2-5f44-42f9-a366-0bdada092195@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:35:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/18] arm64: dts: qcom: sm6350: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-16-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-16-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e51tPKfic9K4KzyAe2zVSkBEhwPfPU7o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX3OLl/yAqcO8B
 IUlZcFKKkYqnREosJ3eVLweSdZumItPpklpzPUEwrS3KEDwxu66XXePuzFSvONdt7k1rksMCMB1
 4giB0fQPBPlw0+ZThgylMbAm7MCh42s=
X-Proofpoint-ORIG-GUID: e51tPKfic9K4KzyAe2zVSkBEhwPfPU7o
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a9d9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX0kElkCaU/w8B
 7B54CqG2UheTsGw7k6uCOGeyrDqa1VUMEHHlgWgUKxSpP7r0w9us1RXSo5zLEgnfqlIiq7jaj3u
 F8EK1vpGhpQxCwA6gNu1Ey5wdpa0jLI+ta9njYf45mdTCdBlpxWVdIBoAYRSJQyTm42el59a9Md
 lKl8IXcGlvlAEpnCF0enRq1kFWQsy48rJ8ML0fQAfM5phdaT94AAy9JFKJ7+juzkz60ILcpgASD
 I1eQGrnA6XsMninb0h96hV8ql54L1pSAkrSfNfsHur0+Qv+3aOKChtaYj+/xP3TisY3A5bYJhNw
 qm1CPuy7Bwbd7OmQrcrrBwy6EmWTgmtZsql1sUK04mBrT12jzPiEsWzKA98bXDsisfdloysCpSj
 htxw5M4f4/B1I5PgYxwDwQKBUdGM6aPmAVEd+sS6iJY13Plsu70P1pq8h5DPQ+qIrjKB2DVjuSt
 6Xly01F2jLfdwAmxyJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

