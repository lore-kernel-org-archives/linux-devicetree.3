Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E283C387347
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609482; cv=none; b=jUlqxA9k8XDvYHRBqy289Ozly3V1UXHA8irpgp1rXG55zKv5ZoFKLNgSkOnM0sqbIINOrhu1yUfZ7ECUbfRFXhQy3b/K+j1TKVs+/vBZ8VTyIH0MwtfLifd/Noc73SR/pMewn0QmOE6aT6oYORVMTVlsKYPaFlJQtF+aw3arrIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609482; c=relaxed/simple;
	bh=xgst01f4R/UxCDVV1F4gaFoFhiH6qRgFseib1YnLXZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XteNfVLzCo1IQMcJ54GcUti4W2L4wN4epMakjrBjG6ng0EDqjNknbYsX77GOZIJKOOCY9cmlwaZ4Z+32W/4zIGaQJuVqunmR9nfKHSLGJhVkmIqyyPtWmKurgSTKrPey0dkCmY/+gNJpV9NiF1crqJ3eMn1FZxDD90wuW/CXhsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ak7raGIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Splz3GJU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ak7raGIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Splz3GJU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2nCuT043254
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q1kdZY8fqAg1zkiy6i/AiS
	rIjleTEKdfGSM8hvmDMX4=; b=Ak7raGIlPNr+MLCrFqoAfn1jxWZkmoqY4SYkbI
	ibY28QvLTmrGbG/ouaBix1W/YKR5o7kKRomPnTWmtO88SsyNlSRrVzdikiTrlOSR
	bKrLPXPzwwxcB974m6yu6lmALT202Bd49O+b6FEjHhYeEWP48tujEHjKvBEYRhuo
	0J5wrus5i22kRk8Vm6HHa4hpbBQ2MC7yHgNgKCCvqXCC2uUlYPMDIurxmGWSX6xP
	S5H1d8Gc796rut1u0Ha9ZuqlLVb4Hn2MmoZBwrSaZ3PQsSQG4p961Y9n8kqBWiQ6
	NJhmg2cMYS6Hi345+JzWh/mnbt1C00FKF1Zd0q+0h0wpAA/A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as0dn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:51:20 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3789691a12.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609479; x=1785214279; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q1kdZY8fqAg1zkiy6i/AiSrIjleTEKdfGSM8hvmDMX4=;
        b=Splz3GJUb89XThQ6CfLehGmRj/JbfjWI/04bmtHuP0FKmJtS977lUH/HFetKWnFlCA
         HMckvRIH1rYXohqTyOPCxrMtxwSqSCnlpqWJ61Zc25wojeJXnrhGdW3cyxovNOwOuZBL
         sN8ODnitfvf93yIjPZk7rF8Nc20WOzpMEHjsRqbOWjdXrxibF2zRIF40ZWC4diBEnX7A
         L/PgyhVf43t/QoumRKXm1CRwi+mirJtUHNkv5o3ZT3NkxSdKE3RQSH/1maoA2zip36Qo
         +AW5BO9jJ8oh6HnU6tO6UdXCcYI3SPbafyL5/bbGZIjWOsDQbbvTYSvSz3ectuT4tfwy
         mcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609479; x=1785214279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q1kdZY8fqAg1zkiy6i/AiSrIjleTEKdfGSM8hvmDMX4=;
        b=Vc0B1N5gfqUGBgnve/n0AAeRjnFz1iZLJjqIISkngZtR8VDNNOGrSId2VHxf1Iwl7V
         r4j9GHjJDos6mTRek/UUu8LOoijgkg65hOrVLrIKL57JMmwwRbOGF9I+qcPvsMwvOlOU
         hvhZp0j+oiGBfpCVWt0d+6xzRv9VXLrLqnjo/btEJbBiema4MJ2rhFuMH3+LxJt+9aWF
         XN3IjKGzXpDlQRK46qQbTASlBM7NPxy++7k2dulZNxsYlVmpHNgjnCHUOlfkX3mQ3WZc
         gbStBbQ3UY+ylNSbSjBV+JqqcfbM0pL8Llgguvm0sMd1n7PJj/5ImtdM+pni9LnBpAv3
         mbtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyIfWq5jxfNbOSQsiyhG99SAiswmjTQ5x34dpmHoF31MPcZzw4PzxpDfpSWGGmCP78fAdSIYZxl7sR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0zjTAjwSKh9caOaYTq8VsLrNkjfgTsDK9Bxtw45sjukF/wowE
	ZAMHsbBHNprtlN7/XARHZ01GUblKUnIsvuGbN9hG99Q5JeqgUefx+DkoxF5iPqePBb+nDxHn6vN
	QVzm0GowvBXSqL5xikvJgWOifa/ZoQn15qy3l0Ocxt0yUD2g3YkG8RwVhIWKfHU4L
X-Gm-Gg: AfdE7cmewe4C86GHRxThlCqYoeTMPCAS404o61kciUisng09lGJxAEdI7bqMf4oQG32
	NcJvykvYxHPqLvVTNiCTCnVVJVwXTAC3WeLp2MiwuqYip+66EZVa6367NTNB/A/xZDGVry4V1iM
	W/Nfng+Xktct6U1nWy6t3tY6YdWOZ1jMe21nUjzDb2UjCjKn1I/0yohV6T8AGPhMNZm/I3ju4kL
	8G8ZUX9bbrtvpK5OZQuGXv0lcasdA0bPAm8iHHiEuUzII91/+xUc6ug+DEoaoX0z3IdFDANmN6q
	Yi3S0krVUL2NV6yYfUi81zsoANSORegFrtEk54jcAp3AbLQ5MRrlC2+PQgVLCvq7Whk3vHJKqFJ
	OamLvIwVllbQIInpstsyg4NB2BJ+4R52ofZKcuTruvL/MYgeQS+yyCkI=
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr18725889637.76.1784609479254;
        Mon, 20 Jul 2026 21:51:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr18725857637.76.1784609478746;
        Mon, 20 Jul 2026 21:51:18 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:17 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v15 0/8] media: qcom: camss: Add Kaanapali support
Date: Mon, 20 Jul 2026 21:50:33 -0700
Message-Id: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJv6XmoC/3WQ3W6DMAyFXwXleq7i/AJXe49pFwmENWuBltCKq
 uq7z8C0TRq9seQj+7PPubMUhhgSK7M7G8I1pth31KB+yVi1d91HgFiTwAQXhiMKODjXuZM7Rqh
 cmxJYaa2olQpNYxltnYbQxGlBvr2v/RDOFyKPq8i8SwGqvm3jWGZdmEZY4FZw9vdqmZGsuUUOE
 9JCigJO+xs0RknljcZauvKKcmtJogSv4Bi7ywTrCQ1cAsn1mOIMzDly/u0BNTeNVd6vSPEfSe+
 hgXTQn50GH5QUvioKV+Q0zmab+5jGfrgtQV4RF6NPM6MB4JBjUI0unK55/tqntDtf3HHOZUdlg
 c7ufkCa5xsgSSChFdZ50JpCeQZSvyD6aQOkCBSsaYRxzphiC/R4PL4AglAx/jECAAA=
X-Change-ID: 20260112-kaanapali-camss-73772d44eff7
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX1p4qlQu3YX8e
 QaGi4RbcRaP5/9RbgX8R9TQEeFaXTII1qJd4KcG0gBvev8yrSR/5VRevc1d4WTsTGXbq1yHQxQe
 QVqoiIZqS9YTQjKEbd0VjLBgQa6Q0AMD0FJmdZv0czTYudpwtXH/y5hCBYaGUIYTBfUNilUt1Bn
 9INaHj1uxmUnsdrswKDW3r+4ePXOdCHwwB9arByjQnz4WqBDnG4fBZ9pWsCnOxxoNRFd3hYjti0
 Dxf/pCpiL7TEtoSztqQyJNSbRkzuOKys6OUycNMdj+UDIYmyjukhrDxTnGZ9kekMrDXzU+GveHL
 tvam4krXRPJPci9ysS8XYeouU/8+/440a6vbfTFHnipv8hb/Vcs2qifu87cne7OelcJs4Epyuuc
 FQeIjxA+QMgfB/9UsmnTvjwPRBzncG0h7WJCenvHXZWMfAPWuy1HI2dEw3tJ5AsqUT39EGirSvz
 rhjfS4SNFurvUKc4a6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX3zNttiGixTOr
 p8A30M5+uVVSqUbAX4VPQcW0nFCqZj0xeWcahzN7W/DiHNsfUWst/y+cusnIkGPLLNmlo3b40Rq
 JSTPI8v16xa46rzAdMowN/z08lWqwnQ=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5efac8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QPHGzIHLvaTaApt4zBUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: XhKDM3YPFLVIA2EjBTNDKcfRxwhn3uJB
X-Proofpoint-ORIG-GUID: XhKDM3YPFLVIA2EjBTNDKcfRxwhn3uJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

Kaanapali camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v15:
- Add TPG v2.4.0 support
- Drive the CSIPHY through the standalone phy-qcom-mipi-csi2 DPHY
  driver, which let CAMSS csiphy_res only carry id, ops and formats
- Add a preparatory patch parametrising the PHY common status offset
- Add the mipi_csi2_dphy_3nm_kaanapali config and "qcom,kaanapali-csi2-phy"
  based on the new split-csiphy arch
- Link to v14: https://lore.kernel.org/r/20260601-kaanapali-camss-v14-0-e76f26aa6691@oss.qualcomm.com

Changes in v14:
- Define 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' locally in camss-csid-gen4.c - bod
- Align csiphy lane registers value capitalization and case rule for 2.4.0
- Rebase this series due to conflict - bod
- Link to v13: https://lore.kernel.org/r/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com

Changes in v13:
- Remove prerequisite dependencies that have been merged upstream
- Remove redundant empty 'regulators' initializers in csid and vfe  - bod
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v12: https://lore.kernel.org/all/20260112-kaanapali-camss-v12-0-15b7af73401e@oss.qualcomm.com/

Changes in v12:
- Add CSIPHY regulator current due to regulator interface changed - bod
- Link to v11: https://lore.kernel.org/r/20260112-kaanapali-camss-v11-0-81e4f59a5d08@oss.qualcomm.com

Changes in v11:
- Rebase this series due to conflict - bod
- Update binding commit message to align with previous generations
- Link to v10: https://lore.kernel.org/r/20251211-add-support-for-camss-on-kaanapali-v10-0-39e8874dcd27@oss.qualcomm.com

Changes in v10:
- Update interconnect and CX domain AXI clock names to be consistent with
  previous generations - bod
- Update the struct name for csiphy lane register settings to make it reusable
  for other compatible chipsets
- Updated power domain names to IFE for consistency - Krzysztof
- Add description for acronyms listed in binding commit message - Dmitry
- Link to v9: https://lore.kernel.org/r/20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com

Changes in v9:
- Updates the names of some of the resources in DT bindings to be consistent
  with previous generations and improve the commit its message. The name
  changes are also applied to csiphy and vfe camss resource lists - bod
- Link to v8: https://lore.kernel.org/r/20251130-add-support-for-camss-on-kaanapali-v8-0-143a8265e6e8@oss.qualcomm.com

Changes in v8:
- Change csid and vfe driver file names as 'gen4' to reuse for other SOCs - bod
- Add missing register descriptions to binding and cover letter commit log - bod
- Link to v7: https://lore.kernel.org/r/20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com

Changes in v7:
- Add ICP SYS registers to camss binding - bod
- Rename 'is_deferred' to 'reg_update_after_csid_config' to do rup/aup
  after csid config to make it clearer and simplify its call path - bod
- Remove unnecessary bitwise AND while configuring image address to bus- bod
- Tidy up a comment and a couple of hex values and csid/vfe - bod
- Link to v6: https://lore.kernel.org/r/20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com

Changes in v6:
- Modified the bindings to represent the whole of the camera hardware on
  KNP than just what is exercised by the CAMSS driver by extending the
  descriptions and the properties, the regs, clocks, interrupts, power
  domains, iommus etc. In addition, use the word 'vfe' everywhere in the
  bindings to be clear that all of those resources are referring to the
  same front end modules. - Krzysztof/bod
- Change camss vfe power domain names to align with the binding file
- Link to v5: https://lore.kernel.org/r/20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com

Changes in v5:
- Refine v4 change log - Krzysztof
- Fix typo by removing redundant numerical version in kaanapali camss binding
  comment description - Krzysztof
- Add missing tags that should be posted with v4 revision - Krzysztof/Andi
- Link to v4: https://lore.kernel.org/r/20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com

Changes in v4:
- Add detailed hardware descriptions and revise message title to follow the
  standard comment format for kaanapali camss binding file - Krzysztof
- Format kaanapali camss binding file to keep style consistency, by reverting
  power domain name from TFE to IFE and keeping clocks name order as last
  generation - Krzysztof
- Separate the 1.2 and 0.9 voltage supply DT flags for each CSIPHY to allow
  for arbitrary board design with common or unique supplies to each of the PHYs
  in kaanapali camss binding example, based on v2 comments - bod/Vladimir
- Link to v3: https://lore.kernel.org/r/20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com

Changes in v3:
- Use the name 'ahb' for 'cam_top_ahb' clock in cci binding file - Vladimir
- Reduce and simplify CSIPHY supply, port properties in camss bindings - Vladimir
- Resolve the dependency issues in the camss bindings file using ephemeral
  DT nodes - Vladimir/Dmitry
- Update hf mnoc name and bandwidth values for icc module - bod
- Split CSIPHY status macro changes into a separate patch series - bod
- Add clear functions for AUP/RUP update in csid and vfe for consistency - bod
- Clarify why the RUP and AUP register update process is deferred - bod
- Clarify the necessity to keep NRT clocks for vfe - Vijay
- Link to v2: https://lore.kernel.org/r/20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com

Changes in v2:
- Aggregate CSI2_RX_CFG0_PHY_SEL_BASE_IDX definition into 'camss-csid.h' - bod
- Remove 'camss-csid-1080.h' and use 'camss-csid-gen3.h' header instead - bod
- Remove redundant code in 'camss-csid-1080.c' and align the namespaces - bod
- Slipt 'camnoc_rt_axi' clock in vfe matching list into a single patch - bod
- Add whole vfe write engine client mappings in comment - bod
- Remove hardcoded image buffer number but use 'CAMSS_INIT_BUF_COUNT' - bod
- Remove SoC specific logic for vfe ops->reg_update and add a new variable
  to determine whether ops->reg_update is deferred or not - bod
- Add description to explain why 'qdss_debug_xo' should be retained - bod
- Add the procss node in csiphy register list comment - bod
- Rename the variable 'cmn_status_offset' to 'common_status_offset' and
  align this with macro in csiphy register structure to avoid ambiguity - bod
- Aggregate Kaanapali items into the definition that introduced by
  'qcom,qcm2290-cci' in cci binding file - Loic
- Format 'kaanpali-camss.yaml' binding file
- Link to v1: https://lore.kernel.org/r/20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com

---
Hangxiang Ma (8):
      dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Kaanapali CSI2 PHY
      media: dt-bindings: Add CAMSS device for Kaanapali
      media: qcom: camss: Add Kaanapali compatible camss driver
      phy: qcom-mipi-csi2: Parametrise the common status register offset
      media: qcom: camss: csiphy: Add support for v2.4.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID gen4
      media: qcom: camss: vfe: Add support for VFE gen4
      media: qcom: camss: tpg: Add support for v2.4.0 TPG

 .../bindings/media/qcom,kaanapali-camss.yaml       | 426 +++++++++++++++++++++
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       |   4 +-
 drivers/media/platform/qcom/camss/Makefile         |   2 +
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 391 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c |  27 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c | 197 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 305 +++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c |  32 +-
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |   1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   2 +
 14 files changed, 1393 insertions(+), 15 deletions(-)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260112-kaanapali-camss-73772d44eff7
prerequisite-change-id: 20250710-x1e-csi2-phy-f6434b651d3a:v13
prerequisite-patch-id: 2f70527d6a880f047a4858f75813420c81b4667a
prerequisite-patch-id: b797e1ad3e25f79b0bac8f885b2866206a6e0260
prerequisite-change-id: 20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-1506f74bbd3a:v12
prerequisite-patch-id: 6e8e67cd3ab96a602971bbeeb7dfdeaf3f1426a2
prerequisite-patch-id: a7fbea14628b62a8de096dea420473b283010aba
prerequisite-patch-id: b6b6c4e7a5818e1b93fe2758902bd32d2be48509
prerequisite-patch-id: 6fb94a3fa54b9810ff6603960770011db1f0b2d6
prerequisite-patch-id: e31f60c0c41e5b6baa464339263a33e5b2d69fac
prerequisite-patch-id: 83a3c9f2c2478a4a3a9441f58c58d04b04cec44d
prerequisite-change-id: 20260716-sk5jn5-be432bc99a98:v1
prerequisite-patch-id: 5a8e92e10feeb8fff285098a956b09885a209928
prerequisite-patch-id: e485d00fb1ccffa84f85f4aba151710c39b23702

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

