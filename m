Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041F51A12C
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058114; cv=none; b=tnZ8n0JeBhTvXpI8ynuPUYGuzwkY8pQzTNlliMFG538ChlVXADSGYoFiqQqeUVxoI5VqfM8lYf6g8wLD8BJ4TIsdNJ5Ief98MiJi0I0UOBDCITh/h1ojDYA7QgeIwl1zWLZL0CzBLYYH/a0TsCM2SaR9gKzwnlQxOyVsQGK+t5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058114; c=relaxed/simple;
	bh=3tFIsNi2qTsciuHRU9xAr1KThSqBV8jDMANac62yexk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=it8nW09IODsQQvBR9Cnt89iNffePtbIseEI/Vtz4SefrQN1NzHanWyjnaHuxWushWuWY9tN2g+qPZkEqndcAZtNRdaMQH7+2+EVu3UHq7dtRD57AEU0JOkL5hVgZxmMGsyQ3v24dcrq4ElYIZfEijTPPxH9mv/LPlQsb4GSzHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NqREwGdd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O5UuMWZS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NqREwGdd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O5UuMWZS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTak2809304
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wgs9PkeAUCVHu6qTEMPUP7
	TY/qohNgRhvSmy425EbjM=; b=NqREwGdd6LFHD74BMvYvseWlCS4jWexu4hBuNh
	F+RK1AeNImU7NpbN0fbAYnjNqr0WDK9a792iBb6ayxgyhmyS1UZmeRcyd1gQCnzZ
	KN8y23wULaDNwYb53qgSntmk0R9Wd/9QES9iIylqZGLdnRk3yWMvl3bBSz9Rygap
	9g9dOCaEocyyh23QfY/5QMxtwxM15bxzyAdAVU1q8uqJwgwT3EsFvqg4Xo1bsGYZ
	9/YzvhIAPdXXLIPPaAFxq4mNmwd6h+C5ys3vwZWLo9FUICMTD390WF+1C2e0hj3T
	xH8nk82qPaeQzdusA7P8yZMadpJt0tMFxx7Ihd3QA535MIEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54sxeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso4031470a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058108; x=1792662908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wgs9PkeAUCVHu6qTEMPUP7TY/qohNgRhvSmy425EbjM=;
        b=O5UuMWZS6jidN7ltCH1CEooahlzc+TUkHFJaYeXhX4tdi2hGUSZzorVEYs+QhwOTAq
         pq4s14vZmW3WEQCIWStBn1iUAucAkhCvEU/wfu65AQcoufxFNNA09Dm1V+5aZk7qQugF
         6YYLB03WMCXMeHFim9DiQyKyqiqW0dgVrgxa6YU8J9SSZ7ZkO1Jqu49863OK4FCXnTbw
         tz9mx0+1iSqmiFD3bm5NGagK/kVvO23iZr7eWMcC+2Ivo5S2WrJcJgFKWJbpuNqR52sQ
         uXh9pM1kHpNCPdZEtTghRThhQTwHrZ+sDDgi5a3UqBVQMBG0hQV7BnILG1zdZ+PHrpjn
         CRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058108; x=1792662908;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wgs9PkeAUCVHu6qTEMPUP7TY/qohNgRhvSmy425EbjM=;
        b=VZJoCimCmJrzfn6cVKct08z6HZWj3FhgCOg22OnhUHzjecYsIusBbcrklxTTKRx2BL
         u1GS+sNBUiPfLawDSuR8XOejoiQah6yIsDdZoL+DLC2nc8wOZsya+FrQ239LdJZ9Ao2a
         xBnkxMxv25ndYRg17VXoDat4uOh7KmA8h9Iml6XXRYWezvyFLDakAmtVYHr64R7eO3l/
         X8CdkKw9vqf0fjGK0HR6Bedtk7619+YLJZshwG8qmLWiwskTitY94ZJO+WBc1QacwHY3
         swp/AtdaUl0uGyHs0yHkz+ReuuiiJ/0YS9ND3gzVUbE43rNYohy/c6mTeHf0/F5D1t7Z
         FgeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTC2SVyYbCX7uK3jLSzkpc6F4Qro04b0L4uuV2jW6BK8re+0je9oSbuziWD+gECIj/GENevel6taL7@vger.kernel.org
X-Gm-Message-State: AFq9FYL9kzd7Om+VGX8Ino3I4DAHbUd8dWBI7GBuj++/Yl1LZ354zFDN
	mrvMPeuQnJrTcgjdUwAXiUBYZN5tDa7+t7hkYEZlw4Iqjq2qXS/z4fXDcyZ+qMVW40IdAzg6nsv
	vPcki3mTaSXXuBnb/iTd8Zp0oJMc3myBWGD5TzddHdeblXDVX4x3rTZCQ1zHp/8oJ
X-Gm-Gg: AYBFou2ZNmw5FokPfhCZUesoo9Wxu9h282vjBGqvwnOjYYURIcUJ5A98WPckQLSzclt
	ybpt+xEMo++brOsO1HO00DIB5fxAm5CtOqQ8IuBHh6mESRlVWmARtWHO7TG18IlyeMnj8ymmd4+
	R2AIq2++7ERDbyJVp7bLVlGExw2MaI4RJkI8U328XReEzNZ0oOaB3v5Q7oyw+18oDPTDvIMnvZ/
	kKQtflyjnemow3qehkFKzk7XjFZ2piCTzi9MPyR0tD96z2RcAsY5Szu8DEPbnq5Yt04aWO/9vD9
	hcdtYU2RuOI0O8ifwT7+VmiJDKiV+Eqgx5QMrymAedi+kK2iSqgKLZnxgXijnui6EuIDK0cl8Pq
	ht/yQ02D4CluKxQP9unZPpGQLZQ1NVcFiSGCr
X-Received: by 2002:a17:90b:5808:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3acad9083b9mr288477a91.67.1792058107799;
        Thu, 15 Oct 2026 02:55:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5808:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3acad9083b9mr288453a91.67.1792058107309;
        Thu, 15 Oct 2026 02:55:07 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:06 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: kaanapali: Enable DisplayPort
Date: Thu, 15 Oct 2026 15:24:31 +0530
Message-Id: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANei0GoC/3WNQQ6CMBREr0K6tqSFUMWV9zDEfNpf+QoUWyAaw
 t0tuHYzyUtm3iwsoCcM7JwszONMgVwfITskTDfQ35GTicwykSkpRMGfAD0M0NLNDNwqo055ecy
 lrVmcDB4tvXfdtfpxmOoH6nFzbI2Gwuj8Z/+b5db7o54lF1xZQNA5KFOUFxdC+pqg1a7r0hisW
 tf1CyZxuFrBAAAA
X-Change-ID: 20261005-kaanapali_dp-f6d6839731fb
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=2745;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=3tFIsNi2qTsciuHRU9xAr1KThSqBV8jDMANac62yexk=;
 b=fMPWe1BtK5sccBTp5Tk+RwP/XV52EvBj/roQz8Jii3yWxqIjFdbckyTTxQP5JctTTGg5ij6ch
 FvwwZTfr+OcCSr+L0/Ba/A/hO33kXzzUyXdWvDeoHNFOepjuog4Vb6Y
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0a2fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dO7UQkY1snIeAx-3qiEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX74Rt6RKYElBr
 60Rjk/5pxGQaTmKptoltedtmcmu0pKqQ5i0RPBRBtAIhJtT39H7b2e0y73625TbUhfxu4HPY/jH
 Wu1RQR+Ei75s/sVGTgYNgfKxB7yyNeSNiVBhlsXFRn01LNDSVfZ/wMRrFgW6+hCkIryF2TyoZDN
 MD6xsZLk+9W8eQxgMetyGaRG1Oy3W4evwemucqvIJ3EolVgmKoFvG/AKl2uHXDEQxHlhGy25cCc
 E/D/N+lEOil9yauH50DK658zLVUtO8OC8LrwNzCtGA4REJZdCtQ4kXxOX/VrNJBaW1c0X621ebH
 JtQYBuf9uGiOHTL2TnuR4Nb3jAMD6O0jC6DtYDiluF7sGuuhWD0WURdy2H3I6Kyl3f+KMdM8l5e
 EO69yqzXOynyJMHzdSCb1DXdqknhlp8Hjrbf4AOwCm2x2BvWv5xuOz/3jA2EUrU5WSxhDuCQe+l
 xYlZHtj5GY6YxFuuRWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX0UpcaNfpESHF
 kIoYhLRTHfAR5VaFZBUnV5RZaUt0u/khCCsAVMsDsW0YmrV6rMtRAh3XlApRZo2yzA/rkfxtH1P
 W19H75wwsQzp0Cprgr7DuYnhveNK9Q4=
X-Proofpoint-GUID: Brqb-jUuYIEYy3FCQBX7oB0jcgU7itun
X-Proofpoint-ORIG-GUID: Brqb-jUuYIEYy3FCQBX7oB0jcgU7itun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

This series adds DisplayPort support for the Qualcomm Kaanapali SoC
and enables it on the MTP board.

Kaanapali has a single DisplayPort controller based on the SM8750
generation DP block, routed through the combo USB/DP QMP PHY. The
series:

 - Documents the new "qcom,kaanapali-dp" compatible in the DP controller
   and Kaanapali MDSS bindings.
 - Adds the Kaanapali descriptor to the DP driver.
 - Describes the DisplayPort controller node in kaanapali.dtsi, including
   its OPP table, clocks, and power domain, and wires it to the DPU and
   the USB/DP QMP PHY.
 - Enables USB-C audio support on the MTP board (WCD939x USBSS Type-C mux)
   as a prerequisite for exercising DP alt mode over the same Type-C port.
 - Enables the DisplayPort controller on MTP and advertises the supported
   link frequencies for DisplayPort over USB-C.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
Changes in v2:
- Updated the DP controller binding patch subject from "Add Kaanapali" to
  "Document Kaanapali" and rewrote its commit message to describe the
  standalone compatible and SoC-specific resource counts (Sashiko AI).
- Updated the Kaanapali DP node to use the MMCX power domain (Dmitry,
  Sashiko AI).
- Added the missing second DP stream support in the Kaanapali DP node
  (Dmitry).
- Expanded the Kaanapali DP node commit message to document USB/DP PHY
  mode switching for DisplayPort altmode (Dmitry).
- Extended the MTP USB headset and Type-C commit message to document the
  WCD9395 USBSS mux I2C bus frequency of 100 kHz (Dmitry, Konrad,
  Mukesh).
- Removed an unnecessary line break from the DP node clock parent list
  (Dmitry).
- Link to v1: https://patch.msgid.link/20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com

---
Balaji Kalkonda (5):
      dt-bindings: display/msm: dp-controller: Document Kaanapali
      drm/msm/dp: Add DisplayPort controller for Kaanapali
      arm64: dts: qcom: kaanapali: Add DisplayPort controller
      arm64: dts: qcom: kaanapali-mtp: Enable USB headset and Type-C accessory mode
      arm64: dts: qcom: kaanapali-mtp: Enable DisplayPort over USB

 .../bindings/display/msm/dp-controller.yaml        | 19 +++++
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  6 ++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         | 61 +++++++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 91 +++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++
 5 files changed, 181 insertions(+), 2 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261005-kaanapali_dp-f6d6839731fb

Best regards,
--  
Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>

