Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372553;
	b=gAL4xuSZmZj5Q7fbnBpu1/+6yTYZc7UAFERn9TOwUo/x9u1nWj4uRA8Xd/+ocpLxF84N
	 H3V+9vZlNqJw+cgGNExptytumxpG8G24loyN1/JNJPYUAnanqnOMemm1YCC9vtXd4J6PJ
	 cCIB62ln80+xRTEcuWFfRfS9L6P0IVazBekqk5cw9vV+bbh7qXIY7NwKLek/K+yl46joU
	 maupntzohB3ZK3g94IN4W88HqndIiWoEPY9dq6X+x9pfc0HIoqx732Yv6qE01MJArD2UM
	 dRETxhEoq7+CgHlYk1oNh+uNvrkzq1kreYxtHDMnDGdPOZ+2M5dIxlgN/E0gXz29+BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
	b=sQzpbADxdUmS2w9FmQ6a3UGkykg0pQ7qMqsTrnELkKhgrSgoqVqQU41Wt/GzRw/aRGVj
	 NpCIphMiDwKC/4Vh1gxcHUDzE1vWzpoCW5XAAmbp7brHe+60z/TaPZpI/CbZdceWK+8JG
	 +zoyNL2LKSAzU+YrBJkGeYLzjPS2ZqJPwRq6PHZWpK0i1yVW7LbOp2P50C16xa67WrU2o
	 47h+NXTYGuUbmkBVwLbHyOMz7yBXkrr9EwvXSFUlLSw34X90/dX/J6al7AKTfNPO/QCho
	 N0Bf9F20EKjxZs4vyR+WGXZXWt6lA86OcbnY4zWqRCMX8GJRScBqZQ7wu/o/gmuYaxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkfPaT17;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kf7gBLov;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3097E606A31D
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3097E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mkfPaT17;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kf7gBLov
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER7Xm2596688
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=; b=mkfPaT174hQ/k9SE
	HWJlGqvv15Q6tbsQCohC5witKbWUmcpo39kIZHt2bZXyqlq//udZvkU4wXyH/Osz
	yTescl+hZNux0EN3xS4AKsekUC/xo4OyxVt1eAHYoy2I36HOt/Xod0WwTqmgUrWg
	JHetMwzIJa84RMjyb6AgWR+EJKTCcvYZaXGbVSIDG8YtpJT+fT2U/Av+XwxGENwj
	kkgDAFlKXXWRTueIhs6oQwrBBJHxk3Er85d77lJ0/3WRWr6/e6WMtnkvjhQ/kNYi
	c7u3cB6xSUqsjGpT3qw/YZLg10VdousGAgzGn3CeTkkmM4r+HPVaWLQcSZ3bI4Q9
	GamHEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pbmvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 15:02:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so21355585a.1
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793372551; x=1793977351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
        b=Kf7gBLovzlcl8QxpOfakuYuHpL9J8ZwKpD7bXxw4X+9jFpAcRaSoFKdFWeJQ7lgkml
         CowS+nM1tqnu4gHeHNa9V+8QH22Lf4WE8IWlyYvKD2kv9DSbMxg6qsaf5yGOW5EgEcPM
         LHx6jHjgaCxkSmHUGBrYmrALfqrPLc4IeopbI/ddA5pLeEQhXazmbBVGQi4mk1zroWBy
         Fh1TT2enxDLstmr+3lnqOqCyPC9b/1HFo1tfV91Z+5CG7NSFt3YMDX8QPdsw9X5tD82F
         NU64YtsRzAIrwr1/ABX8WzkDR3YV/Ws/j7dI3wBZ2jRjEP2vyq+/rhZLaz2F4RCtzLBd
         xokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372551; x=1793977351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAOoyxUkYkr+YZ33GmWcIuFlnPb7kgM8/ZT9gYdBOrw=;
        b=bHhXkXQLWofTJ1skKFKshK3TxJlKB1EHM4hBee5CcV4rHvBgqD267J/hxV2M+zGG6U
         1ccie+Y/GvgNdk32RMt8qxtLtXGEES2W9FAoeshKKm4pB9mZslATLTWTdMsg2JbFrcKq
         WQxuuX6is889X3U3yyKs+gPzHIld2JfGFAEZc5q6MiY1/RNx2kFV249tVLeufrCQXZUq
         5K/WJDpphWG+27RKdpLBGvGKY5DHSU8VOX16Mf+LiayCFu9l758PLBRRXHV3YAal/95C
         g89XxBE2ptK9e6KA4c6nj+mjdIdmj24lyai0rwOly7K+uL6mn5zFf+rYejOGRojy+Qv4
         XJIw==
X-Forwarded-Encrypted: i=1; AKwUvBx9XQW9nK1cYsNnztHGHYWUa6uOweUw0I0CajANgJ1TBp1rw+wXxdn4CTauc5DV2seNAH7NGp8jRU2c@vger.kernel.org
X-Gm-Message-State: AFq9FYKiHFZXxYgOAd6N1eDXhRuUjzKrcHnfjHWapT7NMsxi+24lfWXa
	cFtifXmlpR3cDdjjL/dLvDJVndz6X583M9pl+9OL6gcJ55F7aVfn/yHRDitRFnVGxcMn9VYr2tn
	gViG6d21vTxKMWO2yDdV+06W7DdW62IbQpwYZG0jqY/fdpjW0Z7zlJJZ51+HNJR/0OCvSyjRU
X-Gm-Gg: AYBFou0fZ46c9yXnmXXJic/UquLOCXtelqtCUgYpGkpq54noP8yTqmxYjysUzvVP9bO
	69qvYab1JtaHthKTg0vtk2JYtBFgzofc7LZjBmTHAMqBEH/YMrf3O4/wG9oXwiMI9z3R0A4cxbS
	uRRC21BSrAfIBlRkBhoUOfQS68H3R/96dMpqPRtDNzpYX3bk8zEV0RnI5nY2pvnbXvKTUlDkFKU
	pwQ1pMzbm3mf4ZMPLWj+daHlhtLpHH42Doz1brgApul50BsI6i/AkyqZqJ4redlIRMcB7ctR1CG
	TixhAGdh/e6B3lKUo9ewyvD7dbSpSSHrNFk3jASayHh7pDBgkB0KruoTkbVoC8q+J9Rr1skWvOE
	iZaYYZnD8Gj91qXGaQsZTGYBrENTyqk6prsfidZu8CIcOUFoL4YqcVd512o+uBUVPWfuxUTvR
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr420075985a.2.1793372551178;
        Fri, 30 Oct 2026 08:02:31 -0700 (PDT)
X-Received: by 2002:a05:620a:72cf:10b0:93e:e111:2771 with SMTP id af79cd13be357-94421619197mr420071085a.2.1793372550552;
        Fri, 30 Oct 2026 08:02:30 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca214fdsm37486a12.36.2026.10.30.08.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:02:28 -0700 (PDT)
Message-ID: <d265dd66-d8fb-4fd2-b6cb-d50462e4b6e2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:02:26 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: mdss-common: describe
 additional block resets
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029123238.29877-2-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OSBTYWx0ZWRfXxPG75fDg9JTD
 gvbuKrSdqZ+mfJunJfVC6dFgRGxL2ZOT+/x+/URlEEtb6pY0PJEQ4nHim9EdkBKFz+CQXOCmFCT
 U72HrcCxxPimxeXYl1+UsnKOQN09Y52Zmy7u1RiIfGqSOxEF4OcFyEmIxB1E2k0rKGAhEaro+Hf
 ftO07EdHxbKuW5coq5MJk12R0nhD69gR2+E9M7v40nGEBafkUFWNrj3Jl/NSG7M2DX/RsrvgagW
 A/cOA7wMCLdJo6uQ/6mp8gwxuKfK9AV3bxFHEu9Lk/sGpVaOWsQnwj/rL1vHTyncvEMK9K6dHeo
 xJjIGkYK0ggol8AzCKA8JJcT4gTnZ+05CDLFdnWjC4tRE5G3QW+2ScIuYAe8z9/61s6AhdKa1A+
 pd6mTObRlvN46R2BNSbivahCFIg7phJbOpW9P0AZIQO4K73Kbib/Ke3m+nQm874RCUDLpUl65rF
 7zth8OOX+hxHDIMMW5Q==
X-Proofpoint-GUID: s1HKB7n2jwzhRJAuFzW0qr1zFrgmdv4J
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4b188 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=dBPrbYW5IX62wmfSqDEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: s1HKB7n2jwzhRJAuFzW0qr1zFrgmdv4J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OSBTYWx0ZWRfX/8X/se7cjjlY
 ikyKpX7U95IJ6aBC96L3iz6HW3zNSKXC+moPV6lzEg2FRpcFNjNg62cSPeNgy34uFQpKm2p5ROX
 pVIqIlqCyCHAuy9ynVsOVMOeTKEal54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300059

On 10/29/26 1:32 PM, Qianhui Xu wrote:
> Some platforms provide more than one reset for the MDSS hardware block:
> beside the MDSS core reset, the SM8750 display clock controller also
> exposes block resets for the MDSS core INT2 interrupt controller and
> for the MDSS RSC (resource state controller).
> 
> Allow the resets property to list up to three resets, keeping the MDSS
> core reset as the first entry so that existing device trees describing
> a single reset remain valid.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml         | 5 ++++-
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml    | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> index c6305a6e03..7c0ac90511 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> @@ -84,8 +84,11 @@ properties:
>            - const: cpu-cfg
>  
>    resets:
> +    minItems: 1
>      items:
> -      - description: MDSS_CORE reset
> +      - description: MDSS core reset
> +      - description: MDSS core INT2 interrupt controller reset
> +      - description: MDSS RSC (resource state controller) reset

MDSS RSC is not part of MDSS itself

Konrad
