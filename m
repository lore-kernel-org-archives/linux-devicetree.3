Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451D9423A8E
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971857; cv=none; b=sTAQCwkpFDMg/U5+AtnyInTU6agU3h4d//ogk1HdbS/+ZTTBG6FZ2zFINZYEan3VLmhTMeYfX8E908Bgp/CLDnOV/7lXt2g4vl0snTZh6j7/Pe7vTknMRH8pORMSrWTYuCOhFCKVMq6fqvGLEmCCN+fmVRAbaFQTODXguqH5pnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971857; c=relaxed/simple;
	bh=IWNKBHL94YpYEj2u2AsL1FWmBebCDkOGR5hvIzCIpq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H5N6kHpHj/tF/fkksEgjCvHPCjVTSYdaXxBKwD8UZs9AyGmw05zGU8OmcD3dd0miPey1UWpXiTXU2p2dRpQNINxQ22rrEEpCB2gr5KGCkp1gwUSQJPZTolilMLcA9gcwFfZ8+kA/kIJHUDPMX+YLOvTtASLkQvT8cvgdlCbODow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIEKCuKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jo5HsZB5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIEKCuKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jo5HsZB5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VESd2Y2761411
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AorZKexh9awIlN41NVRQim
	rdv64tOibZaKooFtqlyts=; b=iIEKCuKDRN87Gzr+/jDzieICY90CNWvxu4i+VY
	Cba9CUUqirEG8oMlA5gCvi6ncn759Z/Q7iz2KZhxZhKEquVPFEIf7ojy6KiFa0Wm
	6sg502kViD2DypWd8Mg3nCO/JXhHLxFUAlOTL9ORbZf8lxcdykYO8WuCOKyl4A1J
	zvqyBlY8o7s9HHk0NuCDQvj9/Gd5zBl7bsyjMRV+S43Wqr978I2FVZ5oCnY/wfCc
	TBGfRBqqRd/L/CkAlDUaN99zvifA5pr3J/ixQDgAlp9YRg+0Ozv6rmLXmfvinSKe
	GPh1ElQ+VMk19/QXdq0x6eH6S5E8HZ2gtFpSM9QtM+KkLazA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b931u93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:44:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so707421cf.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971853; x=1775576653; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AorZKexh9awIlN41NVRQimrdv64tOibZaKooFtqlyts=;
        b=jo5HsZB5uiCGiTSuHCePncguhB7VwtzBe1oqxwKoCecYZ8m5whSWHwP/8x/+tEFVUi
         a9kqaqaV6CB8ohmvvUf7g2YzeWweTRDSjV1bGlZuN9sqtqg2XhpDvZKYD0DpG0p7dIQn
         xBJ7RNSF5IDukdSKyqkRP6f5GQOmPq1grWwz3uzPfGD2Vk1xU5usW5k2wdwDLyuC5zz+
         AAGsTjd9HuQ+0xMcAzHyHvpTC0NS8fI7inScxrStBkNoY5owKB6/pspcCU/5O9jrtw3z
         OQ4IB+6DlfiGz1RRQIbj5XBRAUW2OuFh9pf30cYXORugwBCV78AfbklO44UWYkPjaicf
         h+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971853; x=1775576653;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AorZKexh9awIlN41NVRQimrdv64tOibZaKooFtqlyts=;
        b=AAwXuJMwH1dgyJHn/7rlvVGzy66A1C+bJ7sBMsnAin+j3flh2kB6gJyk79ApjAsRu+
         hTxmRNhmiGpcdW6CTHlkfzpSTY8fDYaYTQoCYtrtzu+8p7PPqZo+q480/3MFI7JQBzjv
         86NDVxk4PRbSxdifnnWoF+0HsxV1nwEOhd3G2zMPNm2mER/8piAsT1uyU/34GqbvK3vo
         qt3L3ayPznHj3xNxLUIaWi/gZ1Q0CtrWcoi2SZ8IbBa0nh0U4oMDQTBwFLfrdxmQTggG
         UfAqoo9vvfx/SCoDNrB6Gt8Hr3V1J/d6ynUS9Y3Oy08LENQKetGI9OaVHy3tq0Nl94HS
         MgKg==
X-Forwarded-Encrypted: i=1; AJvYcCWg9oLJbIkM93NgmOaU7omNPO/HRl/s7RC100K9WjpfFdcL0/Cy5iAiOshPEbW9acd1d3Y2v6NsZsVV@vger.kernel.org
X-Gm-Message-State: AOJu0YypQQXFTCrFibSf+wqMnDG8VT0WaAiGz6n9cFdDRPiL8g+10rrs
	5yoI4tlSXYQgpULjOxhrKBjXWeLIREvAHIdRk7HdBNLhcFvC52fjX5Swf2LAxUwraVEMpW5UA4G
	spIEyhTlNE/+cU4h+IA7N/1d/aUOw5CX/lFODsIbLHpoYpXQ3L6RmltLHrzjXOt/B
X-Gm-Gg: ATEYQzzHGi8hnC+tC4SThz/8sgR9J/7H+DZirGbbwL4gqMsPBtcn6lVInmrB7GcIOr2
	kNIj+T5gEPIwvWyDavHr9ize0Gjwd9w4+Otjm3Py+ht9Gk99FQCUGb25pC9yGfYQvl+Tes/ZxVW
	6fIHT88hdF14/fbK5tG2qbcNcaMQu6+Fj/G6UGo4hdOVsOTvWmQEN6zqNdK/lgqzdED9j0EugWQ
	LSKeG/pPMG4j4rPyW7xkp34Ze1IjJS2nsEO2KJAj4vg5SemOQ2uN/wbHkNY4EOZy9lWP50G7kAq
	Q4beQXHAbRs+p8agBZt7Q2lsMix90kw0toS/x8a1GatuN2ZgslGb4bfnoBpMAU7R6DGlaQnqR7R
	RC0cLqmJnYeJSS0c2uF5Sp7ySODRPI4fooX7Wh/+OCCsp2aD3atM4BcZAsQnpiKyH31g3S2jXxq
	wpS6iI0r4RqN1LMjsm/PNewpHOTOm9AA2fMFI=
X-Received: by 2002:a05:622a:181d:b0:509:e46:84ea with SMTP id d75a77b69052e-50d2c9552f1mr51540601cf.34.1774971853408;
        Tue, 31 Mar 2026 08:44:13 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:509:e46:84ea with SMTP id d75a77b69052e-50d2c9552f1mr51539941cf.34.1774971852840;
        Tue, 31 Mar 2026 08:44:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm25387461fa.23.2026.03.31.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:44:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/panel: simple: add Waveshare LCD panels
Date: Tue, 31 Mar 2026 18:44:09 +0300
Message-Id: <20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMnry2kC/2WNyw6CMBREf4XctSWlBXys/A/Dolyq1ADVXqga0
 n+3xaWbSU5yZmYF0s5oglO2gtPekLFTBLHLAHs13TQzXWQQXNRcSs5exAbsWFtXyCVWCos9RPn
 h9NW8t6FL82Na2rvGObWT0RuarftsT75I3t+oLxhnkh8PslSljAdnS5Q/FzWgHcc8BjQhhC+2v
 jfDtQAAAA==
X-Change-ID: 20260330-ws-lcd-b65c03c5ac17
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IWNKBHL94YpYEj2u2AsL1FWmBebCDkOGR5hvIzCIpq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpy+vK8tE/ObFPuqxKYAiuAUUJmYF/YXc4214nk
 mAnSBg88DuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacvrygAKCRCLPIo+Aiko
 1V5fB/98V9lwylQa8zzgj3fwt4JQ3LfGXW+UD+eXJG7HuIGAdiVEyieiT57jVXa87YK9ayxCLYA
 Sr6N92wFC02eVMdaIt8w18zowVUd2cmXcn0jlsmmRzHy/hl9skw1aH4/czOjKc+zvHVTQGxLscQ
 2JN3ypmsPcP2gxWqxPtquVgxXp/vmr238uXMwBckAL9t6WXaTWEdZnVDSqHhhDwIEB1imjnc89Z
 dhXk9IRSneITFL8FY1R0HbYTvoG+0RsPbntfrqO6wgqqiLUC40fk/hBA2rw8asVfEZKw4O99qF1
 pY7VztUV8RS78+9Bh1aCpFVu48qLgjMzKXMPsHwzpw5gg9IW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfX/ltux6BEJT5+
 8zRqG44iy2GMJJd+Xff9+8eE4GWIVTa5B72hX2ppslyGqvarK4/v/u5DRigWP3/PegRQGMi36Il
 yLqheALS4PEtRPaEoLqyD3DLieMg8JkWeODeuw4/m8XEXdFiHnRm+RyW/RNS6JQ9k2gL9Y4ZE+k
 2UHw4Bamdh4YollsXoiq+huATjD6hFc1iG+g/uwoe/vsaFTa9q4sDxL8n+ffoUHHaZtOtUUUkIU
 itaEwZPGItilB+DtGUTG8bYwY9q2BLbV86hibSf2ca/1v4aHkCpETxDkiioU5SAOEU4z50PLmpV
 odPuFEmwhdlGmYn53guWW2i+kl3e+3JusYdHAYnmmIvcir8ZoEREAm/g/MK5IXA8ycyYs0n29cj
 BB0vFs5W1EQ/dKsNfi83K791JAKwnlP0/EM+oNMG0CpP8+zb6F0ZGFMy79UNOlAON7tcGyA1baG
 K88QxOvjPMe72uWGidA==
X-Proofpoint-ORIG-GUID: UJT3zWz6KZu_9TvCvX7LmMTj44nqjRv1
X-Proofpoint-GUID: UJT3zWz6KZu_9TvCvX7LmMTj44nqjRv1
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69cbebcf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Lb5j-gmOE-iAMMu9PAMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310151

Waveshare have a serie of DSI panel kits with the DPI or LVDS panel
being attached to the DSI2DPI or DSI2LVDS bridge. Commit 80b0eb11f8e0
("dt-bindings: display: panel: Add waveshare DPI panel support")
described two of them in the bindings and commit 46be11b678e0
("drm/panel: simple: Add Waveshare 13.3" panel support") added
definitions for one of those panels. Add support for the rest of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Updated waveshare,dsi2dpi schema to implicitly mention LVDS
  (Krzysztof)
- Updated commit message to explain why the ICN6202 / ICN6211 bridges
  are not a part of the DT bindings.
- Link to v1: https://patch.msgid.link/20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      dt-bindings: display: waveshare,dsp2dpi: describe DSI2LVDS setup
      drm/bridge: waveshare-dsi: support DSI LCD kits with LVDS panels
      dt-bindings: display: panel: add Waveshare LCD panels
      drm/panel: simple: add Waveshare LCD panels

 .../bindings/display/bridge/waveshare,dsi2dpi.yaml |   9 +-
 .../bindings/display/panel/panel-simple.yaml       |  28 ++
 drivers/gpu/drm/bridge/waveshare-dsi.c             |   5 +-
 drivers/gpu/drm/panel/panel-simple.c               | 381 +++++++++++++++++++++
 4 files changed, 418 insertions(+), 5 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260330-ws-lcd-b65c03c5ac17

Best regards,
--  
With best wishes
Dmitry

