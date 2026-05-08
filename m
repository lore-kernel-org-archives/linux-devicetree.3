Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4FA2DAFA9
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236864; cv=none; b=CSZldFfF2c58j/raozmyn83QUSFJiX8TzmWajFA9bTbro6Cqpatf5J7HtoOQdSklLUJZkajIKblAXOvVGSz+5iFAlCEZBrHEZbDFRhA+ATPhOCyYFNnSh2WgKB0vUDKMbwSNKwoNJlfve1L7HW7Z1Xs8YsFLjGIfF3BCuDtNkbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236864; c=relaxed/simple;
	bh=mUPnjNuHqO/bEXTBdmLL/Yjo490bvMFC4mPOt6mriPU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NOFYxqeBrERXsxnJMZjq1RDGNRwIkncvN47TgaFDmpiC4ooDV8C06eylaF99sUlT8kMikYJwE2YjScgu3uoEBrRuAzp9/OB4AXjZaKCmG4REMKZmXGODwgDtbuj/eV6cnVQlhYoEukhlBC6YwKsjuwnGyxebimJ5P89EFTZe898=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxwNF1L3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CXvhoaIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxwNF1L3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CXvhoaIM"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486jh8D260579
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 10:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TmQHXBxc7t3ZNmR8HxQMlg
	NPCNXa7NZvV0yAvoaouS4=; b=CxwNF1L3DLP7+ElKmvvLfIOo4Cymuthi5o3UOR
	O64epeK0PeTitXmR3OPX6SJid+PnkMkgoZvl8daq1Wgdf0vTDG/sQRMMrDv5l0fQ
	/GExikl6Uh/v1cPw7wSr/+hTQ3Z+MzQgoITk5RtMqF+37jswu43NAwq2FVERmguw
	r4fLP0BZTrRS5+MSdMGLh41a7CvpLgE/xXaLyn2y4qmT74Poo7Ys73wsDPK9JtYM
	zMERB7AwjaR7MNZuAisFZyCuzxV5w7ysFCoOT2cZKwhzTc+qozJWYwP0EY2q9Pb9
	b6aZIrAGF4obaK+ctQ5Wxt5uacxh9O0vIQjdh72v+/L74+Uw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1auegv2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 10:41:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso6921825ad.2
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778236860; x=1778841660; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmQHXBxc7t3ZNmR8HxQMlgNPCNXa7NZvV0yAvoaouS4=;
        b=CXvhoaIM5Lw14vtlqONmd7yoEpkXFrKU9+OZZEUK4RY94nwLMiabrHQp33D/MhQnSp
         ie60HrF5isSdFIQ9XpmBCchQnD+1s5xjKrIh6T2IVb4suyw3rHtmbr5MZ6q7oo5jQrQ1
         0wK6gXsbj2/d7JDzayzugxmXkTtGXbs+HXaHdXMW7lCgZr8SPM7nOGL3pITG5yqoY5lj
         gvt/2vpr2t/whdLhWRIpipT9rwv2yNmc3Pz9h9fBFpVkd50CZsjRXTgkWd4mWg/lR4zq
         Rq6vH0b6YH4ajjvupYnokXsdxaYUHAWxI1amYmLd2czT/A1Bmt7NBP35yIpJKcm2jMbK
         nzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236860; x=1778841660;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmQHXBxc7t3ZNmR8HxQMlgNPCNXa7NZvV0yAvoaouS4=;
        b=WMxkxEdHzGXhBeTq8x/vhl3ujNKqIIuZGbs0XSqOLnydMsO7K7AN30YrNF1sJFCHKY
         DhDmjGE6RUMrGX3l852l1NpCXYyBTMQUT+uwJIP6ihWz69GYOtBc49srLAfRYSTU6ICx
         yQGFowjW3OxoqTWeGpkEXnKPAUrDX1NbpKTd+IMu4Mt1DMJeW9yMq/WPCRE4XUT3d8Ec
         ZwRLFYN1fGbClCZvKxU65wX1GCNbI9zAMiEVGT8aitV9DOylg47LURL6E7zad095xu3j
         0puz8XVNCB8sSR06H24xPfVS8KucO0gU3sJJLSDBcTfj0U6hNGQH0iRoIX1rea0wVPYi
         p18g==
X-Forwarded-Encrypted: i=1; AFNElJ9ZkAqI6nAzgkjJt4ZVWwkNImhuFC/WWte8jcmogZ3nzUpBQh9wI1ahkk2yz4xxeVqBUDMunnWi/crj@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIgWtippaQ5yCoZHAqTCPqgtBpb24dGSoAb8MbPzqqfJKquIw
	nfy/y8zgWGzhG92v8vd75zgnJ8JSYLAXxpoZTXm6V7q6SSqslJWlSNlWQNOfGjgnj1QqCNQeimu
	eEEcdb3j5B05OiFhaRZTZJxpHtJ2R6qgyN6bbpigS6F/fJy7O5rE6KaQ6TdOBiNJs
X-Gm-Gg: Acq92OFZdFyu52MB4bY5tTscu9OPoU0A8VXoR0xh3Lcf4r4rEa20+i3Lo8vpNc1/D8L
	fE3HCGfR6r4lUKeMgTsXDxK5A4HM9nHemMM+wPeeZLynYCLXctSdsn/dOdka0KqtinYkgkyO8Mo
	fZiB0rivigoaeTfqg1u2fNtfGgMC2AKAe2QOZoYsMKXo3UsAa47NOaLf4Ry2OJZxm4vpfcnvxpY
	oI4f2qUFXMhW8/afKC7qfPP6i0qXJqiMoqZJsYyzV6GI7pM94rpR2aeQ5taDrgE5a2D5c8rn0MX
	AC+OfNhIRIPpkEeceUEPDKdZrPaAwjRulpQD1eWsqh/areE1kd2LVtZcbYUXGfXHUmAfJ+/xG+n
	/gKlKvFs+vdZt/8MJhj0k8eqLhPErncUpedVCqwwBCmkWPx9g4nY=
X-Received: by 2002:a17:903:124f:b0:2b4:5c0d:314b with SMTP id d9443c01a7336-2ba798a8fc5mr122637835ad.38.1778236860346;
        Fri, 08 May 2026 03:41:00 -0700 (PDT)
X-Received: by 2002:a17:903:124f:b0:2b4:5c0d:314b with SMTP id d9443c01a7336-2ba798a8fc5mr122637515ad.38.1778236859868;
        Fri, 08 May 2026 03:40:59 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3fee3sm16692455ad.18.2026.05.08.03.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:40:59 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add compatible strings for RPM and mailbox devices
 for Shikra
Date: Fri, 08 May 2026 16:10:45 +0530
Message-Id: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK29/WkC/42NQQ6CMBREr0K6tqQUpOrKexjSVPorP1KK/Uowh
 Ltb8QJuJnmTyZuFEUQEYqdsYREmJAxDgnKXsbYzww042sRMClmLqhScOrxHo73B/hpmbQar4+j
 1b0xcWlAODnCsK8eSZIzgcN4OLk3iDukZ4nv7m4pv+7d6KrjgdWGsavcKnFTnQJQ/XqZvg/d5C
 tas6/oB137VxdMAAAA=
X-Change-ID: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236855; l=1378;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=mUPnjNuHqO/bEXTBdmLL/Yjo490bvMFC4mPOt6mriPU=;
 b=E6v6ihhLYwnYWKUw1zs74xf7voBZbjNZ9eeCunTwHJT4NeDUYPy4tbucGWw5S6MhJtqBg7e+5
 mi8oB3QZNnhA+RPmd359y8n+Ve6kp7TwACSar+PKun/WetleTxP0l8V
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMCBTYWx0ZWRfX0AM5FQbdrPqn
 yBq7zuABEz4L83jQQLP4ivDZKxTkbT1bsA0CT3y9Ttnin4u2KzoGxFtTFg3fzWFhLRu4KZmWl3Y
 RPuTkiO1vhFh9lJQm/0vXvzDDxgdYxhZ3NcV5iBdpGzKgwebSLUTVK5VX70lB1o4KArmVVEhAsz
 /loMjqAhJbbTXRJOzMvywhjW4GVk3oEBF/uZ0jwpO0AG8TqbRK1Lc8GRJJ/Kpb4Gx2n96McoYdP
 whYJ6W3tNP8GoL/EdK7BsAwvcVwDixBfRwhASzAxjyAgRCsMYq8b/wYcsza6uSYTqps3FZpRwTc
 8Ff2ViNxxQtDtL2pCWZPfAJ2kR2tSeYtIqnPLDp++XpCk8qs1ZtRP+MU5Pdik1S+Is9JbkhWxMc
 YMyefluaAzEPcnfXHVTjJjY9NdnoxeXaYCeBF103YxqJfxVroCe/D6cidc18jixGzLnnydscx5S
 X8uBYP1LTRJiXzgbPng==
X-Proofpoint-GUID: DKPNYVqMcQ6_Tpi6o01t50utDuXHPnPS
X-Proofpoint-ORIG-GUID: DKPNYVqMcQ6_Tpi6o01t50utDuXHPnPS
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=69fdbdbd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JmJi3zLfmrkKxoK4IhAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080110

Add support for RPM processor, rpm-smd device and APCS IPC device
for Shikra by adding appropriate compatibles.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v3:
- "qcom,sdm845-apss-shared" compatible is already supported in driver
  and mentioned as fallback in device, so no need to add compatible
  support in driver.
- Link to v2: https://lore.kernel.org/all/20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com 

Changes in v2:
- Require "qcom,shikra-apss-shared" to use "qcom,sdm845-apss-shared" as fallback.
- Link to v1: https://lore.kernel.org/r/20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com

---
Komal Bajaj (3):
      dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd compatible
      dt-bindings: remoteproc: Add Shikra RPM processor compatible
      dt-bindings: mailbox: qcom: Add Shikra APCS compatible

 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.yaml      | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml         | 1 +
 3 files changed, 3 insertions(+)
---
base-commit: e75a43c7cec459a07d91ed17de4de13ede2b7758
change-id: 20260430-shikra_mailbox_and_rpm_changes-2de7fe8e964f

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

