Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674594;
	b=CTIn42cvkcLST5WSAbqjKH0I5FjmZZGJrl+ajn3BSpPQnkHsZXlIfRdUC9dsVB2xDQqb
	 q8kzapGRZHnDHCdbtCh+29MVnzKYobZwryS7ImHC7H0Q/avwGwQ9wUSLJov59RmShMk2f
	 SR2tF8JPQouubfV5qJL0pBRzbliOS/3pPaF1rpWlI8zZTLnBFXkG6F5YZiphYhm9U7fCF
	 MNzcvZLQlNwfdraQDe9LE+JoH1xk5Uj5Hr3ZyQJGTG4Rssnj752SihrUEw+b+o2LU6ZZ4
	 21oqArVnXWhTTI40OXK+A07s8nHug1VxoJNoSNIksA9ZSduSm3t3UKc5f3yBx7IzbNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674594;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=;
	b=I5yLrAgIkOTyNSWTlOcMrltWtWKQZayESEG0307zGprKLcFk6TcFow8+cZgYTT5TQE40
	 JPRbWztcCftNLkBrMgQwB5dV8eatyqDh3m9137kwiT+f4WrzxLwd0AJBkNV2ieG/QOu2V
	 +Pf7jkqlQmXsC5T1wt8pvHiUO8I8HP28oZTu2vNhBBOZ3UAxl+d8wi3+zDo9H7L8UAI/K
	 Zh0No9Eq3c263GonRk+wrHA0QPhxM91Sb675e2iMozGlbO4igFGHg4hvb22rkGw8H9LsA
	 wmhDlxbPnNCJ08lSX1wPUx7TbW92QfbRKQLDQ3wJLEBB4GnJueK1G4B1+43jV44580g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVqMH1Zq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jjj2eD+Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBA606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDBA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVqMH1Zq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jjj2eD+Q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36MKO2068530
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=; b=iVqMH1Zqr0Eaq5CC
	A3wCzPnfxOAHDHFJrrBTXQMXi0Vxcjec2o/G1k3lnM+/pnlPSU10aB36mpRaCwgD
	l5V73zkPMTrvKbsgRnXjbm/VJrKeb+2y2jc/BPVM0sr62T8xhRtvJF12rye26FG0
	R9ZPa4WewhjCfpJB50jwx29yYT3yjrf8sZ9XkCiokgLYIMtwMja3OeGWySk8F8fC
	D/BXnRlCv4uTB37M2MDtDMzHZA4aWH3LMX0nJIP2QMdCDllGfb7tZax5kIFCPIDg
	4x7X84xDM5yxpmB6eoypaoEzhN0rCCpp1pSwy0zzFUTS0o338lHZTUpXsA0OIbX0
	BVEwUQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s9rkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:29:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05c68629cso44319205ad.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 22:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674592; x=1796279392; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=;
        b=Jjj2eD+QdDo9aIDWsJv9x4FMV/p1JgMbX3HWvq/3EHaJ0VSW+vz8WvNmv5K/UBC+OW
         UAriJxw742VeSkBmxV/ashf/tnSoTPaOgKP659obCimR1MNR7FUEodjUPFQhrPan6nNr
         w5oEM3rObAgyVjVq4medRZ93vC3fumhut6caRTt9u0UrGXAcyqh3ZfGeP2YZK7FQqZ3W
         sCDxHygPxYjgBhKFjf92zvPQiRrFcU3CsQD7ji+rWdvHL+/QSN+215Qiz+QM8FM9R0YY
         EXxOS4J3dfQTJ5az4q0B/0DlyO50uEzeto82hWjk/fZ0oFfatxl05maoyM4l6Rqskc3K
         mBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674592; x=1796279392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POiBPcDJVA0W7NWtaD04Jkc5yVkz3p2FFJOSCoNB5ck=;
        b=iWz9QCMiaNZon3RB/+htjhw9MV6p08LJfnK4FN/Hgd3tWzmo0Oys2HNQCyUz/XauVz
         L+2Xrf5a740QQFft3ofFUnvp+SB7NmTG76tCtK/93uehOq7K6gGkuvz+026MOWxaiB5r
         2voqRhNmz7Crpk8aKljCtRMHQnbTaB5gwy2fb5bGlh7ZLOzJlfJCC2lH5qNSmlCUInCy
         qVMyhhVd5jD7QMxR+5FG2gx7N1q6o4yXB/sP50GONjQxJaVgHsJnakB6aHCZxlztHnvR
         21QVMX75R9xtb+Om0rQjY4FcWgcxT9tAgqlCq7II1a9/caNzUqPth5jBp25ZJBlW5sI3
         ZucQ==
X-Forwarded-Encrypted: i=1; AL+hErGQOJgqEumodXyvV5ZFdTBfa5KW2keLslBoRFvqEDQ5jyeOtkxg1l6m5dqoUY0OKdSXhRvhCz+loCiN@vger.kernel.org
X-Gm-Message-State: APuU4Z9/TIunfopI4LvafcBppQqEgggVLS88wkXo8oDh6ExAy6V90TYS
	7s9lujPXskRkOcLj1Ccwmnda2xAfE3oMkLITCGJqPWjPfFUFZ+OkbuxZ6MeF6TloH2Jfq/dLRTS
	whlqXgYgs/TdYMdvXySy2pFixvR5S/w0ZPJ28lLtg8vwY6TxVjYB3smxLiplTxypc
X-Gm-Gg: AZFdTZd8bw5cjpcwTZScO3JGQS1ZoiXaBcyRy6vWb/rflq5zGf6dit7Ttq5SMLbrZn0
	AIVkuPLKK5DLetOG/fTO2D+wRMg0O/2vk31GfWlkhiGZ82zBf6kE5fVW/U5lVaBFV5EmcDYBSVW
	KG2K5sijT8kAeQltv+EegGCBPjhgbItuScgqmjBwJ3MYyNN0zIqcSh8seuhkUrcvH1sVQI2nHOU
	wCKUAKVnXnx1LldNMsayNh8Kp3iVpMKd2uLLKUMfq4PjL1eWXWCXFSttbwywb3Fc/2NKfN7uPd+
	+5PBvNp7u5tZfeOWJwjR+Si0mEYMEyAlU7lZFOGjcg5yfiQw/COL/itUiul0cmXq1wGs+nQrkPN
	Cmztew2dMkOm5NhQyKLXeia8MPDRhH/KMRcNOSjODnljLVE1bo6XAhbra1gWswy8ldkGtSC/CRf
	w/9JRLoSP0
X-Received: by 2002:a17:902:cec4:b0:2df:8382:918b with SMTP id d9443c01a7336-2f03edd6e5amr206104785ad.0.1795674592215;
        Wed, 25 Nov 2026 22:29:52 -0800 (PST)
X-Received: by 2002:a17:902:cec4:b0:2df:8382:918b with SMTP id d9443c01a7336-2f03edd6e5amr206104245ad.0.1795674591683;
        Wed, 25 Nov 2026 22:29:51 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:29:51 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:11 +0530
Subject: [PATCH v3 03/21] drm/msm/dcp: Add HFI device definitions
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-3-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=10561;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=sk048O3IgrNWFy3YZMxwRpaI1TNXq2tqfBpVYWngnVA=;
 b=QKTIJmUHHNMLtng60+FfhoCX8D5vDy27xigGXwlVcKAX0PCios8zeExd7zvSfLNNcAPGt9YIM
 F4pYCNJpvPxAGN090c2ethSlFHP9KeaN9x4LqDIvrAak5nlwhqyNxQW
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07d1e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=9hKN-LdXriKJwKJ2pKYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oRNtk0aHO-1T-UX18ctO2hxSgC6AaYfY
X-Proofpoint-ORIG-GUID: oRNtk0aHO-1T-UX18ctO2hxSgC6AaYfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXw3ZDwzPtVuV2
 d9J3lrLOjG5sgFRHcH22zNqQOyqLsVvtDbpZQtEgsQDD94V35HAuaMae6uJtGAKpX9R1/xxCDk5
 s9N+GpqsTB+fp02PG8cMxFuhKZVLH2/bgqPYn/sgSdRVp05YJHEap7hYf8X7G1J0tJAFZHIhwoC
 RjE4SQoiQ2nZRsTYk3fkZU72HmLy28AhpU0coXypvYsIjNd2ZXlRH53NSNP9v9bIwhKXug6NI6a
 17u0IiXPJ+5Us3umlBjQPDRiR9ehlEOIS4ZQlyJTChxGh25kMxiZj2sUzmUqzUQ52vXmN3hGiz0
 Y1+sLL/7K+cIZx8kQj30SqWfl/0q+AhU4v5x57HSLfCQekiI8/gvDCjydmSUbIjExrthv1P/kQO
 6bRNOqxbsvGRYZZajyrYYm6ZpOqRd8R5vz1fB7pFbSL0lLb9139vqgbZoVJ+UWRSU4Hx4sw/hDy
 Dl74phVVua0WksKBNvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+dvaQ20O58Ec
 WBu1iAhfi7UjpVCT/Fz34yLw0NJDQ9wouSE+otG3MT8XyXDctUiiortzxz7zpZSNAHCREWeXL4n
 DdmAog6a4LLgWHLpgq87yZ3/YDGtorQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Define the HFI device commands and properties needed to discover DCP
capabilities and register display resources. The KMS backend cannot
size or allocate the firmware-owned pipeline without these protocol
definitions.

Describe device commands, resource data, and capability property
identifiers used by the DCP device and KMS layers.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h  |  78 ++++++++++++++++
 drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h      |  61 ++++++++++++
 .../gpu/drm/msm/dcp/hfi/hfi_properties_device.h    | 102 +++++++++++++++++++++
 3 files changed, 241 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h
new file mode 100644
index 000000000000..abf15e6ceaec
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_commands_device.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_COMMANDS_DEVICE_H__
+#define __H_HFI_COMMANDS_DEVICE_H__
+
+/* Device-level command range. */
+#define HFI_COMMAND_DEVICE_BEGIN                                     0x01000000
+
+/* Initialize the device and return firmware capabilities. */
+#define HFI_COMMAND_DEVICE_INIT                                      0x01000001
+
+/* Device, display, and pipeline capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DEVICE_CAPS                          0x01000002
+
+/* VIG pipeline capability response. */
+#define HFI_COMMAND_DEVICE_INIT_VIG_CAPS                             0x01000003
+
+/* DMA pipeline capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DMA_CAPS                             0x01000004
+
+/* Common VIG/DMA capability response. */
+#define HFI_COMMAND_DEVICE_INIT_COMMON_LAYER_CAPS                    0x01000005
+
+/* Display capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_CAPS                         0x01000006
+
+/* Writeback capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_WB_CAPS                      0x01000007
+
+/* Register clocks and bandwidth resources with firmware. */
+#define HFI_COMMAND_DEVICE_RESOURCE_REGISTER                         0x01000008
+
+/* Firmware requests a resource vote from the host. */
+#define HFI_COMMAND_DEVICE_CALLBACK_RESOURCE_VOTE                    0x01000009
+
+/* VIG rect-1 capability response. */
+#define HFI_COMMAND_DEVICE_INIT_VIG_R1_CAPS                          0x0100000a
+
+/* DMA rect-1 capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DMA_R1_CAPS                          0x0100000b
+
+/* Provide the last-command buffer to firmware. */
+#define HFI_COMMAND_DEVICE_LUT_DMA_LAST_CMD                          0x0100000c
+
+/* Deinitialize the device. */
+#define HFI_COMMAND_DEVICE_DEINIT                                    0x0100000d
+
+/* LSR writeback CSC layer capability response. */
+#define HFI_COMMAND_DEVICE_INIT_LSR_WB_CSC_LAYER_CAPS                0x0100000e
+
+/* LSR writeback reprojection layer capability response. */
+#define HFI_COMMAND_DEVICE_INIT_LSR_WB_REPROJ_LAYER_CAPS             0x0100000f
+
+/* LSR writeback CSC output capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_LSR_WB_CSC_CAPS              0x01000010
+
+/* LSR writeback reprojection output capability response. */
+#define HFI_COMMAND_DEVICE_INIT_DISPLAY_LSR_WB_REPROJ_CAPS           0x01000011
+
+/* Configure the hardware-fence HFI queue. */
+#define HFI_COMMAND_DEVICE_HWFENCE_HFI_CONFIG                        0x01000012
+
+/* Update hotplug state and provide EDID/mode buffers. */
+#define HFI_COMMAND_DEVICE_HOT_PLUG_DETECT                           0x01000013
+
+/* Configure resources shared across virtual machines. */
+#define HFI_COMMAND_DEVICE_RESOURCE_CTRL                             0x01000014
+
+/* Notify firmware of a subsystem restart. */
+#define HFI_COMMAND_DEVICE_SUBSYSTEM_RESTART_NOTIFY                  0x01000015
+
+/* End of device-level command range. */
+#define HFI_COMMAND_DEVICE_END                                       0x01ffffff
+
+#endif /* __H_HFI_COMMANDS_DEVICE_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h
new file mode 100644
index 000000000000..c6c8fb556c3e
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_defs_device.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_DEFS_DEVICE_H__
+#define __H_HFI_DEFS_DEVICE_H__
+
+#include "hfi_defs_common.h"
+
+/* Hotplug state for dynamic display interfaces. */
+struct hfi_device_hotplug_config {
+	u32 orientation;
+	u32 port_index;
+	u32 pin_config;
+	u32 hpd_state;
+	u32 hpd_irq;
+};
+
+/* Display resource ownership state. */
+enum hfi_device_res_state {
+	HFI_DEVICE_RESOURCE_ACQUIRE = 0x0,
+	HFI_DEVICE_RESOURCE_RELEASE = 0x1,
+	HFI_DEVICE_RESOURCE_SHARED  = 0x2,
+	HFI_DEVICE_RESOURCE_PRE_RELEASE = 0x3,
+};
+
+/* Virtualized display-resource types. */
+enum hfi_device_resource_type {
+	HFI_DEVICE_RESOURCE_DISPLAY,
+};
+
+/* Virtualized display-resource configuration. */
+struct hfi_device_resource_config {
+	u32 disp_mask;
+	enum hfi_device_res_state vm_state;
+	u32 resource_type;
+	u32 reserved[2];
+};
+
+/* Subsystem-restart event. */
+enum hfi_device_ssr_event {
+	HFI_DEVICE_SSR_EVENT_START  = 0,
+	HFI_DEVICE_SSR_EVENT_END  = 1,
+};
+
+/* Subsystem-restart information. */
+struct hfi_device_ssr_info {
+	enum hfi_subsystem_type subsystem_type;
+	enum hfi_device_ssr_event ssr_event;
+	u32 reserved1;
+	u32 reserved2;
+};
+
+/* Active layer mask for a display. */
+struct hfi_device_active_layers_info {
+	u32 display_id;
+	u32 layers_mask;
+};
+
+#endif /* __H_HFI_DEFS_DEVICE_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_device.h b/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_device.h
new file mode 100644
index 000000000000..790fcca6ac0a
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/hfi/hfi_properties_device.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __H_HFI_PROPERTIES_DEVICE_H__
+#define __H_HFI_PROPERTIES_DEVICE_H__
+
+/* Device-property range. */
+#define HFI_PROPERTY_DEVICE_BEGIN                                    0x00010000
+
+/* DCP hardware version. */
+#define HFI_PROPERTY_DEVICE_INIT_DCP_HW_VERSION                      0x00010001
+
+/* MDSS hardware version. */
+#define HFI_PROPERTY_DEVICE_INIT_MDSS_HW_VERSION                      0x00010002
+
+/* VIG layer indices; the high byte identifies the rectangle. */
+#define HFI_PROPERTY_DEVICE_INIT_VIG_INDICES                         0x00010004
+
+/* DMA layer indices; the high byte identifies the rectangle. */
+#define HFI_PROPERTY_DEVICE_INIT_DMA_INDICES                         0x00010005
+
+/* DCP firmware version. */
+#define HFI_PROPERTY_DEVICE_INIT_DCP_FW_VERSION                      0x00010003
+
+/* Maximum display count. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DISPLAY_COUNT                   0x00010006
+
+/* Writeback block indices. */
+#define HFI_PROPERTY_DEVICE_INIT_WB_INDICES                          0x00010007
+
+/* Maximum linear writeback size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_WB_LINEAR_RESOLUTION            0x00010008
+
+/* Maximum UBWC writeback size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_WB_UBWC_RESOLUTION              0x00010009
+
+/* DSI interface indices. */
+#define HFI_PROPERTY_DEVICE_INIT_DSI_INDICES                         0x0001000a
+
+/* Maximum DSI size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DSI_RESOLUTION                  0x0001000b
+
+/* DisplayPort interface indices. */
+#define HFI_PROPERTY_DEVICE_INIT_DP_INDICES                          0x0001000c
+
+/* Maximum DisplayPort size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DP_RESOLUTION                   0x0001000d
+
+/* Downscaler indices. */
+#define HFI_PROPERTY_DEVICE_INIT_DS_INDICES                          0x0001000e
+
+/* Maximum downscaler size: width [31:16], height [15:0]. */
+#define HFI_PROPERTY_DEVICE_INIT_MAX_DS_RESOLUTION                   0x0001000f
+
+/* Core average-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_CORE_AB                                  0x00010010
+
+/* Core instantaneous-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_CORE_IB                                  0x00010011
+
+/* Core power-rail vote. */
+#define HFI_PROPERTY_DEVICE_CORE_POWER_RAIL                          0x00010012
+
+/* LLCC average-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_LLCC_AB                                  0x00010013
+
+/* LLCC instantaneous-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_LLCC_IB                                  0x00010014
+
+/* DRAM average-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_DRAM_AB                                  0x00010015
+
+/* DRAM instantaneous-bandwidth vote. */
+#define HFI_PROPERTY_DEVICE_DRAM_IB                                  0x00010016
+
+/* LSR writeback CSC indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_CSC_INDICES                  0x00010017
+
+/* LSR writeback reprojection indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_REPROJ_INDICES               0x00010018
+
+/* LSR writeback CSC layer indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_CSC_LAYER_INDICES            0x00010019
+
+/* LSR writeback reprojection layer indices. */
+#define HFI_PROPERTY_DEVICE_INIT_LSR_WB_REPROJ_LAYER_INDICES         0x0001001a
+
+/* System-cache staling configuration. */
+#define HFI_PROPERTY_DEVICE_INIT_SYS_CACHE_STALING                   0x0001001b
+
+/* Active layers per display. */
+#define HFI_PROPERTY_DEVICE_INIT_ACTIVE_LAYERS                        0x0001001c
+
+/* Writeback DNSC support indices. */
+#define HFI_PROPERTY_DEVICE_INIT_WB_DNSC_SUPPORT_INDICES             0x0001001d
+
+/* End of device-property range. */
+#define HFI_PROPERTY_DEVICE_END                                      0x0001ffff
+
+#endif /* __H_HFI_PROPERTIES_DEVICE_H__ */

-- 
2.43.0

