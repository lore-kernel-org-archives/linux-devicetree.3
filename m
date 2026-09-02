Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDA43231D
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 13:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355594; cv=none; b=tWiwrpk48vX2LWIhE/GcnmDj0ZdBRVd2ecby0qhwUT8kHLwI+gpxSF4MGrOLwHLsHsySJjxKesdlId8hUJ+3sXehd9241kKHygHcOt9FLU/UsHKnPFEQNLFFG1bNLmA6sgfjwv9+UfzETQwmzoKpsjdwRYfqpfE25Q7ho0QqYLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355594; c=relaxed/simple;
	bh=IOYGewLhDOFm4x0hRfNM4AYVD0ENzMjIIDCNxqGXlNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5YnZyYlj1DDqS60+Ui67eLtjSXAI7+luMTq2wwYzgICNJZ+/Rr0PK/dtBEaSKsDP0TyMO1bOHuXhi17Q4BPiZZfMYVslRtYje7yNSxJ0XZnzUFiXIlk2I/Ts2P2wqm0JCD6AZzxFTUQHrVk4dVzQYZ7QTowfn7xDplK1ShpWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqQzVKqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtFJZN2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqQzVKqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtFJZN2r"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR9FW1647747
	for <devicetree@vger.kernel.org>; Wed, 2 Sep 2026 13:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fr0qc4FAUTiDXfo042zfsBe
	8gb47pwHgpFgz0s03Xo=; b=EqQzVKqvMp977hnDfUJoKXWHcl0xIlPx7Sr+CeEi
	zjic/9f3xzMdGaaJWM7IlK1gG2BWNi7EpJ5+tVvGLhlnE/OsVRcoabhNQq40umMo
	35t2Nh/JsnmDO41Wk+TUj8NQn+t3IMibAjj6I9XTZv6hiQybJduUEQCrfZibMVPi
	o5uGj5Aint16kYgkEfYWSwQ3eCpUKff1XS1QjHf51m3LlsbZrisEjKa2aEkMTrYH
	29Z+o2KPdWgW7/2EHOzgjJ92Z7P0tmwyu1M/wA893S7vba0bjZ0mBnVtBvdFiDtR
	k6ctWy5xdnXuapB7I15nxd3cxwOXpwkrbropD1d3FZqq7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv88f9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 13:26:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so206804185a.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 06:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788355590; x=1788960390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fr0qc4FAUTiDXfo042zfsBe8gb47pwHgpFgz0s03Xo=;
        b=RtFJZN2rWq6e9eZc+Q/FeUy9sD4VJD00VxSwYj6HIham8vurkdIMBJpInXr7CwqGyA
         uII/IGrJsmMbGuUKsEJ08rJs9rpAaMf3XTvQzTWTXX2Mt3Hx8hmpMRHoO0hKrOBOyYVG
         snyZrHkymbIoTr36Q1Yglj6mKieUSNmXb3AxUg9+VkwD3CU/CoFdkdhU3E0o2UMjFgbS
         ifL9Sj3vha1JSpd9qFAdBd2s/ieX9mlMWNryAMuh6sLovx43CUG6PEWdrbx0Z8mayp5Y
         OYznsosqD6LkDVWvlZyI4udfEvpGS8y5VJyCGj+g6f2aIsUVjNVaG71xHRZZU48p8NdU
         Omwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355590; x=1788960390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fr0qc4FAUTiDXfo042zfsBe8gb47pwHgpFgz0s03Xo=;
        b=GH0oUcxcrAAdKB+P0snlLW/jMsoIGwFETmnhWNRIrCVYoUBlMAn6PZLRvtZYie6TZj
         mPV+VhXuHDoAvAsWFVzYZLcy3wMIq1wMMAr3e8MIyAFDb0cvrjCci4GTGWEtnQf1sWyp
         szQxeqQi1M/Nr7/gR4elwkacc/URo7VOCHr/N0r/E7nxJK9Mw/EIal7Yp9S+OirVMBFP
         txCQNTgiTeKnP9+7FgDCPW35TvIhvJus5WV7gJuIppmvQi2+7a/jXHb7d1+U4A7yNsgR
         bz9M27ccOUOVTTBrxWVyp1esLQjbrOk+qCD+685tj1Pda84FiOB2XGkaYOHFmlUq0JWR
         Q+MA==
X-Forwarded-Encrypted: i=1; AHgh+RoMna4eu6h93MwYISc2+cStTvWXxPcHIwIF76Mx9I1rDTu/twTqmsvyPKnK93uRRBwe0WPavTfi5Fau@vger.kernel.org
X-Gm-Message-State: AFuF++ltp0+m2ztxJD9H9RGuFaxelwswesHl1AjMDaj7NR0kpaT9ZX1L
	TqRczrRgjCbqFrsdqbNNqluHefUSF5Vhy0RCYvVubnuY/pcNmL7QS03ZyynE9gM5jVIM01pe6V+
	GF3Mt7R9twLiwZg0fjKs7fAKTDUFUl5vlGfy1NJmhO/mHOy+oxjkkAPlBSPM2z1yY
X-Gm-Gg: AR+sD13qDtdrPFa7+eiZMOEHuhK5+MmySBZOQ13NMOLvKiZnj4Hm72qvhl3X3JLpOU3
	J8R4b2d2EbgU5I5Xx3q9yjdUAAi8rZgrKSjAsI1YCYcTNFeerTz+Y7ecMdrWVhmO9e3WOL+NhLJ
	Qx58aZhehOu5B6EAl0yYsxBF4AHzXupYEge81HLtVka+MTmbd/V2F8mWPPkmXxrWjehRds0b1am
	rv7zz3+aadC1mm4Ry+hbAE3Pf7MSqXzZH/fTAZE9Vj2PRu887dOy6uhpD2EGv0gXMlBIWrmCeT7
	gPjstbvi/cEHnuh16loWA0eDG+Pc02M1miQVGAMw1LZs3OJUvkrSK+y2qwEbCOfoZxyELxy/7zG
	7tGseTJ3mjHZt0A==
X-Received: by 2002:a05:620a:a191:10b0:939:2812:8bda with SMTP id af79cd13be357-93960e1dcd2mr457338685a.16.1788355589728;
        Wed, 02 Sep 2026 06:26:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a191:10b0:939:2812:8bda with SMTP id af79cd13be357-93960e1dcd2mr457325385a.16.1788355589014;
        Wed, 02 Sep 2026 06:26:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed30c0sm6630997f8f.24.2026.09.02.06.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:26:27 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-denali: Add volume up/down GPIO
 keys
Message-ID: <whnzjy22lzm6ln7qzzqx5jinmaxaronsafm33cej5ox2aeo2p3@ctegjf3sdmw6>
References: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
X-Proofpoint-GUID: SKo2EB4GBYr8LKh6x9CXjDOEU1QEDp0c
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a982406 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=RsaAdo6knjiJn5qj3ScA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfXwE6HJGr8x7rx
 bwFpB40KZLxOtHeionOQSCaKH0+YSNIeBpHWp0fRe+mfaSR4spc3YVRKsuKHl82RHGplQX1JMSw
 sM4DwQ30AIzk7i5AojW/4feX6eXPY68oGw7wuvo9vLdMiXRJ+1299kLoc9HAV+2bXeDcx6JofSZ
 vP/j6SPOmMbh7mp+NvZgGIZMrzFnlBviYaVZIT9JDU5++POZJw1Ir0qSM2biX1N8aDkdyqWrc5U
 EdmtMEXrp/KhVAAS7tMQKj1g3GRKQy9olOIM7vLMiw1WPuUIpWpBB0K6Ip+wFIjIRv2VtS4UKnX
 TxEUHRdErQ5mGXQvK/PAohNnv7PDPprGjGgKqcNNcY55ZfuNQlEujmq7HDLzIY2vWqsTkG37zIp
 SrcnP6qcLrV3atwjajS7XB/Wqbv91uuTLX6UpfBFRfr4VcaWYtQdvQtsItkPAYtbJnA54xcr50g
 bQLvPHN3F4+T6KsVL9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDExOSBTYWx0ZWRfX5KGQXpNuw/1w
 EYIcyLu2m9Zz7mFXwum37aYrxlFmkrpueLaUeQx2k0t0VyRTyM8MHmQncRPCpRm8KuyDtOkadj7
 cwlYbCILvTgUOVxeRIxvHbzqPSsbguI=
X-Proofpoint-ORIG-GUID: SKo2EB4GBYr8LKh6x9CXjDOEU1QEDp0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020119

On 26-09-02 13:52:36, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
