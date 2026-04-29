Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD88390CA2
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444874; cv=none; b=lSoQHAUzVFseLkc+BD8+ffFVPFQletqKM1ZtQ28QOwV00Zz3NGy71kEIGz8paKw5tDHgrY+paNhrA61KcK9ab2smWoGaqL4D0/SXlU+zP8jONBQPyoJbsHOpOf1chm1fapQ9KsNox/8l5XTllLSDaXgJ0EzIhSs/Jk6mfXG7cH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444874; c=relaxed/simple;
	bh=wVHD1RjHS5UuqXjH+lCw7MpevrJLujQjFsdBL+yeDyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0gU6qSPTgf+UICMsBL1Ur1CgV/QO92tFp9HLkZK7mcAoxqVo3nnKtWcFm1jOrvBJT32GtYSUYu2gIHwybIMCR12QzD3A/8AQy4hrQ53b1Ng0rLzizxeN8GspYVFsvYaH5yrcsgQGLV3SNvkfYxukwPd92kwwae2jWLTybrciRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ia7g04Nd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGxMnoMD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ia7g04Nd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGxMnoMD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T5HcNe418930
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bInKs8+UiDI1gsDHlFSL4hnliYMScur7ejWLpmWE6L8=; b=ia7g04NdbDj2EulR
	PWjT/4uoFrgnXKvpFj/3XZ/kO6VU3upCjHyzX82Fzdjb3ipjVERaQfdaarx2qNPv
	buQJcZRXJiLmbOx3mzEjZlD7FCFqLqRnOuoGwThGAXj2aLq+mY2zMPspRU+9+m64
	T16JdAB3ykurX174hotUh88AUhx+7QnyxX7zASUF++hN7zpo5x5sN3IESqI63ayC
	WodMoih56M0MLvNZXhnTYs2okZ8b0sJTK5/9K3LztvQwzxkPfkP+QYMFiLWVEqJu
	E9Ja/iMv1W19RouU2lKnexXXJztoaZ8rSKqmyej7+M831BZ1zpuiLEa4fKPWtCvx
	kVldIQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dubq9g8vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:41:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c799ee56bd6so3641917a12.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444872; x=1778049672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bInKs8+UiDI1gsDHlFSL4hnliYMScur7ejWLpmWE6L8=;
        b=EGxMnoMDFaVB/m8D4f8xuYPRNbGM+59hKysuELlurXlyFPR3bP0o4IimFpSb52nfFM
         lqrkd8NzN+pi4/9Qe04dl1L3xjl+9rXvlMGGU2vK7ajpR2RxbGzoDVAtxqwFUa1YvCvk
         0lUuRvYltMejavLuSSh/qf/oG01kXHhYqpgDyyi2sRfNELaAw8zj0TES2LkkSbNCEg2K
         N1MJT5lTeFR1+UQRyaWXZkhGnqw+zDVd9gm0Nk4HcDxa9tLh1wg67PMGgrws+0iO6WNA
         YdTqoLktlp+uJg0mGDj77GBiO0VjVmd/zheHCpm6aZoSP+LW2wnhAq//lyFR3Qu/gbqt
         QKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444872; x=1778049672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bInKs8+UiDI1gsDHlFSL4hnliYMScur7ejWLpmWE6L8=;
        b=J9nElWtj0uKDt/i1tb3vPZUGrKOJtQUcyo4RnDgLKLXZPkzKAN1fKa0CIkDjU/6gFF
         E9plomKLHyYe+mscp9NgD69c5aNl2nn16a1dboDI7SdR6leVEAkgN20b1dDFRPsAtxWK
         pZtWS/L15ufcMpArMFkScZNlZ8tPbpNm+tmYeNoxUtOIgyMpUZMVl51/AjwwiOOabljB
         jdT81Ha4E9EniCr7fMDbF3/ALXSLkjBQNhI/gb2n6UN2Z4V4O5a6AGu/8UHGn0JVhJf0
         1xeZGfBjorCywx6HhDS/cBWF1scJtjgb0eZAFEPGcB3/QS/BnKdyLdLwbAgirWd5KmeR
         Sqgg==
X-Forwarded-Encrypted: i=1; AFNElJ9FTnYdy8Aaw14nLcFvM/mxtcfD6KoIjB5WNeIsdOo1O4rTYZfmoSDTYeL5W4UVB3jDpzmI8vlXO9Ll@vger.kernel.org
X-Gm-Message-State: AOJu0YwXFBH0UldADcF42jyODdtG8Z7Tlw6wLOJezBsrDJUsLZgE5875
	Eh3wScKHdYNSXLOrhpKk1P37QUU5OHCP4Iugh4Q0H15/8/IzHnyC0Dbt5aVlT8B9C1048WVBb0c
	mnH/+PPs3kS9/ymGrn661J5k76yAyJVnWUoKsHlSU1GiU1H0XaCzfUnEOlOPb5oky
X-Gm-Gg: AeBDietjthhsFUYNwjQybXqKoKOWfnQULIcG5q77DJ2KGBejsN9J8fWzy0oG9FZkln3
	Jg9RkdPEYBCfQszbtIt3cv8BwpJ0oha/Oan8alWfRNfeQmXLmdIzJn2VCQ5//LHHlP23PtKS7Xh
	CU/8rp13GWA/vLdsH1bDM+ggdXL64Tqf7Qpsw6jcjhCwfVpR1uc2dk2C7UqXK3GCFxVNmD5P36o
	HD9wygniFxP2c4xP/bVz8O690tsqVYypjE7rSa23MBqSJPkc2rLXJ3KpdTGCSX4NkZH+xYRbUgC
	LvmULXeNu6m6iSqNKA5j6Si8652ABqJpsIu+NbqDu6/ImyogZIoxrBcaeqxCDLWEJ1UW3BCFA5k
	/gyof1b8J6TvqKYCkjHb4RDxwCD6Nhe5g6+CQc4F5Plo9H5q/V82D9gM/mhU=
X-Received: by 2002:a05:6a00:8011:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-834ea66ffeamr2684290b3a.42.1777444871683;
        Tue, 28 Apr 2026 23:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:8011:b0:82c:f035:6748 with SMTP id d2e1a72fcca58-834ea66ffeamr2684269b3a.42.1777444871236;
        Tue, 28 Apr 2026 23:41:11 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:41:10 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:10:42 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: kodiak: Set up 4-lane DP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak_v2-v2-3-c3a703cc30eb@oss.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=772;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=9Q4RU8nmIcUZ/sSbZK6FzeP7TARNmx2z+JrnCArQMXM=;
 b=GIhSLXvYZEdY5w3FpyCWi/YoAnFFLFjbk558thplF2J3qZcPcdwFRnXBt+hdQmQA0jcDQDWqM
 Rl3uqBjTxNLCo3R8R/fZFr+3oihVEoXykbR2315v+bEnK4Hg5CivTN6
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: omvdSZ4Pou7CH8sLVOEm8T4ihrRf1uch
X-Proofpoint-ORIG-GUID: omvdSZ4Pou7CH8sLVOEm8T4ihrRf1uch
X-Authority-Analysis: v=2.4 cv=Wak8rUhX c=1 sm=1 tr=0 ts=69f1a808 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=80mdcyaeAbIWh__BInYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfXxKfo04493+SE
 R/ctOMnnKqc6/YZYwWmC96s725wh+mHWckSpjqYxO2IrWLdr7WWtBHmJs7JSTRZ1j+lWM+uu+NW
 Uw42lVzh4nxswAJyZO+u4aHj4kmEEE0RH4TP7ZOUxu/Os3ii+QNgkGc78RiGhcKwrYyh+H/9Cb+
 y7AEZMyhk/tnG2z7AQ/ahWdV2wBKwod9/PuzA0KmUfr0lRHowUYlLRbm5jghKIjTlte5RC3XW0N
 7lPtuSCIP2PalGXfDlHrEhzuxVOKDSvmCD0o5EEOkoCWHC4K+v7IKDk6F9F+DW6EzUul6MeVO2B
 whOmwd8u5wQ4nZCSraquyMYba2OBeee2u18kiUh8xppvyrbiH9xL42fX/PAtRz2dWt59NuNx5iB
 tHrw3M7YnGL5ljxSJUDmJQ1EDza5tUy7lrkVXOBzmJFlEazjpZVvtKBPEVZtzVpxFq04Kb2memc
 KHQGoBah7T+JyZ25j4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064

From: Mahadevan P <mahap@qti.qualcomm.com>

Allow up to 4 lanes for the DisplayPort link from the PHY to the
controller now the mode-switch events can reach the QMP Combo PHY.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 0acc6917d7aa..204513a6bd89 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5704,7 +5704,7 @@ dp_in: endpoint {
 					port@1 {
 						reg = <1>;
 						mdss_dp_out: endpoint {
-							data-lanes = <0 1>;
+							data-lanes = <0 1 2 3>;
 							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};

-- 
2.34.1

