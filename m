Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF7739446B
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518154; cv=none; b=i9LUbnpRmhX9MWYdBQy0ybqMrlU4wlBiWdQJ1j2iAfznkpbdh6Q+X91QmsgTfsA+Bk1z+phFc02A0lr001XVu3nvu+zuUUNK6b/+Bod6RmhLvSmxPhz9P3CQLNkE2ygfILdC4O1ExRWEj1HGNqxmxF8bFunDtrPuJ/8ookPl6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518154; c=relaxed/simple;
	bh=LyOe+U+IB/mkfF5Qrnuhg2LSz/dtj5ZK5bQNJ9Nib9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGQHRUr2B2H8z0bEP13YmijbFQgteCrb8eYWgE56njhibdsbZLlzLkMlhwOluKgZnxLCcD4YkhX9Jaat71m2eyR1e0oRUWQEYIpnSa0zhZdbwmgju99jLA+cQY0kqkUXua1GMVeuJMYPRR/VD5aL/6XA9eaH/x9FJ0e3kIpaBkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIOmjqu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWaV1gb8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIOmjqu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PWaV1gb8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsVSk657699
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CelsAHVswbC6UmMeQa+l59jm
	5QZEZYb2NREk7oPpktk=; b=SIOmjqu1P22s1WEJ3nDXYl/sDHRmQQbPUHPAxAXH
	FzZ40wFLionA3p/Zd9hnAKnRwMgi+79M2l2PuBkiMXf2BoureaBRrMQhsBWQzD6p
	Su5rFlb8qgVXWsHc9TrUTaH77/3wPlod+0mCgWy3csqDo56/FLDh10Xei5Cg2tVl
	DR1M7HhhPoXI5kIriRxdhAK1xwSWeuihWhEg9e+BoAdaEUwQzSZBsrQd6xRkPwlw
	hK92OIuysPxm6aLf1lIpqJGeyU4O4PxwM2dCOdpo5C5e0Ka4nppMpT9cHqjtC3Ha
	XzBNHDjAcYe4yMeqiaSbLW6PD7g2om6+v+Xlsyq3lt//sw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chm4gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:29:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38827cee19eso10434048a91.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784518151; x=1785122951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CelsAHVswbC6UmMeQa+l59jm5QZEZYb2NREk7oPpktk=;
        b=PWaV1gb8owhcfHOEWXf+bYkjjYhT5odAnnlQ5BYybH6ZvnGSs49mdvt66MnNPnwAFo
         znTnZOevvcR7EepBL8rTQeBMk0wI8mssglyR+B3miedK2n383Ar2mldmZACvPMgun+/1
         ymbkdCjjZp4Vn0p0koqwOd8MU2IS2Ma8LF9JwtIKmkEX7IOObxFkDwEfEVnjVfq79v0c
         zs6+yc3OqAFaLAfhhgKTBAJFqa6T/NR9fkoVmxKVM2dOT6V6EosGzcMCObwZL6mhwEaw
         LFaWtQ5feMP/wskLC/i8VZy00MgpbVMIdQL6lJmYmXKh/U6NYoyimmFt+u+jz+0ngcMM
         pXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518151; x=1785122951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CelsAHVswbC6UmMeQa+l59jm5QZEZYb2NREk7oPpktk=;
        b=Vi5lIpENoQj8+/HB8Q6a6tcJbEa9L5N8sG1MCnSjQO3QP0eiMdqqxKlFHpmjgaJvha
         qCrkqP/+CObN9X2lj37HS7JQWQ1zl+MzApXzRByuDoZVGnDyWklSUBkT0K0ZnI4aSJI0
         1xafJq3MHxHzcD+kBHkOCQRDJ1YkZ+ntV4pwmuc0yzFn0GitMaQxkL5wSQpLWz7RYctq
         GFTH8GjaO9EHcuB+1EKALTPnGOZFTJlUrKoWP5tnm33YjXmj8wehikdWY/TVsF39ikBb
         520jv8V15g6lPS1+S8Ff/9Kpi2AN+fkUMNlKaATIHkUFFw+FkR8NmknKm7z/8K3pvzRt
         8NGg==
X-Forwarded-Encrypted: i=1; AHgh+Rqaj3LYRFwFKSR/4z3Ogb3qlh353dVtDwUcoIYm0JexwzsDXaHu/R7tU/dOd4Ee53Y55x9sxO/NAakz@vger.kernel.org
X-Gm-Message-State: AOJu0YyKm/8jHUDV8cH3jFDwCp3lZwqBJG+PgSwxiy4rGwFroQraJxdG
	iJr+T5pFfHSA/g1EZyQPB7kR64Z4Oyu4LKLnBk0PRnvJs1gpzQYoC14XhXir/OrWumHh+WEawxl
	lL7kdQ5D/b72EOX9BWnrCBk4n9s8MUi+ACLbJukASCHIi4fT7vd6ACN5tF69d0W1Z
X-Gm-Gg: AfdE7cnh1yfx8uOahP+Hy6xh3mpY0M6Ighk33PTwHgtVnwijxtZGiNNpgn7CUlz2BHL
	+3+HvBjtDsjhvKICIKyCYElK+Du2EHl1cVY7dAcKSK+u4w09JCH+d27ww4Ds2mP5QyEc6IuN3wn
	M/DzlQmgL5XsJ67ayZ1vxb1NK6pqO+dCrn9QMuf5h1y8ldEPrjDGuSR83B88ieUjUmU+XsASkPs
	2mjNOdsqAzAxPHJWMvYHXXwm8meQcBOUmR6uAsWK/RX5QWqS6j1tJXfzmMbcaXtCCWXyXJiGToK
	ZQJGXJ8Y+4cV/aqsXAI27Y36NrrOt5pwUV90Z5cNRSkx+e+ZWrkX1W3WM7j8YuSG91jodzJI0VP
	6/mawEQKhOkWBd25YQnUz886A85V+MkLP11urGPzEOxUtgpk=
X-Received: by 2002:a05:6300:95:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c3ad8ecd56mr13612460637.44.1784518151130;
        Sun, 19 Jul 2026 20:29:11 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3b4:931c:3c7c with SMTP id adf61e73a8af0-3c3ad8ecd56mr13612406637.44.1784518150606;
        Sun, 19 Jul 2026 20:29:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm36664456eec.5.2026.07.19.20.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:29:10 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:29:08 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add QMP PCIe multiple link-mode PHY support
Message-ID: <al2WBAAHsnMX7mfy@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260719-beautiful-pheasant-of-variation-61b8cd@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-beautiful-pheasant-of-variation-61b8cd@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfXwT/O2+qFJ1mB
 odWmbq3tPluxl+OE8F4yoQihWuo9BvTzQmoA9avkXw9rxRXFZlOYnletlvsATIFKWlWRGKN4X0d
 wk65Bkf1axJV2iHjYD96wEVdSeuwEb4=
X-Proofpoint-GUID: JgCgpiXl5Bmgo3BWDukPgdxQtZchzfNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX6A9HdFPgzV/9
 qWQGseHQP6vrkKiNWLjsLZZM2ijC+pHfYfDrUjeNDVTDba/5hH6neiUw7m5kHxbxQsWdwYxdkOg
 3//O/USDUg3skR9c+aDYY0y2ixZp/nfVaYAfqKOlsYkSEdY9Z2vgzh5G3q1YsMDSj1ulk5UFLRw
 WQyL1xCPfWu/nkRiHr+t2liLHXxKy5zg7y3LV9YF8Zqxpf7os4CmFTIl4ovfOC1bPGI6qY6+Ceb
 pYmcIv7UyyNTrDVY6MBA8Bf7Gk4uwh0C7VBkt2yH+mYNkRgRymr2mlGWz3K6+6m1ngSS9iJIi8l
 o+vu6z6YoLusPTMFE/uWctme0+DLDsrtXW2yyJVea1G9lCvMd/CX7L36N8LT+7P94EaTrzLoi6M
 Ks90j+PCVwW4OFogflSsl9DdBeM6Xxq94uLo6FgD+5PUZHAUcEUibTamQpb3rvZBDqAXWobiMGG
 39MBb5iDYogIKUzCrAA==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5d9608 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P_9lKjKDqroO28rNP9YA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JgCgpiXl5Bmgo3BWDukPgdxQtZchzfNW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200035

On Sun, Jul 19, 2026 at 08:43:43AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 17, 2026 at 02:58:32AM -0700, Qiang Yu wrote:
> > Hi all,
> > 
> > Some QMP PCIe PHY hardware blocks can be configured through a link-mode
> > register into different link topologies, such as a single wide link, or
> > multiple independent narrower links (e.g. x8 or x4+x4 mode on the Glymur
> > PCIe3 PHY).
> > 
> > Earlier revisions tried to extend the existing single-instance
> > phy-qcom-qmp-pcie.c driver to cover this hardware. That added a large
> > amount of conditional, multi-PHY logic to a driver whose data model
> > assumes one PHY per node.
> > 
> > This series adds a dedicated PHY provider driver,
> > phy-qcom-qmp-pcie-multiphy.c:
> > 
> > A single PHY provider node describes the shared hardware block. A new
> > "qcom,link-mode" property points at the TCSR syscon register that reports
> > the active topology; the driver reads it once at probe. #phy-cells = <1>
> > lets consumers pass a logical PHY index to obtain their sub-PHY. Match
> > data is indexed by link mode, and each link mode has its own array of
> > per-PHY config tables, so one shared provider exposes a different set of
> > logical PHYs depending on the active mode. The driver inherits the PHY
> > settings and link mode already programmed by UEFI, so only the no-CSR
> > reset is used, and no PHY setting tables or related structures are
> > defined. Each sub-PHY owns its register regions and power domain, so in a
> > bifurcated mode the links are brought up, and powered independently.
> > 
> > The driver is implemented and validated on Glymur, and is intended to
> > be extensible to other multi-mode QMP PCIe PHYs.
> > 
> > This series depends on a prerequisite patch by Krzysztof Kozlowski:
> > https://lore.kernel.org/r/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com
> 
> There was a v2, still not applied I think:
> https://lore.kernel.org/all/20260609141608.354186-2-krzysztof.kozlowski@oss.qualcomm.com/

Okay, will update the link to point to v2.

- Qiang Yu
