Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E499137923
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033777; cv=none; b=YjGOs+tTsxz4xx1smNUFzWSsKHTQS4/i8K5SXBFyrQ5LIxeUrgu1z+Ch0NnWz1XZp2VLl4eQws/AZXLy5LGRus18XERVNtBC8Xqq6qEmySYEt89NGkdsb2uVHuuDCZ4WQib1aAMnwMmu5OlXObOeeE0N3AalCc/yeb4pCrKlU5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033777; c=relaxed/simple;
	bh=9PHDqN8u2OYdc0o78FTOWtIYPVyg3JoKJ40Dyw5pnvc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c9GxNL/Q2KSy2wujjqTV7ryv+b/H8aeVFUrIUzTFg/3OMmuN7jX29YS1oANzvv5VWAUF33Lhj+BKUEdqC4OzN01F+4ksIbR+lcrH4vSV9P0HxFcFarhj5P6IWJ6KkRbbLTQprw/u14tQPcxCDyHKewwhpu2DIFzJIAg/3q9z8dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVFRqgOb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLBN4T4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVFRqgOb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLBN4T4x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YWxx3762018
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=38I388lvL0rpoIh+lBGHzO
	XugNwuZLafMFmaoLyxPv0=; b=UVFRqgObjNkJN4hMcrC0V4PAaCOW6sbn1s8wwm
	1J4CDub55ix2tBOOD+yMPfqJtAvt+ma6c/PPxolSbYEupLVdqIZflcFeWMdafoMX
	PmC17GDEmd7el0TSRAh/wSRtrKaDgAleI7ylEFSK5bDALHUUu/jiLM7oXkhh2ieZ
	jyWuwmeVwSvdMnsBwSfuDrjaqdSYetL+c2s2kORw5oOqRx1edtl5mv6CBZzzovYn
	PrWEn6Y/rRpmFwjNlL//8fvYQZHZsi/+yz9rsFkARVLgjLPeiCyMnsT3PNal5v3x
	AHMAWlzJsdVILC3iJm/1OYT6bir1rEHxbetkdVgh8fqg2KnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtru2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:16:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso125235735ad.2
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 23:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787033773; x=1787638573; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=38I388lvL0rpoIh+lBGHzOXugNwuZLafMFmaoLyxPv0=;
        b=cLBN4T4xSfd/O7b7RFlPVnYJym4weqMPpzGNsZ8zBoIeNjx8Le7S7uJswTXP+pUqNq
         mj4nT6UX9qkxe1sJ1EG+0D7IERiCPExUh2jdrW50CKH9UdG5q7Bg5r+N/eGsAQEj7fOP
         b86rpZgsWaVpov6kKB35T2BJ5A6xN0rT9QGW/jZUucIrvUMMjYI1iSRF4aVHdVv42DhJ
         n6tDqDHxaFhx8P6ou5ULr4cZ4ZS/7i+1hLTtAJWec+aK1UAvNHriUlp6FMTUe+El9NbT
         A7NtC7KHWFsDvjE4VFR3g+zlEwAo1Gb/qgsCApimoaOcWJ7AjzzcDwRrBaP1ebViV9KA
         JKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033773; x=1787638573;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=38I388lvL0rpoIh+lBGHzOXugNwuZLafMFmaoLyxPv0=;
        b=YgiP7mVif6vfSYIJY7C/TCDNi0ZHCuK1wp4ZyioiH1XLb49vGrAxleg9Iono33Qm4q
         GUkHrVzXhnyaKceuXQV73qQoPZ2sPlygpVpA6aQpMFQ5YL5A+MUUfjo2Bv9wdqaA+sO7
         FlvmWBwOCW9DEx3krcHJVLQv1n4gDkX7mGkeXValfUoeOPE3X8XJ51fNNxJ0NzVaKAIP
         VddjAy710PFrvdIqyqcVzkW9g/AlOgNajW6QNQDJqmUBmj4/41WWpyCIkBy9AaMdQYjC
         m2wtpnm7lXpDNLjzeTNu2IQGQpm4/AJBI1zVkfxlKAhg1BvQF2kItJkBezWi9eNJjrv/
         DOfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rprgo6q/Yf3nwnufsNFua/IhVPM1pOeaIfwqc+v1EdJT/zIJ5TwsKDNqyHXLJiyniuIZKcNeIbxjGIj@vger.kernel.org
X-Gm-Message-State: AOJu0YwtSdynCV/Ptrv3JzmzMCh3lGAYZ1HYJQD4vkuF4H0lE3kq1oIB
	v3IVcTpbPsISSt0Sd0z8OVMJ0aFB6QEVp1GlvYZ4GmtP40uDuBpYmike4U1brgLkLBru4k0XJz6
	X6JFTbGkdygAUu4HM/ntQXO1CsFrXzXu4J6cvJswi7Dl/5SE0a0HhYjHY+D5GunER
X-Gm-Gg: AR+sD12kM3Dan8vkigzDHy3nZYXBkQyd+F8a2F+sb/ZM+ppg7FfSvGjJehkMZ14vW4N
	9SK9kNdY1vRPbXtEMsqKkWgPYD6H6oo9EWP9dwgnQ0Fq8L9t9Tb8ko/ZFbyxepKI6WU4HIqGtJ2
	jWSG37DuIYiyXwhI+3SaBnm92T/aJPo00tm39zrXEAVB8S75scf5YhoPhNXrJGZ9hHHa2pbn/WV
	7NoAIT8oGt0++rfErYZ5V8/CQmqmc9C4ul2FQfMR2MjLtBfAwb2HoDVekyeXMUI+c8vYGELgjNn
	BS0Jz92fWSNsK1KhYvM58WMVWXQgkotofV05CerNmvKIal87WfgtEEuCe5NNBcZmiu7tUGpvc27
	4YzFlQmvaTxc9IGS1JoJUouAglSzuwTqNThTq/ZSCeu8nzQnIyZo=
X-Received: by 2002:a17:902:d4cf:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d3b080bb30mr318045895ad.3.1787033772881;
        Mon, 17 Aug 2026 23:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:d4cf:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d3b080bb30mr318045115ad.3.1787033772332;
        Mon, 17 Aug 2026 23:16:12 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d7bsm13719685ad.3.2026.08.17.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:16:11 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] phy: qcom: Introduce USB support for Maili
Date: Mon, 17 Aug 2026 23:16:04 -0700
Message-Id: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKT4g2oC/02NQQqDMBBFryJZN+LEWKWr3qO4SOLYBNTYTJWKe
 PcmdtPNwIP33+yMMDgkdst2FnB15PwUQVwyZqyanshdF5mJQlyLBmo+Kjc4vpDmtZFYaQVKomT
 RnwP27nO2Hm1krQi5DmoyNhXSOmnW0duH7fy4QpJ/8RrKv/hsN74CL3gpmqpTAD3I5u6J8teiB
 uPHMY+HtcdxfAF/E7pXxAAAAA==
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787033771; l=967;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=9PHDqN8u2OYdc0o78FTOWtIYPVyg3JoKJ40Dyw5pnvc=;
 b=1N07JMvOyS3tl2rq13jUtsxI4iryR+lWKIT7Qtw4nFphBoacHUJkvFgMF2v9EBEb72Mm1WKfY
 4+Wi7YIKlWBAKUiM4eRSOohPg4EYsDPzXY/rdH1G9BSZf7lkdS09CDR
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX3vodvif8rONT
 pty8Canc83uQ+YKTB/5q8RwJqO8/9W4/ZV3GbusRTn9iR8EGoMKI4CkdVM/BoUNMX+3EipPRIvj
 a1PgtB2B530UPrGL7Rj7PSjTu5x9drQ=
X-Proofpoint-ORIG-GUID: pLktVWB_tVYymUp-aJhW8g8bYL1Wm4sp
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a83f8ad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tkoM0K3omCSXhoJk5dcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: pLktVWB_tVYymUp-aJhW8g8bYL1Wm4sp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfXz3T4yTTO0dkE
 LalhE1miys8+uGtITgIuYC9Ky4DZxtiIhD8JAIcYueiiuKMSkRTf5gBSc8nUExMw6YPR5eY73ly
 yJyZxky0KokEFg7rf9iJ1WpgVnx3tKPU6UXH1Ij0a7bcyEZ7BhPCxpnWkhxT3mDqWpptHcFtlI/
 pfgSEDGlg2mamRwRPt6QKCL9t8nIGLSgVVIL/e65atkYJ3awy6juPzTzzow0745wtFIy8Qtin6q
 OWYa2r0enLBorvi1Txfy4kK6AF5cLwdE17JUFjLxDjl6snIb13kMRA5bODihOrzD7nJHk1X3t29
 X7Ep2s+G/ORD9EELdpD2ZT5N/8lYsG5q7I6Vw08oaS2Fpw2MNhsc5OXXFKik8rCYukVmDD0u14o
 hDJ9CXgWvuPlTXpsw3X7NDy1WuAh7hRmqlVmeko7LWfj/gFCKL3WK0iFvTT5liSL8SweDR1EmU7
 Dt8q0s3R6FDRDnfv1MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180045

Add USB PHY support for the Maili SoC. It documents the QMP USB3-DP combo
PHY and M31 eUSB2 PHY bindings and uses Hawi and SM8750 as respective
fallbacks.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- fix binding order
- rebase on latest linux-next tag to remove b4 dependency
- Link to v1: https://lore.kernel.org/r/20260713-maili-usb-phy-v1-0-3285da11f148@oss.qualcomm.com

---
Krishna Kurapati (2):
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Maili
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Maili QMP Phy

 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml         | 1 +
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 2 files changed, 5 insertions(+)
---
base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
change-id: 20260817-maili-usb-7c4e5ba1a4e4

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

