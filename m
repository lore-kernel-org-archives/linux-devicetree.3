Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203F33624A5
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 08:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942960; cv=none; b=A9QaHbw9giLhZ5AqQbR5tU5ks2lOtwswvZ+0qtjwz0nuaMIZtRTBvOzAEKlwMcVwc86jtldHmZcAzuflNJ1wKl7t2ojpGqUoXvgpJN8u9L9YBw0X58emOeOA7U+V9pBDjDRvmjfQP7iQX021FygVskdmiuQIk3+Ol1MG/gnQhMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942960; c=relaxed/simple;
	bh=1BqYn6OMh00OspukpS8Q4EMSIUJwkqh9VjEiSiEgzaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R2mcDHP0PHIjChAj3L1GKXstnaEImKpH3i4Xl2vRR9j3+zU1yIFKfbl3VTkLrhoqouvlC3j596B004oIhvmAjWWQFBUj5mX5SuA8ajgAxOcKDCZHxyVxdDzBssUXCFaxFYaqlHE1lzCkNn1OcXOOj09GuJFDeFv1ua2b+DxpGUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USw9ZSNg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlTJdt6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USw9ZSNg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlTJdt6h"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896eSD4337420
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 08:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ti78JQSRIf+wIe8eg3OIDH
	U4rgINQqcZvXwZZBlGjGI=; b=USw9ZSNghZpgJdh7/ILgC3Qf8ZJL9/NsiDKcPg
	Y5dm4E2pZpvVENr/B8LnqWuyrLj5j7zkI09KZDJOMl4QKFxzx0FbwrjZQGPwrqLX
	iivwDsu7153owb5LIvJq4FNogFiXYquFHrA1/FfTgeGa0M631xU0hKsH/N7t6Ips
	LkvCVL8lqYFytkUi004uhKRs7K4gq9G7HTIDTqiN/ZGF5aU1pjqV3oy+BEvHEkvJ
	Es+lyd95oBWFOXs1YcnS0oSu52GsD/6N57cGqr5psyqx4oKDK3cFOI9xVr0Dsikp
	XPsd18g2rZ1jKeUTjeHtfJm6pCzieh4jIjw834S8oh5ZcSKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7jyuj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 08:35:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f946461so1004100285a.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788942957; x=1789547757; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ti78JQSRIf+wIe8eg3OIDHU4rgINQqcZvXwZZBlGjGI=;
        b=FlTJdt6hVlGWY3KkwQOyBGt4iTIeQvPUkijlBeLjUjHNyXpdU1cnPYypXVx4tMTEEz
         YWaQLnvi+mWgOLQJCO4uKTW/LCYnMyqbqO5A4380orZnwO1gertrPw2cBivwEkbT9MYc
         HsqWeRg9IPj2A6/olR4Wt9KQ2lvw5cYZVadObzDUAp17mk5lPOtOSdDsTHuj57zM7Bnc
         /bLTsgjdYvnFrQzAxJYDT+wuzxP9c1g2j2wDFjM9zaq+dy4yOXgNESJieZHgdYYXB2GN
         dpK1nlvgsOzAAevl7ot5ASGjFr/ohWH/TWJv6O0JsmmjH5dmbZqNdlISWRkdDUnGDXT0
         HWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942957; x=1789547757;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ti78JQSRIf+wIe8eg3OIDHU4rgINQqcZvXwZZBlGjGI=;
        b=DOIeVRhFHUzK+pSLYSWCuCt5eCL/GPoHJRCsc9iuqVC3iPNXPqYOlGLWE0YdkS2J0g
         iEsP7gCtd02CChuoyz1dYdTbbwreGYTajJr2Pm3f+GKhMeo9yG8jPvXZO8MHqrZXF0/C
         /tM3AMO9JWlzsMoiIKl6xWvcOYLZwOJ+rVpm49vEh1s47D9fD/pWP+PvEbfWRyhQBAko
         PxuAt80Qkx5gBFRoTy0bh7Y7tj7GyqDkSQeY1ODj5ZkV4RbJ18xzYnyNbUw8Okep2KV3
         IsWFv8BMheSZ18JuQlMjJ3+sduYpWtGqUY6hfKZNJcwXM+UxbrhBxKVuC54zm8glOoLO
         webw==
X-Gm-Message-State: AFuF++l8K2Kacrz1hUFjjiqDuBdPmG/so/6k9N4l+gCyfDNjqBB9nD4m
	k4DlGtwskiPVOm/4huvHl4fmbMN610uDRkChZVBzS5E0jQpE+VuW4AmxL1h0ZTbUHousUlBvlsd
	ReH38RwO82QTW9BsYdYXrvuBVQJdIMJnCUVfMGymmEc6b3jiMwC8xDeFVssA7l5xO
X-Gm-Gg: AYBFou36KTvqwswdlDEwaH+63ZyJcE2vJhhQs20pzaArK5JoNoP8O+OlMYTz09w3ZV4
	D52WtnP+wcY2wB5sDIWMztYhhPZ3Oy5ihkqgIi3xexc6ask5T1CVz3LSmOmdeveL/ZIQSu74Zv7
	ECF1eRhFh4nH/3F5SfnrI6zAQJv7GLGW1aJRo7KRy9LvxfD+kOKxR3RelX0pa6brzdjQbvlel78
	VuHT1YTjeNDfmz5IOszMqWcDg+sZgJkbek9YO4cBADGavN97jIesskUnJ//DV0pVLJwkr/VVU/Z
	isYwoMZFu2VBcL1MstSZEUJckwHx2uqqBfufdHFAGP6foWfu7L+L7U6Oz80QJVmJeMvJMOkaKcX
	ub/qqUQGarCAAVOnYgVxuieA=
X-Received: by 2002:a05:620a:1a23:b0:939:1b82:47c4 with SMTP id af79cd13be357-939c94ef4b4mr533555485a.37.1788942957402;
        Wed, 09 Sep 2026 01:35:57 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:1b82:47c4 with SMTP id af79cd13be357-939c94ef4b4mr533554185a.37.1788942956963;
        Wed, 09 Sep 2026 01:35:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm43210269f8f.34.2026.09.09.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:35:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/6] dtc: dt-check-style: Improvements for handling
 continued lines
Date: Wed, 09 Sep 2026 10:35:43 +0200
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBAAv1L27EIIGhq/Ih6azWpXS6rZtCilf
 zdqjwPDzALKWVjh2CyQeRaVMVWwuwao79KVUWJlsMY6443HsMdYFLW8B0bqme6ckcZUJE0ccZD
 EiuRafwgdhdYZqKlH5ou8fpvT+c86hRtT+bY3I/Nzqv+yaev6AXlUq1WdAAAA
X-Change-ID: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2014;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1BqYn6OMh00OspukpS8Q4EMSIUJwkqh9VjEiSiEgzaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoRpiPJ/klZkfTxYLcLq+NGTa4Gk3RMNu+lo01
 e2iudh6dxiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqEaYgAKCRDBN2bmhouD
 1weZD/0VZU+U+IA9Ywxz9N5rlDbpe1VP6Gb1/5FTEM1MGSQwQpE8RswgPkyOAFJP7QBhFcgeQVT
 58QlZ2iIXbTrMRBDODbCb36ia+DVaHB97WZl6kMVD5siFuLnHY89zHnbamvFd70qNDX497bG65J
 2UrKzbHEFnd/mJFiGH13dPzvauuaD6q9Zmfmy/VzZjURxtgt6QeQ4zm2s0QXe+gL8Ye5xoyVa/2
 9HRMUaIRqjAb47VR2JaVg2ydarUz8uG3GHtxvDL/yPiI8SSQGYZplWNWWeTybQQfCcjMYNp5K8v
 SAgVLtltLF6TevVa8RI7suzsJvBrn0eVVlv4f1hVhm+FTOvQtPKc8QdP/QpZpBPsqsSFzroravO
 O33fyKj/RSiSWLdWCD2sA6CVCfcOT6fjJ8fvE5un1I6YNU2CdpJVRk7XH6M6EK2p+Fov3Q6B00A
 9CRHyPO9dVjdT2n1KA6HYlg7vwDktrrAbmXrhDNkNs7U63GcPjdIqMAWdXTfoSpgZGwse5G0fyW
 E5MYO0ls+13OVHREHrQJKDbfwAGkyIK3xHUljikCJhiUg7N01MkuBCJQdq2dsGqh60+vQHPuuPh
 mNqAebABuQd1N9K0EfOYQfpCRhJHMLioskHJejLo4FHdR5oPDzP6Y1TUnP9CUJexPXIDD+UZEsL
 YaCO9tRlJQ8T7JA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfX+kr33VsKUHMA
 7eRkkMblyCUpGvSYL8wFGw/W0mn14jVM++V1hGgiGuUUaUrt3SvQ0FA1/f4FP4DQAjqs75XCEvW
 1kplRcuTunXNJ7QUkMOIO7uNSXJddg8=
X-Proofpoint-ORIG-GUID: lnZ0qelTKkKNYnQAdFXVJwbAviCE_LMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA5NCBTYWx0ZWRfXz+we/B7tZrGS
 /JSXabVWhxXyzIuWAWTzZzlHkdDO4SnobdciLv+i6JCOCXLn8lCgNuQL7kMdphoJ7++QkKgemJL
 5c6rgqRBh9OivPjcxhlAey7QkPFWhoyTh6iHe2Nl0YWQlpQ442KxmE43N5lDpGUYeuK0WAoHePw
 QWGUJPcDOTD52nmb1bsXSrkFLMDYvG7luNBdCvDTFole5uM2rjZYANcwjZoiqm8tqP1yfceGLwL
 /G4dQGgqZMU4477K8hJeNZOPSWTpSYH1wR49qrCshmBLlQ4gkDoI7bGTx7IisEHJMoGtF0WY2Zj
 r7Ch+5uCqgNK8ADBbi4TPLHy3fyC30qfEKepC1YxO9E7NqunrnSpWy1FjXLuI5le5bi8QFqvsz2
 zfunEaenv77aAWE2lZEcoUGoXH4KOtVLYcymZNOB+hZ5lUeT61Lf5RRCIAQ86clkJQi6afQXOek
 1ZjkI/I7wJezS27LFIA==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa11a6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MhBdVnhVILdta-0WuR8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: lnZ0qelTKkKNYnQAdFXVJwbAviCE_LMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090094

Changes in v2:
1. Four new commits 1-4
2. Drop last commit
v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      dtc: dt-check-style: Handle continued lines in check_hex_case()
      dtc: dt-check-style: Handle continued lines in check_line_length()
      dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
      dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
      dtc: dt-check-style: Right strip whitespaces, leftovers before comments
      dtc: dt-check-style: Properly detect comments in multi-line properties

 scripts/dtc/dt-check-style                         | 103 ++++++++++++---------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |   1 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |   3 +-
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 ++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   1 +
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   5 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   3 +-
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   5 +-
 .../expected/dts-cont-align.dts.txt                |  11 ++-
 .../expected/dts-line-length.dts.txt               |   1 +
 .../expected/dts-trailing-ws.dts.txt               |   1 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-hex-case.yaml.txt                |   2 +
 .../expected/yaml-line-length.yaml.txt             |   1 +
 .../expected/yaml-trailing-ws.yaml.txt             |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |   1 +
 .../dt-style-selftest/good/yaml-cont-align.yaml    |   1 +
 17 files changed, 99 insertions(+), 53 deletions(-)
---
base-commit: 694b801ceb1bea205878f2136e8b25c888e51be7
change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

