Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC923415B74
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551594; cv=none; b=qQDbRQXzTuy8ycj86v6ncd/t8G8ABUUaxuvDZej4L7pf9NmI0sLaGgKtNLfTncnXfm9dfYKqyj7E02JmyHIlIKjtFICshbyVF1/hln6jx94YbJ17FVLVlyyEVtzKv+8wV8Bkh5ynWvv912Xu16ApE8jUn8dwrYQ360gwji0MlZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551594; c=relaxed/simple;
	bh=UEbmskBorYmmQbDJ+gVJYn7vft9oRXM2EpvvWF/gsyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V0gJyfKehEJusTztlmXiXCKCzFebZw9hfjepZuHdWsaoxu9V6bSzrBn/KuoWPP2HetwperNyDJ8P8XRSG6m3rKy/dP0gC1fU/+25dP3yb3Afteka4ro2v6Zi5m2WjmujOt0Vj4Vkyzo5aye/tRj5J2DlDlpIWLsiOHETcl/ytd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgOestXW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JzkKT3xq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgOestXW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JzkKT3xq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KIse1746837
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 13:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y39uACIITAm3E86iuyCJQO
	h04AK3pIwWRty/9TUNn4g=; b=SgOestXW8KQ7k3easDcL6nYb3wUjQIYZo8F9dt
	ZjR8waHgtDWl5oubLJJyOxMhng0Xp7Gj9pG/ATFPJPT1IP8g1iIZlyQcHO5K7foJ
	TVPMKEArVefQvizentDt2O1yPNVnf/lILsdFiQ3xJCVZIbu9ht3Jm52gs88L4uy9
	r9V7TRDgUsoxEbxqiKDang3CIOGAMC/gR0OzDcq4TKcz/X4kBgQXr9gUK7hf8mIR
	GC/wUtB1qARkf53XMtkqe4wzxL8OU3S9z9mpscc8LxsPLfqlqRu2i3Ebg6+B0IQj
	wEGAiJhgqWV88ijQwiC3z7+WQ7R+nDUrQjzHa+MXzq3PDzDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ekvbynd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 13:13:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b59692e0dso5529098b3a.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791551591; x=1792156391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y39uACIITAm3E86iuyCJQOh04AK3pIwWRty/9TUNn4g=;
        b=JzkKT3xq+mrQImXN65l1TDRgbj9lGR+uFEy1riREtAGZ8oexFjv7ArbZAUG1k4rL+I
         e548J863v+DcIMU+v55SgsRJR7F0bfs8eOxDAXEBL2nsmzVSBrQ/fEz4x/js4guUEuqu
         7WdLONa0IwibiAg9B5xd6POVR+2akhH5LbjEH/TVqu+5U8MznirupzfpqquLUsK/h5dY
         LqYKNFvDKSmQRj0NoDnRng/CmDKf03kIgTMc0zrndY3IUdVqEGwqAowiTjg2vHexlmnM
         5lctgV9ANJVXqCiolwhJDEhUsjV1XZIxNQNjvAylUt9ahtLpEKnlUjjWi54+bWrsxE9Y
         CDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791551591; x=1792156391;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y39uACIITAm3E86iuyCJQOh04AK3pIwWRty/9TUNn4g=;
        b=gW4yukRzCO7tzf8Mp4swYgz/EL7JjvBB4m6NlPDj0nhOuuy49NepzFLfMTaUWHeK/R
         0KH8ozGe1JYkLdZ+Krd3iDLx5bQeQJxlmtECUoVplrC+vb/mUyZVAvRExbneAk+JXxNe
         32Rlsk9YsOPByhnCDFnc0ubtqj8pe1lbaN193xF27NEoA0FuF5eEhd05aXp0glTQL7cE
         lODL6bM4S60Ks6vAETgZbLZAKngZKKj/IKD3RgB3nC0xRvSFCv+AMEodStAt+GXjkwTy
         Tx0+hWPpAVe9neVr4jgAjQWMBTggGng/x/F9qgibGjaTxNjNG6Q9l8uyVdIDZMoO3d0Z
         IDcw==
X-Forwarded-Encrypted: i=1; AKwUvBz7QuZ++GhBBFgFuerwA1U1gPTAW/JbiwrvAiBd1mjoVYL6+Odx3Rlf2/BrkOMICalOJ3LHnmQwRhaz@vger.kernel.org
X-Gm-Message-State: AFq9FYKwl7/JnfarhOZjD5xXZOvIHL+wir6S358b+v9SOk+U+hQqt9Lq
	HAxYGenxMgraaYbBfIc6PK3RuaXM7NVq2K+aj9W9EZXotjP/P/wVMhzFhfR4RpduAxUcroJE/ZQ
	kADStJNXtIPpPzpsKOE7ND3TbbZJuKcftmGc2SKUCU5f4O/j45dkErBaBrOI4ge55
X-Gm-Gg: AYBFou1Q9OmV91IAeBs4gJCGGy6Z0JHJIcadqP/jzXlJLHPtmSYI+TZsdrro2feo/Bx
	EZOcdFcOJHpmTqcq0LlMuaSXBY9bhCGf5iyjD/l9NwLsukkfAl8IG5iLDuvYvFFY+D/fLl7z/PH
	0QyDwQZuduIGWel/7uZiaMfUpMwvzmkwMbny8EjdQ7+PUOioX+Bz/RY+H3Yi6t5THU5lv8cT6Au
	E3FMzR6mQLDvFwQQ0uJUlBrkgpwrqrpa8ooBWLvUrNiCIdqMiV4afzItXS+lvMES4Q1JweyI/RK
	cRYBTNAbvYYMWLAMSI6llCb5PLI/X4H5YDq0YMntNlm+033lT+nhP+E/FnGSDBwazGsqiD6SB2i
	BCXuOmZ1cLfsUHcOi8Z7Uymio5IHymaeZfYzq
X-Received: by 2002:a05:6a00:18a2:b0:890:b18c:521f with SMTP id d2e1a72fcca58-897c7cd32b7mr1816394b3a.50.1791551590516;
        Fri, 09 Oct 2026 06:13:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:18a2:b0:890:b18c:521f with SMTP id d2e1a72fcca58-897c7cd32b7mr1816365b3a.50.1791551590026;
        Fri, 09 Oct 2026 06:13:10 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4b8ec86sm939053b3a.61.2026.10.09.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:13:09 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 0/7] ASoC: qcom: Add Nord audio support
Date: Fri, 09 Oct 2026 18:42:46 +0530
Message-Id: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7oyGoC/32NzQqDMBAGX0Vy7kr8IWpPfY/iQZO1plRjd1Vax
 HdvYum1sCwMfMxsgpEssjhHmyBcLVs3eshOkdB9M94QrPEsUpmqRMoKRkcGGnYaDNkVCXiZJkc
 zrBkUCbamKotcaiW8YSLs7OuwX+sv89LeUc9BGRa95dnR+8ivSdj9SuWfUhpOgmxVV2CVSyXNx
 THHz6V5aDcMsX+i3vf9A7npFzDfAAAA
X-Change-ID: 20261009-nord-asoc-driver-support-v3-71ebd98740c6
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791551582; l=2975;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=UEbmskBorYmmQbDJ+gVJYn7vft9oRXM2EpvvWF/gsyc=;
 b=JyJx1aPN6oQlpiEa8pgospxLDqs5jow+1PRDhP0bSYgmWIwNtrwMMSEx3p5JVXhM7Fy5gUkc/
 A4+kS7/HySHDoQBfy9kIoivfARDL2fw83bB8w2/wNhYlROwNBiXQAif
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: XYzFwFebsUtSPCjT-eqjHFhxAkkHbmIN
X-Authority-Analysis: v=2.4 cv=csYOAF4i c=1 sm=1 tr=0 ts=6ac8e867 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=3s0VHmhASnHXix99wlEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfXxTfw2sp23x5f
 RhTMRL9XbcE18HVWirxQ02DS5APOOUAs4231qcibMWDBC+hP2qcu0OLZwd8w03pu18Xu3/Rw9Ii
 RAACNFkcpo6wW4Q7ilAxkWR+jWyOaCkHRdHOIYCs3O7/GAlPvHul56JfJTOi38VxK6aa8PmTo5/
 ZA7BKjkou/uNEtdeYxAyJYTwLRsKLk+7zPNU2zhxPk4FtsoctzkSRo31IDYRONCAEIWUVjGBMqX
 X2nExTcywTVYBT9TAPCxEENXHgxVnG2W0uefjFHv2KVC7nfh2Fv7pHMhViu0xkpye0tk36EAjnh
 mE0mqC4aGlxEIZBfyPbITP1hdzM6oY/p9KJf1k+Tzxg1hiVPzZRVUKsIbtI0dWW33JQuRUUXK9R
 sgkVtuKq5zrIVXB7CjSP3I6FReaeWkZWfB6S6qTtL5eS2ihA6zZyhQZGJ2KFlYHJe46bTJHlWZC
 r6m7GwhKDs2nlfl1qyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1MiBTYWx0ZWRfX8VpWIe/0Pqqq
 o2dnPYjRCdOT4vFKPcM+yp60HmZkus+4oJNE5EI8X18H31GTvly+B22kmzgvY+1WufcmUrJg57L
 Tli5QzA6bmit6OsA23Xo9r7fmtQZhcI=
X-Proofpoint-GUID: XYzFwFebsUtSPCjT-eqjHFhxAkkHbmIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090052

This series adds audio support for the Qualcomm Nord Ride and
RRD boards and includes the required machine driver, device tree
binding updates, and codec improvements needed for the board's
external audio codec configuration.

Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
Compared to other SC8280XP based platforms, Nord Ride requires
board-specific DAI format and codec clock configuration to support
the external PCM1681 DAC and ADAU1979 ADC.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v3:
- Enabled PCM1681 VCC1, VCC2 and VDD supplies, as suggested Konrad.
- Link to v2: https://patch.msgid.link/20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com

Changes in v2:
- Dropped patch 1 from v1, as the ADAU1979 codec change has already been applied.
- Moved the compatible string from the board-specific file to the SoC file, as suggested by Shawn.
- Added runtime PM support to the PCM1681 codec to manage the SCK clock sequence.
- Added TDM support to the PCM1681 codec.
- Added the required POR delay to the PCM1681 codec, as suggested by Mark Brown.
- Replaced LPASS DAI IDs with QAIF DAI IDs.
- Link to v1: https://patch.msgid.link/20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com

To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Srinivas Kandagatla <srini@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: ti,pcm1681: Document the optional SCK clock
      ASoC: codec: pcm1681: Add optional SCK clock and runtime PM support
      ASoC: codec: pcm1681: Add TDM support
      ASoC: dt-bindings: qcom,sm8250: Add Nord sound card
      ASoC: qcom: sc8280xp: Add Nord sound card support

Shawn Guo (2):
      ASoC: dt-bindings: ti,pcm1681: Document the PCM1681 supplies
      ASoC: codec: pcm1681: Enable the PCM1681 supplies

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../devicetree/bindings/sound/ti,pcm1681.yaml      |  16 +++
 sound/soc/codecs/pcm1681.c                         | 157 +++++++++++++++++++--
 sound/soc/qcom/sc8280xp.c                          |  51 +++++++
 4 files changed, 217 insertions(+), 8 deletions(-)
---
base-commit: 62d9f9ffdfd44e88010412bf8f23732f0a93a9be
change-id: 20261009-nord-asoc-driver-support-v3-71ebd98740c6

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

