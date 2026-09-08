Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB539A4DF
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851459; cv=none; b=BM40dWWGetEBQeSk76elUJf96ePn61NnrNGGHBts/48X8Me/9ra69Hgn/tEqyNjgJqD9q/Fl33QomJC+R0f98kuLiKmaVRT5OikcNf6xhPjnxQ59sljlkSDBp6VQMFZVcjE4kEEUpObROc42QpXkz9HTjRLProZTAu25F6Z1hWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851459; c=relaxed/simple;
	bh=zpq5mCKUOT/wUAOeHfp/xfgg0ZRiJ3FqfBhoFrs/1jQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FcIsBFpOdnY/n8AIuewkhix0Lz18qY1CZbz03LwvZrFXJ530nhbkYOmMbYrkJ4eWXZprmR13TZPsa4sodD+Ns9Cez0D4d0t21LFKI5+GRfKLg29lgKx3FOsoGu02pd+vrjV7jvwzDwynvnUCtZk/WVBkYoFRt3veS8o0+5PLcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mALv5SUk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BW04swPU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mALv5SUk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BW04swPU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LqUE2154180
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f8RLbWT86kAkeJotJylv89
	teUUDEjaGV6y6BRtUcATE=; b=mALv5SUkqnDUsl4GL3wX5hU0aPn/stRcTljTLU
	hfQltbgPBHIPrb0QIuvpBvSDFw8TKpaBkZiAVLeL0fdAsvW5JDuG8EHpIVnuvepK
	LyhWzMuvCmpjS64vhmRXkMwUr8eUDjEQ5Oqx4Cul2MY5+5YjQIpgoWVdQXXeoysH
	uMB6LO8W13ZzVS2Y9iZGcYtoiYGgR3ZfMshRBgkL+nzUO003Ol5xC3A7oHUYCt+V
	/PPwETnTLC2kGdffZ9v9IIQG1YHlimnQsktA2v0Sn+FPmxv3lpsksaLt9t6eqktf
	69iIdDoBQwsLMZlh3Vn10ODL9XKuy8LDL9yMO8XovG5SWnKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwj5uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:10:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so686476485a.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851456; x=1789456256; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f8RLbWT86kAkeJotJylv89teUUDEjaGV6y6BRtUcATE=;
        b=BW04swPUyeNdC1vsnzgUCRmJ/5r+Q8Cj0Whz+2AcVTrsoKd4mHJo3zPO3NKeRE8cHw
         JfL75RVpTuwB13bLOUBjhFNfhRyxspZutMWBY596vQQECLc7cmPNMzLhi4Gtw3IWhxsK
         OQrofgUPsWVuBy1CZRWAeicLkjnuARocQjyVKQZwNZOP4GnkGTaW3i0huqS5slszp6vp
         6zMt7mrjPeG6qvJnoGhDi7HijiwCLf9t03mI15Cpmu5DHuwkw+6eKNguUqbKZgbiw3Qv
         K2s8//uxFZ08hIdC54uwSLv0KuRtYNB0jPM1WKlCmc1nWEOScAkP2rOlq6u/oo7DM2Ds
         RwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851456; x=1789456256;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f8RLbWT86kAkeJotJylv89teUUDEjaGV6y6BRtUcATE=;
        b=kMn+zlszNRCMFI+Rlw3X+BWTMmmBjrLHFh9FGb0kWYbqS+LNhUeisM9DoZTD9Sxg7k
         8MOSrGYCPzh2iQzZgZ2nVItupp6tnW3Z5i4wp+EDZBe+Lw6zbCw2ujxPghb8+AKKQqeD
         ijk35pXX5W5bGrriTtTDWwHrKY7SqFpHKIqWr3qAZwc50Ekfz6oZD00nXjVh8oyb7Gza
         EHTEDUxY33nCZM4IGp8eQ8b/Pjivyf0RsPMSFw8dARTzsclbJXyBnmHRSs1i+ZtphEfQ
         IOlXQfnnhPGyu/rIV9LZxurU1l9XSC7Nk3JKpATuGhSeYVFYxB9McUepjeGS49P2vyHv
         yUcw==
X-Forwarded-Encrypted: i=1; AKwUvBzhJ6UItpqlua8Vy9nl3aDHj0EGeO25+4BKLjRDvr8LHoECPtpHvngbceJ9Lg42sCK509R+SkZbVyKU@vger.kernel.org
X-Gm-Message-State: AFuF++mygUrQNQd0s+dxe6NFOJlBw2bw2EW5oh987/Vz0FF3LdUcmxQ1
	GAU/4xf2/+OyV7hjypNW07YmQC+ablbtiLDVc/AehH8uB9s/CvBb6DmL2kMPwuksBNxSiGYJkCq
	Bkg+pfPV5S5GcKA5lP156gWaNtk5Ni0fEuNsA13INzfjdS1oK8coo6MpyL+LHmSZ1
X-Gm-Gg: AYBFou24uxoQZ5QTPhTqZofxRbu5utHF7fHc5qIieNmh+kA8bDKFcCvzy7eznr+3kOp
	yWT+qJEVItKfDGKqobwDb7uy+QW+boWvWGr/AybeeV4S4PLVQvB8yYfvHIgI5KBhMghhWcD3oos
	nvtucHqhqUqTNfC27H50U1N80wVybqQQGf6z2PDgRnGDI0pxp+q+zMJtWROcJAgJrxmrKlAJjd+
	bHkhBy4PJMoJ/jQygAkCBsG0KCXsipDQSx25hoeoo9gwX1KQ4rl/C/HyGkwsJbE1Sz3DoEfTWia
	CDd8bAAhj2n1s6Vrn0tPuFgaLScxx0bdd1etC1gzHnFzNCxbE3wxJ/Ojyj+MGmH9PP5I2HJWhUQ
	ZZTea8eLn9CYHHDsCho2MXXo=
X-Received: by 2002:a05:620a:8894:b0:937:6f98:c68f with SMTP id af79cd13be357-9396deac481mr1835658785a.1.1788851456344;
        Tue, 08 Sep 2026 00:10:56 -0700 (PDT)
X-Received: by 2002:a05:620a:8894:b0:937:6f98:c68f with SMTP id af79cd13be357-9396deac481mr1835656885a.1.1788851455920;
        Tue, 08 Sep 2026 00:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm453173805e9.1.2026.09.08.00.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:10:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/7] drm/msm/hdmi: Fixes/Cleanups before Eliza
Date: Tue, 08 Sep 2026 09:10:40 +0200
Message-Id: <20260908-drm-msm-hdmi-fixes-before-eliza-v3-0-dcf8956878ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ6CMBBGr0K6dkipPwVX3sOw6M8gNZRqB4hKu
 LsFL+Bmkpe8vG9mRhgdEjtnM4s4OXKhT7DfZcy0qr8hOJuYCS5OvOISbPTgyUNrvYPGvZBAYxM
 iAnbuo8BU2siiPNryYFiqPCJuVopc6x/TqO9ohjW7Gq2jIcT39sIkVu//tUkAB80raZoClZHyE
 ojy56g6E7zP02H1sixfK7NdUucAAAA=
X-Change-ID: 20260907-drm-msm-hdmi-fixes-before-eliza-c9bc7185d84c
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zpq5mCKUOT/wUAOeHfp/xfgg0ZRiJ3FqfBhoFrs/1jQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqn7TzbhTLLrihthOjdQaXbEX7ard2KTMOpshYK
 dG2hWcKYVKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap+08wAKCRDBN2bmhouD
 18MID/9CapUwvmX25INfBr39Gll9U/8pN03nzwdBZlCLFVy6itzrlfHBldIARd1vuBwuXhWZ5Rf
 nhoOZqMah7Iqx931BoVqwC1grAVL2E84/sRNENNAo3tChayo5x0AzNQHnDojBB6w6ZWbk9h0Sak
 8tYiFRBVobHfBF6r+Og/sSM0w7d62hae9OfuwqyNyqVIofCDE05u7Vpfg0aWoDQLv5ojw3yjEfD
 trIvac1gB/TdPBtcEDkB5fMFlOWWR+T12lsFerzwmumLJzLyqdX9S+dXmWb/Ka/pgpOZlqh8gJT
 qLBSEyns7q/N5RxqZCTYP+pcoyr6LrVbqQKNA+dgAjFMc2GP9nSgeYGbSy195NpWe+EqDqwJZfI
 pzl6GiQL56KZKX7HdFAKNKh7AS0oKOHhicMVxv9iF47/RANiw2JnJVbQJOAkT3CPna1pm2VE1Ic
 Dlv0HUYYR9a+Eh0cO0uaWgLrRmvoOPB4SmcyCSuVY7BgglBnkheo3nzkwQLy50hIdITR358IgUH
 vMGCLme10caSNWives336h/8ecrCm1H3u213zbY9I/ArVnqNT1tlL+iI2A+6nkahQetMTxwXvr0
 eOP1eV5WSo8rd1Rp+Rt2SxfF4tQJP5vtjchjBG3NHCMdLX1aiXE5P1ircKto5hgHdegOT4IUOzS
 4rQWQeiwEncs8CQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fb501 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=zNiOfXrd8CByh7D4QjQA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX4ZQAIIcGTNg7
 Kv9Klfyx3SIsEZa+g4XJvAqBuMzNsJoVmWiHRmeEz9FgFmCv/LyokBMQeBL6oaErMMKLtT/IUiW
 A+6vwKIwR98LgXo6mjxbo9qeiT5/FN6uVbfd/fCqMcHxlCYbSiOE4bYUDqloXVP8Z6JnzYlS7kR
 7FdNiWLg0eBENWszrdE321C1dRr6wBXarD1ucw/yi6lH7tmx3uVC/8x+64gyWo25r6b/3yOunQi
 p+KDRrQDUafKvGB8fcGP/VLPtHnf/WA90DPieHspZ9XjjhmeymKm/dS348d3mFaaInCIqcriIvY
 PTmn4f0uZFOQt74QNHV/n7ja9WwC5dWTtvjxezHF84aIbTvQoy/+RnfEMSEs6zZw8OppDbJI5wa
 giwEaFwMSNMAWfCyRoBz0jRVZfsmop4drJfuNCbjvbZLdESZ6i5yTyryte8xTDXZPbomd3pIitx
 izI0+8EzMS3H5NB9HlA==
X-Proofpoint-ORIG-GUID: w6TD2dseupyKjr8tKG5y25ai9AslrCdx
X-Proofpoint-GUID: w6TD2dseupyKjr8tKG5y25ai9AslrCdx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3MiBTYWx0ZWRfX5/MKFM8colXa
 AWVYBpeg8/DCY1YPjui3k7XzpOLOtuShwWRYMEPR18icm6h7xIE7nBrfg4jBbEitGrccl17QGKC
 hhF7Wksodzmcnc8TB/HYYVc0Z5CZDjQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080072

Changes in v3:
- Add missing regulator_bulk_disable() in msm_hdmi_phy_resource_enable()
- Set hdmi->power_off=false before calling msm_hdmi_audio_update()
- Link to v2: https://patch.msgid.link/20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com

Split from Eliza patchset, thus `b4 diff` won't exactly work.
v1:
https://lore.kernel.org/all/20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com/

Changes since v1:
1. New patches:
   drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
   drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
   drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable

2. Patch #5: use simpler ?:

3. Add tags.

---
Krzysztof Kozlowski (7):
      drm/msm/hdmi_phy: Cleanup after msm_hdmi_phy_resource_enable() failure
      drm/msm/hdmi: Handle msm_hdmi_power_on() errors during .atomic_pre_enable()
      drm/msm/hdmi_bridge: Correct poweroff/audio cleanup order in post_disable
      drm/msm/hdmi_bridge: Drop redundant initialization in msm_hdmi_bridge_init()
      drm/msm: Properly handle msm_ioremap() without name
      drm/msm/dsi: Fix indentation of if block in dsi_mgr_bridge_mode_valid()
      dt-bindings: display/msm: hdmi: Correct name of disallowed supplies

 .../devicetree/bindings/display/msm/hdmi.yaml      |  4 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             | 34 +++++++++++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                | 16 ++++++++--
 drivers/gpu/drm/msm/msm_io_utils.c                 |  6 ++--
 5 files changed, 44 insertions(+), 18 deletions(-)
---
base-commit: 6e95d4043b2c59f1887fd72d1620b7fd3d3138a5
change-id: 20260907-drm-msm-hdmi-fixes-before-eliza-c9bc7185d84c

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

