Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82CC288AD
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388671; cv=none; b=HJY9v7gcyGKfljzhKezyTbQ67soEfIItD1+rumvt5BdhWgDJe1WiwEb/f6opSLY6l7XgU0au+AnF84C2dOZ5oklDByELNDvtr3brtkCQmm6LI9xrMpbIAqT6Lc5BhN26VkiekO6sWHtzszQ1W1SxZljviEsumByql/iSl6NEoRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388671; c=relaxed/simple;
	bh=HIuDMOUvPkd3wRuGLRIfmrwQ+g/VpmgvGPh0rYR6gtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bmd+ip6YX97fauB7RYQ5ErZORzTu3AU1B+NnZg5HAfwe1DP4beATzkziRENXK/fODw7APmintgZgP/vbPydkTzRL34OgUy/CZj/4N8ig7vTP6na0gSJh41Q7G8MGcoZwk/p9BlcG9/oHOTKD8w7ewMRbAFxlKqwtTVvN9MPh6Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xai1Uoql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXoMdN5w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xai1Uoql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gXoMdN5w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SACMfB2928880
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X4GYoIZRg3Kj6Bl4xNoMChyDgvmJjDF/21x
	mB8lPcFg=; b=Xai1UoqlEWAAC+OM66EBjh6Hcp1jgcN4dxsUDT4u7ROF6BU9NDB
	D5kQKpaJN+UGmWMWMsLKp8yyKcMwtOiI6J6EBBDQoLyMcKGlPSx7zSGv8sBR6uzV
	wgCpfSYe68cxrQVJS7PuLL3qOiThIS7p772J2iisJ/tYC+eDGK1WUVmtIwhldvus
	LEOMVK6HJjmfwA+GYLCxoJb5FfCgz+V6tzDgxJWPF3UpdxZVtrMUMgMSQEZdJD19
	JIkzyuGK67JyBXIFVf6XkuwEjnJ0XkzQkHRakVYfeR0XAKCDtxs7kAri/mybJJz3
	FrVzrGdIHWuHvgUE60YsaCYrrRZSiwnYpCg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh93dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:04:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbc53b64bso13121085a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777388668; x=1777993468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4GYoIZRg3Kj6Bl4xNoMChyDgvmJjDF/21xmB8lPcFg=;
        b=gXoMdN5wCDvpK7rQowvaP3WsV+ipSyZrCVX+lkm3VPoROhtQunDEk2F6lxc1zxePMw
         jYz7kL1QvMgOYBcjPGYxAfBG08p7cIA1yyu8l4x2QMbClnfZ/xnPt5CgwwQYTfA4ibzc
         0d4WlXP7VYE3PsSvcAj5oRgm2sCWl01y16Vnoy2fQ7s1cbAd8iGoaPgx5eDhzBFq2l5t
         j5P5hOAOeQOV7BZ8BWDcOs9CONOL1qfD2R/EDwhVbN7tL4kw1sgq/McVxe6e05xwENmS
         nqd/ez4F8SlTOd/wWPr0r8HKlvUTYp0pjGbQN4/K2745a44s1ha8Q/WZxk0w03e8n4tk
         acig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777388668; x=1777993468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4GYoIZRg3Kj6Bl4xNoMChyDgvmJjDF/21xmB8lPcFg=;
        b=QGlK6xIMKZ3K0q1u187v0azsadQmEgfd9/AIzAxO9uV9E7aZXYKNFIdonLgP5iiqV8
         ezxUXNSqYD3tG2LmkRry4q7NmPiZpAg9LfhiHhUDLM4D6HDUGcbKQHiGQWepvgIMXLGT
         MIyeYvQ5yDgNKOFvqZ1YO51NDCMdcCYu4P9HAx4alKU6o8K8yDnjSewAZ5enBcU4BQSH
         XTMXQOT5IAHYUP3wnWQZvpk2uEJKfCNOSNzU6hKmDfN7IGj0PON1dJ9DohZYniSNrTBe
         7kH9J3X28s8wy6wSSAf23U7tM+hWunDUfoZ7X8iVWPsV5wnn6kkCr95oAoI16+oCASUn
         fuFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rqhUH8L0xGTIOkuT2WF/nJ9nMfOhhbS43Xts1tcr9FXljEzfodANE9gMbgR1gDJ3L3kvA73oJovz8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ONsMp8s2KcO9uPeEwZSqVhVtZbV0hMFBFaN8ojhl4uYxhqcs
	Ja9LaEJVK2YqR8J4GcV99AoJPo1NG1jVoaBVOsbQTF8f0Y/OCgRVfdZh15XcM+Skr9ZFmM/OMKj
	ncPifQY/AmSWhLzTFKH+rjIksx9WqQEtLgpB4pzMYhc4VpsPm0v159gCi0QOaxV1j
X-Gm-Gg: AeBDietNyCTwNfZTcBnT+gcIiBYL0HAl1FV2vDkkTVVpOeZPvEGcsjRE6HiigiGCLua
	VR8CXm50o2GYQhZp3Y+Ix4x9wMwmZ+tVC+aX6GJ0I0OF4BmRMWoNrdyqxkskjfufsNHFZWgXwz9
	6FEqkqF4+bRutA9mKtCQXGSR8x3U5BEuRRFTCc+UkzcWzVXUETvrdrlMLqk0ivtvSn7o4QYmTel
	V2UmQmiELwhe8WRmfnxAfWtnG29ckyKhc4kRfE1OUg16ZAKpg5oSHeEiUbdRTtf+9RlI65Exifd
	1EqqWZFt4Jb3a01H0lvQiRTK+ymxBADyeSd/IyzYpxHdVdjrsZdUtUkl7Vt51a2g0YTAs3/igYQ
	JEguUv6bkWB29NMpGVM3OXKRmMNu3AmNWbMHALODbI+eYZPk=
X-Received: by 2002:a17:90b:3885:b0:361:45df:103 with SMTP id 98e67ed59e1d1-36491fb5054mr3610818a91.12.1777388667399;
        Tue, 28 Apr 2026 08:04:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3885:b0:361:45df:103 with SMTP id 98e67ed59e1d1-36491fb5054mr3610677a91.12.1777388666015;
        Tue, 28 Apr 2026 08:04:26 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b6852773sm890992a12.23.2026.04.28.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:04:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2] docs: dt: submitting-patches: Remove possible confusion of combining DTS
Date: Tue, 28 Apr 2026 17:04:21 +0200
Message-ID: <20260428150420.121472-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=HIuDMOUvPkd3wRuGLRIfmrwQ+g/VpmgvGPh0rYR6gtM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8Mx0BrVMSTVq1Vq9uF9czizP22tIXl6FPdQsN
 AWqJdehC5GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDMdAAKCRDBN2bmhouD
 1xF7D/9DJINSHx42DGmK5IdxFKSEbtkTf5Rz9L5rwaEQmF573Tb7CaxSTvAUj7CzOpJw1JAzAfv
 QgTJjbCE7/pyxLhYryuLj/kH5Le8O6MUEJ3b2MlJStupUhb/PzWUbLFFXNXtT1a0RXNXW4xEXqW
 U98z6Uygvjuoh/eRVq9MS0DGJs6OcV4C543+4K+l+NaTt0HFEKreNH+ASj9Ztuh/8UmTfuj/rXf
 IAo7OWSX1dH48Xy1i2JG5AqHRwCs/1djDgI1JTrJPpAR9QH4EMgi9XxwMYNrEvM3WpYw3Gitgro
 GgAqTyQ2mgEk8mBHyb6du1D1KEVYsOU8fYzTlRAZFbsgGVx+5x+7v0griEXI0eITwe52iV8IMNk
 /OeQfPLzFFOQmqcaxfuech/Gp3OQlcqM83ZhuQ3eHDYurczBoGnWopuiAwaJ9y6wQlK3+cESEj6
 7hHfHBkaYvQoUbYNzM3x7c1smVbnZJu3DF9DC6tir4iP49WUJqMYDdXZ85Na11rc4qs9JquxjZ8
 KuaLlAwItFtElZVhl36GK3m5AdS4IADNEfoO1wSy+XnfOj2vQ17aqQjM+wMDnERimk0D4sWO9Vb
 SbH7oEIcmxaW4C5O7uOpsjp6MoZSFLYUoG8I/WeLshGUBiI4OMnDUSoPxNAO8U0LPAEuEVIkwvu UGvJhG/yXEGetDw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE0MyBTYWx0ZWRfX+y/mQOTfG+O5
 JP6j/wk5QAro06zL0GsPq+rFm9ztPzxi0dprqJpVMo3HSNAEJIZWxH3Uzh+wFhgDB6kJkmdtyXU
 fzT25QW1g8UvGKd28PvbMx86Odk1N5iGpzIDEjiVkASjHBb8Mk62TBo71BC9eu6qWtgU3l1fLh9
 LkGw87ZRysibwQpn8xTdUShEtjLjUnNKgN7KYLl1SwoXPt5Hodlw2nVac8Mkb2MJ9YnSWQdzV1a
 aB3myc+H1C0HWw/ngJS2wFG521G590J1qv2LI/ecolN5+JKj+MrJemaDcT18u1mscGBHVXU4z2v
 vbGB1r9eo2x742Kt6fGUdVmIUjnb8aCEmoi2pdAI0qD65dQ7K5RgZ3Wxio8ZvEPK2m0ub90lg7i
 Fkazt+irXrV7V3dL4z3VVs3ij11wZC8wMI03r4o6AWaqetbtQLqHfmjb+cAWuDsOdU5RhZVHKFj
 L12xS2wURgXPWxNiF7A==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f0cc7c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=23xeaJfjHFbHcfkIFvEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: MCZXzS6LeyB_MBo7W-HjUq09TttxoPOW
X-Proofpoint-GUID: MCZXzS6LeyB_MBo7W-HjUq09TttxoPOW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280143

DTS patches were always expected to be either sent separately or put at
the end of patchset, but the first part rule explaining it used a
"should be placed at the end of patchset" phrase which might create
wrong impression.  This part "should be" was about order of the patches
and applied only to the case when DTS is combined into this patchset.

Suggested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

changes in v2:
1. Rephrase a bit commit msg, minor style
---
 Documentation/devicetree/bindings/submitting-patches.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
index 81e27e50f905..2a5533f68830 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -64,9 +64,10 @@ I. For patch submitters
 
   7) DTS is treated in general as driver-independent hardware description, thus
      any DTS patches, regardless whether using existing or new bindings, should
-     be placed at the end of patchset to indicate no dependency of drivers on
-     the DTS.  DTS will be anyway applied through separate tree or branch, so
-     different order would indicate the series is non-bisectable.
+     be a separate posting or, when combined with driver patches, placed at the
+     end of the patchset to indicate no dependency of drivers on the DTS.  DTS
+     will be anyway applied through separate tree or branch, so different order
+     would indicate the series is non-bisectable.
 
      If a driver subsystem maintainer prefers to apply entire set, instead of
      their relevant portion of patchset, please split the DTS patches into
-- 
2.51.0

