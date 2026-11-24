Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517669;
	b=JNrFuB6XdoumKF2BUYhXiUi8Vbu42ktpVnkLaWNQGZiDix4cCDUUwk4DJh540HIrTFA0
	 S0UND1+6PKXXrhYjZMXhlZTHpFQLQGemlDIsbtmNsNqTMi9bFWraT5/amtpKyRp5xwdOk
	 BXrX4BXQcqhFyMn7O35OGOvSUZ8LM1hYYQfdQbBU6Ex42b1G0VlXHd2r2PPmgIu4jv9e6
	 slz8HbOSgzoF2D0XEExBrKsbCCbzhkN75ADdCuzJ0boVK2BB/j2tyfolMNb+zUOMOQDXQ
	 A/qI8ilrckyKVeTVdv3JRhEWdKXz1H9QXqRMLDSmo9ejPKk06zoRmiKYyft1KtkqBMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBnyod4Eatk=;
	b=4gGOmfhCjpsxu6Nx8DcjwrrFWQDTqUxRIPqTxTRtutsayk09ayppJMec+Anm9Ks588Y+
	 pVsMGZXaOrtH7EzHoID21qMuwy56KjNJZVrFxgHXfSr3E/cgalFZhhsM26AMLqUmW/vUR
	 q4wus+hrqkzJdWswcfrn39FavS0kENWDc2CYxV6RxdWHhV2nXh/Ot0RAOzYMTz9HYGdPb
	 IVI/bhJ5+QsfQqGiD5ikJm8BZm47P6Mane2F7tbxWO+XyrtR0LI/X4MtkqPjoHgeN1To/
	 4q9wf4DzdbjupViJKHUoYgOB8Z/ZAbme5qfAxafx1cSxHsWQmhnl6ic9ETQaZtgv9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzpAzd20;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsalsFSj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510CA606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 510CA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzpAzd20;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsalsFSj
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAOUmt4136058
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBn
	yod4Eatk=; b=jzpAzd20lTuJ870bvczbx/t35N7BJnjXCACn80IKmAcDT2oXAcz
	x+DsAUWBdbTxS0mMBhcunfG6v/q6rKEgvjGxhUHCxdqb0BU2OzocjUpV81fmw3TH
	AUQUnsOA0mPozK9lDYwnoQgEcC310lGb0pBc/GrRwI+K0tFXQ1WSmXNMqRFl+kpp
	Ra1otslSjMEZ0VOL+fr6HPmQpyoGwKrBxNi1XQ/ZkbOg/rMSee8YpDJzUD27hF3K
	mgrwHjLx2rVAfSOeNDT2T9J/7nJfaP1K4uxS7lCkh02KNrpmG6B6f6R4Dla1RmBY
	5jLzDsLz3plMtOuagce3Tp1lBg7uR99Iupg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rph9wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4891786eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517666; x=1796122466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBnyod4Eatk=;
        b=HsalsFSjAs308vdM0yLVrI6qYOR6RGnfgfLzmo4WtVomNVr3xR0hXlgUAsjH0BtSiG
         ZfZiloekpSdGJai2lAXUNxKTiRzVO3XNjwg4rqTAnqukHw9eeIyIkJR6k3njOwbuDpFU
         qH8LSirNEJkDuqE9u6oV10v/ZSIzmZhGFzFncc0XTHcCF2HKkmwr5rJQvKoCfle5cer8
         9Ic+u7wy2EkVeGls7mAaBb8rGqjDZhHaLL7yFmMxhBzC4W45N/1FGee0bFOXbmb3pC9r
         oY5Ft4HbOMKxzRXatZrSAOflOKmX5TKhPkEZSWXQ9vsYBbhOO3NHwEJ1f/LThBQ5sXmE
         QI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517666; x=1796122466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBnyod4Eatk=;
        b=buARiw9n/c34GjHlTv+s9OIvQ1a9+R+kYdwC3klZNIw6UCc39vrw4AwNyRGU4LmPEq
         Z/NLy84UwU6J3MDz1HQi9x+Uhhj2ptPMhDGtavNX5sD7OcewVXkwAIJPkzHZj/J9hfJW
         fVgLlH7Y5BTGuV3y6OobAeDix2EXJINZtK3HmsWY0OOCEL1uN5WdRnm4Z+/Y3SpqejEX
         izHftV7pvpDpldR5IcTI6H17jR/aURhgCowY6BE+gI1xKJB1kI7rub5Az8e4IVAIZs6G
         mDl/Q0jsuBfsBdAo/l2yWYrDH1lj+y3SCdPOpTNhtyeW0pdTAhGzvNLOxb3URblJNYLR
         +QTQ==
X-Forwarded-Encrypted: i=1; AL+hErH21uUtnKQhsCkmgdjDQ74DREQVQDtRYc7Kb3lHGpKBXvhCoSsY9xF1bOY7/6jjoW0jTULCPDZpv9ht@vger.kernel.org
X-Gm-Message-State: APuU4Z/vIjyckvSRG+PpMD8D+YEC1keG/eatWjWsjAee76VfsN8yIbtF
	hhhOIEAUTUgrO1HR3mYzp+2/Hd9cf3mwQmaU1KZ37Q4D392V98k5u5nwwhzvkEnEUA6i86zUiu8
	J08mhnAyiwF9ECaOwcJlFr/MDz8BQ5WbCd52rLiDU+Wj5kLTwiDlqlgImnvkaktNP
X-Gm-Gg: AZFdTZc0hhvQld3of5mbNNpd/JnxX49Bf1tQXxTBCqaZ7ybbuFqJ3f55vNtGMYvuEeK
	G6VogRtuNiftGzJwH804j5ssY0lDfLK/CjRrOfT8jZdysL4C+xUMFS0ce/X3cnTkMndcrALS7Dl
	Um0xlr2+WgxZ0SQjcLBJOj159Q5DDG0xL55ksopRKoGi3vQBU1zzSLp0XyE+zMGsdhNxUdW3tC3
	DKYVcpdaqKOi2F6EVIQJZkc0k2Snj29V/YzjAIjMGjzWR3kDDr1214sp/60l+o+s5P4nesUV6L9
	p3YUwqjyp45TXQXLmG9zze14icHyURLhE5x/46xkGJ1Ii7REl2ngI+apVJBgA9wVV0Y4rNhpkLU
	blBUvOTQqm8xAglOjs5a1iXUnekFaUmD+Cm6n+8f8YXRVMBu/ZGLd4OBDvCGl/aP1jIwGRSFv1s
	CFgA3xGrfyc4J0WdGHMxAs5kPx+StHggEKeSTKNhp5AL+phGpDm8AJM2k=
X-Received: by 2002:a05:7300:7b26:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-3856f25f8f2mr16950891eec.3.1795517666068;
        Tue, 24 Nov 2026 02:54:26 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-3856f25f8f2mr16950868eec.3.1795517665485;
        Tue, 24 Nov 2026 02:54:25 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm52581782eec.10.2026.11.24.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:25 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Seca SoC
Date: Tue, 24 Nov 2026 16:24:17 +0530
Message-ID: <6e09e1ce0d9250af78da72e464b7f99f942e1d7d.1795517657.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+aH39bcVNLzD
 63/b9wC48HkLqsYJHgsxBL11NlnZjR7X0g2eShExuA4N+BgyxU1BH7ugusg2sQGgUKv0CRa/uzv
 CmMWXaapDHBX1ZHkfEaGjojEOMbstRz2kpz2kr/Ei+XF9+FIr4w6Pjy4sKQ3yFjbIC//N+PbN49
 FmTHz0AmfPwGW869r+5dNMfugr2Fowj9SuaGuiH/X6Ox17nsWEaQBe+634bViMeqcEAQ8iyR9wd
 fgX7glQSCQwHIHbD2GYkCrWA0e8l5t7Fthul5vdIz+PLLzU9uH/AiHyX1WP+AlOgwh0aIzul8ax
 mNOSxoqNvvP4b5ibrXfwdJ+3NP08hFVQtBfKqh9sRXrsQVM5Er3ytlm7k/WmIDDj8jydsVDE6FJ
 /qWFhIZ46RbHIi5wejd6o9wGlYCgfPGo9G1eWOamLhj440bBHz24ER/TDF7x+QCx6MgPjqj1uKU
 FvUusqKB/iOagbRWKsA==
X-Proofpoint-GUID: CggSKjglPKS-tN4RBrmRHhh30mAWw9rF
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056ce3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KiTKUbYwaCXuUAD60eIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX32p44v6QLkkQ
 pGP5b3ZjP5E2WYLNeFffL95w8Ss1/X0877q6Nm//vqYWcm0/6ZATLyBUuXAnWt5cj+UtCvvlHYT
 RzM7ZTYOX27OgOL8C5sA1rTdtCkAPzU=
X-Proofpoint-ORIG-GUID: CggSKjglPKS-tN4RBrmRHhh30mAWw9rF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document GENI Serial Engine QUP Wrapper Controller on Qualcomm Seca
SoC which is compatible with the SA8255P one.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
index 9c38ba59662b..2eeff75f2f25 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-se-qup
           - const: qcom,sa8255p-geni-se-qup
+      - items:
+          - const: qcom,secaau-geni-se-qup
+          - const: qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -58,6 +61,9 @@ patternProperties:
           - items:
               - const: qcom,sa8797p-geni-spi
               - const: qcom,sa8255p-geni-spi
+          - items:
+              - const: qcom,secaau-geni-spi
+              - const: qcom,sa8255p-geni-spi
 
   "i2c@[0-9a-f]+$":
     type: object
@@ -71,6 +77,9 @@ patternProperties:
           - items:
               - const: qcom,sa8797p-geni-i2c
               - const: qcom,sa8255p-geni-i2c
+          - items:
+              - const: qcom,secaau-geni-i2c
+              - const: qcom,sa8255p-geni-i2c
 
   "serial@[0-9a-f]+$":
     type: object
@@ -89,6 +98,12 @@ patternProperties:
           - items:
               - const: qcom,sa8797p-geni-debug-uart
               - const: qcom,sa8255p-geni-debug-uart
+          - items:
+              - const: qcom,secaau-geni-uart
+              - const: qcom,sa8255p-geni-uart
+          - items:
+              - const: qcom,secaau-geni-debug-uart
+              - const: qcom,sa8255p-geni-debug-uart
 
 required:
   - compatible

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

