Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981819;
	b=cx/ytequ3rINJoucVqc1cpePeVpRAGEVlO9zXjvw/OMVIkQYeEmYUy6NhhP+p4S6Ipcn
	 KpZu80pue+WDiAi9HbmFkkxP1yTY+t2oTA6vDnkCURPZIzJ1/DvGmVs6We4wb18cC7hkN
	 2zhTzzyIGt6rFC303be5kXTDbKJdhfpQe5Y+ZEUW1RBaOXl1gkE/opQP4rBQ8JRx1sNEj
	 9OcBXb/mA986m00UphBkm7xYabikLzF3p1Ll+nYZBOeOwHi4Y3KPvwgN7blIXfoC188Uc
	 yWUCg3ughMfddnHQ5BYoCQrwHjjLH9ORxcDd6WRIFY8o3xj3lTzpzCBwGtsemSFmpEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
	b=sINzbcgWhrmIL8V6ZnuHj2qHy+tlvaXgZiQgguLBPdNKZGyhiZaMWhGQkvMEITshl/qb
	 4B2km888RwAzNECxbSEb7q9/WYEGLqN2BfOJrZVGDOn6hbtdch6lMOPtCLJDhF/kTy2ev
	 PPCcFLlfLUwRLdfMmCRNBcuFwKtp9Inq3onrYgWnIl5PxxRKQETrdBWx7bcojKaY1fg2Y
	 C5e3rPxNQFQru6JC4iw+kDPw/QnUoKoIIKTMf/apFXPfeOoXwRcLjQCxTxO0GAzHjUqio
	 xqo+8s7g39FINRomSp9oeaOvIH/IMdk77dKwLvFGTIyWujcd8qXCpcG31cJ+T3pTdYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE14606A32C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE14606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3Z8764123
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=; b=NuDaoHK7zog9vIxW
	6RSCIIUYrVQ9w0Guy+scyNYEUWoAvqvYyaa3I47zVNGoN3OYis0m8UwYRldXpm7b
	EW+9wx1w3poD7MV6FDVMXj3FWBvIEMv7lDhL0cn8NDztX0BjPiCOJ8U55akGmzXr
	btH2xuKlB+jU/znChMJfQURwipywNPs945gnCV/ffYQcIEYO3i0J1YJYUJWdtk2H
	yLj+uBmaJx345p9Id+bPVhDW7rND5Yh2RaCZazoJMzlZQFZ0YM0Mt7GebraLn07G
	1UFnZtKt9GchjCS98J60FOAUH3fRxiUSQFHXL+jcS55tY0yhJjnZqQBFu/1vSvuT
	ujR/SA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9exb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed1fbae872so7696685ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981818; x=1795586618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=CspXak3XYuU6eaDrwpVCNIP1TIH/7+vq3VeyXjkGF0Z+68T+VTDgnZIlqw6RP9thA3
         q58dV6916yOoYmUNyxe6B5alk3rXX79Dm5UDCg0rP2lt1RtKIsJ6L5mWRSvGfYGlwkjU
         yMvUDNsLvE5hTIrD3VRJsMP1YSD30Z/2UQMrGLCjyqcfUMjbuXenL0cbfRvWOS7smffE
         D/PSXg7Ov8MNbMQbubkhaUMU2iBJzaJk1flpJ6SbZNmHYZYj8Gii/bHvHSvWTSh9OSC8
         T7D6G2dU8OinZYY69aJ6uIhdK9TGRtf7jBeierZlaFzJfTMj8dQSYs0asjAK+PPrTz7h
         UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981818; x=1795586618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=zgTCe4It3wLHM2k8HTqHkx5c9XYEJrAECGiy2zH4voYk5yFGD1UST4fqagCUpOt+5J
         5Jega/CFZy3ZTrhU9JIDMQRk44T2ejoro/ohZEXnUJ6X0Rj9jg9zocOLMEhtWI+RRPA7
         X+rbpIjGMrZgikgOgm9/zvozmsXS91FbmhMKFhGv574AsMhD7z9on0CLqOyWO7w5UNDz
         NI42czHGKzmQtJ/5Sm+KdjbV7jUx10/KkhkJPmbeRx+zfQB2imN6rhjd1lgrrr/tQlrr
         s6YmVzWFNehrj2fZy1wDBAVeZ/8HRC/W9Or6+NxFRdnmlmu/Z+SIVb5UXNPPnQ3AQ2Zy
         xnPA==
X-Forwarded-Encrypted: i=1; AL+hErESOoA4wycODt9awDOxQjgsdeNY/ca1DvU6EeLvxOf8Ooi10UYq/3xnCOI7i+vqWWSxtvylLMOEMH7W@vger.kernel.org
X-Gm-Message-State: APuU4Z8TsZH2/vqAZY5GtO65IjyPws410ycfPe4aTlLD/i1FqF9ufL8p
	vT67rLw2iusN0cIu4U60mVGvgcnmy0E9eQrK5HAfxhy9wMXB7vW+l4feL3o3kEyEp2q0R3d+98r
	tVLSIn3qmQfQ78lGiIQJf+B7Lr18c+jE1JWolRUfTKp+jMxDk+XQ5qkhWUEzAKnDe
X-Gm-Gg: AZFdTZeBaN7Yp94krn4Netg6j1tsqFe1ltqAnq7UC0x4eoOmxKV+VxGngXLAXIXc9am
	Ljt3KmgrywaQvE3WW7aWkatoJg7TjS3ix2ato4NoxzOsFz9YkackrPo4QAnPEqfGtmFg+zF5HyX
	0p7NCvz7qTvSw35cKdm+2OZUC7TACSigAxnwbxjUhIa76HR2w4xxSfUcFElJPXYPlKZD8/vvDdT
	IsnCKQu+vX8716HAxN09cPw7TyYk8i4B5kYUdYeUMhcgSLiYgjpHKMLDjAcc13WInVYHx7X+zxp
	EjpgLjs7prBIZYwqeIp41Wobao8BxyoTO8InaY0w6d85a6+gh64h8WEF7yxjiMF90bL3soIJaNx
	Z0zbx3ATwVgoA5/sod3hN63zZ7VZ5OogtFS81fEEeyDiaNHLQdfKFRLcZQDWKqHcwIbBAVaVuuQ
	==
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948815ad.12.1794981817676;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948655ad.12.1794981817257;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:40 +0530
Subject: [PATCH 09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn
 function
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-gp_mn_tlmm_support-v1-9-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: z5n9Wi7gnOohCd6QD8V1V42cndSMusyL
X-Proofpoint-ORIG-GUID: z5n9Wi7gnOohCd6QD8V1V42cndSMusyL
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd3fba cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2n6RAUbhhJ/H
 noczT7xoMUDkUV1w3wCraQzagheeTQhWd+uQyHtU4NURPercJdJWYLFABulmE9wPanuxicHZp99
 DhPnvvNrogk5kLVK8Op5gjECCpt/jbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX++b9as9plWks
 TId96HDIfeiQOx9GnV7iWaqMOnKsnCLevnr//z7gBJ6iFAQzvRYTzusKrexyFILDFYEo6CezWzv
 Pf6iY/Z32uYNstADCJ8ZTGQLoIA3x1CXQSgZ2oiqoRHUQp4RoWazOE9IjqHAHQwJoTziynmyxLh
 e0OVG+7EyYR6PIBP7QzPpJmiNs2Zdses0iUnN1ItNl3T3FD+34jcHa1yNiUMTvULuzRk9qo9R7E
 +zaKISohttuypVz+L66o+mR+JYlrT87F9PiTITI4/gT0RO7E3Y3+ETMLbgPsr82JPiYNxIuBK6m
 JxD4E05AhVUyyBFQuSaHi7o4bfsyJJ9bptdyehDlFtU2tpc4clozhIaaHMMQ8JxCRVocpo/dSkS
 scMJ+WjhxZq/Df/4tmp/HoJbD9mOOJDNZV2Ak1To78Sz38BIyhCI53tYD7VavfBWxxhxpZmamfX
 Qt1sZVuWf38RRFK0QWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SM8750 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
index 7aecc97745a8cdffe70720dd2f1f3391ff979ce2..1af098d45c54b99871e81e6576b516ffd0374fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,

-- 
2.34.1

