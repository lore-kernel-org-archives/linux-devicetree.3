Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099469;
	b=YAwYVopsDEPVCvTMd+ROTdq93HUIS/1cS2QKYtbVWAY4GL7FLLuXmW7nU4AKLM5rSo9V
	 NrNUFDq284cuGk9KCr88dShqPRVbpJ/wt/nLeX8nfWTR+qDmm7Pu90u2c92Lc/jsE0g+8
	 ng/QIuh8XQOK3BKU6cBW+pxHA2AbTqro7c2WbpzMYck1UFe8bOfSXpjY+pK7vjngzUZGs
	 /dl7waENUs4tG968MS2esWfxWfNz6Y6CNDh1maWyVqvkO1BOl7JRPDIqfp77D0hH5vhxe
	 l1fBJ605mxn4ZO7P+DI2xYtidq6IVSQIJ8xKK62Gfy/GI6KTStf4bsJQTi8YozRMQCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
	b=Dfy7h2BOd4KRSnbljbVLkFPdh3e1EQkAbUCzHVlQjctNql+QsR2yJxxc5v25pDbRu3++
	 KhJG32TSY/F6nqAUy1srscbrs2AiWYDALqvWL9sMmD98ezRxuec/qNver1NhYIL2TZQUm
	 Yn61YXrRhxMgByHhu1hqqUCLCzAvX8fGvALgXSrlln7S9VaxU132Y9gbcZroLPAsfbLMj
	 YdAQrZKN//ZtMSFsamuayJDhOPaYupSv0uGcVvM/V1wvbP4wxYVotgvv4K+NIENXgYxBP
	 OPfmUggt+VKYF3MVe508d5BawSMtMoTCy0knZ1/nhLsIcj4+hfBSUPFHuAmjHPJGUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNYmRbsw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4C0WncY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F82C606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F82C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNYmRbsw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4C0WncY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe10S1614691
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UAHroLX2yjQ1id1FQtf/by5p
	AgKIpOkaQ4VOiN0W9B4=; b=oNYmRbswuQ/oPnTmO/h0wYB0cK8Lyh0MfwqC0R5Y
	i76tzGsZDHYhJAmY1IyzHl/a0pPY601ciDq6v79CdKT7aaT4LAG2p3BU+yn1mTQK
	NkLA3DPx7b3FL+fmG2dVlyost7/s3pjAVGkfTUJpTB96tzDEsmKikqx5dlSV3nBV
	ZAAZTbYMe87IktsYqzZzwPLISji8HExde6UnHgVg5nAEycSDXqiR0Hw+U71s5J1g
	t7r1yf1t9xIhspG5CBm7019WQb4vkdf2UXDza7uxFxvtfyqd/EWqTuQW67LnDQ0X
	cpkIUUfrnqK/FG7u/MdNe/0GvMH4pFXVX6gatG5p8Ywg/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqf5rv0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so788476485a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099467; x=1793704267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
        b=c4C0WncYf8AZ16ktifTbzuJShN2yWX4ZAjChpdKDBs7lnVUuZKO0g3lCIhptxUYdhg
         PDOTeSPZXMbzw8B6Y8YvcUioeJwKC7ZEB6mTrMl1BSTWXA4TdxbQszOySAm3O65VCSpY
         Cy87XJP3AobiENRAVLwA8cQFs64/sxUvxwPvIyw0vBet29iLP4MLYgNEqhqpjVrJUFGW
         LyIXrDjjTzDJWeP2hbT8rVyH4gX1JP3BzdtNd63pXmAGevyVeOMOMWhBVnGf+bLPCFe7
         sjfgixGNOPp4X+nlxQKFegndNUTej/2vW6frBTvifxjPEflU1HB4wd7XgVPkPo22KNF6
         inbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099467; x=1793704267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
        b=DOX939h5y3lWL2AjEB+u/jxXCoxsD9qx8ZWftNARWRexw7XWpmqlecjkbZDtfwClb2
         nsUcw75eorVnXZ0uK2q3e10eW1WK7DdGkkPrr9ZGw/jXeqQMClYIrtmRF5ChKuN3U4w4
         GQEz2MtDVk+MNFLku+LhiKOHI6DanvEDLTqfG9G6oBzgum+N8rtr5Q7wcGaOBF5dKlEv
         KXVlYYbMMU/YvbpCybX0EO8FGN/gENwJPXeJp9/wF5saYYTkwtcvRHAFw1nEBwyhJOQc
         rSaT29NYO2MvC6/UN7jM7v739PGHqBytYElNi3UM/nVAM/8PZo8jf7bhSKXs5Xk+aUqI
         4NGg==
X-Forwarded-Encrypted: i=1; AKwUvBzu4xA+sotV/hqZhxuvN/KsBtzmoMvrBK2VHyCELhz6psjEVegnE3S1gyIeI1L6ZAsQ20r5Rrei0BVG@vger.kernel.org
X-Gm-Message-State: AFq9FYInqZLsEZoBhLc3vsYTCeTUs/dKGi1cskqaBlyxbUg09WBTUxSV
	s/3zcZE2Nhk3lsvWSThbD2MAhgh35QCGEvAduPiSdsTaYgf+fnF2ErOckA1BEHPbyguNDHW8O1z
	cuRBggsracAcpAB9lU+49hCMkG3154gxDN/5BlS9sgEM8DpFsqoQzCesw4juwalVD
X-Gm-Gg: AYBFou0eb9KsW007gtpYQxlMXcPcEBSBx3mWSZKu/C2eQTUxjZRDks8NgXeC18aGoIV
	gDSyYpi134TwBGjXeD6jjz0qiT+q0riQ5/9y2L2/6DokumKFjCZ1z/B3+cGCOa6C5eeTHss5iD8
	+Z2btcMaJlHNXKQJMdeO9xc0oWeckLH9uRxyBcojitbjhNtsvdK51n2C0DjIcw498RiiP8tHQ8J
	LIouNBn5ZSTcIn362/g6UtYiOgXzfgjw1ljlUU5gt1nYfNJqzbRKkgK2XgNU/qgd0NNBon8qSWR
	UGyukmKZqHCma+R3IVumcg8VgKjwo+7yTExGEIv5LzyIUeZUe54C5a2yjactaCS7JYiSR2RUw9v
	A8GnVKYV9AqR5gRbjC5p3GqQmuWRj6RRPIGlPT7yheqnIaMJHRGMydo2bkoKH8dwqeg==
X-Received: by 2002:a05:620a:4542:b0:93b:d7a3:45cc with SMTP id af79cd13be357-940ef96b7eemr1294808485a.53.1793099467346;
        Tue, 27 Oct 2026 04:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93b:d7a3:45cc with SMTP id af79cd13be357-940ef96b7eemr1294802485a.53.1793099466727;
        Tue, 27 Oct 2026 04:11:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19109379f8f.26.2026.10.27.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:11:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:11:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm8450: Add CSI2 PHY device
 tree nodes
Message-ID: <mwaqzdht3xlouezqwgr4wqmknxn53vjqt52tozdbrxbdjhasbu@yegyvn3f4nyk>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-6-vz@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026224957.1115370-6-vz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX79zR9nINr/zP
 fjjT9ZdOxQxeCfqfjoRxAMsXfCwFVc1y0HxL1AMGLzZwG6Vbfl2WfuFbLgtTxLFVcNj8GIlxV6b
 8TtaVdybzUNNDiiLw8EQUyfPqR2NzQ8=
X-Proofpoint-ORIG-GUID: jFVZ0G6JG2FufpZkiwBU6f1hg1rzytCQ
X-Proofpoint-GUID: jFVZ0G6JG2FufpZkiwBU6f1hg1rzytCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX437dsZ8AVO2j
 m0v8J73qHS2cdGH7b23yblDTBksF5/krfnZ8goaUico2LBQJFnZFPdbLYUcYH+nnCSSofvzZRBd
 0gHkT7UlNgtPR6Na/0jGDYOouUR9Cb5ufmgVZ+6J2Uw03QVIm9twwrip9p3FUx7F5kygO82mEh7
 rHpmh87d/1m+G5ADYsKXIVLvmSJzN6JX4sgnwQljptUrybuIvKg1T5phEaDHqAclp8Cle5/1W5M
 OIUkPJgn+D53cB94OqWzkWq3aF5IWq+XegUFUwk+KDTWmrKLDIjBVQ3Cd/ddl+gXaUXX4hQWGyJ
 mhz9c0sYsS/O9zMp/Eo3ehdfc7/+kz5/b8Jtx2clDDZ9SC3Jm6uXxalUR3/HHPZAw6BTetl2UZt
 LI78/43fvEUrPH6a06ZvMb0dVyfqZOWlAXgUM1BDDVbRV7ZzGEcXHa2KG8jKAK0a/3pLJ+ydz6I
 HCuh8EWjteftRmMkN4Q==
X-Authority-Analysis: v=2.4 cv=UOFIjyfy c=1 sm=1 tr=0 ts=6ae086cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UwdZcGpLVFY4tAqoLasA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270044

On 26-10-27 00:49:55, Vladimir Zapolskiy wrote:
> Add device tree nodes of six CAMSS CSIPHYs found on Qualcomm SM8450 SoC,
> and a shared CSIPHY OPP table for them.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
