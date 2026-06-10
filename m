Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0546387348
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075155; cv=none; b=B3S0/705FVjZ3BuBwXmnRxzqizxfoYe4mDygRgeXDq9LzI729trXPqVYlgduC6hptLO/P8wJB8gz6EQdMRqj+Wa71d25WsjvIMjWxC2ZVYxvEJsrFAHHyCF9ZxuDqxjdYnDAHsRFriRDEPSvAYYVO6Gm6IDCrAcppukfVR4D2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075155; c=relaxed/simple;
	bh=EdSqvWxvbeFi2s8A+P9poiJz0j1+FY/3akLr+hOjmfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7AD748fOCoC8PmScYlNg2WzSZODRZb9uwq1w558mD8B1tzandkHVKElx5tuucs7CHhj0OjItFIlB04DhBwIclyTPcZJapbstOfsIrApohI1YLoi+CRMfdPvGal/G1IxXxIDLeVYhMLapYVO2FUP+TsXRNbVm0+f9/K3Z1zo4cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0bQZ87w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmiTd1ic; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0bQZ87w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmiTd1ic"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A46YTR055738
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20xJQ1VsBjWu2riRF+Vy476G1dpA/diAliFTETNCBXg=; b=o0bQZ87wEOFC8Rh0
	SyQ3+ogkd6hMolb5STnMhb1lGa4iTj/oa/75Qh4ItLvgzJGiqoK2h+J7qAAjKm8m
	Qu7I/apKfssHwJHU1Zo8Q+n6pZy7x9utW4Lf9EHVFVdFo2esJgWZRe0lHaCVaLhb
	+2J/sFA71nntJOfNLpM6GHgeVFauV6NPHpO3AUiMj0EXVB44aJa9pug61d3iBzHm
	5Y2A+IN9/CUIHEcMFLllZFNEdqP5cN3dkiB2lRoZiTCyJu2l4eCXwj3C9tSQLajP
	4IPboueedAjX40Et0Sod1b97jkPkUo56MGMXQ1/4JE6t5RfIZAvt9x2mOci53hwV
	yj6U/Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1rjuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:05:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304f23c55b2so6741350eec.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075150; x=1781679950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20xJQ1VsBjWu2riRF+Vy476G1dpA/diAliFTETNCBXg=;
        b=AmiTd1ic1P/SmdYV9U/kg6pU7JMgweiNUn75w/RqEbIhU305MOCdadCQup00raICyz
         giQZist/3pu3hHy+g9TO/bAif56bZigSswmU4XTzBIEGQmGuQqtdzyxnzTymH0NYg7z1
         A7UIFJzVCRryXPRmGHN7j+iMGF5YeVFlwA7fQQBmy1hsVXRVQliuCJWZawI8xp6Q3UrC
         RGK/61l2OuIjWrRNI5e2igYjnk8ISVmf2tz7FwsGxiiaa7/rbdLcED6hHlrD3fdtzlWq
         b38hqZ8xiMCQpwnVWsJeIsrSbb8KWhXZvmg+qkGVE31IcFLTzlvAGS4vp6Ib6Fdzen6X
         UbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075150; x=1781679950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20xJQ1VsBjWu2riRF+Vy476G1dpA/diAliFTETNCBXg=;
        b=pyubWehpAkjfjP0Jp+E/IGQx04Gz93UNTcDovl+nvP+wZazrgIP104IIa+Xdv+29Y8
         4EsHArUA/qXB24W2VkCL1NMzuem45t5hyAF7KVhnpQBdZ1bJybroBR5z86dlxQNP6xn2
         w7DxzeGYD+Z+Du5IlPxZVPBB9rnJzjgSvhAOL3vKhvl3vGR7QmzC1WU0wj90Hdk4zSef
         6fxn8gr1us3lPYDYVHb+Vd7wmpD5oZWGhfPbLP+PwLKBhiDQdhHpf0UPJjP1d8djIeGp
         iNz7XUv85SXWrVBIdqTlJyG/12l5cuWrB3i6ez68Y5Ex79SIAw5qlE6zuH++yBnV5mIn
         iVKA==
X-Forwarded-Encrypted: i=1; AFNElJ9gmbYp4n6C/H73qoUNQnG3b82QeEf3ZQTv9///An3L3lSZJD7+QWen5E1bx0cY6a95SclnW5dqfy/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyTtLYapnCe6KaEbWL0mH1K5E7bwlubLzj3Gz/THBfmtHtrAOf/
	B1dkekLRDA8U+6yiXhM2SnckXW7v4yMqRFaDvl9fZ3kAGomSAWaq9qZcuKalks5uHH9P0cc2l7v
	zn9RBsScP0W/zltGlma01QdOqHLSwtjkIrWT6TbWakZF9iljTUY4mlV/Nqmm5ke7O
X-Gm-Gg: Acq92OGFWopExO+qUMS9xZVQPb2AUpSK7921N6BS9sRJAfiSuPWrXniDjbQA7gDGWXC
	EVbfEK++Um5O6gS1915in858OLFrgbnZd+JuKIPs9z6ysqGnLzt/eQ0qNkoP0OmB+n4P329z7e/
	CUaAZBQSPqr+anrXwN7okwx8u5ovHj6WRYnoVupmPOmnZLIFOZol920h4UgOwRnbTHEIghFdB9i
	cfTrHCbL9nIv/4otZZas/qvOXy7mbUjYy0dFy7w1sh23TKVS2ihf4alqRXW+yEs2nmAzcYKlRrT
	NWOVmtyWMdxRF5jX5IZI9petDftryPIECjundeSPOoDdER5DjQoN2QiTKUTIjnI9qZfJGGRtTdl
	jmYebaCxsYS5Vg0ZEhLdTnXwaRdJluJlVPwyYwPogaYn1dIsSoc6I5FvrIiOmrxK9jxRmXZ9ILr
	sWpucMTy7m
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr14944166eec.3.1781075150315;
        Wed, 10 Jun 2026 00:05:50 -0700 (PDT)
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr14944138eec.3.1781075149764;
        Wed, 10 Jun 2026 00:05:49 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm22435926eec.30.2026.06.10.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:05:49 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 00:05:46 -0700
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110
 GPIO support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-pmg1110-gpio-v1-1-a9c50cd8b5d9@oss.qualcomm.com>
References: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
In-Reply-To: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075147; l=1506;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=EdSqvWxvbeFi2s8A+P9poiJz0j1+FY/3akLr+hOjmfY=;
 b=O1LNuhwD4U7ik/rBoO94KgcjAYX4hmzKF6/4M75f0P/8w8ha5LLRNIC1EXsD6DxGZEj83icSf
 6bwYOGt82BRCLREULuMOyI+/aYqAHPfM2jklsQ5k7EdglZJEZ21E/49
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NSBTYWx0ZWRfX5T9oYbn1chFf
 bXvu/HlGRvVLffX9tFGWM73AwSPM5/9fuLu/ppLqCz+F6jed1LCX9+QMKwdvLkBkVHsdXC3X2AU
 H0L95wxM45+vTDUKK32yI2/TkK+X4avg3j7IOuy2G/dgts1SfBMsvJtw32++ppqy2xsxuAMjhNb
 uREaPi34Z9l0Vj834z3Wu8N90F/sa1AVCQSKtScMDvtXP5y0uQCtMhStqqsAJ2VRDRkRQwh8VRL
 AcL9iVt68cOlALeFKbCEsAj6cUakjcYSkf8AwDRdOTUQoT0T8Gjs7JbJnumG2v+uXbkK8yaYlCJ
 Kx9h4Lxe7ANTzKFmyh9qAs75agnsooWfEQI91HtYGGlpLQzZIqCgUDnzifyMmHVPbEsU4lNuuaN
 nTDCSzLRolRHk0Ypg15Y24h2iHSAHl4TOxwW1u0QXVMSelBNruGAS9AJZFMylF5JzA7JDsRYURO
 j70nykywF7sSv/ZLEvQ==
X-Proofpoint-GUID: vTPYO_5UfX4pZjSTDU1ki_zU4uF0p6LE
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a290ccf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=s_8-tX6kEDdiFPcoZCEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: vTPYO_5UfX4pZjSTDU1ki_zU4uF0p6LE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100065

Update the binding documentation to include the compatible string for
PMG1110 PMIC which is used on Maili platform.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..f42ba36373f2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,pmc8380-gpio
           - qcom,pmcx0102-gpio
           - qcom,pmd8028-gpio
+          - qcom,pmg1110-gpio
           - qcom,pmh0101-gpio
           - qcom,pmh0104-gpio
           - qcom,pmh0110-gpio
@@ -153,6 +154,7 @@ allOf:
               - qcom,pm8450-gpio
               - qcom,pm8916-gpio
               - qcom,pmd8028-gpio
+              - qcom,pmg1110-gpio
               - qcom,pmk8350-gpio
               - qcom,pmr735a-gpio
               - qcom,pmr735b-gpio
@@ -493,6 +495,7 @@ $defs:
                  - gpio1-gpio22 for pma8084
                  - gpio1-gpio14 for pmcx0102
                  - gpio1-gpio4 for pmd8028
+                 - gpio1-gpio4 for pmg1110
                  - gpio1-gpio18 for pmh0101
                  - gpio1-gpio8 for pmh0104
                  - gpio1-gpio14 for pmh0110

-- 
2.43.0

