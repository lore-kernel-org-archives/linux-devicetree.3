Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104933EFFCC
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338183; cv=none; b=WJI9yvdx641vSnGxgn1YVYKnPdJ41d1zhjkE+JDvfJ4cuF4CR52Q0DI/b33G7TSybSJEBpdPIARn2FRxmFvoO+9bVN+V/GQdyLNrrvY/QP0nu8GAl2kkJ3xZrEXEbvqs2KD+NM6CiGyjwiWJDN8mun6TmrKUZdYoVBS1nvmCwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338183; c=relaxed/simple;
	bh=Fb7z5iu2Tu23nAp6mDwCPKGAkCEtpKFZU1e3tF43ZGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVpntV208XkWq2mBbHWW0QBJT0+SZJwRRJHK3/TlE17lpRo9tK/3WhUmIhegIRrgF2+k2iBbG5ylVsiJQzSKGiMbnBsbnq8YWWyDeKh1QzOJcY6Wg695zs6j0FnccHJON0QYB6GGigVBtvdEU5R8C4FNHhyDznilH2H6hKS6s3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0jKi3jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDI76YS9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0jKi3jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDI76YS9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651FDcWN1258371
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 18:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=; b=H0jKi3jnisPa0iPx
	TIwCWnx/0Zpd7VtL91ZKCz1RGB+14hqNQgZQ6TMK0V2om94fsLnvC5zva3Yn2bIr
	KW9Kmet/TAzCMn+OuOfJiASjiCmbfhdsV5GtrX0VwEhnpG9Ea/dCUUJw0HBzkZYc
	P8a9WyGSni3NggO0vD86Q32igTSvFHdYitBvtxe7s2MtPGoOFCPIBDJ5EaSXSd7w
	pHM9ZnSTA3CmAXhxgF8eL0mOtkDLRqUuxYCP0nCqTdWKF6rsAZWER0hfV0LZ0Rcs
	KzSlbzFaB1uGKHEQdzCbg8c8+fpSkHokcricUK7vTc2WdHmWfb5bHQUGOP2WUsI+
	Rl00cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sstf9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:23:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d992fa39eso2234272a91.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338180; x=1780942980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=VDI76YS9DX+MhfyZ+vqN1oSpGRu0cqFlF1GO5szXQio81YFZQBuLiUnK0HPObY9WCp
         PMTahWNcTbYahcd/4K6zFzwCtd6Vos5ar81u6D7KwgwYwh4bArXV3X2xh1zf4oHOyr8/
         4XnlifcpoehaWr/UAMbr2ClyoyXeu3xF9ZWrhjBh+cp2PPrTCGY7OvgyYStLcrM0GQoA
         sNNtSNSGUtDjaHoU6mh634YIKzX9VGyg7w/NdQE5pHDE3ZPVxXXOCwYv1vPqThxQe5PD
         VgByTELDDZCbyc7O/iTNibKAb/xFGidym9TwZ+iss444hb3GOj9QO8fCpzUg699auSxS
         FtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338180; x=1780942980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gk1LjnHnaMQZUuwx1TTnzERzXyykYwap6JC7YNxS4po=;
        b=rXnSKuAzNFoirzHIui8VojQ4rgqM++1V5awEyhMRenleNHQQ9fNuxvZ3YF89ewcGIC
         ttqWQlG286GgM4V51p0XcGJdAUu+LIm4W1EWLPilfTg87KDr0Vax0noGXnnzlFJ5RW4I
         /DND9iJBSJOmRhZ5NZ2+QUEazdB3EKKkqFfIApmikOzvgdQQ0BeLqtai3gpr39AlfqEu
         Ar7mJkjQCoCwsdYDD2ZOmZvGDglp+UEQ+kqsmM6WhhAss37JGk2TnWe+1tswwjK4Wwpc
         b7hLhaEfdiURAQWUcSUhGkbDDWWW9BmM3/yYR7zM6hD9kXqzw7v4dEOvGk18fRv98z5m
         rBYw==
X-Forwarded-Encrypted: i=1; AFNElJ+R8c2XBlugWGPHmJTl01dUFwx22vsk5ndxIu7PtfdWyvxOBaMwQsu2i+3yac4++tRkqFnzcEuJufxE@vger.kernel.org
X-Gm-Message-State: AOJu0YzDH4pDU/Sx41Ul4KSfjWawWFRUk53UjNHR+SiAKXIrGl8GASJv
	T0+1nnZGW3VtckEcrDACpIQPN8B3coOr2rUrlt6WFcQNViknoYLsRmmBC8H0hIJ2t2FYhnkDaeW
	HKr9bAaIMDZPr3PnTKgKb5bIng+RKJXHGN8Cgei3ZGZn0dMaIvB9wxRiBv/H5oKYji+nvagB6
X-Gm-Gg: Acq92OFIq41wbpD8EcLjwSnO5sV3rtOMOchDkXM6f4+GuAA2Cp7Pl1Ey+CjhUzMRE3Z
	sAwY4uUyhKZTs3p2YBsCA+D2ZsCeza21sLv5EtSyWTskL1JEd3btl0GxB2YWbDfaHRxmaEVskWJ
	HCz3Pi5f62lJKIDP5bVnwtUcaAN2BF6HvJ1P2BbONaXxy0LaBzx5UYwfmmRPdw1184SZ6i31MJz
	7w+oM8ZGjXMXvqWFg4zF53ZcBL9FOSXfBjrY7J8UrGNZBNiQbb/OqoElJ0KviflC5HtS0A06m9G
	kMhdezJiSVWkWCu8EQ3sckcr9Tnu0fydch1UKSUhaof73VvSWNr18WOEfBp/kS7WySvwYBlMyVL
	QAQGOloOmih5GfU0Pz9ASVJ9cgTnTrrfMfdIie4tMIMybi/tFKGkP5Oka/nNuOIM=
X-Received: by 2002:a17:90b:538b:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-36dae6a23cemr6140936a91.14.1780338179605;
        Mon, 01 Jun 2026 11:22:59 -0700 (PDT)
X-Received: by 2002:a17:90b:538b:b0:36d:ae6a:22f0 with SMTP id 98e67ed59e1d1-36dae6a23cemr6140884a91.14.1780338178984;
        Mon, 01 Jun 2026 11:22:58 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:58 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:33 +0530
Subject: [PATCH v3 11/12] clk: qcom: Add support for Qualcomm GPU Clock
 Controller on Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-11-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: rHCaAOL48B9qfowmx8IEfdEEvVHGW6uP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX9mN8im4T8JO7
 ZVs+AHogXP5VyBuXS3POVBQKi7PHUdABYgxqpE+Y5rtSqspUk2hv/Gk3SGaDmgJLGbFQRAdQYVg
 4937fV4qr8LYplpJhSL1v+nYvmOjUGENsjHBCVC5SKV6xBAa9ZszCLlhaHZQkJBS/NbPCKVnZ22
 5LJq5gBPfKAoByaG0SEu0naC6umIP/ng1WqpiCZWEPDDEcjRcMf7t+2ejJClddk+EGp3yrpJjZf
 EtPyguoaU7zP4ATrSN5MLhYU2OCMz/ihh9cRmJCC9zmD8qrJsZJhpInwJlu01+OsXWJ2vsOAgdk
 4gp8vSHpHkJI4dsAQWVL4PCasiglXZlJfnX2I7Dldj2Ps1TDXdJQqXl2qWkotRU6IvkbwgUpu9p
 B8Kz53kUMWeU+bqI7CUHPqEy240jtR3NzIDciwhldbUtWZGnaXN2N+t60Zq3/jEH04vDzCbyvW7
 JoJL4lWRwRpGOdF3qlQ==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1dce04 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: rHCaAOL48B9qfowmx8IEfdEEvVHGW6uP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with minor differences. Hence add support for Shikra
GPUCC by extending the QCM2290 GPUCC driver.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 6e696cf672923495c789055dcd2ff905d1761e16..f43dd8231fb20d6f44a10ac33ed7dff923c81fa4 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -133,6 +133,17 @@ static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gpu_cc_gx_gfx3d_clk_src_shikra[] = {
+	F(355200000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(537600000, P_GPU_CC_PLL0_OUT_AUX, 2, 0, 0),
+	F(672000000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(844800000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(921600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1017600000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	F(1142400000, P_GPU_CC_PLL0_OUT_AUX2, 2, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	.cmd_rcgr = 0x101c,
 	.mnd_width = 0,
@@ -357,12 +368,16 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
 	{ .compatible = "qcom,qcm2290-gpucc" },
+	{ .compatible = "qcom,shikra-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
+	if (device_is_compatible(&pdev->dev, "qcom,shikra-gpucc"))
+		gpu_cc_gx_gfx3d_clk_src.freq_tbl = ftbl_gpu_cc_gx_gfx3d_clk_src_shikra;
+
 	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 

-- 
2.34.1

