Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2EF404BFD
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903538; cv=none; b=rT1A5s9QRwoitKGEp+k5tkQy4bdmHSSWdR/wg/0G9L67S7gJKv6lLjy87skk+I/wNSHNonMep0yNCexu2Qec7nhUV741c3BLE1A7aGcekx+VqroCwDJ/MZtuJ2EvBtCXHWSc0k479hj7Af87D1J6SNQjj2FTA60smd1z8B+Qo0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903538; c=relaxed/simple;
	bh=nlgozW7Dobb2ylNe8MBLOd3H8mDshCodNwiOydcFYJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lyE1Af3f1FCoKabPl6jukpjbVPxcYmdyK+1yfneWBFT+Gl2CEKqeGJr9OO8qP7Qz9+dhqeykf0QDvyr4T7JhFcDblr4gNi/Hw+6MBeEyNItF3YwPHam/qk7mWhp++GiccpdIqf0quTgcdQoDSjHr6Vh4pK6WTmWKGRPiKYf1P6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MazSSan1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrD0VMYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MazSSan1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrD0VMYe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8r2u763047
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NoB+JvcT8HDMjNFxuGeWyu1B07bjfVTBwV1
	4/TaNUmY=; b=MazSSan1rG2SE9ANLk6d1pDCFKtI37lHFeOoIdGhKXVSlgMIfqP
	qdQ61+JcdxG+v04KdUOQ1lXp32XK1lcwlf3w+06YqsS7uc5Up2rtSGtt1NEKkIRa
	PZyOrY36wiayvS90MsBvqqvqX/BTRPMWo9EC8jQs2KbFy6oOHZn3mqKzippxcTFC
	GWqnmUUlezynm5lJd/47jTfmxiQrCvAIvn2goUDmRdWZ+91oCowIBdVah6nYnzAN
	FkRdlR4P1AuH57B/9oxF65RFtvlePIHGP8pvZDQSssecwCTJ/r2NgyKEYV2XTEsQ
	ECCcYA1Cw9R3ClOXaMNSfpOewZxkfGbxGGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktbrnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 10:58:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92b4b575561so65677285a.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903536; x=1783508336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoB+JvcT8HDMjNFxuGeWyu1B07bjfVTBwV14/TaNUmY=;
        b=jrD0VMYe+D0yER9mNciITBsry8X1DllUKkRbnnb9LW5iHkuTao0aFvxmbIhDIpTR/7
         Ki9O4dK6rjxuFId209dUYfGRExUf5g4C298MUaCPCmLKmdRsWQKoh+vmjOgeL/IWIOWR
         BFKXJC5D5PtszxbjZImIBRbwZ9qNFQcNBAaR05lLkOwh8DibOBPm2MgqakEa8Jlye7Bu
         /bRllkxUjoq22jwb4q/7KokQgvrhXn0zz9DRw5V7h688AOcTjhcZvqLh4UOUh8cnxUqc
         aNN5YXAJbrS2GeXZ9bY/BdJ9mIUy2hhhxSp9Sk4FB0NcKTcEgRh3tZHgMYGuHe7HdtnA
         nhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903536; x=1783508336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoB+JvcT8HDMjNFxuGeWyu1B07bjfVTBwV14/TaNUmY=;
        b=ibrimIRlHwm8r1w5aTqXe01ox1kkuSlltlhL17rxtZWVtxcjTXBAIt8xNV36UhY0NN
         DKePLYMr2yH+9XEZhdjcEAJOunHAzQUMl+skONNIrjhkUhp/ZYgMzNUEXIh2qYBf+XGb
         V4r2Ma05QReevtSXVGaPQqPeaS7Y95GYrwpxNPZK92sQWgoVF4yU4Z8H2t368WiF8Rwr
         jbVcZ4SFjO8xiks2Kf0ZlqsUxxRg1O+otUt01VcKaSYAtUlgLhZdmDZKF0w1khnNX0va
         IwsLCQBmzDoX5GcBYNmjYuxYO1bmIO3s/Sxyfmw1vF/lEmtIZHjxmObYbGWnpHi394Eb
         60fg==
X-Forwarded-Encrypted: i=1; AFNElJ/SNgr7WUOP8dLz6l3B7v/CIm9MF+RSAU/dDi9q1ppuqabE4V3IamzAJXFN922bTb8IrfW+VfmQPIg+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnz9Arna7BYf09oz6MVchiP9iX98rCVIYukA0Lhj6FIWLrwAny
	AAP99IBjbUB5p9B96F3k9PH2TZx1tJ+Vt3JibsM/ZbcgG9aMA3KRIHlOkDfnzdVSTQh6RVc+1F6
	rJKI0uDsDJN4V5Jd4NB13p3IUWoQDHodKFujiqDWetOgGGq27OBkQal+hqMUxPGxc
X-Gm-Gg: AfdE7cm9eRzedi5HaiyvmPup/tbB/X0e3ZQahDDMM4bKpNydUS1Sj/Pk6CZLvunz/v3
	brS2wPnehBYsfRqbbnm9nxZDdd/11s6JrJeuDU2ewBuwWSTSl2sVxIUCJrSpodYfbO4b/rV/TWO
	CXy4RPKSsjxWZaCfeqhLTCme5TLVIH1lpx9HCWy9Z6TybqDWsIb9WCCggO5SuEa9w3Sf0+WRm2r
	xcoFo5sR4yUwaQi1tv/EGqsqQpVpBvxViuFInRbb0cUyoOcCaI1wB8r753DdjXy8OTOeI1gKLm/
	HCSOE3GjoJQSBJHi7z4ogNF2zqyr+/T9uvQbrj/z+4r6LQIm4MUiiPqGvSNsEyyBavBPs/kuKyi
	uUFl8BVzrootv9WVxf159uX3OKhg=
X-Received: by 2002:a05:620a:4413:b0:910:c1ba:91d3 with SMTP id af79cd13be357-92e69867895mr690844085a.45.1782903535689;
        Wed, 01 Jul 2026 03:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4413:b0:910:c1ba:91d3 with SMTP id af79cd13be357-92e69867895mr690841285a.45.1782903535300;
        Wed, 01 Jul 2026 03:58:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c0e92687sm33275565e9.0.2026.07.01.03.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:58:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: rockchip: pmu: Narrow definition of reboot-mode
Date: Wed,  1 Jul 2026 12:58:50 +0200
Message-ID: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nlgozW7Dobb2ylNe8MBLOd3H8mDshCodNwiOydcFYJs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRPLpKzd8WLvvgIW5ycKME27CSjTwQ21dq6SZ+
 CjuRzJhJViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakTy6QAKCRDBN2bmhouD
 18zMD/0UC4obuG+GdQYwkzbI8qls0oHKONIO5UWSmI/IpEo1OOw+aWws+GzrtHLcuuuz7MEP615
 SJLX+jG976kQYODYQ/Cp3pFWrgCgXdqZ453qsxZ2S9jBFyevAihu5h8FfndQ6fu7Mw2sHJynVu4
 aY1BqYJXEymVe0FoCwB4CaaaIDladP/Mu9ihywK31bwkfaejVf1a7+tHdGOiJY7mYvT3SZlXYyF
 9/bAosYbr1Qfcj2GdvQdtwSYAba717afLVX5Y/MOz0aovsclxwebDKeOrt3Gw7L66cv8JEe+jB5
 QHevVkC2UMrOogVWeDIvC6GZLCRiSyQZF4owIk/kny/SrbdOLYCCtPnwEPo1hj8zLoLb8fNH8Mx
 UAhhqejRIrzNaUUPKi1hmargx6zWxnfIoiCn17s7ubfj7gICc6zgqirdN8JXMrFhsahABw0WrW5
 CKbZbdOEK6snD+0e1zyg40CfQX2rUuZvvNwlLCcVm1Zgqiw4T/BsxIyCFofNdQrnRr9rPmrafr4
 9hZCcUa2rcTIxflKyYn20r4tuGK9m95k5IP3ql3tXBSmKUSuvG6Md/LrwtuWPaD+LooyRVjPJnA
 v2KTlms4EDvQvIAXrPp143OG2tIrWC7TxsSKPsuJcg0DikLMkU+Jvc728ROCn7VjX90K09rF+Be snEbpDWFWE4N8vA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX8vyWhkdcqo1y
 EDxphRLaZJhD/gYIOI6vEyIx5IOlFic4mQl7e5k778cJbuJZ4qWnuh4QxNDOTyUMDCyRKXPcnIZ
 V6OA/ZeWpq7VM67Y53otb7+TC+dqmBE=
X-Proofpoint-GUID: KA1dyVSh3a68E57hRo44dE2OKHehHQJ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfXzI8KasQNK6Yw
 nS4ldM2AkSv0FhxJJo3IK+lw+hyFkx/dxFb4HcNGSYadZkLEiekuYlFkDWLUz3nFWArNFP4EE53
 EnbROvIcd7yEH2wN2RF7LvSK6nd4aC0ffLYa/6QvekSlOAcS3CdXSGofTZUxxtPkgVwxoXAzgwJ
 prT7z5GsRV7J3RHkAEsRdLzAFUdWlUDmf7csSB8lRqJT6lWjGxZYfhoJNjS0MWHvA6XdwxzT54N
 5rPu9OjN0ClTBJgyO56UjTp7WG5zDRv0GyBiHBVDEkL86l4Vj4xVgzL1tEyjqpDIa4Pb8JDP6JV
 5Bijhw/6YBknDwinPh551+sFYdZ/T9y0LcMfGput8XEYjxYD/IQg/QByKCv2DYFrV/lYZwOmGpJ
 EAWmoC4AdeYWu9IBBIuBgT6Oq+UPWo1n/HwwfvS9x/tDGE+dGh+sTihPSZaPBWUnG+G31PSvZzi
 5mCZnj7edrzdxNW7qqQ==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44f2f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uYWl5qKCkACiJsL7rIEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KA1dyVSh3a68E57hRo44dE2OKHehHQJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115

The 'reboot-mode' child of PMU node must be a syscon-reboot-mode one, so
add missing $ref to enforce the validation and disallow other
reboot-mode handlers.
Defining 'type: object' is on the other hand not necessary when other
schema is referenced.

This can be further restricted to match hardware/firmware:
syscon-reboot-mode schema allows arbitrary "mode-.* properties but only
a subset actually makes sense and is valid.  Provide negative look-ahead
pattern to disallow any modes not supported by the device, which
tightens the binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 55b2200d6e75..1cff2328cd01 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -61,7 +61,13 @@ properties:
     type: object
 
   reboot-mode:
-    type: object
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml
+    unevaluatedProperties: false
+
+    patternProperties:
+      # Negative look-ahead to disallow unsupported modes. The '$' has to be
+      # part of lookahead group to work, instead of trailing outside of ().
+      "^mode-(?!(bootloader$|loader$|normal$|recovery$))": false
 
 required:
   - compatible
-- 
2.53.0

