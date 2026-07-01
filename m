Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E3436375
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903558; cv=none; b=Hy4DBo6D44Oqxaul7uCs4Yx4kd/22Pza52I2l1zYxeh6zkkEw9QXNDgz8NswDm/At2GdtMMdUHe4SSf+6RMuwHyYl9lzYg6WPeMYOu8OO1WoneJxjyEUJQ5r8Q38zPCjwN1Mx44YcsrHLrWlI1bOnhMe8teubtg4O/18hpmCNgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903558; c=relaxed/simple;
	bh=Q3yeNNOnOzvoKvySSSmC+fNocWPyorEd4mGH1YQFOgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mh+D/daZYtNje8r/5TO+bbA03o7RKOgVmCyB9AduWsaIgO5JZa3B53qvRE+mfXHAZew4QUYYNNUqeAU5GPYSQvZPce8X9uQnq/ISiesJ1LoyR9iGa9Gls38IDENUktfTIXd1k5mz974s0/mi7QE9YDOQAwDSc7CQlXy5l0IL3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwCRgCTL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QkMq0VTc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwCRgCTL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QkMq0VTc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A99kx763531
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ojADI+oKRf2pAHBTz62/I7ZIfHm8Q1FZYll
	aG1m1ZG0=; b=FwCRgCTLqzCCZGv7ohA4YCzUsVeB+DGoBxYkL5FQ8BoqRYRFY4Z
	F3vlCadrYelmMGLoXej8P43xEQeN0BZpSpvO+ConCtd1/RL2UXuVDoOByeAfu8fw
	v0HJsbjZebN7yzUgBYu73U/ahyOnHGqzAkytv74Mx3HcOCNP46lr1uGfDblfeH5m
	RcX9hY8BghkzBlr+y1PLT7hYnrAW6lU75HK507NFSEECU6TYVzbFQjW8XraOYN3V
	9pM3mhciqNA90zVYBDNr2YAXCMgDCYE1ZQMPnlXel0I7hf6FqhHZIcpb/0a9gfRB
	TzArZlNE+HSiIbmy3vl1cjUe9MpEHIIZHEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbrqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:59:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso53473485a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903556; x=1783508356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojADI+oKRf2pAHBTz62/I7ZIfHm8Q1FZYllaG1m1ZG0=;
        b=QkMq0VTcuJ0GLi9twOXbCEd/G4MaDtVA6XQjsOFSQAAM8SDY3dJCNRSDCEp6k/TEHn
         U3D/8uAR7PDrmlLD3dVzHAMZCcDQM5vXhVy1Kx56fTG8bhRISVSYz5FjVNNco1iE0DrN
         82qbrBMFuFa7e/3sB2gaZhaUMxDQUzecerkSHoJIb/ctkxsLKlz3POW9604p9xlN68qi
         mh9q7JMhH/Wsq7eUFj3Nz3SWB6bbOOW7eQctb7Zb8rlmaQXpdBTYLxqBntNcsyxj9lTV
         zCr2+b2oqmLRKiVu2HnamASEQ0bKslagmIUsRUEL0YoGUjL/60nRPYR6FAnQBnygg2ZQ
         UM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903556; x=1783508356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojADI+oKRf2pAHBTz62/I7ZIfHm8Q1FZYllaG1m1ZG0=;
        b=Ah3nLmCKzXYUQigIR52HTPjnRCMbXKNnAFs1S4FiIMHJzQ0yR7QazS6aYOaPzI5VcV
         beOFCdByCQDqeYCFf/SPzLHjEWShqWLFAQFmeVLabULBvqQ9FsTuaiLX3R8fgRloiQcg
         f6xXSDV9jGNqGGXe6UhiZxi+mjN040Z3S2q4c27zLnn3XhX2TRGlpS4Xlg8WpYJut6fI
         tEPkGOREKe3vPtzsy6epzS80gHO1K08af1jioL68rzraqtoa51Dk2qIwFbnnmeMyjfhK
         g/1BZ/5NTAZOl8rrabtWhriKPXlzWtxrvvgU1rCwP2RE6YbFzpjHhszo2JyuwqL7UyVd
         0MjA==
X-Forwarded-Encrypted: i=1; AFNElJ+viMowkx7v28Jy/s9k1ZzVwYFUttrCOACnjzfHR8g8vsNWGoZP0/OnBtt9mFENCzlOj8yyvanZ3Fjf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+oqDAXmHqaVNLIrA4aqFdOAoxrzjdUz9UvMT2ggay5GkjdUMM
	HYKpvgfnwAMk0DCyDiGFkzsGVPeTnc/Zf8eeoCotFMsll3mke029j7WkJ5A8GTQc4U3lwKTHNNX
	SzqNw3WUbziCCagnsDacC/IVWjaXlQGc46Dq4aP3WPJwvZ5/uuSAA89WDOp9SgKGTpOAO2eTQ
X-Gm-Gg: AfdE7cnhCQbM2Mvq1EPFpZJ9xpBkwuQh6in2KX0rqsIujZW4HHvyNgwHafkRKb2euXC
	Y9fjDdjzOCOfirqK+Db3cE50e1hMsjDbrOv6QIXF9qHbGE1WdkKvVvYKFPeYJcbl/YyCAyzELTH
	TCiFzBLeqJzBovFgBEVwwlbzBwQb8F1p8t1kZYg1IuiCjeZ3CnARc9akuOy5XaZ1ooDhewzWSO7
	CpbiuAFnSRPVsHDDH+ZeCKPExmf99snJSqp1CPqIgxY/S/jtEwxpf7W90uDCeStSqj3Q4nORxzx
	IrQY9p41kdhqMkHZhvqwRH8diuFSsBMqYMarEYNfIAdpRAoyweA0IUqJfEYtNIjGbzPGEoS8XE3
	ev6ChZwXVgmaKetotZ0NmZlNfYJo=
X-Received: by 2002:a05:620a:1a22:b0:92e:745c:6c49 with SMTP id af79cd13be357-92e781d2994mr152208585a.15.1782903555733;
        Wed, 01 Jul 2026 03:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:92e:745c:6c49 with SMTP id af79cd13be357-92e781d2994mr152204985a.15.1782903555303;
        Wed, 01 Jul 2026 03:59:15 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4dd77bsm65537565e9.10.2026.07.01.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:59:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: power: reset: qcom,pon: Narrow allowed reboot modes
Date: Wed,  1 Jul 2026 12:59:08 +0200
Message-ID: <20260701105907.197150-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Q3yeNNOnOzvoKvySSSmC+fNocWPyorEd4mGH1YQFOgk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPL7pbC7VEGvywAEmPZ5T5HH8BVYxIuscDCKL
 msTb0s7pVSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTy+wAKCRDBN2bmhouD
 13aTEACGKz6G81GDEInFQaFPjbtAkSEyav7G9q66YAF+bfy2e8tFgH4XW0gxfPsB+2GYu0m9nCa
 7X/MgAa2ysAOPAvMhScLXf4Y8CVVv14YsrYO6Kyj4VuV75MBX1nFMfXFp0m5Kd1+4wZyLwuCUwd
 rUGcMe/zA/kmJFijvUg0gqOIjFr2vnXga92mk8EW7tKWudddYfA8yAFx0HE2ilXsWA2aXpdSAsY
 e/OxESXPmDxL745gPSSxa4Hvf4uLeDfvseTXRuZr9mqkJOD1r8Ebqnbw7aj/mKUqdXEJmJl6nwf
 n51M+KigaMSGSqThd8znEk/eFyh69UI3qPyyo4MALKDuanmwZUJeiQw6x+OruAtM91J56fEorZT
 APhh+EAmnu79k93zJgsbE8emvYWExpZoSKSFtwZIGKzVwoLva9tJylk+9P6WKDjlLaBFwFmbWqL
 shw8SBpfQribz8hASa6H5Vrz3KAnr9ovho3vv++yw1XM/wLfiMlWQ03YS0PGvekb/JXm7o3AVn/
 4LYbRvtuVQOD/v2xmLXA21CRNa5mbu47mBnz/TaWuMzRr5Uqmj24J4IMLx9znaWAkiGvic1EJGS
 mSmUDczrv8p2UksQDym2q7/iYn6LeRuWG7zy1PeHWnYcqxx/cE7VUZ22mrFsGBJsYImVg9QJt2g OT7AdZqor09naIA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX8m785/5FUt9N
 /TCs7OaL+/CHZh5lBYfTf52UIF9ehQ7hpgMclS6zheA7J73epb63SMr9Hm0askTuKOBOaOkY4IT
 OGKu+UZO+RfbiB2dWqh6ua/8JUVrls0=
X-Proofpoint-GUID: vVSieMAjYOPH3BObwXWjmz9lbX9mKolx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX7yiTIk+VZsek
 /73AH3cKV5rE0mU/52c5+b4MiYYrT86V5O/O6zRw2oiwaG42Ex3smq75uV3juUTrfIxqLNRbx7C
 Jdi9gPlKy0wPd3ldQVwVawqapxXm1nwjTlYZg+SF824umxp1mvrl9MXsVnxHLFnqM9/CLxYIwTk
 p1hzPrQMqo+Mg9YUqHlvvFD4jS1jPgq/zD1WQE8yrMRqrFyjBQ6wSgVjOBCWN0WBLMPcmylkvdO
 cZkoi0ez7RmS2+r6UwqGT5Z1LMyE4vealGsu7MA5bOK4vReDeTyAdGjNhL55GqQE1Q/50hWglyE
 m5zGLudoW94CDkYBKc27rXn4OLzCiBTHvXAYXsl9GhkuMJHThCvxyYYl6iv1c3G0Ezoth/FRBVs
 nlW47wncPFLr749UwP02lAI1QvhqFR+46K0cK2lAmv/8G//gwkz5fUK/CjnsXH/yB7i7jnEnnq5
 3aJIDSGA5GNihzlc1MA==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44f304 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=JpBZbutgEs8oaK1fuDwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vVSieMAjYOPH3BObwXWjmz9lbX9mKolx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115

reboot-mode schema allows arbitrary "mode-.* properties but only a
subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 979a377cb4ff..71d43d3602f7 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -79,6 +79,10 @@ allOf:
         reg-names:
           items:
             - const: pon
+      patternProperties:
+        # Negative look-ahead to disallow unsupported modes. The '$' has to be
+        # part of lookahead group to work, instead of trailing outside of ().
+        "^mode-(?!(bootloader$|recovery$))": false
     else:
       patternProperties:
         "^mode-.*$": false
-- 
2.53.0

