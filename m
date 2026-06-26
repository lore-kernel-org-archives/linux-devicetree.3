Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269D3CBE86
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452856; cv=none; b=N2c+P7tdF8CtitowyQUkoITgo/BO9tX0E72j292slM4D2Th3hAjHJQ8xM8Nuvs/Ad20Ors98wtBgFX8fyNMl0a6J51iFrshuQZHVvk9wIFbm77ya0IHA1jW1HJqhBfkYzfUpCUnYxcyoT76IFBy++UUdx2J+0yY/GqLtJsTG5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452856; c=relaxed/simple;
	bh=8jf0DFVSJ7Je7k8jHlxGdjIirP4qJF2bbsX5rKrVwS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9XraHAv/STp8Sy2qrdcjjvOkYNFWEWWDMgPKzlQTRvUvoMXltqZg/e2w+i2thoWB+q4a+bVL4xQYfMbHCjPUEbv78eW1P4IKaf+sRxnK48gg9Rf0zvWNBqxPc+JXs5bE2K4UQvUIe9gqZ9pJvCzolkpRay/KnZ6QtgZ8ae1SOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCicYwq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfovpT32; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCicYwq/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfovpT32"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ilqA003564
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNvgU3VK9SqPEHmQXY856VlEiaTf1HoHscC7OnnRTyw=; b=RCicYwq/JmgTtjqu
	ZhWExwsMdBZT7Y8Av1MZVlD+p0Asw+fG6wuRJ39HTXrhz/qrQVwzPH0VjrAPT/eK
	bfxFlk4z3++F/EHR7SeeoLCNjohjVGLS/KTNiRRfIskzKEqoPAV1IJeuTaKBv3yB
	HxETV+18qsjaiaGW0V1km1QHILdZuRuDQwDK/RhOo+pKxpRX8G4O2wIdLsKWvUwa
	PY5Px87LtDvidpnl22Xy5NypP/bP2l9Wi2HhyvTmAi5gB8Dgzmx+sRr3j+ZcX8Vz
	mCYBUGCTQ4znmoqasViY93MseV1YnxtD1QJdnzPJrOPEEWY0Oeh4S0X3uJ6ZDHcm
	xrtI1Q==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8xse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 05:47:33 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8003dfff682so13962867b3.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782452853; x=1783057653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNvgU3VK9SqPEHmQXY856VlEiaTf1HoHscC7OnnRTyw=;
        b=TfovpT32MMxwfFd16coSkVXZ2pDvJVVZiDDYXSlskF5NAHwU2v/MGyQEYSBPmTb4EQ
         1msceXAHG6rkxmiE/Ci9GdTeROvaZGEaQ9iPKLNW3UsKRCq64yfBv+M/ASkOsehhK8Xj
         9cfWiO+fypjjh/Ye0ueoPGFA/DkYvtrU1Raj9yXkA6eYTccNu9wvMwRkbvjyclvAgSN3
         7mKt3d/r3H5eTMX4zIiwYvG70BSlFhLbgmrNgkH/aSvPSj8fBxfr6fdgHn2b5i7PtKMj
         hsovravZr6MGmdT9aGQVrs94M4dOSUQm4PYDofdUdwyx+Ca7XYrgsqvg4P8Pj8xKaLJt
         4r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452853; x=1783057653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNvgU3VK9SqPEHmQXY856VlEiaTf1HoHscC7OnnRTyw=;
        b=FzBz3ZxQfO23lyagNdWTo1EQgdmQ8DMfAwRG5hqjU0muSBZdirElmK75DnPQtTwILF
         bAs0HPzOQ8Bb0zSeiPp6RpzPYOoMrF5EQ2ke992VYx7PfHz4jF6CuPBtN/14nk9P4PWb
         hoqrjeNc0P0oWsgSIwoi2LVsxGJk26rJxgC/KhUr3Kb2gfMMVq3VuEL2yUQjYYiLDY+V
         fUGPneTpuJffhtXz+WV9GGYofSGLVn4IF7/EACXVqrhCoZwF2gQyvfJezA+lPB0Uxpeg
         Z+zgf8l5A6fNw5O0U9KpENJK31xgzn14n3AuOJ+KdrCO30JVrecMcO7jHhONuYlq3Ro9
         zzaQ==
X-Forwarded-Encrypted: i=1; AHgh+RrP6AmnmuZoM0tpqtuClRtpF0gOX71DmeylY30i/JLNI3oYKNnAPr8xcwCjJ1Pt9T1oUn75SEQS6UNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhm0GchEoa2hN1xzdIEeyYIcHhYuA5EjvpwxNZDRtX0LJKEJwq
	nOrebYsA51bQ+BmzHCQePIefHVbLix1SY0m6kxWP16CasJNrpOtJ6dRLB7NgztBY/MDoFsBAQOo
	0R/busHG9yhx/gEKtaQc1Yp6gIPHVAPvnoiTmBorzcdO4pa2YAU4gREIlZiNryA2h
X-Gm-Gg: AfdE7cl/m42WDyZP5NlHvrKYTl3tfOq60dL7Kgn6FBeHHxk9x6D1KdUr3o1A+vKDADp
	vBiQQOlX+IgnpAdxwnchMWU2B/ab3LrQTKCrKuBHjCjHitpxBLx279foEJBCzQ1M0whgL2RsNQ3
	TY/uZefTv5dmL3U9THKcO++qXdX/znheGJdQh2WRdgZSrs4PHMlCbCmrfPVCfKmF3lS4Qxxq8WB
	oK5G5GLCVHCXHUsvxkafFVDiLWnm7MES+5mx2MTftNx6vHm423N+uNdgWAo6IMZwR+43Qv9Z3Fk
	Uc4qZczBSk7VnHmT7M+6nkJMXJ55VDQfBpUUXapUrk/4VzFLu7gBaNFrfo5zH3dDXRNhUheWZkP
	71Nxd5cALlXBSSULkRUV0TC9BXT9ix/fLDkqYJzfEyEcFugUlBnUzZLBohSQMdqAKb4fsI2F5go
	WpIdO5Lo94k+FeXi5f6GyZNj0GTiVSOg==
X-Received: by 2002:a05:690c:d09:b0:7f2:9d64:9943 with SMTP id 00721157ae682-80a6b1aa04cmr56094107b3.23.1782452853448;
        Thu, 25 Jun 2026 22:47:33 -0700 (PDT)
X-Received: by 2002:a05:690c:d09:b0:7f2:9d64:9943 with SMTP id 00721157ae682-80a6b1aa04cmr56093967b3.23.1782452853049;
        Thu, 25 Jun 2026 22:47:33 -0700 (PDT)
Received: from agents-Mac-mini.local (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm80029787b3.0.2026.06.25.22.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:47:32 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:47:22 -0700
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-glymur-send-v2-3-00905324ffbf@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: aJq1CxnKWnqoaMEWzpXXlFtz94d3csDd
X-Proofpoint-ORIG-GUID: aJq1CxnKWnqoaMEWzpXXlFtz94d3csDd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfXxLVBhBhEozC6
 gy874AZE/M93KXl50ZcUAo1qg7DOeokyKSzswI+no5EQIhmFVcvfKED0ZdqT1y0vPZBU4Sy8UPf
 Eq+Us1C6DxY1a4VLT/I/Fd5fU7T7aHgYKNyhX3FcJZjOLftSeWg27iEsTeL1nglFjQHmr9GMKue
 jOvZJUZWQBQiXZ/czOnxy+7VLl7/uBoGYHeTduXCak2VBDzb2Lr5ZVK0WILeOF+0H6afVbztr3B
 nctkV5Vm+78NXzx3Rtk7L2fF4fhk+mcR4g3qAYDQ2l3a0sMvFeq/Q7Q0mXox3v8FNvzqg00Ft6E
 W/bC1u97KRq9f4XtxNo5ui8mifdYae25hLISF+LQVgAUoqsEkAXOmN+i6Q3yQg7ZcP9sj9zSXB6
 o/TXCpWHo9LCOH52ps3oNgk66GbAqRcZsne8g+ojrz968CC8iPg94Nkqn2rpYMHtJq37JGuwzPp
 E2Qn4Xuy+rhzhpw1tsg==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e1275 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UXNKUhSJZRFg4A5DIqMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX6iBDp0V/txJX
 AtLxbTdD/O5ZvuMvj6HXiPSNcjRBwSfV+gpw4+72ooTRY3e4JpaR9Q6lDxs7JKL9wav8zuERaGj
 Nc68rK04bsGsbKY1mW6CZ5KSpuh0TPk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260043

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..618437f5aac8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2296,6 +2296,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1

