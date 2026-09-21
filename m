Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F6A492E48
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992226; cv=none; b=nyFbxNgpHc6OKPM+ESpCnwuG9DOptCENUDuBPjRvMJd8NfbrIhyXjpBuxK2vso/47PEdhf/pgM4jbVt5n6o0kVSx9ou3cRUF87BiYKY7tgyqTAHB0VTI83xJqm8xZgA+uDlj0zwS/EOURZNsoRPhQJYHeEbjKIscAOzE+bjQ1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992226; c=relaxed/simple;
	bh=dkCg0VF/nmtJQ9q41G4WkvDXretB+OVH59ybsKpgbv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9o+LmoZatklUZl79RZ4zFcCzBGkJYJVdcs9HvbA3s3RwPprf3MFheSgc8y9F4U06Gc2lKYT71bOd9roX71U1tfd9ADiqOvAIqAt0Z+RbSnNsuRQ5Zz/UlLFwYkDXinGVn4OfOjUyoEVYpgMoqUiwYQA6YagPxS/CHS6pxkW8XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NAeFgV08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FauWyBGP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NAeFgV08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FauWyBGP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeKDu1414493
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vr7HzjusZyhP4/dXgy2m4qWv
	YG4scQg6gixx6oakxiM=; b=NAeFgV08TE7KU6No2mBroDHTkTdOAvfq4qQHZ5Mu
	A0kq9ITkZ6jeF8X3oOcNFdGvUnT1MqLX1MKMjpWeV7/MYM2xkwldpCDJN9pqs6lM
	GG5mvctAQQCZF9ENDq58pXN4dB8ASIyWIPBSOgoErlB+Hme4/fY82bF9jL6JwULx
	qyr2DgMsRBeDEVOnb8R1xZp6QULEYfAHeG7BmKh7Xqp262dlPO1GrGTnK+VkYLr2
	3J51OU8nbbO6TpWs0Dn7nipKa/Bp9+V68y5IMk+cQD2DI4y/OkRKaIYTqg0q/X4Y
	waCWUNSrHiytYE/lXZqk6LUrBnuzr6X4WMio2o6sJSDNGg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d13xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:03:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a8a773db4eso180408137.0
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992221; x=1790597021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vr7HzjusZyhP4/dXgy2m4qWvYG4scQg6gixx6oakxiM=;
        b=FauWyBGPg5iliAH3qWGUDc3DPH7vnt50WZk2EH9NJI9qgvvgmFFljOXI7lfo9ODBpc
         pqb/3nP7wappL8EWWVL1r0Uwl/2eDTwnY4Lzmi6KY0CC7hL8Sg7lfagEzKwfjTwdQolJ
         pEGdKYw6BCWYLdI8e6Iqk4MirYyKAZhntPypyI94FY8K/Gm3BQSpFOfwWrrjXggYjTEj
         VUPjA8TodqgT6As7mnu7psJsJvD8LbIWBmX2Rvm3ZDNcAssSFhBLNMcInU3dCOq/yb3y
         rj/RVU02sVLYH9r+nH3fgwcAnrv8PbrGO4gNHwwwJrsPcy7vzc7tq2cSxtoJvJlwXNRV
         1a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992221; x=1790597021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vr7HzjusZyhP4/dXgy2m4qWvYG4scQg6gixx6oakxiM=;
        b=I+enB4WMVuZVbTAwx0+xNpkN3cKmu0BKWEXpc++EcGgYxYq5Et1jEYt2ADYp8gNn10
         Bj2oIC5FmxVTXOOO+ShFJXyCEJjyoRf6vh2C1c9cQ80grI9b/LwtM6tGYFohslSwMotg
         wk7GxiC9tlZO298Yjxxx0kl7ze6aCatjU55YRboqfSk2ez5tJrcaFJsOKT9TUHzUunX/
         vWaih22BGcPG+/Sjw5gfi5yE00chGzEHrKX/wveVL4rDgCkd47WocwmazYAcZgIQSCY/
         TYu4yFqrlh/NVMnuWX+zP3yTLTwIZ9KvEGRu9QnQNAI7tB+E7LbQoCh78QaH+fL+i0Hz
         Oy8Q==
X-Forwarded-Encrypted: i=1; AKwUvByN6zghbvAUUUqC0tSgkYC3iOqj1AlAHenfkXWQUF1Sla2aAa2BVbKS6pfMACtYMtdskGmoc1SHs8m6@vger.kernel.org
X-Gm-Message-State: AFuF++ndJ1dzd8F/vn+APH42sAiQhcfaP0D35RWNuYmF4sHGnkrkNOVZ
	AR5vw0I5LdmzmDOAj30Ql8/biZIOP7xf4o0vS3Jv9dCGT3K3pQ9HW1nB2fIQlgNCfFrzI4SQl4X
	NZjT3XlSJk5nGAJp+9mzqIrji6p40lG+/ErlpF89Ltj7ZJZCAOg11PorvD65ix5No
X-Gm-Gg: AYBFou3XevPPq5twZcuvgrkenmFXKaULAJMTWhhvj0GQ0jvklJKfkSQVjr0vnI+nvPj
	UjwlvSDeZ/wQNY87aXdj74+WMB+UIXn6AZVxn1YjgUDmVDttmKVMa9C5yTabNQPCD85TxxZWfpA
	xbMldaNLmKY9vO7sipVVLk+izwlCv7QITTyQ5CQSi0MGcX5q7gfjqu+jF2HBO5/ib5YDuarnkJ6
	vTWZNO7erawYAm9NAXHnT4rUTZD2fvDvHyPawl93iJxmA7oTAmM8Oq6zUwwx3qdiBePgakNA64r
	tEbx6NCXkn5k+EQ243LHlpxfxRMVfbPe4kLoovCFb50KgnjbqC2zfakefS9iX1BBDCQ6OKlnOAN
	q/y2jtNmrwUAmGUg=
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1115758137.20.1789992220885;
        Mon, 21 Sep 2026 05:03:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c94:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7a818172947mr1115706137.20.1789992220398;
        Mon, 21 Sep 2026 05:03:40 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm147882235e9.0.2026.09.21.05.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:03:38 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:03:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 03/11] clk: qcom: ipq5210: add 24MHz rate for USB UTMI
 clock
Message-ID: <is5xheeyacsg4evn7mrtwl5wzti34oswus6xorhweaknahm5dk@l3cdldjupkjz>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-3-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aFVxKD8w0nudaYPIwoThA25l6YFwePNW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXwpoem4xlfusv
 kM/EWc4HvyHvSP0D4QQaxC5802foFl/udI3AMbYFaIGkgbRPJU5KaP9JsXSn4VBpDaU7Ry7nAsJ
 SzYeruWymlLLctLFdnRO/4zv7J8o+d0=
X-Proofpoint-GUID: aFVxKD8w0nudaYPIwoThA25l6YFwePNW
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab11d1d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaUoqYncsU2g2DIqJJIA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX60ZM397JF73t
 fD9wecnYiAraEq4tc5rZQVefxGK+V8li8jB0D0DdXegVHktbueXeHZh1dmNsNGtoI9IeuGrYIcE
 KMcPRriaLAHFGlAOhxQS9Yrf9ISVi4N7kd6BIHGT3LsD9X8PeUdKWP/ufjxPEO1tQ53fWe4OL+w
 oTwBNg8v4LiC4uzFCjgNYYqUzEanVT3ZCs15C4Snv321ipqFDZhHE3C2eEpcP6yS6QzSOq1copX
 ckzE+NHezSpcQ6O8TPN0vo7sJtg63mLDAUS/oqFIpz0+6W81QQciOGLyGXfVWO84kG9B0gGqp83
 1tfz15/kBOYiqp+KqNbCEx8Si58ygwKurrqtH7uG8TKSpaBnGedckiqjzcm2SiOkmCBIvfGEjUV
 WK4WCbYXsORyzCoFfCcr4g5U4073hWQzwjY9TLuZ9tnsiASJCbqjFStCWC7byRvW3x9xCw5u3Ip
 MtfQocEy4FpbRHJURVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210174

On 26-09-21 11:49:36, Kathiravan Thirumoorthy wrote:
> The USB UTMI reference clock must operate at 24 MHz, as recommended
> by the hardware team, for reliable USB operation.
> 
> Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
> fails when the UTMI reference clock is not configured to the required
> 24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
> the enumeration failure and ensure successful device detection.
> 
> Cc: stable@vger.kernel.org
> Fixes: 844be6e24afd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
