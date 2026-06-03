Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2544CF2E
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486381; cv=none; b=YlOHz2HqmGSeGAwWi2rLZ4S8fvKZ+z/fO1yoyLffhaQSvuqHhtoHffb82Kh5Pxk1puw4e0gxpjzlarOY0uzzRNYM37IhiYgcp3Ph1cTV6iyED/FVzT4y6Yx0NfGt3crFq1DH7dGTDLG68OU/ZNyCa+5vPyAOujIVV6dvGV5Yc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486381; c=relaxed/simple;
	bh=/Pc/wzjnWBRO1drRD4S4BwOsTHAxkyw+aMmqnWzA720=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UK2/cAhMXDJ7iuoyIgXf7ZkILyY6lEskq/vLwTnD+gafy1WvRwPeFYFapPD0xEiq/YI0D2JkV0eBJ/JAVu/glyDour3X9E2G3agGNCphnAOeaZtT2cuL5+RXJPYiGEafQJjZn2DA1n+eu1hbbtIwhSaz+O/N92l5f4EVe73+WmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=StpAk205; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxrYpFKn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="StpAk205";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxrYpFKn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RYAu1200369
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 11:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Pc/wzjnWBRO1drRD4S4BwOs
	THAxkyw+aMmqnWzA720=; b=StpAk205VYO/LQNc9dByB0AwF0Zn5ZVd7wpBgtK+
	OevugUoleNsrJadw5rVAmCD439NnC0MMDJbwM2kcecorVBOraAUsXzv20tGVNuXn
	S9fpWG72JJsW0zhuWw6PugczE9AzaPMQ9OY8Z8HzOPZ3uqVODwS9TMDP4KJPU08m
	sq9q+agnUak28F2ZCrCkPvnshUdLSVqh9tYnLXIlUSOvEwgL0MCWIbkdHjl+d0I7
	NGjlJKOy5i3+wm9I1ww6NavDJfpDOymZVrP7CHpOP5IX37Mdlb/qpdAxDL3vrXv6
	vG+XWoK4M9o9cxt0DI/iKuPcyb0K+2dLMmVf3/zJCr1LTw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1t2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:32:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8428419982eso808201b3a.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780486378; x=1781091178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Pc/wzjnWBRO1drRD4S4BwOsTHAxkyw+aMmqnWzA720=;
        b=LxrYpFKnwbuvnrk+0cpJypjANthMSQmCZwnaeppQt9eUxoTdl1UhI/XlVkxKgskSW0
         ThUJUYgjKTp6TLFkRsDtHJ0pSGy/G3bttvCs5rVJ8WGg62l9eVKnEpiH2Zv9BD95UfHj
         d5lYkJW/ykomtyL0TXyWVWAndDGrKPzhoyITZFajitIEvu8P4JlR1HcCjTta+GcQNTAr
         HmeTHJ61Fy001aj7ASUxcaVqYSwJFIY7ZA34b9e8pHAdaJg+YulxiXvQVnp5HJ9ExrPL
         DgI53dlIcBSCcHZvHGcWy9D+9Du8cIsOTNNGK2CCY5pKVTPgUZlHwjBn3BpmmJZ98AjN
         YhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780486378; x=1781091178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Pc/wzjnWBRO1drRD4S4BwOsTHAxkyw+aMmqnWzA720=;
        b=M9kD3bfzIi/CweaSp8vBD0MmPtE+kVoOsemFc7cS9Fx7pnFUg/UdXVtOWIG6GK9K+A
         0iib15TC4FcQfVVUCwjLUkTpNAwxvSCOY4d/k0Ea6q7hsDumn7vV1Xf2JAMPSzzBcbyK
         4qrkBMhDJalcsub7Rz+eYqpuDnO3KlNEScYVfMBAJJFzqWO+P1PWfcxq1Q6FCey/gw9y
         5Zv7ENYtOLFwjU9w1E8I7U0at1Nj629sOlEcbZ9RFXNA8gGmTw+AXdzO4Q7tF8SRgj+Q
         ApDuwYjy5ctvAedDw12VSYZ1IiQ12XI92Lp2/D/7O58cVNVqXyAVRnViJn10OPKKjX7m
         jSlw==
X-Forwarded-Encrypted: i=1; AFNElJ/WUbq+lyN8DUIQKuXykPuPR73rRHovvm6h/zy2d11T0KGjoDtCuGCfMCcvKKwjQF6FGwrHPgVTd7gg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmac91ZdgHFvmSijL2ll2emJ3ge/frdlrAgEbdLJJQDLAn/ZJR
	fvU1koRVEgdc54IUkwOhdN4uQrBxgStytsCxQ55lsQeX2LLbADVMGIbNJUr1529dmGNRwVASaG+
	OJ3oH6Q1h1ehqhuU5O/en/F1zRtqtKQF+yDG1G/wtDOHXEM8fEXwuFRZPUfFvXHoa
X-Gm-Gg: Acq92OE1UnVS7Ot3hCQsSW2HMedIMhfaT0zQh+ImLcAVm5PWb3ndDIjdzuyTerqQcn6
	rv5dGsOlJVZU3SsIlY0rnfWbg0gtDW43Si0Wz7jphTyMINB7PLtbMzt5o7c/r+hkyqe7DhXlAsF
	DxtaLmiPVmuNFucf6JVy8P14XBPCpoGo5LmCvYv+X1e+NeRjbCAHGU5uU6cgrKAqRgdBcKl7xGr
	oB/QTnnfhxF/XWaSG3HNx8L29qjfHu0ep0ecqREJblryUW+BKd6pBztnCKBSw8v/eN6epMf+rES
	Xp5Z0OiZnelJCNprbhYuSGlQZ33ew45hc4YJHS19V9HehHra/BoSM9KDuaOpm8JZA48fZprcYU2
	+NJwI+BzGLHWf3fVVUm6wKL9kjQE7uwomi2idghYYYSNRkklhFuAV3jOv94dP9l3Q1w/nLpQikN
	lKFk5ztsqC1MbyQNWqA21FyM4E6SyJyBMKhSt0plgHp8vBZY4mRk3QZ08pPZzuFQ==
X-Received: by 2002:a05:6a00:3e05:b0:842:5711:9a44 with SMTP id d2e1a72fcca58-84284f39d8emr3034291b3a.36.1780486377766;
        Wed, 03 Jun 2026 04:32:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e05:b0:842:5711:9a44 with SMTP id d2e1a72fcca58-84284f39d8emr3034262b3a.36.1780486377306;
        Wed, 03 Jun 2026 04:32:57 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372502sm3039152b3a.16.2026.06.03.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:32:56 -0700 (PDT)
Date: Wed, 3 Jun 2026 17:02:50 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-ID: <aiAQ4lzRoRIzAXT4@hu-varada-blr.qualcomm.com>
References: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
 <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
X-Proofpoint-ORIG-GUID: J7gnxXtmzVVWC7NHOEDFFWxUV3hsslqb
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a2010ea cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=P-IC7800AAAA:8 a=CRREdHZMeJ1pAzRtQh0A:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDExMCBTYWx0ZWRfX7Tza3aUsRtAE
 w9qa32xkht6fkU1Bw6VJZ1ndZkLL3wA+uVCCxd3PBw9LBiSvj4QJVyroOUPBcbbGdN9gnKAhHmv
 hpwjDX4W4dgZ1KQcOiWyojeQ5Bxw59GTY4uErwtuQEnbBofeFfaFUIXZUGI3Mq6SlHooL/CyucT
 Q8VGhsCe+zyuIbEDi+zrp0Rn2/3Vh1G/eriomAqn6ZGmJJzVyZ8aWw+EMtCVfCfFfDeqrqtDf+5
 wTLzs2TpnVHJM4FpPweFzhIdcBTr5nKzu6SSrqipIaRWwWN4vYmdRXTDMAeXCW6XYeCa19e2VHG
 exRIB+FoaY8ZKk3ti2QiDB55ULMpHh2s/fv6GP5Sv2zBcyl3+tPtk/PE7GbnM7oeRvDWIuTKVq7
 AuEZvjkG+ZfdLmywJvH1B8Yw3n5EkXW9LtMU32i/JM6IsnopHc/c+y4XWJYJkphUj9fZTBqFL62
 l0hLACSjM1eIvWzD1Ug==
X-Proofpoint-GUID: J7gnxXtmzVVWC7NHOEDFFWxUV3hsslqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030110

On Sat, May 16, 2026 at 11:55:35AM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 02:54:34PM +0530, Varadarajan Narayanan wrote:
> > Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.
>
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>
> This applies to all your patches, not only to this one.

I had incorrectly wrapped to 72 columns instead of 75. Will fix that.

However, in this commit log there is only one line, not sure what to change.
Am I missing something? Please let me know.

Thanks
Varada
