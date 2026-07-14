Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD40838F24D
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030558; cv=none; b=d7s28JPJb506I/eh2Ud+XXR3wK01UizqDi4SUtDVRcGl/reQ8gVed18DEZ4fQYpbxjptsRkL2n//HfPtAV92u5wb5tUM9Re8OZ71JID0dwaaD/mVD40RcaBH2jfF/lNIt+LqXIMrF0f936a5mDT8QLZIMEgd1fydxxf7pcs+BwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030558; c=relaxed/simple;
	bh=mT/J0p1jnX+6QgzShInZ//DKc6SSmtQWVaUr9yNBCa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DvB6Qna4LnCy5v8i0U9q3JWK8L0izZKM/+QswMhOMeC4VgQiu7OGuPyFNggK8TKI0NHXlfSrIn9+hK8n8dJAS6VPOWA5LxnBt3d/nn3AE2Cx4UqENM+nCkZmA4Lb9BMrnT7sqHeYCUMk+Sm5McY8r+Jit5qJtakX0ieACNTHfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGTXvnxz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NG0TyM32; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGTXvnxz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NG0TyM32"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBop5C263501
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ax64JMF/5Cw5Bh6xQ4LCelirXb5p1wD9gT9
	SFhvRP34=; b=aGTXvnxzp/94nMoX4LiO4gxc94wG3FxlGOugHAFXmNO08Thja62
	auVAWVIARCH367TWQunC9IexljHN3KaiCxUpdJthqacy7enPMWpIB/+iA6n5MuJt
	R8vHN1jH/7Ild+UJUyZ7KIH2fEe9yA4gnjKC+bBhmvOdzVKNsjXwF4MPb3H7lfsd
	DmJ3t1Psd1CtIOhHZh5L2NBsY+w2BoKfYN9h5ZoOYCFXbru9C5UJDwi/35Eqk0nM
	wFgxxusCZ4dscSt32lpEz8mkY/t+jdSLIlp5/6NxbCkr+eaZT+hYsiqDMH/n2/8/
	LeVKTj8PCIbRo24CkHuz8mZuN1GzxvCvnFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk017q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:02:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38869800848so6555382a91.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784030554; x=1784635354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ax64JMF/5Cw5Bh6xQ4LCelirXb5p1wD9gT9SFhvRP34=;
        b=NG0TyM32LnLGByxB3ntpYz2KS2Ur16DUzqGGVsxarCwa9cUW7LwdvlHws4zJX3cXpH
         rLsGtNFXCJf5b3HUX69GbOt0USlZREDeB2IKB7lB/MqaJbgBqTRInj7N/Y/9+VjOwowI
         iOqxVPcBP1csd2Ic0MOefbK4BKoEHnoMqpQNQPlBVlZmJq4FXo57O6d4HVx/E/REt/6P
         kZe/6QgzYUPHHT2KOfj34wsIJ52xpWKFok/bVf7GDhKj4qI+jdarX0kTIRPM5MBfopsM
         KFzhA2+LLJiQVv7oDL5vNcwvbiQrPVtK2kerAgwB73/CFUoQZROybF1B9BNiyE13P4bd
         h2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030554; x=1784635354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax64JMF/5Cw5Bh6xQ4LCelirXb5p1wD9gT9SFhvRP34=;
        b=n7fPCI66NAxRQoPnMZu+E5cIV77rQ5aImHhQE23gQLe+NSC+4eh7hDZ4G0BiaOXtn3
         lu0mx/XkanBVaMsfbe/m8T8ko4jG3N+CAOhlRnDt6rlz13ihgRbY+90tG3oTo8cMW/vQ
         Huqz3Fd9H8s7hFmTc8ROmRTzVVwNzqYX424XiDua67aSRE4GosZDttkURS/ZOucDyHQR
         ACV3jzfnSxne9V1JSxnpTLR9xb9PCDQJDvoZ5aZ8c73Gq0iWulw4kyE456oc2Y1tAx0F
         /VEZs/v0+91rBDvRfFZSqTZZ/2ho1az60Nycqp2xRt58kTbvghmfuxyITtgoyZRcbWvA
         S88w==
X-Forwarded-Encrypted: i=1; AHgh+RqNM4Y19doAEsiLp5BKU+oKwfWAAk/rVvR0kdmByNgIGuzAASrDGH56oAOykGdjbDY+nKE1K9cyw8tL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpkga5xTYr+vH+r/BLs+Aqs6nrOFVAOsvkb4cOcGG13JDFMyd7
	w7DLL+iQVn6iV9IoaYCr5bK7++K/XTCnWOQX3IA335Kf7r4ilf6EoJL7oree2R6F0DkP9JZ/a7Y
	BlDGCndKNbbNtGQiBfdsBmhBoi3HJF6I23dhtAPx+EMUU2H3jXwLGUiwq0HilalMi
X-Gm-Gg: AfdE7clIOB3sjfM7HaAsAstvFY+43YU3VefUJagXXxES/U0VM1CIFKTGuRpkv51FHBf
	XD91M8wdsNfu72t/pt99hQ8LvVnifFy5TeUQiHrfC3UScL80S8p8YD2yRkpR1kDQX1LuqE11u7j
	xlkLzcB43E08z4X9qxkCj7IB41sMAu7mPuQHpvdwxpWAjxO8BkyiCHGhCQA5oBXYOokTKtYPk0m
	2ytPeWqL1K1zOD94odhNiafnd+n6qK2FJdUGkhieOhkHi3tOyl3C2rQZCOvRt8WGeWmXQUxjUrK
	4GI2rSlZhkSEqKZPPkGrQimHGxRqTMLPMrBSougxfQxSl2KaSF5/fmo7MQnOu4XpyRHnaTqynrZ
	zlwNWiVgay1ffYpe+zgYjyzyo7xNfctBawZQzaMUeNtj47RIJoitsHD4zDHSfDMWbpfzYTY0=
X-Received: by 2002:a17:90b:4c46:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-38e1add8ad5mr2222600a91.5.1784030554166;
        Tue, 14 Jul 2026 05:02:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4c46:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-38e1add8ad5mr2222572a91.5.1784030553669;
        Tue, 14 Jul 2026 05:02:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119d5cf176sm54484812eec.12.2026.07.14.05.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:02:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] spi: dt-bindings: qcom,sa8255p-geni-spi: Add compatible for Nord SA8797P
Date: Tue, 14 Jul 2026 20:02:26 +0800
Message-ID: <20260714120226.1788391-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0RMdWEBBVdi_JTutmDOmDL833cv4buxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX/o9W35nu+CPN
 JwVuYA7vt2glZwQtgpMhUOGa4Xhl4ao5W1Jfyf3wviSpeH8u6SvQY65iKUrlPcFPqGBwQDZScNC
 XSqB+S+o85lIe5qyQh64y1WSTlnDLdG4+Iuw7+sUJBXnkR81PU+p1j8p3NGGjA500pEjEtR3HEi
 6TLuJHOKC3KZ/ZRqvP0K2r6jKUrb1pXJM5qQCVqjIk8t7MGaRh/8jotck59egxip5hrnKiAF41i
 6TxHyVaGuGjo+m5A0y2RsjpCu4ORICvnp+qSbo2uXH5nALQulNSe2wQGmWCeAsdp91DuvQGUuIZ
 hXWUW0yA1EWPCXFcxZRW+bkZ6dh2p0ry5Eo2Q8LaFqnC02+dmDV/vNGxtv5RuRfQXIbhgbZ6yvS
 lu4CxGqm3qckwIRCbPZFFg0xA77F6CnsOygvi1DcGnIle0F0+K/eqrvoTGkJhak4CZP1B0W/qw7
 VYt+5XhpBverN6XKUnw==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a56255a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZkAwGN3o1dXtv08uZcAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 0RMdWEBBVdi_JTutmDOmDL833cv4buxw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyNCBTYWx0ZWRfX/mFWx4OVLEZ+
 gJkf3lLHxr7qYyGHEkV5py0Mbwegaj2YRFtptGiyHfVoxBNmTgUyuzA8j7mHc5872+ITjIIWuzj
 IA5nHyB2B2DhOKAoTnDm0v9H0IgFmOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140124

Document Nord SA8797P QUP GENI SPI controller, which is compatible with
SA8255P controller.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
index d9347d780ca4..6552303a4f52 100644
--- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -11,7 +11,11 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-spi
+    oneOf:
+      - const: qcom,sa8255p-geni-spi
+      - items:
+          - const: qcom,sa8797p-geni-spi
+          - const: qcom,sa8255p-geni-spi
 
   reg:
     maxItems: 1
-- 
2.43.0

