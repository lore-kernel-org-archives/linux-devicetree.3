Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB2A488234
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246500; cv=none; b=ckXDIXgmtK7iRTBrYwIgEUK3lCL0bzmOJ82m1DvViur5iYJnMmJTB/rV6AKEQHnMBrgNRSmAgZdGydxRhUYufNxTN/QdfOY10DbY0fKCReopZyhyPv/1JhDoLQIhwqbvm01GnNVdjp8vvbKXG137eFiGeGyMEJKO8/gojj+QOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246500; c=relaxed/simple;
	bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTxRcMda54IwuD+GlGlVSkmIGnEDV1eJ5xXcbF/3aTAiAK3pagP/GXZxGXlZTdQB+nD2+27BcOKWqOBDV2t81xdZ/QPWCaekiNfSfTgbDSr0JOmuJBJo3KnUT2yS0JF9ec3f5W+XcR657E4ddGz1rl1ZNf/HxMB4mesaIrh3oHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nablT81b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elWJxL0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nablT81b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elWJxL0H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9OwfB1063469
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=; b=nablT81bt3eWFyna
	6M6MW71uXDXEftZrZzFYZRkjo3mPgJcBw4EA6/vVit6os7jvLhXkM/xUYfCvhK92
	NKhU/tHbIJ7F3gkR7ZCBlCOzYoNU49weokBlSf1QMjhRj3jaYTPEDfD56PXMTmxF
	K2J+6RCbOjIw3chQVLZxel+7cTkO4iWCwofH71pvMnW7o+L04uu2MyQEj/l+sB1N
	kU0iQqKPrex6/JqLfK+/atFJYrRecn8Rg/CqFbkp039C2AhGJvwskvasV6YFEOYc
	Icjf0QTpuoccrDa5ncG0uKCT0JwRVWm/bA5KXDZ25FCesTpmvUCLa2n6hEGHp7gH
	ILMAzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9huc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:41:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso296891585a.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 03:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246495; x=1790851295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=elWJxL0HmzfTcN+HAY1viX6a3yAMIvVKYOei++O9TKNXvpA8hBEVW+7Ove5qRsaQBc
         Zf3W0qNyb3dThz6dJdRM9EKpDwT5EMC1b5/dyFsPHgg5gAMCjigMpUihfJs4WupkP7dm
         W85Ip8EAasQ0qnV5wZgWg2GO8n0Go3gw6PihMRkr4t99M3b6Z0x5Vtoi7koQKSX71QTl
         DmgGGEAZBztxgzkwBgXoyJJtri+iqEDtjTjbz9IPOMMF2feVrlCqeO7b5MdZm/tHbZ4h
         ZgPX01JF1GArmC4wDyKKYAyYIO8faXSM1xLID1/mltkXNVq40Mx15VSV77fk5ZwWOuXi
         ZAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246495; x=1790851295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=ftd17w26DB61hy6avPbXgLm7paEfpx8F/jLB8MlfXVtOoFH63/+sseqNipEmjHpLYG
         dPK+SkGU4WBwNINHViwoajSOTP3JlAX19RokeP+a961K20895I45fsrf5GQs6v4hRrXD
         c9I8jMkCPAAo3HCe7k2aqe5sWw/kxcWY0JmdXgXXDhb2BFtRdIcRNJXRFK2v4p3gkYPl
         BXpCtjwZeQsq6p8czi8ReXGO3k7yZcbBTS7X8rA1n57Z/TUlrvDbWkrSQEEPEpIT9EhN
         qcfJaZNxXPYXAUJEBOsvM+SHLQkHx6A86Z4j00Ahjn45+M/s5CrogHvV4X7Erg7IWgCI
         ljXA==
X-Forwarded-Encrypted: i=1; AKwUvBwnUdQqge9hjYLk2kkLQ5tRTljDRia+sqTFQI7r49Y5Y01sqaj1HOsggXw28f9143+hKApHhSjhE71T@vger.kernel.org
X-Gm-Message-State: AFuF++n0tsVCnUah+8g2dl5ZpJxTUkPdG11+ypnjvR8vMlbFlYMua3rY
	iXoxtvUFdSjrHvZxsPvYjvUlXohKq5+t6j1OS+xwmzyb1VIueFM/uadDLGIwjH9r0lC732sleXY
	QqVAZAuj/2cBu9HZEKsskTkYgKvwezqZizvWCJw9pE8S40Y20dAHTJJE8eyZdoPfu
X-Gm-Gg: AYBFou1hL0ZCzd0krkqYTkAh7CZKstkunTkSHKnjgz2jPlHCrXo5BxPTm2STFFiksAh
	IBDdfqDVP+yN3ocdUZ5H9BDvh1jR9v1JwU5qd48vuN9W1A6VgWKTGkf+w/odMkZBKxwCtA7eOyc
	i4lV3hUZbtJT+qRwD6pMZGHGUmR+JNzj21V4hFXAf4Nf1lZEIgI73r1mejXt7QOOuMGaT49jKdr
	KuIqZOwUW13oQtGlyWumXxK1y3Bc9MivMuQ9GyRWzr61IVlCWq2e85OCy9Inm+0Q3Y8To9c0Fd0
	rBmygANb5fnUpM48Z6y6DB6whE7z6IU5Mo3xRznF6a4fa9oYLbz6HQ9LI2iyZVhEKvlE+5O1++U
	Aty8yrGAC
X-Received: by 2002:a05:620a:225b:10b0:93a:2bd1:648 with SMTP id af79cd13be357-93c362b4450mr151131785a.4.1790246494984;
        Thu, 24 Sep 2026 03:41:34 -0700 (PDT)
X-Received: by 2002:a05:620a:225b:10b0:93a:2bd1:648 with SMTP id af79cd13be357-93c362b4450mr151128285a.4.1790246494411;
        Thu, 24 Sep 2026 03:41:34 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:46 +0300
Subject: [PATCH v5 30/42] arm64: dts: qcom: sar2130p: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-30-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP33ZuKy68pSvFBR5Sq2N/qAuQwQRcmsTKpLt
 mNKC5CIPHyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT99wAKCRAbX0TJAJUV
 VgH0D/9a2E8TIRQ7sLDnmMdVvLHXi7wpHwG05i4QSwYSpV/uEYnrn+R8NFMG0Lw640hSfCDckqT
 fAoEW3YYG9Rrt6pMqGvF1Hnv5kBF4rhhFUUuqffRyfnm9E/sXTyvSuAtrixOIDRKK69IWeI1fPl
 K5faVparphQ0RtR/x4Q8WYxq89Lm9Brzeh6zAYj0N5/NQKDd/Rbc5yjCL4LkztLM2xnDYgILxXu
 dY3dh4DMFvAyR/Z9LCtI1zQJ7OTjdyhHZcMbdaCAV5IiNg+XDyw6HH6guJz84q5tHQGFIsmD2zU
 VQ4ABBHIJPq73cBWZM9KNF01Jo0iz1ju8GnrY1pcFz+CfNdYVKA/Q6tzzv6prwlTrGJ+IdisZuK
 dXzst3jO1x63ZX3h/uGNATQ33xMwzcfDmjcwSinZbL9eJ6uWZuKFuR6zOPEWdKHPKDnWxYsS7js
 Ye84842NOd38rWkGCMcfz/pIsX0LuV2ayzPdCwN1ZCn1+eK43SQgMczcCPJQAaAyXZx9uCuXvfQ
 hKUUnC9KWHBPofynl19wmjCHJqdS1xVuSMvvtyJfup+9n+i1OB6zDe/KrfBy5mL4+Uwgy/D88hE
 oJp0IcoIJ6TWc+3iX8lBXx2o3zIAOiejG0FbEmtZ4PgYUd8aB+bsnKnrwHVoqMpi8fyfXyQ7PRi
 xiJmAo7+TNKPGog==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab4fe60 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: FUmJvP6Y9ohSA7UZSxHDcfqh1ILtSXva
X-Proofpoint-ORIG-GUID: FUmJvP6Y9ohSA7UZSxHDcfqh1ILtSXva
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzD4czGeQJGuZ
 2CbQwI+YiJz1E44bDePTdXi/Aq9pQqTZVGUlq6a560CCSmcyDcFelrjznOVKRpGvzgEp/RrasX1
 9SZG7fsL7W5bnRL4DvtLYUoRTa8P7HI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXzsids8QESVSh
 ezzu1DqjwC4iXNP+YxttPFvfbTMKW/iFK+eTmBvF9OM+7i8wSyPISg64kC61L+5WywwA/DbL3sv
 ZnHCnPGs+f/F2r3r7ott0It2cPVLiID0qBU9xbOmce3W0Nq9VE6wPwGDvzeKFVNCH8sTGUHUgcw
 4qtPMCKaXVbgRSQoPJAFOgeonXlGtM4ZvVqHIEq/hi8C01GuHhcHpT24jkSHiawGq6bvJVEzb79
 hyIFaa/vOjJ6hLn1ftWh6xPRcWS8yhwGsRNMxtttpW4crbQVToGiPUSrnTAl1ZJsx3tWUFUelWt
 nsuxpj8yHrLj+UuznlFONwEqkti4FiJF5Y5FLPkhaIVCaa9obBZtVIKfnT0PthYIYexOQ0uu1IY
 BB+ON68TMU7NqbrlBa9AadAuNE7bk+U/1O9kul9f3ghtZ2l3FWecovNuFvNAQpHV6sE+xwA1nR8
 DfME/H/JbBBrB2P2rPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SAR2130P are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 2ecead79806c..ceeb9c47093e 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -474,6 +474,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

