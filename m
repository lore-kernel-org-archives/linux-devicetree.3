Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A549CF26
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050046; cv=none; b=grqFkJWZNfAuCJBXS4mID2mOULnjPUXaGyYiCmCik07R/ZtaB2I433eUmhB+rRpQB5wYzXGqPa4nU6gnsnI+FC2PzeRtzXQHE2G8MnYptyjkAlqYkyEKO93+hhOH/JWtynoA5DTfkfrokW9YkHEAqUU0DZG8J9pyVoW2Em+KDW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050046; c=relaxed/simple;
	bh=pTPCAX8/CsBLoyOLjrC5Lj6V4R1as0wD8+LPwQqJmJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1tog9wg7LR3vvZHAbmMTeOvTG6eHiM/hCQDqrrcYjV72Qn8VNbHcf2FQ/tAsjT3u4jpsCj4kln818TrzmS9ZKJQ6i/UcLa5VyyHZSzBNTafJ+xBKz9HMf5HhUCAl+cMOQOhAV2ao4U4az1FlJZewATMCP/VwxcRSM5hjrcxT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIdTD/9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j4e4/btu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIdTD/9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j4e4/btu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wgIY1889628
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vF+/3sIhapVNAvd6rUI9asvRG05C8hSNvhBnFb72r2M=; b=SIdTD/9Q1pJ7cRvT
	Ep5lZJ9TJoyJw65D5IM01kpMOplvmPeoPV+ixOSMXq6ROKKRAy6tpjON4a/BTQvh
	u2cnjPDWlEtH82VVQ1LHSmeYGj8yo8HJgZw5q5wSWMO1e/xNmmTbGQ/uZrG1Kqza
	VZFjusIq/Wzouc72g0bnJOApxNcMOJHRwQ83h0pdHv3Ud6MCjTupBxs164wMNfyp
	mg5aYtQmgOsfpmi2CY00Q+G8/hkvkaKqI/dT2VwNgEKup05JrbejAbp/LO61AJ6Q
	DtWAP9djkYOU6GyhQs5EIc8wT/KCK/85avZ7rzZEuSNAu1tuBH/DQ5YIo1a4KEKh
	O/ZLsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda0snm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 07:40:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so993709a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 00:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050041; x=1792654841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vF+/3sIhapVNAvd6rUI9asvRG05C8hSNvhBnFb72r2M=;
        b=j4e4/btuoOACQxy7rWOpYmMP5UkkoqxmvSosxWbjwR4RxsrRsnhxlqWaZxhUUMUzGs
         mXdAkntpL6Tzcqi18Tz/xC4kt5aFzqEg3gQmrLozvTHOAUjI6fEfSDOdUrTmYG9D7pon
         /dee7gIum+SlqVNVjm5f8RukLpldj16Dcy1lyzdirO5/ZtPYmN8HQaauTqp3TXbFQHaZ
         pj0TmRqFWfxVnF8Hz/mGyeaUa9icnc9bIMcdKQc4DcGNd86ylSAzgii8vrjrARhdpFa3
         OUXZC5EpCLABS12SfYRP9vExjxgGoqbglZiRsslcqR4S6vi8IaDfxkg8of6J/HXvUvzQ
         VBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050041; x=1792654841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vF+/3sIhapVNAvd6rUI9asvRG05C8hSNvhBnFb72r2M=;
        b=thCxWht14O3HYOfUWuDnhQ2Fy0Zn963tlHMHLdh418DoHNgedw/oKgYRw71WJ5ruvR
         ial/+Nnkknn/0aU6MslKVofcUzgomPKHJ2BLPI0GmVaCCF6ws1L6vQf90gjHHMPyVuKU
         GijYAbOIDaC9OYmMYk1BhMRygaTj4Shr/8umkBv9rAsL46RIFGIV4QX1TUm4mrweGTR5
         094SMrFPPOff6Zt519StaV31JM/pVGIjn0+/xarIzdpdtO/kiAed6mQe4CnATuZ34EXX
         zPKI9DtoRQ/wbA8TDnWk38Y/KSkf9nXJhiZ176ibKsa5Ow7nlTJRdQ2jksBOgmtMhuFW
         ik4A==
X-Forwarded-Encrypted: i=1; AKwUvByGZZ+fj2l7ekUbSof1Xdz0bTgz/oknfcaFG1I1jE9FJqvEtDYV9gohYwWYh6UDUejc3ozXk9Qr1yym@vger.kernel.org
X-Gm-Message-State: AFq9FYLSxqgfZ80JuhVMIB/snsJfgQnUQ9e4PKdeoIPU7OUg59ZyoBVd
	uNW0HTzZQRvc6LuKPpkX1flQCVQY/Vc2/emY/KEOKft4CHxDEP4bsmUiVw7wW4HOXYghXvrOgkC
	NSWrJMv+STSxrftnEiU16DL+lMFOBhNo2FzBZo+ihj7huTBS0flDjBPJ+1exqkOgy
X-Gm-Gg: AYBFou1UacCCgPBKhRMrb+Kl0Bdw0y1lOgX3NuQAfFbK2HilKtwg3Vl9qaCW7aTLUP1
	4PHG86dgT9HAbYvjRXoQoCOVVxY6+hqv1cjL8wnkqczZWPq8Ssr4nA4aHdFlV4qDc2aZfHbSGrj
	MSRoUwPdvKTufZMPJHmu6OcxX8NhRZ1g60BGRKwzTMcitu0Lb9jVjOZ6RpZaZ1laG+bmL/81iPL
	PPl4givcTUnmQWxliRtEYURQmf+OxdvoHxOww2laNBjuu+kTk4Pu1syriEbWqybJJXdPle87wbw
	7yCiEJqsufuMQ6H2t2gY9jVkbsQmvSnTd9tfJ+EGw6EptFg/7F14VsAXIAVPTCPreKgLvz6GAn0
	amvtfwx/+/WCWSdYKXLhgdmjDK2F3OCOHfpc=
X-Received: by 2002:a17:90b:2d88:b0:3ab:e789:ce88 with SMTP id 98e67ed59e1d1-3abe789dfbbmr10015444a91.65.1792050041525;
        Thu, 15 Oct 2026 00:40:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2d88:b0:3ab:e789:ce88 with SMTP id 98e67ed59e1d1-3abe789dfbbmr10015411a91.65.1792050041033;
        Thu, 15 Oct 2026 00:40:41 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:40:40 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:31 +0530
Subject: [PATCH 11/13] drm/msm: Support KMS backends without a display IRQ
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-11-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=1124;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=pTPCAX8/CsBLoyOLjrC5Lj6V4R1as0wD8+LPwQqJmJ0=;
 b=bpN+2azNrend/0/v4WZOz4wDoLmEO8sJ90IY/xsoZK4QTV78nMaroxlzAY8V/oq+gXHAmu18l
 9Tt1n5goJYjCSa0YqzJqvqdZna5CUksVpN7ANJ0NieJo5BBw41WGD38
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX7S08IPblsoBN
 nJxTQGvsLli0ZsTUtEyp3ghiMUn9GNhb0t9lVauyPZKDXtS6Zly+ZPmLFHf41av1fDRaWqWdMt9
 aSabAbr1JSi0KEDjjkMm69uqV/npzyk=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0837a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=g9RcmOnx5enkyd0xrYgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: R9tTeYlWAfYe5isg7GPUpT5YQtJuLBj0
X-Proofpoint-ORIG-GUID: R9tTeYlWAfYe5isg7GPUpT5YQtJuLBj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX4fNiX8Go8lPA
 Q65KAh2ek/sgbl7p84HLUMu9pkXhZOQbOHz63xsRdSl77bfOVZx0HBZSi9cJORZMEnxbOsn7aEx
 QN/yNuqyoAuuL+0P7KUHtDvcz9HXShUkSQW1hjmQZMorMpp82ioBIgsxJbl1xYNuVOYmB1XfxrD
 nnpHGrbMRavDO4dtud6jCxQv85nEL2S2ZhGNEw3XgF5/X0mLNrHOhb27Gm8ojQ/DPMQONOQPrzo
 pU6NcXqaw29KdBORCC4wu8LpuX1ScJwHv3k/nmIteeExmpY8TKpjaou32t2xutSfcxqYoENGKga
 xvMs6ROM8XmPMmlkqT9UgyOLGZRlGjYV406icu8V1LsVqvBaRIvCOoWP286ypuUq8dSJ4w9EZq1
 c3tgzYU857pRuA1VHt06GvbbTrGeKLnKyG3aJMZMpRH0QtFCS3n2q5HCHHpN6IR9RKZKmJ/mMmA
 ZUWH6ItQDfScnh7c3tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150030

Some MSM KMS backends receive display events through firmware or
another transport and therefore have no host-visible display interrupt.
Rejecting such a backend during common KMS initialization prevents
it from using the MSM DRM framework.

Allow KMS backends to use IRQ_NOTCONNECTED. DCP receives VSYNC and
frame-scan completion as asynchronous HFI events over VirtIO; its IPCC
interrupt is reserved for power-notify acknowledgments. Existing
IRQ-backed KMS implementations retain their current request and
teardown flow.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
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

