Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6503FE341
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655208; cv=none; b=OTEc+laC12VPSlOz6ZedWevS1O8ttNBMhMwHjkBGNUqSrLPjgj2jKfpWzifj8FxqeI/rq/dZ739k63KnM0lLbuiq2NzeDaH55xEJjC6qq0l+uEU/Y8fi/QjwJcUBQQLxu9PxYwReK536mPS9SMaee29nzzY8qmFBFB+vKIAoW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655208; c=relaxed/simple;
	bh=qsMJyaTk8HgUMp6PIBAKLauYZ+N5Wx0Hlr64l+0gPH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LvV0eJ/P67dmVuOJVXka6HzkhqEJ4ernqq/gFG9jCiFubyIgKCl0aQWSeHRZ6O5sGyg5IBKlKEUFAnrCmI0eCT71PxaiS7tSS/WSY9/fDCWhUlUMZ/4/qp5AY0l63d6BFjw2C1AFCyP1VeSKE3DwEOMYytr+cluNJykZPoj5QBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=loU/v0O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx+9th4F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="loU/v0O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx+9th4F"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLTG23938660
	for <devicetree@vger.kernel.org>; Fri, 1 May 2026 17:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WE94TFXH4kX
	yNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=; b=loU/v0O02Jz2CQtsLmIvsqPRIAm
	T08qeNlO2HCXUW3iTN+T/lmvauIKyhxerZV0GM3rjRSURMsE298VzLMW1ZBi/Wmg
	6aJM4KwT598cyaHKgE9K+kUvbrDz4lDRiZzSxoSpXVLYHjnwxqjcHDcKwf9DK5vJ
	WFUUgqLkGzWL7BsZ/yFWnbz2Vs9DUR2BTHC2gE6HczSzd3z4EWQebZqdnMcm0GcB
	hd2o6eDnipsywQ1pDXUCqbNhD+dBj6z0sLVFHQLihZpyVIGSZ5qdryznD7ksSoda
	j5l+h2GGw6dwMRDOqxt9RqgJbquQmZSwGt/QqZaiP8ThJmB1dEcMZAgbp2g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvtrn12nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 01 May 2026 17:06:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso3665887eec.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 10:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655205; x=1778260005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE94TFXH4kXyNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=;
        b=Gx+9th4FvmitBs5ZY9GPD1/dtp5XFUsZJxkwqu5A8esKYfVl5L++CDLhwfrTZQ79gd
         j5yr/wk4yotk7Z6csvsNa6VEI9aWbZY8ANsFvTy8GrEGKzc3xd9MIkWXLhv9t+O3EYHo
         OBXZ0Xrs3LD/EIWg4/GEJBxBwxPbz3GwOj8jWF75l5tuAs5zhqjRmhJjyN2O4V53SFb1
         cphAE2B+nYPLXZ24JkHTsB+NPuJVdTLtJERyYhSRSHPqnA/fyvIk0GSIlff0ZbVzk3x3
         z0hqoQywNesCwA/OWo+WW/boCpapP4PEj7OhaisLMXgoWxfhVs5cTAoQVeswXYMFYCCJ
         gDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655205; x=1778260005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WE94TFXH4kXyNBV49l2OPveZ6QXNRWCGY2DVlIlO5xg=;
        b=qvogtiMeUyQcfHiObpKVx0R6pknQXGqCBALR1cD3Tli+KCm1QgkIcR3frTh/hn9+q+
         BWYtxr2QrBSdwKI/2cIg6Ar915k7KEG0jnx15Qe/sT2LPKOaCKFrHaRZF+Hr/LemBoIc
         8dHIGDBwu6ZvnRMaz5Z5RdNPCR8f9jIIs7DAMvbmpg8oBMCN2FDZo71z9HsXGkmMSsJp
         0AzQ5uUqH1rAuj7deegfz7cUM1drjrzSepwnNlPc1hIH1Xwj9sMNnA/iIcCmPYdg0AFL
         ke6/03NaH3JNdw8QoKFpl/Ye0HKy4X0rZGxr10YpO2Tq+QBVPlwYjwmyMwxdKRsi/xh9
         V8Jg==
X-Forwarded-Encrypted: i=1; AFNElJ9bhC3Xvo8EEi59CmSqNjN9TL0mqUT8B6nrzNGm2dG+k0JLqqGgT4uX1Uc/XvgQ139J0s8CK8paP2TB@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ2DuWKBJTKE51aQYEa5WD0tXYSDPNinDBtIuouzGGMBHPtqBf
	0Gm37m3y/gLJAkR1YprJI0Sr3ac8YhqCgSB2ftRFVLY13k7nWGMuHbr6+xREZWvSOqGvXcN2I8/
	ok6OKoI3BSLTaLyvQwvm+vwKcgrEWN8y7NgmuBW0fcHBXUabNq4X6a27KffJzbbOf6PNojbSr
X-Gm-Gg: AeBDievPBcoM2aRUQIX/8RYnatBaW7bs1Cjr1vgQAZyLrjxTrbJxNYVV1kHGvHjOzWh
	uFObnfarfIuWvd69ZMGqsQKx3hHP5qlT0Xz/bDg/Nn2+KFbRoySJUD9baH+p5eINqXOOAlXLEMt
	q09APFU9Wu+ac86RNYVmEiBsOzlxPMX8/PhEIzSVoPrye8PZLZdNLZgbEVVOAyNqZHBLEdKYz2V
	adb2WeIpMMdgwZ08SRmKwrbrYxjhj+C+4bpcA/7dLQ4lEFB8/EeBipbczynuB5MN+GYm+2dLT3P
	ujYpQIpcpY7xqIffshF8C0cULL6MVJG2laT06OrtNo/nXNzvYgIk0Ye84Hz9VANsN6N2LNmD3Fx
	zrBP1NoIU9QeOc6W6MW946CVjMIoNtiGhUafKoOGB4GA5Fb62SRwJImrsL35vEVWmJsZBlDmyK9
	FSGmrU2fASoA==
X-Received: by 2002:a05:7301:5795:b0:2ea:d965:a4b9 with SMTP id 5a478bee46e88-2efb7cd0f64mr98229eec.7.1777655204361;
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
X-Received: by 2002:a05:7301:5795:b0:2ea:d965:a4b9 with SMTP id 5a478bee46e88-2efb7cd0f64mr98206eec.7.1777655203669;
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:43 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Fri,  1 May 2026 10:06:33 -0700
Message-Id: <20260501170635.2641748-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dINk1muAz-nJi7H0dQa1xe9U3rNpU3GS
X-Proofpoint-GUID: dINk1muAz-nJi7H0dQa1xe9U3rNpU3GS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfXyKc/xP6i106S
 SjJmQZMtq3SM7s2DeMK/h38s3tIplT2eCsvS33VsenT7MDE13FuRntkPqStPv16kPpAmgAgcAh5
 7LvME99VcAFwxZ/OUaetcmj7sgvrxOWeEsNOFwiSlg2nUICp60aVbDHGNhZfBheGlRPEWEBZXPg
 xIdRzJyKLjvWnRRj+gbzvjdWvOSpfzd1WVN3PEO8hjxwD4NlKEX2TnhYcGjfe7OTuEExVcZauik
 pT1DZjWyP1eDfSneID9MvSvDJkwrWZqwPQ73HAQZAvMFtQr6gXGpRs/2ba4r4kqGgn+yNXv5/Ip
 Sl/0KvIYQHq2WiWE5Kej0mSCSiLYvO7kNr7YSGWEKsywGKXIoeMCjC1EuCtuoOL8uVjpxEJW4si
 24zYPdx1aLWwhOymqV0vMLxODlTFGSVOUjjK+q/Al1QLULyyhvnEjGHyctTyUANt6VSs+oaNt1B
 OAifSs/H9AVJ0S8+mHw==
X-Authority-Analysis: v=2.4 cv=KrZ9H2WN c=1 sm=1 tr=0 ts=69f4dda5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=oDIJ3hVRoRHbvujwG_AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 4734b6307a85..187cbffbab13 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -320,10 +320,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1

