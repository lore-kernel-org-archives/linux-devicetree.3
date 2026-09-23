Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F56331EB1
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125697; cv=none; b=RNjaUlUb57H3190N6bzY68qn9R6CIRnBrCLZnTIM0/PzGufiVa4tucxqJSJNSSMQaIh8BecJ/JBvsGURv0xNkgQKuQ/Ypyycj6tDx9MK/c6oEPRA73bEe29xvQG0J5cb2Ffqc9OOkAxXa5WyPE6VK2kGZqqQ0ypR+dIBmTGsl8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125697; c=relaxed/simple;
	bh=xYKbYzTHR3j1UAc529MOi/VhEpbbOJmWKov6fds1hc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwL4IYPS5G8baqvoyVPlOOA3+btwdTCLHgjNXreZg6UOVfwcsyL8Pv/NBmHSB7/+slo/Hi/w3/XVsFh+Xbtyjr73h8YAdPiUPEq7xMHxL9Kz7cKDfNr8Insh1+7BVoFsMUuHSNaUjAJ55ke8cL/jUeYtQtiFizrgstez8BCr1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc9d/DoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M7d5N5Og; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hc9d/DoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M7d5N5Og"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXN7f268281
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=; b=hc9d/DoLG1MsfkN3
	GWWMStTwEDuY+gW498vI7zqMzUMet3h7bSdZPd/LzPr/rToEiXwdXip19PSXDZLi
	9kaeTf4H3oH8SodrHrKjC1uMOtt4NiXOOvkg6twaXzIQ7HE0MVt20n5N5G1ofcQ6
	3MV0ywdRcvkve76u/dm7fiIRONgi9WKvtr8EpSPJmaQ8ZLJX+hKCEENKwGd4hSs0
	BuTK5v8Vh8/MPrlyOURG1Mvkugo8we6xN8nIFp7RMnnOpdLmn/90vurnEZTBIvcs
	od0LrvkgTJ+6efeE8VYBpRW/eNpjacoPEVilU+rstK92mHaVfqk4HwnoE+UbfYC3
	ae9uxg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1gwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 01:08:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so496466c88.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 18:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125694; x=1790730494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=;
        b=M7d5N5Og34ooyN/MI/rokLVlY1e5eeCcxS97wt7iT1JHzHlfQtJQk6+KWqAaA2VyM9
         5BPRbv0X6Z1UsmFBis6ZwwS0pvPiaVBYAaxSrqp/3aJsxN/WAHsoaDKXExDwmGMnacKW
         hd4wbJO/+sySV1vl8WcxLK5S6LSA3Ve+RrA762Mi6nE6QRdBcLLVD20wF6bOnJYQxTL0
         1ix6xYgpP3bhXw+jnChWy6Hrkm7n9J3HEFoGAS3qUK4IraU/pnVk0N2raf0O0Ye8z2Mg
         gChfup3eiRfn3WzxNmm3OyoQFZWcCikfDra2Q+YH7UijbgHTorETar/bkv96uRLSbDuV
         cTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125694; x=1790730494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ook4P6T79/FD076Ce0QeS4hAiIChZcoMgfecYXpOa98=;
        b=PGvCzDZHpMYsLKb42sfrb68/JalZo59e9lVsb7JjaHgSTuv0ChV1ZrZEZP7bkS54pA
         Ov5aT/5vLvFfL1XpkO4rvGuugMWfqRqZuQaICw7glbmeicl+Sv9Cka4FvfYJIHCov+zI
         IZdgMDiwjsgwDqHYUfF3WSZ/Gs0DvwqGD3SvJ6gAKUMBshj36yOK/o70xbWNk7uDiZ+H
         UjHM752CsS9LXg31jOxO6r5rSdVPtTq0CkwXFoR91wCLr24KbO7VEA+FB7zd2cwUs6DG
         MlEeGFbIJ8s7frawJy5I1710D3TwZZuO3RFns+CvahIR7NIeEqIdXNpOcOLJhUnM75WI
         5kQg==
X-Forwarded-Encrypted: i=1; AKwUvByapXHH1v8FXubCyS+xTZX7tJwaYeXaCx512UK650Rxvd2yJsx1/jd4xV8GIMZ/1/f9u6uPLCjh/hVB@vger.kernel.org
X-Gm-Message-State: AFuF++mLFWQ6yhzX+tVkdpbEWj83AqcIqF2GKGAG4awK4U/tM8Vqt3kl
	IBReC60YdCxfhmvyF+JUbHR3/vAycfmHui4KZaq83Da4t+3UiC6Zgf3HA6Jy7QYe35CfCliSvlQ
	Pqt5+cFgGZ2J0HJhzZiH+Cie5K1INJ/k835mc253IZuBmnJ7zousljeNtF3Tq9Jpe
X-Gm-Gg: AYBFou3QxV7g4lWl+Ahp0E571R2/1N1Ta+QsaKttmZDfa7DRnGq7/JUauRLTyH3jsc1
	MLJdWtyJieVdMyHjupCx8T1BKJRcN8upRwi7EmL5+ifBAWopS2AO+4kVQepNNSz1B+LrG2GKCnY
	G2IW7i4uB1a1OHllGpmpmNnz7PpvyAbdBmwx2qeUu/hg2f1UxAtxz8eH8bj+HCGot+98edrWJM0
	qaSfiAXP36Oz2nGAL6vwO/mZ47VRSy1dWS8Rs1QG2Nh55fbZb2Q8H4O8oueTbQ1gfjSRjldOotD
	rFnykqGA84OR4oKqOUV1T1ukxMJL2xWEa8n7zCO2RdXLqs21Q+l8vNX8+uc4wapZytLv3v0hLXi
	uxYolMFyiXgT0W9/dmniIOyp6yyQn
X-Received: by 2002:a05:701b:2304:b0:143:8865:cca with SMTP id a92af1059eb24-144f91cb678mr1118011c88.22.1790125693704;
        Tue, 22 Sep 2026 18:08:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2304:b0:143:8865:cca with SMTP id a92af1059eb24-144f91cb678mr1117976c88.22.1790125692975;
        Tue, 22 Sep 2026 18:08:12 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:12 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:27 +0530
Subject: [PATCH RFC net-next 1/9] dt-bindings: net: pcs: add Qualcomm Nord
 XPCS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-1-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1756;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=xYKbYzTHR3j1UAc529MOi/VhEpbbOJmWKov6fds1hc0=;
 b=6JYNjwufW4kaDQq7jtknRxPE+vj7KK4oC9wom/fBsBw8BgrKo75Hr/ywl2yssCf6MwgqEatlV
 Ze6a+OOR+bhAySifywb3JmRixoG1HWMliVnIE7JY0mmy3SpvRSVouzo
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 4FvFPg1Mo45LfUK6ba5ZBho4NhV_tk6k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXxCBJgqf438v2
 FTrdDAUAJG+x51XQoloDtegw5qMSvM2+J2+JKDQWpiN6LyRioazLXlv2zASf/Hd9Jbun4YlxyQ+
 4Mi58rQRNOHf/SLyChycruNzTFkmHhg=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3267e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=G6hRZLYLTnwYp-PKA6gA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 4FvFPg1Mo45LfUK6ba5ZBho4NhV_tk6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX/D7zTo0dCcqK
 L9cNzUrI8Yafcm3bdx5CdisKpYyjvefRGfz+phVab62XOV/int0A2PsnrXcdMsagH+VLQZf/SLQ
 v0veVrYlbnZMX2ReFvKzaJWdrvMlTmrcgU8jDYw3Q9ZDUWx9Q/u8m0Hd4nJBqSXJXW+3SMPUbpd
 GFWDF+JVhfuzo9EkqgHVC6B+PBUeEPBgYu0WA1VVH8YMxd5TqfvhdFlyOtL8+QuibvBY1AJCzVP
 SvuDb6OHKu1yqjPpEClNiuKrTj3ZSpyXy3SqU7Vz7W/pAVb6I+3LXD5p1YawP6/gixMUN9SqIQZ
 AcecQFE9CjfkC7lW8IiSmGPA59JyIAHGTDjDNlkiWNz6WiNGGXR2A8RuYQcm5vszWGcpATv6S7i
 Lif+rp39kfoEnyHpprtl4nYWW8MJImhgpB5zqURiwKRxU3CJ4nHAgiwoOaeUhTRwOYvGNUZgqaR
 FmexflzbOC6U0dMhq0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004

Document the Qualcomm Nord integrated DesignWare XPCS compatible. The
XPCS resides in an Ethernet power domain and requires its CSR clock for
register access, so require the clock and power-domain resources for
this compatible.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/pcs/snps,dw-xpcs.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
index e77eec9ac9ee08d2e11a28975f61f8c36b4e0a95..68bb941cbb290d29bbd94d7280b89d2ad0f38e7a 100644
--- a/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
@@ -22,6 +22,17 @@ description:
   by means of the APB3/MCI interfaces. In the later case the XPCS can be mapped
   right to the system IO memory space.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,nord-dw-xpcs
+    then:
+      required:
+        - clocks
+        - clock-names
+        - power-domains
+
 properties:
   compatible:
     oneOf:
@@ -41,6 +52,8 @@ properties:
         const: snps,dw-xpcs-gen5-10g
       - description: Synopsys DesignWare XPCS with Consumer Gen5 12G PMA
         const: snps,dw-xpcs-gen5-12g
+      - description: Qualcomm Nord integrated DesignWare XPCS
+        const: qcom,nord-dw-xpcs
 
   reg:
     items:
@@ -98,6 +111,10 @@ properties:
           - enum: [core, pad]
           - const: pad
 
+  power-domains:
+    description: Power domain containing the integrated PCS registers
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.34.1

