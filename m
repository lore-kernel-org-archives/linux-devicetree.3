Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E554D2ED0
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788901; cv=none; b=TsKJ3fDmruzKrzIQTJuI+B+Q77x5iGpZAiMg/kux06mzNGdlWc2oozyV4RZzW2J/wl+XCtp/wxWKAePLBWn/usU1RtY2w2MjN3Gs4b7NtxbxkrofxVc62CgMaVSM36FopJFUYX55yMhIcpzb4T472U4XEERC2m+pNTYHuni9004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788901; c=relaxed/simple;
	bh=DnfQwTEmrf/W25KWsSddiMvJISba920uiYCjJKXhz30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e41F3lL/4OYooxUs23ev5XD3QQSO/b9paHCKu2nDFfEDpGOWa556HXas+78QimuebG3vd+BJZE3IySq8Kxfio840kcm1pAcRDAtORhkvBYBKMaVIMcjvEmodqxKL64ecupgrZ872EA6qWiyXQNyZ4lBUkZVvGqmhxoe2qD2JVd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6o2uEnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE/A9AQQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6o2uEnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE/A9AQQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdKsM050988
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 13:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0l652JrPPCg/diYDrk7BWbIq5ryo01lcRlUUPNe6Rk=; b=p6o2uEndG3Toa3cb
	mF2HEKC4774B9wF7CbHGZjIxcE06jRJRq32GgLOkQZKy9tDbEL7fS3bfe9j0XcTb
	7JuZv527bWaIf+wiXhR5sEdc5EWI7eYLBwECXXGYEqPD+/ksDaa6kdqq2DwgDPZT
	1vWi5xQlI+kiyUVnb9onBY2FARyB3FqhhXb8VU+8ytJ/Ew/uNDBqrCqV5wbV5NAx
	juDfWmKDlnDWridjLrcgVETfM/XUWONa3NmdQJocQ0mLhWyKT3P9s47upXDAkSA/
	phOImfBoILWIznwbmxnDt0rTcv2xQnBcDVr2i0i/rl2/THft45n8FyIPiNobsQ/u
	GrucWA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj28un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:48:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so6219112a91.1
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788895; x=1789393695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0l652JrPPCg/diYDrk7BWbIq5ryo01lcRlUUPNe6Rk=;
        b=XE/A9AQQsUmNmZ0pFeuSldfGBBnD4OxMJkzv4gLSMmpU8Njd3fiB88l2ygiJf5K2Dn
         /5gmbl7hrNkCc8sxw/HZlO5R/8NS0pJ59NMVKcpBTS8ZMKRJGg3rqT5tZzHZXaB4rD+1
         +DXEATKjFiBd6KbfJHBE5ivgTn+45ECNl6k5TObV1gbQP0pmUUOa0IhmWkI5KlmACu2d
         eRmBx9POU2c+n5UKstVgHbeLLyMEunQnfunsfk/nMKBvdxT4hHn5+D7osqf7NEWkqrlI
         Bqkkew9vsr2/X7C6FSLceMD8u0ZCrAshsbrtJ6jnSHKhBrcaWzc6mK9+1bgncaVquZey
         ZvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788895; x=1789393695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0l652JrPPCg/diYDrk7BWbIq5ryo01lcRlUUPNe6Rk=;
        b=T32NHgmrUppOak0CZlZOgup7D/vRF0wn3OOC66Anph5bHTBs8XzY4w6lUt+NX/IXBl
         gGflvdFTfYEEdzT25lqLy/gyjbbNuTkwTuR/APmuaqP8+Mbk18CsYrSlZdN+eDkcG7q4
         FAsa7LVE9YnX2tKY9cqAsX1f0Xa87QBqKfiolwGPV9mZSU9kghubV9jEDEv2OQGjV0ee
         Y9FHqQC2QNfmZPo7qlagjeeh+kjN4jcN27Mmz5r0Yz23y8BWIwEFz+b51tnemz0ua6DC
         uNckaoQmVdHedSp7SzVe9CG2wh8bjnOaB+Frc54vg3fTm95ghLdkoZvJ8nviDGxCHXfB
         Jn2g==
X-Forwarded-Encrypted: i=1; AKwUvByCfgEst6By2Od27MkaeC0J+TZfed/Gy/P/2wu6frAgeEVS8vsUPBWQSCz+6bSiAxIXfmlfPcCvbnaK@vger.kernel.org
X-Gm-Message-State: AFuF++nikwQCcgTk5tWEpPi57pwjRCwqOkqvkWs3Oov94RkLF0FlDchU
	y0ASq5TDCuM11nEinmHMdqHWuCFlUVMAsEViJRa3yDAWgdue+GKrHxwh352AiaY8C3LmC32rA2I
	TlQVdDX/mkywDy0LQsXRhdy49Qspmn51hMCF4J+MngjgIP4eOsNDZpxuuvL3j70C/
X-Gm-Gg: AYBFou3MGZDP3dNdpiykflmKwfkJKQS1kwqp+6rRjONDMRxwCKNEZLAU1WvqcfZMVf7
	6QhURNxXCq+Tg/6gdvlg3s52UD5ka4K22XaC6HYHXmklze0KPP/s5v1pAg2Z1Yp1s1voOiUOCBR
	QV7l9xoHpp4ZeLxYQMwvGYaVbDlFPk6DkEbOclm+1CkjgX+VltjVswCU0yklX4C7FeYNQygmZG8
	W+yvB78qcsmAUNnMIi3vRJSUgvg+3cVkxEL3+Eeb/CiJYkk/RdAtTbswxA1uoCqOanq9Ge1hm9K
	le2DGPMpM1yBxt8MTAd3LqjdTTAxlApLQlAQTs4wa39NYWWRur7SIsIlry5hYSbkam/racYFD4L
	sQ5I9lH/Vot4niagKAzEx759tLHDH6Q==
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr38200152a91.24.1788788894631;
        Mon, 07 Sep 2026 06:48:14 -0700 (PDT)
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr38200089a91.24.1788788894130;
        Mon, 07 Sep 2026 06:48:14 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm20826354c88.8.2026.09.07.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:48:13 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 19:17:53 +0530
Subject: [PATCH v4 1/3] dt-bindings: soc: qcom: stats: Add compatible for
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-shikra_stats-v4-1-3825351f9740@oss.qualcomm.com>
References: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
In-Reply-To: <20260907-shikra_stats-v4-0-3825351f9740@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788788886; l=2134;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=DnfQwTEmrf/W25KWsSddiMvJISba920uiYCjJKXhz30=;
 b=svLLQoyardTL5+bd9UHuyiaIKiaacATqA1UXVL0d9vq5z8r2g36Ald4NfkbnaQY8FIyj9Dtdx
 4tk9nAUQ8FqDnX5ReQXwgf0h1KBRUHtQZ8+DQcUx1KcZ4GuqSK1QFoR
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfX6JRuTnjXqPr3
 xrNts4jGX6gSlmruTafu0NnL6ZeBW7N70MO2oh6D1+/hPbkFfsF+9+q7yV2j6lsaro49FOaSqvs
 Kg1NPUcJFuTwQJsC+fKmQVkx+zis5df2Qz775Gld7AwxYmqKzD0MElMKgAJSk/+vjGeUvSJAxPI
 2vEkH1b+vlnsAQR2ja0Q/nJASZ0/ZaCGwzEhEvDAJ42Vzpi24XQ3+C4pIwRyZUHtGOi0rS+5TiT
 JVfJICb0nP7/MR0SbbE8bei8DgoewVB/MY3+vGDiXANNX4w1s3yD5G6qn9QE/U+8ZI2hf+XEGzF
 kOSgSx5xNECYcXdxy0T15zmZudROc8lnFjb1dnR/G6r+s6MHJ3H5N54OJKhphwQSe48fyq5Dc5z
 QSlyq0ZMcH/fPZo+4/gOwGYmeYBPNUgB1iviJ8v5XGRoAx3TfA1AXxGLE2+IexIDBBZ1my9Lm+B
 klnqhDVMifScfIj2aIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MyBTYWx0ZWRfXxeSxtLbVdFSi
 mfHMYy6yKb0GwPWgGcc1Yfe4TOYaG0OWHWHBz/nAbpFPfWfhVdyV+Zl4YAVr4bs+hDHXn0CLsiI
 t48gjX/yJyeF2omOonLr807gXNabST4=
X-Proofpoint-ORIG-GUID: RFVxKfDh5ErR059B9vktkg-Ai99g3bVt
X-Proofpoint-GUID: RFVxKfDh5ErR059B9vktkg-Ai99g3bVt
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ec09f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=omfX-2x44LNwICN2mL0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070153

SoC LPM stats are present in RPM MSGRAM and subsystem LPM stats are present
in SMEM for Shikra.

A generic "qcom,rpm-stats" compatible only reads SoC LPM stats like vmin
and vlow.

Document shikra rpm compatible to read subsystem LPM stats too along with
SoC LPM stats.

Keep "qcom,rpm-stats" as a fallback for RPM targets, so that SoC level
stats are still shown even without subsystem level stats support. A plain
enum can't express that, since it caps compatible at one item. Add a oneOf
branch with items for this pattern.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom-stats.yaml   | 25 ++++++++++++++--------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
index 686a7ef2f48af11a0e63904ff979e40d7538de65..b384a5983d43358d9fceb6fa305f20d6a0c76504 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom-stats.yaml
@@ -18,15 +18,22 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,rpmh-stats
-      - qcom,sdm845-rpmh-stats
-      - qcom,rpm-stats
-      # For older RPM firmware versions with fixed offset for the sleep stats
-      - qcom,apq8084-rpm-stats
-      - qcom,msm8226-rpm-stats
-      - qcom,msm8916-rpm-stats
-      - qcom,msm8974-rpm-stats
+    oneOf:
+      - enum:
+          - qcom,rpmh-stats
+          - qcom,sdm845-rpmh-stats
+          - qcom,rpm-stats
+          # For older RPM firmware versions with fixed offset for the sleep stats
+          - qcom,apq8084-rpm-stats
+          - qcom,msm8226-rpm-stats
+          - qcom,msm8916-rpm-stats
+          - qcom,msm8974-rpm-stats
+      # SoC-specific compatibles that also read subsystem-level stats,
+      # falling back to "qcom,rpm-stats" for SoC-level stats only
+      - items:
+          - enum:
+              - qcom,shikra-rpm-stats
+          - const: qcom,rpm-stats
 
   reg:
     maxItems: 1

-- 
2.34.1

