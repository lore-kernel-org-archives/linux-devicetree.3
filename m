Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC26175A81
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251691; cv=none; b=kNQtlDZpRNVFkdQTZ2UEeK+6QKZ25HOpZF+ua01YMIHxQYfaYCSGH7gmd/FST6+lZqBkgV24BlPzDx6qLhpbK8Wa3HhabJcQO27tRKZH68M0ozuhvZT+Pg1Lc2bH/6INA1oaU5zlbzkcr6jih1CYDSnWrBnhld1k0sydMXFtpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251691; c=relaxed/simple;
	bh=64X6gRZj24EJLRck7nWbtxsgY31WTgogrdqax7U5WCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGrRyTxeDqiJGKspMsA5jRu5RoJp3Td3m6BY21vOX6K+IeGxwnBmDR8bZH3dQw72Llg7eEf6jZkKVbxPWvCpH4Ion0gxDzXpiq7P1/p/qBRpWEb+c0yChivbT0ksq/od7LI9MN4VdSPaB5Wa9aK9Bn+RE1rLLeQMn8DW2IwsilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiFcGBJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9MWmM7B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiFcGBJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9MWmM7B"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63Q0uoqB1188515
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b8d9RUs3iXEEZexOSccbKlP+1XK/y+cdxl/
	s6ARmPiM=; b=GiFcGBJ/kfHCmFu3BQ5wUarQy51kCJxLR5KzjFS7bt3UoXIVH7/
	FwfmpENr4IuMdvOL/WKdYSWo1VY++SuvK+/SswrJKR+4w1c1VCMbZ/sYkh35m5iM
	gIEgPyOOvER/QmUWJYiU2IeTEVlUmieG1ky9VF+SYhtLdZuUT4NJTLYtGrlPC750
	JzYdpDHxE5FmExz7m3QqFufD9xZpbL33zuxSxrFowsK+UIKaY22f5AWOVz9zMNvu
	B+iyJjLCutVYFR1tp95f5I0DoEKODVAOBGV67wsSMYuxMb8qh/w0GSZWYifhmqKG
	CY/EIUQZ/aE0KW6Ehq4dSrF6qaWqlDmA3lw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw3v7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 01:01:29 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c21dbc9c1so36705976c88.0
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251688; x=1777856488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8d9RUs3iXEEZexOSccbKlP+1XK/y+cdxl/s6ARmPiM=;
        b=Y9MWmM7BsP9L2YZRRIEkGhgpltGhKSk80xVUObc39VIVri3lNVcPQ9Rz3E7IUVNogX
         eOqwk2ds3skIMHCi87QhaVn/KOc1dxqasAqgNl3wvezJj2Y9mcExfInaDuPbhwM4DD9N
         23EpaCApE1qZ3avNgdtHDpYb27FWhCqRE+37ajBff1Koa9f4AFxPwYz4JGwyn32UVuSV
         tS3OBu+yYDyN0VcFErJF4NT3aamN3ioceexpJxMnk6iUN8VHONAFUTEz275w1Cs/Oexf
         8sE2vQyG9sSuAnTls4TKqw8Q4VQA32+JHjGFQx/V6WE6ZP70e+6jwCrUqgzl0WEB8Dfj
         wLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251689; x=1777856489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8d9RUs3iXEEZexOSccbKlP+1XK/y+cdxl/s6ARmPiM=;
        b=K9+xx0zqO03Wesbcc9BkGbWvMvfHhzXNhehHI3bUW5u2u0Py3qhr76YDIAbIzEZX4f
         nUAU2jUQjfdByF/1+QZha/g/+mL8hAdV7o6yXTQapg26FQi/8/CUc4aI24eq5phtRTdb
         pVI0LDSuWUyhXUmZ+1BnsXqS1IInecyTGX9eJlPSNmUFCaTh6wUiGk50ukYfp+OWBFRA
         YfTq76mP+77s7v5/SOjwFiPX2D7zNV7H//UR81qgNTuaMsg5t6tNCGN4SIO/uXTHyz6c
         FA7na7pgoE0cMPIigY5YfAAU8FkhxQl5b4clvXIwf6c6zzCx2mdAED33HE10QNsakSfp
         Z5wg==
X-Forwarded-Encrypted: i=1; AFNElJ9QnP0Q3f2rCxYOaS/trtpgvrj1SJbo5XbP/BLiHnBsBNNVhTBQVe8HisuGsjatF1up4EJBNrdN1CfX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8aEIecJgnR04XXB1sGNQD3F1nYOGjV4nb5yG8aR6IYJsWUVGJ
	ltapSLhD9qGasf2xbnqmnDisBpRdbv30TNL0OAAWGN58wDhuFdVwicKpTwcvkjJQ9Y+u4IE/v9O
	dl0juCkskuQFA34IDvPZ8QdULDs6/CUie/X+KJQ1M0s9vHgsc5IyczwI5flIMQWjm
X-Gm-Gg: AeBDieuCTSm1U1PmCMpvYX7QJc/umi6PkUTyw8mNxfpZI8F9DoEMQ/Qzth2nARA5SNi
	iu4y+0MkiJpn9PTpyox+TllT1PAFilQ2E9Ii264I2b5k2F9Us9yrokIFe6lSotLsOAWKD0le7Je
	nHcAuBtjadaKDhMS4p8r/p5sBiHogdZXuqmp26F8QpHOHSrhfHRyvecLXBzK7DvPs9lK4ck0ngk
	Ya2dkknG2XuoJwEMnbHfH17bK9XLB3yxnxfesKdp4rfofaNPsYhh5BAV4AzX1KiY5oFuy4nEhnm
	oVu5cM5LYxGZ1BDa4ZEEAJr3AzbXW+iuMbpG9CstqFKzKmsbMzShgNDGIOZ6tgecsCdcFGgNt41
	I3lo08PEmUeUiIvF+0Wuabg1BPbD3HKXlcI3iZXNOIiyOMI0rtJ+2SGObTi7hoqYde8q/sYn9Hf
	ZVc0I4KEow2z7dQetK
X-Received: by 2002:a05:7022:6889:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12c73e28127mr24549035c88.0.1777251687804;
        Sun, 26 Apr 2026 18:01:27 -0700 (PDT)
X-Received: by 2002:a05:7022:6889:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12c73e28127mr24548879c88.0.1777251682930;
        Sun, 26 Apr 2026 18:01:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm64223410c88.10.2026.04.26.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:01:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: serial: Add compatible for Qualcomm SA8797P SoC
Date: Mon, 27 Apr 2026 09:01:14 +0800
Message-ID: <20260427010114.230341-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOCBTYWx0ZWRfXwe3kfvGH1Ts8
 pNxiJtiAnTWD0KuysmeKT6XuriY/F6pTnD/rBZFDpV7aSU9XpNWIwwMIBChWyFMdNgqLfCWHxYO
 IryQUB1vMdiEhs7URVR9ppJJMXLvs5bzySMMELRfRnBTyj4emBSyxcZyTTL1I5D8pZ4iC2PfWpi
 QDt1URiKwV8L8IoV8PLeNL1LFoXC5AK8hk9afVwbnplp7WdxmPYLP2PHCl8Q+2+FzWucdrx+0Eq
 9W3JPEmZfQcqgxOFQTUcij+BfZmw5fpq7AoWU5h3eksEsXK3oJ4MVUuiwKQP9+dj69Aha2bKp5v
 /cmCM9ACRhzyGlMEs4fLW1z5KSQw8+Z5pex7G5yKRhGKs5KwbJv51icF4X9Dp8L+AIrBjpgftrC
 +PmhxlbatB8WEKxj1+wTTuJ290H1Fe0Wy+AzAu3oNGSRx03PJ1uJBhD01h6IdOhZ691J2jwz7an
 qYWWmU/90e1W+qqvJ2A==
X-Proofpoint-ORIG-GUID: CvokV2tKnItUYciu9be5UWtkutXFFpD-
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69eeb569 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xQiCpKoPW3SF3YnsE2AA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: CvokV2tKnItUYciu9be5UWtkutXFFpD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270008

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document QUP GENI UART controller on Qualcomm Nord SA8797P SoC which is
compatible with SA8255P controller.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Use 'sa8797p' instead of 'nord-auto' in compatibles
 - Update subject and commit log accordingly
 - Link to v1: https://lore.kernel.org/all/20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com/

 .../bindings/serial/qcom,sa8255p-geni-uart.yaml     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index c8f01923cb25..8496f822dfa5 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -14,9 +14,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8255p-geni-uart
-      - qcom,sa8255p-geni-debug-uart
+    oneOf:
+      - enum:
+          - qcom,sa8255p-geni-uart
+          - qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,sa8797p-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,sa8797p-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1
-- 
2.43.0

