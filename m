Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015E484242
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284504; cv=none; b=bQWp55YzPf34woS1I+Wufou1jMaZoRqhcVL1Cev9oo+vw+1/5oB2O/UHbPxXZCWy5cMNKhYEJUUIodrk40bO+a8ff7Anbgue7KidT9K15cBrHdFpo8VKEzbQGSNna+uh1yJzs48fk5mBQWMPP6v0rOkKBJUTGhvsBnkfXkAv8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284504; c=relaxed/simple;
	bh=6IUXPSdbKOsyfWx4OSWOwiBNqzxDAfnOvLLzJ+xlzUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZNlj4qdtb8CoAEJI/c7J0cfZEYmMZGirBwkHVVrGYR55flMC1qOmeW4BFJIcrwQjyE3kHov+iZetPawAqgs9qIzqUGQ7S+DgzI4w2ql/vbPLkM9xYaooC3o4Uwg1fZgQjDSnGJtIX89ph54nL569ddS0EJmNTofNgOc45J5XpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1tYCmgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ShgwmVaM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1tYCmgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ShgwmVaM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIdkRK3462587
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nGnvZWXMboJT5WL07jHly7
	5r0lu1CZomvdfiX/iCkcg=; b=X1tYCmgcBs9GzqHf812XUBsofrXPjVwYjrwb2L
	UHoA65e8b29PKcBl17NocwC5VG7dIMjakjp24eUFZFJhPu6ysIkf8+VZIW8XoQQG
	8I8201X4tWoluXbnNmkbQCij/8F4dYQKt+SJzviOh7iK+KnprBntcZKsNSfoiMSl
	eSeaGrWSIN6wrYOAkinq7wUy07Ww51YeX5vZMVzesSgPdodDgMmuGHLKZ6ZePjw7
	HPAlJNHb36LitcBHEhwv/2DXpi7EZjhePD1rB/TSr8JNwR6RKk06LKMQrFw7ywBE
	yHxRvgqrd28wc1utHEda1Lqfp47i9H6RZzvIcZeNwkcVzbBg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjjpk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 21:15:01 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so674626c88.0
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284500; x=1790889300; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nGnvZWXMboJT5WL07jHly75r0lu1CZomvdfiX/iCkcg=;
        b=ShgwmVaMZVtggL3IIhGKNz2lqm4N8tX1k2xYN0bC9WFiGWiKhGoZs5P56v6tH4zyUk
         at9Lw4sN2Zg+zGGU2hFeQ20PI0P6lHTmd31SGqw5yYf/DPUJQKDYGM2mW7aJ2ObixmM9
         fEk9wDb1s6AOOyx6/81euH5Sc/X8SVQMEEjTedzR6KklpX9SnRH/ejEgKI9Qre/E+K+D
         NiE9DSpeBQiphbNhj718oEeed4ODT4b0yVrSB3zr4rYJUnn0M/JVjvOkT9AXMUgQjPtz
         VR3EbqqrL3VX1LogUFYRMlMvx240Ab6uaGvRlJSzqDSPfoRb7QrEkl+IMWa5cwjsB6LC
         7d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284500; x=1790889300;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nGnvZWXMboJT5WL07jHly75r0lu1CZomvdfiX/iCkcg=;
        b=ua1vo74UnmbAODV5PktrCBUgrHELrv4p4cTVGl3ADgEowjFfLSVZu3QnTf7Ruyqai9
         orbL6Ltd55s27fZPJ5u7lthjSYTHx3VjnVbVe4b9i+A4GMxuWu8HjhJZOb5coW2omqHU
         XOsC8Af9CxIG/pKyAbOMhZLvpAPuvKog4Fx46dhmsf++/fjO4+1x/wcUCzocFNa/E4Rf
         Gs8hOTdf9Gvtn4bf1URK6hgA26Cz/W9rNXf2WTiWVTijiKhbQZ6U0I6xpGPclcWFWaeS
         Tv+O0YTNT0FJzKItaR6l5wQIBUr/HzQ5EkLNOltI27szHRq8OPRrOaADLwC4IRFcJVMa
         CXhQ==
X-Forwarded-Encrypted: i=1; AKwUvByX9KmJkxyA11CvXZIaJM3nss78+/WNPHdG7LWMrWudFyaKas8CB9M0duZDKIgPtE0nCj4nhPUHxmq8@vger.kernel.org
X-Gm-Message-State: AFuF++n1B4F7brjGtl1yzXD2TZc6hEqIBfvTk+FnsOPt1zyeahj4AxiB
	2m6oTAj4q8mkuR2t3NP+gFytq8YA4kN9dU/iw9atP5B2Pj5DuCW3owac9fAHXChTX4ye97CL8fk
	nRbPCGG7MZkdHQuWX9xytEqTTcgMuqwAo1vrU30Ed5HyJCszCAFImkEChRBoWLlFC
X-Gm-Gg: AYBFou2VDe9dnGM+95sDPoxbGOnv55464y6PYInM7S8GDHflVLQ0P6JK4Y3YByNuNZ8
	yWygcyl4imXRQQhjSId/Pp4t2/bRwv9MHZquQVADOQe0fP3n4fPUP5JlDSytrMYP+NyCFx9Dfsc
	db4O1rS0Znpj0fJeN4EgGLz9UOl08X+EVFjeX3PdcYe5zCks42g0O0QYgYsvcwMaYl0W0NkNq1T
	WYbZcDNNwhP0TxcKUdEgGoTM/+/zQPgRUWRR2uk0W3X17fWoPJBobYvGxWX59icmEcdCJ07LS+f
	XtqvYWrile60KXsVRzFhOU0spdWKvCFX/nhlUjdfg7rEOKzjIIv4kNJyCBxE0TwHs623lB3ajtu
	lnJ/tr+SNS8Dv0ZW6M4qQZrE=
X-Received: by 2002:a05:7022:fd09:b0:143:4710:a869 with SMTP id a92af1059eb24-14503fc15c5mr3510206c88.2.1790284500146;
        Thu, 24 Sep 2026 14:15:00 -0700 (PDT)
X-Received: by 2002:a05:7022:fd09:b0:143:4710:a869 with SMTP id a92af1059eb24-14503fc15c5mr3510187c88.2.1790284499546;
        Thu, 24 Sep 2026 14:14:59 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:14:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm: Mahua GPU support
Date: Fri, 25 Sep 2026 02:44:31 +0530
Message-Id: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALeStWoC/y3MywqDMBCF4VcJs+5AMqlCfZXiItWpziLR5iKC+
 O4Ntcv/cPgOSByFE3TqgMibJFlCDXNTMMwuTIwy1gbS1OoHNejdXBxOa0F7N840rbYjWaj/NfJ
 b9p/17K+O/CmVzNcIL5cYh8V7yZ0KvGf8swT9eX4BxBlgrYwAAAA=
X-Change-ID: 20260925-mahua-gpu-341a15603d23
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
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=1715;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6IUXPSdbKOsyfWx4OSWOwiBNqzxDAfnOvLLzJ+xlzUM=;
 b=ZDEuG39y/xeorwQ7rLvMYxmR6FW0MXfI++Z1rFW9qkPnL+UFiFq4+ELnF3gGqaBqVuQBjciXU
 eSZZxq7cjqWBMVoi2tv7DRDO3k94/hha0y1i+5bnnTJRCAoufmyxkQ5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: hU_YX8j2m3axAFesrwjSIjFNvSP8_q5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXxcJU3XeI97jY
 xKABCoMPNNt4GeG0FW0z4Ktu9ogIzZG2Kdn4m2UTYS3KJWQRjKRrDmbQC99dFtlb6OnnEFEfcMm
 OX1LdaK4EMqcSQpOZjrxQBG1nNCNXdehbXAlfzkSJHusXaHMcCF+b2uh/n2nquCDzAaQ1Wuf4kE
 wli8C3MbF7/1IGS5UNkoaP7Tfv3cfOhI7sC+WIQ303qfihKpMXoLoHZxqguWmz5O5Pxr5uZ65fI
 DRbXZped7Ob/55pe30HJlSdnn1SG8lbGujeSd6XTYeV8EYjlzHZsr8wtoU+NyVJlMzF2hE4ny5s
 hrZU21uq4InvZfj7S0HaPCHO5JDFhOMj76Gp9nElJdzbysv1oHh6uv9UkFC728r30yW1Sd4Pjes
 CYLraC/bVjBMJ12CViISu0K4+dqGNeAGUmxlEmCdo5YeIgpJlzVDHoG7as8iVkNopGuZHrDI1f3
 knj2/yU+kD4GsLHFVtQ==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab592d5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=44lFysMMeNXQ0hntYWMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: hU_YX8j2m3axAFesrwjSIjFNvSP8_q5r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXwC+DuSM1+1pk
 2A8nGsha+6VPawbuKqmsCQy2X7an+YsMRiMDajlXWa1QHq956Q5Qo+MNtpsaPvD9UFHoXj0PQPq
 tssl4vuYyasO55ilUgTTShiwZCCLkmw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240086

This series adds support for the Adreno X2-85 GPU present in the Mahua SoC.
It is a smaller variant of the Glymur GPU, with fewer slices and smaller
internal memories, but it shares the same register layout. As a result,
only minor changes are required to enable support for it.

The first couple of patches fix an error I introduced in the earlier
Glymur series. I incorrectly assumed the X2-85 was the GPU used in
Glymur and used it in the compatible string. I believe it is reasonable
to correct this now, considering that the Glymur DT patches were only
picked up recently.

The DT patches are for Bjorn and the remaining patches are for Rob Clark
to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Jie Zhang (5):
      dt-bindings: display/msm/gmu: Fix Glymur's compatible
      arm64: dts: qcom: glymur: fix Adreno X2-90 GMU compatible
      drm/msm/a8xx: Add Mahua GPU support
      dt-bindings: display/msm: gpu: Document Mahua GPU/GMU
      arm64: dts: qcom: mahua: Support GPU and GMU

 .../devicetree/bindings/display/msm/gmu.yaml       |  4 ++-
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |  2 +-
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  8 +++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 42 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  7 ++--
 7 files changed, 61 insertions(+), 5 deletions(-)
---
base-commit: 1e9b8055458b92f9ebab6f39d97ade5265a0b012
change-id: 20260925-mahua-gpu-341a15603d23

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

