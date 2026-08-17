Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F59B435537
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972849; cv=none; b=Eq4SATzVaSljmxgXZzEfM5Hz6jn/2DAeUv+oF5Hi0nvFGpZhn57AFfeJ2w84fVPr3DFUbIAfVbtl1S1gFMBQHLcKGdB21ohBuiQSNsrlxdBI6FzEcaQISDhP7IGz17uIds/fXWRd+FV3z5npQlWfVDqfeZn5MkR6KGhz8AxkNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972849; c=relaxed/simple;
	bh=voO8sypVqvQZMHIbsiVnjirbHet2jA8QTEFrrGTm2g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCIWaswZPPfiE5qKOPsBv3x4ML2DXmx5T5LYngqEwTrXwYcAYquFmNBmeE94MushGbGuLMtRUVfZdJq+1fg0VPp8PVrA0Ex8CSoKcn8BzMy1QrvLGVcxMxQSoshmff0upO4SRz1JryD3GEuyiIDpk1U0T606kTJ+/CaVCtttkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9jN12bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BromHkvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9jN12bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BromHkvt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5scX2008420
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=; b=d9jN12bhgXLXzXem
	VEdveKhdGhqe5nLxCs5296huHVlr/aYrcr5jRQF/aTcs6/VgXK7IdpmH++t/CEXM
	3tGAXCXEAvPba16A5/Lk+UHWmVAwivmyjzJl0qwKkEn9WztqJkid19mIbMW0gjCA
	qPG+sn8wuFPf+/x3aFW3VLBBVwgL2Pg2ePiBzmMBC/+IQ8FZgzG5NMnB+N92SHcW
	u2Iy+DySCSb5rcy9gHLZ8dZOyF5TmgpOd6mTO7wQRxtTgA7wkahmWLIL48otdy3M
	A3svpb563B8b44/Omh+6vdDAT+GE6B0vX81r3wxSj3npbn7kftMQ13j6Owlk/goI
	4u7Beg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h2hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 13:20:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51ca37ce4c3so3867271cf.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972846; x=1787577646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=;
        b=BromHkvtJKNvnESflq3wn9VwiMAzZa4resPWbqwGypMrDsu4vcsQSsQqPTY+N8L9Y4
         DbQwJMt3l9ER7Yg1kyCC4Sbd5lv3R6iuD1p5FT7ZiudMmYD/WfIsZ5m4vYJMwf0HshRp
         LrxjpAAIYej906s6OJCgLU+y9XMadS4Yn1qWlUnPY249eyg/0KVEao1wjQWIO6sNv/lT
         tXgOlTX7Ij9WWW1b3KdpXpYLtnC3hCtWIPcz9G80/a10oX5ma01xg4bEDirrt6Yazx9E
         F4hT/GjeeFvilOjOgZ7wpx6eGMW56GrEGnODna9oollL6fpYSvPVCyFO0S7IRoHQj9Sj
         kDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972846; x=1787577646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=;
        b=BIgSqRoVeKeX9eTuG+ao/bV3nK0b4E2vAa67uqj4bS2N+BR3KKAQitWhzwVlawawBp
         1zA9FYQpEsZKR5E84mCVleSs1UOTdx2pWhjYevdiVCNmwIMY3YkzCqgmF9X8DW+u9foL
         31id8cttUeMi6a1rouWsm506wdEjktXyrBkhQLZfMu8UV1eueYpvGmYCWy0TU9AwCtjF
         9JvNxkcw6zEGyxTiF1FM1R8v3bqngnWJDV0BgIg2EQz5t8HoqdNB3oHAtAhvr0ztvbyp
         zZuB2xcXCtNYr1jpQXTWb67Xff7E+1t8dJQMs9SxMLhAQ7RwikO4kkcSSs5rgSk2gAyr
         yB1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCDchMU2VtTYwRjJfhbUZpUJb/Txg8/3E+sa5K2MCVBS8hDOJqNmrQg5klZPziW7AGH9NwFSsLKTGE@vger.kernel.org
X-Gm-Message-State: AOJu0YxeyM+5RlIMcOjp0sGnV9O9JPp5rzZvGpsCoFgkjAfC3/uJYiLJ
	YIVck8Vma8GmNUn/gw46dQfdv/+pDpZwmreTwSD6u4WXaa+wn4Z7H9JKU5aEZHsvCNgqxP1Z9Ri
	oUGycOpxj+2vOBmiRZ/1Bt6LeE4xG+1o3WQf/FRmqnq7psAWH0odgEBE4bMYR5jlV
X-Gm-Gg: AR+sD10bUTPaaJ3H3J2dSphXgWYWpVLsgocNiDkz+U56Gp381u6AcY4YFl4SpdVCE1r
	8/PiJgNHdI/CWvnBjQeuF0caUMvgxb+qENjcxYL65DQV7O0lh6ztnXffwlyfb7o6+gAao1slMaV
	6uvd5U5+hiCAi+u6wIwIMKbIC6joOP/YVdbze9WsXReCeR0QFw+RzclKHvvUoY1f0oKx1t+2yoB
	hRpGkoz5j990npTBD0qjmqd/zYJgBsuMK950oQw2QUAIGatrMa5ZaQzQIVVzCanDifU/mT2eX/t
	r9S5ZNJ54l/eXMOBNdY7kfYXWQrJwn82GqskYHha6yiJFg/PvdROFh6WRNkcKO/BF0vi8MYZ+8z
	5lSq+xsMZFRB09zaEUHUE3Hni
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr193427401cf.2.1786972846462;
        Mon, 17 Aug 2026 06:20:46 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr193421921cf.2.1786972841183;
        Mon, 17 Aug 2026 06:20:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:40 -0700 (PDT)
Message-ID: <efae422c-51e6-4dea-aa80-fb2669496ba3@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rFdGKu34nH4-2ns3qyCDusx1f6rW8YyO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX7MVhp5KPVpXf
 i1A4cVcumPcHKdCQFUiYTAO2/PDsMvhoIPFrcl39TbQcCIUpu5iwCl74mPrhiJscz9U1w93Crqq
 dwbtMLDOuR7J2q1lHMwBcxYrzR3zpq4=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a830aaf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: rFdGKu34nH4-2ns3qyCDusx1f6rW8YyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX1J+mCZlHoyX6
 32zo4HKq3KqUhFF08OmuX5D6uhb4Aq3RYGuYZygpZJi6HPXUlXncSlgmWFM7BMic6ikSuwbLQJZ
 9f3hnyQiyvsfu97bDYNnq5/GGf9/JlZQypClf6/kIH3U83itNOVXg2AVf2Cjt4P0vX11VEal2JP
 XJcM++ZcnqoFY4wmpbvJsZ7ZljDPLvT9CxctP8hXE6MP4+oD7tfLB183SXe0c/fQ5on/W29MKpa
 kA379JzY+gxiztP9V3IIBk9MLlO4NAe1YMElvWsKmOS23DS6ApAjqEviHewrXj4CZqhbKWwVcuh
 WwRv0GOr61dM3HSkMJS8MJ3eHVRRYNDsVM4enVhU3Si6Y3HNb/oNKBRgaqqE9GUFPBxZXfTlm/5
 CU3GjOOO8GArWNeemed7CzqsAONPV7uUOHcud081BIHdlUgnTbW1WSmFbKotuxTX0Hs2IWN4xhj
 QLPELI8LoftJKb9n3bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170101

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

I believe I reviewed this already

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
