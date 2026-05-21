Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7482D061C
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325808; cv=none; b=nM6n0IMTWC3CH+bb3KhWQ38eT+3KU/qNMIhQoN6tKcdZO4fNHDr22W0dAGR7tzqBSYPdpJWpJL1/xEL7t8BSeM+PNyEMty8hEoJFIYDbJzDh0efqH/EYDFr8HmbPchsTBF28I35VtTAjYVaQHpQVTKnsLmcZj42sGyfKiQqBlD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325808; c=relaxed/simple;
	bh=fmNJ3KT/7b+xTlpyQgi+5oa7xWoQzjNFF8X5QjQDuXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLovYXKP1NdS62zPiM1s22AtsvN3wtGu4lG0nSh+mXB2t4hbP/AU+/Q1ONPQzI5GM2rAlUUcpoxNq8vgTod93AzVTPmdD+cMMUedTGLk+3+Ps3SKCwWZozDJAQbvc8TKhr/mCl5KonMiteMzBsxp5m7Cvieo2MnzmFFM4XsFzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfS5aHGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qe2ShC6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfS5aHGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qe2ShC6L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KKlX4c2157616
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+hhG8da4DumoUI+vB6A92v5ZtZlBaXWB9NrZWaYMTPc=; b=JfS5aHGz4pyIXxHX
	/A9TPu5pRAWtc692FLEgyrlNO8H4/b/FptWcud+TaT3DPIEYWxg8GKcGTcWIuxQn
	+WhT7NvDDhZK3YgjAY9m6BYMLZzBgI/kvC48cXV3j4wvmKnu7wN9vb8QIuu1I9mJ
	j9x99HG7c3YaK5smLqCI4hIRUfqb3VkA6aSt9ntxGO8m+cIn2VkDPhfwuwGPIA/n
	8pxDL4gpetoQqB4SBDS9w72gg8EEtZZx1QZe8NAkXlqd5FsxF3BOc3nlw3CiO6pz
	0v0JQ79Pt26OPsGD/6ZIRpJNExPpHbARv4zXlUB1UfepvzllLtTBD+itqB2v/Wzn
	luOaSg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma40qcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:10:04 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-65e0d38adcbso12249423d50.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325803; x=1779930603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hhG8da4DumoUI+vB6A92v5ZtZlBaXWB9NrZWaYMTPc=;
        b=Qe2ShC6LTDT3lk1oiFi1ZODknNlIrOeieDuE2vdSuaPL6EG65LGqWqFw27pj3vwvk7
         luZPdwM+UDLTUYA5+3N20OI9JPgsBW3KNOaI+Z9GORXA3xW8gKQ3k2JmBPSXiPT5w4mP
         zvKSjEIO/iDnaKlUiRfCZIdUf/wRn6WPwaHwR/5Fia6kUAfF91EbKCT8YWL73L+rEy93
         ZB+RmOSTxuFbM+8W1nTq7Tr0JoQmPH2vvD5xxV6ajOVFqBxJtiefz2cc2pkb72Nc/nln
         3aBrl2ZAKpR27TVD+FNrJP9s/M6s8bfeAkKxP/IJNqVq2D/+SodUi2+1GCFQmcAVY/Gm
         GyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325803; x=1779930603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hhG8da4DumoUI+vB6A92v5ZtZlBaXWB9NrZWaYMTPc=;
        b=ZQlCexUQn9/lQ91htCol+CITyFzpsRWpjkLQZXazyNHGZ+M0iWaZ5o0GxHaHyC1ugW
         oDpf6qtUY1lC2F3QOp2spuztvxvyTABXPSweMe/FZaIWmWrIeESgjyvzxKqaRcNG0HIZ
         xb6NvpGnptmrf+X5EHJv4BdPfL3PdzInl20Gb4DDroLlAfKvZBzdO4Ht7D7h7w4BZYr2
         ji2lyb5MbiEvdAone65acqclSsMG0p4nOicbE8VZI1xleysfV9p9u9r5LO0k1YO4Vyij
         qnDnrdJYkHil4kwiqrL5lf5la5Iuho3QIRgobOQwpEhqSGUi+TZRT5OiTSMnDXl+Pjzv
         sNYA==
X-Forwarded-Encrypted: i=1; AFNElJ87jJ7zoh6++d/83anOULUpfBypvjhtznT1m1UDpnxEgShIe+qEWMvhuO0YiWYX7uNo9rOkc+5bdHTd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj5UAPsSZbB1aUk4QruiBTT+sekrAIuIO9ETBZwHZcXHCUlhiR
	R1ZnxwaAArxldIw5UlpAP21SVA9afjzPWWB8PT2IJRYMzOhMK6eBVSzTB/hRbRY4rgETe6knMOV
	xHWIz7INhxVSuOhOfBE8QIsWzN1VfXLRmPcp8ASgHUUMuyPKfg7cXOiHBFcLnLWgQ
X-Gm-Gg: Acq92OEOggiaSWT+uLRmCKwOKKS/BFpAPH3fsC2P/3L7zUx0F5R1TCbfudD2I3K+Fv7
	H+kv7kWjlMuSvLLppsLE/V6QV8q/XXCmM10sOZW7xO8gSfdEfRv8Kk+CWmkLrOc5hY5paXsbnW2
	Yezo7CL+RsZCkD4Z53xRCOw4G3W3XH/gIBdLYHmHKWWbPE21DWJwLyNan1WQyaM3vxfpp615M15
	n8QZuWUtiuC2Fba8P/8zNlLzQjshroa+0dTTzdoSRymwVZehF+Xja2CPe/jY1jTYBKfO2pJAj4g
	8qnmyx5TTtoF1z26p8sZ+4vwUqtOqqEyzm6V3iWMc+Hb6WBIoYkkL797YhCa6tZSOqiAxPcbF3D
	+ZDEh0Kcorjxv215NTSyWAwqh+5uQkFju1Mu+mYjTJgKtndJmvP8I1aJwLxwFnc5AkMdHinpW7O
	ZLSoKkPbsByiTKfAw=
X-Received: by 2002:a05:690c:25c9:b0:7b4:3d82:bf6 with SMTP id 00721157ae682-7d20ab9e281mr9263537b3.11.1779325803488;
        Wed, 20 May 2026 18:10:03 -0700 (PDT)
X-Received: by 2002:a05:690c:25c9:b0:7b4:3d82:bf6 with SMTP id 00721157ae682-7d20ab9e281mr9263337b3.11.1779325803021;
        Wed, 20 May 2026 18:10:03 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:10:02 -0700 (PDT)
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
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB
Date: Wed, 20 May 2026 18:09:35 -0700
Message-ID: <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0e5b6c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GRacV1d55YfRzDIv3pQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: rmOw00FR5epMZjMCnTF3Ke0dV8pcTmc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX4PAUOe3BBneG
 MMJF3GSRM5IxGvrH61E3OiuX9GHN4bjf5SAWgwleuBENdARJrF0thN1RiRig45HdDSASjNcVQFP
 lQP6CKcIIkYbsGpT2sEJ5YKU31jVnBRD85L7a+5vgbJaWnSPXVD3Drs4+swSC7KPNVjsCRh0ybg
 fnlF/q/R3Hj+OD0+xyM91/Bz5864v43yIeZkopYaI7KRIPUu5iNDilEa4LaEDQqM7DY8CtWfYSv
 QqdcVLRq9Y37NKIXb28wn6UQXDBE4L9uH7k4IjMkSFeOOLIHx277UfPrevsfHfkiPIQe2HoDebQ
 pybaeLu88NiBy+Ykep4q82r/Ii9ZnGbwo8wpjNyoewzwn0IMbvMb7F+zeRkxouqDR0EVykdf81D
 D0GkZVaRzkNCQrTIvrLMqWIXA5DTA8C64OxAphTA1OIBg7hCa4SQYAw0JSZYxFGu/hbcpnpiXXP
 MQvqIwGShlS4hBYUcSw==
X-Proofpoint-ORIG-GUID: rmOw00FR5epMZjMCnTF3Ke0dV8pcTmc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008

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
index d6de4da02dcd..714988a81384 100644
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

