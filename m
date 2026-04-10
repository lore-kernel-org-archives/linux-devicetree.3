Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F5B3E3C75
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846550; cv=none; b=Qoll+YyooN9QZWOulBk23vrdCprduguDE51dtIKsA3KEOA8YVQwbuxiwdwk3mcQsSBUqo0H+DwPlqnj2nfSecqhgXkbA64tfcFNmgPSlkaiQvAtNXo1dxZbdIwMaGgtQ9hDSdGtllxAOiD8TciNJZlTmKIKzpSShaP1Sgl+RV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846550; c=relaxed/simple;
	bh=NavYeT4bON+iuQgPlGsfijBL8el6VrMBDrqEtkBdnic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc80aOiY0lUYXUDQvnkylD3mcDi5iLNDAOFaVik9py5d6jCy7BY7KB2AlLOxYpamZ8IT95C/+LbQZfoGJOeAX+tFy/7XS0SbEl17Qqmbvd6AafSUZFwcbv1JQMLrJsytMUSErHWsNRKj4QKl/eaO7ZZF38U8O0G2DtLaqqYQMGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBDCmeH6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CybkgpK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBDCmeH6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CybkgpK5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AITJrS3743154
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EBLVxLT9mVW
	GJomaPHrgjCu8AgYjVMtTnyWNM7IJWKI=; b=WBDCmeH6gPk+S8ocuV438TxKoct
	XdICC8DTL0ZM7ub9OGuKPyAicC/S3hB9mvDD/2kYrhSe/A6tHGDk7ftftEISOmB2
	Lsu5gviQcg6KyxySiekpizTdl+HzXmJ8yPwj7hoIQKHLttX0W3KNkfPRNNe2BiSE
	eFmlwE/LqJeZxdCSXqyT+A0gqMWGR2k/vOpi/JbXbfv2mdJblxuCq8HDTApFRiHD
	ipXhtK2hadPv0RBkf8DpgY+1HS0nU9QPE07Rkl6iPoE0uraVSVfnbHsBOqZyqeCn
	TZQBPvx40IZ12d5vhp3BVlMeXZy9PEpr5IGaLj7AxrSF7hoFFUgmyzt3hZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deytnhdhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76fff22e60so3198482a12.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846548; x=1776451348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBLVxLT9mVWGJomaPHrgjCu8AgYjVMtTnyWNM7IJWKI=;
        b=CybkgpK5pk1SRPLeJNg2ltITXM4Ravpa73xBkHXDECTV9P9GJdHF/+yfT6PcIR2M3H
         3pt0RIJXymwb9+t0qPPw/USoBkijJsun9nVfUDRNhpbVbutxiF7MZK1OWtQAh5J0gR/3
         zoylrELNIrE27Q9WjC7VOCBF3wioSJwc2c8qabWdfzaWEEFwU/x/lV9muiJSLw9mSxDS
         TvcntdiTzqAmz5hEJHnx5RX3gO8mIldkSjcO/xW11SWS3D2Z6vWEzrAW5In3JX6YbzX2
         wJFXkID3fUTVsjkIEsEA1lnySJ6rtjSv3ctWAL9roOa7DrL07s8kAuT7QoEOGmmqGWNz
         VTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846548; x=1776451348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBLVxLT9mVWGJomaPHrgjCu8AgYjVMtTnyWNM7IJWKI=;
        b=Qy/SbkFAzLjDfZ5Q3Vfa8ePoCmuleZGt1ohITwIGG8e3/RIoWFybPS1FrqI1nxlgvY
         GgyQY7Z0smS1ovdec5JToCXWYLxgqmkyQYDH+v+XdMQeKG2Hmb/frqrKyWSPb+W+5xgi
         6ZFA6NkS/MeEt4UBLA4Iiu84jokbQmq3EiBBEHYF1oi/DU4iR8UZEYkHTbHyKGbkn4rK
         K6fCSPvbxMoGGY5FV93A8Ahny9kunIvDb/xLNSkx9CijPT/sDsdK0nnGNEPyLAfDlCR8
         yCE44ABp4/drtwN0+MpJ8/PRBooqz38izLMn/Iu0nIC3wJ9gOD1VMtFVoCEUbwLNwUOr
         r5+g==
X-Forwarded-Encrypted: i=1; AJvYcCUMBO7eHf7eWXdAEksSOOcTJajMvVGxLGQTD/kxczf/8WBy23ssZBFtOwUmY2W18RcBUpqYD9iXkZS6@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAM3XERmoqmutSPW3aC0J8Y/fL67plkJ0DMfk0/JQYPBe8A5d
	yTypweg7VCitfHDbcmqvmngjRBLL+QBPnj3hhlgVLEL1vSHsKbB+vKb+xNnd2AlyR0zfPhogO5+
	hXcIeUCpDS+44rsmiPStghEcIP7sfCw3MjbtCSozYL6rDUjEKCrgo+cWH0X/P0FIl
X-Gm-Gg: AeBDieu9h2mnzJrKnaDyafFx906uVm54kvd3lW+qoVnYNNovClJFWZLYzOYTbUUExKt
	Ye1iz3SF+INe8BdtyM7GMOu55JYwzcpBh5qgxeYAx4PHMbNEnztQl+SsZ7TvVS56tn3meXbsyy1
	/BT4aNnFvH0vnLi0i4CHSrRuxOSwpDhoIq7d6BFUSHAgzr4Bu5WqdO7jOP8CcCcYWdM+Q0oQvSp
	4Ui7gpGWyvmHLz7/NU4qrxXVDwn3WfB85TRxs3+ymt+89IKdk9U05UTVgwq4Z6bQIZycTF4mDLa
	CxyfasUP95T7CI0g7bSkxwRLP4lXMKO35WhnTICJpwjSHQWoJphVPSkFK2gaImMyTPnLtOy2lvC
	qvwFtg5a4+L5VdunM615dczy7I/hMkwUWTy6z3LLvn6ALKxdS
X-Received: by 2002:a05:6a00:4398:b0:829:6f9f:ea44 with SMTP id d2e1a72fcca58-82f0c288ae0mr5185106b3a.17.1775846547356;
        Fri, 10 Apr 2026 11:42:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:4398:b0:829:6f9f:ea44 with SMTP id d2e1a72fcca58-82f0c288ae0mr5185083b3a.17.1775846546875;
        Fri, 10 Apr 2026 11:42:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 06/35] irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit position
Date: Sat, 11 Apr 2026 00:10:43 +0530
Message-ID: <20260410184124.1068210-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZXhLAdYCvOJ34Sw_vAiAzd2x9psGtBij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX6IMqrVweIc61
 iIeVY68PRigdNyva91GwL8yrI44pMUZXF8V8Z0nSC7KsA5gvDqJgh8bZbDZo5s+XqqmgJXQV158
 s5bPl+jP0o221RLb1qLsQBs7waFQWWBQRjNrMDl9ERwMOcipFHZlidRnhaCd7t3W9tnGhcRrr1I
 +gn3iSHD+3gz+IB1BEGg+yp21m9TnRi/Px2xa7XY8LTlMjcmEyUQGWByy3BkykZSf6U1gWdv3np
 NT7RiTEPMv07p4Yg603J9JCH8HqrJ45djIInHLXCunmi/1gNJ48BS/DRvX4OwO5rcwSuDvvF1NW
 jCBqNU9GCZlpHDx8kogR7H5G9oVCKFozkUwq+8U1CyekTzHdwTClhciljRKCwyLMzP1dU/yEbSS
 VIBZf8VoYnCCK4kGCkMth3L0UnF3sX6TX24fV8FvA78eh4l2bKweLRQyAD/D5MDB9NBKI4jDurS
 j36z1coEZfGHud8IB/w==
X-Proofpoint-GUID: ZXhLAdYCvOJ34Sw_vAiAzd2x9psGtBij
X-Authority-Analysis: v=2.4 cv=crGrVV4i c=1 sm=1 tr=0 ts=69d94494 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1nlMVIS8qB_KVi7qAl0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
represents one PDC pin. The bank index and bit position within the bank
are encoded in the flat pin number as bits [31:5] and [4:0] respectively.

Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
to make the bit extraction self-documenting and consistent with the
FIELD_PREP() style already used in the PDC_VERSION() macro.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 5e1553334103..638b5d89a141 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -110,8 +110,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	unsigned long enable;
 	u32 index, mask;
 
-	index = pin_out / 32;
-	mask = pin_out % 32;
+	index = FIELD_GET(GENMASK(31, 5), pin_out);
+	mask = FIELD_GET(GENMASK(4, 0), pin_out);
 
 	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
 	__assign_bit(mask, &enable, on);
-- 
2.53.0

