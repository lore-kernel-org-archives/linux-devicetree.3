Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF053E2F8
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081147; cv=none; b=Zg+klg9L45U+sy884vHjrvK+iPC8E+IWKdcYlhHTZP0/KO/ObZ/Sy1ZkCIBK37sue5qkaVVrTgVRE3XolZF3x3nu9kUnodtNmqjMEIQR8YL51JhXF5NbsXr+YrlfL8dNv9/Mk2l603SQgixPjlhphj8YIdyVOw9cqqtglfF+Tb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081147; c=relaxed/simple;
	bh=teH5ei3MBK+NMl4BXDarhxXz1RAQj80oEkiGD43HreU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEeYc8aH4ofpjmTMvchDLhVGFCkWYCnG/8ZxL1Pq5hwgP2Wy5zs0gqsERorn4dOqOZswpIQgaUWkEM3mvkttU6O+66KcOkBrI0/LGQXy/Y7pYMnO0QyNa4PDajr/l0CRn5nNMYC3TOcFFbaL54ADota0xG7WzviUR8HYJ6SSB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBeoOfbf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ut66vD0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBeoOfbf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ut66vD0P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPUia4077927
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c2oXXnZSchD/J/9BfqsyDFGm
	NEvGeY7Is7L4w+xWaQk=; b=GBeoOfbfqUnEl6W4jGX6cfFGk31pY9sW9+sYL8HU
	1UZeijE3YYgWODKmIfFkoYD5arlMe5XkMx3i85xvlTemN3PNEgQnC/xKMcwaMUvQ
	t+HbZzQSIHlavc8y74o8tocgQiZweVeGKL+dUKMYCWLN1Jp73IPsLw/5dZVIWfIH
	tVzHPx6fipIh4kDy0X6Br/aDgwQnxJ/YNm4wSxPFp3eFTzqpu2UTvkBHAP8MPpI+
	m/8CTY6ysvjBe/XCExRLJdT8m1FGgHGuYKTKxQ0y6RtKPt3ECo4nTrWbSYkuBLUG
	0OCp0t5zzJcFaQe5dtR+kfTnviJ2neYOYjZhinb2OH0V3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgxnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 12:45:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso5232515a91.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081144; x=1790685944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=Ut66vD0Pz2e9UJsuEBemmgA5mgiwZp1eXCpBJo9kImHL7qTYyWip5KyzK5x4+x4Uir
         obaLJsfE9zatxvMtEMwC3ED0C2ufo0d9BJpUZ0Tun6Ln8If4vdIGyZwE/+8aGeegJS9v
         1Oh9dgDsgr+XPj+VG3Mq2Q9UNd8o4WMpawChtGlwjWYKKdBR/1zMRuzIRBnqXMbVgwpE
         1hmiZuWaVgcTdIDwWp8jEA1CqHx3elGD64q7hSlpr8vLPyj2mYpgoG31bxOODpqBtUEa
         HiD/LTKlE6uMieSrVl4vmDIBc2hbfWki5gcujm2Gmdq5s8/v7OQq3UxWA2HQZ4gvDxhD
         UKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081144; x=1790685944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2oXXnZSchD/J/9BfqsyDFGmNEvGeY7Is7L4w+xWaQk=;
        b=LkfuXAf1WuxUzl91bK/pVc0UfnNxmdOG+06A8IV8yEvXZwT2zguS7h8sKulloKz+Ch
         Yul0xFoUC0/CXf/AOX34ye3JhAKQk+XJubrZ7RylxCCX5aFB6ymGrIIwNXxeqpo5GVRE
         ZamninyWDBawxYU5EUWqralrrEuSIZ6xSN8yWdft21NKGwCHbRVxm07aXBdBbMiL2xVE
         otTH/AfyANjEBYXwYjh6+sxb0ggUsKvztt6ys6QZPXpb/LTQxpEV3d89TjZ9xQf8laRk
         ploMYu2QTZrZZGvyIAYNCvjwQwos8sVdI0bpWDOBH5Be2mYZ1+KNsB7ZrZIFCIpWX5vF
         1lKg==
X-Forwarded-Encrypted: i=1; AKwUvBzkg4WEX1kca1OnKrrSwb7lkVP7F+HmhkbY5xfpgGt+sp8SjGV3t3I60IEzkydVBMS0KN8a7k3gYfLj@vger.kernel.org
X-Gm-Message-State: AFuF++kBRDA2DjG46tMU8UqOn0EY6d3uvH2XTTP2d6GaoAIJLFttJF9h
	ic/FTCbo7BPgU73zpGy2ssM52FDS1i7lncT1iKLIM3YPlw5IrBPj1F6t7vNJCa/cSbIFsJGtEi9
	K9ZZiTEdNe16dn45reqe+4Zjzd+EW+KEYc9ai5bujNVx8QOTZhIKQL3IvV2hLSdMs
X-Gm-Gg: AYBFou3B8cEfQdEfAXR2vQDjn3ATiil1654a+IpkMbyZg61VqhG3vjbryCUv85+vO5b
	qiXKD9NjFq5YrC8WhsqynmcUlvv72PFPqG0hcejlqLn2A8oLYphSAHi1gI9fYWHMnkXAS2Elyb9
	LhYptvgpGFwPUWbfCkVQGfMbyj4dx5eyKYpkERMwzuLhb0aEp9wcOFRmi2sHMVZEssRS1/cxjXG
	koEHq/O4B6lmBiS+jsCXnVGgO1yIKw/zuO2NIHLzdj0a5UyH7yJlGWF5ZwSw0AZX4ZYDdjZldP1
	nmlx1BOb7RQWZ/lBoIeKopp+Zg4ewN1Db0zgpnuCfFpXYqqJzY9UYzpYm4APxUEIRE3MajjE0D7
	bQwEJW6bjBzoAxCOD4cFlw4EzeleqXdCy5URzwA+pgg==
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852116a91.44.1790081144034;
        Tue, 22 Sep 2026 05:45:44 -0700 (PDT)
X-Received: by 2002:a17:90a:bc8:b0:39e:6a7e:ee20 with SMTP id 98e67ed59e1d1-3a073202727mr852079a91.44.1790081143453;
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e574b5esm3204533a91.7.2026.09.22.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:45:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 20:45:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 0/9] media: iris: Add support for glymur platform
Message-ID: <arJ4bUn7ZG5y51DA@QCOM-aGQu4IUr3Y>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
 <20260917-dangerous-illegal-honeybee-cf479a@quoll>
 <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad32f584-ea27-4da9-9397-147b887a7d68@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfX2Kcax+ZkR2mu
 1Tr/9+glPLmrcL6gqhEheNTTdV6Ejx78AtC6H9qrTSrd23mj46+whUQSeNYIBoIZOFU7tjKqkHb
 icBonS5AuwiVzXfzQeWXNbhkdUvMH10PwHkMUI7Zd0namVVtnchBTSZ3bOIV7eFmIbUlCdQVlHO
 8nL48ErmZw78UElCCeKjEiOPEnfw3aEZD2D9TYNOzSW3sP9K7O8QISF8d18fdf2x5F5abOy+9Tr
 bqufZIPO+teh9vsnkhFHTFQylRLhzSN3enSQ+kjhscrFlM6IEX22m8ca534ZQlei2KMhqVNfeZV
 p7O6eDsS1DMHGPstGQErb0Fplaj7wlBIcbDujY0PcFihMUgRJ5rVsyYSwEUKIkjGTysz4v3izoa
 qN9yyFo7i275SLYf/cHPgSSdZ54UIc/oYz8Qm0IpQ2/8YpVkVE8H7Jcnlzl37J9UdR6S3AgQP+0
 vvEZWdGpE/T2IrO5lMQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab27879 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s8oyx3DkIhJI7QqzJRcA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Td5u9Ss398EbDffvR8_j0rotAbtHqcpa
X-Proofpoint-GUID: Td5u9Ss398EbDffvR8_j0rotAbtHqcpa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NSBTYWx0ZWRfX90x92ep7XQSy
 VBFT5MQEcN5iiZbDwm0ZZo4HZvKKdM1oUDv9PSmXBuTYZsN3e9Z8Bpg6uA/IrJ7Jc90H8e1mY8m
 bPiBuBexlNnduagoh5/NnXSfXr8iH+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220185

On Thu, Sep 17, 2026 at 09:11:50AM +0200, Krzysztof Kozlowski wrote:
> On 17/09/2026 09:09, Krzysztof Kozlowski wrote:
> > On Thu, Sep 17, 2026 at 10:30:19AM +0530, Vishnu Reddy wrote:
[...]
> >> ---
> >> base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
> >> change-id: 20260917-glymur-627d049900e0
> > 
> > Look here:
> > https://lore.kernel.org/all/20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com/
> > change-id: 20260601-glymur-4fcd4d832ecc
> > 
> > so now does this work?
> > 	b4 diff '20260917-glymur-v11-1-e0c8bc914742@oss.qualcomm.com'
> > 
> > No, it does not. You are sending bigger work, multi-version one, part of
> > even bigger work, so please get the process working correct to make
> > reviews easier.
> > 
> 
> And it is getting even better:
> v6 change id was:
> 	change-id: 20260515-glymur-6e69bc258fb0

It's funny that b4 processes the change-id in your replies like review/ack
tag, and so they appear in commit log of every patch that b4 shazam
applies to my branch :) Something like this:

[ commit log ]
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
change-id: 20260601-glymur-4fcd4d832ecc
change-id: 20260515-glymur-6e69bc258fb0

Shawn
