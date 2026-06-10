Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3EA3793C5
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073089; cv=none; b=ppT2SrWGXyOZXTe+km3r2d3MIEMnb/02b4MPl3N5Tj/8bAmfVD8mcMoA+QDw96V3ZAYN2ErsWAEHfErn4ITMunPZGNvGzyTmwZiGaC5D1/jpssewRKbrWIjfFBMJO/DO0zTMkjoZKzytf/22kKk5vtW1KI+Vher7rqOZCVc8DhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073089; c=relaxed/simple;
	bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jQfS2XZsgIHYlYw0ueIszglzlPhThffX5pB1OOIxjkD7Ie6Eqo5DVWG1wnb3s1VivChTEpeUn7jJ6k2PAlqPGM/hdbOK+EPZVXfgAoL8N2jHDMNMY3KdWSEFg1iPEAEuLXTQXbkYMJU50JBUSAz53xMpfN0kMipvHjvcyRTbP6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5qyEq1+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hffsuxSq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5qyEq1+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hffsuxSq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5SWSm688686
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=; b=N5qyEq1+UnbsZLJE
	kbq5HXF7MhaXbGyIcPLvCrVSXMwTCHmw9UsPgXruBDDAx3BAL1BK52+sjVlbPpYR
	QfFjXpqQMTBSQ+hGssN2B5kQmq/cMrhaI3/WlGYiwXuQOTW4wCWG5wqumeTANdX8
	9ya3VyYvqQb8+kJ4JHEoTaVDStGLrVonp/vDHEqkup06oULeTiuCR31XGAX8lx7a
	mtPTDON2AAWm8sO5CN0OE9Nj7xVqLhQk3GL4AkZsG6pp+txK1wWpt0z6qVFmdtz0
	MBFS8YxkoPPGMvArYIjy4eJzhvxfjCnU51MjBGPezH8b3i8KxEe67gdO9GWJQ/ki
	O5asPw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0750-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 06:31:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso8609176a91.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 23:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073086; x=1781677886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=hffsuxSqnqMGtEUsngzZWOhFA/kcNsXOtuADkRLRKIWliA6fidPFph+TRaRPS5cpah
         EZtHU4oXTL9/5bsQe66W1W0YGaN7NU/9HFqP1rB3g/EgXEGWfsjp/y+LTdUFkgW6lxl0
         RjFV4ROFJzgxuAbe5ZsE4p2pXZ5j8GEthxbtHBkrFP5RwtH0cjzG8a1f3b8NkGUTp4f+
         JR8rroF69+dopp96Ql3qriMYi/UdzuqpseswbQ8x41eV927Ceu6r52M06Oqt75VuvmD/
         y4w3N/UZMhVZsxcUmqWLSL86KjTt8fzdhFOE4VIMiLVikM6WZKOAbtm7Kbfdk3VWaiVx
         zFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073086; x=1781677886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4Gm/K+T3sc4qmyuI/6DYikh3FBs9pCLd7ruh8jMyfQ=;
        b=H9xK+6wOMKYeyxhhTgRiivEt7V+p0zlujJq5g+zmCM4cI3qhhAoVsN/hMSYXHW1Skk
         w6pwhRmtHHhizbK0rfiVIQSqCGDOT3cM3FSnqYdTwH2bzU2SLVkigzn403BUz7a36oPN
         2vFD2Ac8r6UsuHd4mV+aCs+HobCauMfpk88gd5s2adqszNl50wmQRznY/H1NckJf30XN
         MDSr7ZRe3SwZcVnYTivcWP+kSNoRhxs1VZObWUs0wjVcckMHafDIUjotVmtIiCIpD439
         Qz7wc4D/0YKc315J1ERfLaN7lN4xzZDmmCSzaSEZNRQCNyqV2BZ3iT6igC3xiV9efZZG
         4HUg==
X-Forwarded-Encrypted: i=1; AFNElJ8qWABtG8RiCo4sVshu7zxaC/a4l90pORdP43mejD7HQkzRrqLWgLCpkQNI3e5bQNLdjv7rLQ7tnRgh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7Dp8KKCkURFXREHFjX0T3/O50OHiApumct5R0Hu6xRo+dooj
	dwbaP2fKGwgamUpPMFuSa5u+Q/GgtrbFKEYVVYbFJ4y8Ash8Oj5gx7KtUbLwGG1HHGSfaOUWr1+
	OTyb4LOPOSafxlywbcDsTgMswI1/8ebbsHsLvSXHKCYC1dOul2RhEM7L5aHCkHEK5
X-Gm-Gg: Acq92OEvNregCngrG+qssMdPGYLPGYgCS6CD+EC1SoXH+Fub0pCOiJ9gCYeVT7cAqJR
	yyH2n+SM/ZD55Eb50bJV21LAszDKjyo6CrOUysMJEyNwWz6i1mc9OceQ1xhHhXdRNTsu+E1r4As
	IT7kJ290jk5mWo7i3uiHrI7BABD9DNkhIOnaTMVzbj4ZDszTzzHRKCbhr5R5PXE5BGlraXHKcFv
	hSzF10qtMRXnE8dcJ21LU37TZFgyDq4hRk+8JTUzQJsGtcyuipSgtgw9ntwcrFQ4j+YjMFffdt4
	0Ermi/t9sjlEY+OZkBsXXlA/e+C+uqxG0vY4f/QhMe37YJK78QlhPJ5+ULkmQNnSxW1UkNG81DB
	FZgepWip5EuCYsSisJX5qL6jLzEDB17d4SJGti64DmCb83i55DdBI0bxhiMom0xnLMQ==
X-Received: by 2002:a17:90b:5806:b0:36b:7f69:c152 with SMTP id 98e67ed59e1d1-370f0095ba0mr27626871a91.18.1781073085872;
        Tue, 09 Jun 2026 23:31:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:36b:7f69:c152 with SMTP id 98e67ed59e1d1-370f0095ba0mr27626850a91.18.1781073085422;
        Tue, 09 Jun 2026 23:31:25 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:31:24 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:48 +0530
Subject: [PATCH v8 12/12] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-12-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=880;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=ZedtRlFClaBXevVNFnYB8UGxbyP20S9HuW/op1IPHAM=;
 b=FfTt8eRCvP5b2HGq9cfYdfHZHEb2OOf31mknyWFHcXDKbGLqsavlBfR/mfKut5rpe1XC7wYES
 7GxoxcVrpV7AJ07VjbHxCjO1j86CkCt1pZUOXn/cwlImdS5tOiO5F8z
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 5QTzypwt9ATC_CGr8d9RfaeriS-SqXWI
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a2904be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dn0IJEph4XI5J7oltBAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX9F534KRTcf/B
 /xHD9eCJWuw2FcxaDSX+cbicwpuElQdeEJqKyHTGBtu+y5V2w1cqpQYdwgXRiuXY+s8cNH1/pcx
 0a/KKZaZBmLWOaBD++wlO65AghYGbB8874E094VNeWWpCD4y/3sFQ9FleWhsdEVUcl4++xGs06c
 1VejHxM/eb5tqhJ3lpYCIZyMjhk1OhQzuE1NRWP7ifXgzBZqx7PgzvM0R54vByZIEvJ60+6t8Nz
 ZATgNqla3lFBekPJOpUcODfQSUcFZrKNkcl67CwNzSOSFOEjsRwn477PufLzzU4In/cfvMXKBUA
 454HSY/T5ZV5GGs3TYy5wXH1LGDRbBGpVG1WTS5wtm1ml7uN+pE+KNXGGP5GV32nbu9IXX7E1FU
 iFG7apn0VQUtllvehZBJlbN9bJ8JIFtqpbRENICaZbfqoHNiiQPEz6P0U6ohR9I9MXOBPa7ab79
 8gU4XDm0QpYMkHkc3Bw==
X-Proofpoint-ORIG-GUID: 5QTzypwt9ATC_CGr8d9RfaeriS-SqXWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..9445badeb18b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,12 @@ ptn3222_1: redriver@47 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

