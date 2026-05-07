Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE6233A9DB
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135001; cv=none; b=C8FisMV+RWSeyoamApcskPdVHboxJyxSrfUiXpAa+7vK5uECxe/5bllgBxn0oXLSbdRSZ/vjU4+HnU/4PCf00hHPMizFBOsTBTI5xkOq3BymTSoGJlt7MskmSO7HLmji5iGdlq8um16437H/SeolfYa9qvOv7H1jiHadA+P3Z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135001; c=relaxed/simple;
	bh=Yl8k4IkXG93Q10ouFwMwsh/vm8vRnW/RaSC/Y9eSn4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A/E5Fr/5qZWSdmV7sgCW8STqwpL/Op/v7+TaJUDjNKD7uSIBFpqwPJYOTy2SSlazKjYL0QuHEntqmUEISWjq4UAuZu0KiOs8pSXgkaFeg1XtMWfBcQT9gwLih3IvwlzhpLARYodMtxNgdNAdC9qUaA89l4z5tK4zj6P4CR2FxWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cbc5IjMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZZbWlsq1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cbc5IjMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZZbWlsq1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647444gR151029
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 06:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i9uWI5/lasx
	6W7TVmUmXkz+IrOXTCg+uMGmg+AQA+9o=; b=Cbc5IjMHJHhLGoNEo+vRevkBn4/
	o4Kwq/6NgQfNjIi5b/PX+3DG6j2BHNDpNVMhhinPqKmd3d/Ts2UeKdelMEPPZ15z
	tqmaNK2ogHeJhdFCrG/H769+ari3uTiB2Ssk4Nzv9H+84dd0svx7MdH85Yqu8C1G
	MDXj2PWZ12XC9Tukupc/Rsi+F555ZFQO/brGs+Tth9XtELHF+ljEIhOG6cq9qx9S
	ZcZdHqLLwfLLvLqbZZhXuNfjLusTgqKVzxcuTliqnwifwG8GhfnlQ5Lxwp+vqzJr
	kwWjOPV2C3Fq6Nn71t294h4V1yAANJ5xIE71MNrrRxhhO/ZgpJcCLbqodyQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctre7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:23:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so267774b3a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778134997; x=1778739797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9uWI5/lasx6W7TVmUmXkz+IrOXTCg+uMGmg+AQA+9o=;
        b=ZZbWlsq1VETnR6s80cZu3a7HqzvulYd1TXvWcvDplMX2nvPbpMhgNorur+zeQ6lmIs
         2DUz3cBaen6v066n3aBj9qZYg8OyXU3G5yxNdVmZlxcoUZGT+mmUdeEbI7diwmtXvObu
         rR8oJWG2B4Bm7S5NDzPWUyknV9HW+vR3PcXOIoGvFPiRU9dgaxQfPTHDemXaDrg/7GBl
         WRCBIQPZrjJA9GyPm62hWEhj9jKvVPe3uG8gQVGpbC+ApOjjilTK7oY4Lc5Oc+OXZBnP
         WgzpOxS6bxmkwM6gWAAUXUYNsKQoIR+8Uv9dCG6h4ex9S0/ZfcfzeJvxEcoLbL339rb/
         h6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134997; x=1778739797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i9uWI5/lasx6W7TVmUmXkz+IrOXTCg+uMGmg+AQA+9o=;
        b=LYmlOC0QLKeS7ibmXRXVqS1LoSCnxXRsYLgpTsHfU+woquBqZ/n4LFqWZCHGwizgQl
         O2CnayRpOwnoaIywR/it+qiEmbDIZH2EyWCq7cAdqrsyflifnGGj5WKIpMj0pgPg3kFx
         uEKMzGczdUSWe6c8IskSYoGrl6MKuc2TYRj0sCmW6Jn6GTgMStqUaAoukoI5GScexO7m
         jiB/W5U1jq2mshQkoSpi7L/+Zp3fQIEfRHqxPCWDVRz267PsO6pTV84QN50UXUAr3aZK
         d0/6tWW+wQdDhTJ5nbyAPfMsqcPFjvAQIQz3B1Kn00YmNI22iroDxnVu3yOy7NQ5Ott/
         ffOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TN7vuCii/8sA4xWvTVt+9TPnI1bRDTAL/twDfhkB8yk9LqxQol0wPIaYZQXylMhnrziPmuAfFUTHx@vger.kernel.org
X-Gm-Message-State: AOJu0YzI606wwSBjoyb4DkbkYaF+MuqcCG/mUCgp0l0ZYr6dUWX8HZXI
	QPfXTTBkWuyIqRQvLnshtBU+VyjyLg8Xo7kY5XfX0g94P3pzOIZcW9WVIo02Rh4XRX0JYgy2gCr
	Yjsf27nFP8DcY5YvD0ZToGyCeFsy4bxf8Fnatyzfp4BoidvdEqAHIDQJTTT4nQH5e
X-Gm-Gg: AeBDieur8NtUu5r9DKJyjaAzU0uPivZX0Tyn3x7W6AXKlXXsDFP/NsprJnVlEH21NJr
	3UOnQ+Ajly3xveu8s9a7NqI4JX2hlYthp7yD7vspwUyzAXdTUzkjRaxflpFjOSoOG9ttgh3qxBl
	CgpJWFTJ1boWMJh6NIofktGpHh5aGAIjXBYHDgHxpJkD05Vpq4IZ1XYCeGwzSJt+M/bFHmm9O87
	597Qh2FuoPddPVPhy0uU763r7PeLhZwTGBAa1q8EViwEntpqAi7cEEO2hxmpAv/wJNr4BcTpd7c
	EG8E7lMNT5OkZrKOsTIyeVd9+gcoQ4wNKUwt5WyWTu0gIaWjuXd9ljaDFbxYyFtRhmqglhYuhf9
	5ZLo2/Swf7ddJXqndfADAMNjoQXFTcGZdroNo84oBkDOKGlSatPdiAiaq2JhvL/Ic5orZ9xrXzs
	Dr33VBgpt70CMl7iUsAb/Bft+VCPNTA2sVfF588Se30vUrOfU=
X-Received: by 2002:a05:6a00:39a5:b0:82c:2205:507d with SMTP id d2e1a72fcca58-83a5dd5bc34mr6085693b3a.36.1778134997537;
        Wed, 06 May 2026 23:23:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:39a5:b0:82c:2205:507d with SMTP id d2e1a72fcca58-83a5dd5bc34mr6085657b3a.36.1778134997009;
        Wed, 06 May 2026 23:23:17 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:16 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 4/8] PM / devfreq: Add new track_remote flag for governors
Date: Thu,  7 May 2026 11:52:33 +0530
Message-Id: <20260507062237.78051-5-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc2fd6 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=LlpFjwiIyvKxJCA_QE0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: bm1kZF5N8-ghblhw5JCITC9zXr4-Eyhg
X-Proofpoint-ORIG-GUID: bm1kZF5N8-ghblhw5JCITC9zXr4-Eyhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXww3BbsqqTQD5
 TSVNiGABEPg29p3Xu5jXO2zHjKpuylco2b7K7zOGOccbV7s3/eEfupEiVtMBCfETVL9/CXPVlD/
 4uquyvIzVybaCX0w9hZJbgrsBxeEEPQngc0HMw6avJ7xjdkttVHoiwrSt6600qvfildcadhl0u3
 4KkA8d+WXRB+T2Ekt1mLk0Noo27Ji1yBYmCmkZFhelxtLQVjBSBvxioPXlWFf71QGGTy1xlxdRv
 Q5QV32MCeQoMm+YSL1JADkC4Zo7VHTk4zi1ZYbki3XOQFy+nlPh0IkzK1mf88WIPxnOFTFmHJ56
 jGoYTDyB2JCS2YxMllozAhG2D6Cl0X4xG2EHFwsdFV/EAEopsJflOlHum9M4ijhM5/bFZP8mGWv
 pbuJptlGK2QobC8p2dj/vv12j4ojUtoZHMBBc/HrzLh/DZMAv9XBpeqtBBMq+pSsH9urEdnl8Er
 nA44KeqGqNgMSxC5PJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060

Add a new track_remote flag for devfreq governors as a pre-curor to
adding the devfreq governors that is responsible for tracking
frequency changes on remote devices.

This new governor flag provides for a way track the remote device's
frequency and keep the trans_stat data updated and skip the frequency
update sequency for the device.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 drivers/devfreq/devfreq.c        | 5 +++++
 include/linux/devfreq-governor.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
index 85e937e321e8..e0272078912b 100644
--- a/drivers/devfreq/devfreq.c
+++ b/drivers/devfreq/devfreq.c
@@ -348,6 +348,10 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	unsigned long cur_freq;
 	int err = 0;
 
+	/* Frequency already updated, update trans-stat info */
+	if (IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE))
+		goto update_status;
+
 	if (devfreq->profile->get_cur_freq)
 		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
 	else
@@ -375,6 +379,7 @@ static int devfreq_set_target(struct devfreq *devfreq, unsigned long new_freq,
 	freqs.new = new_freq;
 	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
 
+update_status:
 	if (devfreq_update_status(devfreq, new_freq))
 		dev_warn(&devfreq->dev,
 			 "Couldn't update frequency transition information.\n");
diff --git a/include/linux/devfreq-governor.h b/include/linux/devfreq-governor.h
index 2853f571dfdf..83aa82c4a9b6 100644
--- a/include/linux/devfreq-governor.h
+++ b/include/linux/devfreq-governor.h
@@ -36,6 +36,7 @@
  */
 #define DEVFREQ_GOV_FLAG_IMMUTABLE			BIT(0)
 #define DEVFREQ_GOV_FLAG_IRQ_DRIVEN			BIT(1)
+#define DEVFREQ_GOV_FLAG_TRACK_REMOTE			BIT(2)
 
 /*
  * Definition of governor attribute flags except for common sysfs attributes
-- 
2.34.1

