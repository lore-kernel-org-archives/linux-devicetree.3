Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69EF3B5314
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685219; cv=none; b=r3CBOlmuNPoNNrOckH6xELxwXFGB2cTQZet0lNZ2EPryJZP8PinLAIbODz11ms7BR9EshuRwzfnu2ozQMBgNlufnQsN3vXdStrLuVGBxP4SnYWb2V+7Og/82IIkVn3uLwbI4hb5IYnIaeprC+jimpzCzLGMZlM0jnJ1DXpowR30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685219; c=relaxed/simple;
	bh=k5pErw5pWcfIMHx25Ki0gZNUOC8nLjUsDc6XlyKxZwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dxY4tW273bw8JOa4zWv8PAMn7vh0gHCJnaak4oPBSBQ3R15BoLk5jPXbcpg72JTC5Mlxt5alvnQGUTqbXwBlEw5bxk6x7RHoNCrCTXAtVR9W1X9pD+M4uavewa+S/l5yn/gWechYFZfoBASifRqq0Cw3pvsYiO3dA1qMRe7mPYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOjCYBbD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlAkL0ZH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOjCYBbD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlAkL0ZH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdFPB3221737
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pFbHg7iQKy14IhKA8u68K4
	JT9+SQJD19MuWOafVZXio=; b=ZOjCYBbDCfiGNTErNj9oEtkwxNwY9BtfNckmPc
	RyyT7KEnX9/t64HLBdFswVCO+0tBhPc4w4OInt6p9KOr+9We8CUfs7XeWO2r9L3E
	PI4jp6+odoZW3x0Vht3a4aKqwyL9rbUDS2Z8U7QFufFBImkZExXyoe89dNECqncQ
	xatv7DPHtvdEUKxAaoBgcEkaEUU5Rrgti3DW/jExfxnDlOLjkFJHIegxl7Mczqd2
	DsQcwuTu0EsYPAuxBOHT+tJVbbGFRB5Zb7GEXm9mk6FMuzsV+xApvzIR/D8FNCwc
	CENhId+dlHFFEVqmjZlrt7sSPoyQxbAAZuxfpmmp69Hf59XA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxgd4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 19:13:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39640eebc57so400216a91.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787685216; x=1788290016; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pFbHg7iQKy14IhKA8u68K4JT9+SQJD19MuWOafVZXio=;
        b=JlAkL0ZHCTm4zzp1NjY6JgGDq0pFvQeqhbOwBGtEcZ2BsHarHedOrsGqJXmBVjJ2hX
         B09bRcaDL7aDAJQ1xhy2j17NFphzRfi0TuUtM1RlovQDdiTw44S48pXtIC5NNy7glLzc
         vdJq4QpoEUBRApT9dQ9qxU0xExbgWlfMWfbISch63bgWrVTYiOvmMgLx0yQ3WJScOb9I
         bRbhmtEhbxv5XpI85KqE1r3h3geykwKA/yVyv5PPxODsXanPDnOrrpVb6Jy+ih6F+SK3
         //ih/1P39KbhR9Nzhr3QCVjsJH6Qsc7TuAsqIYPHutm2arDvpHGuBDUv53C+XSXD20Eb
         vp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685216; x=1788290016;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pFbHg7iQKy14IhKA8u68K4JT9+SQJD19MuWOafVZXio=;
        b=igr0jX18boktk3ch5cSJpG3lP1NvSbOm2CbOGIx6859l3qVYOhHlOt9BE4tbADocSz
         h7+RyHWUs/qa9wULnQQ92l6BBqEg3//NuzWax6zoe4CgffWwr9yYrNY3OPGmxL2lRCIC
         q60Al16sldG5JE+drCfCY3fBuIjihJpAvplwFliiL/9fizFXUL1vckDntELW665CHtRu
         QugcxvvdQMiWmWQuNNukd0/SlZuJYnpesp+VqmLcJC/kXEgMMTttCcu1/7YRoZSL3T6j
         kw2T/6Dr/LPcwAzgJ/EU47w7z76bZJ52D4W+XlYpX6zgNdhhnK6JC4+ZG+BBIroFvw/1
         dfsA==
X-Forwarded-Encrypted: i=1; AHgh+RoJHOLFJCfyiaSHEqH1NZZC9uMaGYMpcD0AtVpXvB7CwPxYhRf1Z29B5mWBHlpalYmqn3JcAxkAL1a0@vger.kernel.org
X-Gm-Message-State: AFuF++lpgy0DqXlxGgMwGAbLP1SwhiiRadYysMZ05nM2TvkXdZMkxk4U
	VclKVlPmW7AfV0ZsIfgcbJEG2VUHHxPDKyqSYLpIehc1ikPd/kLuMWC1Pw0/uohiYoWnIB3zl16
	qdwSFx9DLNCoReYHpNTp3awQO0HxqsSdYVN6jFrYS19du+u9T1dYjgUhG7fQZOGsz
X-Gm-Gg: AR+sD11IsXhTSkrah7+oeZHVwEqnL4/HvmwVOQctv6an+XOxzQCOPGn9S8ro8wJSBjg
	ZpwXZ6j9HGFt6ES7RSu7+8hRuVsvMwVmxTQxSU3SCPy0PDT8RXbiAaZ+yLE3fyyInYImOCFota7
	rRHmq7OGduRckweC1lwGM1b5Z5W/dGeC9jYK99CsYNdGn0AzsBPeMh3pnGVvSb6USGEikIuyBf8
	IwOAtdMIyZ5rh2kNLxxFm0E4jux0e4zgcQnC4RotndvxwF7Wu/8LfItXmxk50Z/WdqEDJGGVVoB
	CIlcWsqRh456EnyO9Nw76sw1Hi/OQvauHxKUEP3n+aofTs+W9DFL5rNIh6VI5Uam+33GwJRjOaB
	wH3Vw91pLfyz5DsJw6DbhEkHUmiR64D42
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr2559416a91.3.1787685216508;
        Tue, 25 Aug 2026 12:13:36 -0700 (PDT)
X-Received: by 2002:a17:90a:d44c:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-3966d366aa3mr2559337a91.3.1787685216130;
        Tue, 25 Aug 2026 12:13:36 -0700 (PDT)
Received: from hu-afaisal-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da048d3sm930416eec.28.2026.08.25.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:13:35 -0700 (PDT)
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: shikra: enable ST33 TPM support
Date: Wed, 26 Aug 2026 00:43:20 +0530
Message-Id: <20260826-shikra-dtpm-v4-0-8476223184de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDpjWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCyNT3eKMzOyiRN2UkoJcXXMTS4PkxOQ0oJyZElBHQVFqWmYF2LTo2Np
 aAGsV601dAAAA
X-Change-ID: 20260825-shikra-dtpm-7490cacf0266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787685212; l=1135;
 i=khalid.ansari@oss.qualcomm.com; s=20251105; h=from:subject:message-id;
 bh=k5pErw5pWcfIMHx25Ki0gZNUOC8nLjUsDc6XlyKxZwQ=;
 b=hBxIefE7AEhSR8MViBfMKFNTveMuGdGt/7uGFiddRc7S7N602V7INLyTSIH2wXYhLDbENV7d0
 Y5j0ZnRfT4VDrX6U8lGpDdySnrfNkwZQpMKnzRYUB+lDqM+URCGIkFe
X-Developer-Key: i=khalid.ansari@oss.qualcomm.com; a=ed25519;
 pk=eBXrIUgTWV0cgG+GsNeZPPgvj1Tm6g9L2sfcoxMGrKo=
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8de961 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LFEp--mz5Qji-3JE28oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Rm7U69drYQtWqjV6853f66EdAxmhxQii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfXzzMc3gjazDoT
 6Y50SFB+gdq+vE4BWTifnEakgk8qH8YzOBVPeTvZBVqkE7noYt0GUMBgb3xMs1Ne7IN3BSFweS8
 SvrLKhjRLRG4HWxJrqBdGcEXeqE2PgD4ARkehVvWC9jvweXls/Yt+PdChDEEQKOFpKG0oheUaZM
 mJPyUoB6pAarvDztrsVL3EcbOH+aRlQvHxJhxw7FhH+16AgUmgJi/b0PQkgUEusN0YrWPKQ+Yb1
 h8IJ20qGuR1FvvGoJjlt++eo5Frlk0q+YeTEpGbZSu2e5hVUNYCTFkFxqzzqPd6qZML4eXhzitk
 eAhgG1pcL/NHOcX4schKKsIneTWzkFB+xe4hiFk5kDZrGcciMEyw8iXlsiPf3sJBwYWhBPkKgcs
 N1MNrEa4z2q8N2QraHw0IOpiaNDhnDRnumQdTbfG3ePA2NXomRl1JiU8Pt5h13Ik1mNLl6wbrnF
 V4+YIob4N5mFXoW+tUw==
X-Proofpoint-GUID: Rm7U69drYQtWqjV6853f66EdAxmhxQii
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE2MyBTYWx0ZWRfX+nhYqrQT3+Wv
 b1UXpwlTAybs6AQ6fjyj9zVUynKVyGGzSYKB0JRh3cFqw4CsQuP+jkFbmj4+R7lWr6PHAORmPnU
 rFZ0joEH1b1sNZk/15Duop3EFxh3mFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250163

The Shikra EVK platforms support an ST33 TPM connected over SPI5.

This series first removes GPIOs 14-17 from the reserved ranges so 
that SPI5 can be used by Linux, and then enables the ST33 TPM in
the common Shikra EVK device tree.

Changes in v4:
  - Send the interdependent GPIO and TPM changes together.
  - Add the SPI5 and TPM nodes to shikra-evk.dtsi.
  - Remove GPIOs 14-17 from the reserved ranges.

Link to v3: https://lore.kernel.org/all/20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com/

Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
---
Khalid Faisal Ansari (2):
      arm64: dts: qcom: shikra: unreserve GPIOs 14-17
      arm64: dts: qcom: shikra: enable ST33 TPM

 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  1 -
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 10 ++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi |  1 -
 3 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 65eb47183e176d8c1220cb945edac71dbedceac1
change-id: 20260825-shikra-dtpm-7490cacf0266

Best regards,
-- 
Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

