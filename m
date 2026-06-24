Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418B388E7A
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282854; cv=none; b=suq9l/nNrxalfBi3h7XuaET27cUBNd5/6gXHcfQ6UD0JztKTiPCxxdxWVnovtQ066dmBxKaa8YHqu9fATi5I/LCf9NIDiCm2QawpUWQbNCApCoFVvFV5ttS1WZsIVroVROlNSPfVV9G+jShehQ6WIt2rCFEFeSZGak5z8T9uNcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282854; c=relaxed/simple;
	bh=ECfYm4OBroVPGppyAC14goy1FmHUOLrCUxHGSjL7B9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G9Tr4HBnBC458ulgB6xSNcTCng2QD0Hs/enfAkUKogu9OESB6+34QBUYpvHao+KTBpSNJToeAoQe06AllZyBsHs7+RUsGkG2+jx09k03qeaKY25UzHkSUpXdjlmTqmqpk6UhHhRCbCgPFzS8qc4PmWN6uI9+ml56eXnevpBqdiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0JTXwUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a0lriqzW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0JTXwUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a0lriqzW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5twqA1892324
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OTP+0T9y0sz1+pGHHr/b7x
	JoUAUXe2832Zv3s8NI/yY=; b=G0JTXwUEAdY4GufzKoj3739ghFf43Ms6GqsrtY
	3CwsFPWiHlM/iFLYWb+qPfnmuqsNqVBzDqyD86om+F9Xs8pkLAnNoaeoqWBZsEQg
	+20veF4524eJvKgORpI87bCR0yPEiC6y9BE4rM0HeSqVdxgVNQ9UjBCswzTlmtHK
	bV2c+TQ6CgrfUAABHZ2akOaZ5bWr5nCWWKIRz57hfhhTp2szPbJHYvywCtDFGhyp
	+bOJdnyFlMqXDtVI7yO3dzWl4Hgdh/01Kmkx/V528ghM85WhOipo8t/wig8zNLWe
	VGPS6yP7lT2Wy0s/wBAsp1sW63dSR6mRbMtpHsKbfdOtynZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bf8v7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 06:34:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a997c400so12193375ad.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782282851; x=1782887651; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTP+0T9y0sz1+pGHHr/b7xJoUAUXe2832Zv3s8NI/yY=;
        b=a0lriqzWtE7w/0BPZzhfxylPtpR6vOhjvLCawCL8igaIwtZHFvE1orZUN3pIKdzKMb
         ybc3Pr2DzTzZy2rPzGUKdV8/4l3tk3/MFyB+Jm9IaevjEQEUYtQT3Ef1omqk84wLc3ce
         LIR5SXvcDkd0letrmTgBspyLRrCiX1sNyoYIJ96BNPjxPc2XD5528/+DopLzvCyHIcE4
         TZNU0LbYXsKbPe7WLoTkPCZElPGjM0Pa6UZwcdRK/LopiMq4E7h8ZpPt33YpJDI6REfd
         zq89wQAbRBaUTQIPUhLHTFqFB/47ztYrU/wnsSYAwfc27U4fXnOwzp5PDpH9k67CVXFb
         hWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282851; x=1782887651;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTP+0T9y0sz1+pGHHr/b7xJoUAUXe2832Zv3s8NI/yY=;
        b=U/GI6gJIryRVe0pN67gl/lIXlKyXbu9CKOCXCAhf1cSHLDkwZ6Hsohi3EZFHRC0KsZ
         PH7XzL4iguSYmjujtFS93Rdi/LBru4KAzsTI9lQJPGuRKH+x+ZXuTHYIXRbm8gz6pXsu
         9anBhgEN4BTol839pGAFPWlc4tcsR8rPi39MZMhu3uOzHX274jNhOZe2YP81GMFVGeVX
         RaDGR0To6nAHiNUYHpnB4NF/WnAlxl0cn3UYiKYzYX/tJectnKu2RhtLOAaq0crdPYVL
         MZcZOkojvbwcSL9bVxjc506rdpAzFo9Pn28SwrLk2s5+DFHZaYNmhiZzParpug0Vm5Mv
         IwCA==
X-Forwarded-Encrypted: i=1; AHgh+Rri7dg1OhX4xt7j4gBR9Pepc1cnN+R5JMLa0dcUI1QJMS/uF7gze6QoO7U1+UF08ZtU7VkTLGtBCKCe@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiebkoTlqTMyV92Nf4WrYCAPW7iFXBltdP1mT/qYuAFflS55I
	1FKqEAkDzy7E6FAGkm/bMD3vsFPbCBZGSXh8GGJLvGxNr+6/PPfd00gICaGasCl6juJmUGhHLGe
	46qGgOHijKwaWymtUEzbRYJZMFpVecrENkEDetV+AmXElbeUf5zdgrSa4EPsM6J5l
X-Gm-Gg: AfdE7ckNI+9hA5hRolT5qUdJ9iNqCoLio4AkSE+witaNmXWOTEJkaRjD+2KAse2PDqC
	yDks4F00OjUrbWxPf9Hocxt/bSC2ugHg2EcgK4gv4onlTS6GLltjfynwR4oYymeSbGn+o9JRc5v
	AEAB3v3bGmhhhUxjMzg9cdCay1s/UuYCgxwZlY7iLVnFoIv2bLKna8Ym+13cMaP/qltCmm5cX63
	MfHZqFODdGrPvaBcARfbHbITnnuaePDIV0fZsgfXWj6aa0w4aH9pwBGb6fBy3QaNofybn04hEmV
	haYKH01qZ4YJx0DQBu2YDg+jDN8Cw1oOIQPo3zNpB4YhlqcETL45V020PCRZL/2wNreDIeRaZgW
	S2dpaQ2oWLs8NPDsPla7IyvH1Eap9Gv4j3iD5Re7aqlFL6JIAPXBWV2X8qmTmwbZzfrCnuXlYcQ
	==
X-Received: by 2002:a17:902:f691:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c7c3ece1a7mr56041415ad.14.1782282851481;
        Tue, 23 Jun 2026 23:34:11 -0700 (PDT)
X-Received: by 2002:a17:902:f691:b0:2bf:2398:6009 with SMTP id d9443c01a7336-2c7c3ece1a7mr56041255ad.14.1782282851018;
        Tue, 23 Jun 2026 23:34:11 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f86d0sm118225895ad.40.2026.06.23.23.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:34:10 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:33:47 +0800
Subject: [PATCH] arm64: dts: qcom: kaanapali: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-fix-tracenoc-probe-issue-v1-1-bcc785198fc5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEt6O2oC/x2MQQqDQAwAvyI5N6BhWWy/Ujxsd6PNZVcSLYL49
 waPAzNzgrEKG7y6E5R/YtKqw/DoIH9TXRilOAP1FPtIAWc5cNOUubaMq7aPG2Y7Y46BniXRWOY
 Anq/K7t7r93RdfwnuuMdqAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782282847; l=1132;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ECfYm4OBroVPGppyAC14goy1FmHUOLrCUxHGSjL7B9U=;
 b=1Zn8k3q4T63+C0hDEhEV0fqbQxINcGFwKWcnILGx+P2hYOFU6a6RcjsMuCn72elMC4DIjuhb1
 xQ/NtQhPVG2ChLGq2Ymze8YSutN30px2+wA2SSuFK1kdRPFuvlNqv/x
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3b7a64 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3HRjqqACalWvbh3tpegA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mCwzcj3jFtThd8MaGx68FnASXezUZe3h
X-Proofpoint-ORIG-GUID: mCwzcj3jFtThd8MaGx68FnASXezUZe3h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1MiBTYWx0ZWRfXwfTbqlU5oZi0
 yJ+dq7Q9j4CWCVMaexrAH+tL1uxPmSF2mbd6vK/DiNLDiFjNDcGrk8cnKG7j4cUD+eqPElNzcbL
 mTdnSNnTb4OPXrPCizNJ2Goe9mj4exs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1MiBTYWx0ZWRfX8ObPDWHghzSL
 bVaWrhEsv0Qtn0+g69zG3AmoA26TmpQiYHrSL+mGQzv39OWbIPfjSNIE5AUV4ldN3k0Aotxuwv1
 l9iSWpXm0zSp2PvLGIwDUawoPDdvJ1LauPZ/GzG8mFNISPPapEQ3aSnvO9lZ8jtcrXwVRrieyyU
 Dfn3J1TJR64jxQKxdbFs1fI3A0D1C/GRQnvWebWtIv8h1DsNsFtaJyDpP+VJlWrN9+pX5KgNV28
 NnyMc2lzKFJDQvIBCgiw6K+3lGtACsmCGtghPOsBSEESRQh8Cupt8JXHQHhKgFrclE7J2Ej1DNn
 QURALoc2KlDHPvGAuk80Kq8OFMufOtk0v+Bui43YgXtwc1cdlyBmyGErJvZtAkzHh6zySpSGf7D
 VHELfMg1/9ae99xkv0yZPmgcAdCj6cewuROOgCZQyTvo85U+4Wf6vOlotyyA72jHhPZsGRUdCmE
 LsNg1/XjE307hNUOzJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240052

Fix probing of the traceNoC device by switching from the AMBA bus to
the platform itnoc driver.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..84561b5faf81 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5003,12 +5003,12 @@ tpdm_pcie_rscc_out: endpoint {
 			};
 		};
 
-		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+		itnoc@111b8000 {
+			compatible = "qcom,coresight-itnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
+			clock-names = "apb";
 
 			in-ports {
 				#address-cells = <1>;

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260624-fix-tracenoc-probe-issue-c6429da28df4

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>

