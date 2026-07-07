Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49E41F7C2
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431387; cv=none; b=D5n21akaLbUgzQ0nLggpjtiPfFz7bzxkUis2QdrMhwQy+sz+5fMtMEAOym9VmT0XsxhT1NMrzoC3U+ue2ZyYqYLhKhJS1BCaFYGX7+mj11GBTDRstB32bVqXUE9yh52DIT78LLVeKWdYm6amwBkmsPDf2T5p0HKo65X966RJm2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431387; c=relaxed/simple;
	bh=Alnhyse0RQd39vex20gZgJKJR4kmGM195sWvR+fe8RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlcqJ22LVAb9hFk/CXERTittjdPNXRt4CQpar2XmHNvTlzykkvfOwhvZyZdyNB1u899xEaDmN7brbH26rg4POh4go7YQyXe82jjU/x6uBEDeFn2lXy51/pIM8AmtWf9Mty5IoRgFraft3UgNJmV+Sk/wXd01qAs8ze3nEEuLvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuKxIRJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gHs1aMmv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuKxIRJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gHs1aMmv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8swK3676417
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	leLUisrQGv/CBLm17Ajf00RHu0U34YH0lxC22eUx6kE=; b=fuKxIRJItmofEKH5
	hJZvlCdj6EJ1ISycg34HMDNPaEI3zcXhcptTONK6Vv/zahNaBKs/VODJnWdedOn/
	y+LIALIRURRLiB0TCKL5utsnljkFmL3FRxnj/NVl1wRcspC9kp/qZm6rBQ3oQK+t
	WhHTLHIUX51W6RPN6GMCeFQMVD/IsHIef/a3nswYQfLUbk59eF91sNblmwfHW2dn
	i20a+glDQ5XrF4ihZRkX9WSfOG/ZoooW+CPxUYFaAn+t/QJbQcRsfietWgZjjCdy
	5zwXOuStsqlvmSvEXjy9eykEGI/qCmMivs/YdKYzYm29uNmTwspXSkCaYDjZfIsj
	j6J93w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15a7cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:36:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so51973681cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431384; x=1784036184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=leLUisrQGv/CBLm17Ajf00RHu0U34YH0lxC22eUx6kE=;
        b=gHs1aMmvxorWydAPT7XXMCSl8nwoLaT8NrCu+dtm5dXG5TseCME8rFp1UruxzBUbAi
         SVgfSxIA1cczOeZkxq+B4/yKJ4SLEPwSMWm9R0BO4ERleaxpL21Qtk8PHLQ1IUYvOXLI
         HExnzr+58F7lxTfK5M/l/Nd+2fwLC+Q8ovoHrshUMscSE5SlTfOT0NDnQnJY0kiM09ih
         z241niLHJOIT1fQz8cHDvkP9G+rIWewTYgY4lHKHlv3WDQwEUFkGIBHio53j68lh2918
         dDA7AYm05z0ZIEFrogK7ZGnk0gcnzDP1h92eyZ4SKbDIcPmcYcvfhacCAHUyZkOaI636
         fUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431384; x=1784036184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=leLUisrQGv/CBLm17Ajf00RHu0U34YH0lxC22eUx6kE=;
        b=gssQTfITe5jS6zTRBrMeetUQBgLaXHrk0F10RyDVC2wGqnVJtgIx3W6wILhboXxVu9
         1IY36jrM+lxpt3k+6BxekhWVxbCN/XJ9y5UmbMR23dfRVrIBvF7gLDs5fOkm+T4LIuLR
         nuyz0WAcL7sg7uNxm7xMj3UOXEML7odS2jqD2ox6qEeP1NfjQL/imxFeOU0yiec9+rJX
         /JQzAwlJ0F9FkdwvyOFkHRU6AdygQGs8Xzd2/923mqP/ps1khMsBsF3CtEbl7lKqmD0t
         +h1vXAXJZY+khLvPo6Sbb7cENpIPvZj8WlCT+SzfOZFC06ZhjwIVCgEXK6Bu+/BXTa37
         v/AQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgP++dXvwx9SQIgtMAD5F2soBlwnRXO+VbultsbxFkgCWU3CG0NOqBPi2KeQ3cH8FmA5BT1nDUMtMx@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1RGBEYQTKzW5e5e0VeL07THN1VJTWuJcxcbyQ4sJW8FqP2GB
	XRIEdykvxV112uts3qjJdL/9ylOJtgywIVePdM6R3hn3U0A5in75XXxfAG183NaymbCHh4hMMkM
	fzAr+4jcdiMlTt1lYczdapn7PqIJY3yvlOMwI6rKlxMcb1OLqJBYk/qpUGVgq7tmN
X-Gm-Gg: AfdE7ckPnSq3cpBjJX6KWSZZ2yitL+YFchVTpsyB2FEGKMPr1F6D7YhXav9SlENBYKQ
	s2eOPXZDweKSYEf+rl6KKgA0RBAL+2xpjYgYbtsgeTWOCDppzV6YEEmsLGBG8myTbpheTf2PPDa
	MDxYSknMSrPHD2G+Bg2XIP97uL7AyHUSw9kgQpNYRlNNCoLe+1Q0onZyAmzjsdoS0Qftid5ADjN
	V5FbysfcA9C1DNDMKFgNqXBlq7hAkCIaZLzFvz05xNAdJ4c3jom9mjdvN6tm/q//dkAg/DrOPdN
	4wc1hHb6r7FoFyMCkUzwdPYzUGPaGXmOlxna0g6v2MQJIJ21DTLKuP1Eh0TOC5T6M7KgBiPUJ6a
	tXI4Wj3wBo1YMAxszoWpXygDBqh8J6QnCCOY=
X-Received: by 2002:a05:622a:487:b0:51a:8c9c:7f52 with SMTP id d75a77b69052e-51c748dfd67mr53539991cf.69.1783431383909;
        Tue, 07 Jul 2026 06:36:23 -0700 (PDT)
X-Received: by 2002:a05:622a:487:b0:51a:8c9c:7f52 with SMTP id d75a77b69052e-51c748dfd67mr53539451cf.69.1783431383387;
        Tue, 07 Jul 2026 06:36:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm34258187f8f.22.2026.07.07.06.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:36:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 15:36:02 +0200
Subject: [PATCH v2 4/4] dt-bindings: arm: qcom-soc: Allow WSA88xx speaker
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com>
References: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
In-Reply-To: <20260707-dt-bindings-qcom-soc-naming-v2-0-1b7d695be2e1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Alnhyse0RQd39vex20gZgJKJR4kmGM195sWvR+fe8RE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTQDKa9/McfhgHEAf+92ts1AnmYPjXyFKbRtAx
 yflO9EY4tmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak0AygAKCRDBN2bmhouD
 11duD/9cWiPR6DbLDYU6ngKngxMn+IplCI0ewwvnDp1XojF3k+Qj0j4rRJeP4XgrJQEQo5syWNI
 Lt1juQPz8qmXV3i6dAD4rCjQm541mlMWwLMKgF6AYPq+ZtjbkcUMA8AdQnBQQxo/vUW+N2PUDqt
 U1ccWtrXd/Fu/O1eREP1S8rYfDHjeLtXS2jTVe0CiTRWwf69Hw28boqHDRWLHW3H6uNUhHIOb+G
 lOduiupRJUWJtdwxxhbxRvCHOztBHPJv167Fs7XxaTlC/0rugTBEX2hNmOtnJPPaoNtks6E/cU2
 o0nc7clcsuMxkQIfu3oqhWAny55D78Ik22TxdNKinvVYiucdlNAgrX8s3sGBX9bp/IprioHb5zf
 yewrEfg4y31lj8wXBkcutCyU01oVNoYKqNUgm/wmr4afY2oe2ZfdBCbfqoP9TckGjU9cUpKwZPG
 ojnEZyqefYbXAWJdZ8OM6SsNCHG+nQhn7URSV25g3gjAKZ6m1ewhw2SGED+d6FaN53/rKDjTqEk
 lPOEuLg5nTmhlgz+D94H2JfQqFG4mM/3RMfoTvhlMXzxRqCGCUesDgWDXENQEUgCDMY14UOEFov
 u/Q8xdyc7T22KvURGXWBidN0pbkJQAfyB0sb3blzxAxln5jFqX3qEKBFq4kjXC+1aSFu9qF7q/C
 FFfb0GWCGzBYw9A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: F87CqUhCjtn_s1yaBsxNq56cMsgACWya
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4d00d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_rAPsDrPz3teXUbocaUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: F87CqUhCjtn_s1yaBsxNq56cMsgACWya
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX65MYeoE4DX8o
 zWVVJiScez3aeOnWA/N6zyIere5KY8a8byF0eX9SwZk7TEtZjzEH9CW9VsJjPkpo+Ws1nVDp1bB
 Q9mA/5+04kcE5Ve/pUjueeHiW4FOlj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX4REmmz+ceBJp
 Syz0UDwk3YpK1FG7B0xv7JpgNEwJ7vEdkwoAmUPF/yAENzZ0DWs5WSa1yT/VzMH7Lm/xoPyuALp
 8efcX0ZNf8OkkVmV9vPTW0bl0EBcV5WAb/cRW7TGba+JD9FBCl3lJsNgO4QfaqJP88LhBK9ZyYB
 1WT85471LcHSEGBCklokMr6k9RghlcSWXOimtVDhfYTm9MesRNNJpG0zLDLq85k12Yp66bxDBfg
 TUAX2jQwQBHYIA2rP3l1u/8S/p5txN9Z93jiflzmGVErP0/0FT58V8qHE7MpKparojAcD3IC77q
 gO1nrkLn6l+NPy+sOm3f7qCtMNX+XyE61fwA9ZG8GgnpU5abvmU3eb0MEkD6ajxomiUz54+3CvP
 YdiMMmoxuQBoz43joP3/jI8zFMhTgQx3MgzwUvF3amyb/fKgpudI3EbBWAJxjUo+rn/RYFYo/Qx
 kZwN4utu1M9YuICE5wA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

One selects in this schema captures "^qcom,.*sa[0-9]+.*$" compatibles,
because there are SAxxxx Qualcomm SoCs.  Unfortunately there is also
WSA8810 and WSA8855 I2C speakers, so they need listing too.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

https://lore.kernel.org/all/20250522-rb2_audio_v3-v3-3-9eeb08cab9dc@linaro.org/
https://lore.kernel.org/all/20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index ffdaff073c92..d8806f6c596b 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -110,6 +110,10 @@ properties:
         # Schema matches also sound card nodes and its front compatibles can be anything
         - pattern: "^.*,.*sndcard$"
 
+        # In general non-SoC Qualcomm devices do not need to be listed here,
+        # however in a few cases they got selected by patterns in "select":
+        - pattern: "^qcom,wsa[0-9]+$"
+
         # List all used generic fallbacks. The list can grow, but in practice
         # it is not expected, because specific compatibles are preferred for
         # fallbacks as well.

-- 
2.53.0

