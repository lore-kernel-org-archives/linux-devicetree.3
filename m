Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFA4A207F
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664836; cv=none; b=Hr7Ual64rjyeMtJlBjcQaeck/Ifs8ByebEkblT0kYnlCVeASb0lD9Gl1//ZeaNnpHWcng/7OX7reHEpiKk9kI+Dzm+bcG0yBDHzurSw4n82LIamiq7SBDzTD+E6vYQOl5xShP9CGOniMprWHUGytLqPcWbHFAYSmoxJOxoemrGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664836; c=relaxed/simple;
	bh=KGHGLsMsJX36TQXiVXKufj4XBG89qFl7ziEqUw3fXFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aRyA0dIObSqNWpOCYpwAEr67zhspCq0vSO8cR/6nvHPj6lPnpm48gTUlDizL9QwKq05UiUnAP8PRplTyjTtU45QfMbKHjfcSKbSOW5u0Hhpa1IUDy2EVdx4a+h6h0qSdCLM3ZCuzPCxlc9gwQz6nR2TWRJGq6aK3hUtKFvSi+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXmrlDr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHwFaa10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXmrlDr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHwFaa10"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5Uqc1765966
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1mtDDoOH9Y6ZZdQqCFdDMG
	QgG0C+VN6aIHNOTsPFKaI=; b=pXmrlDr45SkcnKzF1pQeHoigZsE6cF3EEnQ/HJ
	c7LMnIk/zvAmMdPrErEESGZliqCxHA2Pke0kEQ9yGjwbFmcmIOsIH0VShQqQZ48o
	OxyUe7xlVEfA+8zsoO+bs8I8zgBXLLv3Sg9VK1FgRV6B0svS01wSyHb4Z22PGBQG
	XhKdKkQLD0GOgYLMPBIgMHX3v1Uwpz52j6cEf63Jimk3CNxjp/jMx+xdbFsD0XXJ
	ZgGzeeWMUXCheABdwveRFyYmhofS/iL86orMrHR5l0BnuTifgcMg3BzITRfS5YSG
	oIqIQSoKo/Gk3BEO5Q9rF4mAtddqZEsOeBgGV3ghyqIUO5+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcraad22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 17:07:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso215491485a.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789664833; x=1790269633; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1mtDDoOH9Y6ZZdQqCFdDMGQgG0C+VN6aIHNOTsPFKaI=;
        b=WHwFaa10s09dVV0Pjx3fISqHBn2IIoJPSXy+I+u4u+2W8/oEvOKe7b1xTJp72aid37
         3xauIu+7dA/aOflhPHt7IFadLsXqqiFAK6bYPyNmg2ovwwkYnDVmTZofhxpSKlYIwQdM
         ouQ6KbgmaT27aS4u0+T3KARRBrUuini/H8PvLje/BMVDc9zVQaF8k+O4NG4qPHBv9QLT
         02MSzfsAxwCU0ZMd0UkzSc32RkGt3AlRKeBTekK7YxGpMWH36CWGY9MIJX+1wL/umbQ5
         Pcw5RWkUb6cUZKcNHGtrA7dZmzJJSiIchHzYLGpmT4Sw76n+vSpiydpnRvwy1eJAdEDk
         5AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664833; x=1790269633;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1mtDDoOH9Y6ZZdQqCFdDMGQgG0C+VN6aIHNOTsPFKaI=;
        b=0iNmTtSHr8jyTJG73KLQ6Do6k3XkCHDbK1K+Aai+Sxu7/+FHbZBekaKakVRrH398tG
         cCxEij+I8bkjBwh6WKkxuY/Ll85Fn5Qh4AmZHxjxLb0zVfmfEabNWPquKdycp34SqCAr
         Idd78TkIjM3pjNi0sutiaq6Dd0DLQCNmU9bL9sX30BpHZoB2laOCs5xCS66ABLbBvhEr
         dRgdhNVXQfzj/rwRGb6BuHHMd9Uxt8KyYeKjzwxkZ4LTWpjBqyXg9XbqbDHQ6RvBKFCP
         wj/Q5ARR5QYk3A2e+ySeFASeQO1eN1licQ88Rlt826GLyAZpmhSmIEgoBzCNYAmO5I3E
         3cXA==
X-Forwarded-Encrypted: i=1; AKwUvBwO7//LuwZ0Yx9ZMeO/yBumNW0HD5PTIeaEKeKoFMUD3NLY4Ru/SRkvdsdT7eC/FjIP2QbWE8Hoq27c@vger.kernel.org
X-Gm-Message-State: AFuF++mASHDTUwWrqK2JUWCqIe2m2u72mzSh9tmwCXziOUtX0KCpN+3i
	4E27uwyb6bsRqnV2UoRNM1Dg5yucVtGtwniSmIRRPHUqtB6U7Rr2/XFdDT0lguNhexiPHuDcDLo
	algZfFSfT3o95cyCeq/Ds8B1eE44lzMGMGnTG5L07SeSOoBGLF9PFlvpNUBoXECKp
X-Gm-Gg: AYBFou3TqZqxdBBkE00MKUVblLupnXTt1BtN/8MHsmBo+HTIv92LqpB7zQ0oTNL/Z2l
	2A9vBCRlWY+Xsjm0mhIriV5rFZF9CaapI6U21U30I0uym4LbmaqN83kkik/G/cIYWiOZYTI+TTb
	3ESBNvAarhn0TRjbqkHeIQhXcurMVOJLIew31zR6dav3jFU4vX3rCovlzcyNVbRf34ZxnHfS9Fa
	+vW5HHHv+s3HD5Bb93lastDker3PLlBWxutCSEIX8YblP7qS6cRcOILnGJGAkx+7xofmPudpEgv
	NOK+FNbwo117yo+8at2DBRvwAuesdBQ0C6TByPcdNdi9LhTSxyjz8s3HNH7smdbqhySk7XIdzfK
	KvQg8x8VYfEbe4fKsFwd3MR6fb0g=
X-Received: by 2002:a05:620a:2701:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bda609762mr27858185a.34.1789664833446;
        Thu, 17 Sep 2026 10:07:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93a:3c8a:2025 with SMTP id af79cd13be357-93bda609762mr27851885a.34.1789664832968;
        Thu, 17 Sep 2026 10:07:12 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm88504615e9.12.2026.09.17.10.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:07:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 19:07:00 +0200
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Document the Nord
 DWC3 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-nord-usb-dwc3-dt-v2-1-8f88aa30c434@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADMerGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3bz8ohTd0uIk3ZTyZGPdlBLdRHNLc0PTNGMT88REJaC2gqLUtMw
 KsJHRsbW1ADdIA0diAAAA
X-Change-ID: 20260917-nord-usb-dwc3-dt-a79715f347aa
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KGHGLsMsJX36TQXiVXKufj4XBG89qFl7ziEqUw3fXFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqrB43gyMjNy/fhKy22+xk4mS9dmiLMF8lds1sn
 U5Dg4iuXBSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqweNwAKCRAFnS7L/zaE
 w2kSD/0WmjeK11lDWVP/isRQFbdEaQ0ZfZFEqrrj/Q2NVIyBnpVXr1+83r09KvxqIfcC3iAVoyd
 KOeYI3iWOl6iNKDnjkfF1MHentUdAAkhbWpduQAg2X1TgYyzCdeugBGK6oeoSuwPV7ohqh9m4d8
 Id6yOhYYvfcUTqELD/UtLL41dgJ3RscufoLQ36b44erjGKYukIPZMgD+afaP3tWEJmygDo/mjZO
 mhLA9adfSxEZCdHUxIGRDyICv/7LxoZN+kYgbn3StWhyv6QSkJ2J8QPwvQCzWkcIlHW0rnmUGlf
 RAm5zq8CBVwYxjGabVjy5QU33lqoziCSvuLtmdpRQ3aBPMhejoItJzMSOkhiviJbz0Imf7S/UjM
 M2t6HfR/x71G0DJrvBj3+kbtaj6KprE8bwAIxm3jau2o8U2gZCplloIX3Mwl4KdJKQTUYf+WoIt
 CpFIP/9AyoXYXd81tqFf9DKiIb5yQehqH+/YD7JT3fDAzxY6v7z/u1fXNIZosB19UCAvyqGzccn
 N0CB931hOpzkT5ZzBlhae+QThqjeZElw/phbnYitR/I9bTTaP4ipUtNjX4l7uYbyMX48DLMH0s3
 5iwDVw9h9IdiaIjzM0iu3v4iRds3KBUHE0CN06DyNaeNqNLVOm5F55Hlo5fUbLKs8VF9yzbfypm
 A/gWnbLHGNXsSPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfX4qJ035NPSMj+
 LXTU97i2wcayylV9AiaYSSzvFGgNStDE2NPu5B1xImQZFb1zVt2PVok4eSaoHIJq/ElX3Ncl41D
 r7kM3tv1d68GTDPZm7qfeSl+ZYtnpLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0MyBTYWx0ZWRfXy1ie6p13DHd9
 QFaorfxe+SWqeU6BX7KYXpIJbNpONqISaZgf0i8QSUuBZZLwndnE9nMTVW53AHrBfsOaJlxXg/h
 NCVr8vBBHoMJJekmzduT2mQ7qY8RoLwwr9APOBBl+ttHpxyQqOZV3RuCwFt+l60CvJoGgK8kiSz
 ochY9cLC3bei7v5/xgWt+7olqCu7XdiqBIswMUlgNGyN55dl4B4yuavorJG0Ao3tlXIFthmrGCv
 YS++I/yVCC1QHqcqhc0/R3d2Q25hK5nEW7IDSLKdwYabdQbIv0qzH1OUnOOTDhlQF+dWlaepXGU
 eCvP1QCYeV+GzzPkPoqWUww7wbwWvAayuZIG3LTuhVc4ekgXIsCJ8Jv5RzbyTzRpCVLKbh/YY5Q
 oaw56JktBwW7nKAsecr7rqmVKbnXgXo9CLQ64SUPff0MhYYCl+mfCgW6w9JiooqolKsx5WsBB5f
 qETIleuWgYijpSf2lCA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac1e42 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_K4BdmWTd12dlxu9SSYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: CLlNko50jRcStU3Zh8om21Q5n_tmieqI
X-Proofpoint-ORIG-GUID: CLlNko50jRcStU3Zh8om21Q5n_tmieqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170243

Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
- Fix the interrupt constraints for Nord: we also require hs_phy_irq
- Link to v1: https://lore.kernel.org/all/20260901103300.60803-1-shengchao.guo@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 9f91c8711e022907d7367a762d3d556e90b50fd4..c1b5f87149f7ca0873bb0d715c30ab999ad21d2f 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,msm8994-dwc3
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
+          - qcom,nord-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
           - qcom,qcs615-dwc3
@@ -361,6 +362,7 @@ allOf:
             enum:
               - qcom,eliza-dwc3
               - qcom,milos-dwc3
+              - qcom,nord-dwc3
               - qcom,qcm2290-dwc3
               - qcom,qcs615-dwc3
               - qcom,sar2130p-dwc3
@@ -570,6 +572,7 @@ allOf:
               - qcom,ipq8064-dwc3
               - qcom,kaanapali-dwc3
               - qcom,maili-dwc3
+              - qcom,nord-dwc3
               - qcom,qcs615-dwc3
               - qcom,qcs8300-dwc3
               - qcom,qdu1000-dwc3

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-nord-usb-dwc3-dt-a79715f347aa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

