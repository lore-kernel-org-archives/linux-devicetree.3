Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743211;
	b=HJL4z1YzA1zH6/FdspFsEnCFJY6KU6BIkAtLs5CP3pnNtZcOU3nnut7xNNanDgSS4imP
	 MjqrzP99CRJf4LXydaUu7zL75v/F1fcQ3q4cwtjCSWcIit+mKADxqJMzygz5+gwf1CCo8
	 rRXQsuxn8nMXgvpcxeyIE3a8z9jAhIqjxmIurPKoEBAUF+jXh5x+sCrsmH5mZgwnCuvzO
	 3R2z/+UOYNK9hRzPzNTLIef5miWgx/8fimscuhlxfueHrte8DNiYxkOI4uDHqjH4YyU5B
	 kByjtJV9iPe0FT92ADBZFenfkUue4ZId9zbdCya5OCFcUfL64wwOGC05wF0URf5qgjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743211;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XzpZDTY98X35K0p7w7mx3UsWiWF/bbvb8wtCEElzp6A=;
	b=1T594WWfm71I/RhNwruMjsnDVZ0qHA91M+cPuscSSAA0ZyeJpaLvz834CQR5rKycsW9L
	 ZvJnFh6+vja/gSC3a0yQ6eUe1NVsSGqpI4OquwSU2pUX8/RSVpPDWP8qfiDK4fFgc5U+Q
	 spRyq3rFQ8Bu7nnwdL9sAyhpII0tud8k0fYCtbqlXgGg7qjAs86jDTmpXLlwo1dJ7sp5U
	 qBW+oXIWozYHAfdweb9lgfewYB8oi5xNHroareHjg1pqyPVKqsNpC+YTFSHFUZdKXl5ys
	 CZ5AyZWLFR0+28CRrSSlTTkCip6qvNxSYIkh0/4/VNhNroCiWqnfPUH2OjzFLhQWoYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2nWi4wb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jWdlEZ4+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE15606A31E
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K2nWi4wb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jWdlEZ4+
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FOkn1552878
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XzpZDTY98X35K0p7w7mx3U
	sWiWF/bbvb8wtCEElzp6A=; b=K2nWi4wbmZRzuQqhcotLCc2T3ytyfGTPtAqhrA
	Cu3D82gtUqlIFSJHNgZD3efyjgNIJ4mEv0PQQhybf8OzJFAQzIJZ5B2QKbt7P1r8
	p/lNKuXR/b1nWU2xM27CDjcP70GCqXxDYDmJG4HpHbABn1JZ0lWCt3BftRrJ754u
	QuzGFeOkx1Qq0HhFE62Y/zEsy47T0P1c1L0zMN/WubBTQF4Sm77DfAx5tNsiWFW3
	yy7M2vKGKiv69lamTaVbCwG5iwAFn428oEugTVvb+Vz9Cm5CBRRDKQ9GeBKc87Nk
	TX5vbUbEiZogrHHnuoWEQaLvUaeQMMP1UKCDfEF7XjnrHfUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmttnbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 08:13:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a2de2cc1so8710406d6.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792743209; x=1793348009; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XzpZDTY98X35K0p7w7mx3UsWiWF/bbvb8wtCEElzp6A=;
        b=jWdlEZ4+YMiBcqP6NBECl+VVvbRSih+qxTJOvUla3cgPcNGKu9IMKkkNcJPIChqGHt
         yWi4l3E88WAGGtASEPQEX5OfH/2O7RWUvaupaSJzNVU6dGfupkXqOMN3k4Ma39VHMLmG
         ACIlXj2CJF2UH64QrU8nsGfRlzHhbgmyMYB2+ZE/nCuIvzZb/lr3DqyxKwp9mtJFKZE9
         VuWshDRXtU9BrMPZpXXOMOYzKZPYGEBGqrtVOGHRkGbj5lnVHImAFSgvUuFP9sfcUylq
         wNjcxOK2soTDBQf2QaV2i48fLQG4PCXq9+ir9VRGaUwQvtbinX+A7zzolijalKxEJ118
         efcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792743209; x=1793348009;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XzpZDTY98X35K0p7w7mx3UsWiWF/bbvb8wtCEElzp6A=;
        b=Z2uZgxvd62xsn6zjKiq25RbC12ScJApF5QFUpIi4KU203zrlTPJNRX6IM5n6d0DY8H
         Ey+Z9uRbQ3g90OKhlVsCHGI0w2NHaz6zsxSh41S7OVg1R+1hJ4cV9FusrbF6SdK/ePuI
         Y3PjiweXWu15siWIfsjX30+AFsT0tUm9ADKzwEtYsHdgRJhz2+qenB06fOgq0qKsi1GP
         OKNWjTt+cb8bi5/3aTzakwfmw75etQBYqd5QoEdMSwM7KbFdIjx6S5yQWtS+qR9ctUY3
         ZAk1KIzFvpT+r9wL6F3yEnZT0nVPIuVs9spZOd2uxSeBYBgQwTPaO+L5bjFgmK52B4f5
         FjSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5N6U4T+TNnXFJi5k6OJ1mnJET+yRz4B24vPQBrJgQEbNLJNagcTBSMUp1mhzE6J3xXUF4WEOSwen0@vger.kernel.org
X-Gm-Message-State: AFq9FYK5dwV787lbkjSkWzGlcvtTNOE3zw3jO2MVFbh346AJpKO3+Flj
	vcX3LcfdddxaLAhG00OaqM++a6g1cTWWBuopwMmMlPagqsSHI3uMiw6kW8/cfeFRkN8EHYEd01J
	Bm3vPjOV0eUoeyJb51kYSz7+JhGPZZs8DWAs83D+JO94fVzNRM5oNvE1LF0ZKaOVg
X-Gm-Gg: AYBFou0n3QSeT3FtO/jr67Gi0AefzBFfmCe6T2usZ9Tylro6muU56h38zUAmqKz4EXe
	bRxCx/lizd348RUR8U7KrbHPDf1WgyQzECKxWUf/9Np0hhNn8skqsZru5d4aSE/YEB+QoGqOPJM
	0wPW0GpYQ6HFwGSu6JVYRB0Bxrf0OWQkLMDzMl7R7uaNWtHbJxodyoQwSd1muPD2qxIg9XovSYW
	HiLPHYGZ/8IPiKNQiUC4fHnc9TKqRYtEOLdIeH282XBbaInXGS0hvj1OVAR3SGqbRzdbCNfLxdp
	jSD08Jn9UkWJkj0b8mR7BjyUfZQGSjqWocDey/6ApsAn0y4/fT07zd0pcSbPQaun8g2QghKrlqK
	HQ9XmebKGM7vyye13oD8WGILdbHU7uwvou6Cps+KYb4BQL0oLeIXqurrZ46PTpA==
X-Received: by 2002:a05:6214:509c:b0:91b:8d12:bac9 with SMTP id 6a1803df08f44-91c3a4bd85fmr20159006d6.0.1792743209354;
        Fri, 23 Oct 2026 01:13:29 -0700 (PDT)
X-Received: by 2002:a05:6214:509c:b0:91b:8d12:bac9 with SMTP id 6a1803df08f44-91c3a4bd85fmr20158466d6.0.1792743208830;
        Fri, 23 Oct 2026 01:13:28 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c396af493sm14345626d6.9.2026.10.23.01.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:13:28 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v4 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for
 Kaanapali
Date: Fri, 23 Oct 2026 16:13:10 +0800
Message-Id: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABYX22oC/3XOzWrDMAwH8FcJPs/Flj1/9LT3GKNYttIalma10
 9BR8u5zU9h66C6CvyR+0pVVKpkq23ZXVmjONY/HFvRLx+IhHPfEc2qZgQAjLAg+1GG3TzUCj+h
 BCQE2QGJt/6tQny+r9f5xz4VO50ZO9ybDUInHcRjytO0wSYqIRoae+miCQ2dNjBiVJA/gUGvyF
 JDdrEOu01i+1zdnuWJPPpolF1wbZ50xyUQUb2Otm9M5fN6OblpZsRn+AC9fHwFoQGtZUBadcvA
 PoH4BKaR+BFQDeknJ+DbQ0jwBlmX5AQ9mWcN3AQAA
X-Change-ID: 20260720-msm_gdsc2-cb9230027a2d
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
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792743200; l=2960;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=koeKof9lWoQPr70R0/9p9MqB8DhS+MvQ9mfyxhhF+0A=;
 b=XLJfrEMwU+3J+WogPu+bHoi36ooB/UzDIKQa2JXlYZTZgXEVBANULaLAq0jC7jeBoVJtYtxFf
 ZSufFq7g7GrCcfZfuzKEVvFi19S384tSpwdx4MGqrEucd1bawPSbiLo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb172a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cXFZYRxNi65dCB_EMakA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: rJ5T03cWc7YZy05t7MgbxEkGrjrKTsWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX7WO76SStfBh8
 x+8ocJHrilA3SgcUYVOWQ5YDu6tU9w5/S/2caaVsD8As3cS7PcsDtN/B9IA4gS70jqYtNVOxLwq
 8Cm3V7YDTg+ec/2tmlYINyKvExS21m2xkUilqLCMXQykdn2Qmmg49B8B827NOQj8cHvwrxOk3Qu
 /3fyVNJvP2oTQZRrXaBeTM34dPYe5S/zjuJ84C7ai2qU2yK3ZZWWpJqN0NDe8nRE6/ZXFfrTT24
 FDcahs+fOxOzFkKYp0QsyqS+2OFwtDp1id07PWITuzECMtsjIl8taNYCFbNXQhBGeF+dquhprWA
 FBdpPdBugIwpkiDD9pL2JaNsUUiznZDGBECvYlPnNLkU/AbXz49rOIPgvxQ46Dl0SdQdQx8hW9J
 aCXbxvuBwc34bQ2zAaFa+RNf2WWRsTfndsW5AD1AgVeE+Gv7+F5q3nkknFuaHhy6hOZaVekjBxk
 ehGbCDKdZR7FrnV4PdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX2cmgrD7T4SUs
 VWuoiEEXp6QIS3CnJD9ECALzVOel1pWnOa1OK7zxfto28wn/qOjDvoJ4bJ9Zx6Vb6YIYrAOWDoH
 6hm/M8uqsARHOWhmZz17KZrsx40EJeQ=
X-Proofpoint-ORIG-GUID: rJ5T03cWc7YZy05t7MgbxEkGrjrKTsWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230032

Kaanapali (SM8850) has an additional INT2 GDSC that powers a
subset of DPU source pipes (VIG2/VIG3/DMA5). Without enabling
it, those pipes remain inaccessible.

This series describes CORE and INT2 as the DPU power domains,
updates the DT bindings accordingly, and explicitly attaches both
domains in the DPU driver. DPU performance-state votes on CORE
are propagated through the genpd hierarchy to MMCX.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v4:
- Keep the widest power-domain constraint in the common schema (Krzysztof)
- Link to v3: https://lore.kernel.org/r/20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com

Changes in v3:
- Replaced MMCX with CORE as the DPU power domain, keeping INT2 as the second domain
  (Dmitry)
- Used generic "core" and "int2" power-domain names (Dmitry)
- Propagated DPU OPP votes from CORE to its parent MMCX domain
- Updated the Kaanapali MDSS example and fixed issues reported by dt_binding_check
- Link to v2: https://lore.kernel.org/r/20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com

Changes in v2:
- Moved INT2 GDSC from MDSS to DPU, as it only powers DPU-local source pipes (Dmitry)
- Dropped Glymur — only Kaanapali actually needs INT2 GDSC
- Used if/then in DT binding to restrict second power domain to Kaanapali compatible only (Dmitry, Krzysztof)
- Dropped PD_FLAG_NO_DEV_LINK, let device link auto-attach handle INT2 as runtime-PM supplier (Dmitry)
- Link to v1: https://lore.kernel.org/r/20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com

---
Yongxing Mou (3):
      dt-bindings: display: msm: Add INT2 GDSC to Kaanapali DPU
      drm/msm/dpu: Attach CORE and INT2 power domains on Kaanapali
      arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU

 .../bindings/display/msm/dpu-common.yaml           |  3 +-
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  4 ++-
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     |  3 ++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm6150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm7150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |  3 ++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 26 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  4 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 32 ++++++++++++++++++++++
 15 files changed, 96 insertions(+), 3 deletions(-)
---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20260720-msm_gdsc2-cb9230027a2d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>

