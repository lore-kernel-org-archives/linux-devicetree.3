Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448B3E8335
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338172; cv=none; b=fUab1zG3aSPdx2TtrteGEVO+BqA4+5wa+81fJ2S2SgUnplaQTdSRzx4QP5M9t+evUt/yyUIdKXQ6eomloPlNg1i2r0fqUnkkGa9CbTltyp3OoVK5lFB6nHfnG/XuU3kYdlUOQWMPjOriLKbnkkANGLPV38m3BR89QoJ7za4FLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338172; c=relaxed/simple;
	bh=rLybFr1nm3KqTJtJoM4+U3ZrfAsIkDs2LbS3+BLktrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fs/6qQS6479iYqM/wyhC/6F7Z27ibrKUTPaZHKHZbuAgQFhyN5cJKvZALFWc8T1SXfS1sBlW15YahkEsVGCZ9MwsyWhagQqJWYRNzPCI4S7bn3KyfTzSxuRnhsR6ix5E56iB9ktddWxM3bF6cpxcnLwuuwDvbTxAwl1SACG0fHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6Z6BO6Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0S9Yx66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6Z6BO6Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0S9Yx66"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651CcUVX600463
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 18:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=; b=Q6Z6BO6YzYxgofrB
	h9fcXdXTiwVpsMFTafucIiGSPhKeIAFHxL1uoEyFPKg6FD3MLtfj4oa4M86yWW2P
	9mkVUKROE2Q5CSuc6JDfNXs262q86KJJxjok4/IV+tznz8VT/e0GfrA2lI29+bXg
	PXsjwP2rpJOXSKkJ0eiiFtImsylICy5AJByoAj4wlhKHuY2vRDRyBC158jCQPDeU
	waz/isnHkp1Iaq2L8XIxCjxBId5sr8ZjgO/jzu+dLVAp8Ir6RTgPrjgv2790xMJr
	6DFvml/fbJ8a7Qx0pkb3rN8p4fEjVJv8EtcM+my4J/VEfVXAOWb8vRWB84KNOSff
	bhXA7Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eha8r9jcr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 18:22:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso3438183a91.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338169; x=1780942969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=f0S9Yx66s8+QIfdnF9ca6ykeHhTsZyIPWH8ADdZH/aRyHwTvmBOxzyJVsWN0S742y+
         5QIfKd86nSBFi2ts1fDdXrn2EcQwkmCoRjr44x+7eCCO4Vb63xKygJzk3jkMf6cCq6lZ
         j2Bns9gYlJzjmMu+nh1Kr/VC/UTIq245cdlOnxywyzBFULE68EuGenKlySohgjQiatcN
         aM753a/YyhcfMBkDgtNwoiDmLV4DU6D7+ygBIYD/nT6Xps5gpJ0NNrMOwvTFnbG1stNp
         3gAeo28X42JgOSnc8lIRlqh0LjHC9BmzxRgLskva5uz/hRlRgaHstUaepgxJaNWKAAIb
         e12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338169; x=1780942969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PMyEHNl/fqkgrWTiyaG6A/NMiRKAiN12ZYqWIjYuh2s=;
        b=hIkxXRY/4/hW5aGCZ7Pc/9Rl54uNdZ+xL/YoUhqv5U+EYis18n+vIHSdaG0TbZwJSm
         qRMmiDsd1pnEPPGMPMhl3hfI1vRCWPyAocvizMK048p/hG1wcfvGp3bfNhMviCEkaU/y
         760mSlMzOx819fYgnghMP66RQzHfY/6qM2/JOegwR8MD+vg6bJ6I+B6umGeFixTYZZwn
         azyEvYQ2v7N649JfSydfspNY0D07y3QLTPCvM27oWgS/C/X/8Oy8uIHSETS2tYHL3uDW
         Nbzketf6wgXiVVF2rDwm2AjhVHR5tiZrvRnGp/mF3SgMNRWIlXla1fl59MBZ288f2+kY
         wCpA==
X-Forwarded-Encrypted: i=1; AFNElJ9kZfypgdqDgxPBI/XhkwHMm4BSILx1RH8U0ieNuL13PxRcyEk6fEuw2Oa3Mr+cBM0bm2BcYMJCRWbB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs3tixJIUL8Gn/3veoPquxeRgkcO7WZwgmZZdVU9VV7LS1NpPd
	kSidFZysEtYPqYqbw6DxkTuNb6l3ylEGq3zXD42p5Nq42p6b6sNAlExK8K4D5pqHcDAorc0a5et
	S42OU16+u8f9nK39tHht/7rivfqbkUOAtWtAMH3F0UlZ72UR4JminBuIFIJ9wXLWj
X-Gm-Gg: Acq92OFn74OBFszQOHMT/MR2bzyBgYKOaQWfmq88jPBEkduSqTp2WNktZ3fin99Gf9s
	qIqjGyCudSe/hYFl4SSs4sOuen9ezJpxbBAJbjOnbXak68RAXpkg2fvZJ9fyiwge2aFdvRosRFP
	b/WkQcQXSFpLCjhOquLK46aHe/QKzNnLoEl5jsGM/XNbr7gQ4CYqcpbCJ4Tf8SytOuB/NDmcull
	ul+oNzCJqfmKSO4+bIPV2DX8aEF/mN63/+uCkBn75FlNcZoFXwoyGhW+pyslr7WhWYNcQFTdAwi
	7shuoxySqIXZbYXHboAJvjBebzZr/D9wktxxuJuPY+CZ/WQTVmBdHXiOkU1/R28whvmUOqUbc/E
	k6JxSdN6J3vlIwDQDbrOS04Nj/59XosUnZlBN6L7VrhJQ/61a2X2QL8IoGrr5b6U=
X-Received: by 2002:a17:90b:2d4d:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36c50206e8dmr11910343a91.21.1780338168854;
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2d4d:b0:369:7421:b36f with SMTP id 98e67ed59e1d1-36c50206e8dmr11910309a91.21.1780338168388;
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:31 +0530
Subject: [PATCH v3 09/12] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-9-61c1ba3735e8@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aKnAb79m c=1 sm=1 tr=0 ts=6a1dcdf9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zEYBLtLDRKTvQvC0xrIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qLPQdP7tZREcFMz41iaq5QO2VWnvJU_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfXxFNSsOR/KzXj
 CHaM4xva49+MujSYZszK36ilpcrk++PA9Iqw1HVFRFVrHepLlDWmrFIXAVpFGnvCQTZq8WVSScV
 f7exqQ6p/QBoXlqnuoye4rRkBzLfBlUxZ8xQPcmi64HQBDxmKhMgBLsmwr7TkL9tr4/O1RbQ299
 uP2OR1x5NLhoPtQHLG6Yo6PtPWDLTvsK9rFm087aBXPCrh5K35LKXQKArIHK7pYcgs3LYPMi6Yh
 +vneNgvTMzZ4c168t7KtEt5TuJyJnLHWuyr+FECZ+iok8lAVYOF/xbJZi2SAEyALbJvyK2wBY/E
 j60uzeA9N8AKflYK+vJPANUX5cObgHulK6hM/kNG7ZhNQy4z0hqqSOoMN2c+x2rdPbiMeqgON17
 Gb535Pxfpg6s9sYsg4BMmswFr3kb6IOKu8Gb84v8uOsW/FKiQIUuPgM2fHir10//XfEZZsSjIzT
 D1mv4lgZQyQ4CEych4Q==
X-Proofpoint-ORIG-GUID: qLPQdP7tZREcFMz41iaq5QO2VWnvJU_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 1c8ed12f6bf8154596d031347540ef621314edc6..2150b94ad0ce5146c47ae21fae4deccdaba20673 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

