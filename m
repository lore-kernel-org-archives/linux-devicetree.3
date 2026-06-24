Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132033F590
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328169; cv=none; b=ozVT4LjLQBmj21wew3NDBmSw188Jz5STVsgRef1kKQmmvRqKLm8rM9sTJ+hyj38oes64UO6Kd81fjMhzgZNYTp260lGozXnq1ixY752M5ks51Nb5Xz71eRDKzLsJ2zqhK6Eyk03iSGdAynM5KjkZSS6Bjq5t+k1RUlmFrvLZ6bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328169; c=relaxed/simple;
	bh=4f+qGkxRsumUqnSkpteMpYewNd4yzghtSUQz0p3GOL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJu3YR2eMBJfpSVYQhBiQB848uIBJtalTx7UN1DZqwj39hlRdiCzBcbxptoHdMT/NWwyjM//3LoGNvqEcpqFamb4NqcMSHOj8hy/AMoFZ7VYQx1FtPwEOk79x3nhwsdAxY7vjX1UHk1AfzACkWzGuGjhCxVt7AFexOMivyLk+Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEIDBNRy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTHhrpSR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEIDBNRy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTHhrpSR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OHj2nb3860986
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEKPMFSxKzn
	e3dSoiYbwXbjYLathd3+o0b7S0zXbr3g=; b=NEIDBNRywG0cE62VqFxb8rlNkMU
	i+cEF1RsOab7VqkWP3DH07yx/t3eFDEXAMWZWCuWUVwxue4hUApFlErHyUnerZhU
	k6ZJBq3HZ88F7r0kaoEiLgUX8Wc6+E1fhZw08l2pXnrG1C9pQ5nwqCj4zfKnZPgG
	ZlXjimvLARpmuGeoM4FB9hUtv/j/FBi8m8X1LgwzOMUF7U6MO5yVK0xqot+9Hh8z
	2r9Rj+P+9giutJiV4cec+h83kbEcut9Q/RSIeLwHAvmH6lif+DFUcxw5ZRDkgLqC
	VwJNgQsZSscNhOcB/ajw0lfHF49Ae3CkIrx5PXGCQ7hhvs7HxdJSST8exew==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq2sta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:09:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84540760dc9so1944807b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782328166; x=1782932966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEKPMFSxKzne3dSoiYbwXbjYLathd3+o0b7S0zXbr3g=;
        b=iTHhrpSRfiGISJQHF5WX8Irm92K454RVC5phG6Tjvd/q2xlEieUjpCE4WMs1A6Av6e
         MI7XGJ+DEAMw26QOMXjlaW53H8yT1Y0PU+CFninZA/ck9q9zg8flyYqsozzQadigjdzZ
         CtTw540OrNa/qS66w21j721X7yW6Kec8jk72bqN6xN+B7sJuPu5vdIAS3Ag0fXLBLlGa
         f3mVg6Owa12fSPj0HOicdjC9aJcof5Bdr1BUWRP+J2vDuuLVD65Xf8HVNbtLMyh7EHNa
         DZZNy1YH+GehqJqAkKgAuNTTqwAQHGaRCaKIZpOzEkBcHP1P2Ww9wia54YW+BjXrvu4S
         5Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782328166; x=1782932966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEKPMFSxKzne3dSoiYbwXbjYLathd3+o0b7S0zXbr3g=;
        b=D4R3s/O+g/XnTvelZFKNHq7vrP3TFITDTrcpSgJuWW3Q9eoivOMpIqJyISUow7aIZI
         a/hEs/6bJiBD9P2H5DxeOGkhkqiSwfmCNaqqQd0b7AqqeEaI+SeyaT8HqikgDcyeNxTb
         +KSK28PiyuvLnVADR5dB3/zTGnVboMd4Znpz5Vrzo+PmboucIeXysBxRqhO035yY1wW+
         8xwr9ufk4xGV5WmoI4KGUn8vsMqVmPEDv04y6Na6KifBnrRBOGAKTOqbq+Dcc0GTDzT+
         4NylQhnbVIIrShALlqqTeZxNDoS656qqN5o0oVXtC4HvEEfVqcKcfdmSqW/CvHflZ6mC
         lh5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpIBBbajzwodytsGezgORMiqSOGv7FBYfhwjznjmeMxmlDyF2D4oIBYXF1wnCfJFLk+bhsh1qS5UCdD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp437EpgqGXsoSKti03K/cgN9HJ7Tj+3Ta3/V08Inzpo+0/a3e
	jTmtWHD8PrOv8OiodAeP1/4VAx7x8dIc84/lUNznPiWOz6pwWBo7Y8W4WNU3ZH1OsRH0bQDBuK1
	FaHA6DBaAZgDVW9XR6ZaTzfpaxXQeSpP/Z2Cz7Q0yKhDisJwoLY1cU5MMzUttvosB
X-Gm-Gg: AfdE7cnpdFdWfI4rNAYXaO/X6XCkubg2vYtKhcHhnmZaG4QLc8C1OLHjghLa7AGCdB4
	3ICl1e/dqpgKPry6kyFNxICxu0EQVIPjQUDR5M04CDfUXyohzQ0PJ8n1QSAaHOF6Jb0e9NOqn5U
	rlcB2O8GcxlUbbmJOPXgT2OPWIoNK9rR3nWehWzkHXipjmY+mmkh5cnHtbm6IgOCVrwe7AMoPOp
	5G/7Nu/4gmWl++gr/53tbKGkLFJcI//iXkiBP0YVE5BI4jN29FSp5Dd/ZkpwPOWMD/YQ/Uc4Ipr
	KkU6pwEjmICBnc0ORbn51zh6pkGudsXiwwEBZNDXvTsysX/ZsbVp96xlWHUEreA7bg6AvMOGv3V
	AFYGW5JfDJnqGYSHrYHvKeykKGPmBcBzhUAwOVQ==
X-Received: by 2002:a05:6a00:bd09:b0:842:5564:2e2a with SMTP id d2e1a72fcca58-84595210a8bmr10334851b3a.6.1782328165911;
        Wed, 24 Jun 2026 12:09:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd09:b0:842:5564:2e2a with SMTP id d2e1a72fcca58-84595210a8bmr10334821b3a.6.1782328165382;
        Wed, 24 Jun 2026 12:09:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a412e5e9sm2932120b3a.54.2026.06.24.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 12:09:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 11/19] arm64: dts: qcom: sm8550: Add minidump SRAM config to SCM node
Date: Thu, 25 Jun 2026 00:38:22 +0530
Message-ID: <20260624190830.3131112-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX98ypG4phwGTD
 zEh5hcqyJsCLTS9EcUG8XDbqW9w/5pMefn0B9VwviPvNGH4Eo20/8dhm/kGA3yr/Ej4SD49R2RU
 PBp9SVwFG2FuBR7CwyJfC/xJclZQb/Y=
X-Proofpoint-GUID: 4PfxqSqlFGSCvvZMQ-3TZN9Bx5j_nFjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE2MCBTYWx0ZWRfX9hQ/rsXtF1vD
 hAco4ecdP6TsW2Ao8uSJlPl4Dr2zl6Qfa86xmeylQSMGTVRqCR1bq7FuVafZHbx1+eUOrqlD3ZI
 IkJEML9Uu4cQpi6V4rG32aZnXXktSgH7dASD2Ve11Yf4kFLfbn2586U2Y/bKicBjJDXjdovmvtG
 Dxgydz1SGewLBq95/fWnbShudt2S5YH839RSsYsKjtc9CIzkzJpbmuMv9mpdGQcvf+3bsUjJzB5
 4DRfq/eXVcKtmfczIDSdi2ZHeeLYq++GTl0wMTS0lghAIryG+zFJcPyglgOZremzKq+bTiNoocp
 vgL7mLgcYK4L0ZAm9Y6CcGfahY7cR71XqIb9DQJJKeAPDdsGnJPEB2Djy9DM4J5Tl0BDFBxng7v
 nLPpbx7PTsz7ELuXiaCRAw2LtkkHiw==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c2b66 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 4PfxqSqlFGSCvvZMQ-3TZN9Bx5j_nFjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240160

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 396201905ef2..8830da63261f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -391,6 +391,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -5537,6 +5538,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0

