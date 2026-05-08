Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7FF37B02A
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233876; cv=none; b=bPUMRV2E2JrNzPP7dtFYumCqRvld4ekrAhbJSbXRkTWdm9CsnIXbGFMbVZRmfVm0uo0wPcB0Msk99Ps6XSuDy60h/Glzx94OqX6BY7a7SbtTRJ6xY3JwcUkCA8PcIYLGKJ66kij1AhwbHOpm5VMm9Vzu1egNvSDGWmH33+HvdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233876; c=relaxed/simple;
	bh=dZbdG8xCn+JuA0WCVgiI7YMNboNaRMEBax58K0rK+pk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wyvx+tE1R5zoXRYlNZ0MfHUwMTmDjJDnuohmOSU3ObLSOAbCC6H5X8iV96WTLlRwAgpwKZlVQrPDOBFgzXIDFzQsoRrm4IG2Crwa6FXTfnn9IF1oqn8jEBguxzd+GKUgGCyJyR+hbrztIHOsjU0MVd3EXXFiudnQjiL4AUBJOAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM+OHVDI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fr/Vkh8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM+OHVDI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fr/Vkh8Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485RwXY2198948
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 09:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DSbhDJFNE0S+GLbkrvphLt
	XCeoY7qMYPccxd0H+gask=; b=dM+OHVDIrKuVA5pcP9fG3L1BBc8kwdAitXerP7
	klgQ5OhMjWED29pY2+A85nrVn37rgcIKwyWS2mtpwlEptW60OD8ifkjJzuXgCbFf
	/oToKd+OEM6FIQpoDlRc+o0kodYki1yVlTzpGuufIMpMAyFBkOuA0MiBnyX13Ugg
	LX0FuaWUhxIvrZ+vpyJuAOT5xHFVldiO3avxUC+ngt9Wax8BLjc4zb4+3VWadalb
	9VlJe6HIAQ4ysCUz2yf6nFeuQkiQBK7jdY6F6BLUafeKbTJIjO0J+lTCGC/dkuxo
	/futr1JVpwqTQOpmm59Bv/7hyYsyjOCHgW0aZupX/ZukiI8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e119sjqdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 09:51:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f2d983d109so1774918eec.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233872; x=1778838672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSbhDJFNE0S+GLbkrvphLtXCeoY7qMYPccxd0H+gask=;
        b=Fr/Vkh8QRKdSclY7II7KwI/sBX7dOIrLsjLvhLCjC1aH83NH5yNE6x9mOZi7IY5jg0
         eW4Cvl+Huf6TUV/LixutBeIt2sxyoYzrrvwR0Lei43Ina6Y4OkW9sXnnVdCMN5jtO9Kz
         XwIo1go8+AvR8nksfw67r6w0j6nkBgM6EiF//C6t3sCla/EgM+zlNSSdqaQzyn7BAQs5
         xeH/TBxnW6iRGoDZNOiVqRxbikEHHQHXRixcxNmaPVSWHYc51e435VllhUZblbLLC6rx
         mvwflJN0NfvqjsjQZ5Vi+87GWyGHG7NqudMGdak/aL6w/ZDxNMYsXL1N4QlnBFc8YUNs
         g/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233872; x=1778838672;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSbhDJFNE0S+GLbkrvphLtXCeoY7qMYPccxd0H+gask=;
        b=VPrhoOnvkpC3ndaJaSUJfiYKZb0BNMV5p8n/YjvgDJeXiTNkd8dV4X9LJtcaDH+PUL
         v/ICDTtREf561U1EBcrrYM8s6s6Npg516DeMCy+G0gGcqNwJw7mr4PRgDNPlGbkQvZQt
         SX+XLOkBku79PFXzsQYMf4Ce3UettEFuYrNtZHqZay1LcaG65gLLOyK+70KHxRa2peNi
         SRLTDYRv+RdZh07Cau61t/Q2yFfYICv5nr2B7o8KSI4qaYXYFzWNY+ttLBKGP20Zhgbm
         apVOB+/RjapZvJfi3e1imj2S4D5VWTsFU7XZjK1r0MnY907TSPmqgkU3iw3dZf8qirKP
         zoZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/sh7vJIGb88ZUQzYmalNTml8pKSD6VQev/y9JHDwToatc4YiPRCAJGQ0lcknrqK4pIqvYSlXLppnQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy74Z+VQ2LyFDv5qByHpb3GHUJPslXm422Oybu3KarQg/XdZGgl
	aQxeQBchjANiQaMW+6WlrUshrhqr11xknlA/54RwzYB1K9c0LaT0CJ6vDZlUu63ovlAJCEOlnz9
	6zMN3T+Tv0gI90N7CBvJfpvFUQKCcDQuD7UCLzV5MraNI+OqiuHndQZgGp8hHPQXx
X-Gm-Gg: Acq92OGlp5Ye8YMzULtBNimWuth5n4SEeCXEaLq5ZMwQEPYjZt4Ez+5OGNn8LBIPw9a
	jbLREiV7h15CDA6xbYeHNrcEwmxhsnbxjHVLc08OSL7rNvHiYVQtFQ2DYiaCguYmp0omntfnxit
	PFhf45Xyh9yvv4mzkqbthRha6AjsMxlDT6oV9GKtDhrw6TcYwXIklW1gtejP5SbHFiTcnRPxgFe
	dcNPwGdNMbqRHgo9qb/7VQNN0aSBCHWuN0c9aN8adEWT9tPdyJpu6h8SXbMbJYeyHA/g0sENUpf
	l5A2i2YXvZ105ZMjY2zqmg99X7fHzDPf8Gn+vwJoWzqtv2TsdjuE8gHxeglEeHwju9m6DhlqEAF
	EZv28iuBPCsV2h5Vm0H2ZSNw8hW0oZoXRIOT3jlarOwoH95E6mWjLTKJp0bUGgAIEVanoqIkxve
	Ge
X-Received: by 2002:a05:7300:dc09:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2f85e32c7ffmr826736eec.27.1778233872004;
        Fri, 08 May 2026 02:51:12 -0700 (PDT)
X-Received: by 2002:a05:7300:dc09:b0:2de:6fac:f666 with SMTP id 5a478bee46e88-2f85e32c7ffmr826713eec.27.1778233871420;
        Fri, 08 May 2026 02:51:11 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:10 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: qcom: camss: Add SM8750 support
Date: Fri, 08 May 2026 02:51:02 -0700
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAay/WkC/42QwW6DMBBEfwX53I1sAzbl1P+oeljw0lgNmHjBS
 hXl32tCol566GWlWWnejOYqmKInFm1xFZGSZx+mLMqXQvRHnD4JvMtaaKlrpbQBdA54necQFxh
 ChB5HZggT8NjYWkItTV85Ko1rGpEpc6TBX+4J7x9ZHz0vIX7fA5Pavv9nJwUSTGUGIk2d1fItM
 B/OK576MI6HfMQWkfQTa6RS5dO905LODKqrxnavDaHDPxi3vXek85oHWfbyv3u0xQOt4Qtxwhl
 P/kG3pbXaVRUNg22TKrcFOmSCDe6XtpjossDdXkubk24/VhE9zYIBAAA=
X-Change-ID: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfX0sqYkVQFfzp+
 FK8yg+CQhErQpyyw43T56VL/3ccuWv3dFwZdIAUi2clYbGRapC9aR6+EnZPu2iUr3QSKwtYc3zp
 x/SoD9KkPQotuoluMY1iF5IeV5bL3cWqe9pIr3SwepMdBXzLeZWyRHW6I+wa12XEDdsaQu3knWV
 ZCol3RhTvXvDOa8Gl0gwDnhyOfRJhrwGjriE+XTPfpWrDXoj1alMcCO7GEZi3NJB2YO2OeQR6hi
 0SdzwuPt2k5GTRCTAVkYo50PgjbQozYi5d+VQ+rq2m1lODnlCDoDgi8TE35RlinpwL26csmnh1Z
 gLD+8ZIDEjShDKU33FjBZANBq5LCn0hJn/339MCLY78gSjgMm+FatD4FpbRtPX5VYycDTJb6r6D
 VOCTu42beGq6yRXw54OtZuo2zUgtWuztfpm8WpitavJAOkaGqGCGXcBKFkgs36iYtq3T3SMDphe
 ywrbNWX9QyanqCgCrxQ==
X-Proofpoint-ORIG-GUID: edKp8HHeYV8IQkAyU5zKj9NI1k6jXbVa
X-Proofpoint-GUID: edKp8HHeYV8IQkAyU5zKj9NI1k6jXbVa
X-Authority-Analysis: v=2.4 cv=Dd4nbPtW c=1 sm=1 tr=0 ts=69fdb211 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZthKqu_aCWk3wB8NWGYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101

Add support for the RDI only CAMSS camera driver on SM8750. Enabling
RDI path involves adding the support for a set of CSIPHY, CSID and TFE
modules, with each TFE having multiple RDI ports. This hardware
architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.

SM8750 camera subsystem provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

This series has been tested using the following commands with a
downstream driver for S5KJN5 sensor.
- media-ctl --reset
- media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
- media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
- media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0

Dependencies:
- https://lore.kernel.org/all/20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com/

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
Changes in v3:
- Revert binding from full hardware description to CAMSS-only scope for
  modular and incremental development - bod
- Rename icc path names and vfe clock names to drop redundancies - Krzysztof
- Separate port index from VC value in csid_configure_stream(). Previously
  vc was used as both the loop iterator and the hardware VC, causing
  misconfiguration on RDI path starting from 1 - bod
- Link to v2: https://lore.kernel.org/all/20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com

Changes in v2:
- Rebase this series due to conflict - bod
- Add module descriptions in binding commit message and cover letter
- Update property names to align with previous generations - Krzysztof
- Update the vdd supply names with 0p88 to 0p9 in binding to keep such name
  style consistency - Krzysztof/Vladimir
- Add missing Kaanapali dependency - Krzysztof
- Add regulator current in csiphy resource due to interface changed - bod
- Make csid board level code style consistent and add comments to explain
  the differences between csid full and lite configurations - bod
- Remove redundant initialization for empty set in csid and vfe - bod
- Remove DTS patch due to conflict with camcc dependency. Will post it
  as an individual series.
- Update vfe commit message as renaming work done in Kaanapali series
- Revert change-id to v1 to avoid increasing reviewers' workload
- Link to v1: https://lore.kernel.org/r/20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com

---
Hangxiang Ma (5):
      media: dt-bindings: Add CAMSS device for SM8750
      media: qcom: camss: Add SM8750 compatible camss driver
      media: qcom: camss: csiphy: Add support for v2.3.0 two-phase CSIPHY
      media: qcom: camss: csid: Add support for CSID 980
      media: qcom: camss: vfe: Add support for VFE 980

 .../bindings/media/qcom,sm8750-camss.yaml          | 433 ++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-csid-980.c | 442 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     |   1 +
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 357 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 1248 insertions(+), 4 deletions(-)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20251126-add-support-for-camss-on-sm8750-506c4de36d88
prerequisite-change-id: 20260112-kaanapali-camss-73772d44eff7:v13
prerequisite-patch-id: 03f9fe5d9a18559572b9a56c3b1f0fb86109f4f2
prerequisite-patch-id: 5fbe09dec4a5448b016a6bd1d36473727bdbd485
prerequisite-patch-id: 8f832b0d20f4272e7fb7ec96aaa1eff5fbf92a65
prerequisite-patch-id: eab12388eeba7173c9c6eb2e49e20a9913c66287
prerequisite-patch-id: ae1a617c1a945eb6bea854318fb570b9a1e1be9c

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

