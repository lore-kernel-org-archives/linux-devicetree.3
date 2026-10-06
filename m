Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603DE31E823
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 11:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285264; cv=none; b=O+wOaJmrJMHuN4owEftTMiSNGA6ARiCXkzCBfPHcaKPtGLE6dPVm3ooVE3gwK8bd43TOsrRwCd3+AZVSj0A1dAfz/qwG0Ae+P/aleqkaRViJmzZdWNMwqCBpU8bs5Sl7ONAopa6q+wMgJuCKN+P4IS/80N/eibqtF4dIDvlUrbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285264; c=relaxed/simple;
	bh=y2FohgVugKHcRrwqSAgDn+CMIOQiCYuOFRGzU94UhdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HSijWJ3OeUiHpYBqkCu0oJssCeA4ixzuzXt1YXA2a5/4zho/iX1BiEYoKzUz7o6z6mOw2VrmZ3IGrNYof8HtXjeE14fO2Yl3pTXj0kaBzGH4UeFLDC4FFXE72fEVv1kLg2zyPIRSnAJ/SxPIg9aaIFCpfxiXAPyfbKrDBWbWYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+Rq8N6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jtOh4Jyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+Rq8N6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jtOh4Jyl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696ARHn83929474
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 11:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Pfmq9lmoce9UQap1hkT3q
	E7NyxlVsRLj1bFCy4E4gQ=; b=O+Rq8N6VhXndwfhf7k++0wdmAUqZ7x7cbxhvmd
	bB3irwOLtBxugrhNhiKFAq9HhLMNWrfiJgjQCgtqAVN9kGWiAmk1v6WheewnmWOE
	xo9rsqKWwieve3uYM9UGrcNQHgl1ZKQpm7X75XZPdfbRHcLtv+rst3I/ZcmCCxjx
	ZR4NiLZBXU8a0KTcsUF4kPMRfPcGxQxtWLywpW9moV/nCI9/kFxIY8ng4utPtY2t
	ielrtBrI6S4tKE5ppmtTtKkEjU3oEPkNoJT6qdYrJ3bOBJQqUyfzqtjDGndn4Jsz
	jxE9v7Q8OuD7bbVsK5Xg7dJWcl1f4dJ/iL4UCEcERzV0dIoQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrrrv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 11:14:21 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1576695a91.3
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791285261; x=1791890061; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/Pfmq9lmoce9UQap1hkT3qE7NyxlVsRLj1bFCy4E4gQ=;
        b=jtOh4Jyl2J9S1w5Zpb543L3X/GyrmBv885RRFWPY7AfQ5l5J6xwa9ivr8g4qF2gGei
         oGWo9aiF3UrYe8TIleJzvJt3bYEjkjTwFxnJErM6rUOXppDSEiuXUQ9PvEtRt0kFhWCp
         4ibxNnBau0H5Izgb2trIeB30pW2yFllJqAOHrXFiR59ffHsPHMSYiw3fDRMJvpeYy786
         UjKV7n3zopU2LdCiAKQnVW/z/iiPgO+ABA4s1eWMnZO9qk8ieT9vuegbCK++dGO8pjSt
         1pAtJkfh0ErpR76d/zszSkF5WRTiWOKGfHQs1JwIaxy0A2x04iVgYQspTBNeKHD5CZYX
         ePtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285261; x=1791890061;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/Pfmq9lmoce9UQap1hkT3qE7NyxlVsRLj1bFCy4E4gQ=;
        b=YOOnTQxfTQ0XoPWI8vDBFUtR1JZ5j0wbuPLKIdt49CXtligRL82XhiQgBidS+7W8bQ
         kR/oI4MZcKIOrfbHHKgd06tAKCPiYED1ihpcp7TurOVOdULOB7cqYZL80wUfM4u1fHje
         5cb4eoXFeRvGqgMt7csiZHOJgslcwD0M7UeVCgPNaZVfP9Dksf3oG9gOw9QZymlnVcio
         oPE4No5UK97mmx38a/78/ND2YiVwpldh7VW7QgZ08399kwiTCKx6v3vFY9ojWPBV0Oll
         0YGqhNIfNMg7VzL9s/xDc9rywvYB3BEJDUHuV4EY3yO0ln3jnzA/siRE+dvi4XSm3Jw6
         g/HA==
X-Forwarded-Encrypted: i=1; AKwUvBzqNXDpenXsgYvXSnyAbd6J8KJNDMAG1gci0CCUfEEnyAGcRUIiZpvjSCugtBm3Z/L9NMoa8/ZM48+p@vger.kernel.org
X-Gm-Message-State: AFq9FYJV3PdoSsPbj0B+wmxXtwv6T1sx9tiX6pUcL+XVW4v/KXx5j5Qf
	J1mHCJoPGkG9UyLql9LVL9eWDhoTvc15mEXiO+1wQh2H7/xjYPUJzYnWtjP4UHfs7YLsFKoDeaa
	ZBqBrY+NAw7Ee23eqP8ES/sdU28m1ClX6TyvJa3QPkOGiC1rtFYbBSJvfNsLPz6SH
X-Gm-Gg: AYBFou2NTCHLll19ErOa23q1QJgJDWNtT2Isr/XFPEjfvod0BKhIuS5eyqpupVNNDO+
	2FOxQjxeUdimBgmcSeU+r6mPv/FK76QyE/3UpFTnKzgfZ5nCHLIq0UqsUYVsOacMHJ4/jhpNDoZ
	asq19H9+NwD2WeTnB8737Bv7NGLu0+nHQO4ruSih8nq11R5tTLpOccBfUo2PFl/m+4tN90CZhDg
	g2XKxXtEmbmoobsg2XwiiRzmTrFwCnt1UA9xLl9G4HJ0LhD4a8a5/4uvvCqC2NFn1xHAQjlS6h/
	KeNViQL8gcBvXjgnAIrpvr7/TJc7nIhXBb9cxatLCgaQymn7ukL+jJtBpqWFfiFAoeIj8wOQUsA
	NOyw5Kst1vvDCGbo5mmQ4zpS6IX1bunb8VQ==
X-Received: by 2002:a17:90b:1c0a:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3a8719cc85fmr937613a91.0.1791285260989;
        Tue, 06 Oct 2026 04:14:20 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3a8719cc85fmr937593a91.0.1791285260472;
        Tue, 06 Oct 2026 04:14:20 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cde769sm4306838a91.13.2026.10.06.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:14:19 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Shikra: Fix qce configuration
Date: Tue, 06 Oct 2026 16:44:02 +0530
Message-Id: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrXxGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMz3eKMzOyixPjC5NT4tMwKXSNzgyRzY1MTc8vEFCWgpoKiVKAw2MD
 oWAi/uDQpKzW5BGSKUm0tAKFsiSZyAAAA
X-Change-ID: 20261006-shikra_qce_fix-270b735479ad
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4d80d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0oWdxScfMXRn80FIiJQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wnFBaVeuDgz1MJhfvYruvkqOMXD-_Xk5
X-Proofpoint-ORIG-GUID: wnFBaVeuDgz1MJhfvYruvkqOMXD-_Xk5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX0f/46BkMO6Ym
 oYRIMYppPBkmH5HGDB/UkW4VagFLRg8kwW3BnDP0UpFceEeGGPOGdr+br5DFCyI1NLT74C5+sv1
 vdufsh32YuuRclOBTpQJV9gR6YFXRSfr1Qgm9TtbCjAjXQNQ7HIQO8LhtZASzGOwiuvG2ABMxup
 PYmzlUhV+oSfcZtbYpuFfYxBH7bjnjTwf1w5muQuOKtEgjL0T4pLKvN3r01ijjZa2QZd2EQkwv8
 kYeDa8SfNPsvhgR628sgWkY+/xkAqP7wj63h4PlLXcpraOaB2Ya+UcYuterIe96v+GVDMvtvh/O
 WM5JBCa+tKtKUh28tUeGuk0pwFC7zhOO0P5A946Kr+MkZ9UkPL3hyXq723K/bV+KT6eWtGsVHJS
 sZv+8XrOrmX85xoDhMMx46dT97yBq6PReAEhJNgSJbxm2sVl4DziR8rzTKfO66YXIV2WjEIhxzA
 2RpiK2qcN1MmCIszxCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NCBTYWx0ZWRfX0N+m9oLr5w0q
 3xM5Gv4iwTh7cRcMTxV5KSTjN2X7XDGYvpWN09kXUqr+WAnsuprBFROycuvSc+Lt7AIVCwaV7D+
 gA912oTf5cQhp+GAeLrna+SrG00dsyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060044

This patch series fixes QCE on Shikra.
Shikra is derived from agatti target and QCE was using different
compatible configuration.
Also, one more reason to update QCE is, clk-smd-rpm was doing proxy
voting and crypto was consuming it. With proxy vote removal, qce need to
vote for it's own clocks explicitly which is already being done for
agatti target. Adapt same mechanism to Shikra QCE too.

The current qce configuration will still work but this one is more
appropriately describing the hardware.

Validations:
- Qce probe and kcapi_convenience.sh tests.
- Correct clk_summary output as prepare_count and enable_count are 0.

The previous patch-seriest[1] was sent to an older thread and with feedback
received, submitting a new series.

[1] https://lore.kernel.org/lkml/20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com/

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      dt-bindings: crypto: Adjust Shikra compatible hierarchy
      arm64: dts: qcom: shikra: Correct QCE node configuration

 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 arch/arm64/boot/dts/qcom/shikra.dtsi                   | 7 +++----
 2 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261006-shikra_qce_fix-270b735479ad

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

