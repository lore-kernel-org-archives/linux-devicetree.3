Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936583DEFF8
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036511; cv=none; b=qV0IABkIUuqsjdng/1pOf22WokA5zr4I0UBUvi3mbVc2jpnreujWDnVhs+BXDfmGu5009GgphpgE9/NEw3NBybbNxaL2cPXtmWM+QZy+JtbVXNBuh6QRaBn0s1O+B3cltHHVXO19LJLNpKGilt5aHaQZJoiwYE7OEEpM+5Sqy9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036511; c=relaxed/simple;
	bh=8e1wrGwtOt6jYX3+6GLgmMDaN6TklWOqHQL7+SqwExQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGoeMmoMzpJhzhl9Am+bAXW3aJhVPFikntOKcdX242cZsdbPzRQUWRBb3ejheA6NpqbX/FvI36/SLyzWqPoOt2TBdgnHxd1dyrC0p0iFNmU9uuMgomV2QRL3mOWMQIn0rGOhbw7i/FKIgPKHtYQ8VjiExnKbZ2yEDPb5OUztVKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJcLUXKl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP6Jf5Iy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJcLUXKl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP6Jf5Iy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314O3Se1562579
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 09:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PqUADJMJJoP0wu59C9aNUAlbK4WpxvtmmPet8NmdNA=; b=aJcLUXKlwLsN0HZE
	pX+wH8xspIs9wmQlSUgay25eMrhg3ZTkBXVEpWvAW9tLifey0Rgm+WkJj26Osuri
	epoYli5Xdxf1hfju/m6+ekiLDOYMdZkIYd8ky7pClXLpYqy7tqVWx/QAED8zNhXN
	qaxtGAwchogJx0uhpqXYVAFd+oP7vIGZ0VyOUy0xugQd7ONaICRHh9un7pX86EMf
	oxNcm1KTIwIoJuqJfecNwBIM/62Gxl01G8ulHnnLLJ/O7zchanC0pu4qb17AzMpt
	WKs4JNoOUKmvG/TPvrr/yTsnZRsVBCbhc5AvHZPYShnmM7li3iVmUgPf9dIJI5u4
	fbjhhg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3s6dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:41:47 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12776bebeb3so7509687c88.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775036506; x=1775641306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PqUADJMJJoP0wu59C9aNUAlbK4WpxvtmmPet8NmdNA=;
        b=UP6Jf5Iyk52wr1/QXNN5qfYpclS8dUFqi2Q32ElRyQqAhdlX3reBPM8DZq7IQZUyMi
         OPqBVP3CptOcxRS2kRV8FQUkfc4WX2FWddWmQGwrzoDY1v0hXTEqYj/FSs7/RDf3WsRR
         GnL8c21Vsvio26MENiclt6RHd3zr6fZ8RbC9YioWnbymm5g0DmfTX7MhOkZfZX1QM9Vc
         uLjV232dVo8gLOxA3xPYdltjuAoD8DQKVnCcRCep6/mw+00JxK6MQvpvZvCGbqDSxFao
         qmkpcD0G9lqGbdqeiQBBKbpoMxMuPPN8oBKw9xR8U0+GCj8yUQJgba2Nxp3/l0rQ+Ggm
         9lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036506; x=1775641306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3PqUADJMJJoP0wu59C9aNUAlbK4WpxvtmmPet8NmdNA=;
        b=muP6KpCmGOWOS+62+rHDS423kVw9Z4rnNcLJbHcQFSeQsqp0S5KPCVH/+qSiV1Azf5
         ulqvZN1QfXHi701KcZFljPRhRD+W5ftOqB16WHtLFoUbo+mog7TvMMu8QSWs2itj7AM3
         OF3eju36xuA0W+Qsh2shGW+UzM55ae7xfz3YN9JWAvpnb3lBqRaLnezigTckU7nH/Txo
         Qw6vDpcZYSo/A9SPlz0TlWBGl5+nM/Z0kj2mfDAHbN2F0gfjszRwc3gAr5yhxfxDVz9R
         e0KPjjO5d72se/o/lraewQE+1rKfj7fQdrD5JSdGgCTNOO9kNAHNvNcfrzM9U8jSt0x1
         f63A==
X-Forwarded-Encrypted: i=1; AJvYcCWJPIJifrBvluaH17LvsEqzxi/zQ7vEPbpgTnph7Kt1PbyXb5fgoltEwlNazKMSVhZxpxUluPQ22fI4@vger.kernel.org
X-Gm-Message-State: AOJu0YyH45h48VIgEHbYWQxaxjpgxd+q9o+Vb1OaJfTItxDWWCJVH2GL
	JrrnjUUFBM9X3z+0NT3AeE3ZysgWCofiy8n/SiDGvvBKMbsibkrcLPWL6QpDjCiRc8Osd11InqZ
	YfPbbc/pDhYZtmZKRxnJe28m1HbOT4m4ELI2GniRK5zcuk9wuE+tFgcZieOmDeGxCz5NvdODLg+
	M=
X-Gm-Gg: ATEYQzyPRivfrJH7bGM+7Vg7v5C9ev9ysbiutitCSLVRMTo48NJCwbl4jMjViGdyHyk
	Y+MeabEJa/QSgEED1O2vmozeUuWAny13+khjmxpkc6EP53kwRfJ4DnHYXIp1xc8J7gLJHKmujPV
	o9UAC+xVE3/Fv3Q8N3eOVusgKNQC/0CzMcKz4F1CaPyQ/o8JOMDCFnus+qeCTja91jwpLsh9U7X
	ZqpNS4PQhUQjL5JODancsq0jlapb60QFdn6EEgBRqbOl3IspBghmuW7KMt73ti8IEUskYAt5zHK
	EkGVQ9nevtBw25NWqBGhcaV18ohDD2Lu62fEbEcDMkGZll1Vsoi0urd67r6StD7jzp4LjQldmWW
	0bMGQTRhcHzODzmkWKBYvX/UfpH+0eapSAma53wYs9kTqIckknEdHlF5/O43ZaL+ERT0QR1ZirA
	==
X-Received: by 2002:a05:7022:ea26:b0:11a:e426:911a with SMTP id a92af1059eb24-12be643816cmr2043501c88.15.1775036506489;
        Wed, 01 Apr 2026 02:41:46 -0700 (PDT)
X-Received: by 2002:a05:7022:ea26:b0:11a:e426:911a with SMTP id a92af1059eb24-12be643816cmr2043475c88.15.1775036505863;
        Wed, 01 Apr 2026 02:41:45 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm18982647c88.10.2026.04.01.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 02:41:45 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 02:41:24 -0700
Subject: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036501; l=4497;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8e1wrGwtOt6jYX3+6GLgmMDaN6TklWOqHQL7+SqwExQ=;
 b=1S0erltnTVdBmiiXN1oRavSHh/OWi0nN1ROWxzEQU+EG0gukJXRmGAxiNvRiZbuk8n3Df3Vlc
 xkHOOk+yzm8BFM5XWSftFdT14eg4FqJNEn8Hia+J4U0+1nm/eOoYfAB
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: 1vM7Z1LXl1zalNTtxBOEEaQWJSVbl2A0
X-Proofpoint-ORIG-GUID: 1vM7Z1LXl1zalNTtxBOEEaQWJSVbl2A0
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69cce85b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qQkTAZUf_KvMCO389TYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NyBTYWx0ZWRfX5ODjZWGFj153
 e79OEw1y24xZfs91Py1T9sVh4jTi81M8t6mCcUHJ6SYmeMaNvViHpN7iMWUPRDqK11pgPTIsxLv
 ehwJkg+/mm0Kp/ImNIaqzsTZTDIZt8dmgAziMoA91WBm99fDCcsv7k4BFdnOP2fec5WfvFtsgcN
 rVyf4xaPffOc5j66NQMsuidRGtWw5DCr1c7DS7TcALsurYYBil45y7+47Ruto2s6xwSrIJMDT9E
 t7/GQEXtIKxkza8wWjBFm9mk9ZggIUN9zsFvTyuyTCxO46M5OSHN8HOKhFDtVRA3AMkVjpR6D/d
 7LTtBUP5yGNZiZUPU51CiCVSi0GaLsnVOZsMHhmG6y8fe7UCuAqn2A9C9WqwbD68tMyWNvwCIe/
 8i/fluks5ijO58WjD3h6pzpyMxTdLGstraWU82eKOXQohOmw84ofa07LcwO8kwLYQCRIYOZC1sE
 A7HdIA8MdckpdtO/QJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010087

PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
the definition of the channel status register bit fields. Add support
to handle this difference.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/spmi/spmi-pmic-arb.c | 69 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 69f8d456324a..deeaa39bb647 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -28,6 +28,7 @@
 #define PMIC_ARB_VERSION_V5_MIN		0x50000000
 #define PMIC_ARB_VERSION_V7_MIN		0x70000000
 #define PMIC_ARB_VERSION_V8_MIN		0x80000000
+#define PMIC_ARB_VERSION_V8P5_MIN	0x80050000
 #define PMIC_ARB_INT_EN			0x0004
 
 #define PMIC_ARB_FEATURES		0x0004
@@ -63,11 +64,34 @@
 #define SPMI_OWNERSHIP_PERIPH2OWNER(X)	((X) & 0x7)
 
 /* Channel Status fields */
-enum pmic_arb_chnl_status {
-	PMIC_ARB_STATUS_DONE	= BIT(0),
-	PMIC_ARB_STATUS_FAILURE	= BIT(1),
-	PMIC_ARB_STATUS_DENIED	= BIT(2),
-	PMIC_ARB_STATUS_DROPPED	= BIT(3),
+struct pmic_arb_chnl_status_mask {
+	u8	done;
+	u8	failure;
+	u8	crc;
+	u8	parity;
+	u8	nack;
+	u8	denied;
+	u8	dropped;
+};
+
+static const struct pmic_arb_chnl_status_mask chnl_status_mask = {
+	.done		= BIT(0),
+	.failure	= BIT(1),
+	.crc		= 0,
+	.parity		= 0,
+	.nack		= 0,
+	.denied		= BIT(2),
+	.dropped	= BIT(3),
+};
+
+static const struct pmic_arb_chnl_status_mask chnl_status_mask_v8p5 = {
+	.done		= BIT(0),
+	.failure	= BIT(1),
+	.crc		= BIT(2),
+	.parity		= BIT(3),
+	.nack		= BIT(4),
+	.denied		= BIT(5),
+	.dropped	= BIT(6),
 };
 
 /* Command register fields */
@@ -201,6 +225,7 @@ struct spmi_pmic_arb_bus {
  * @max_periphs:	Number of elements in apid_data[]
  * @buses:		per arbiter buses instances
  * @buses_available:	number of buses registered
+ * @chnl_status_mask:	Bit masks of channel status fields
  */
 struct spmi_pmic_arb {
 	void __iomem		*rd_base;
@@ -214,6 +239,7 @@ struct spmi_pmic_arb {
 	int			max_periphs;
 	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];
 	int			buses_available;
+	const struct pmic_arb_chnl_status_mask *chnl_status_mask;
 };
 
 /**
@@ -312,6 +338,7 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 {
 	struct spmi_pmic_arb_bus *bus = spmi_controller_get_drvdata(ctrl);
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
+	const struct pmic_arb_chnl_status_mask *mask;
 	u32 status = 0;
 	u32 timeout = PMIC_ARB_TIMEOUT_US;
 	u32 offset;
@@ -323,30 +350,49 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
 
 	offset = rc;
 	offset += PMIC_ARB_STATUS;
+	mask = pmic_arb->chnl_status_mask;
 
 	while (timeout--) {
 		status = readl_relaxed(base + offset);
 
-		if (status & PMIC_ARB_STATUS_DONE) {
-			if (status & PMIC_ARB_STATUS_DENIED) {
+		if (status & mask->done) {
+			if (status & mask->denied) {
 				dev_err(&ctrl->dev, "%s: %#x %#x: transaction denied (%#x)\n",
 					__func__, sid, addr, status);
 				return -EPERM;
 			}
 
-			if (status & PMIC_ARB_STATUS_FAILURE) {
+			if (status & mask->failure) {
 				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
 					__func__, sid, addr, status, offset);
 				WARN_ON(1);
 				return -EIO;
 			}
 
-			if (status & PMIC_ARB_STATUS_DROPPED) {
+			if (status & mask->dropped) {
 				dev_err(&ctrl->dev, "%s: %#x %#x: transaction dropped (%#x)\n",
 					__func__, sid, addr, status);
 				return -EIO;
 			}
 
+			if (status & mask->crc) {
+				dev_err(&ctrl->dev, "%s: %#x %#x: CRC error (%#x)\n",
+					__func__, sid, addr, status);
+				return -EIO;
+			}
+
+			if (status & mask->parity) {
+				dev_err(&ctrl->dev, "%s: %#x %#x: parity error (%#x)\n",
+					__func__, sid, addr, status);
+				return -EIO;
+			}
+
+			if (status & mask->nack) {
+				dev_err(&ctrl->dev, "%s: %#x %#x: NACK error (%#x)\n",
+					__func__, sid, addr, status);
+				return -EIO;
+			}
+
 			return 0;
 		}
 		udelay(1);
@@ -2033,6 +2079,11 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	else
 		pmic_arb->ver_ops = &pmic_arb_v8;
 
+	if (hw_ver < PMIC_ARB_VERSION_V8P5_MIN)
+		pmic_arb->chnl_status_mask = &chnl_status_mask;
+	else
+		pmic_arb->chnl_status_mask = &chnl_status_mask_v8p5;
+
 	err = pmic_arb->ver_ops->get_core_resources(pdev, core);
 	if (err)
 		return err;

-- 
2.43.0

