Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3800033A6F1
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776139181; cv=none; b=PLDpxPhGvs6yLsWPnmrc2Ja6dVX7EunsRy7e4KyRcYLWmzb9Oq6L9Y8b+sE4Nl5sfoIVoqpvduRdfiLB0IDhAH55SJC4Foo/9C+sxFAqTLXi8DVNm3aSE30Tb9a2ebolxGf2/pRRhqSDGaMEaB2+g3xIWC+QMFKcV0nsK/sdsJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776139181; c=relaxed/simple;
	bh=QZYwBAG+pTDj217+cj+RjnBxhhvqSjs3QXHm8g/XqpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TrF30qAdNGYPpx2VtriQqMiphB0PC/PZobquBUdnd2jpQ3WFO8w0U0ajVJSYmi33uKU3Ul/CZcyfNyyQRzxNfmhkR4AYSUQB2GfoxKPz934k/lteYGyenI0VFz4oe7oJe+Zcfh+aSjaNV3dzvIdJB8cwuvFWNo1zayIFqT1W8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVD7alg7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV34tx0J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVD7alg7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV34tx0J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCd0c3505300
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ugHwuPVgElZC0lXcMV2XcJCHfpDjLtZL1Mn
	qE+P7JYM=; b=dVD7alg72dbfFMCukGFiKJSVBhUR7CVENJ451KiBB01LlnZR3Wy
	8nklKbbnmsstNIhOz6o7rV2ZjMjN2trpJ++XEndST1AtOP5ldqp1T0PAoySbseS3
	NjAPhoHhjVwk3SpFsfvwS2Ih++Sdz6DD92IIos3c0nCvYHyB1EoozMYAuGIDmQDK
	8dp+JD7ZRXhxJ3XlvRd35y4s2sckck5b8OjraaZVYNznoezvjjEoCnVfNFP9gL2k
	VhFQScWCIUaWj8O6cS+l6a5Z6aYr1nXhqdkj+N1Nvwyg+pwZDvJONnthiZrCK2v5
	pCmM7bomYiuwXBJy+U0TaqbdaIjz70Uklkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870gwt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:59:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so7219553eec.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 20:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776139177; x=1776743977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugHwuPVgElZC0lXcMV2XcJCHfpDjLtZL1MnqE+P7JYM=;
        b=aV34tx0JsdQFAd4jpSFA3Na2lyARkKGtH3mRpomBGNl9VxH/MtoJgSTNyiIaR1logf
         Iw07jdSE7pSNe/7rGx97mKnUTcZkmNp1BB4qFpSzOsOgWaKckyCaQ7cstCipbab6rY/n
         De7zHB3kA7kLMjMVHr8lOYxzUNJmg9jaxW5JL6Q49cpzFKC146dB/6LAKbPYGaroVKx2
         X1eeTD9h6Js1kckqv/satO2i7CpI0smfoqwxx9Szxy30ZnrTsE2nTtWReD9r0Ow8CjPL
         M5pMsXt6JZvmo1e5VMoA/Qs8+ZBlDgxAkdUmhtrM7n0LuM7nsxwzwVxsl/kyA3W3J+q9
         WKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776139177; x=1776743977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugHwuPVgElZC0lXcMV2XcJCHfpDjLtZL1MnqE+P7JYM=;
        b=mkUl8XrGTLiDACEb+JmkdtCFGkolcCUeHoBNonx00iacH3Jtl8eyOQBg0eg+t7IbPN
         CKa2CXp4Jtaj/BUdV30CQUr3qBqN5IxvcjG2vmPfEd5WSJQjeDGaDnqXBbJbQY6LwKbu
         r1MKoaF8JTBuPEJD0feMvJ5pVQOC3itzlyt6QcMCY26c427S/E1xSY0bRNsLA3Gsny4E
         HIBgO9u0OyyGvhqOSOoA86ciOafG7M7llNl30TA1hPNwxW6SWz3lBSol4/dcFncyEAAE
         NUYM7f/vKTlmoV3LRv8Vqhj9uAF4l5vPkOePBAkSTYSLZE6T4jlyUvA7xesCb77A2XBV
         om/w==
X-Forwarded-Encrypted: i=1; AFNElJ8dMWbzMkCLyujomapXj7u4eovTGeSlns2+vDoqUJbXZsdWSg8psD4yULEJXXhiTnXSOe2zKElxK3nw@vger.kernel.org
X-Gm-Message-State: AOJu0YwYyEn31aMvA9F8+Ev/lKoa0aIIWhiscY41oGwQOVJ7X0kg6hNr
	DDe10Nz+6yKcGayCIjdg/AjxU8g0d42ScA8JMhEAn15Ieo6RlSPmIuZW3lOnIYcfBP/9QO4TMK7
	n6i4qazWo2qdnsx3Uar6UKsqTGP72lFCY5kAZVlB+HxHNZnfxTeaIJlKy9bG0Hzez
X-Gm-Gg: AeBDievR6PEEroiegwg6uMVrKPS/u2S5152p3LNSDpjufGIyYlP+osTgnLOQORC9nYA
	/St3TU+FskC3ne75rOi5EAZMVPiKFGxHL5BF0fKF4ejogn6IubciZLSCmqu4bRFvWmWVcZYVrtw
	0rcP1aTSK3PWCIYbgylg2x+CX4liSQFKBp60TIpr53pWAcmraEwWJ3zFfQsT+XfH80FwE4j/8e8
	8+np4y+1xuW5dv638z5Z69LT4xbSzVtAyofEFqsgPJcAUsqMon1nn4ZRzbdgwL2w8ahyLH/kGhg
	OeeR2cK0wvNx3FMNuy2Xr3+CSqivRXS6cIFu5Pb9kydNfMn9VcIBxa7LMbqq4shTxZYmVr2a1kL
	d+OipPaV9DSTQ4aQuqPZt4RvROf12MA9MrVJk4e3ZfImAEVD6LoKLC+g9uyHI0TStOdXmxvFQDe
	dfIXkRAA==
X-Received: by 2002:a05:7300:2287:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2d9db50cd6amr2384808eec.0.1776139177437;
        Mon, 13 Apr 2026 20:59:37 -0700 (PDT)
X-Received: by 2002:a05:7300:2287:b0:2d9:db50:c6a5 with SMTP id 5a478bee46e88-2d9db50cd6amr2384790eec.0.1776139176878;
        Mon, 13 Apr 2026 20:59:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d80acca4c5sm13949983eec.19.2026.04.13.20.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 20:59:36 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add power domains for Nord SoC
Date: Tue, 14 Apr 2026 11:59:06 +0800
Message-ID: <20260414035909.652992-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzNCBTYWx0ZWRfX1Cx6oBK2E1mg
 jv0GYKMQfU6F4WhxG0vcr9IUNtiwW4wi4ywmlOzpyQINTJ74oPbffOxwOLOK6zKP+seiJxrX6El
 G/x87z2+1NfqCb1xQo3FQ0+Jg1LJ7YpiGMK3Yzw67RNkn+xIqJ+G9X8E3dl9WrQazKET2vlRDJN
 /aVLCWzIWV3BVJa4EnrKRJhWVoez9jDG05JnS7y+lTRdkvhLF9u/SnxLCYA+ly5JBpOc1JulGzb
 kaKpkhJ6KkbCcIo+TM8gwZU/+VZgFKkBMXYX4Hr69b+JgWR5fhiHNSuZu48RDtU5NVfzzZ7GFtl
 NxYBwctT0Oob4Hu6L9sgeIz+kDFSeFPrmDIrApI3xZ52v2ShpwY9RGpuMgX41CxrUxHQZ6nxjrw
 xPZ9x0nTnLQbR9dAJhx3Te5pRD3shkzr/Z4UoE9ZUC8blvXXgR6Ly0ywWMMxTLe3FAuyZxCjphM
 +UO0/LCNlfuWfwsaWfg==
X-Proofpoint-ORIG-GUID: stRkYRbYpqxwb3hTFO8mdrnISTyq2E6b
X-Proofpoint-GUID: stRkYRbYpqxwb3hTFO8mdrnISTyq2E6b
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddbbaa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=9bb0FoRI36OxSVolPrcA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140034

This series adds RPMh power domain support for the Qualcomm Nord SoC.

The Nord SoC introduces two new power domains beyond the existing set: GFX1
for the second GFX subsystem and NSP3 for the fourth NSP subsystem.  Patch 1
is a preparatory cleanup that fixes inconsistent whitespace in the RPMHPD
define block before the new entries are added.  Patches 2-3 add the DT
bindings and driver support for Nord respectively.

Kamal Wadhwa (2):
  dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Nord SoC
  pmdomain: qcom: rpmhpd: Add power domains for Nord SoC

Shawn Guo (1):
  dt-bindings: power: qcom,rpmhpd: Fix whitespace in RPMHPD defines

 .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                | 35 +++++++++++++++++++
 include/dt-bindings/power/qcom,rpmhpd.h       | 18 +++++-----
 3 files changed, 46 insertions(+), 8 deletions(-)

-- 
2.43.0

