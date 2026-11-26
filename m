Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688777;
	b=ckxbr9PZL5IPGHr3YlzHYC+lJRBY8YVnVrfODC69W7DqDVafgcb8Z5QHJ+bfTzv1bsdz
	 VZr1ic3GrS+VgVIzLNCVVQ48cF+XlglKqC1jer+7s4PVoPPpTlKFULgd5E1fZlGz31Xt+
	 ybo2MVgPDUwh82Wd1O2PQeEx+MuuUZY98qz0L6/RDpukQERn9UZiz4NbMG8XJ623ol+6H
	 kpcJASsGxRQpdHa7E7JS05IuzZdYWCpH/9L0hHuG8v3lZEf5R9j6WeO9mBNzVwqyC0rMB
	 D0kxvw1umnotw1FVynd3dIj4ICpIBdc/ERuoDWjH0qVtF6eYy9r84jpZ2+aw+KKGCTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
	b=gi7ZGgutT1aZsrqwXIlEgG4x6HWmR7HjRhL4YIgKLeBmRS4ckgwvcoRTKDx8Do2x9HIq
	 zon/RYLEqW+DVVihhbk3M73nqGtmNlNNqUwN+KS29g4ks6nZB6ec0srA+4HcZ3YkILYrw
	 dVn6JZ9IjXdvLC8YEFTppglMegMw/O7MqYOnkVwVHhznduHBU50H1Xl+/edfLRYt6gaCe
	 4/fmHylZzeGmr2Tv3PgMiO9iWs5XoKoz1l0jfN+gsUrw4DY8r27M2LOvczsXMwGWH6+11
	 CgAEl+5n3bRJKhXjDAm2YpT/dRS2bZpPhR3i5AqEDb4tsqru9XsDuAU5ikBvDPK8rUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwghNais;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A59606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwghNais
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NZhZ2860295
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=; b=i5lJGnF4//4uynHl
	2fu/QwxJDg4YM8WIVlJR5yzhCv3egiSmybo0IzbE/1WSyCh6bZowCeOSenWLdMNr
	Yfwaj+B705by2Z27lCCV1LieK+R2LwXKAgnrnwiSDujnoVZdCldukk9kxHzknhOp
	MmpFqiEzkvqT/brCf30FwKkA8S+BByC9q0/sgruwRfNkfBGhqyxnhodYsM0kwN1o
	/5m9XxaZCbx0JWkSlQ6Qhi4RI2VEQHxUg/f9vidoDMxYtK3XTjMD5DcTeRka0tEe
	r4beDKGBvjyVTClG4RloaiaDQgJGnuKm9JobpwJhz9cbVa22bCw+QS2rAgfkT7Hg
	AxvP1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g8gmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 10:26:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so16681441cf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688775; x=1796293575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=YwghNaisJhCZY4pk0FJpS77OPA5YWKJKlW62D8cXe1w+G/9b3AqLGVO0gowS5IeXAh
         rQkxdRGFlmp7PS5s/TU1nohkHAv9OvWMCQCsVAm+aqDBK6h19cEK0WQwmnlqgiTddAWz
         lgTjILqt+vdmalBWQ4ybG5dvCX21HHkQoOfCWArloIAIvd6C3udPIGldfM1kR0AtVfx4
         mlcrbRFKhBlPOG0Sc15bF+vTyZmkufqcpRYBp4M2BhfcyH02UfsqtIaTsInBbnnsJ7Cs
         E96GufdJrvZmhqWiyTBowTQ291PKCzqp3RoTIOk7HnuBppPdRPPEe1SorjfH1pQBm2Vv
         gKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688775; x=1796293575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=BL/5BiBAqloVwXLYzCsEwceY7Pe4qJRbXBr7nnS/tzYdTAuPCGKIOaia6iIPipamyq
         YxMDqHbOKNyUT6SYApFY8fIhdeSWzfcICJccPHPmegkFZgE1qBKrjm+NBSNX7sh1e3Pe
         nr1pqbmx+G7C27SFZgrnVES4WhyjkbE4pyxdbEFmfXmtFm5rdlzL/odj749YQ4K1pHed
         tgJ7kq73aNfkJp+a6EyxrcfQJ+yBge1NrXFZumM9kgmyEPt7GqZ1bHeD9O8lJXsp/96i
         8fzLYFSuNKqdwCPAy+/z7qh7WzSRjdirjV8IChwAOWPAwmJWDeCJvaNIH7KyTAb4JxfK
         zVcA==
X-Forwarded-Encrypted: i=1; AL+hErEN/brhPHST4udTL8bxNCsfG30tTFOKDmouDKJUbk+fP/vSknGr5/6KvyJCAs3JGddhjyfEWBAdHS5a@vger.kernel.org
X-Gm-Message-State: APuU4Z94i8lGot5m5Um7NHwXXWsdw8MgxhpTOaloTKJQfmvm0rB+t1oA
	QfW/VEEZR4dS3ezlmD/kbiq0FAiTE3f+9m8xu8JcGJlhSPwMXZ7/UviW9Hb4aTupPAULzClAFW/
	DcaMThWCksetqDYGccdL6SqxIGKFudzNafWXyuN65c6BDb7QRlR0t02RGONHF8uI9
X-Gm-Gg: AZFdTZeH/7p7wROHNUTtno/G3jMcjRFIWAKg8xFpBMlmcrX4gZzRT/fbxK5xP+IK+fe
	LZZHQPx1NXMy32fsdDNc5Jhn/FZYx9X1zF6j8GY4WwNo1syJduT2968T68ZFQMdrAHSwe1ys9DB
	XmAbkK4+b5CCbuNrigYsd6hDZ8uojInCgCJFTTgbKmCpZ3UbXcFmX+qvbOuYLji6Qqw/xpSxKv1
	kpB0AVNvSM8sbWZd9LsSStvTbfPr+6ObUdR6hFBAo3u6y6aBRWvTrZaWig9ceQ2qaX4WGj4Gbzs
	IU5nHaGyJd8m2ms3uZulmKSVQAJ3ZyHAinQPAzdsBje+bQJQAz/KrVom2u8poGs9+8DhCkRbqKO
	6mzumZKOBIpPHIKAHse704vUK9yyWUgDjjDv63W6LtxjismmhTvltNDhvEbrxe/mTq1py8+U=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307661285a.2.1795688774813;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307656785a.2.1795688774355;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm732536466b.51.2026.11.26.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:26:13 -0800 (PST)
Message-ID: <4f19aecf-acd2-485f-983e-d10e82eb91b3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:26:10 +0100
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
Subject: Re: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9cOYQ3LiChAC28KWcg1BcfOp9XGZ3qKU
X-Proofpoint-GUID: 9cOYQ3LiChAC28KWcg1BcfOp9XGZ3qKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX8iRqmcadNhxm
 QFbaF7zt+pnJqomPUkdIQ7m31TxWcWSYH3x7DM1vCXprljEIE/cpDxNhoxaev0onTRHTAO8tvX2
 S09Va2ARIPRlk2gnn8UK+52ApqSHX1baGGDnX3Thld7aY33K/c2XrO8FgkNd9FWVE67EAPJHqH3
 XCuKt6aql94iUCiD2/GEKWRpodWewtsSNuu1//P7hn05qi/PbmfqNYKs2jwW6usqJDMYHuu1l4R
 EEXLT5cMM9VCBI+6m2GCDrqndMaNafwqIXU0BKPKmPqLPRUBsZEPJj3Jrs/rJ2sY7n30PSoQKna
 6tVJJ3sqR1A+vz6BQx9z2fVjFK5WtIXPtz7NkX5ZG27OthSE0wL5InknqTEjzB5kmJZnW0t4p+G
 CuM6+QFqviB5cB8reDqS3BvATp+Ony7a1CkMXQx5Vj9i5XlLKf+BDIuuRJ0vTOiFrT/OMHSrhlD
 Q4LwfyaJ3B4PYZIOIZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX6eMg9zYZbRQz
 0PHFajHPT/rPwiv89e14cKvVEfwF2c6upZVkp7i1/jkYU0TTpsRXiLuEus5Y/kzOPmg/PHokuIw
 ltLsElMkJwgEXXKbpWJxpYeM97acvXg=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b080947 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_U4GOqps37RzzdhOo_IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

On 11/16/26 7:13 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
> using the mode control and status registers to allow clients to vote
> for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
> LDOs and not supported for any of the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
