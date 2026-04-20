Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D142FE057
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708148; cv=none; b=Gt05qiIyr7JWBh+uswGm7XRMdoax4UlL3YoaM3UYFKKyzmDefZLBwEy2D4yzlS8nFVwqpKnThAwCXzYXPgE9HbbVr3HQz+QDIJtYM+IU6RowbCrniC0HKJNROH9o0YLXRNf4ji9wfK98th4lg8J0gscI3HUkE9HzTjRg+i7AACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708148; c=relaxed/simple;
	bh=QPOzdTkTnKDPqiKWUp1qxBEtNuz7+M+d+MCGMi9gFq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+kQlxMsmObsBSWzjllYkobNTzjMHSQipjJO0TcI+0FEN7qw4gpzwnhaJO8YT9uDvN5mWpiu+l7WCn9Gvgq+wHhFsMJeuEHzIq0CvUYAQZBbBuWsNcwxiq5FSt7bJTAb/F4rtm60aYw2km3mZxL1jhII/81RQ4i4+kjYc0kY8hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KT0ZfJWh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGRZBKHH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KT0ZfJWh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGRZBKHH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFZ27T2281708
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ADkajNOwG8DU5CpO8r0SYQ/
	0ro5URXBiBxiGK3Xx+g=; b=KT0ZfJWh+079sxfBbShxDUjQEl80qeEHNU337KtT
	IQx7E1PJnlHjwe/OYDkjCuqH/TqD4E2oOdRB0q0b5x9vlO6My2R83k+hTYvl3EC3
	gyA2d/NV7wPOFxLbmhFjloOwHl9376tSZyFquotTC+IJkB7AmDtbdx82MbA32PsJ
	amyJYlGSY3HEMBqVUwdLqwwKolFE2EMIXNTW6pB5YkoxbRCRHKSt4ziQ7QQwuJE0
	Jbkia4bM6fkB6R2oLzWUJqU1wFKpPjbazo4Bar3NcE/VEwCTV1oli39EfhYNU47t
	LBlF0Tn2HdsCmmkWSvYYY9CiCCagt7oVGyJHE47/j1jbUw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh59a0tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 18:02:26 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-47018d3424fso3927846b6e.2
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 11:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776708145; x=1777312945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ADkajNOwG8DU5CpO8r0SYQ/0ro5URXBiBxiGK3Xx+g=;
        b=ZGRZBKHHS0YW7szdOmDGVf8QIqdWUI5nayi3AuBMhhxarM5jiKWHLDV43q+svmiYB9
         c0ksPUUF+0qhE4Fjv/Yxwl3GfFfPFwhb7YMAXahIGH3BDSEfIYCwYtvV3c6QxsDzEpJS
         6iR1I+ck7DoC8uwHpJXrXXe2Z/95+yj32f6INWAuVujwv/8dfDCxp1Kng+YnBKCiFW7Q
         jwQWYa1jgpEDQBaquuOGbien04bBWCwae2oHDDAvX2dyKv3SHgwvFRVCSU6hDnX321pt
         m1iisaCV1UGUxP9FaKvdq02YImi9cF924kzzFAP1at7ZIJOjaQRhSylLYrVg5lNmFsO+
         4Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776708145; x=1777312945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ADkajNOwG8DU5CpO8r0SYQ/0ro5URXBiBxiGK3Xx+g=;
        b=khU5Bg8JbfFLM36dRg3cV+Y/zTcereFjQAp5nc/NY5JT2UbN65rHhwEgElW+JNQR6k
         rfTFTwp+73/BD49uQ+a+bApingzTjV5mIumhQGEI28HB+zouCWXJhtpLWV2S7R4sZfub
         4TsN9ghElc/rDzUqHendOsccUaOGcKRGyexEnPQpj5wYhVUPQIdQgkTeG9iEc4h+sdo/
         Nf8v5873vwYQhOKbIaQOh3+3Vlb13lgNRvIabG+4j0TP+kEFpO7WQA+ViVhkTzV6cQgI
         KX9hLZDp+ywT20s1RtA9NPvojfFYMlUx3HjDJ+OfiFJHJbm52Gcz3mXP3r0loy4OyJJs
         +ZNA==
X-Forwarded-Encrypted: i=1; AFNElJ+IIM0Bx5kDHxc1iQQuhqd7PcHC58Jiy7hXjz/+dk1Ls7ulDkV9fKOIPaCGVJkM6ucyVGuXCoQYXnBU@vger.kernel.org
X-Gm-Message-State: AOJu0YxhTUg4NbBLqiUizHoEBblhbRlK4bn65bSHUGVSmZRT7uLqLJX2
	1wnrn6qbI5Mzvt62piFsRtOlDQW+7b6u9/AjtbG7oNF/IAwV40qATjQRNLLTH+azF3jsKH4Acmb
	NDoqZ76kOQCeg5mjwqeiLmsL9FnCkdeY8pPUJ3TevTKSc2B5u7zAL9fm9us7htPGC
X-Gm-Gg: AeBDieuCjAO2K9kOg23dEveK6hs/Xur8beVpxqbdMm7/ALaWgmhPwMnuFFREImreBqu
	TUAilMUVsAlnTX91o+qfL41tIS4ffS6XtpBUw9U9oIvmIk7IO081/6FFlYFItga4w6OJhA+ppT3
	L8NXziKHdgbRUGqCBjP5sZKc/998wtooyr+YOsgJz1Nw5OxedfNRR4sgRrpGeXE6vhrkN/dGR84
	pyo40X12Au0kwBTuYzzXaxuh83WPsLUve03IaTO6M6TCEvKgbQrIS2xWbagT1ZloiviYtHXBd5H
	vYCfOYLrGtOZxsummDt1h8RNCRM5N7wimQd7PG9QlQpfo77VzI2nmyHA42RNNaRDDdoO58GJ09m
	duElpzXK9To3mtfstfXlD6Jkp6sVQla0S58dNb+0o/vDnjIWRLq4CzmBfK3udeEEnrCDfKf8bBZ
	ujrwE6/pghPOEscqAC0tpKEa+JBeCDQ3UPFfLSCmFLprG6Zw==
X-Received: by 2002:a05:6808:14c2:b0:479:dc28:b71d with SMTP id 5614622812f47-479dc28b98fmr1483232b6e.38.1776708143930;
        Mon, 20 Apr 2026 11:02:23 -0700 (PDT)
X-Received: by 2002:a05:6808:14c2:b0:479:dc28:b71d with SMTP id 5614622812f47-479dc28b98fmr1483141b6e.38.1776708143325;
        Mon, 20 Apr 2026 11:02:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm3147366e87.36.2026.04.20.11.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:02:22 -0700 (PDT)
Date: Mon, 20 Apr 2026 21:02:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
Message-ID: <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4Dbs69_qFeyy1cfdZbUUSMNGQucOOQeI
X-Proofpoint-GUID: 4Dbs69_qFeyy1cfdZbUUSMNGQucOOQeI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NSBTYWx0ZWRfX8U9DN8q4+JEt
 y5r/hkDSthdU0/bD8k6gJ4CKSoDY8yI7augs0enuFp9mZ356n/dG6SolI/IR9k++b6ghCe1UioL
 s/M75CdG7JZeveckrJzgQ9mDR4IjeZ+n3b1g0DI9bHIsP+Dr5VFcOoqy81PVO9K+93JwNEys3MB
 iJY7VWGcxd8S5LuPdEgX4N0jxVJabCgFb0dAOuJkvQ+rypMXqUB+k0oid1seyg/SiYPPecpRPFU
 cS9gCA1CfcGIk1MS9PIHWq4D8AyvAK9nFpzqLtHgxzctepJYegkOC8INZVTI8JsYhyYUHe0QM3+
 q/Fu68GtPnAq2auyvJsBVDdYkDmOAvh4W1Txr06I/SCmHhNC+jF0fFrUSmbH0vs5Oe88YJm3xBb
 lgX+Ru/Ty06pVrlNSXMpO0qWdjY+vW2bqZxj4ZgXVWyw/tSGPsoi8gkdFiu/jGVW4omqRi5PohH
 ti6lC634jdTnSzk6fdA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e66a32 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=61plZmegOCgpoSuf1scA:9 a=CjuIK1q_8ugA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200175

On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
> According to user manual / programming guide there is no separate PCIe
> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
> is marked as the main block with additional sub blocks for each 4-lane
> phys.
> 
> Describing the sub phys without the rest is not correct from hardware
> description, even if it works.

Is this the case for the other bifurcated PHYs?

> 
> Link: https://lore.kernel.org/r/20260420-optimistic-unnatural-stingray-80da35@quoll/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  5 ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 39 +-----------------------
>  2 files changed, 1 insertion(+), 43 deletions(-)
> 

-- 
With best wishes
Dmitry
