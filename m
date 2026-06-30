Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20954375F87
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804185; cv=none; b=ptidnsA+AGsPM2jk3I5SIJm9vGzN+wltlOt7iD4+eHvqt8jTe2otLx3C+/YCEf4zEyj3LMSPTy8ALSD8vje0xm63XVNL4TGd5HP++tw5xHJZ9e0UlfW4x2ABc1ERoFdzXKTmqXTd6ATx7VSy8/Ypg49Eh17DpvnKHVxxyQXQDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804185; c=relaxed/simple;
	bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0U4ZzJ7rpgdgkEIiQi91ltOTLbT1cSQM6YIhh8f6g7tsu0m4mf2MDhhsXF09xwmq4u7zt0yTI70C3OSp+2TQLf7wIBgXxXBMrxsxa7Zbo/s+5zh30zDamqX5X15HzWFVe9PRBu1cfKW+JXDi51V73Q9ucT4HUBEObJSulOdVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NklSeFQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfbsMbkt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NklSeFQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfbsMbkt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CYEx1030885
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=; b=NklSeFQFckZbheRF
	BDJQiSKwSsXBJE8zju1pn+sNdqBrdohJmsI9onF7wuY5eEFjsva9FqA6aX8XXBGa
	yw9E4/bi9iNeyhnkWenzikLpE5/n/PQOHXT2rJ/I9nut1Ht5xL5Vg7XSGZSFhQNz
	nd/qM6x8cNdHuTGw82NAATEJ9WRbjD1P0GX5XGbgPOAtBxhOH/q4goUTEum30LRk
	7aFA33lwHJQ4LPBikUVuhm+25Tu5WVcliZHp494u05lKxRou7CSvKQWBekhLr87s
	daelJwilFXxTVHxb/B/4tyL6mnS3tGZpYT3QL4vUvSPLsKMUleOPTQ60i28hD52I
	B2+bcQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp127y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:23:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso18461cf.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804182; x=1783408982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=FfbsMbkt6jFLUqL/L0MyN5eYOSgqwepeURDcoor5uMCZZjSFRbLweCj3yKuqfRxxXR
         EotxMZ/V6riBMGF0ZxTBbPpaNaHgpF5HlClX7dahT+lY0pYO4Ylqp/LH5GBKdYyks8Bx
         aXslUyYZ7gMHuPTahySlnBNQbyvWO6ELtBqn1+fgiANLaJsiVA6wbgyXkqpgdvYcARjE
         xReY8HBi7vOGUgd4oWv60MnSGudMRVFrjU9QFJq4cMaMd/ig/Eint5DUtuYPyH8bdamc
         S3hOJsN2t++5bLtfYT0I0ygxutNspL522/RTeLlpSLx9eXz1E3gkw6PAtWuVTbaCiPk6
         UcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804182; x=1783408982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=VDBiOw3JSjvBDz3XR55poYHeYDVeH4zCMKRFbDBhf50+/78/Ti6buUhU/VevFBNX8L
         T1ahuYcwwwRgH+ttlF2JX6X+iS7spnlyAEifRubWh9orj2bzXlK/T/+2iKjX4g+S773H
         G7DJ0Gxuo75Pqh7h8N19xJgpacxma5CBsZrRn6VPHDmJr2F/4HvzcY5IWNFHhLB26mox
         LSOd+llzJtWnPy+pse4Fj2NGJIjKdB5TojbeGgqPU0R4c8lnEswMgSkgsFiyAESUkWxG
         K4SrNh9V81VdapF1QJ/ygrmFsMdDQNn9JVeBCm/2v37k+uRJdVU1yL1XByqInndH0uuw
         cNaw==
X-Forwarded-Encrypted: i=1; AFNElJ89xDwVr+uh86bhGbRIebHHqWnn7ip9jWm/Hm+fRYdozo+YlDbzMzzy00AwTTWFXThznGYkS2dBNIV0@vger.kernel.org
X-Gm-Message-State: AOJu0YzTaYdU8ItWmmuUvtWdHpoJONq19gWt9e6vn4zjwvueCA4FUz++
	IG6pIqeeCWS/slRfIIemUMPGf9FjV4Jm1EkTB68QMxYK7TW7k7skm/36dguwyyocn23vgNbKWPd
	39vv3C6Y2+L9FfrZWgPGlctTTuB4iqKW9Y4yOiGZ1lNYeEI/cFPeTmXBI0mwIc4aP
X-Gm-Gg: AfdE7cnrLjt0NEblAAG/SwqZj/QRI38Q66GK5v92UnMiC7iJF/S+j8o6E7heGpOcPB5
	C4KVRJmHp/xbRXFsrZqpzWMEJV9RiIdM+PndwmnraGvhrjuUTjMx5nP3AtqYPkwKByNNBaZkYJX
	YR66cQUidBoWrEhxJYBIFfDKlzCiR62b/pTniO9Kd3glHM6RsgV6tRMJ76iRJv73Pa4OpQZ7wfO
	taje5BudLwrEcwMNewmMMnS28ZecGx7Jy1HxMQZgJoZHGplfdCc1OpbwPjPl8vJraO8nE2aqoH0
	z6LBTOW2llMYyrAm4pwj4nLcvcYxUoqXFe09e0OYwkC2YWgBoVb5QB0xcjGvf79YQMjKwUVZIVQ
	S8r6ZLPwUDZb1Qvs=
X-Received: by 2002:a05:620a:f0e:b0:915:a6ca:f12a with SMTP id af79cd13be357-92e627e74e3mr403363685a.54.1782804181869;
        Tue, 30 Jun 2026 00:23:01 -0700 (PDT)
X-Received: by 2002:a05:620a:f0e:b0:915:a6ca:f12a with SMTP id af79cd13be357-92e627e74e3mr403359085a.54.1782804181147;
        Tue, 30 Jun 2026 00:23:01 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:23:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:22:42 +0300
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2559;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27MmpMRzUWkT4bwkvoZwWD1hrqazLKCiB8SQ
 UYWLFcpiWuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuzAAKCRAbX0TJAJUV
 VneiD/9cBoESIpYNMi46MSIdkxtLCeO2gxv9fznD9UuJQhIy+p9223CgeaHKEZxGz+yETQX483P
 RE+s7svUdBpsWJsLcnyEXD932OFqtyKCM1Liz8frx1pDGZ39Fn580QVo/UNnGKxLoiRiv4OBXVD
 6HHTXUee0rsxz4yb8jqsE1bxm4MYXBYuEiE7GySq+YeR+RgMPSD9v5cy5TMCC7nZrrmjlGAp4ql
 +zeI0P6MIxVxrIx5eFLKsn9SaBrP/swbqvGqcQsa1LG4g7uycEHOU9vAvwP+7WSK5bk2qGdXQ0e
 m0BNL6wydALUa8d9Sq83y+JaL5q0VlBbtbDYhKi7TW5L5Ctfzq8I+Nig8b4Shhcv14HzkL88MGh
 sSDyDi3ko5KFOF3P3nxNCBWL9XWg4U3n3MnPwbH4Z/4cT45tuBkLMUapds/IejqoZxFxeQxwjYr
 q6O3GSRzpsSW+UMk/5Aw5IDPJgsKbaX5Zj2juLxbLJMoTV1AM6oq5pIktyrICj4Qk9dd6Welw3u
 /0NlC9dHBciYQwxd4qMUTXmMBRj63GpMuTDbd8m5t96E5GBIalueKy/axYfGVAsFAD4LPyrPH8T
 qj/qbEZg6dGnCpcuFPUHCQ2wD/ND1+w3/58tXnw/sqwUUXENKu7TgFUfbfl6grfXBIToY1y5fO1
 Gebw7c7+z35mBdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: gzy6n7XjfXtSFAwd-EGyWEKjqVR4uie5
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a436ed7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: gzy6n7XjfXtSFAwd-EGyWEKjqVR4uie5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX8eWX+nU5/40p
 aniuzezYwewb0rvh6qjl4fV8vV6PMGOAjI78i83pCSgJd5uXa+VDOH942rp9GxBm+Pa25K+GsA7
 z6xiCjIo/WazXa1PZVimvXVEAkzm5qAbe1AMZ3Snx+wQ0CvEPr2rLyx1SZS9dZeWNqsE4bRWCPg
 lAYHMYMtMMuC5GtunkkCD+PDtjH3xfqAGNrJ9+SXJDl585jNtKpTQ0+0nqSmxlKs1/5V8qaQeOq
 1Hoyl5PFSlCZZFj+c+hedQ2/YUzUc6BjR/bAzOJJyxYtPUy540dEKN2rwrUilV+dbKPy/04M7Uh
 EIbisXv+/KnuDfcHXo9voqkhqBAOZikXLqFdZKhy9TM0YIrhsxb/q2jAIqscUpCGMrDtnixrfGG
 u77HKcwWWOw2rzZdI204VjGcnaCzEHkw+59sz2NQpCXVPfYjAZ9gaDHXar1+UuYi7XS+KMXsQp7
 5WVKtyoH2k5wr7YPv5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX6rOhawuKTb0x
 wCEzrxzQ7c12bkJG39sBaYLR6jyKY95U3QpFGjvtfMNsDZzEmk968stxkayMvkgBCZiI+Lg+dC9
 Is7aWPuDfWRzs9IMT5XAJqrBaRSdnes=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..001e18cc4bc3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..43d428a4ed2d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0

