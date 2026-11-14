Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663221;
	b=vhYfMohNCWKxnuRYfEY+9y0mCZxchCFsit3L1e1rPtM7trPKcg3JkfzDEf8RtK3rn9C8
	 CWl+j6lymhkL8YMfYa9iTyWjsnaS1RdlHR0kbyynOA5y1vO9IAo1Id14nvOJjALTqU7P5
	 lmkSCAvA1JoSqCbUHUxSm2Op8YYul/eHwjUQnXWaHljsS0u5Ji4gg9kJBY7B925kapmgB
	 CGRqRcbkEcmFglHhGtTr/dSsSUzob9E3BS0Kj8BpbspSYuTH9QetoWC4pbvV3bn28m/tQ
	 9caBHbS4XxyHh1B6kbQzruNDAsF4jGu74URX42KKxltvKSTW8N0GVDU9EXR56ed0jdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
	b=eYf+Bclq7of4zwPucgtP4s0Nny9vOOCPbHiUDufKQ+2Jd5IC7C7akY1AjyZE5rwCh+H+
	 1dgtK8jT5ZIL/EqqgHQw+9wlis2b9oAt0B/FcVi4WhdL7mKftmMUOFNKebbMvdVaAVjg0
	 NnMsUqdEgBt/ggz5fdS40CM/dpVQKNQq6J3kgv2Dr4/A9lr77gusn2DECSpVnRnfq+5gX
	 rlnzqcFRJ922vc2xqm2/vEB8k13phuEW9PpvdDHhSwx6zAMwFNoOsAkAv11ekK6ogysXM
	 Y49ZkJmnATT3SkAvlxFmTQSr+HHyQavJR/MPWb0EIOKTpwMigt0BY9q7rzdelzGCglA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E57rxJzc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPLcLM87;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D8606A89E
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 453D8606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E57rxJzc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RPLcLM87
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wrEm1090071
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NUZ1WVR0lUU
	U/sgz51lkZn9LFadklqZ6tAy41kZyrkg=; b=E57rxJzcWbMfxwa/w6RQtiAFL1Y
	fgfg4I6+ekZjXaBONjBGxqb6gHVcyEyYhM/iPVU0jdvw1q/ONWaC0kO7N4Kq2ZhS
	s2IDvktIHUZb+NzH7vzRTlt4a8YL+MpIIv80+UgfxXNko4hIRUP+EHNA7u1jC9Z8
	0+T9svKKuPAyBDAxpGRzCynlBoDIjYM2HewMOvlR6lWgRQRwq8HjGIhqDqZhTeV9
	Ksd+j+Jr7PL20QFezmNxQQdFI0lVjjSG0plNas5p4yrfhZJUleFf+eigZdJlhp9o
	V2H6GBeR9aL9gmO6X4F97uVyapk/tdl4w44BJ6xflbSUkgTS22O7VL0vJug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rtm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 13:33:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efa29ad91cso1622585ad.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 05:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663218; x=1795268018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
        b=RPLcLM87BXv845Oynl+SJayiyNu+wioRBXyTMXCRgFNitO1big/3nl03RfF8stSrGs
         Ykutw8jLXNN9OINyOABVtEFlljfOttDntXsOgnrFhz35VkO4GyyjUagCVnddjlNh3Ljr
         5V5qaBBdzlsweGttzPxWkSB25RphmA2f4prsBANnUGn/v3NyySGJ/GXV4SAKjv/AxX/F
         zS/y49JRSFLa0jdos1oZf9zGRnoovWdu6yutIrgh7xnHsZehazF9KSAQ46/sGrEGWisS
         /SnfpiFC4TDeyOPs520kP6+KGYOucPEdv91biZAxor/Z3e1j/1r2FQdJYBuHyzXwvyzI
         YyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663218; x=1795268018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUZ1WVR0lUUU/sgz51lkZn9LFadklqZ6tAy41kZyrkg=;
        b=R3+8tUgvbu+vqEl/FE9+/fWqeHQFCpRegQOc+eT7VqiI285At5/FPkuIKFT+GkeVac
         6pNNB2/7seIzpwWoz7sKrHyc+qrwoqwKzjWaU9L4FcXXdaUHkpG7Ho/skV+WHkY+O2et
         aWIlx1ZCBo3yj1MpW+k0Q7euSK4DgMXJTyPftlQSSeXOvliWXllT6dvLehV9+BhwKxIN
         GQ8pafynKFNIURNG/E2NpudGSjBydeuQY/Pq+ku+3a38IREl3+kUeixDOv9Z5nSXHRBh
         fSePFGSasKt7nmUd0jct7rgmoPBzr+iZSD1SCXtjzCS9a3m4NL1Ck8MuaUzwIvsLYCZg
         YGSw==
X-Forwarded-Encrypted: i=1; AL+hErEpRxUEfJbhsm+riBKGywsN/gHiTgwntKqwqXOtKyKPYRYAiN1YOdNuclS/6PZSDqEFfgGKsaRT3Ror@vger.kernel.org
X-Gm-Message-State: APuU4Z/qrUUgeZzwmO4yjFFxZTYvvK/lxKH6R+Swymoo7jwnMj7qVuF1
	FjdYsldC5NS0rPSeO5QNPIeCAEb468o6mgSZEJkdNXk3mc/fXhPHxuGLnSjXwhGfNRPyoR2wUSB
	28WkSPZx76xnll3NEhW9BXjUN0UjNqcvBrJsxV8m2IdsbygJY1ro0GNj1zG/vq+pI
X-Gm-Gg: AYBFou05aZ2tIR28DYtht+Sne/kg09S/b3erHI0nq8l9SQIJVOBFZbkKt7eUgyaUUvR
	5AU0MorGBgu+XlbNOw/xP5FfthoAFyBkNZY+VT0RKB/LNTM3d8xndCl32jNFy0Id16wO/tDTwfQ
	bniifeZqBIxAG5yF6FdSEIqnUihj9ju33goFImiBp5W2e2xltoucv5YV5JALjIbqMZdRXDY0VMU
	k1OqAma0J82NXBGi4V2k1yTFCu5S1Mq9R2HgmFGPAvhJCvSDF5dhifovPflmzityYXY0E8bXUd9
	QvU/V8yQEind/vazLx7jmy+1zMAgEyyrvxxzYrOgt3DHL0wBt4bf7o5Bz2T0q2x3K0G6C1giHOV
	S7dGofvduMETgKzZBTqiYQYJNQ3FiIU7jRfumTmWTBKC+hnR10WmFd5utMqbk+ynzk755wv6m8b
	tA05im22KVUPeitUZwZDTyNkeiwHGUE7ShaWSf
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr53341055ad.22.1794663218195;
        Sat, 14 Nov 2026 05:33:38 -0800 (PST)
X-Received: by 2002:a17:902:f545:b0:2e9:9522:ed3a with SMTP id d9443c01a7336-2ee0de4bfacmr53340785ad.22.1794663217742;
        Sat, 14 Nov 2026 05:33:37 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:37 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/4] soc: qcom: socinfo: Correct SoC ID for Nord SA8797P
Date: Sat, 14 Nov 2026 21:33:02 +0800
Message-ID: <20261114133304.989635-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af86333 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=CRdk7aJQni9bi6iwJNIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX3HwRV7e/ECiU
 eUyRbN+g8Imug7tgyfrRZYbXBxUbeKo5ETKgwtvG7+TO065/04BU2Apxu3cdeSTUnujwe0aqM7k
 /VyfUUA+kOQ5iQ9Tcp2SwLeJxExmPeM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX0PQaJYv3hYVu
 ZLdaKnBB0o64RBkfPLL7AMuTstib356ez5RqPbeAkJU+/uoHiXOBiznDzYdn2dIeXHz6q2CqSZ7
 t1PlwrsQtWWk3LaeO7QooM+bs6v/PnQIr4rHsGoOfZ6w8SgVj3sv944yBHw+P3L9KKNkEKcJJrB
 eS9BDPSuN6+gKCETQ5EYt6l4a5QGabTJ7GTI9Nj1yI/XuG3rrV2RkvaUy6AilGkS1aIqCOCWEVU
 tEXHo+0fL0PhrD6b0CpPfO8sQ+QCom7+hmy5k7pAKvSiyn1ddxGfe9qhh666mBdEySdfWxInLDs
 kV46pjMiNc1/4UW4Pfz6t+j3h2uD4U8y9WqI9q/cH4vcABGbt0mr5a93AGOo2XDvvnyl6I63Fwe
 lVX4i8pDDSbc/yL3eiQWhPt+Cm6T4jm6oQlKbx6vv5HGwz4Qj4WMm8dplgRf6yevJN8NcuYIkYM
 BLukRxReu9/vMSVWQtw==
X-Proofpoint-ORIG-GUID: wYC9oSovDkIddj6R-bIg-9VNRpV1645H
X-Proofpoint-GUID: wYC9oSovDkIddj6R-bIg-9VNRpV1645H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140053

SoC ID 690 is QAM8797P/QAM8397P rather than SA8797P, which is 648.
Update the soc_id table to follow the corrected dt-bindings, so that
boards with these modules no longer report "SA8797P" as machine.

As ID 690 is shared by both QAM8797P and QAM8397P, name it "QAM8x97P"
to cover both.

Fixes: b0bc160c311a ("soc: qcom: socinfo: Add SoC ID for Nord SA8797P")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 68148defb508..ecb4369fd309 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },
@@ -541,7 +542,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
-	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id_named(QAM8797P, "QAM8x97P") },
 	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
-- 
2.43.0

