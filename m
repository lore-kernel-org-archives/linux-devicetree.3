Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A7E480324
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846379; cv=none; b=gDfsEFnXQr+lSDaGWPc+ItrBJ9XGjaHDfxDb+rrdZ/2vU6lSaFc6vjY9UivPjswEjekyDldxqXjMV6D1EXoA8zj94vyFeCKowTWs6u2aGG5ITiCPHL2gW7Aqx02r+YFb+oSzUaneaacrkTvac3oubbq2vAbxyWnXYIyVZ9aaTAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846379; c=relaxed/simple;
	bh=iLV+7CutUKuWtPpoyy5AyNzXw226ZCT5toSuoYtk/sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAgH2KcKHVyot2HtUdT43L3AWixSFvSHFaowjdVFJJ3sJjyKLLlvvuqoOviZATOdMejTNvasJDTHbxIRyQ/Q/9WcXqER/m1MAJMzOA8EqaPWg/7FmwBYPZhjklJ4iLO8SdTbFnZ9tEU+JfaikkVfKfC59epcu/rMhLncI/xtffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMMvEzMj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdeLsFil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMMvEzMj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdeLsFil"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAX69W3219657
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/6uIop3gH9Mf1fZ10kgxc43Tn7ipn4hNkR9u0UA3tE=; b=IMMvEzMjnqdKnyTS
	KLh434zkgB/bYJ2Ip/o940gL6tCTC9pG3Fig1Yzoo9GAfw4tlavPEmUdrSI8rjFG
	MsgSDpIULqIEDIDCr+c17JbnyFSWSII8XESVeKl4MvWdBIJFIGa8lNsW9GVhgGIY
	i841rO2w0UeNbnj0zGDKXVQQl8DYEl3cmqdHitq/r2KgjRcjULr0QKbgxYkTrTxz
	DISQbMEGX3xRKT8gUZXDRZxGsYa+byyc5KrCKLJbJZoMTNqg8l7l9/ygJ2AFrM7R
	jPV70rcfV+rcMVeHszGYC9nfAmDUpA4CTnrTXIcDXY6zALTPnAGIKPm3kMzFKxWS
	J4JfuA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s33wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:59:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514ae0e3ad6so21670971cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846376; x=1779451176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/6uIop3gH9Mf1fZ10kgxc43Tn7ipn4hNkR9u0UA3tE=;
        b=QdeLsFiljrO14tUCDMtk7xVAfV8eCUs5P1kRnqv/FPVU8Q090qEHGYFhOIy/Zdrfnp
         kDrk+J/nFiIQTD7Yfn7JUKYV7gnXfiRMy0535o2PDkJHHavfvitIyHw+PeODb86Kc7os
         cSagkf/jsgfU4mHtUDCTMNahXNpQX/l2zt5Fd0k0+a5B7s6VALVgFUI/vNcBMgwasYhD
         e7HzvkL4b+EuQoRVJ+ZJscWoB7WnUBblQrtmUcVXR/Wa62YqjcGu+si/kHl4+wxlCWHW
         MFJ/C/z51JTQwrBzluQewVYzMnyC2yqqPltq6UMtjPJyhv9s3sZaoFVmiVLxSbAW5vU5
         pDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846376; x=1779451176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/6uIop3gH9Mf1fZ10kgxc43Tn7ipn4hNkR9u0UA3tE=;
        b=JGts3/UJtlDnZe44qXJci9f/f/Oiau6B+/SKblcgdLrrI7aMbXGBjgEKX+/ICbWxyo
         FsUUGwi/R+XK8jLf9W4uh3cQdkFd/jdX+rhRqw/vcPoOcO4IdYVjydJyIW7WSUHLhNxY
         htT/TxayU0qvB2qhjQbgX/SOuw6A4Ov+TSbxkEYeRIBTvcncE2mg8rk/DmOvZVyQPFUI
         oDTt6q0FdvwZ+Jqk2lVrTyAt/ZN3BrTDT16b/JCRGyJRLQzjq/yu/54pM/5sDP9+ZJj0
         BCM80bmtX6z90JnbCu+2v8pGthsXh+7Bi2KwxJkKbc1gX4hj725K0cX4HJYEi2h0tEpK
         lljQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+NP1FKiq5D+E3+TM/FrE/XSBi9uNxnVsxRGNYo9vEG6ya4zWi3N1gc/WyKZciLPgvyKHTWXeGrcKd@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDPqk1VH0YEN8YION/1okjT9F9KkqzjxEi0x9+6Wk3RIS7t1Y
	6ojOpaD1g3NRcYeLPoBC2nAw7zEpyFHUQsW9Pfx6u4BM0bzen7RhzXqTowRSckjxoP6sTDW4QOE
	op2sjgMupaeqEjhlTYLg2W8vP+khGdQ5sesmcPtIeCLUhflp/y1jmXkv3bCj2WJKy
X-Gm-Gg: Acq92OGtZHT8kgJ+N+zfrHgoTbK3MK8TGnYC7KYR8+iRsbC8uhARIx8n+njckxC1hg7
	q06mjZ1FPjflVMtL89Mac3oiAJRIO/p+WSd129zpIG4atwaK/+DKge2WldLrV6qFRYaooaDENqx
	sh3nlwc5Y7XuVw6GbDIQBC317g6v0NduMrY+3WZLnGzu/zWEBL0VBCfdGDbTwZH3U9VqZQt6rUn
	j4CMyXfm5kVay9R15PU2IKJymEkVT1b6Kga9DBr8Wb5vICEMJ8Uo8GjDUGxIgGfKztQ3vEp/itw
	1xFC8dLrdsyHJKtEQXghbPT71Bazg/l+SIHJUyYtuCFzthtHIoApec8FtHQXHNAt1fXJ29nZL6j
	8Q3tknXBGpoxfUKPs4c8FJIAuUnnTaqagN2T3apaffd9FSwT+zNz+zcXeINn9uTpfjvx/ZWkRS3
	F/gQozAXX7T5qZQmqgEMWRSJIsbgSkaUph71c=
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr98758141cf.12.1778846376205;
        Fri, 15 May 2026 04:59:36 -0700 (PDT)
X-Received: by 2002:ac8:59c3:0:b0:50d:7632:ddb2 with SMTP id d75a77b69052e-5164159ee2dmr98757831cf.12.1778846375804;
        Fri, 15 May 2026 04:59:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f119ff4sm1295651e87.20.2026.05.15.04.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:59:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:59:25 +0300
Subject: [PATCH v2 2/4] media: dt-bindings: qcom,qcm2290-venus: add Venus
 on SM6115
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sm6115-v2-2-2ab75229de61@oss.qualcomm.com>
References: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sm6115-v2-0-2ab75229de61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iLV+7CutUKuWtPpoyy5AyNzXw226ZCT5toSuoYtk/sQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwqgYT1U2Tja1LE080p0N7zY5omHRGMduD/GI
 AHm5kryaCWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcKoAAKCRCLPIo+Aiko
 1W9LCACQW26QBmj0u6Q4q4W9WvrarePhRYSAllIq7Pu07Gechv+Z49zok/+zN23nnFZv1Uf67X6
 ru6f51+w2jVJYSrIiyus3J4Fk+zJ33VO2kv15KetIbz42RGEq/Xo7C/t2l0rjLCsC6G+dK07GZo
 LWvpfVIFtPYAl4y01e3hFk0MEzy8G2gphox62aKEhi9QfTIm7x6t/EO1PKVQlgvJXq/mVMgOcwE
 FkPvz3dtXPTv5vssxcrgYz8veBbYSDuXhhzo0eDS6VSV6XPINwP8YXZlqoLRVrKhAZ/YOFYGGxv
 DQqDc947RbpUEieg1sLMeOoJaGbDoZWv/tei3nHGNTJsUjLO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMCBTYWx0ZWRfX6TEkDP7MCQDf
 8O+Q2rnvZcOh3y54uMS6+jHRFCAenvm57ZFBYMUZDpQMwXB6Xp8TzcsiIVC/RlWzpZj5VFnQLwR
 CgO+Lh9+unOQqcLxJ5/v6lNpd2Q8AspLaGjPNaClQSWWDUBaTLWSKdamGKnA0mPSnz52V5bukhM
 yem2r/ljtEZLgGyWYcegEDOWsCG7i+q37q7yKXSG/dY4XeT+dOg6En5wMx3u8wvPMp1ZjeDL1rb
 G9BMc4Q/CciYxlDmxkQyLHpSC3DbFh7yQKcIBwG2yRbF6wc/eSP1EKdl1vFsUTGobCqdTlWPYzv
 xLm7ZOH5SH2kjW+9iTRteXfTQxgcIDli55lOCuZSja5b6R2XkTRp7VkmOXizE8DUka8QOb1PUdp
 Xshv7+aCdyAa3xSMenjVZ8YklqUQOu8hC//P2xtYwsHFR1sP2KOPwbzU4cmdxolRbtSxz+IRSRU
 Cw/1wfCmDknmDin1Ljw==
X-Proofpoint-GUID: pgxMu0EecPK4Gg_uLsdeyFFpQDW5jiJ-
X-Proofpoint-ORIG-GUID: pgxMu0EecPK4Gg_uLsdeyFFpQDW5jiJ-
X-Authority-Analysis: v=2.4 cv=HJ7z0Itv c=1 sm=1 tr=0 ts=6a070aa8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=4JGtjPUTKruHVPAqO2MA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150120

The Qualcomm SM6115 platform contains the AR50_Lite core similar to the
one found on the QCM2290. Define new platform-specific compatible, while
using QCM2290 as a fallback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
index 7e6dc410c2d2..ab4c56ee9182 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -18,7 +18,11 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qcm2290-venus
+    oneOf:
+      - items:
+        - const: qcom,sm6115-venus
+        - const: qcom,qcm2290-venus
+      - const: qcom,qcm2290-venus
 
   power-domains:
     maxItems: 3

-- 
2.47.3

