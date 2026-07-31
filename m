Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E95423A79
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785525188; cv=none; b=pCw5F/41hgFpWJWB4qnnD3zn1Pi2IRccKeyJ9GL4sNUdbST02Ar0xIKdcju7Wn/MM+S60x62LjDbgGsAIfe9fOiTY1AWYhXWCNqhJu4s5cTFgOm5WzpP+i44BWnzMYu1uv4QFNG5QGcCmxB72IX+pWSVZ5/BpeEydQ2BWvZIU64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785525188; c=relaxed/simple;
	bh=0MZXCk9Or2W6XUtdnV3HuSSPaPcBeFaxX8xav+hbf2s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KRqceinf2C1ANjREOFhxFiW8tgax8hqO1gG4OLuoLCo9a4udVOLWUBnTgtDgek2NOOhUgdIQ9mjRLpUa0plDJPCxsg30mY+GqhR5DCYeFCeMFHBspH5reu+yIswmlOwOK02yFl+WoM0kW/ZHvSopbYw6x9gsoTC/Stq+rpvnMVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkM2Ki/G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJhxuLkv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkM2Ki/G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJhxuLkv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIdDO9653143
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZyTKYo4/TkZHCntwq2DFPP
	2ilSH/oFPewoUWzE90tIs=; b=RkM2Ki/G4BrXvSjW/cuYC5uKRUzYS4RuABgMeZ
	Vv6NeJ88a1T2talxHackq1LhMjofDFQHDccqC4Ru4EYa7vk24QeDa4J36iQV0vvH
	InkRs3IYCSdIYsnG71xFlctaZq1qNPBIi03KB+uHMLy9p4D11GzPEnwu9jcOUcY9
	fhFGAweXDH7dg+jGvIk3g/B/Q4MOxtULTcYakR7uhUvOV78l2BirL4zl061KZS0b
	CXzS4HPcW65IvJv38Tgf9/r33K0m4wGnJER3Usrh/gv+vLA7KmZDHCd4lxi1na7m
	/YT6kF+ZtuB8P0IiF013vmOEK3zktLPMMd/JnDK+lmuXlFrw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru5dj3st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:13:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1526255a12.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785525184; x=1786129984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZyTKYo4/TkZHCntwq2DFPP2ilSH/oFPewoUWzE90tIs=;
        b=eJhxuLkvu8bwfKcHiH1n4FhceYFZaBb/zSjUOT8vTjRkpPGCWSJWj0XXxRHXAk5uLj
         WLKogzAIQ4rk01VcJGYFvGaR8J0rnz7Moq4tfSV6+wtpSzV9jnlFn7x63khc9GIsxs/4
         zOJprViND6EoqPtzDcVw0003ZZ2Fim+nfGg4RbJKb7/p5pXP+l/8AqAtkMJxIlxtXWcs
         2VK/dxM7iueYE3G+4B9C4bwMLQaLOAQtNpmSbOp8i4eZtZamdm8Whn+6ZYJROuR1Ued9
         bbhpltakX2QtboalMGD1826/tYXfo2zWLcQI4W9s2RFAHkZKAVNP/730pB4ROHOTz6pE
         1kRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785525184; x=1786129984;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZyTKYo4/TkZHCntwq2DFPP2ilSH/oFPewoUWzE90tIs=;
        b=s2EnwpuLoN0/3tQ78Pd1ZX9PtmHGYAyg6OWQawa/mmPmJJAQwfqi6pdBiuvwNXNFYA
         nyu7sntgpbFoGQZ3Ny/AKh9T6zi+IfflWhz1PEY5cuI/zTrwmAZypCd6xFN8JqeNVSvB
         wEjiNUhH5NCOQmr4uCYlSiw/oG5njdHv5KD0oqrmtrHFRwIxBQ+p4sak9aE3bdIM7n9u
         ORwTUJ74QJj5A0KcBOYcMPu9vRLY5JbGHz5D2h3hS5AA4f+Ew/gk6aj4pMVe7q/AQQh7
         1IbYKf/XaleqhVtpu4qYPNwMqIdCxfROO4PbCMwh0rjW1m2yVrnN9oLYGyFDPmQPKJCg
         rGEg==
X-Forwarded-Encrypted: i=1; AHgh+Rqfl9x9dqnQRLgZIcqBr/SgJGTVs1SzXkodoMS/4emIS409x8W/g9crxeeP+mpkxVTRZiN8I2CPiDuW@vger.kernel.org
X-Gm-Message-State: AOJu0YxWyNg3eX2il2HnrudNd/Rf/wUyKKQiYU7of1wzK30ySCGjBkrb
	ye2CdZqjvIm7h1TZEUR44zLiT8gQbCDu4YcC3N+eX31dkWEIZUxxjrn1apDhvesIL9BAXUnhHlo
	RZ4yXJpKxAO6AXqeni0EjsfXMKJ0T6a/DpWezi3YnAYXCM29ziWwGuavS1mmeJdk+
X-Gm-Gg: AR+sD13QClr7F6L2vtTPXWINBVekbMNBPJqAnIJzHoDisoGVJmWZS4fG2GBF2qzidax
	X9EG0MfsxDeJRMpM5pVcKYG+R22Oy762OZ1m51Q99rrDQ7WCsoFphpJX1bQtBMOHFDkjrOsPVkZ
	TR4vWi4v68OD40oxr7h9alIoL35H45PnPvbU/YBdvrBV4EaVRWPvxu9gc/tK65DN21erDxMFUfJ
	2srb58rGXMc2jiRXeW4IH6nI5SuTploqaKqZxrfmNDh0Djuc5+tBox6lzwOVD9/t9rChxU2FbGH
	u635H6FlSHL5OaF/3BjpjzWLFHfDzfcTh7KUTuNF3PHWr3PtRpkv7XaGysDEN9v+2RYgx+ZXc6b
	nwaNHv9leslqTUf7dh7k5iNCJDqVwSVw=
X-Received: by 2002:a05:6a20:244d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c92a5a7a45mr970720637.13.1785525184158;
        Fri, 31 Jul 2026 12:13:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:244d:b0:3b3:26aa:5455 with SMTP id adf61e73a8af0-3c92a5a7a45mr970696637.13.1785525183717;
        Fri, 31 Jul 2026 12:13:03 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4d10bbsm4945869c88.11.2026.07.31.12.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:13:03 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add Graphics clock controllers support for
 Qualcomm Maili SoC
Date: Sat, 01 Aug 2026 00:42:44 +0530
Message-Id: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK3zbGoC/0XMywqDMBCF4VeRrBtIjBmjr1Kk5DLqQLU2XloQ3
 71pXXT5HzjfzmaMhDOrs51F3Gimx5hCXjLmezt2yCmkZrnIQZRK8sHSnW7dtHrPnSq0E0JUwQJ
 LjyliS++fdm3OjvhcE7qc49+ss1MUmp9Wb1/EjVcapTIAra+3/Gs6OyP3j2Ggpc4KqUGALR1Wq
 jJKB1c5EcCVUhpT6vQrQBUQWHMcH7O3DeDbAAAA
X-Change-ID: 20260731-maili_gpucc-b345b0009da6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: _W5Sx_5tDpn_49Hyy4gjQpCRgg3aB4_4
X-Proofpoint-GUID: _W5Sx_5tDpn_49Hyy4gjQpCRgg3aB4_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX5uLLNBVmUJ3b
 cfZNMfNGiPYHF2GQ/yQ+TqTG/JEqt6RpKxZZQ//nswvW7cAuXt1OggitxQK2wPD6Z3fyw6U4qVI
 BlpbLG9+G3KaQ1Tq54Ztsu7pr2QtHRjMgCsLt4QLK4Ix5MlDZRM63BxqLSA/Xxqx7S2IzoXkSNS
 5FTrDS95srbGNWzBps7WYPPEzONQKe8NbZSJ3+/4rP0FzX8Cn3MzvpE5kQ1rKWWG7WE+owFumDI
 fwUCQpzjeiMok8/+MkMTb7Y+pfnXXFKtL1HhrHmjDf2YZkB3FNoBtRRehXsVitQXqFtNCn9ZPTH
 WkGo1JpeQFvO5Zb5J5ohFwZO07u8S+h9j2j9iRBz4PQAySlOD+AIkbgGSAeUVxnPKoNmOUxMyUo
 uJ2D/8BnJxC++zcHpVULylWJOUQJkfY4XMdEL/TgRCFfOA4QVO5iecXE66Xz1lQL3cq824Kh/RM
 lcmJVAVjLjyQGEcSUDA==
X-Authority-Analysis: v=2.4 cv=SKZykuvH c=1 sm=1 tr=0 ts=6a6cf3c1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=woJ0iYCGE5GGs-2wN-4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NiBTYWx0ZWRfX7I4kWrA3PMID
 e69tLHq61CWe1AGKVEBJ3tRrutSK7iJeoBFq2P9tlS2WKq4FQqlhp3Vh57xU+7VwQ3L07YNexiB
 /ULm2L3hrQlstr1agNTwQpTRhagO8MA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310146

This series adds support for the Graphics clock controllers on the
upcoming Qualcomm Maili SoC.

This series is dependent on Hawi GPUCC series:
https://lore.kernel.org/all/20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili Graphics Clock Controllers
      clk: qcom: Add Graphics clock controller support on Qualcomm Maili SoC

 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml       |  4 +++-
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml          |  1 +
 drivers/clk/qcom/gpucc-hawi.c                            | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260731-maili_gpucc-b345b0009da6
prerequisite-change-id: 20260705-gpucc-hawi-8c35e13866fc:v2
prerequisite-patch-id: c4ba97aad79f4fa03b5293eaba330faa54d29a6d
prerequisite-patch-id: 1a86f63e48eadde749f0a32fd284c8a307eac4a5

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

