Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603988;
	b=iS/ZcmDnVrpNXhXcDVlmUw3bTswx5onBlCiaNPclwM599V+eJ6IlR/j5SBAuh4bCUxzt
	 z5XWVQb1Tj7GKSd9R9NCtsuDDUWko9b5GYgDhPIlABnUUsOpqxgNGkiJ2Z3RYAhrx5/j1
	 IaXpY067gbE9emWuwJa2Kwtf55o8pO8tEPZ2DXy8Qevxj/H/+/2OiV45iqi+/DpCTuOi4
	 0f6eRIH1UeNPUpbEtojWd9NgWc9ZzsCFghNXieyF0XxPN4tCzdZrvf7Nq7ZzBAw3Jrsv4
	 MNloYrHnLJIowe7sxtS8XOMavZ2GtGzOh+u7yEO907n2kO8dlC9C/W54FLGDcQt+naA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=;
	b=EfVBTAC8tynwgV5/YIIbZ3ZNePq/938EnMW0pLdemvlVfaOAt8R9MsBbSt0bm0f7hvFd
	 FAcOyPkO3p1Vw4pF9clkUg75h7czQUKittvaHz+krVzhe69RwnADKJhaSbsVYRMsEZMVV
	 dhAQzZ4Fw7AByVls8Kk1PhvFlpYBChs9yJLOZNZUsVTHuJwRDAM9UC9fZKXO8vhLR2Njn
	 hXWFcuipK9U71fG516U+k9fZXSoCgiSpwzqeYP7RcOUlGhhjAdDBNkTKlx5l8GpfBz8+0
	 dIi1Gy/YsgoEQtx6UJZvesNLy3ZkVWQ3/VPQsZX0OCy2nAZ8ACfqKD6jjluLkyzSjvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBEkQFga;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=diRJ9wgf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6BA606A339
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6BA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lBEkQFga;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=diRJ9wgf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTXT4034184
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=; b=lBEkQFgas7Td87xj
	PgUMKCXYiObvlo2EfLiAxp8KoE/szjO0b6T8LjOQSnkFKFOE3hAxgjDE65uVONjb
	vftvXpejW2kREFvhQ591qFGCLo1Rnwvsm+xnPcDldNA6IxQSg7fImdyXSo0q2f4Y
	pyB+LAo0dUSj2Qx+ZYtLCWJDDd9OAaVCLfiwEeoHtqmYb6Dmafm6vQ0x9ASB6umD
	8+V+wqp3fpMH0V3RvExvJoX2obuj+19E6GkPz+dR3YeHSDOKvODytk4MSQ97wliU
	azcMMIGs52cFiInelru1HseH9/VI3JzU8CsMnrgdyjFgtBr9TCdCYJ96JVoekx3B
	ahD1Yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjcur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:53:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94993a54a73so50951585a.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 02:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603987; x=1796208787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=;
        b=diRJ9wgfKoyZyMWoiRTYjExM2T9r4lZPufOT1pIHPrPvDoIAuAmbKuv/UwUFsFx5xd
         AAEupvnulxS3C94P4fwUHty7ROfty99Xx1w7XAD2MPZenugMuWiGbYwqZ9HBSD0Num7r
         5TK8YC05oAPyI4ssuj4nG30W53EI4vUUNVCN4WgE9bDENvx3LNKrF1Stre4qoVZwyRS3
         YKONrQSzu7H/4bPdh19kfFDqzbPtqubIh5vUWIjl70VnKn/uVpGeSk4RycmnhQ+q44bo
         At2daaxMRYGuhS81MzqUxINutxFUFSKgpGxO3uOYDAoZa7kchvHFoJ2QvBROU/Ql8VYi
         JZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603987; x=1796208787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FebbI9F5mjaTpQVwpaWCeaxrYNjsbfM5/tqyvZhTU4w=;
        b=lr94fWGs24vGeMPoAczQoGl2ziovxlW+37YlHZmH9HkQlhyPs5AhciuxfzaNhZw+oN
         Hx6V8xvpk1T/q4j5PIi49mJdz0auF9yIBhJ1qLc6IBNwc/oXQw5ul0PTligcUm9CBvUM
         1yZwL1+aM9oou/zylcpAXis3UkeJU5B+vVqwch1FJe8CbA8hylNKvSIm8qdkMXc43Kjo
         veWxFqwnHbCJd9Bktec+1vM/j2bB/VQutWvaBBOb00WjdadkcWCyeBD9k7qKWCUTznaO
         +HAN0RVOHFh5ar41lAr0l+OahIzh3mGQ0DNlorsWL8NFtW31M01esVpC3N+492INfTxb
         v1IA==
X-Forwarded-Encrypted: i=1; AL+hErGK+Kb2u53+BxBZ5d7EM8ksr25KSmI+xsAZaS2nXrLsEG5iw3ON+W75kEdqGTxONaiUWm5ZTOvRp2do@vger.kernel.org
X-Gm-Message-State: APuU4Z+GLrygdvIH2Kue2WgzLGXu8YTAkMwByajWiUZHGFMj8ZZMQzHG
	FNbyskDN9GfPH/5sO4Xh7CLbq2S6iBoeqU6u6ryTw5MR71ZVYl+CPIZM7YnlGu6RHKTp9tfrBuU
	1u+u6UlhOso2cmN6t0pixC7I+4NLd4IsINGz8+vk8uuut6+SXi2Efz7eiyF29hWXo
X-Gm-Gg: AZFdTZeJ39YLeLw77giPAJdPr+5b6lo5k+WYZMSjAw1aJZ5GSlujl1CUZqH20AQO5jH
	B8BWDWLwFvRAI9qOzGhYY5y53MBypoozzefig9jDnJ/EBUGNjx5Tw8Z1N9TCCcnxHRXMS7y1D17
	gDm5oC7DY89merESF+4mZs9Kjks77G6jvEMEZ4SfrfPtV9a+w08zBoiGz7cehuTLtgv6kJvh/4N
	iEcN4hZ81GIokntxf9XZTMGcdSHcjWDvENURVfEyJXY3cRBtJOZrat2b17gbBnK9bo6vF2LNTSe
	R3JjdpMAdP+R3FUEP9lMkooFifpdDAGRqMuH3lqIkLFRBHpeirrj0tpanPn2tbk76fNmXuX0LJM
	HvaBkE6ryDAjYbC7+8Hrj/mSHLFQq6QTbRh8uORXReIgeXQ2x+4CLEGZ/9ibtGhw5nQzTkZU=
X-Received: by 2002:a05:620a:a786:20b0:949:6e6a:e85c with SMTP id af79cd13be357-949ba997457mr3195146885a.4.1795603986576;
        Wed, 25 Nov 2026 02:53:06 -0800 (PST)
X-Received: by 2002:a05:620a:a786:20b0:949:6e6a:e85c with SMTP id af79cd13be357-949ba997457mr3195141985a.4.1795603986021;
        Wed, 25 Nov 2026 02:53:06 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm617587866b.70.2026.11.25.02.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:53:05 -0800 (PST)
Message-ID: <15cde6af-0b9f-4a0f-9d21-4e5ca9107a67@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:53:02 +0100
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
Subject: Re: [PATCH v5 3/3] phy: qcom-mipi-csi2: Add Hawi support
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
References: <20261125-hawi-maili-camss-v5-0-1483b7f68dce@oss.qualcomm.com>
 <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-maili-camss-v5-3-1483b7f68dce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX/nAIdJxTQ6W8
 nvNYbU9bgiHTLytdjPDOe6Kv3ccJ+C+NmCrjYMRl4Ko3PQdhxI8GTiF8Oosjo3yVu7J22ljKswl
 CY31c1g44qR/D2AJMlFSYK9WlPKzjD4=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06be13 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Olo7VrpVOdv4N-DtMm0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX0JE/IiPsX1iR
 Yb9bQbq2TBzlKlUMwSeDXTxTPzRZZGAUYSC1ljU6LuoHd2nEPvz4asNjsx5DmAX2yA2bM/U45kC
 vSN75+1pPuRFiMzcC7bB/iZVQAmc+q9iVPNdzRnwUkZ8uDuX36XPs672lHMmP8mkbgJsViZ89K2
 01lUGqxS5anTKmG8KSu87bmUHY6+jKKVNyZP7fLD7b080GQcuKkRvw0DqGzvslqC2AgtKmo9myQ
 QLZsQOKAjmLc9Aidr2oWNg7+Sj3Q0W/rNVct9+e0kN7x7Fi/+1yAU/9doBFbkfeSwwyPC8XJNEN
 Pvw6cG276qO2qu/EUKr68tnMtC2Upfqff49Gp6FKybcAJS8glrJ+Zvmi/4pj6AwbjGeIdNDSaLI
 CRAApdVlDYtSEc6cLVW+TTvd6G9v8cMZ1s0utwFKcLFEWrRJYogXRUPNLCpZ0Ml50b+jm4+gD9k
 vjmNLxsdWBw3wr0sI8Q==
X-Proofpoint-ORIG-GUID: -BO3c0ZUu4bB9VUKsJBdoxqvwpU5GoM6
X-Proofpoint-GUID: -BO3c0ZUu4bB9VUKsJBdoxqvwpU5GoM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/25/26 7:25 AM, Nihal Kumar Gupta wrote:
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Add support for the Hawi 2nm CSI-2 D-PHY.
> 
> Reuse the Kaanapali lane table and adjust the data-lane CTRL0 value
> from 0x8e to 0x8c for Hawi-specific tuning. This prevents potential
> stream stalls and SMMU faults.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 136 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   1 +
>  3 files changed, 138 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index ed40934d67eaeba0c6ac7ac75324ac6292fe7d9e..5d91303e0df2e8c5bca3ea8fa2bb831429a8f1ff 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -162,6 +162,126 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>  };
>  
> +/* 2nm 2PH 2p5Gbps 4 lane DPHY mode, Kaanapali table with data-lane CTRL0 0x8c */

nit: 2ph and DPHY are synonymous, if you rename the struct to something
like lane_regs_hawi_dphy, we no longer need this comment.

As for the override, if its meaning is well-known (the difference is bit1
being set or not), we can add some sort of a booelan override instead of
duplicating the table, maybe

Konrad
