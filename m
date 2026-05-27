Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FAA3EDAD3
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875090; cv=none; b=duerPgZePZc6WSdC9hC3gycajawOJFWWp9PsbSrnRrfY/hNEjqbmuapgoEbpbBZmRvtwUDHW3h+4ez/Ikz9FHDDYdOFnecb6hWKpDytn/nhBzhf9Hn6qY1RWio2V03ywGwgVl1lxkNX4mv5M9EH8bYUFYXapysAT7+V6t/Cav8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875090; c=relaxed/simple;
	bh=P8i95FGbdiJapQaV9WPBprzSehQHwzILO6Viu7fCA7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhTpOwqcne11P/Ywg+sGloDwEmw1ltgy4e68IjgFsE/gTWBG4ITN1Q07SntP0RzgZNe+FHp++2HInpYORHADl0SiLAJadENza1PcSMU9+Ld05jfUD2Pfn4WVQDPKx34mfHHkw/RRc6YJymkcTCYccrp1sGp7wyWAtAVnOVRXg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=litw5UqB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8K2l2dg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="litw5UqB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8K2l2dg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mchc051347
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aj1QzDzphzt
	jGQH1qzVf1DDT5t16Ki1MCYgce32K7mA=; b=litw5UqBxG0ZhRvBeKi8Xneakos
	RWhoavfrYwJFmWR9flDoXRGP/qBaZiNW0bJlr1QPAKlU6wpCPsOrzyruH9xMzldo
	P1iKtCJ1/VjRvrCIUw8kEy0Af+EhYbN3EsFACD0xDun8k5wH4AKv5ufW/axjTtDl
	NsE5Z71vi1Bfj5mJAmtjQbvR6oKzk3ji/GVdWwiacxrsKCJ8c1FdYcVQQsBAVO5F
	kURf6+S2BajGnfrwFdvs+WGHPuCWnf3oNiHUYAZInG/gcaB4DyzOsRo+XpemeTkI
	UsLL70HsctRQY+N4rgB07OVS0DRJPmWkTkd5PEPGLo3jnPK4JQB4JWlwa2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edg5paxfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so127690845ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875087; x=1780479887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj1QzDzphztjGQH1qzVf1DDT5t16Ki1MCYgce32K7mA=;
        b=N8K2l2dg/hrnd8iegLPsqPN43mplIIJkmO57+DNJ9wwU+ng8mZ87pX96uiMAhG3s0T
         wzf52e6/FrP6gGt+9+CYENflROwxFXQOATKLRbdYWdUNnH54xdWgnKGXwxvv89+ZMvfD
         /sRKmrFL1dbbYuTRZ3LiXkWWJU4ie+pCxrBUTdVXjcm0WCc69TPWPlO15D8MQNRNazzX
         u+RjjfWlT7yXjevdPISSK5yup60cpHaHqZaqyVQ/V8TG7jH+Q06/C1o9m54WpHFLgUTM
         MNjS+G2To6YBo/hFE2Ss0lnhEcEj1crJL84wUKFzv+WQo5CuhEsPCKF5rqmrvk5txEjm
         AjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875087; x=1780479887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aj1QzDzphztjGQH1qzVf1DDT5t16Ki1MCYgce32K7mA=;
        b=cXVkNjCYvzTWNkiS826C8NZUnXQNXuLgt6PhqZP2yw0tP2LQ39h7KMBooUnZ8AdZMP
         Ecn+X0VnHvo0LEIufLygGL6i9UFNU5LjmigwOF7Z4YeKCagItsFY5exR/n/gYvjIYEvW
         7HbNDwrPFOM7MpikTLwUmLarvhgNtTfmEF9E73xEVE6OLUIGG8VblThGIrrh3G4nqIKd
         8OXAqF/NTulvDGCdcAu5xXWFPMJnu9+GxOlm8PYtimmFgKYGbMOkk/A3hP9xc4+pcsYl
         2iyo2cNq++druRVRzwPNn/xEueQu421oWnhhQHdYE4mXERjMyXF74ZMOUU3Pn/F8OMcv
         35/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+V6/mNiO7jkpjPes4Mt8zNab4FLtqn6jB9mCSxR1NvrhRecH1owHYg+bMdvV+Z+JbIQpS7plpCEBcF@vger.kernel.org
X-Gm-Message-State: AOJu0YxY8kY823JJAj0sVzSSj9eGQrUkEPBt83dfVjMQZ8EjH/yQ+cS+
	NVvgEkaFAszClTaFOXZZZ9Nn6OE+wJH7mMzbeLnhnMLwM81+9L9HUOQ61YpHtjMMrm0nh08cC4e
	1hmXUYU7eznf4T57cckP/w06o8hey3gSjSLEWWF8Xws3RNKoGAfqxhM90Qa/xYwcf
X-Gm-Gg: Acq92OG299by5lQC3PnF01maCuZC3z3GRav9fhH+NLiH9/if21OfSN9JKiZUMYkR0xL
	VSrWChGOuJRyKf1MGiTaDCPI1lZKk+RW9UEQNrt5tQt2D+l/f6R6v6jznI1LZA8ODChshV9b4ED
	1xRKXNqV/9PI6hX+FsS9THsvH69OGsEI7hI5pae6dkH+wS76ZnPat/tAdAcqujBptkGekyeaMAE
	X0FQMM8UjkqlkthIEpVyDsFwnssWtCNI0OEBZke0uUdQjv/XLiEO3daWHj1nLgDjZvSyJaQq+oL
	xAZ+KKcj1h5xEGOGJuZlmZnL/zn0BZAITjWUNXh26hz3yuMjYm5P+Jy0xTSQVutnVGpGYa+NufO
	hoIbTVhk03gzrc5SjYlupCpWOcIjBDfBGpCxPzeIBAjSkHuPV
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr244336585ad.35.1779875086643;
        Wed, 27 May 2026 02:44:46 -0700 (PDT)
X-Received: by 2002:a17:903:2f8d:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2beb0841de5mr244336145ad.35.1779875086096;
        Wed, 27 May 2026 02:44:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 16/24] arm64: dts: qcom: sm6350: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:21 +0530
Message-ID: <20260527094333.2311731-17-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mjdbfVxqq39BBN-YGxAlDLFYIIM51M8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX2NMzUexHuxJc
 EgRcb/01fUwbXs/rTz6Z8aRJ331RzVZAfZmChdaDRzyk5CW4DvP9sRpN3o/qDahnt1omImjT2Bx
 ATLxW9DS/h4KMd5b0pw1zrfJrD7m9nij84zToFDISApvn9Jlzla7bf/PMCRHcn8GJP2Y14zwh5u
 7H/InExhEdJztjQvB76ZPYK9oAWeEUBGKX8DivjIdayqXt+SgTEsbpBcTepXqxWuaiNzMIjqIEc
 93sdhQEuBsK9OmW06PffGP3fgvOf7UaDzHW1zqnJaKy4UdtE1UpkbUyt1LR8d2LzwN08VauhiEZ
 uPSwWW/qmFtL5ZT5jpbSi0Y6p2Nq6xAl+uKHpDI8JIOAigvqfWeXlLSU2Xm6TdS1p6NQbCqEZLH
 tIKexP+wh6qVE0PbuGQAQhHLcLwgJh/05Ex9rvCuux7FutYlbZY06OqRlR5KGUnaAeScroBSIZJ
 VM8dCZmrFFCXKbtAnJg==
X-Authority-Analysis: v=2.4 cv=I95Vgtgg c=1 sm=1 tr=0 ts=6a16bd0f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=r9b971BMhmv4aBcg7_sA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: mjdbfVxqq39BBN-YGxAlDLFYIIM51M8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093

The OS PDC DRV register window on sm6350 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index d6adf68563cb..fe1750303f16 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2557,7 +2557,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x17c000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 655 12>, <138 139 15>;
 			#interrupt-cells = <2>;
-- 
2.53.0

