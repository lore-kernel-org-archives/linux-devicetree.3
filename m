Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4458B288BA
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123984; cv=none; b=ISd6aBpMmIYcdw910l5NT4vtFUh/guFkFcReqfyBDezWSQxINobdnCvjeVSFL/cqY/QJO76BXxsMEdg01JQ+cIW6YZoa+bucbA2PEz3GO+jj3tbKrOdHxx/zZab3aOH/8I4Sfbfo24iC/9gn05rDYhT/Sms4x3hotxTuQbNTrsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123984; c=relaxed/simple;
	bh=hruM/PHaLAkCf7zVpK5xJEGVufHn72WbxcVPSze9Lqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDtnyKT3kPB5p5fOb3FQDdU6mtcQq8POiWgZGHOUlLc0BtWHTBpI51jaa+nCgvLYEIM95b1Ff005IljTNPhBSAS1SvxUDyrDvYtKNj+HRECIP9RbloMR5M9zun+i4wsipr9rhcaJHgC9J3yHu1QB8hCpvYFuUIt0kE1GukqOdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVTNoKVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtTURVng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVTNoKVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtTURVng"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KQ0Zw872291
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 00:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YtnHongBjsDZcPjVpSHCdUSm
	qjDL/oyRnfo9B+6G6+U=; b=HVTNoKVlj3+uziHECV96on/XvgNtzFa+AKqfIWq/
	nManMxj/WiV/09hkgU2KDVXzm6tBnSU6NHVOnqaRxp8JFigNZntLUWtcAskWcWm0
	Gvo1FdN/WIQBeVpfHlWu5DRFoYvuvbE2P0ICoGQpymXMJTtvRmFB3mM4naGLeG5V
	0LYr7d+3+dyFxvz9SkZSTh+kvKtvuX+HCCOBe1pQO+PLU2pXMziTVuJXGcRIVDI2
	Qk5Dduz2ww+SzPpdgWAeLx3Sl3eUl8oCzjn2wU4QpXgwFggew4xXQPxW330C1ag/
	MwvObTRpjSeDaXBrVvTVoKCcz4qi0/2tIIOk69FZoOW5nw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4bpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:13:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so104695685a.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123981; x=1783728781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtnHongBjsDZcPjVpSHCdUSmqjDL/oyRnfo9B+6G6+U=;
        b=PtTURVngrYqUQYlBqMXQE731PZow29SwRJJVkikuIBHWJFc9kAiWKaPRi4g5NZHrIY
         f24G803q/Vy4Dg//yGg5wV8tEVO1jnYGgeRCUX7dONJhjbcS3/JJUiA9iHjsmY9LZ/Sz
         cgppdztm/YdQWrXNyDddk1lflGmy4H1ACubSa62CKEaeovLUHmc2RwXT7K3qCA3qz6/S
         lBLrAo3KM1rzsTmXuTab1ghlKRKvnDRbOBYGVsBgyC5X7AUdMO6Reet4qWsBmRD16+q9
         mdve0Barbrt0fqR7MTD8SSZ8Oa4Waurg1RrBN2ipu/bOT5r9N+KkIpd88lG1LSx/FWLo
         rJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123981; x=1783728781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtnHongBjsDZcPjVpSHCdUSmqjDL/oyRnfo9B+6G6+U=;
        b=pP8VxkG9AdgJFF4xVH8WdALBUeLg8tRJH12RyN59XXV/H6po9dAhQfHvFIDmzAJVKX
         SiBW9aEQAzLWHe3+7VmD4YJMJlqL6LNDJ6e+l7GeJRj/VloAMXBaqEku3Km6q8zrLm3s
         unJ9JgA7/dabPBQgakagqnrhldOV6DhlZtpXehNgVKdUnfWXlmXEcYMqwgVcSn9pBFuY
         tbpgg++EKlP24bvWHvnEOpVc30OB9pmOJht8XyrIqKj8h81bTo5ml+HIr807Ij22y82d
         I3eNC2aWibesZcvmEWVruk2HY5//e1nQW8SjjeVyJH0B+7v/hPFDPLTU26Dba6u8DEyv
         5uow==
X-Forwarded-Encrypted: i=1; AFNElJ+h9UYgdUiTvNKxEh01PGdHkdqmN/m5m64B7134XOZJlM0/UFm2vPnjlWPgURJaBtP7PsQ+tUPhdH+E@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcjtHlf3HmPWlzKrMM8Ko79h8t40Ql4iwOVQcTiDrbTsHCcro
	t6bZs5f5gqT5RISSEvRhE13qQG7pYsA5mhvXyrCtqLYOo6N44D2YlYxzzk6QJNHz0J5y0WZv4pd
	GNPzXThGVaeG0t+CibBca0unf1RUozTyllxVHpEr414RO1gtC3kVrTmO/Ju9bGBQk
X-Gm-Gg: AfdE7cltOMTEU4j5WVssfNz+M5WguC36mLH17veayjsYs8BgDUQ+ORM+abuYrQNrGkC
	7eJe8WoG+ozmdGbnPuH0dg3anYUn15Vsc4CPdozHv4d8DyBoiK17Ubbur33x7rLQK4YrlxhDfkq
	Ms4dJbjvpm6MigYOyTy/6sB2xBi7E6eGmZtKu1O5uQI3lGb4QdpUFDd1bFOKDfQQHWp51gDK1sm
	c0L5Hkbpq4sEBEYelNrmb2W2SkNqhO2YQI/qyspf3HjgA+XEqoeZJ49nwPno4NRZXXAgUFjRXDz
	pNIdZTnC/5M+ao4QAveA1XpgVYh25PSiv9sq8++74rREVAQtJl26ttqMHKGJZWNtWFGbl5eCbFX
	v1ghoypSROHfPIs0pyOb+ntZYfSgpdVwWpQNDRZ4wbg/inla7ubSdxVOMa0b5fcG4yDC6l1ttin
	HgbQEZx0ZUApLk8IxnVLXP+s2u
X-Received: by 2002:a05:620a:17a9:b0:92e:4927:2002 with SMTP id af79cd13be357-92e9a4a5359mr223197985a.39.1783123981560;
        Fri, 03 Jul 2026 17:13:01 -0700 (PDT)
X-Received: by 2002:a05:620a:17a9:b0:92e:4927:2002 with SMTP id af79cd13be357-92e9a4a5359mr223192685a.39.1783123981070;
        Fri, 03 Jul 2026 17:13:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm867257e87.32.2026.07.03.17.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:12:59 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/19] clk: qcom: gcc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <2yegefce6tymennwlrarvkdirqsutsvhz5k5sbfeon3kyzvkll@vj2xqbiasuci>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-1-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfXxn0gbqcxw3VT
 mDd4mZ6x4C6KyiIOPajYyUMzJMsDjyw+bBnI9LWzE9kyd2dqTx1/BzGb+mhyp8x+vUFnwBqZCtp
 armZmeKIzkwyE2OePattZsPFG73b9D4=
X-Proofpoint-ORIG-GUID: rknH7PYGGd93inh8-xPXdM3JmC5HXxtW
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a48500e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=P3Ave3MFjIR_A1ojsb8A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rknH7PYGGd93inh8-xPXdM3JmC5HXxtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfXyIxvo2M+NqCH
 XMHguThsgDJfeB6G4wVBmYeYchp6ydQIyWRb/tVSzj0mfHE1sColorM4vFobwXdo7DVm+tnpyTl
 rOArIbuOm+t22oxkO2a60ZbxicEAVsGXNhvqJIOsJK53WzMEblthzb6B5ANxI8DPHU4aIwHkrng
 vuYqYhVs9SD1w9PfNj3q4hkZJtkS59b5iUg6KjrIoUSCGCs/n3OB2jkWUna9/j+zUK/cVjyv+XT
 1rRIJ0QRE+LNe4dyeCbYZlmNkoWBsoXiEWfba320X9cdme1S1ftd0T86uNVaMyS+LnFH9CYVkxd
 0hkjzF068vrFEW0tiYv2ExAeJ7TWIaz8tmNxBJVTxOMD60bX3IaAle+Q1EyKwT7BWWVFqJIDv2F
 cLNIONpF/Ue0N0A7M+UNw1GtvZN5urzzPltLUkWTrEXZOGyhg7VYtnnzYpy4YFZBFtihQA7+Htd
 Xwlfjusx/pONePXhG5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040000

On Fri, Jul 03, 2026 at 12:01:23AM +0530, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 113 ++++++-----------------------------------
>  1 file changed, 15 insertions(+), 98 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
