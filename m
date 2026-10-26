Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995927;
	b=lTDFPewdo1bxPTUXYB4sP3kbVWdqSun2MFQhMmO+0CBMWjnqQboaseKNlLcBatdwJpDr
	 Lz0BfvwLhMPjcHiIGgTUuNmik8rqn/X6b3YIu+zljn6r1hP1u81uI+Q0cvOJs3SlI9MoC
	 J4yFWzxtWFIn4FZZI8wsJ01uI+Q3WamOPQhZEjzh5aDaDji33rappucJVPemJo5DO7una
	 Qg/YAceCSsdH9rbBmBL1v0yruXwpOw4GjeytHu4SYjfEXjAc7egqruTbVvHLiF0vycoZN
	 o3rSyuzWS2zy1nxiTTWNhuzSDAZC1SqpbzQrJp+rtJIALO305oNWdU2rzSfAVOhT9VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
	b=aaoNw7VUi7iTowNUiRoOXSr4qCk1oPS4Mg847yd9XfWSSANMwy76AZXrvkDCDezCRREd
	 Jn2tWsZdAjtJx7Llx2a3jIAxy0xhbp2TYJYj2I9aWgbkiWBYaBgb9kkNDwy2wKKfG+YOh
	 nsOXfLvfHArHb1kpwrVxGLcCWbzsUMKT9LZXQinDsJZ5/erL97uWgYLKTJanhoqCkWyc7
	 +cS2VnRz/5KmkjkOpJA0wxHUy47xjXCEFXI+/6mguoFbCCjaKLthPfLjEbfVs8Yyg9pxI
	 CK3C8Cen526DWzwmsX/l0LqLPwT3SDChtFrnxr3rk8lsQxdHm/zDh3rNiFkZKAzzK1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mdi22M0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1WezxPJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362FA606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362FA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mdi22M0D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N1WezxPJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9hs718211
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=; b=Mdi22M0D0/nX8L8+
	EgIDzXe9Pn4OtwYwlygs/rQOkwznYAJuyISW+R0zkTb09HRmG2w7+CB+dkJ9x3QR
	wROQ2NmY8nxl7d1yrZMAVqeWJtn+OzG0IczwEdfpNHwmuBl4EE+59e38mNe1lefK
	7G4heGBp4GKNN6l0SWxwhsd8B6tw59IiSHlRmZJwi2ajbD0Akb8X0fn6z97ssX0z
	/TOvU/98EJugFgGmR2ANrhqnvA8CA/ikTJl44fYLf2376Z6U8u+/5Ffdx/aQj1RH
	t6H72W7/4ug8+6iR81IVbR/hg9yJ/+ZD4skdctIaqJqMX9rPHhQssTIQZ59oT6XI
	YIo3KQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgss4u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:25:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so4449015a91.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995925; x=1793600725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
        b=N1WezxPJXcVVRCG2le4phpp/rmEq1k1zvze7NpL0g7UctSh/xzyqyNtAQLTA+7tG1e
         SdKDgfHwUDdNhCcr9G2aathfIe546zfgayGhUKjPmbq6rJRPjgIEZ0A00Ynfa3rUcf3E
         t0nABwveSeCabR3G+UGWoXeEy6b74kdyH2eONRPhB+QCO0cH2xUDRxOcWx25CB1iXUWd
         W2rm2OKLoYY6S93AfV4sR95Q77MXg5k3TL5LvvHpsjj54Iu81iIQIWSfL85tioAYyM7o
         y2N1urkZyZH9+Y+XUKqhWjx1gGSv0ta21U+K8u68dDDk9rgrxthv1nWWEvmXifkpZq2S
         kiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995925; x=1793600725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckUCQc8xGlckkBfhDS4Z+p+cNno0WawXomSygH6j/Zs=;
        b=LrmeG+zWDMNlLBGBGO35dMzeGfLK0eaaTciiQ4df7w9XuMyggyukWFwBcOzkVNC5eE
         M5UURMPjQkr2lZTqKxYfgvcMp45gnlvfZaN822T07EF834I8wITc+i1AGO7bwUD5c3j3
         vb+kuV6MflnRBf+FdGt1YyQaTN/LKsuE32BZVsKDYVDomROkSfkiTphWt6ogL+rTsXpZ
         UpAfIfkEvMWKatbB5Web4A3PvnSH45AXP2p8fBcdcjhpZWzapdP7bS/fk+l+af8rdKdh
         KvMCbqvNBWgGtcjQHApJ+aBOg9koMwqwdLvS1529uujKFaB98nZ7rWdmoQXGpEE5VOTM
         178g==
X-Forwarded-Encrypted: i=1; AKwUvBwECsoZ9MAKuv0xQPz5DfWmItvIekhDnkHu99jM1u1Vi9WT7iU6zgqnpbapxjc9W5AGeZiKGXSEspXe@vger.kernel.org
X-Gm-Message-State: AFq9FYLMF8cHfTHkgdf73waLyNGwEyEg6cuifTu6ji4iWfbn+/h+VnEW
	G9d0+vnFVowU4Yutmqq97rqF7562ejU0YihXaqeNueyCrWndYQqLTcN4PvllaDjRip6MMVd/TaB
	3A9Cf3w6pZZRksCCcUDUY399qqtEbia/I83TiYzWBjYgR2g8shbQ0p6WYgXAc8kW7
X-Gm-Gg: AYBFou3peJnZK23NolTZDXCA+dEFUxLkh1S0NCRKXEFBaNMGMK8Zt9tfItWK9q4Gc+u
	14gww+U9aGqXT2vaKdWJlePDBOBNVSyHmdbOu3QDsGkPY4cMLDD+Hyz+Tel12rlDXAs7rc2itw6
	MmyGH4HUxZMylz8PsU48500BnMV+08P1cPFF75VVYyBOtSAf/26PM6X/+Uu4NA8vFwOi+ocJKIZ
	A0NETclUJMJ8xhHxElfpzK3AvueDUx1E/CsbuPeICojIORIctD6a25BcOvOhtNqoiI8IvBx8jJ3
	HbH/oDZrMyLU722DWEoGiIN1fU3mRKqgaf4jMW+ZX3fheT+IergJc7K+3WuKpF2Q0g4GT24YGTI
	atmIA9U1+9J0QwK0TcUDVJ4l7TD53kRYOAw==
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr4744312a91.47.1792995924556;
        Sun, 25 Oct 2026 23:25:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr4744280a91.47.1792995924114;
        Sun, 25 Oct 2026 23:25:24 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:25:23 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:31 +0530
Subject: [PATCH v2 21/23] drm/msm: Support KMS backends without a display
 IRQ
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-21-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=1124;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=DKmn9i1vJXXvP4IBsacfVZJPAx62TejKYArKw6N1S7c=;
 b=vcNZ0ngyibDuHfRXl+gMTdO0b/EpAD7rv0lv4FUaHdf/+mqY8ImRpBvwiZcSIeoQwYeo9vdXJ
 yc8Y5UbPo6uDgvAYRMfqwFRHOii6CxjBVS2R+enurNuUEuwobPHtCor
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX/FDBaf5QJZ/P
 5lA5PQpQdrpMbDSz19fcXoC0S4gvR/zFSIvyQJIb4mnqZXXdjYX+zWRQM4cYd0+kpY8uDgvzTDj
 fMmA5gHcUs+4dYBDwMowy6jF5YJBE34=
X-Proofpoint-GUID: qCWF_1-y4DhHdRB62f24BhXlvZnFn9zf
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adef255 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: qCWF_1-y4DhHdRB62f24BhXlvZnFn9zf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXyI5bRPsrlNfz
 X9ESEDLrj7ilHkqHTSaSa66vYBpHWQgSlUVblxWH14gjS4JDpgeQPIj6jg06J+xkVWf0sbbyLqo
 6LlSyTr2LcKQnYNXns7jWwhLwK1Oo5U6HfqIrA1ClhviQW0Jl/QGoENRsBg6EDshYVQz3y/uIUP
 SbJiAjEuyRCMG6rcaINnFVIes7BZkq3KxbSPMSsY4anOkoPKZjM353YcR9opV2XY8ByPxxl8Xra
 clAWPBBtZyjHoJGtE2DvFXHtZj1gSguoh2lTlhSHhuj0fWCQTLAMt+SpA0xkvNCWODuM1HZ8GO0
 lGzUDTkADv2lkDAAjfqAD33lOSsnC94FbZk5KYyAk+Gqc3yqK2SvHTcdKKwX4x435PcCc+fEK6X
 8UetfKMEVrVKNgqiumaA0ciGvVU1p56ddxFLM4ea3soXCYsBjF8NXNjvbG3yyyEKY/HE3adKNvw
 rI1K4vO7Pzcuz0qv2Yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

Some MSM KMS backends receive display events through firmware or
another transport and therefore have no host-visible display interrupt.
Rejecting such a backend during common KMS initialization prevents
it from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..1870a7008ead 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -72,7 +72,7 @@ static int msm_irq_install(struct drm_device *dev, unsigned int irq)
 	int ret;
 
 	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
+		return 0;
 
 	msm_irq_preinstall(dev);
 

-- 
2.43.0

