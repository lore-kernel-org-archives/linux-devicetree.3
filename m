Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEAD3E6DFA
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846613; cv=none; b=n12jqd+S4CpsjFra2D/s2CTrgtzU0Qkpp2vCTIbJoWn7kLlUh1fTXgfbJc7LREAWMl7tJS4FGMCG3sX11qf70hG8rt0qIezl2bAy5vB0WQ95k530POeMx3IMWYCM5F3hP7obXs0t6OPSdMiE+YLu7ao7ihwBvjY4vy0Y8XW3wW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846613; c=relaxed/simple;
	bh=ts9I/8MVqENlSCKMkTEH3idBu1lg0eza6U8uB5QrNi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eb1rKG7Kmzes4AvGxytlv5aArQ5P+Pf3QFdT4YBBMiSQkylvGKs53/YOvpv0BpkZlagT3ebWGx1Qn9Ol+nkbCh4NMW4gxe1P+Eb6ZHMfiR/w+l8Q2SjF5vjo1AXWlCr4A+uUwdQ9lgyHrQMqN81o22t0oPcKzADv7nxBNHJWFfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AyC3zA4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUr7wdh2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyC3zA4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUr7wdh2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIMlee4147281
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QSLeY19NlNB
	khtzYWsedf0JYDV9RDV4tBF9rhYpoxJU=; b=AyC3zA4tzTTnPXsQIy60YI/OkkF
	iBAbmTxBDOonVR5GYOJkVC0/SteCPfCpXHmS5buVfXVUWknsG8dMhGpYQ7j1HpEr
	J0M354eKrnNaUiVNZSuOku0QoERQCG7Z9JnDLtmS6YslUdyeeybWHHQlWpt9ptIN
	mP3HCoR8AHpCNJmd0so6izTBWUMWu2ggoBTayyAdaXTMPknZZ2Fqg2jGPHMBJylK
	nh4FfB6y7tK5gsQPvhxaAelhzAtG9AvQTUJ8HHSz1OWhsLLnNUAIu23akF+D679a
	3BMux7GYzmyzlgBilITIpXPc9XZnLP9J11slDNwfl+BVwcPqBgyqDXXkBuw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgjhkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c7a84a43eso2906314b3a.0
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846611; x=1776451411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSLeY19NlNBkhtzYWsedf0JYDV9RDV4tBF9rhYpoxJU=;
        b=KUr7wdh2MxOqRzLGCXtSLdfZvpx+5Ei2sVcti8ovOqtwPD6OKh+mLqjNuhG9Ehl0Nb
         BI5AvB4J5x1AzhcoYaMcBQTR9genV760AyQ2iWwORmaSoUd+rlInoX5W4zOkr08TgdOD
         4vtJZRrVykPWKsZUMjYC8fekks/uk9Veifl2b+gk1WZWcmmy9SmPs5asc8qQvvIDqabP
         mTOgF4f7vKZpWgk+aVVqUtLTIAyS2NxABiB5n4+nYODwVbeMdo01MDDloWwM2MHorMQH
         hND8FWqLtn7hO3JvnW41n2Y9zSP6yNQipeg+4AGs7VoSex/NcV9jtw5qaH+nxL8MtWTY
         BLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846611; x=1776451411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QSLeY19NlNBkhtzYWsedf0JYDV9RDV4tBF9rhYpoxJU=;
        b=DZW1yu3yyCIW15b+/0coXun37VY4umIyNnHnPbOykrDM8Yzimi6cA20w+rlNumfaMU
         v4pyKDZyjNVnCDZw9+OmViOkZQaLnI2jsYNSN/PHRe0VvxLOAHnxIFljiRCKB5OwBkkT
         WAX+Lb76oF7KV3VoFKJBClTkyck67XHzagnrWA0Rf7P19MwDcGbVV1G36rjG9llmntBO
         XeHSJ8sS4k+ZJXvr3hW6He88UILZgY8wrdcpJ53rt6NCM9lkgN20rMFm8I+k5Ux3J3pc
         QDkESTvn535arlpLzis0x/TY3El0FVUV15c1gY/1MDyu5UZOhhQfCb9yRS3f75v2Rr9P
         NG1A==
X-Forwarded-Encrypted: i=1; AJvYcCU/fruuHxModN7bFCSmcXGeyvWdAzfi4LO9REhZSwzYtprsYfPfdugN8QlYLeQCWR0n0qKVX2vWF2Zw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/oHMrins7IqNoRAk/dFO+8aq9EG/ec6ed8AFOF0KvD7ojGOo7
	MKtovagqkQFWTkrGqYXz7S4zqbK9QDyo6q+kp9n0zN866owzJlUxazHYc3kVPXd0t8mdG9akGKe
	QAOtJdpKvvLq3LkRPm0Yl86DTVZ7B78VeZOZL6R/1KUtGL21+hxh+87ceIv4T0A3h
X-Gm-Gg: AeBDiesyHoQ0pmAJ3GKQdQaE76sdvSmuobg7w++xRL76NSriBFq3T2vHKMJ7mnZpPgL
	ZDIXS71ZWPDWZOjFgLw4HreQZamfwov8o/+ecXTGgInje5iuOYB1KrIubNXiiNRqv0sIsofMZcg
	K9jHu45Zp55To4tqtie83WuDnhDszBypUDtN75drkNjiA74LD6EwUMtDioRbW2PNKrR7CcRO+IO
	irlX6rO459/3QDahNpqNh7y9kGEaof1spRVx8qWxdwX18wN5oAulCLamJDbTDdQSk283qne+Jo6
	y7E0at5WUUqr+0EkZxHORDNrUvFPKyN6EZD3tALHrAKCoS1Y0hkVFyGQ8OmqVVknF8paR/+4wo+
	kQCEmziEezqulJwJylD7yzmGpikFEtEzoOu395fCPwLNcKKSO
X-Received: by 2002:a05:6a00:8c13:b0:82f:5bc:59f8 with SMTP id d2e1a72fcca58-82f0c39e9a9mr5381259b3a.52.1775846610600;
        Fri, 10 Apr 2026 11:43:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c13:b0:82f:5bc:59f8 with SMTP id d2e1a72fcca58-82f0c39e9a9mr5381212b3a.52.1775846609910;
        Fri, 10 Apr 2026 11:43:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 22/35] arm64: dts: qcom: sar2130p: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:59 +0530
Message-ID: <20260410184124.1068210-23-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: bAe6im3hxWy4I6hC1BJZtX6O5H4QgNda
X-Proofpoint-GUID: bAe6im3hxWy4I6hC1BJZtX6O5H4QgNda
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d944d3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TA-_PxTPx9a9ESl0nAgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NSBTYWx0ZWRfX7F8tnyMNTre1
 KuC6kvfRWG3z9VjQ+Ly4iNyLQHqYQj8OPPww0BQEEjSmEmITGMUGu3zYgYoG9cvjdFLYW8/vx2P
 mUpPxqoanhdTWtdbbFhwWJKy8KfV3JGb/uJeFJ0HYG19XHzBl/pXcdG7vFI2UloCsUg4I5JtWuX
 oSdy8RDEu6rDIlbqK6C6DIdWeo34TglzzRIGKnarjK9DRMMJosl5a81CBQNaeqc7mDVV4TtiFM7
 dVtjDEyAhr2P2BD3scwNjx19ZKkyftWUU/7g8OhPsUDkclzgoob0E8Z6neXYEyEDHWKGDeqUR3a
 ZQQfGuxLtuPdwW8+gzuVQuWIWLOR3arIx+2m8pjt22I6ObQZ2M8SGRcYDJmBti4+AhdELL67Kwk
 TFpTB/iK34IUy64trh+5XOMazG5UAiqBGKbIzHhWIoV2+5yRs7v5BCPouyYDl6y6EPampx2afKP
 tB88FcNXxF9jvmK2paQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100175

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..c4d48f657e5d 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2417,7 +2417,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sar2130p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>,
 					  <94 609 31>,
 					  <125 63 1>,
-- 
2.53.0

