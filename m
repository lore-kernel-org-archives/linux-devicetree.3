Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3B64A8D
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784261934; cv=none; b=ddBBANSiiTQ/zx/EWC1DY0xb3GgprtO/buZMKyaUTAn7lRXo8NXMXvyQSjkM2kkRSrXQu9c1YDfnDc8oC7MpAEQWi6G7jKlqkk5TVdAjr38Z5mD7oAPWtprzeI8B+3hvtu5gtUWp9Wy55hveDrMGcCXi0zEfbBxDd/twy0M9gKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784261934; c=relaxed/simple;
	bh=HZGdkVLQG6+J99WF0pBVfpjr0uh8SIh+IiV935qtVb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oEnxq5dqPFINhZpJVdrKSKYs6Z7n8GFMnxUpgegtpe3RPCfjMcepz7QkUPd5MPI4pwqTacw9utRCOxDNQrQ+aPd1aYad3/YfhNAD/NyYhQ86Z0NtOIjhb14YLGMAtHwA7lPGIepA0az+AYVOb9GjFo+Fld4JYmHRHcxA+01qKYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCr4Oilg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amjXCCyQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCr4Oilg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amjXCCyQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33jS5337992
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lllxiimRu2enY7Xqiw8bqS
	rMIWPbHX5sQ+dmDsTfUgE=; b=jCr4OilglKVqT7/dUqyRncIrKYA7o01WpOz6Ck
	rnf/3zxonUAfy91I4nL3xP7RFgZokyJVmd8esN82LA+yMHBL4YllU+AEXMQYN2vP
	y/U50GJgUXp24Rmr8TEQOckTXgibepjCfXfo0byTi5+sPFwohtFjok0s3JtKj1nn
	5CRBccWMkkgQhPdxVr5JpvtOvk/DTsR3918Kcco55NE5Jmsq+VFX+19biVo3YUkQ
	uU/J5dIOtSa79KJkaEY+kvLuTMxfabovZXXlcZ3/e3BGKym5gbbvAJgAu4ozlxga
	Wh9VpSe9IHDhnkJV/rju/b9sNThUx9Wvabc5v7Azsd0S4P4g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weahfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:18:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so57022525ad.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784261932; x=1784866732; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lllxiimRu2enY7Xqiw8bqSrMIWPbHX5sQ+dmDsTfUgE=;
        b=amjXCCyQEtxmpK/1oWSfKeqYJbuMMHrCnJY1qoQY0gXv2YQwhkWr3RL/tQK1H4NZeQ
         KHjKjrhd20jgNh8AiQ0O/+5Bfn/G2Q4zJj25zO01IRT4S4WzU47UcNKacu2sBQQEH1VD
         i5e2vIkGKLuF/ViP+ImE7pQ4XbejJf8vZfNL/SJmQNEJVraGF6AziDW8yiMkfC/o9hUV
         n2GpCgynqLnDbQJuBFgkwvGaSy62xkGuA3jMu8835CzbyPAaQB6QtodPmgRgmtVBlWmx
         2WwFLh5X/gi8gwxOcsaAekTAPC509u9oBaki9NnMyFgDmLQBtqPCbdzoS/EUMUWm+shC
         Pntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784261932; x=1784866732;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lllxiimRu2enY7Xqiw8bqSrMIWPbHX5sQ+dmDsTfUgE=;
        b=NyF/FJ0m9Rr2UNKt7XmPCZD1ZDuCVxZNK2Pv5oh9EtHaWx7w4EoWP6emLVJfUVZ8X4
         mD53elpmeeWKGUSQgDperIfQ6k9FQZdJplEE7bTutw0J5QpULj+UvtbtdXg+y1vnYKoW
         9r/OXdWlzVDWAdnEbVcA1+7aL3m8Wefg2OaOvUsDicE7lCwMqlWm35IQyjQVc70EUPSG
         7Uw5HoXTgYQ6LbNhLWR+/0tow+lxUhN04AG8eTGyycj5+GXI1is000Mga6CSuSbQdtwv
         7mBx7M24py3w70/jEgQ40KWtHC66VdtFIED4W5poJEs85HXj7Ild0+eijRId6glXbB8F
         1OwA==
X-Forwarded-Encrypted: i=1; AHgh+RrzrXiC+OuZ7rWjg3yLAbdywTJ82IOfPvegfrAp5pdjAN+exFnqEJQmdoNKxslLUJZKCHwYpdgl5nQx@vger.kernel.org
X-Gm-Message-State: AOJu0YyjldoxQz5SHO5Lc8oCM/ki4ygnctChiSTBJcX9Lf2iJ+sNNxBW
	NlSOerw8Tmdr4a9T6g0vnO+UhEJHxiZl7mh34XP1nBp48H96UWwh8P75bX5C7vZtdWUuIrWKrnH
	0ez4JWAeHJu5FwrQHI/snOJGPPFwjVFGyPkgHNu9MD6dqPj1XWjrknXtLZ4uncr4Z
X-Gm-Gg: AfdE7cl2OJs7o11ndYsjrpJA+lq0QooKXOl6N5RKTj0hTiw7xkDG4eMe6qONldUAJdq
	vMhrspi9sFTDByg5cmXNyJh3ZpTVLa94p//uFxwVWTETJT0B5WOkXXQrKuleOp8DikG6GPucu1q
	tHhtMjTeUyKl54314S9dgd0at6YLBoQZ4Q5XHEvoZWU1/qcqzbgTWlrFsCEMN9HlQ8b1V6uNAw0
	g8AMdBtOp0W1S4keADgYF0MQGco1k6iq2/uuqXXce2C+Esf4t83LKbAFATZccnp76csU7liC+ZR
	fcGPmQ5PW+YBwqG321J52ILGKLr3Slo1LnzWW64OijMyL+r6MU6+lVPpKcsr0CiA1ZYj5eNAJJ4
	aYSFwsjJO9cFMo3kPLgLCuGdc2r9TApU=
X-Received: by 2002:a17:902:d581:b0:2ce:d34a:5963 with SMTP id d9443c01a7336-2cf3496c380mr9809865ad.24.1784261932053;
        Thu, 16 Jul 2026 21:18:52 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2ce:d34a:5963 with SMTP id d9443c01a7336-2cf3496c380mr9809515ad.24.1784261931528;
        Thu, 16 Jul 2026 21:18:51 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm875300c88.13.2026.07.16.21.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:18:51 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/2] clk: qcom: Add video clock controller support for
 Qualcomm Maili SoC
Date: Fri, 17 Jul 2026 09:44:43 +0530
Message-Id: <20260717-maili_videocc-v3-0-6656694b06a7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSsWWoC/3XP32qDMBQG8FeRXC/lJGqiXu09xij5c7IepmY1V
 lqK775oGYWx3QS+HPLLd+4s4USYWFfc2YQLJYpjDuVLwdzJjB/IyefMJEgFGjQfDPV0XMhjdI5
 7C14htpWzmuU3XxMGuu7e2/sjT3i+ZHZ+XD7VrthNJX5MGmkm0x9dH90ndxqlreoSfAPdIjfcm
 oTcxWGguSuEEbrWVqtK6qAkCBsQbBAWTRvypAplKU1bsq3GidIcp9u+5SL2Hv8stAgOHAM0snG
 ZU/gaUzqcL6bfPj7kYwdzoSci1G9EZkSjr40VFWgNfyDrun4DUXj3iH0BAAA=
X-Change-ID: 20260707-maili_videocc-db0d6ee94cb7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzOCBTYWx0ZWRfX1bhfKB6L+okO
 S0Eg3sfLiJkbU/2x3TYHknOMUSsG4td385vWfiuP1VQHClgVhbnM1VLa5sc1hYU7d6PmETLmr1P
 vKToAA6ejNiCjSXDFx+QmPL9KwFJ8HytRTyJ54npIJLTE+tPEXjH1cHJijMQ+dsSHjoEsVHKPM9
 1QzUC7Hq3ZrntCEQpkpgne4CHQe9CXY0jiOLRa/KP8xoXz5/Yo1qDLexH65LEw4vWwZt1F5DbAm
 N8zontyAWTWLlJqs7WuDZU28Fl9x0biFc5oljkBfoCt42eEWsyyhhaaF/C7xeWNrfbLDYfiEd2b
 VqPk9RXB47lHsA+fwedUhBMivSwk/RQhS73yfTVhzdyVdEGPV9aPBguidsV3sDUcCtJ7VErBSC3
 MIni7BvJddgZ5aLlrDR44l+WKm8oMF691AnEKa+yziOvkCoTAou8GAzM2iVKTVeJxFVi7wSL/fO
 L0Hp56YmlSmFaZZT0LQ==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a59ad2c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OJRIEmj8yRpEH6x5DyoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzOCBTYWx0ZWRfXxA5tsdmEQvvZ
 YEYLkzyfWmrqSdi/VlBdc4SneHlOXBc8ASBr876bEH5FMyoKQNzbLmYsIhKidSWDaqrlV9ngbz9
 pP5koiz2l63CXkm6CeRyzMclXVM12vk=
X-Proofpoint-ORIG-GUID: FOrfXUcrq2h69StAR_mv3QhuHcK9jBn4
X-Proofpoint-GUID: FOrfXUcrq2h69StAR_mv3QhuHcK9jBn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170038

This series adds support for the video clock controller (videocc)
required by the upcoming Qualcomm Maili SoC.

This series is dependent on Maili GCC clock series:
https://lore.kernel.org/all/20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Fixed the spaces indendation for VIDEO_CC_MVS0C_FREERUN_CLK_ARES
  in maili videocc header file [Sashiko AI review].
- Used GENMASK to define .mem_enable_ack_mask field in videocc maili
  driver 
- Link to v2: https://lore.kernel.org/r/20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com

Changes in v2:
- Rebased on latest linux-next
- Dropped the explicit compatible check for required-opps in bindings,
  as it is already handled by default in the latest linux-next. [Krzysztof]
- Added R-By tag received on v1
- Link to v1: https://lore.kernel.org/r/20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Qualcomm Maili video clock controller
      clk: qcom: Add support for videocc driver on Qualcomm Maili SoC

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   2 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/videocc-maili.c                   | 660 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,maili-videocc.h     |  50 ++
 5 files changed, 723 insertions(+)
---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260707-maili_videocc-db0d6ee94cb7
prerequisite-change-id: 20260617-maili_initial_clock-c7e2b4530d80:v2
prerequisite-patch-id: cb2499a822715bf6d411ea000e525e5feab52e7f
prerequisite-patch-id: 4280283ee9f782a5ba46e4419ab0b7186add0211
prerequisite-patch-id: 3e9a75794efb1633818ffe387d1f4e5048c361a4
prerequisite-patch-id: 9a218f161a75924b8cc3fbae44007d0da7739d60
prerequisite-patch-id: 7e5ac7db1fba3258b45b689b11d0ca93d65aa38a

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

