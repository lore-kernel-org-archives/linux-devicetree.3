Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531782;
	b=WOqZ/xW98OxhJcDzAtcHvJoQsOeNtJPc8xebpxejpG7erjgKQYHkZWwZI+A6yaqlFEIH
	 M/AsykdwjaAD4c9R4D3bDbvmyFbXTotgu5tDpOgRt+306gXQQWiWacwkZ4QcedIpFdZsj
	 FW5GB/UUa3P4er2hipHdlm453mqrds5+ZiqsyC+ST1NPamFkxKSDKW7wDePtWtBdKmwmd
	 qnvYCdpXH2+/kV5xlEbBE7Lsp+N0Gl6bC6g33JQwpapJsuZhffrGMj+NAHLx7SFZA9H4l
	 5MoD0Tv3zjiWDypkZ4chvY0Qw7WUbLVx8Gg1VjWm0Jy8JgADayMabeidFnSFoeOu4LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UuQo7p1Zr0i6ZONOjYFEjOClyqfRR18CuY7SWJ4hFjA=;
	b=stDdJuqW/g5PB3wzIysiOJ/RRPXMAXdOX/GLWDkUQAIuAtK2FaIGCaWKSCRfI+7JtgXF
	 IzavdwIJEC+e8pCqzZaDLMtb2khg5xBfCl5OG7An3RmvZjhc8h/Szd7CkgAbiqGk4K7tp
	 UBrMYqozFwZ1Jp+1RF8DXrlY01pCcaWIV3XiD1r1Fld4gRo22r06soMFUCoa8qBo2fLjQ
	 Bs+qbYRvxidkYdioD0pFZWPxjpSty29HuQN3rM8PQBqdrEWyG8N5Er/tvy/wTMJjapq2p
	 ZWwR+B+AteYDxB/TFGgHct3WRDCcJwRgLgHimTkLlNmbEuwxmZHSt9R5qLGFO6VOmig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YzfK0kjj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/kS+vuc";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93186606A329
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93186606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YzfK0kjj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/kS+vuc
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEbpuu4027482
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuQo7p1Zr0i6ZONOjYFEjOCl
	yqfRR18CuY7SWJ4hFjA=; b=YzfK0kjjw45nBaw+BH3FSsur7171YinjshCFprlo
	caymDuG1fgpckz2xmBcNqnMZryzg7dbEp6VHmcUSyO2cKRlm+spl+2mORVpVMwUh
	07Nvw3RbRoqACBe34tDEzwU4Wvwdw4fAkIC8tkLeV4a93rM3H1oeBeuNp6NNX4jl
	2mkUF5B0vq/lS/ROExMyDZMlwPibY38/xdSgwbi1dRsq4Eq9/0PMv44otQsGAHdL
	Wdb+8nUaOrAm4NjaLo84tLnehzxA2tetlukNsXTDOOQsoHEDdB0y5HD9vDd1hAgA
	D7XD63mLEkzHTNIOsVr7GwKuyOzLJagY04rLPWDNJkRJ+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rha9m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:49:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so1076705185a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 06:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531780; x=1796136580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuQo7p1Zr0i6ZONOjYFEjOClyqfRR18CuY7SWJ4hFjA=;
        b=T/kS+vucs1Gr1Q2pEedp7UtjuAoMEliNco6tA3754G/YbsAOrQOXiwwt2xGnGaAwww
         P9hiqGvtRp2NF+9KLW4ea9aI36ahTJGln5zamWrzxwSqCmsYOPOYURgIXDvOjMsAYhTg
         IOAOd727m/k7vaTbGLGgaMW9yITPx8OETOVEqI6eo7eD0Kf3DgQW2LzcX2J8rKaMZYfK
         yTyxC9C87nRNXAQy5g62DsLbMDX18v/ah1CwOj7DgffU03JqdwZ6ImKZqMKzoSh5wEqy
         OBaAMJXqro9iHQqzQWaDFgJwKS01WWyf2kaDzuxZvkimVJyfrNs/Xl+TkFAs4Bxwe3g0
         abhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531780; x=1796136580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuQo7p1Zr0i6ZONOjYFEjOClyqfRR18CuY7SWJ4hFjA=;
        b=EaqsCAX2KtEKE7ypAO+n9jYngiMijh0T13SkrnB17Kx02p+j0mDs1qXkcaHkkjuqi7
         Cd7H6z9z7YQxVw+Qz0VLPF5jEPsMRoLAEu6mbP5fPDBorRG/9CFLnlCbN28RBxQnqg9j
         P9vf9NfuzGWXwZ5I3vF9UgKZDOjy7TcObc1pq8zGPrJ4S5bkXKmpCJgpT6tHuc/RkRbX
         Ed7kOr7lo4sXk4J5Naub1Q/8BfwBvLxej7YOminx1/UjHOV9fytEvnijZWTZ6rZP+1i9
         9yJXRPmZj/IoY0H3m8w/Na7kU6smztHrUCtVdRopmtOf3lok/PAtucO99W276gtHscYh
         ZM4g==
X-Forwarded-Encrypted: i=1; AL+hErFpRPXiWbgljpWjiOT9IeJ8n5eKK6OykiPL04UUvLdfP3XBLmBjpTO6UtdYvo9EjIlwRB06X9iafdKr@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ddvvq+EenE4aq8EFbMnFdBv9qSE3+jCjpfihwd8pJQttm/42l
	EaXWTt9oZmW4UrkhoK5BiRmqEPD/jp2fipVfMGaPARwfn/1wOyN7u7KMT+vX0LucqrzRN0pSNlj
	Gbifzo2wJVQpe92sL8I12RAATqJBnaauZYOlV34uWH/edp3ZM5dZpCQK6/HjiBDlm
X-Gm-Gg: AZFdTZe41b2VXyD+y9aSjd6L5y/pUrYnV6CU6lJDbqKM2WvzoHNEZFCYHHRKjzypZ5O
	OYNII+2OnGqUCaVSEqQfBmnsOZSr8ALXxSpMnHRBBvazaZRvFHILqZT/v7VScN2NpTRASGDvcH5
	rSn+PaNUmEWb6YKYigia8b1Gv7qbe/eTYtyTLZj8gnso2Aao/yq7yrNXYtvWdkzW0WitfA+VZUY
	ne5qgJWNZSXaT6LDRa/xGw6rtgdXlSG63lS930zwFbRA7xM0HD1dTlIqwCovYQn6kzlpnLzOlLL
	LnEGO2mF25kcg+tKiRr96DkS2hFp9EZ4jROIYGBXcMx27LWu0ci//mtoxwbg+rImbcsNo+p2jk5
	tUvYC4100kYsobVwRh8FjBa3g2Ei5hM0gZLy+VyiFx1DjSG8ARbrvDf4jMGVFdbJn
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr2556636585a.36.1795531779568;
        Tue, 24 Nov 2026 06:49:39 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr2556629785a.36.1795531778957;
        Tue, 24 Nov 2026 06:49:38 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm371544745e9.9.2026.11.24.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:49:38 -0800 (PST)
Date: Tue, 24 Nov 2026 16:49:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sc8280xp: Describe USB4 MISC resets
Message-ID: <4vscrlyl7kpw2is7sxakry4ozmfq5axsvodl7iruu2pbajd5rh@5g2iyodzhx6u>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
 <20261124-topic-8280_usb4_clks-v1-2-be083a711eb4@oss.qualcomm.com>
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
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-2-be083a711eb4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05a405 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Ry__8pfDzHy8IBw2AekA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX6Rob8KtWQ3kS
 9aQNN8Ncm+MMZn9to/ZIP/BilHVRoIYHsSt9+QFmXAAaaFZHeatLcD9PR2bjR7RK/rd+NC/Yi4a
 538r2Lfk+bR4wqVHhXPkiPOLfUZ26Vw=
X-Proofpoint-GUID: PSPvv_Jtd3hDSmDp-h7WpHdo6V620QKb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX+RBQTkdA1Qdm
 BszDAg+JEVeeigyIkhZUjCILnbwFAoiQXlL0qnpvWow4Ramae+hNzyB1PWS+h6iQophDM3wqJTk
 5pzyyTv72QCHWGgyAuQgIUEiCQKZPFtzyI/oLvA1EQAguj8wiZqnX0rIW5l2Tltgs/Hh7fhIMz1
 ZsCuBsBFMBaEOlXjRHdQVaYnr6I3Zl/LuNnO9122V3SX0oatmNSV3WJWy53rMttJgrPChWyHVOa
 Qz/OTZdyFasy3rhLOFkm8pN+N6E63fqKso1zrniA0hIgQ3qaWm+xEZy3L9+T2vLbNc4h8D2STkq
 +AXIOdQy9nkeL4XELqd8cMaDGGz91sEu8Xy6IPmEk7H94zyalB1KsyPBV2JWVw1fiRO6KhlMEC3
 hYUdwfKJ1NkcLNvvM/xXmK3E8yfU+fbeXyUvHlxiGAKqCFhhul3pY+AOjvuMT/dqUZoXc/nasbD
 s62NTquuRt/YBkNTJmw==
X-Proofpoint-ORIG-GUID: PSPvv_Jtd3hDSmDp-h7WpHdo6V620QKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240057

On 26-11-24 14:30:17, Konrad Dybcio wrote:
> A number of the USB4-related resets were left undescribed. Plumb them
> in.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
