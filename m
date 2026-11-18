Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007335;
	b=GPtj2tH3jkgxOEZKcD4XIE/VCAs27re8fRHFJmy7q4ftEzuhFvv3Kjz0ABv7RtVNQNAF
	 EUL8ab6QsiFOcR62idahpU/omICgrSV48+JeY2TjHk+LZmYdCI1TqsfV3qhOys0yJ8eZk
	 B/3Y2MnduKJ7UCVTKrdvNfXMko/m4+NC0ylhEgtj5SbKaTj0pQjJG1D/Mv3u/wz+8owQC
	 B5c8mELvXZfI9rF6aGcwk1rjHVhRX0hhwsH65GV7/K+IAXoE+z6aZeTdSDmq4yFUyqu6h
	 b/zTCeHFRilzpPcwPoBrZMUwpyCjXbU8oJmVqZ5mx6Ofwm8URQioOl35qI4LQpC+h5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=;
	b=J8ZGiXc9U1um2spi4Z07gMAzGkhJoe/291Nzp0S41id6eizz6MGCXEfXB+gENis6+VSN
	 UySyuUBmiEFyHkeOINqEFwpAnO4KvvHcrfN1xTGpJQp62BE2gY8y7t7J0cgrwDR19fjSr
	 3pzSu4y/HIVCLJ2RGbV5K2iJ8BkrQsJPSGyfdc7HiEMBVtgS1BIDkPF8lXbnFHMJ7lTN+
	 dSgJ+2xVP7kVikT9GBV7MKs7YPv1te5XcsW/lGbeq6yjSZ1H0nQWuDUQPR/eNiUfIB6B/
	 gaex/v36ezAGUihD/D2kNE2dGZ96FdkjV3lQR2/s9t6cA791/7fl1zERidcTHjvPsFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7ml5cgO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViHDzEim;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FF7606A332
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FF7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S7ml5cgO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViHDzEim
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AID5jnJ3402161
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=; b=S7ml5cgOh9eF92oT
	0Yyfzgj3aiPQPac/eoCJF0EBk8w5c/rdajTuskJIq7gFY/0Sb1+KQCh2O6zXVCQ4
	NJTGtwF5i+/KyQRT9H1jfk3SU0XprPJ7C5Y+g/rOpfjQA0lu2bXFMemvtgb6glWi
	jrxKfS/aW32fleXr0O2Gr3O7Ceam4iACzWEYJk0OSgB0Mlm3N9RTd2GZ6aRZBKPW
	P4BZD5XjS5gNOz8zOLd2jD5AfIY2ZZZyQuA/eNEZCa9BjZE4SIGg/91oqrWIS1bd
	a1Er3HaEMhZFwnMAyQn0eMTFJGYuSao0m0npokSpMhtHrgtb3jJMaNtezPAS78w4
	oVzF/g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8k4kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:08:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3b5f4c4a1so95188a91.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007332; x=1795612132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=;
        b=ViHDzEimn0yiTzzEOfIz3d4SbAmsQPGNVea0Tq458GkpI6Tb+IODDm4Fcad4Zuu2RD
         ePPspx82ps+Tm1baC0+rBtzwDya5oJioNW02R2kyGHiWBJIijY5Ly+7Mb5zcx17di3Hy
         Zo/Mh1NzbiTIK0xwZYmIBEyR0V0QWXSEK60xFoj21AW+nMwOBjzKK11d3/GS1jzi3n2D
         6xg2WPgP27FVwcicbn0mLchSdC4IwGEG4LdfqK/BoURPp5hZJz2vUZJcSyjlELyjbF0z
         E8csDAnmjN+JsIQ/OD9RDmtXwRWyUbbiSMwmi86MDtRk+FezgYy/1BWCDv70SelKpg2n
         EV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007332; x=1795612132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwWJzT+CNGMBrEdoIlyyR+008uz6+/iyQlSYxDP77N4=;
        b=15AZAIOGFWRzpc05mQ98PCYkCY3zufuMwcC1dmZXltw+JC8zI6Ugnts/Z0x8RrvHBG
         tLkXdZTfN7q/0wOdJ5AEcUo/o02XW5hNQYdM/Cof1OYt5QyEsssr6RoUwa491V2lU9ah
         pB2NkBIWx+NHx69moXaaqlF37dguCVfNL/RZq20xf26Rep86lwXrm+gC55l9TK5MB0pa
         ozrATQXnZZ2696ZgVYhPZv4qXCXSvdX9DRd4mLYyZVvPVqHxjhq7GhFCMojrnSfuYLv/
         5/LgVAxi0LJmzjorCtz6LO5eGZ2Co7SOpYYZ1eJ5UXcJQ47Z941vXNJ1DZhv4NfQLET8
         lc1g==
X-Forwarded-Encrypted: i=1; AL+hErEabxXT1P7Mvya+bo1qcHRM2puDKkxIBvV1a3+r0s1rPMjY80RfJHWznpBFvulh2G9hNmhBnEOOGkuW@vger.kernel.org
X-Gm-Message-State: APuU4Z9DAw/b57YjO9uufMRzuup5SlcGLubKLkfzXcX7uGL3cmWnuaAs
	rkVOBHxalbYEK2+Mpi5IGLABKSxTI1qJOI+IlnKQuReAKzEObMm0+my/NTiyDbXoX9stu4o/zwh
	+8jVFh7UkgpjpocAEkZgcW/zmCHPY9Es/RrcCjEHjFBJ05PGa8PxGijQSxPyWu1rx
X-Gm-Gg: AZFdTZeMIZK5oR6d6rWmRnuUKmo8cL9UbXEGYliefj8iEbXXGzTvRrZsL02y1E2aQOt
	elxkEtmMbbClfN6PbBskcQGL7ff7S322+Cubh7fcpmOcGtNzQpXyjjHcaf5V0hIREZ3tjk+05F5
	0UT3EFLXFW7Z6Bplr+TywIGdHZt4HU2zMQ7eZSeBZkeRFgRGhcr4EBWvpesJFaPaKax/tICTsRS
	IGwzCigDUAlRgvlJrKDslRdbe/stgJ9/vuXgBbIIzjyMbt0b3pDlB/E681uu6Edc5K7uyTzNlh9
	/neSoNtqzhJyXHsWGMrjxSVWSn2A1RSM/iOYyaQ9GqVPnLUYt6RtXrgE8DUh/zYZOJORHFeDi/A
	svHnSajvn64KvX+vqzTwACbeYiSSZrGG9Cx2FdGOocpsLLzacLEdRmy+BxGAbeFiFYNFrELsRNN
	FPkn/jER5a
X-Received: by 2002:a17:90b:4c90:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b3d07a0068mr4500189a91.3.1795007332237;
        Wed, 18 Nov 2026 05:08:52 -0800 (PST)
X-Received: by 2002:a17:90b:4c90:b0:3b0:9984:18c6 with SMTP id 98e67ed59e1d1-3b3d07a0068mr4500143a91.3.1795007331730;
        Wed, 18 Nov 2026 05:08:51 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:51 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:26 +0530
Subject: [PATCH 2/6] drm/msm/a6xx: Don't fail GMU resume if the GPU init
 regs SCM call is absent
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=2583;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=Ikh8Jp25ybn28MQXj+X5KpMXylrXqgcLJNRSS0C2Amw=;
 b=qgO2mCSHBkMT2IZBJ4y6YVMtedj4fnlA8tElxBtxvVLp6Reyfv/TVy5jdV0nrJFJfV1l6IXlk
 uBOXs6Y5cABBO5P042Bqye2Ak3nnTt2nodrQ/XoHE775VoQY9kO0i1q
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-GUID: rUlbt6LA9S4RNgF3PXd6tl2At10On2iw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX/db+nzMUDSly
 PMf2bw4ubKa4dJpVbiGzKlr/1YWKy1DEr8HzRT+KiCJMjEDTm5uQInWkNWkUSgVq9XbcTW85Fey
 Yh5iJ2t8e/M1jqfB98rLpBW4CjkwYys=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afda365 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cHdlivVmVl0iieOMt08A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXyQZvXXIyVus/
 MY7juWHhGr6uaIjs4BQDGvwHyW2NyZx3rLtQvvT6qZhtvrbDzXBaq+sGryRBSc8TylYMyBdQ7t+
 LEoe5pj8mdr8wn7mpAPgYvs32j9LXaBxqL7aV93nJ/FxYFvfVGnJPmMyTr2E33k34uUK34hcVXg
 aqAiO3Ib92YZAeudqXidtnCDOSlGipy5ncTdu9kh3VSjC3nRok7f5WaCUk66wk0Kfesyxlf2kxO
 SNKW6JSTuXBkzN4cEcO5u8ir1OrqMkCMU3edzx1QBVh0a36SEYLjxbrLJsADPNWS3wntIPMHP3q
 nlbbcUD9KhQhty+FaIKmbvV8oVMWxTtDtFkauRcRpvwSjuOYO9tQmdCpDO+dTk9Q8GTKRUKOIuP
 KMB8cq/kaA7PifTtGtDLOPXQEx+PVXdnOQ/T9r1R9aD8WrKc0A4aDv5G2IBI1ErYEuWZ4LESaau
 WNUBH9xO62o+LZlB/iQ==
X-Proofpoint-ORIG-GUID: rUlbt6LA9S4RNgF3PXd6tl2At10On2iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

On A750, A753 and A8xx, a6xx_gmu_secure_init() asks the secure world to
program CX_MISC_SW_FUSE_VALUE through qcom_scm_gpu_init_regs(), and
aborts the GMU resume if that call fails.

Some platforms have a secure world that does not implement this call.
The call fails every time and the GPU never powers up. The fuse
register is still protected from the kernel, so the driver cannot
program it directly either.

If the secure world does not support the call, skip it, but still read
the fuse register back. An earlier boot stage may have programmed it,
and the features it enables, such as raytracing, are then reported
correctly. If nothing programmed it, they stay disabled. Log once when
the call is skipped.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0fa2d2091f3e..95636dabee38 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1249,22 +1249,31 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 			goto done;
 		}
 
-		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
+		/*
+		 * Some secure world implementations do not provide this call.
+		 * Skip it then. An earlier boot stage may still have
+		 * programmed the fuse register, so read it back either way.
+		 */
+		if (qcom_scm_gpu_init_regs_is_available()) {
+			u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ |
+				      QCOM_SCM_GPU_TSENSE_EN_REQ;
 
-		if (adreno_gpu->info->a6xx->clx_tbl)
-			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
+			if (adreno_gpu->info->a6xx->clx_tbl)
+				gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
 
-		ret = qcom_scm_gpu_init_regs(gpu_req);
-		if (ret) {
-			dev_warn_once(gpu->dev->dev,
-				"SCM call failed\n");
-			return ret;
+			ret = qcom_scm_gpu_init_regs(gpu_req);
+			if (ret) {
+				dev_warn_once(gpu->dev->dev, "SCM call failed\n");
+				return ret;
+			}
+		} else {
+			dev_info_once(gpu->dev->dev, "GPU init regs SCM call not available, skipping\n");
 		}
 
 		/*
 		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
 		 * firmware, find out whether that's the case. The scm call
-		 * above sets the fuse register.
+		 * above, or an earlier boot stage, sets the fuse register.
 		 */
 		fuse_val = a6xx_cx_misc_read(a6xx_gpu,
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);

-- 
2.34.1

