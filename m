Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40BF3E3DB5
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846546; cv=none; b=IEb2JbSU0/CahCtfwncQG6tKJsrcxjmzmHkNCzT9v8hDbrFi1yfj3Wa07IzwdDflw0UVqrC4y7b+cYopPBXtEi+36EbHu+o9qlD7MweMpCJUVXgWa5d2DKfs41QanhrRIOtuXyUlig+dnX8FAclRpU5cwEZkJ1VQRQZDjA89ycs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846546; c=relaxed/simple;
	bh=Rep82lDGgEQ5XYFsLbrfvpCeiJUiYIk501w0wWDaZhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mF0hmCMRJUt+gJaqQ2ux4hB7cX5aTiobLCkzsrzHR4vrGWq8eynCDvJYEPFD2I1iZ7ELpxp+KlU6Di6eESIaZAnVqiROZAH/C/VZpnDgw7AwgVfpJ0mRjnEdaUwSp15yLkFMhZrZSifLiof/aqQF9hBtVgMgzfv31ZuhMcj3wJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFj82ER3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgOzfanm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFj82ER3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgOzfanm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIfS2P438786
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eyFWyVs6irF
	F2geJaREtVZvdfCX41zqa6jIB6bjO66A=; b=JFj82ER3kW1wrsaG2tMRDyshzgO
	uR/0WYdb/3+xDwdHrCK5hfvqhZDXuVQjzBItDtdLg4eoZNsZkfehNTXa0F52ShOG
	TuGPPFEaX8oA+DDyEeUaOdboD95ojeL0m9oirfO4gcmxDx0QYJ/6xK0KJPZFnu5T
	ZTH8VBY6Xe1fl/Fddt0JoroNy0ckzsfxHLUcotj0mG0mTi00kFgy88d5jZtyi2Qy
	DK0XPf/F3HNqBgc4W4SgVmksnXpHl5cZNTKE9l+ETojs61GhJnSTe9Wc61GkdlNX
	zHsixS9/KiqX2jKZjt9Tw7KD2c6MUyqKbmFTC+HzbXcTJoJWOl88nrfgYMg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deyy9sebv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:42:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so1489929b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846544; x=1776451344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyFWyVs6irFF2geJaREtVZvdfCX41zqa6jIB6bjO66A=;
        b=MgOzfanmZ0XDyfl89cZiq+Cwb68hZ75lyRSPLcdzyWHsYhONwRcZVStgXSWuXj399S
         kN49ds9UvXgHxhR87t5nKv0par1Xa1VM9qI6OataVdo8qFqqgVBSErBS8w783JZGgr9n
         cFwsRAJEJ5nH2M9bXKcGVe2uVK/fBmdmJ8NdjKi5Ikpuh3wiHB+Sih3WiKrH2stk9zKn
         hq7bXbKG1DEBb6MCRDBd/I1IvNJu4yat5CCBZ9HoRiXOIbuKMJyxnWzvPjm+uSv5MdIh
         3XNLeEf52yYwIooabvZKw0wTo1JQ0b+EmReMJ/dFn+9ovZ6OyPRvtsAxWtRo4Ky3HHXb
         r+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846544; x=1776451344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eyFWyVs6irFF2geJaREtVZvdfCX41zqa6jIB6bjO66A=;
        b=B+uG1AY0iSpc5YB4OyBYYimwgumjE3GZXcd20r3TxC0zEOzgNcPJRCgqE0j5tGyTyb
         AlKqIeC0wtrZ3Uj127DwTeF4ArMj+ECdkmA8ZXKOQq9px1Qg8Ecv58I0RKTMgfj83Y2n
         PVPqPxr2qtINhTKg8lcwkbpnTgdqzjouKlGYHCqyg6LaC6OusVvBXi7ZoSjJZOTSLDnx
         3Vg3Z4qNgWae6JstX8H3UDPfxhMnyLdS1H4e/SbZjubL+MgIxkiTQtfEsGV4PjA8GmjD
         U7ZWZhk/1feHyPpYy941trLWTmlAZgcBXA/Hm/E4/vzhSPQlRSJ54Hq5qCU/883pygY1
         9aPg==
X-Forwarded-Encrypted: i=1; AJvYcCW6C+b2Xxav4DyaAhecKoXLjKEkOI3qqXmolwAsexOJDbnD/MvygEVJIGUDo6hnXHsDE00x61bsEvUY@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWvJvNnN5Mox1lPLSEwmKwF5VmAxIya/XA8uqu9v3X+IsUyM1
	L6XbGQgETbaKvjqK82/xIlb1ZeKwLn0S1yLChPjJQaG3SuzGoxPs9mDJBCwGNnrmBjKUgDt7EHY
	9LJ2qxZ2JNCYUgn1uR7HTfh+Lpjx0joAgGqIcS6qutlLBuyhfASDQjjaVPl4DMuoT
X-Gm-Gg: AeBDiesQPrBKna/1OR2+1Snrs44t6xjTktgDSXeWdGsajatOqQxZtMaRAXy5mLo/i8/
	6/JyyH7PsFs3PxcofdUMTn9MtVOrNNdEky/Ie6NJD3nO2OwhfPl/pjCRtPcYtYRqPccLPFkco6X
	I1lr9Z3pDO9pMSg9gUKCZwTvSFo4vOhQrR6UJb0gAS9e0fyJgJg3x45dLyU9HDi5mdzqx0gUMyn
	lSurw8dJPDHwv+Q+oZa9ryTyV7TA+kac6YIOho7QibD/RqD93hsLA1GMm8aAtzrAq0tKAMdDgrA
	uzGygNL8yOYeEn5IraxjMnySRuuB/M05lYC5ruAZ4I/dwoxPwxxc+jQm72JowQWubhK3Kcji0Yy
	sKVbX/0HVG0t+TxFyeeMJbwyE8JEBSFs/B3VrbR/QHskYhVFF
X-Received: by 2002:a05:6a00:12ca:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-82f0c1896c9mr4811759b3a.21.1775846543464;
        Fri, 10 Apr 2026 11:42:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ca:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-82f0c1896c9mr4811713b3a.21.1775846542859;
        Fri, 10 Apr 2026 11:42:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 05/35] irqchip/qcom-pdc: Add PDC_VERSION() macro to describe version register fields
Date: Sat, 11 Apr 2026 00:10:42 +0530
Message-ID: <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX5sIOpxQCbG2Y
 6sifEyXS47fTPjDSNYzFzIF5Ycug6MGyfoxIwzCcoI8IB3FXPIgKnVCdR9Po+aFiGlSyTnAyue2
 zwJrF9+q11twLEu0Rwt+pYE1wu2Bjc6dQ6uP7geiZSSDMhraZIrCkG7+VaMQAo0/8O46SmGG/zr
 WGA8HEhEw4KjVcyWXAkMqdC35I6ZnduNivJQGgzH4fcdUIMwphJGgDPyBa1Wj12s0zRL177g/3Y
 LXWaC18IFCKbuXXrccArNK770irTVyfhm9lqgpa0wZzHRUO2/2WZAy0K09aS2rzQ/JWD0h8EQos
 WOP4bQ8inO8QGh7sEzDkGg8GHgwt2mOp1bAfq4N9919/SUYuMf3QmUmsN+XcFeS6a4w6r4p+O52
 GpbWRw/mluBPHMXXsXKze+Maco1loXHyIJuBuZLdvUO/qPduc13KkJ3mPzqn9lWHC6VCYY+SOcw
 GxOpPzoKqm9ZVe11ppw==
X-Proofpoint-GUID: J3mcaj0IvadHxy2Ptl8mg_hx95TteE-j
X-Authority-Analysis: v=2.4 cv=d6fFDxjE c=1 sm=1 tr=0 ts=69d94490 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VeW31bOOL8eyMvC__NIA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: J3mcaj0IvadHxy2Ptl8mg_hx95TteE-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174

The PDC hardware version register encodes major, minor and step fields
in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
with no indication of this encoding.

Add GENMASK-based field definitions for each sub-field and a
PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
the encoding self-documenting. Replace the magic constant with
PDC_VERSION(3, 2, 0).

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 734576cdce0c..5e1553334103 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -34,9 +35,16 @@
 #define IRQ_i_CFG_TYPE_MASK	GENMASK(2, 0)
 
 #define PDC_VERSION_REG		0x1000
+#define PDC_VERSION_MAJOR	GENMASK(23, 16)
+#define PDC_VERSION_MINOR	GENMASK(15, 8)
+#define PDC_VERSION_STEP	GENMASK(7, 0)
+#define PDC_VERSION(maj, min, step)	\
+	(FIELD_PREP(PDC_VERSION_MAJOR, (maj)) | \
+	 FIELD_PREP(PDC_VERSION_MINOR, (min)) | \
+	 FIELD_PREP(PDC_VERSION_STEP,  (step)))
 
 /* Notable PDC versions */
-#define PDC_VERSION_3_2		0x30200
+#define PDC_VERSION_3_2		PDC_VERSION(3, 2, 0)
 
 struct pdc_pin_region {
 	u32 pin_base;
-- 
2.53.0

