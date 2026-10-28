Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192016;
	b=Omh3Pplh6t4EHKwSGTUSKO5ua/2HiNz/I6fbfx1y/RfGea4jBLYqrf3egtqx1+FxKPYG
	 mFCaAS4ds60vyXxxx7SQdMKlDPBf1Ft2q9o3E2mSQtAhtmK/UyP6J4zJrWlZ8FcxrZCOh
	 dHgwveNLNF0lYG+5CXqnVd7q70xJMhdgIx6DcXnYSOnNqVkyZceOXGDoCs1aZtAqbUCXB
	 RdrGeWDGnBocI3+FlXu85dDjQvQdLV+POUhyzJz393LaPWMf6nDcGELZL/tP6oGSkLQjq
	 xE5Q2uvLZ/GT/PxTydbnu7BWP7PP3wiDujC7Z12SGCXs4CothAVeNv4LnBz9Ej+wyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192016;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=;
	b=04KczuALI2MWupkLP3MiJcl0WWILNk0hoSjlvwJxP0miGTfCWfUg3pk4ntBcOLKBSOqS
	 jKk33sNYAQn27uDxG7wiwdhRbfmOn89eaGUmiJ+MktwRIJpP/zzHIKsvdHnHHuhmQoaPw
	 AWpinsZnpMV54EqAk2ZiNvYrZTP22192i8gRfvZxqYq4goG/FI5HxbuiNRA7ajh1GZ87H
	 4w65dBdMeSmE95L888xwOHGgdFtSTZQoDbOOjVASDFSLdYFGZ1bnRMypfEByyJIxeSv+d
	 V43rzse09eMa+MbOxRDsDgB42sdZxJrNaswjO/ehr7+lK0HHAJhWldPc2qTW1lhv53g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L/rLsbvg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azr5quid;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F7606A320
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254F7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L/rLsbvg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=azr5quid
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeGTs2106060
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=; b=L/rLsbvghXlEQj4y
	Ed1psalBUQZlIh7vhy6hXbY2UnJqeW26F8Ly3gvPuIqYn0ZHnPa1f0cSDPTCH5Y5
	UEvMgWP8aZY6aIr8OWKCHgS3uhsubW8Yk7ynCKkSFfmxYJEpIS3HW7Tf2jcjEdtm
	fm4cZClVjB3yomg6zgwLpOmh6IFWWh4l3Zaip3xL1+U0TKVMJUgfRvurzUsuex7/
	Rb9DKRNr/TCfiMwUDH9KLJV6zHMImkg/gZu7Kjv1iWrsXASllN4ZXzXUk2/csR/h
	+EXLZaj6IKJ4/3p5l6/+kLnC849CwcmPWkKmMdpeu44ruF7jd4keBsP7+cfE1Sbz
	M6HNEg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pukpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:53:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb1091fffso12461485a.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192014; x=1793796814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=;
        b=azr5quid1gFlhY1jw5o5dvFD4jad4PnUueRojqN1GdazpeZcf9uXoQYGsCZzYcBlb7
         KqtD8zz/WcdbUdixsaDzuk/vR7EA1kJuws14CjpaduhuvlBTidBjoYlj47WfRHuTV0Jh
         Wrooi/S5DFAQFaBNlxmm4mTPbHDbVA35NPjVptynnx6txo7k+INBGy1StlhNuq5fdvuk
         ak4xkZcmcfrJOScyiFGpbsme58ZuEr/O2w4cb3+bDzohgHkGq0UVX9wtByWpf6CWBLir
         V2veGB0nOoGTLzWRxyh4c6VwsOcXIRJ8l5fHs36zqLWhCTIdBY9NB9SsBKUuv3uE15eW
         FZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192014; x=1793796814;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zudB8ehQX5u98J8w7GI+7Vh+q5LvUPBV10Tq4giORk8=;
        b=LdL1ja4GaPG8pAOCGV5qoZc/OD5cZ68pa1GhkWjkYYM2zah5n2e35Bt0hHfmjg954W
         q7TmL069BcfpVYf1hgV+KjJjAecWlccqK9f8lCT5kPh1SYHQjZF8Hd4FrYBRVCjr4kYg
         Tq7Jl8HIleD3Zv2y+EipZiLynsY6zmvvYrryzO+zshIywWcXRBCagLWDoJpYWHpYc8E8
         /RGo7Ja1jMJaU7fxERxMQ4Ek2XWsD7V/s1Kve5hOm3KNFFrEpPq9jHTJsaIYFaPfMsZ3
         UgBECzH6FGB0L9YSZsWPNK/OJXNWOsl2HOzno3fPeCJQIEDuYybUKKFqBuRC6fi2jiiM
         f5+A==
X-Forwarded-Encrypted: i=1; AKwUvBwMXtP7wiQktJTm6KkrGfrMPrcIXXZpDFKjOfYqkd8ewRjHq52ZNCilG1eWePklyiN5/KotNVCz+0P+@vger.kernel.org
X-Gm-Message-State: AFq9FYLC1hcgs7zgnGGAQvtZO+JRQSTAnt8Z/NbnOLC9e1E45zcRwze/
	b7Q/Uh7jl6eXYQAAJDSa6AnZ/5jdKAw0evND4Q79zlnXnnXO6NHDQufD3TKL6M4z4f+KiV29AyO
	wSKTk41Kn/v9oeMKuRxv2nsXzdzCsyyXLS+92unMeA9EcFiI3vmFUT+vdK8f9/Lx1
X-Gm-Gg: AYBFou1QxbYQuYCratsZiMz9O57uIaEKTPaNUC9fPWQjIkdrmsOtOmDDhAOi6kTCBV7
	oiatKaq1VIARiWct7qi0HQh3GL8paWD9w1P1RkqSgZpm0/O8gYW7CjFrmPtZ5bQaz1K0uzCGm3m
	uQh862o503LQaAa4aRIpof4lfxwh3RbbSWsdhN4ex+0eQx+G4UhZWbeE5nlnstOeUbhi+DatLj/
	GjA6/JPqcqHCLmFDT2jTwciULLOGMjhJgZ7xmQKC6uGN009InELmu6sueUQtIjZS3xtUqpGUEEE
	WXI0PkkbF6kO92+gtiWzAWjMDVWDYG2aJ0Xep/e2QOMz9LeiDqfHpV3LLMumgQBOZJ8+1bQSmYx
	DVT0DI2ln81DZM+mmoEzfVO+70fuoTRex/yNVHMOkleG/IIXX7w5SRwsqiFYK91/5Hy27seI=
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr292259885a.1.1793192013959;
        Wed, 28 Oct 2026 05:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a8cc:10b0:93c:61e0:81ff with SMTP id af79cd13be357-944089b232dmr292255485a.1.1793192013511;
        Wed, 28 Oct 2026 05:53:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm593191366b.68.2026.10.28.05.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:53:32 -0700 (PDT)
Message-ID: <e45d9d36-131e-4adf-ae70-321191964d4e@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:53:29 +0100
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
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450-hdk: Add display card
 overlay
To: Vladimir Zapolskiy <vz@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-8-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028095151.1682096-8-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rmuidmoqqFGGKqKORlweO14yRSog9yct
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1f04f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Mi3LwBMVhOuzPUwrl_IA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX1MgWPeMKVAod
 zQgbdVjKxTTBZlXjhOfZOvD/yIE9O9q4irzW5wK4n6ieQNz42RyzfZ3CDrk2hrJb252Rj0W7fi1
 dAkvJzNegnjDycMeg/wbqSvclfeOkBZTpEW3cCiBZBK5nHq+O6QqPUfw3CVPp5VNNl2nWmsv3LB
 fKQcOT6l0J7erA2z22YcAwXGfOH08Y8UVdwYtGqbTb/7p8/azFxKygREL5ebx+p7OIxOXiLMVUQ
 xAcWnMRb3Ntf8ukMyrYF2/38wbjGuvPXPJ1/j6i0C1kRsRnNtHXOx5Puy6NIcMR9tktSTk0mGtA
 6nD7/zipINZUD3Cbzslet7j9Hx3b6RVx7Nn1hbHnyKyxi4uIQFtKTZikYPp22GA5wWV+wXZJdSt
 c68vkrxU/IFOYXKw4mn9ShqRiUich77uhcC2JChFWyWDj8r/Ly8VGEUdOaUoCtiZI1WJFN7zEMf
 26KBff2o/3cKqDSXmeg==
X-Proofpoint-GUID: rmuidmoqqFGGKqKORlweO14yRSog9yct
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX0s8HOgpojYly
 06VCkogZeq39wE1PViF8AjnBxRZzH0rvLewyBE4v9fGI5uIfYgfzsV9IpsJpUIR5bP2IUWHasf3
 gHgLJw+gEyvtzEhA8t5U6FKt//rieVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/28/26 10:51 AM, Vladimir Zapolskiy wrote:
> The SM8450 HDK board can be connected to an external display card, which
> carries a 1080x2400 LCD panel module powered by the Novatek NT36672E
> display driver IC with an integrated touchscreen controller.
> 
> The panel is connected to DSI0 over a 3-trio MIPI C-PHY link, power is

Either "a trio" or "3 lanes", 3 trios would be *a lot* of bandwidth

Otherwise I think this looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
