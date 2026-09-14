Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B5429802
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382725; cv=none; b=hapKO4N9pG2dI+2SPw/3QunRzocZjmoGtv/5/JHL+HQ70a9/6ndRrz/L6HMm7eZ7b1UXsAJnnixfc1/6oOh0yOd+UmVwp9gFfrF399jph8U8vdi9CSzEUkuR5lOVxmoRuyCakV6rkMMhafzW4ymZHJw1RXP0BCS5Zgj7AcW8VEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382725; c=relaxed/simple;
	bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MBCKQZQ7IGlKRC9NO0yQxJXijT8i2n+umR0JmpvEgPCgVjopjRisZlgtT6aP3keuXpC23qonQBjlMULVb8eXImLQtvuTfeltzve1GwzHcVWo8SnZqiQkMFbuokBV5BnTpjSdXqdg6VvBUySOqVulG6uJi8H6FOpZMUa17ukKFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvTH6iqV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikBVh0OZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvTH6iqV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikBVh0OZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9ndxn184537
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=; b=GvTH6iqVFfzybYg0
	YA8ocY1Jcy5XFn9qUYyKCPlQmesEbfnZGuTYw9EKDy/rYvFC6+ItGyi+t1PxCsB0
	mxXJdoyDFHUGUaBKSR9zgGaDGU51uahF8H1hUWM8zE5ZMmR5Vikd7sV9/CCGDWOu
	bhHOpdn+Z5+y9kBvamU+aXdoxoryLqzGp2OS8MpNPLWAWsJJ13R5mI5HREdQ1W7w
	gnO+NHBNobGNqRQMiF1k/8FxU6qRPF3MJpMicxwkUVj5/HJ55zvSeKDTE6ZTYHMS
	pz6UDf1PEQBb3GbvTpV9L9UqMWBOX3kaNJ5C26cVYgrHEW6Dy6H5g7ScpD+mjUJc
	JZaomA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c66t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:45:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so280590385a.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382716; x=1789987516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=ikBVh0OZ1GaIbURr36yznp1TmJ50mcJZnYblLGjMT7uIeBcK82DGqI2ASzLnI5xOEp
         ZnI2sljEWVEO8zC6V7MhIx/3gqWslZ12FBOIAsPu59Eyz57KaWt54tPMgSXFnzgoR4rF
         bU7lJ8u4WZLFTeyVXcw1DQwekEcqV4SXwHghfJ8tjLJZQ17mV4CG3VFeKxmAtAvsvlt3
         7MzHVkd+0XDqTOmh8o38PEUR/j1JGLGbVhjT8LQCRtQjaR9sSvpQXCQkqF7kn7Ny/JE0
         PsLQAvR0q1Zc+39fPmWi8mS+FvwiFAVHTvtB19LnFxKjKKKsPgZi8ykF1KNVfpmdnyum
         1ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382716; x=1789987516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPh1SMiOMKo0W/ilqiPBH+vJik16ZZ29h2F4mujk8Qs=;
        b=KovlxQGMDc7K1jQaHvFB2X1mPqZsyvkNTrtlUCEYtgoUmHM4wuJSmu7FPpa539QFrS
         JldarThi8DlXvFl7zlLwFE1mXjPM2cTTKDE9ahZic3yzuvvUVbkUlvUogBRhGf4R8cIG
         3UH10VpbQ722yU/T70XSCUtLT4mG+7wotwgDaaVp02DrCbVEaRcATNEoYs/yVYhBSwOf
         JrCzulY/+n1OdZn9L3C3rFCesUm0gbSAcrhN9BnuBA2ZYpCPjjvUcxVOtUKProUTaOOE
         TUxUbP8RHdpTUkPuPtHpzv7x+9NJUHQgaQnMG3uk2XhSHZSIWdLQevjJdYorvJo5xIAf
         OcwQ==
X-Forwarded-Encrypted: i=1; AKwUvByXx7lKiq+FsKzZHfICHOhRVGmRlsHyZW+PqWmzLu/wGgB7jCEXxtstB6GsAg+27wsZ5j88BFROkVuF@vger.kernel.org
X-Gm-Message-State: AFuF++kDYsq471Rvb8C4Yq2NLPvMQfCFNGVPxWG4imUB+oJ/wjA/XDVy
	PR3WnXLoKw2ahTN15oxs8TpyXRhfaEcU5q+8MCX2xhAViCQnz6MFTMRvEVlkX0CSHfjbC22AGaJ
	kjWbniybmpG17z0un57KJ9CHTeMtxRrvBK+NGijDr/4PqzpgE2rvAxzzpeGZm+Owy
X-Gm-Gg: AYBFou170TUtUbHoscjp3Z3GlObpza+w6MSZEYtrRxITQNOGnQQmbwYX5djgsiOOl9Q
	T1BkiIAfN8cW+GaxIg0CieERNxpd6XG3yys7KhpstjxA2/X0x7hZme7rgNP5SE1NKlyBz83/TXs
	n3wwFkQC9CTp3x1FHAaRwKeqXRnLsoQV3RpE8iQBDnOK7M+OPjNsyOsQxuYUbCnQrV9kABpnJns
	/OBF6Hs+g9DctWgV3UCfA8N06E8XFWNHl66lrGRQtKm3NiMKrGBBZHZGvgsQRq1r/iXdGNsDRjN
	MG5E06v2Z6lsUe7b2+c6ZBAtCmXJFvKw/n7y3EEoPWmTCioFMVLJLeLf+Q9C857yoMy3lWmmRN0
	U3XQ01jJ/
X-Received: by 2002:a05:620a:4885:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93a2985c04dmr252623985a.19.1789382715619;
        Mon, 14 Sep 2026 03:45:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4885:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93a2985c04dmr252619985a.19.1789382715062;
        Mon, 14 Sep 2026 03:45:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:52 +0300
Subject: [PATCH 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-5-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=E0xPp8WGq/6zxWJIIsZb9X9a831XpeM8ZX+0nCt0yEY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp9AusjYM18x9IpNGdVAu7SKvvsa4gREWp9NZM
 9oypAYT4eKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQLgAKCRAbX0TJAJUV
 VvYkD/9MJkph+VqvIwodkfb1IF1XmN3G2OXlE4S4jjJyIkup79J7wolt18llPtQgRmtSBAeZFUM
 c3o6wwiMLCOCHARzdW8W/r5HQNvy2fmPfiPwxn31dgxe9PcN2h6ToYBpCHjYAhmg/XfQCXKBmI1
 1clMuU0zekPx1NRFmj4ksyJs4RiCI4VvWGqI9T7F0kGfcvyqVXtbC4Mo9vRm3ERkD76iKb/oaDd
 jp1EK2HLkj2d4FKNRopKo+Srd+9ISoZ98yfzNLqJj2zZuz0kX3UIBK6JSwlig/mQWObEMFaiY3x
 9TyaxRe+8E7Z4RmHMktg2Q0FDPgsJUN7wVGe3bXATSHFvfSqOWA/REzPAguXRJmfBChNSrj53cJ
 POvsKuCQRWnMjaeuGwD80ulfF4vKOmnHGtTuniNAKUadi4caCDb4+IF5yYHep7NKZ2S28kTQzlA
 4iSp4WiyESzt/BFsYICbmHHIeFmQNulIquSQ5clYs7GOB9kvKe7ReUNg7YBR+rPTqZrFKiNOiqW
 KZeyq/MWi64Ho0hzjyQZk5zkuuMbsD8v3JHojNPpa58zQMdCpPNQl55r/UWL3JG6IvCd9OMUSma
 zGagBfJoC1IOBb65AP6mAtbL4VvK7Jr0hJ462XrxmlE6O8qRVGJxWWYK/6pC7yD8xs+lReJ7ftY
 PTT6xqJ/qWJ9jLQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 8WbvtEW-y17gXLyc3qFrk_xGrPIrcnQ0
X-Proofpoint-GUID: 8WbvtEW-y17gXLyc3qFrk_xGrPIrcnQ0
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d03c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XdqwL9Qi1ApNGgobcvAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX0AcXLq+jKnWC
 rqrQk/0mNWZS7W0iZvxAjGA/izuCJJ9Il+C9YUccOyAMT3he61/JTpNHeYq+AZ/3KW56/oQtB5k
 WkpnFJwCaFWkrllauZLZqJAi+2CFX0lozHYy+w+JEiQAZUEpwSPHeXYkRKXFs3HJ3+vnnbslx+O
 TE1xHkB6yX22uLAX4mHF7Ilo8C8RbC+nFcMI+1y/5FowyTE8uH4ErT7oG/PRaHcn+CmGfjcmwOl
 zNzrd14O+swFAgt8bysZ846AwfVkwhoxE0sJAE2yDh59PSlfHq9VKKkAhs47HAPBzsKEMcjpH8c
 kIt4FUu6poFb9b6zW8xRKZ27e+DZQ4YmCovT2V9D6oI0/jFeeLh4RPTk0TN/SZ1aJMN5SJYGA9J
 OTsGHoJIXJN2SVjyrULkowGrMO+7qTLzQO6bRwe3j872jd770Gqdt6XfkmCD7uCtFt2qZHNTm9S
 hKVg7PniSNtw/IG9eTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX3r/lUlYP7nwg
 yos82A79n6AsAp0EMWNI5foMbMB5tuk2Uz+JOg54lMCsHE6Lk5anQcELgSbLO7HPithOP/Y085y
 8J2MU4aMQAt9C1ERXEMFuN/oRqqfmSc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

Add new board dts for the Eliza CQS EVK that uses the UFS SoM.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index ccaca98ad4c8..f44d7ec94216 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
new file mode 100644
index 000000000000..f5bdb2526429
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk-ufs.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som-ufs.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk-ufs",
+		     "qcom,eliza-cqs-evk",
+		     "qcom,eliza-cqs-som-ufs",
+		     "qcom,eliza-cqs-som",
+		     "qcom,eliza";
+};

-- 
2.54.0

