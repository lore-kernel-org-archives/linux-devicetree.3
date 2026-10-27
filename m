Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100779;
	b=jCKJD9TrgPbkTEnoYLZVuZWwRP5Y2H6jLIDKxO+kTg6gYhXRi0j1IETrw2A3p8ZGfGWf
	 37xeWnFiOLLXGB5U2UY++cG4hJ4TIDOlt2XaJZ89lm6t5PtjsgcZMVwBEibpXEwA2CaHG
	 fQE6XvAw2+pU4d/51jXqB9GWREnE4XjiUqnP2+VapVFdszGoKBkUcYTTerNp296fxeTdf
	 K2Fr97dQxyjXDseOdbXpXKZYahhAuQz7zMPP5hbU4M48N2UAbqMHB9mUpkx1rTIaBbzGU
	 9o98oW0DTNV2nYV3tCDhhqG3v0ObPepYZJvuTdMdUoT/cqd8hsgevyUUuN39eD3rq3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
	b=B7MT/J5Khl1ILqvwPULZXibDhMO0j7h38ai/vxar6Dgr/h8QCKzfS3nkI1oYcKfuIOw7
	 w8gDMnQObwiHx6L70iV5N7cogl/qAtT0gWa/K+cBiraQdeoAIJsYB92zJYwb/UHBw2HB2
	 eiJLXh6neKoI4LlJHhma7GUnaawBCexy30kjCchldXcOdSbKMyd/NF3qsysuxv8umgFgF
	 +NdRCtDtthOVxk/0niMZhId1M1XNh21SbtR54+7C1f87DF0HcJEQUsDQ5q2Q8kEp7Qq7H
	 9sfrh0XjtszlElf5L+8FqoUyfuFFwXUGGRZqq6vNyd9T4QSIY/P0AiYtsIvWoGM+WMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056FE60A381C
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 056FE60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeUoP1063061
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Ve9ui8PilMxtzrantty91Ae
	ttA4A9wQUP1tdJP+4uQ=; b=ELzUjXm4v7MAFja4JJbXr2MTcw/RSuWKkdJ+hy7O
	MrVDaMZHhSshavS3nj33YkeKPqWV806SwcXtqRqdXBAVAKjABVzQCstnCH/xEq2p
	XEFrLE/vwZXnCQidU0ldxENnTa99RkTMdSYYniz8Y9PDbENnMvHjG/MhfpxOw2HU
	Odplci2IeCh9CdxfWjQgZmTocOeGm4PhwoCAfUUH4WuCpVt1z7q707GLs3MoezAK
	W1UqYhv9zkbprhdgzAYtii8SccjJnM18nLKo8CMj5B8xJFVRAbsY0nBY5TfEgYQ9
	nGx6WbEm/IbX83ERcKSKLlBTiwSOjinbaz1M3Hg2QZTf/A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2t99en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c75523074so8449676d6.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100777; x=1793705577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=EfQ8McQvH+DSDyFI+ak9B8ymsXvLPmTU5h06rgn2Hw4SgSTajH3f8rDXyTIOH7eNuM
         weMsyWmscxbSYcFZ29ankI9sMVZvYCX4xMhTHzddpvxWrNkL+gMwDrTh7daFlDaFdsAV
         GcUBogQZ37vrPLzmfqSbeo/kWy7YlZAGKE4AgUfjDdaNRAl/4S26ArjWoBs1i6srI1UZ
         BOIH1JLsLCe+v3Pkg5CllE2vS5qXnp7Bf+NHYRdM24Kv4Sz39ldCmstXM7ahoyBxd9KM
         AN44H9RD/kqOalLxwE54T0wT8/9QofIScvG+G6s1lAVwwFrDjDYNYcvQgUGb37PIBwIo
         aB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100777; x=1793705577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=n10tStg74e/sH8OcwWS8RSNAnAAu/H1QKfI9OGIPzhb0vZTxF6rGG7hscj9sOnptNo
         Xb9UJjDyAluV2Yxx38I6jD+Fx9wPMxIQkdL8EIJU5nppKGDLw4k9Kx06mpauIHdklU4A
         HYaePhl+iXd6X2iV1c3M9BLk8GxbjqaLJO0WIGrs1Y0/vxjeMoMsDqY/zL/3HAAYCT4H
         Ej7NPDVcagMFOuAg/vosY7p8J5nfRqFxHhHl/MUCIjQtbLSRyTrBl542+bisiMNRghgH
         UFd1rXnjpw3GPnceKIn7+q5aRMM7BlMnF+h98IxxZv79IfFXYyw5YEeWLh+luxUKNNZW
         HWLA==
X-Forwarded-Encrypted: i=1; AKwUvByldHT1Reh9pthtMWmCxz5PReUPFizVuM441a0pjg9P4KS9jbsEHwzyu9uRFhhE3WfiLYXbmtTPOFN+@vger.kernel.org
X-Gm-Message-State: AFq9FYLb9uS6sj+ycIHZXZWbpF93viFZbWOLc/2y9bx8zESDnTG3yqX9
	BVg33kKeGlV2kTU1B+b/4fn08qpcNJwIQDcoVS+EFMPqqJVrK7Vv6buphY+Q4LOqSsuubq/AWbY
	cjbdNv34Wt78xIOb6mE2A5pB04HVEfkGKSaKQlrFZMo/iUWJZIrXseN6iFyrlhi/v
X-Gm-Gg: AYBFou3ueZln2C0bdZTIy84yzmS7CJHnvhsnT98JwFNJuzMVjNRWfgoYoTBcALkpyC2
	+Cv/8aZHJ8nxWF7NnGZpgIYDDqGN/TsCx5Gd4HLvHOuTc7OWnCTpQi679pLUNQazFsYhX6+vb8d
	9TN9iKvptVp48Zx6MyeGjhUem3XmK/x1NVD/U2+wyj8iutlHRMk2DaU5MccGEZo0TsfmVgmfT+x
	fEYR3zcDWUP0+05sZgm24hIN5chh/ryA5tZPEpJjxvCYCSLJVm7D+Ot2MwL3ctSVZdjxw1a/YG4
	nwB5WJXgXSO2382HYoTrS9acUQQxmzC+oOvL8LRq3aNGrouDVREv+m668p9VrM2SyDAsCUKRUFX
	g8ohM/7GtKOSkMV/lJDFsHfATeT8WZuVB3AINeIJOAdqswrsR7L0/e9y73lkQ960cwA==
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696044685a.22.1793100777060;
        Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696038185a.22.1793100776313;
        Tue, 27 Oct 2026 04:32:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19211985f8f.26.2026.10.27.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:32:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: patches@brar.si
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
Message-ID: <natokcic7hm2l3erd2jhghzlkg4nvy5kejms27hi6dr4xmid5h@tnhinn7yjp3i>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
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
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae08bea cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=SYyxiif7jT7wlZCutrwA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: v6-ttyPVjqRS9-ySew97Lw3docziLb2R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXwXEdmb0hWVIv
 RCERZqTP2c2wMxC/ZJEMu1Wb3aIvbz27axAPVfz0+FhgWTaLKptc/Ay4IL63q4MnCv0JW3sqx1U
 V3YDfM6IpMYWI/Z1jgBh1ev7SgQz2oc=
X-Proofpoint-ORIG-GUID: v6-ttyPVjqRS9-ySew97Lw3docziLb2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX8Yb03Ly80w5G
 7JS5TMbyhHIxaXgzW+XemPA7q3LpTni10j2XggmcB+bvQlxGeFV/hXGdE3L6Iw/y87qrUGT1mcP
 sQlv03zlHKaVuubTq9v7zDqPRMLLxgJblzbRHnQ61icNiaJa/s87oJmjLSohcssIVuSrGlgraA0
 a6wpBdWMAzc0qbeil2OXOtWIK4b0Azhk6stXVbZaX4sFpS027AY58vvouhwwaHr27tpDvT2T6fb
 6zMN+eCU+zu5s3gXeUeqt71O8MWqZp04p0pqHkg07rTXs7fpzyUI7245pyE/zp29+pR4MV2wMmg
 akal0d6s+wOpqmPgNiWs1kSkz5v8N0/8QPksl9AaNEn2QfOkjagiVZLxubjoyyiAl7eIOTfENdc
 ShCdkso1GcblCIuPNcciF/R6zohkQIdJNbcSXRye4JaSCXiwK9sm+OjN4D/3zZm+RfBwYmH+8cP
 FvyPzaYOBFlg2CLVnTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-27 10:05:02, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 378 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 389 insertions(+)
> 

[...]

> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
> +	.halt_reg = 0x5000,
> +	.halt_check = BRANCH_HALT_VOTED,

sm8250 uses BRANCH_VOTED here.
