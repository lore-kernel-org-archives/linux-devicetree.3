Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90463A7837
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731553; cv=none; b=YOvJVxGTii2JMDjFnpPCevSkEAhbW2QWqjKIo81287nlhi3J52A6X+9EEBoKynCkg0nFyH6nRi4bmiov8ff+X1eIs0GLzLCdDNAeiY81K2/Xj8r/3FTe7BR+GajoicuNyuY2mj8iZQgHw/Slq/mR5CxfWv+S8lupSJda/bBeV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731553; c=relaxed/simple;
	bh=FczBl8Dp96okkQR5uiS2LNaEbPfmw+OCsCMeVvN75gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfZT3+vCNjtlOPIuHU5XXfODhRZdN5uok1/Qmtucheb4t/Rlmda1XZAcCR6VxTgDnC5wl4Wj4H7iEhsKYBHfd1LZrBStMvFTzsYOc7VrFXluBLHmsR32RPBrGTfD/JcA77J0uR3tZPcqN9GFZLYcCiKF9t0paxKgKX2txrW4Jts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOml1QBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3Fbphcz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOml1QBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3Fbphcz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0tlxH1623002
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqnaTjaYVHAwtUHVuBLnLZisAwPC7Eb1K3VBf8l9gUU=; b=DOml1QBshBsf1Z72
	ZKNIqmgm8VEo9vb60/iU1DQ7ra2Vqq86C6tOUyF9XK68NQRtZx/uIR7bCX+MgBYn
	O0p2gn259SZ2pI4lT3MRLS42kga6J//+YQzO45MdoX1pYRGaQzpI6oausI+EB00O
	wZTk0xP7kYpG9KUTJkgxF3FOq2wtgcMDeZCcEDjTCUcvTUQozmPmfbx0gLaxqVA5
	pRC4uyJNYydtR0KmjCz/q7h54zGfe7Kqg1QIp1nzSOsUX8gUXVdppc6dZsTbgPzG
	mi6v1AEqhpf0C+pcShTRCBNCPpK8xN3AXCxu0xoKm+MJnBoun7ez3FIDEr4uEFzd
	Tkgg2w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rg9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd15c00a1fso27775215ad.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731549; x=1779336349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqnaTjaYVHAwtUHVuBLnLZisAwPC7Eb1K3VBf8l9gUU=;
        b=G3FbphczafuZGoOWrFD+mGVBOVCHun93rHhVdUV4a6ga4puXnPgEWJZQNl3MxsPkSX
         fV9bniWDPu3IUsKupsY3b8Xqt2UCEoppjKT3F3s/jfV0GI6HfUe0JX8F+0VWOoII2WXg
         /8oJb5vmkFiKWdUDNr8DnD3XjWG7920tx0LIN4Gp06mcdQoSk6YdiJXDx0sB+8VM7aUX
         m9/r4bq1Yjzb+Khx2hsWgONUfmWLnTOgk8JnSMqFU/uAXwHICZrMdaIXPI5jUMQP2eIk
         Gj/8M7EqXiHAb5zq68MOMJwrJplSDZ5pyyFpew47a3T5m6ZgthbDgjQdgYe8h0Xctfoe
         qqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731549; x=1779336349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqnaTjaYVHAwtUHVuBLnLZisAwPC7Eb1K3VBf8l9gUU=;
        b=gER7RwSMQ5hUolF3Ux5szY2oseD/DWnog5HkGU+kB5czrgss2YL/nXSOAflpQKn4pZ
         w+CBrkevTfGav3+lJtIx7aGFiFYXpuHmDY9243apYTTtuHnwrS7vTFfIbL0EPovfwEGs
         68QQntbXNvqwjKFBAVzZ4pRXGpzxWKM5YbrPk8gCiyDbXrvi6bxhupXunjcxd0ZkqYvu
         nCBF/Kqy1TznmUGi2H/vYBFoqKYTIq5OtBy+XZB0RlmwPfd9jl9GU2WtQFkQuha/b+hI
         TwA5DYcyTtFDKrA+aw3zAXUPzyUAU4nPJeP/0ech9R4rNna5GdMD8yf+1mo5AScZHz6i
         KhNg==
X-Forwarded-Encrypted: i=1; AFNElJ/O9uPSHRJcuYTikUf9cOXELG15XAq3/II+wowRnkvL7jWOut0QSyT9+lkSJnlK/ZVsc8NDT2GWUBv3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7cX54/T+GegPWzuYY6VS3SwAv+XSau3n5D5ex3A/EkItm3tbd
	wTtN4uNtQIfD8C6u/ezemGq3VaYvSO+YfeFIqyB4zHi+Z5X7qXQH/3e9Q8qE+bBI3aaxjznH8CA
	XJ6BmRX+rY7FMqnZ4CONxG7Q2c4CR9+NQHNtetkHbVq4KbpBnyt8Bj+k9q4CidUV6
X-Gm-Gg: Acq92OG29rls3b3bjjKy4AjXR3Eg3EfCiiLh0NPEhwUZVjnnQzp5Einb6l4TzD9OyzR
	yIU4YPW97+ocfiysu6MXkBffTXdaH+DXgBhoaqyN+OUstFUt6AlJR4erWcCkjRWfiWfGwi5E5zA
	t9kialrSBjFxrpSgDh8qLgqrjt9P37mTWFnAFfTHNwoNyGcxftuPZtVBQalWxwiLWTS2zz7yzWe
	Xw3oKVhhGkC/4j74J0LOzeDwL2MLClm3QTNfYh0zN0bdDqg5a2vayjMO0fygbU27rQeOFf7KJsB
	8HOBe2iHcyGNRhbXlYaPxfjaeA37ORl1Pm96mlxQLKq6Snw8KTVjMKI4agHPofHM6fYr4+jzMzJ
	bxdW43617wc3LXiwDv2dbnlTJK3w97N9OIvPqaYWV2saTxxIt5NmhDoVq2u2iVoq7NB3NQOQ0AQ
	E41CKfKu0Y0JCl94Qg3WRi3KSchprb42AmXgqRmEhXikvivX1+1iU=
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr13374585ad.14.1778731548709;
        Wed, 13 May 2026 21:05:48 -0700 (PDT)
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr13374375ad.14.1778731548241;
        Wed, 13 May 2026 21:05:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:35:35 +0530
Subject: [PATCH 1/3] dt-bindings: interconnect: Add Qualcomm ipq5210
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icc-ipq5210-v1-1-b5070dfbe460@oss.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: SDXfq098-XmgUudeq4zMbZVL-EmMG0oK
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a054a1d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LXs94aH5GLyjx-_FEpEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SDXfq098-XmgUudeq4zMbZVL-EmMG0oK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfXwuft+01ViKKV
 ris1cdcVxPzUhgZ4ogiLBs0DBNmKNyBifzYg9YnX7z/VQ8/QmCMSl9FiPnrmO5XmRvMe4vl5vcI
 9qiihYK2FVK3YskY289L3DB62bkC/ClTPdWnI+/FkgoTHU15uWiEUrP7YuTY3rRtxnYTgrm/Sab
 nK+BPqJW3RH8Afvr4JtXYd7dqol/S5AIHdG6Ruzw64v6mjShwg8yNcK7VCUkIRKpXN5wdCJ3hAK
 n65AoqgRquMdHWh1MxBpWZMd/vzbrfAJmVhGPXZAC3XvhyU6SII9eUk3L0blI7JjoAEVOd+ydk6
 DkAny+tM8Im8HqGgWYEmyd+awPyoXs+dLwG7yAh4qTPfJPKi3Wzb2oiKBzX0u8AZzEmCw4qr5yt
 gf5DG248X+hPPNv4g+AMbhpCJ7drc3ejFEvmLKl0Vk51TKOQCB5qPjuf+3TLALkNtUkxouqCoQ5
 QIxzX//5zVHCYgSgRtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140037

Add master/slave ids for Qualcomm ipq5210 Network-On-Chip
interfaces. This will be used by the gcc-ipq5210 driver
for providing interconnect services using the icc-clk framework.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5210.h b/include/dt-bindings/interconnect/qcom,ipq5210.h
new file mode 100644
index 000000000000..90c0395e4596
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq5210.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ5210_H
+#define INTERCONNECT_QCOM_IPQ5210_H
+
+#define MASTER_CNOC_PCIE0	0
+#define SLAVE_CNOC_PCIE0	1
+#define MASTER_CNOC_PCIE1	2
+#define SLAVE_CNOC_PCIE1	3
+#define MASTER_SNOC_PCIE0	4
+#define SLAVE_SNOC_PCIE0	5
+#define MASTER_SNOC_PCIE1	6
+#define SLAVE_SNOC_PCIE1	7
+#define MASTER_USB		8
+#define SLAVE_USB		9
+
+#endif /* INTERCONNECT_QCOM_IPQ5210_H */

-- 
2.34.1

