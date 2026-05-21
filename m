Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7E275870
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323858; cv=none; b=NQP/26WHOXweuTtbuqE80+ctK7S/dai5gJpBKpj39IMZ86CG/U3QKvxEpbA9JiodaIud/4NaZa38JQ4N1pasliX2V9AaglntPqlCh3CNqtfXMpt2frnYVr1R7kpeDZ+o6Cqm5K9OMxDZecmjbvCt/HA5WgeVMRYTkihqfGYtR/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323858; c=relaxed/simple;
	bh=QzV+b76g2RwQyA2gVSUbPmh/ADCftQO+Jl1AkmifVoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gLAVRMM7Xm/k+YthCx0a9dSc3NUdbin33/FqSYyuADl9WSLwVBitL39Yu6qdawtVORvR+ouu0/W4mKMAj4vHT2YlxmhhxoVXPUNl83tPj46wTCltulqXrDqSEpHBxYgpyffslZM4U7lulbQztbVUQLqdfiGR7Zh70CvAPCm2t54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTAOCRBM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwYb9qdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTAOCRBM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwYb9qdd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L0JiNS748495
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndtMzgmuY+0pFl9mHos/KMSkAJpI2bJq6DS/PiSdLZw=; b=ZTAOCRBM27immPp6
	oJq01245epfnbyeN788qu8Pw7+bIZRkhdG3VvZj+4TZxjvdrM9yivnrYOEOaQzC0
	t+mBE35auXrggiyT7PigQBLIKotocgzzaMLOyIntUpLT+pKhxhkCT+xlTwHEm95i
	kIENQt9H8NkQURBZ9nz783rUnQMps/JnJRQEI/KM+sGCbal6WY2TmcbdYfWyZo9M
	fhCG3qgkjjtQOfckV0Yi9sMa15Grd9zkNBjmzl7jzBmKVOiveFgEBauTDC0ioVaE
	5x8yUvHrt0D8xrhEEOE8fhRRNPqQw2YMOQm8v0Td13cONUza0oAdqkyHOlc1csRN
	xoRMZA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6hxw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:37:24 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65c364b8683so10111299d50.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323843; x=1779928643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndtMzgmuY+0pFl9mHos/KMSkAJpI2bJq6DS/PiSdLZw=;
        b=iwYb9qddRm0/w4nVgN59Xyl61X207ywTm8fjP6dMbwU2l1CwMytMGGqMurEqlN+5ix
         lO0XYS/49sqLTGZMmT9BiwYIg/DvcWdX/pyChddhZ3VFAW+PBB2qAvB0MqVCexNBpK9w
         Uh7LbS5JMmVEwPUOTb7idM4cB0FWTASP30NxClrcWlfoTETvDm73ID/z/uLH4/ADcWY6
         KYYbXdypTTxFCd/LMh3qGjOA8sVX3Cukg/3Xmq3TP1Uxvf+864FwGbHgMKnxVESYFPGA
         iFvd88kPysvACYA70xINM35/Li6V1n+hjbWDOVvXc1djG4X3f8/Vp6m2YnfJVorKpO2d
         kF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323843; x=1779928643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ndtMzgmuY+0pFl9mHos/KMSkAJpI2bJq6DS/PiSdLZw=;
        b=eD3ZGQzAkaWfm0TTOSbVx508VhFLxBNMpgCTVF+eI9C1sIJbY7Yg2OBj4ZyjU6Sa2d
         wS5jf8IhkPDuQ6YckK+ws+FfgApHEoqr9R3EbttDeSFYU4U+8DT5mAhhIe8QUZPIcWXW
         +TQQpJT/8kmx08SdKr307BhJuEY0CIEA6BNMTaZGH3VexXnNlan38fB1ndPbxDqh1tRu
         Tmj5Mv6yQsfJl23K0XGP4EXqAmL1nI0FikyiGBIQ8hsbulwGfSo8l3sYZMo3NmsD8rGX
         5StH2gVEqUuAYXp+mFiYXwJ+c6pvdBWzWsDs1/UAMDk0HHnZTBoMHeI+p94cIYgcQDoQ
         57GQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Ex6NWdhCnpF+l3QxA+4Xk11ccYez3f0LodCNdKVxOPjAExgX2drR2JEncw84GKJ8idwVBbGa4LX0K@vger.kernel.org
X-Gm-Message-State: AOJu0YyoGC5SYsdJ9E8GmzlAy2+gVdYchQ4d5dWKfWW+L3iaTd1ibx1c
	Rc4EkX/OxLYi1MK2/8ZPh04eS5P3o02MsMVVbRn6Ekim37ao3+DzfXVsVAPOjTTI7zeU+Nnat79
	RiWQ04tUp35sQsQ6MQTtuqu+dnTSEbba2t8ptWRUWbAS9nqkhyiNotzND1YrZzS/H
X-Gm-Gg: Acq92OHLpBXuF08K0ypiznj+kgpfzXlEl2gt6vNqD+r+1Gr+geg1KLVqPgikJbM/Vr7
	4QUOwCnCuk3UUNHSbvmnIYayi0h86OMWKV3Gw76vCf5gGdNPxyA6DwvSh+mwIJVVmKoboZhoQH4
	cgtd8Mpf1V131plgyvIUSLB1Y6vHqpD+sdtt0XTnCR5DWe2EJlft1A1R1krw1Jy5QaxwpaeSlB7
	p6AeUTJ4UHmIDrQmCA5TAiRtqm8jCgFhswXN31hufFMypH33059GSLvO9tHZ5Lh8ga51Fv7/zCL
	DuXF1zibtydeR64lGlCxLY4qTOE9qGyhsaswyc1ni8XTukJ3N6xrY6P4EhuaxaGzzFV+Xe29i8Y
	N9FgKw/GPew/QAujhvbkAZNr4ydrlZxDTemp8M6mIj2drE0G26Q+46ataqvl0c1YGLV9sWa+CkM
	Ruqvsdps0jT6zC9Jw=
X-Received: by 2002:a05:690c:6c07:b0:7d0:ef8:6898 with SMTP id 00721157ae682-7d20a6b0832mr8730097b3.14.1779323843229;
        Wed, 20 May 2026 17:37:23 -0700 (PDT)
X-Received: by 2002:a05:690c:6c07:b0:7d0:ef8:6898 with SMTP id 00721157ae682-7d20a6b0832mr8729907b3.14.1779323842866;
        Wed, 20 May 2026 17:37:22 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:22 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB
Date: Wed, 20 May 2026 17:36:15 -0700
Message-ID: <20260521003615.1260844-5-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0e53c4 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GRacV1d55YfRzDIv3pQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-ORIG-GUID: 2-_RNrnKujuKkcmd1W4lKzUPgaor2fcB
X-Proofpoint-GUID: 2-_RNrnKujuKkcmd1W4lKzUPgaor2fcB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfX86VMnx7EJfVR
 zagLDMOn/0X61+xhvw51XJAOq533l+N/PlDuui64OvM0Z8RLFod6HhSYKBicBV3ndR3ONwqoWFH
 zBrOFPtBSkbvsrRc1r2oImjgsEKxmXBLSpQILhY+7tcupaQ6ma/8AavJS5XauFAk0hpq8C8aR53
 2eix9+rY4qomNUICJQ7VsK9p/jgBXU2uuLf6GJBb2PTWhskcSvJFKBBMKEioq7CgFewbOW5crux
 mPF9PYGN6Mgt+nSCbj7vf3B+2MjrErsOTXsoQ8SnQV0Lw+qdpEVD+UNWy2EmBMcn5UTyIGdRZmj
 KMg0ZMTvnTXc3jsQNL9AMQFI2uW/sKbW/Kk3b+ESIZv2jZpAz53Y2NcnwNEX+RLSzsTeM0OxKYu
 WC/SGLei5yAxZDcYS0RV5K48y/PQKHEeSmdo/vxIT5bL/TJhhD20hS94k5zbNh5VrnlJLUqD/S6
 /cHanfBpx2w2nHKW64Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210003

The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
to support the camera pipeline in parallel with the normal Linux
desktop. On a freshly-booted system with GNOME running, the typical
runtime consumers — msm DRM framebuffers (Wayland triple buffering on
the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
only ~25 MiB free.

The libcamera "simple" pipeline handler used by /dev/media0 on
dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
That request fails on the fourth frame:

    ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
    ERROR Allocator: Stream is not part of /base/.../camera@10 active configuration
    Can't allocate buffers
    Failed to start camera session

resulting in gnome-snapshot's "Could not play camera stream" and any
other libcamera-mediated app being unable to actually stream.

Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
the libcamera buffer set plus headroom for video playback or other
CMA-hungry workloads in parallel.

Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
camera cleanly, and `cam -c 1 --capture=2` succeeds.

The companion board files dell-inspiron-14-plus-7441 and the upstream
.dts variants inherit from x1-dell-thena.dtsi, so this changes the
pool size for every dell-thena-based laptop in one place.

Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index d93b704872b5..7894d96d34ee 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -167,7 +167,7 @@ led-camera-indicator {
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
+			size = <0x0 0x10000000>;
 			reusable;
 			linux,cma-default;
 		};
-- 
2.53.0

