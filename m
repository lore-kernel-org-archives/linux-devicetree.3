Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CDD3AFB07
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333160; cv=none; b=UB6RNSBIMiPdWsXBjU2nR57QOnGRRZw+ZYribPM3maUXYqdbrgd3t+HaT4CzcGdQt4uf+wb45qW2etWbeiXBqnKS4g1CyNPusg8PZAVMwZ5VCo2VGOEWP0d051iqYrVDqZHK6EWZjglTUR32y3UCLqvHF86ruYhTSVfYaGx4qLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333160; c=relaxed/simple;
	bh=FUunSn4h7qcsn113mXPnRr+NynLeoug0Qg8JYmat3d4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McaB72ISLwgYHwjjuC/XInZ+QsedMSIbL7xjyy7EubrWK5HI3THNgURb5Gh/x97dZSKbYLYc15J4Q0ZiL+w3FVzB0DnYOo+RjK5lVWCc/tITURb3278Zg9iMK0nNOngclU3CuPYoh56tq6sB0/rbpy0QBGadNaH0Ti5tKI+uiz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9+tGz4G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=diIwppeT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9+tGz4G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="diIwppeT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xOo4108111
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=n7qX95NRuaRNqUfvFW+XlrpAUob/emahvnk
	plI5JjHk=; b=n9+tGz4G/wxeD0Q2Wb8nAJSNE0cr2XXICClwKLUevYZ3niRPThv
	LIo4MTRHH55zS6jRUDHzpS5kZ7ll69oT0837YlozttKRHXOEMvFsWP81oh5R4WKu
	MRoGNj1JycW/5h7fHU07m2Rc/QuVaj0w/qWHagHR0DQpcOK7TlO+zr5uebBPtt8o
	7SJZQilFcAbaWBjky/hn3taTFB0jm4p/QgKT85NJ30WsSN9f27dsPC7O0W3ehmH6
	yHRbO2c7xUtIfJRX3RpuRPDt47okAB6HULcEb1P1aYy/X842NU2k2zhCUtExkyO4
	9LfKaud/xLpK/PfXZhFyTTo8Uhgranlx2Ag==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrrdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ec45d9628aso68658436d6.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333158; x=1783937958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7qX95NRuaRNqUfvFW+XlrpAUob/emahvnkplI5JjHk=;
        b=diIwppeTLd0O88zEVMk60z7A1+kysfbCEN+/KFkM4/6F2ZCDOuXqC7vZKTpNXVIO/X
         RVSbAIkLlH0lOURuPI8sjYNFGwHg8NtkGQop+nXcq3bMnHk4iu+mo7sS9azOf9fafjeI
         3rGWQqfxQuTeBPaB1uBWBSJIdy0o/0eRQ11AUuVYTRyC8CXWW0BT8ablVnP/ImIN2CZ9
         DhLkzADC9gO3LLqbiNcKKxyJ12kHTCrmNZNzZA9j29vAQyLXr0pe3gU7uWQI1Tf6iOXr
         d0SLgZs3lVQJqs4hacZpLHBclCoonOgZEC8o1nucFkdotGA1oTOannoPV/r4EkCGoSv6
         HFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333158; x=1783937958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7qX95NRuaRNqUfvFW+XlrpAUob/emahvnkplI5JjHk=;
        b=K3QggorYAlBeoH/N3Cvf0r5cEbNTaentQXMDuLubajt+FL1HRVWWC4o1bxGYDyveEx
         e8M7L1RvaJ0NLVoIt/jgLRjGstAsWItHi4lTCvY/uM+9nlZKEihSPgAG/hYO2xLzFEA9
         Pp82LqNOh4nDdbnNCjObOGqpkWUZ6tFM30s2ujihRjQ49KS6zy8+xxnBy2Ar+fHS2zU9
         QfFvlEv/k3fexX/U7G+LYtKWk6OMrQBlQ/r2w2om03Bdj6+7BzCh4uOBjik31NNpYjLA
         iaFjSFHyHf1JZyo1AX7RBO1WAzdKKuJRS7/Q4M0J3RxgLroGJ4eYBN9WA+lbeXXWGhMR
         eYvw==
X-Forwarded-Encrypted: i=1; AHgh+RqauVRoboLDo6wb4dtMltSA0VWStsLF7HaEwAC4yCiw/mrTozxtQLkxs21/rvkwGZmVzaYxFXakTLCy@vger.kernel.org
X-Gm-Message-State: AOJu0YxSIA474+X87cM50d4i9TxEKZp6zgXmb332Z42/g2R/xOhmp0rl
	demJSDi0kFbRnIgAcuuVJp4D3Op82Yv1mlp23ByUx1blXrJD/V0qI/i5mpgBPESlZ0fPkkcK1mp
	rvpTYcbwwkXOTnMnsL+Mfp8TlfJ9MpjQl3YZ+m8KajYxKgYS6tiGta1kvVfvg5BKl
X-Gm-Gg: AfdE7cl9wImTzLt8PNIVK7N6K7Vam0sKmlpRrUDszWywTpifwy7jrgzPQRjnspsvGUW
	ND2uVN4JQn7DfS9zRC3ULKtPms6HbtVF9ikXJ4EMgqVpF4gIXoxSeOO0uGZ/9IV/wCKMah0We17
	+j06qeO+rMb/uTsTiwR59N5n0Kukf7M4GBMJmSSC2zvzo2PHJLCQB9xSkEEdYwXCsKtX0KxUPOJ
	9kw9vN91Hdpb5VhEMIrlp5qJkQJtAEBTHIY5u0i5McFJOko8xI8HFp6nA3qmk5MlL1mnDPUxf9G
	8Glg+e5ovaPeOM+WsYPheWpJia6tsTTopiTqliskfmOLu2VVq4kKnr5mL+impi7gNPHGznKwh5b
	wKTdf5afPFHkYdasjyJxfVsK45ho=
X-Received: by 2002:a05:620a:410a:b0:92b:6805:9178 with SMTP id af79cd13be357-92e9a4afd31mr1261534285a.64.1783333158260;
        Mon, 06 Jul 2026 03:19:18 -0700 (PDT)
X-Received: by 2002:a05:620a:410a:b0:92b:6805:9178 with SMTP id af79cd13be357-92e9a4afd31mr1261531685a.64.1783333157786;
        Mon, 06 Jul 2026 03:19:17 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm24356224f8f.21.2026.07.06.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: intel: arria10: Correct indentation
Date: Mon,  6 Jul 2026 12:19:14 +0200
Message-ID: <20260706101913.341540-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FUunSn4h7qcsn113mXPnRr+NynLeoug0Qg8JYmat3d4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EhaHTK7EwS2biLN2SbuhdB0y9MuQriRoBRB
 xouJnhpJW6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBIQAKCRDBN2bmhouD
 16DBEACRGp8qeji9e8u8UTTeGU9EJDn1dGDgkm1/NPYAj4MJJLuiUXzx3tM4GN+r0VKvpIQgAOE
 DUcnQhew/TMLX1ZOV+xByl+/vXX+vdmb9fm46mom8nhdeZUGAAZ64SMwm6zT2IWkHhHxRXCQcEg
 fJiGo3VqTVv2fATffXNAdUXoxs6jRk0INlausbez+gIm+PFQFetQBE8sYFAZ27OCMkZlK4QE6Qm
 Gq0/2YcOrTh55HZQ7bxa23nDw3r+ZL/zL5vmj/8MrpmLD3qa9MgWW5j7DEYs646q5HzgaYdJaCN
 U1DQzchl6Zp/WApq8usPa67GAGi7MMRq6NXMX/h/6s5fvfV6EoaPJFI6Tar0UAI98249mBDsA3E
 Kkxt0qi1rG+VjhRKDIFWgtnzxOIAGmXDTBBGVx6jRiAeAnvQbxgJaskRYCfg7FjEURWfX5hh93h
 PDX2r+txHtyvjfftHTBxwX7StD1lQdEeCMg6tTZewXno2dA68Z4ohPM3pROt9AzUA82W7s3JCe1
 GEbztI50jErzF5/6oiK1P5H1gZygT11ZbtvI6ibti8UZ1wkZtl36bsmBi/jcXbrsXZwA+h905sB
 c6FAw139tifazMP/TA9l9rDr4vfGUca4CLqWl83kVidStl9rIvtLeJ3jW2L9HmS2+AQS74MSelK ZMK/E3uaW0JSt6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cX6JAHD2sKSYZ7iHYOXWpXVaKl2vvVk4
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b8127 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX+cUJBNRiR/y1
 XTKg3rsslkZZQezdthBkC7hOL0XoPWO138Egu/VtEkpR1fTpDh4l4fDDlhHIcf2OpFsKQv763vC
 h9V83MaEBQqLrb5JmOCD4ZecKW9bOIo=
X-Proofpoint-GUID: cX6JAHD2sKSYZ7iHYOXWpXVaKl2vvVk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX1H8yceCCUBkY
 5WUnif1vdobVYw93WZuCGsiD+2fG8uPa99rkDMA/s6SKYwhz9HqktKGBRVkPt1FbU2i1OOfgrN1
 uGP+9+qxn2xIgtNZSkxTJkm6oDFLhp9u2eE/NM2/YZR68vnyuQ6sAW6unCFH9QP32MIQKavczT/
 eN14B9nvz9lQgHfOIuiz1Mz8qnZ5D/I3UAv7bHAV4BOD5cNFQpUEg29F/qMfx1hEBRi/rj1m2ZI
 RxyOCM0V1VJz1eEg5WNzaGdk9ZjCOGW5TH4Y+9tFJmgVM4xkg1qzcjxvARGGKduku1Yj9zOKtXs
 hRYM5rVh+6AFQU4XPUb6ZlDKMj4bg0KswLp25rgIs9hPe6gYRuV8ywXEzxJAz61rqsCK1e1j1Ax
 Fkq3dozxUu66oYRLVvV+UfsZfp7dUPprYNDIJi3Jw/+sszVds4z3qCamebMsJAmBWSOfOh/tRzw
 uLsSQkbvxRUiYNjABVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
index ba4c0ca89788..3c684f1278bf 100644
--- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi
@@ -447,7 +447,7 @@ gmac0: ethernet@ff800000 {
 		gmac1: ethernet@ff802000 {
 			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.72a", "snps,dwmac";
 			altr,sysmgr-syscon = <&sysmgr 0x48 8>;
-		        reg = <0xff802000 0x2000>;
+			reg = <0xff802000 0x2000>;
 			interrupts = <0 93 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
 			/* Filled in by bootloader */
-- 
2.53.0

