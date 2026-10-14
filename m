Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ABB4E80BD
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986157; cv=none; b=N/aj+yoPYysJ2XfZpmAZzcdSmlhD2d2Q6/1dfeFmqKYW97XRz0EKF4ZQ5E6HYe8Nh4DXF+KJ7O7fGFfLvlJCTt9nFZI3EsRWBM7ddlhxbxnmJJ4Km1fiIXLk26ZQaOgz9oH6cgQzpNP06l4YwjwP4vcLzcdI0N7b7PWALwrFaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986157; c=relaxed/simple;
	bh=QoI1RsqYg7bQcbAA2KdjiqC/g5TWvcxP2wskOhGI3XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tB+ExNagG7H4CeQwxoqc7G3rThzmAeUcsBp2qAUiWl69KmhTeyF2/pv6xN4gkdUhNvKMNdtXIb9vMvIp7FiAjQzy2BoYB4e6/jeaZ8/KxpNjgpfr5mjYPvxEG1ZOLnXp3TzJJkfFJwymLBkUBE2HG2SzpdGrOOjTTPTfAQQwprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKgF0DS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPJT/ktS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKgF0DS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPJT/ktS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBHl6w3951265
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wAoW7ljl9KKWlBONsFzPHw
	5KdjzrSY6v8WECsydu2Fg=; b=CKgF0DS58/cf0OSJTzLFsAQpu94mKNkV9zahdJ
	gxUFbgXuvg4vvXPl3/D/NMVyN1cYAw07xrz/SYIv3n8Wa753hH3YTgomDDEcpUjN
	WwGPqV2yAxwzpU0hUASNTdFHRW7V8P08a8fnMn7z3eX9cY5CkU0uteMtdSJM0niL
	Thn7o6U20Cyfo+1XQsxzjiQNGMuPWPYCHgz0x5+t3gOJn+Ff61nbCyb/UvnGRFCs
	Xu22LprdDynA+VxtGoE8Bkih4jkgB9CzWQSWWINCTS7IclDmk5hAh35mNQ1apA06
	uGodxZvrW42tFxUj3id+jZSaz7MW082WzT0v3TnSlC0YFh0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p1wcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:55:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1133157685a.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791986151; x=1792590951; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wAoW7ljl9KKWlBONsFzPHw5KdjzrSY6v8WECsydu2Fg=;
        b=kPJT/ktSNM22ZTfpEyAFIDk1nzhXHS3XEvLLShsNXLASzK6S1IFTGXLLG/2hs1s6dd
         8JAacfAEWkzKA/E9mme5hIlwiEMAI1we0XDXrVt4Glk7N1yLLq1wJk6u9DI3EPefgFSx
         8Av/axlLaQgiIzsUyfk7wXxV+FxpWdq/nVoU4qpuujm7q9u3hir5Gl+Jp3g3TLYYynCH
         q8K5Z5zbxymkdBgr1LScujuXPY7f0OtJ1D8/fGx+O5Ihtqc14OMKNBH09bPsQ7s7DCT5
         GUg2+l+H4Y6ilJgdOGt2PEju3U+3UE6tAZTdE8jx8rxx9DKlEfhWhwLAHXpt2uYVUQmi
         IJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791986151; x=1792590951;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wAoW7ljl9KKWlBONsFzPHw5KdjzrSY6v8WECsydu2Fg=;
        b=ptGd7KQ70+ciFMwvstFq0zuImN66egpObKRTwZb5mYSLqJdtsc5kYNrfVhop8TVSCC
         9Xz8Ip39714+GKO3LMNi2/YO5vjYfhadxPgVaAmjPVXr7zl+jttohsRD2BmE1tHmFPiF
         gHAHN+8Pnlc7k2P3O3rX79WmJy48Dj3V78UbptWtmrjEFrDd69FktYbb9QcQ+8/wfPUQ
         WzHQERUt8pQVcR5zD3de+bGl3+l04ri7SlHkCu0oHfU+BEvXl/j67L5MdOjcW6ktgmIT
         njbz6HqDpfer9ssYPpcGg7O2vHkqmUxWgyeqXsKNIWW6aJl7s5h5bXCWH2jxR6zGXYYi
         tjtw==
X-Forwarded-Encrypted: i=1; AKwUvBwNBXiG8NlDekBBcbtgBwQTVt8CLPTEu/i5DrEjADO+uW2pbZB3k6zEQtKo22ub8/qSHQijbm4XVqsE@vger.kernel.org
X-Gm-Message-State: AFq9FYLKqjOQP8HmQgHZtstNvs3yxjTcmYCHwJNfM4MtOQnEdaJ7zT/D
	ypbuqEXMnZIxqc3fO7jY6mVgjA3juHUEjmwJrSvj9ZVqJgKjSa9nwTnpvU7pmGsFmMSV2syYAMm
	8CKRoGKc4/FnIHZH2aEDAkJyRadmjfs4bAHJ7IM9I7OqgTsmGDmooNAKnBbpSFuUhLs0S/7YH
X-Gm-Gg: AYBFou0NdxJfmLFYfBGOkipFjPdlqZcosVSj43on3P6aw9/+vn1JZAQNLDkfYMDnU7T
	1hPIQcOnAvwo+JzXqVNh0EIwae8j7nZBucggKFhJvHOqAylYBfPT18VC33zQtAR4Ey/7xEjD5nZ
	QX1JC46TNCXDixU+4dV0pMFBRtF8ozVfUSLruwwyCGqTQKtkQDSuXeJdk+ogdYvCMe1sKJrPmN2
	KHHWujedKi4zkIAUgYemqnG2JU13RD/8/jEWbcb7B5XeG6aqmjRbhlOyi0D956xJL859OP1nCnJ
	nSlx731jiaSN4TAFqvEpyFSHQrVz7DVVt1EXk/TKeT91/nRa1fokK//cLT252Ab8OaTRYMQvKJr
	nohO4h4AfFg==
X-Received: by 2002:a05:620a:890a:b0:939:3a81:326 with SMTP id af79cd13be357-93ebd25989cmr2543313685a.37.1791986150551;
        Wed, 14 Oct 2026 06:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:890a:b0:939:3a81:326 with SMTP id af79cd13be357-93ebd25989cmr2543309585a.37.1791986149798;
        Wed, 14 Oct 2026 06:55:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcfa9d50sm2815065e9.2.2026.10.14.06.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:55:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:55:44 +0300
Subject: [PATCH] arm64: dts: qcom: glymur-asus-zenbook: Drop the CMA region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dts-qcom-glymur-asus-drop-cma-v1-1-46f745d5b2d9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN+Jz2oC/yXMwQ6CMAwA0F8hPduELUicv2I8jLXijGPYMqMh/
 LtTj+/yVlCWyArHZgXhZ9SYpwqzayBc/TQyRqoG29retKZDWhQfIScc7+9UBL0WRZI8Y0ge987
 Yg6OeOmegHrPwJb5+/+n8t5bhxmH5prBtH43bNXKBAAAA
X-Change-ID: 20261014-dts-qcom-glymur-asus-drop-cma-591289d6d491
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QoI1RsqYg7bQcbAA2KdjiqC/g5TWvcxP2wskOhGI3XY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz4ni2AXTWxQhiyv9TamVXlxq5011tFdHJ2PgK
 jTkhc+uo5qJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas+J4gAKCRAbX0TJAJUV
 VmRHD/0fW5gtdj8AA1uQSkuqz7ErRQpyoqnK+pj4KuItUYXU++ztjULi4iJPe72zoZcGiGuSooG
 3Tzf9jdVqVytg3OZTwMRA3gRNBbR9oywXKgVgoOjCPo4nQxDyobhtPM0mbBVvadVCPXCnXM5Qg7
 Ns+GjDwliSdfi6bBp/cBForW7hP+7V0egS75+b0XSxiaZ4vB4txbKoWnwgJDvRAb15CYyDcNnE0
 Wx3c8AaUC8hjINq6ElOcEmduEK+If7O57KbQ5dbgiFjE8BapIZ70lQT29MSVxhy48/m+MeP/u0z
 NaTVOZeeaNj0ccfR/J6glUDg+/o105lHHZvbAg/oR5UvJfcMRsInpe7ypAz1BaOb30GDXFoJdod
 08LfvOQbg2c7tC15s1EkgNHIyzOobToc36bLDgpLZ6b6jKfqgX0rkQFoQ37ktfpfR8ra8UIy43d
 kuK1zyBLRSNuJ3UA6bNDQTbAXBF8SxLI0fbsxm57IXCiWTSW1O5i5L7mPKvUS9TrfdSZ2fqIyW0
 NXLTrIf+1x5tL7FJxhYHkGOo1kQUE0+iw2eCJMYhw5HoJcRGuGb9XjtHc/fFGtYPnJZqpweiNDQ
 OR44DsfkWuxNqBohCvlAZsCQEh9EJClOCnZaqKibranI+9bDWF1Ftg/J0r/Obqw1SlxbByuqnSY
 QK1vEB9clfTFxwQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NSBTYWx0ZWRfXz0GmGFYK18SU
 tBbNc8aA+Cn6PFYnEghNwEsnAT9kb+TtJVOkrv3eweCQPpQWWX/cTTYJFAMFt3gaeFrVYRg+PQo
 xuUsaIGBAPVeGBi/ls0t1VFZPPwKVQQ=
X-Proofpoint-ORIG-GUID: 8vOMADMZS78axGYdpWXnymQynOwiJVt9
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf89e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nicoSRiWgz3tUqmGXlEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NSBTYWx0ZWRfX9PqmSGJw6Apw
 GgB5i/+jayc3/qb6/en0i82lci6W6SdRUE9EXWclS8M5KP8Qamlgc+2o6748DgaiXHhp66EElIH
 /OoWf216bXEx22toV5rJlYAblgUBIgCCY1huZ6rxr1E1c0iH2CJ+euL9LcNXfxr2Qcbiqxdi1qf
 Z6AVhuQ7xwpAUiByrg/ekyzmGkjksBPaic0pNlasXs6qPfIe/rbUvKETdvPUaILAxQSs9cbVODr
 sLcPNY9r3KJJuskMZ+jZ2Bt+O0oHV5O6FKS4QwNTNcgUNASgNaxsVTE7iLdICSb14y+F3ijrbj8
 1TaaVxKQEuXLgRfXTbV7SaEYsk3fjKRqPjNLiA26zKw3QpJtuwBRhLUjaw+tnTDaNpzy9dYj9gT
 v7CbjEJQKl4ggcRwdDLdPJp4aFNXVsbpi7eXm4sFJ/YZ2goZEAk0EHSBqniegpYk8k3qlAdUcbK
 VARmSK6b12qQP5Njm1A==
X-Proofpoint-GUID: 8vOMADMZS78axGYdpWXnymQynOwiJVt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140055

The linux,cma reserved-memory region was carried over from the X1E80100
boards, where it is needed because the PCIe SMMU is reserved (owned by
the hypervisor) and PCIe devices such as the WCN7850 WLAN end up doing
DMA to physically contiguous memory.

On Glymur the PCIe SMMU is owned by Linux and the devices behind it are
attached to translated IOMMU domains, so there is no need for a large
contiguous DMA pool. Describing a CMA size in the DT is also more of a
use-case policy than a hardware description. None of the other Glymur
boards reserve one, so drop it from the two ASUS Zenbooks as well.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts | 9 ---------
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..83d15abf9b0d 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -263,15 +263,6 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x10000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-ASUS-Zenbook-A14-UX3407NA";
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..207190f2be79 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -275,15 +275,6 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x10000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-ASUS-Zenbook-A16-UX3607OA";

---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-dts-qcom-glymur-asus-drop-cma-591289d6d491

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

