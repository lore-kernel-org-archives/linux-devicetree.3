Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBFF198E91
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126115; cv=none; b=VKsl6JA8m6HaIlCqtfbmBVr810YZfy9d3Zw3/kPBGroGtgJ4smZGI15dYMg1ycWx6SBFM+9dlD/A1Bb+IeewI/TOK8/qfisDZgNuUxKAJcBDpW0mQtTWp49hQWLh+TkPemG/eqCfdkUfu3rVUtljefmrl7w+uFvad/eSZ4/pCxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126115; c=relaxed/simple;
	bh=j/8t3A/m619n3qkp0JARakt0TgkX6rBIx0KCmg6+J/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A5hNaxMvRL1gaLoGYeSnhjScR7hSRMBfwbafXvH9zobsLTx60KXPstdQK07YYdjzQ7UeicPLNzWK3q8gLkOj38HCufR+YIJ39tlOv4LZNAsVr4Qa6d81USqAandkhMPqTuDoyksFM+PraCfQfCJL3yyjnhQXQq+Yv03Y2t0ulbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EkaUc6xB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joUtDWp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EkaUc6xB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joUtDWp8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AJZ19t2472294
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aH6bsVIeV+YDj6V8Pt6RtV
	7WwW8GwBlSVsbE7KsyT08=; b=EkaUc6xBbL9xjFaDfQkn/FApDMYu5L5aqcwM8C
	EQCF6v0BDmh6tO6Wg3qMRpi88PMc1bG3ZZ14kv1vodqn5RMeoMYXxbDIrZOEil/H
	DhJXpGNZUpx9ULZWEO2SYtEh5RR6kjd+KhtidMFFiwY9n5hXpIHTY0FKTVBNz+im
	YBUh3Edip2X/rZx74Nvot0k/Cj3yoEReNa5pQgk5ADh9v6Eb52WxVFRrlzIyXxbo
	okYFFETgImIbBI87cpLaTARv5F1nERwdOyvTGDLmOB7veBSUnGo7yBBRBGJorVUS
	MbGriPxeY/Hp1xJ05oOdgeiL1WScMPpDcjSQQoqcDmNj73UQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u8c4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 21:15:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so8097327a91.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781126112; x=1781730912; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH6bsVIeV+YDj6V8Pt6RtV7WwW8GwBlSVsbE7KsyT08=;
        b=joUtDWp8PLFxZixOoivNO+EqHRl8gd14n6dBHtgJ8cEClzbjWkkt23EVZQ97cnmx6x
         CvYIPMecXEsqze7IcuFZGosSvxyQZah3Gr3FujnLxXkTYvCDMOTrgZdoMILgPiwEKgbU
         Xe5PgCvb9vckhiUCE2flGVOjB2hBthNxQPJraa3fvczALS8fr52gIkMPDapyvjnYpAhj
         bbLcReVZ6L1rhZAK+nlYy8MSf/9zclBvhRG887Vnq5EbIOtunbfx53XkDuxvqdtG6NQq
         GusRWLBpk1XslpBKE2HLJk1yYkHiQiGtheH7b1/lyFO3Q1kjhtE7MlUoalA8sLdk38yj
         Wluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126112; x=1781730912;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH6bsVIeV+YDj6V8Pt6RtV7WwW8GwBlSVsbE7KsyT08=;
        b=ACnKHXZMa5zl30FUWakBfDdo3YyIR4PuqNJWeNFqyK+x3IDnSh1l1spMwfq9/Ei3Jx
         QtiSxeEuyaVkB9D6l1TNBZGynJzQ/dum6tailTeu5/tQvyzh8x+RVfV9EyqSFPudZCdV
         AIhYxrKDgjcT4nZOZLyTEK3/xAZQcCDL+AMmYjKsDF2iD2IaRz18GQJWxGPEkMRDNPZc
         LXKc/m7fhUan/zDDrpyWV38ME8zlBR3W81FkyBGxyDcyqO+n97i6fjmG8F5n+tmW7Pzw
         GkHHQ+pNyPf7wI4vxenB8qMVU9u1/hDJ9wqXZsZiZmOnmXOTaA+YgXp0kVsaAGBySqj9
         xoGw==
X-Forwarded-Encrypted: i=1; AFNElJ+4edDjKdsOAnJfesMcWDKUP1IwglUgVpBcs3apYNKa0/0hjHKYX8HaZxMp/xtVNU5ePTr4yDV6NrJm@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBuuqnfJpJ1TbPRycy9WLIVYOMgwGxA0Ou04xxCh2MQVSEXpf
	0MM2cRVUdD3zC0zJsEHxbS93ZAEq3I+FRQmkce5WK4YcyljGntOb1bXYlfKboFhVb0T2AKC9Nx5
	sRP8YSp59CgLXadF82gEUUKLlhiIIugBzfB7d6QHEoFFUWbouGnB8q3lVPOmkh108
X-Gm-Gg: Acq92OH1Tm4QPlKSynrJV2BPEDerxfjqvRwa3AORid9F5voEgm864j4hYttQXSu8Vy/
	QZy3vT50qOZg8pwLOJclXWQciO0smLamhyxXOGtMNxD0bXc9V/RuMmzH68Qu8tzn2L5A+lm4Odb
	KW69GxFqzIPaQxyZQuPzTn+ilLWYs+6msicax0weqnzZdZktVCI6STDNxCPViomOWVvgWH4oPhq
	LbanDJTdKc9DQ+SYNH1+Fx0LqElzK9JXaX0732Mrojvcqt+QLaeIBvCsa/x5PfQV/abocI1n/ys
	J8MhJKAteT+wmpCtfA1QozpRM64jLtyGTF4WDY95v36WWkWq1OjOe+D2WhHMovWwet8dckVKxkX
	8CWVoPSNxs63y4BcAsdqxehIQViUGmHWa6mmVFdkenR8goFEFtFzxaYOVxg==
X-Received: by 2002:a17:90b:5827:b0:36b:a0fa:ff96 with SMTP id 98e67ed59e1d1-370ef1f2cdemr28232086a91.12.1781126107293;
        Wed, 10 Jun 2026 14:15:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5827:b0:36b:a0fa:ff96 with SMTP id 98e67ed59e1d1-370ef1f2cdemr28232019a91.12.1781126106417;
        Wed, 10 Jun 2026 14:15:06 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37753d01cc6sm309490a91.11.2026.06.10.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:15:05 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH 0/4] (no cover subject)
Date: Thu, 11 Jun 2026 02:44:55 +0530
Message-Id: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANDTKWoC/y2P0W7DIAxFfyXieVSYEjOiatp/TH0AbDamJtkCm
 VZV/feRdE/Wka7vsW+i8JK5iKG7iYV/csnz1ACeOhE//PTOMlNjoZVGhQDyUt02gpGFJ5KYgI4
 uakKyoi19LZzy7174dn5wWcMnx7q1/CcW/l6bqT5iYuRS/G4autMuMlo1GRpzAN2DskqCLNdru
 +f1Mk81r+MhzuPLVhd8YdlgzHXobECI/bMihyYZ59KRfXJI2FvnLWhL5NsbQZzv9z+CGvs++wA
 AAA==
X-Change-ID: 20260611-lt9611-b4-send-6f1d39c2d6d7
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        boss@oss.qualcomm.com, qc-display-maintainer@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfXzHDPyf4gUU37
 D3OdPEPTlMAezdQCTQJ1fYs52XlF6TiF4evVv84t7tfRmh8dsHQeUPCelAG4H8LSZLsey61Xogx
 5p/ZH1rrMwEe37Y2CFE5kLMmL8MW+Eg=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a29d3e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=xVA8p-6yhMX1th-SxBQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDIwNCBTYWx0ZWRfXyI782RklQeqL
 Ba/W3dZ4nqG4n7eCHqU9+helbFibGy31/oeI70biWv9ogHkWuX+tZmDzIqe77jXSKr4h6g1Vf3E
 nRe2qeLyZ2wK7Jq9Qemsdfo4HHPKMCN9eKhSwDRU+z0piWINFJOwoXhBF917rTC+7z3gb2AN036
 As/prXeHmBXT2yNO1GJ3mqqzgmjJjFAQqejHGjodCyf88m84XT/G4Wa5B5x4PwD159EoRB8iT7V
 +Kzy39PDN/7hRA7tzVdCux7mmTMyizYJSiFABm6kJWJuTP93lYICxc11hplVXI9RGwnORv/9ORy
 R0qVQs2os9+xXjVxJTT5KQST1Zp/OVY9VGZrKgnW2MtCx99gDki7vgRhXJFAuZPL/oZTl/39XqP
 uxV2eNoh8xy3d3WQ6EDg1fYipFrh+sdqPkYtlXzaDERs1cRCMJKysaaN2w5iqAsoT3ONICS9wAj
 yZn0fJHRkVSIVPpnKLQ==
X-Proofpoint-GUID: aYfXv3-GOHmbIFeNn8T55D34WIVWl8Kq
X-Proofpoint-ORIG-GUID: aYfXv3-GOHmbIFeNn8T55D34WIVWl8Kq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606100204

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: [PATCH 0/4] LT9611C improvements and fixes updates

Hi,

This series contains improvements and fixes for the Lontium LT9611C
MIPI DSI to HDMI bridge driver, along with DT binding updates.

The key addition is support for selecting the DSI input port using
a new device tree property, which is required for configurations
using port B or dual-port (A+B) operation.

Summary of changes:
- Add DSI port selection support via DT property
- Fixes and improvements
- Increase MCU polling timeout for stability

- Add dt-binding for port configuration

Patches:

1. dt-bindings: bridge: lt9611c: add port-select property for LT9611C
2. drm/bridge: lontium-lt9611c: Increase MCU poll timeout to 200ms
3. drm-bridge: lontium lt9611c: fixes and improvements
4. drm/bridge: lontium-lt9611c: Add DSI port selection via DT property

This has been tested on LT9611C-based platforms.
Please review.

Thanks,
Mohit

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
Mohit Dsor (4):
      dt-bindings: brige: lt9611c: add port-select property for LT9611C
      drm/bridge: lontium-lt9611c: Increase MCU poll timeout to 200ms
      drm-bridge: lontium lt9611c: fixes and improvements
      drm/bridge: lontium-lt9611c: Add DSI port selection via DT property

 .../bindings/display/bridge/lontium,lt9611.yaml    | 13 ++++
 drivers/gpu/drm/bridge/lontium-lt9611c.c           | 79 ++++++++++++++++++++--
 2 files changed, 85 insertions(+), 7 deletions(-)
---
base-commit: 7b61c580d964f499f3eaf96d6579a7127dda606b
change-id: 20260611-lt9611-b4-send-6f1d39c2d6d7
prerequisite-message-id: <20260420061644.1251070-1-syyang@lontium.com>
prerequisite-patch-id: 5e0ea8907c87174a28fac5456fc51183d8e8b36f
prerequisite-patch-id: 6fd8685174c2c83b8871d9e6419c6f3bd29ccc1a

Best regards,
--  
Mohit Dsor <mohit.dsor@oss.qualcomm.com>

