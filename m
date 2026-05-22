Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26452D94AF
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435743; cv=none; b=QW7fk/5d3VPsgQjiocLVgr6hCeg2mocpCrJYMn92rj8QiPkHiPjl5SGYc0UruZEWFl8wih14IIi3hlHNt7t02k5/SR3yO1q+9pbBCbB33uEfydJvtHGZoXMhNEWf2HUmXI9U5ig9V8dgrvDn0Fd9NeeOPIfYV5garR0yo5oXoFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435743; c=relaxed/simple;
	bh=GmdbQtXHlx/dL23XiBLsmK6wApi50guOPUdpigkrk1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OnZngSx9hv3NvEj/i6SohBdpXhhSTWNdPtvPvdifMDWFXUMMmGJplGzX7dxbYeE1qZpY+8k540BGVhio2PSzVcAKzSHUjOJCNiDpaETfpXl1l7nSJZgjgACuFzooTiqjByiPVEJG3ESlTGaxzRgMGCLCRIr3EXu3/yLc+NunjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTr7RVyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5Vbgaec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTr7RVyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5Vbgaec"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M2woxI3532125
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tDa3n1fEJvGA2Q+Cx/J8QD
	0BHw9aFXkjrjQeti4WbaQ=; b=UTr7RVywkz6vBheMFQ+U19l0wBWeHUgHM5A4zm
	QHqGimVZPzL4mPrIkidLtIoG2ccrbC4sDpPSaJ6f82w6CYeh9508OhOhTvbTzE9/
	PFw2JxgPfSf0dvaODm77pZeiaV46a/tWjrVO5/3K3m9+K2ZBjc/RIWVGBvMWKY1o
	3fcU1ikUExojqSJndrYfQCHFdMPephmTmUXU0uPUQXjN1hDOL4wWzLxRQ5g5Y0Ei
	9ah79QqvNXG5agZ76nq2glAbqBzpZ4/N7HnlWTQiNkzTTvYyHlDEUuc5eUzGyJsp
	LeR8QOw07CX6dQBbuVO4naVsVJaPxPwRzDEGkvOvBbPYSA3Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gusky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:42:21 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30457ff05b8so15707eec.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779435740; x=1780040540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDa3n1fEJvGA2Q+Cx/J8QD0BHw9aFXkjrjQeti4WbaQ=;
        b=j5VbgaecgK1PVcKACnHX9y2/EDvoRMevCCir/mMucvJvgV2cLCMxwm3QeU/nvLocL5
         uQlrCIP+b4z9uX5p++Xl1CDlGY4zWW4W3K1mw15GCR9GGRnSXki9PmUYge4GXqBJx2QD
         tlqyr5af/FKY8dewbjaxMtRGYoh266AQkuqId5mnh4B+lYx15x0Z4JDpNxF712xA4Jo/
         zoXDKXI+A3f9mYCjQU2V2OZ8KdmynInSQY/S2bNEcTcg7w07Iftw05tA/GllIYwYV9Cm
         qJVMuHeyofFlyD6fVLtsAllBeu0LQ8sPm+mczuYKDf2tNEAIZ0E1kGoPtBOlhLHsXTgR
         SGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435740; x=1780040540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDa3n1fEJvGA2Q+Cx/J8QD0BHw9aFXkjrjQeti4WbaQ=;
        b=nW6HksRZOWyNROe6h+M+gV/6kKFDsEwQSbdgtNv33WYggc+ArArH7twswj17td9nq1
         LD1yFvRIGNreIOZQWAqdLqHj5k4U/hMI3c+tnrKNHj9Rq4s/dMHDJvdgJdSJ9a/jZ0JE
         EF6bCuHvZuRNFUBhv7T5+QRqjyvz30jWYm+FRNKwQRKTZVLavp2N/Xb+wgcUwGLIHIxD
         xYnm6rbIyS3mf4swcIvEjMSuEiSgIAN1umCyojy8jDImp9CrN9RynFcCk2lMcQVsvXec
         q6Dv9IA0gIFHe4SdwItcxZLQFthjXLD0qamMOSXKEJduPcx4yx7b7wIVMEmahMPndgKl
         rcGQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w505HRBS9aRwuGjmTIATh8FYLdRktcwK9mnorj2//GjAcQA6Ql5Jcernv7glmBnOoAraC1ofp9YpO@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKno1M2ClnXC9m3mL0M0+nroHSpFjyT0aab0El27h7PNIds/k
	wqUggGI3jb8k10HDeJibi8u0QD0fa+7ew2EglEyn+jVA/PVs0AVnC6M0josS/kXSkTFGtFnGR4m
	LzQbj9ze5bQDDmzxTNppl+alZ8LU0jZ7tvr4onHVz4VgFRasIYQa8+tRDh/yMgBm2
X-Gm-Gg: Acq92OFAgSdM4T4mJXXCpu0+zh6xARBe3A/TnptcaTgkmwFvhQkGm2WNrbDedfUIfyH
	DeKcAAgoAc7r2VcHWG3K4u8lkQwRTyXYI7aN+YNejLGCuwg+nwIiP2kNNdKEUd4Po0a3R7kcPxf
	wG2uWFIbDJBKNgJoqjYf6trP5vxuARvqc/YQWCQ6Xd6ytBeRXbUv80nnjPrXmqljpKrb1/YOalg
	Vcv6X6CmcgG3zt0nE7vpTAo4lfr2ou3QhrgMK/FHCA7riay73bxHTrWJhaPtQbrA0ZVYweJnDxM
	e+GnlGEe4HHtaMUASuC0QThR+d5C6uVh1RaKLLumNImfD/+H/YJgrmpH+aHZLvkilvAoaNWREbd
	rKHx7DiOwlRWCH2T+Y4DFLwrZcVfD32Tvc8NxKIAUUM4T2+14ytSi6eIdUE5dYTLHSLC75ADr
X-Received: by 2002:a05:7301:6742:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-30448f32d08mr1184164eec.6.1779435740363;
        Fri, 22 May 2026 00:42:20 -0700 (PDT)
X-Received: by 2002:a05:7301:6742:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-30448f32d08mr1184143eec.6.1779435739803;
        Fri, 22 May 2026 00:42:19 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm529725eec.25.2026.05.22.00.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:42:18 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Fri, 22 May 2026 00:42:07 -0700
Message-Id: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8IEGoC/x3MwQpAQBCA4VfRnE2xscWryGHsDqZYmpWUvLvl+
 B3+/4bIKhyhzW5QPiXKFhLKPAM3U5gYxSeDKYwtalPiSrII7hLcoQtaGm3lPTVkKkjNrjzK9f+
 6PnmgyDgoBTd/l+8Az/MCVbODlnYAAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779435738; l=786;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=GmdbQtXHlx/dL23XiBLsmK6wApi50guOPUdpigkrk1o=;
 b=uEq2iQVWQobLKLz0eITogZzpI7xo1ENKZf2iOIqnRBm0cf4JGxM0sSkjl+Jw3tEp71rHbhsWE
 8DDo5MtdIGuBimNSmLxcDEfD2gPBW2oBnVhD71XePg7n/8mZ35EKKue
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1008dd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nvY0XyhO1x3eZiSlIXcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 9_nnMORCIzPmZzX4tc9WNQVP_ZKBPxUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NSBTYWx0ZWRfX7PyM9rtDo/Qx
 c9Uc9pmigoJzMnY6xUVwYpCVUlCi3o9S4zfa3+xoNZORAwv8NARQQO4LJvmSYKqOde5e81dBJad
 VNOxLo6FdlT92G+Uz1MzEHJOdOtpUuXBqJ89iLvd7nadCicij7EbY4pKSW157qYUcrM4BvCX0uA
 wzDQRdQcDGUJIXBd7mnIXArFIUiKrN+qQsCqeAdRndbb+jQs0kYOP0Mhm0dktvMZw6e+VjKWwdf
 j/PSmiWaaxu2zXsNmrXhPTu8J4V0wi4W56Pu4uzlH6dGbPJcQYGMZCJdt16bzf1QA3qUAB560SS
 MqxF/Dto1bnOJPIVF1o0oltMwU+x+MUemKNV0IPlHO5e2m1YywIItiVd4Qg/I9UiBuUHwJh5M1T
 7FsGsnYVOWpa3+GSfMwilR5CLK4dIgOEX/iAdKb7+DO88Btla0Sd14Ug4B6oqSum/v1sQMqOcCt
 pnywK/fPliJRpOnOL+A==
X-Proofpoint-GUID: 9_nnMORCIzPmZzX4tc9WNQVP_ZKBPxUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220075

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1630 ++++++++++++++++++++
 4 files changed, 1761 insertions(+)
---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260521-maili-pinctrl-6af64dda9a24

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

