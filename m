Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B5747CC8F
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181736; cv=none; b=eJj4bCilHljUj6K/eS7VdZKCvAa0kVpc4flDoLoTPZuGdR3sSFd0xreMrbzyyoqrCoEWXTF1a+5PcIoO55w20imxtjD7R6Z/xWX6g1jQDAoT4EroSj8+pgLZkxZntgLQrblmdB2bQL7WurPOYtXqaICGkVUf2Bk1cvYoTOAd/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181736; c=relaxed/simple;
	bh=sfxMae/EqwgCxufleqKr9y+7CQrnZNWHdz9EphTRWQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cRFmiLcIdFv8oivuw8w6KY1Hbg4UakLKrpHTe9oLpVjFSqIHU/KF8Um5EhLQVRkC36CA+1gm9oWJN4RnsR1nfomunzSgR/BizVEehcDA+J4yAYMRq6Xs5s/shzFseCRe/scTEJwJu2tJp9xd1bNPhlBy2FIkUg4qIPwIZeoIrBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxoHucsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwWqm2yK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mxoHucsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwWqm2yK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647HQk2S2734244
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 19:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=34n5gfXmKtcjNoE8xNCiR3
	+n6m48lU5QKhqhsIP3Jqw=; b=mxoHucsB/UoCWDYsswUl0IdrFx1JwFuG54tc6s
	2WfgZonfGrtehwwfWPJdi35tSagKOVi9BomyzGmyOUSBsP0SYZXWlQ4xUsEa/NqW
	Eh74q7EPEZd19TXA3eh+Q9LqY8cU0O7ID9hI7YJMWbhhd7pr6kTQqF0Yl+ZQM9VX
	TeLf1D+ynjVxoZ+sSNsHIxZ9eG1Hite+9n+WXOfQpHhVDVkYr+7m194gq4iH+vE9
	pgXw6W8tsnqrl6g+ECvZz+Isq58a2Nu9enRshSn6ahvu/3LgEbOyZlTDAgmlWrOa
	71FzkH2TBvmS5iomX7iii3flXx6ra3sSBveum+gHjiuH1kpA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqsst1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 19:22:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso13034045ad.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 12:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778181733; x=1778786533; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34n5gfXmKtcjNoE8xNCiR3+n6m48lU5QKhqhsIP3Jqw=;
        b=ZwWqm2yKenHXRDH125aZl/xvWK5C67WPCuuAHwS3LtjZtWkeavYgSNmaaPFITj8ZnF
         TcurDFahraTzwDECmnTgdp79Tfri5cUdPc7hryXOtdrN2bIwPYW0FfkvVo5pKhZoisO7
         Ga8uokHL+gC5OV+dUmARy8VypzdFCJrPt30GNKi1OTdj4LB+abo3Qmzkb5WqYuTotLbW
         R/QeFWV5AESusO0Jy9C6Zf8OA04B7uuO9+RquKXT7rVt9y4Kx+HtQX3mNiS49cdlfMAW
         eLsuMFMf9XZJ/sP/n0EqiFCi260QPT5Py68uDToNNUnPu3u/kt+ml7gjPuNuqYxkiVBk
         xyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181733; x=1778786533;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34n5gfXmKtcjNoE8xNCiR3+n6m48lU5QKhqhsIP3Jqw=;
        b=aX3RhHVOObWeFnAjc4H7rvG/RdLFlWy/7XCL/Hh++1T3Dx2kGT1NZqcYZYEgRZjCjy
         IHHTnU2omhlkGWL+D7OUbGwRYWfW8pLmq7I+oIy9oVR5nb3ZmrLNjXlj50UU2IUq1v6s
         ixjNPpX2JKrnIr/y9WoiUrj0hcJZBBQOyYq+Q30jHxO4kro+wYdgPdexmVsoMraRsENz
         cSyeZmnX4JTPpM4c+GMo5wf0x6pFLiRK4ZLme7F4/wJXLiTMGuQz0kHCcMipYzTDitfc
         xAHx9yMXOn5kqcUrD4UUX9wCVzKvx3xPLgcrGYgzHHRZTfIUShPCWvhjZYk7lmqZ0QV/
         yPuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IRkAR9npwL2qH2r0mrQr4FMI+Hw9irEnNyz8yKjdRDesj7SI5JADfj1q3AmW5Mm7HXbI8jUCl4tFG@vger.kernel.org
X-Gm-Message-State: AOJu0YxZFHsl+NhALFU6WufbpTBgUizCh3seD5l9TxO//v9CVD7Ucpns
	cmpGCpdIKFRyuR4OXJsDf4Ehvqrlsmyu3W9NJGR0ziIXScfIYSAev8JS7AI3STaFN04r2+yWMWt
	o3tiLmdGipJugJkcjLvlqdj6mbRPzXGB0VZ0WopI+t4FJXB9bS0xgy+vgob07LrZh
X-Gm-Gg: Acq92OGFEnAlpwjkItXxn05/Rr7KGHjAE8bbzCLuGm5W/XRTKp98ric7L8rUr0MeFIP
	gf+t0u46pVW0HpsggBUvB184qqJj3SpWUq/oPle2AsgD6DE28TRL6qyLYpkrzP+I7uZTD2+/mL5
	O7JjpAWQM2OgGOgnHeIZBZgl+IJHQWduaKVuzTwIkpAIioaRa/kSKdgntaNUjB2sxu5rC47HAwT
	11ZHoe7bagdssjKYCNau9R2Obs56ySWmXoJTaqHfQdlwLLIvfTx/V8pZgKq6JWl/zzMiqluywXH
	STf2Xx9mWS9RVceaLw4lJQnGx7w0gEXYv8qMHre3cDkbe5e6hwPaDQvprfbzn465vFrJbox0nV2
	iCSxFJNL0GuXsFrilUpCrw7ubt4j0klCyshaX
X-Received: by 2002:a17:903:2f4e:b0:2ba:3226:21ae with SMTP id d9443c01a7336-2ba78b4bc4dmr85384355ad.11.1778181733523;
        Thu, 07 May 2026 12:22:13 -0700 (PDT)
X-Received: by 2002:a17:903:2f4e:b0:2ba:3226:21ae with SMTP id d9443c01a7336-2ba78b4bc4dmr85383965ad.11.1778181733054;
        Thu, 07 May 2026 12:22:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7874767sm6012535ad.72.2026.05.07.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 12:22:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add support for Qualcomm Shikra SoC
Date: Fri, 08 May 2026 00:51:59 +0530
Message-Id: <20260508-shikra-pinctrl-v3-0-771144cdc411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfm/GkC/3XPzU7DMAwH8FepciZTvtqkPfEeiIOTODRia7ekq
 0BT352kA+0AXCz9Lfln+0YypoiZDM2NJFxjjvNUgnxqiBthekMafclEMNExJXqax/iegJ7j5JZ
 0pMFrDrZD57tAytA5YYgfO/jyes8JL9fiLvfmgx2ab9T8oHl20VMQGlAaZzXKYeVVtZCRuvl0i
 ku5rddMBcaCVhosSK4K0RvNbBu8ASckgx4gkLp/jHmZ0+f+X7HqAf+9snLKKLfKWmElGN89zzk
 fLlc41s2HUnZxFQ+lZeqXIqqisPfOCd+Z9g9l27YvII4mLHkBAAA=
X-Change-ID: 20260429-shikra-pinctrl-fd71ab6ecd6f
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778181728; l=1586;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=sfxMae/EqwgCxufleqKr9y+7CQrnZNWHdz9EphTRWQs=;
 b=o+rLLk4VN/wH11UBFlsCwvFbFJynB+0etHRRQ2/+yLhy2u+hfzUOwnWEwEWT2woQ09jJ15Uqs
 ipU/0Pkh3x3Bq+ZoQYf3FZy3HQWhbIstwo0xQgXMWXjjKReSIVDldTX
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: M5NMtQXQcjuz5QHwZfHyoxJvwyfZBOUh
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fce666 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F7K3iWs-JhacpI5SHW8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: M5NMtQXQcjuz5QHwZfHyoxJvwyfZBOUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE5NSBTYWx0ZWRfX/97Pta/C66Ig
 flY+si0458I4O5WyaImL+qIvU5QReGhZfQJyS2Y3Qiz/rk1JTXzxTx+iUmlCvH77ffy+vuI4AZx
 ZnSLKKeTJgpxnMrVkJaTzUr1O9yNOcCZSjcaV53owPXh6mLRF548lhpTncx8HSCMCTU0lfsDL2t
 bK/fEimcAtaG/Z1MeV41orEaSEhsv2NeDIy9wQWpjHfEI6Lyeg4sTBTBCMClNkLGi9np0ynTAkV
 hJP7cEZTusZ96IXbNw24LH6FwuBwI2NTtc4WqNhm0Fm6uGDINxmUUWru37s/PfCmMOXHVHyyLmW
 fcNmA1ygAk+soh8d2AfPQq7UZYmszEWPw2sCVknPVZJTIbQjeHhue4gxAbJ+9kVu2epGW1NEZkK
 ECnJ11B6K4dbZV9NJn9L7kwrD7l3vIVmnrAipMGBEy7q+qTtvIKEPs78DOSoj0hTasVDwIYTNrd
 2Dk0Cn+YHULaZ1PBZ9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070195

Add the pinctrl driver, document the bindings and enable the
driver in defconfig as default.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Changes in v3:
- Move MODULE_DEVICE_TABLE(of, shikra_tlmm_of_match) immediately after
  the of_device_id table definition (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260504-shikra-pinctrl-v2-0-14e9dcc2d685@oss.qualcomm.com

Changes in v2:
- Fix Kconfig description to drop "Technologies Inc" (Linus Walleij)
- Remove unused UFS_RESET macro (Maulik Shah)
- Add spaces inside braces in shikra_mpm_map (Maulik Shah)
- Fix gpio-line-names maxItems: 165 -> 166 (Krzysztof Kozlowski)
- Link to v1: https://lore.kernel.org/r/20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com

---
Komal Bajaj (2):
      dt-bindings: pinctrl: qcom: Document Shikra Top Level Mode Multiplexer
      pinctrl: qcom: Add Shikra pinctrl driver

 .../bindings/pinctrl/qcom,shikra-tlmm.yaml         |  123 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   11 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-shikra.c              | 1256 ++++++++++++++++++++
 4 files changed, 1391 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260429-shikra-pinctrl-fd71ab6ecd6f
prerequisite-change-id: 20260428-shikra-socid-a27ae38cb7e3:v1
prerequisite-patch-id: 843f28095c0d42d0d60ab7000095c64dcb2e90ca
prerequisite-patch-id: 1069d6880c3ff91c230c20fcd876738001c6d35d

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

