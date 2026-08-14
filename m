Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EE348896
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685124; cv=none; b=JpuqM7MmDsrhMYTj7OQc7gCjaqX9v24VTGwCwbHdxtGSs9a39RJEDtdYTTjnViDeS120fdZkMKDSN1/4kLK1XIo7Okx3k+j8RLShsIIaBhbOpj/26dUdiWhZbAWeJZpfNHWAQ1PNiQ/DUhogGs1a3E5ohQI3uBPRowscba2yqaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685124; c=relaxed/simple;
	bh=aNzOFX7p1TZcfpEqI6Fk40hS4UWZP3pk3nIWGwaP5Mc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uvoRkIgHhOVJXJY8zMoO84r6xWUxJNd+dNlrjjLGtJoPRnDvfUcb3QzY5O0J4cmQ14FdlQA1o4+dsbd4/fLekaMKq/M1SEYWZ/+nDLsQ9+Dd6lHId/VFPhYtZOH0LDQla2INnl3BYDD4p/mdbxHqf19em/DD8HoKCd1Nl5H3sA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCUe+Rku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lvgkae2E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCUe+Rku";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lvgkae2E"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QT2i1172833
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fz5pkkhdikAZTkxO1lt5kY
	qS67cDWlTdJePeYXwFoTg=; b=WCUe+Rkuxl23iy3fGdMOBbiIklKoeA2KgQ0Uf4
	XLDGmotp4tSEn4s2PjV4yAIzXM5HK59JSfScXostCur/tIKQfGDYJ8cGJ4vxWX9C
	29OykXvYt69Q7zOJK0iO7OVYHYrm2gMxmbDqAVSNCLnnJxoP4kcVK1YF3saTedVa
	vBNtVQdXc6gXOKmijLcMITX/YR6ZSIMwnBwi/S+cUHK+FWTk/2KWZadtoJIikdGP
	EIzMaBV5QDd0+PMzow5oBZc6RmZbLUuogHM8Siq0yhIZmHYJCQB1AppsHVD06R1U
	DkqetoXHGbpt4bly+j46HQ815g1w/tkFBE2I/Z8wV1atItBg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1nugsbx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:25:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc4c126cf0so1177025ad.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 22:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786685122; x=1787289922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fz5pkkhdikAZTkxO1lt5kYqS67cDWlTdJePeYXwFoTg=;
        b=Lvgkae2Ey06iWHF+YS17ux+dsaszqQCpiSp/WKeWB7yg9+2C9+JNfV66yTbUuZmKxP
         fBcoF6kQcUT+ZPlY1+SZCV+1r94v976uFh0yeu/bG4RkSY42GXpIWb/+ATE1neeDOWtT
         bhA4sUURETqVOzx7VmZ+PMppQzaCjqzbuITHw+QAVY/tploCZ/cR6qeLu2y19SzOQoMk
         07Dy3cuqWFi21Rclf7MjLOS+7QS/SlOHhIv9D/x9Tcu3Lk0iXgFAyqLWjIi52MNovJZO
         woHcxf0VYHaYqbn2IEfaNUNGw8h8d1I4Meoij44Ieq20T1qLYZ6I3rrH/+6lyZeSr7Ah
         p4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786685122; x=1787289922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Fz5pkkhdikAZTkxO1lt5kYqS67cDWlTdJePeYXwFoTg=;
        b=Fqto43+NkPgucrqJwPlm0raUjO2pWmYxhFM6PKnOl60DkIuuqtEBVAjSzZhlLMUii0
         U+AD2fBZsAQzaXvhAGf6REfGXdhyadhurFBvp5mCKEXXUoe1z4GGwBh0DVbhZPuR7LlJ
         aHU9Bq5/GVSenvk3gxoZl2fcxnmzlntTweYl67U2ckzXFPk9ERKe7OzPLgezJegFzEbF
         B7bt9zPJFQcO5mC5Kif0VE4ozUtHWmvrSOZPcPRCQTw6bip9dxuIMkrWs8smWn2MLFl2
         irHjX/DSoOkTWdC+uEd+FYyTEl/n1fr03EY6RNlM4o96qXbqcae72JmDw1tvWcbLnKCr
         K6IQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3kn/al94bk93dUhIPyK0TlXosHWRohRHKqmnbii5tJ1Iw2LG6CXXScw7kkdhzF8YLPUxmwsvxL3Rf@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrvGEjwzOqalLLuaq98vNeQLXZqob6uMFNaZNSYVsfp85BOez
	wWd7B+mfAmCcD19Uus3tCDOxs7rhAH2v6QnWDWxY6yMJXAge1jXJYf/qFRy0iu2h8c0OyrSyG/4
	cNhrwiAM8HY8o32VWFQmg2PGrUu7/3ZsV0Zdu7/LjhJ9Uix518O5aqRcX5YAfHtQd
X-Gm-Gg: AR+sD12vT5DkREZ0DihTJEBp8/+2jeNvYkmDxC9ScKUHgC99fwFzRwvHnlsAJZ1r2F6
	8kY7+q3N9J85togzUGBcBK68lKTt0Gd3w1EOOJBPcPsF4OXswYQLK/VbccSKxc110MoSJO3pD8n
	Uyl7VXT1zlfq4Alh6hGTiQ2lUseJE/CzVy2FvT6DtsLBWFxfOb6g6ukNsD+u2qNyAewFZrIpEY2
	C8IFBhrk+EkqfZWjvZRLbHW0FlS1jQL/a+o/b0T4wShWEQKkMPomNoxeZwaTzXWVvWCXG9A8URQ
	IW7b6D1UGYD/5w1CdN8dTHFHCRO7I+x0+3n6vWorQ1YsanVsQ8lwRwDVv+38pE/bSedjnBbXM/n
	7Use31BSlO9l6AK73r6pTcTSBZeKuCh41x1n5sjL13eVDHBbZcvFpDs9taG7Ski+ch7iLP3pyBM
	qdubxPNtooCSdptJoPH6kQ
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr24251485ad.2.1786685122194;
        Thu, 13 Aug 2026 22:25:22 -0700 (PDT)
X-Received: by 2002:a17:903:2451:b0:2c9:d298:6c0a with SMTP id d9443c01a7336-2d3b0d7af99mr24251045ad.2.1786685121769;
        Thu, 13 Aug 2026 22:25:21 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2a0b4sm4545835ad.53.2026.08.13.22.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 22:25:21 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH v3 0/2] drm/panel: Add BOE DV215FHM-R01 LVDS panel support
Date: Fri, 14 Aug 2026 10:55:12 +0530
Message-Id: <20260814-b4-lvds-panel-doc-v3-0-1ad152a4d3ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALimfmoC/33NwQ6CMAyA4VchO1uydYjgyfcwHrZRZAkw3HTRE
 N7dwcUL8dLkb9KvMwvkLQV2zmbmKdpg3ZhCHjJmOjXeCWyTmiHHkp9EDbqAPjYBJjVSD40zYPS
 RS1NohZpYups8tfa9mddb6s6Gp/Of7UUU6/afFgUIKJWoDAppsC0vLoT88VK9ccOQp8FWNOIPq
 gTfgxA4tJgIkryuq3oHWpblC4k8ZN8CAQAA
X-Change-ID: 20260719-b4-lvds-panel-doc-cb503c4ba2be
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liu Ying <victor.liu@nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786685115; l=1209;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=aNzOFX7p1TZcfpEqI6Fk40hS4UWZP3pk3nIWGwaP5Mc=;
 b=hKUUIMJ7zhbPb+rvehXtpQTXg3IfsIJKDUmlgS6y1bWF6HOEYzCmTmN8XQYUgI1/l0E3eNZwe
 DYygSGK9Nl+A73N7+mvKwSyfy4K/sfWfmCMZnVTHFmA9PnCaPZ+c9t/
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfX9nZul2pDi7Mw
 uLyOYVZ9l81sUUg2qj/Q2AW3y68PtefSCvLUCefOuEGl+xs6qulOum+Lfd/ilUWGX1CalZS9Fjt
 pcqSsKMPmpJDdcZuEXWH+YOlBEx4upx+AOj0JzNUiIqwSRTCC98A0QINxZTrcdrCFq99DSOsTtS
 XkWn/SyZMAwBlUmnO7UurIBN0wKhWYFlRJ8IOv6og+WGdFSjownxPsx0wF5UGssg0mMjpNyBXmH
 OLx3NnF26IBa2XYNIpMZMFq78IhmRvwi1lF5mZtfbZ8bTJkhREP3L+ga1/34suDf+5yH/ACs2U3
 uf5Rn1BDvmvZtFG7VQ1itnL+VkneE3roxHikXN4skO/qzZNmGMrjxafbRVj9v5JQH+PyWPsdf1k
 o5IXFzrJPlYgJRrv/kd0nA6Wmi3QfbgcwiNZzUsxlgaP4v+Vm9OXHbrHL+SbRD1OwiXox+BRlGo
 k/DPzFY1qOOJGFiOKtA==
X-Authority-Analysis: v=2.4 cv=drfrzVg4 c=1 sm=1 tr=0 ts=6a7ea6c2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dmYVuBIMaTYquxi6TZ4A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DoG3hLAglYoUclKJ4Y6SE7c30Z2c7pyI
X-Proofpoint-GUID: DoG3hLAglYoUclKJ4Y6SE7c30Z2c7pyI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAzOSBTYWx0ZWRfX/dsCQM39MU1w
 isTmUm7+0pARYx8c7zxSxQrGaPfsIxcdS5vcKkO7URTzkEoM8kCw+9/vxF+B3C1uJHcsFOkGvTg
 rBrlRBSvdYWI+2NCa7tX9vR0ttu5aIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140039

This series adds support for the BOE DV215FHM-R01 21.5" FHD
(1920x1080) dual-channel LVDS panel.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Changes in v3:
- Reordered commits, keeping the compatible documentation first [Krzysztof]
- Link to v2: https://lore.kernel.org/r/20260810-b4-lvds-panel-doc-v2-0-f2c2fe309989@oss.qualcomm.com

Changes in v2:
- Move panel support into panel-simple-lvds-dual-ports.yaml [Rob]
- Add  panel timings which were previously added in DT:
  [https://lore.kernel.org/all/20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com/]  
- Link to v1: https://lore.kernel.org/r/20260719-b4-lvds-panel-doc-v1-1-6a18c213c2f6@oss.qualcomm.com

---
Vishnu Saini (2):
      dt-bindings: display: simple: Add boe,dv215fhm-r01 compatible
      drm/panel: simple: Add BOE DV215FHM-R01 panel

 .../panel/panel-simple-lvds-dual-ports.yaml        |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: 104c00917264c5b9571072471e3a8689cd1a2c4d
change-id: 20260719-b4-lvds-panel-doc-cb503c4ba2be

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

