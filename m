Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B1D3C9ED6
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775048138; cv=none; b=Thzv9MJYVJGV89MyH+7tShBT+/D9kjML3j3NrfNaZ18MA3BnpvOciga3Xi2aTlMI7yIPj8RiqRSZYvrTzysW4Og9NMUjoDdHQzoi65sTnCxC5O75OCzHNWbBmiLZX4NLoBcknFTtSQN0drLH9MjSdchrLIjQfWN4Y4vqM4Q0F88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775048138; c=relaxed/simple;
	bh=wbPPDP/vdVBG+sLNMEEaaJ6pDo/7RKpIwMyfWe0punY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/krZmXNRTlhZRBshfxhgqHqOE+3b0rq9D91+kWg6g72z6WgUmdXvE2qN9h122Ixh+P0UnnALYCjdITj3ZG6Za9Dq6ZoPiAT+s4/YCDfY/w1nHXtVlXSaLYQFYUQwJjeXKl7OKkkCo7TslvndhsH4g914usgJf3T+qnSReaaOsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhrusMq7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=URcA8zDL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhrusMq7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="URcA8zDL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318vFbs1459443
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 12:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wGd+2+4WmnGiGVABG2bgBzlIkSokuv3pKsy
	4d6mLD3U=; b=ZhrusMq7B9KwmMomiaz91kSwWI5zUnLIcSke/bxVguSxzhDbPNI
	KElmTpBLw15XO9Qnjc2vGBuHM5MC9/XrWGlMx+m3e8k3JikGf6pzTQa2d3ENINsA
	COp83zXLv9D8SDRwk35j4kprw2XwCFPN7ibUOnWBTRpbV+zmUV0uQPHpQWkfTykJ
	hbLlpB2vYoxu0rQIBAVrNEVOXgg5WpC0JbQgSIlzsDndnGtewDy6v0gNCBAZdgdr
	G2XFRlGkBCUSbMBIqaY1kDdKHP5Qfo/oB48Mb8uQQBfqhdxlwp8hw8eCDJf36uym
	roQZ5Uj1vaIc75oL7OqTW8QJ3HBOYFwJhIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg2a7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 12:55:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so39754235ad.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 05:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775048136; x=1775652936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGd+2+4WmnGiGVABG2bgBzlIkSokuv3pKsy4d6mLD3U=;
        b=URcA8zDLG3ST+ke0htj8EsewSlk1tW0jspqr/loZk1SXvu41euja1Ckg0q5qXxZvf5
         A45EV9Qwh8bYkR/yAyHi2BfFClFfizoJsyHE09kMcX17cuy1sAtlE7Y0E5SOC8/+T7ky
         Tio+E8SDzeoFZvuknyKTHmMFxgFvD29zei+bgaK/e/gz77Dk+weQv+dOTKYZmWC4D7bP
         5xBKFMZpH8h2IDgBfImeTY8jwl2HXBSdaAS+koUj6aA6RHhmJJFTRM7Ob4YWrWCpxIUi
         cGxqr6CawD+vdPg/AcliR/xsI9W8qcWbjqBeKqC+ZhcGEmRRbjBnDgxVCHMqrx6cuCmF
         wpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775048136; x=1775652936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGd+2+4WmnGiGVABG2bgBzlIkSokuv3pKsy4d6mLD3U=;
        b=l1fzntEv5vyRIC13erecfsWBSVTAh7lgs6T3GiJQ6wrJUKdFKEH9/dS7Eq1Tx73vr0
         vkIXn6/MGZAae0+cpo7OdXJTr+w9gAXkVwmJ9iE+uR+M7WFpPNflcb+RegyKCMTp9QBw
         6KYZmmrKQDHBg4fU6/TH3+Czjgnc7VOffZvAH0ognJ9Ph+VLH0OvkGkhOxeEsPtfuAB7
         HVg3VNrikQ02nFMP9VLHbT5ixMqtSoVYJtztOyX9dcg+fNTdkOLn0M8p8by5AgwKQVTF
         XgzRi3Z45ZDS1BjaRi92eiXy9K9EJRH/q4NEqnI+GzZKuAy4VeqWPUbkZ72+zhQWvV9y
         gcVg==
X-Gm-Message-State: AOJu0YzlNzO/LQtAyjy3ruwJb6dOuxPo5S/hMurohPLpcQgh8s8+8gUW
	gx73IJtphels1YnS6PWAs1A++2cJqONxbS6PDJBQLzINQA0a2Wl95m/UH/SUUXxamAEo6Dp3EuO
	DFAKAmgzJZC8P5VBy2J4lyPy2MOH6xXKKfMAHlqtJ+R8x4vRPL8SEYget0ZvQS1mH
X-Gm-Gg: ATEYQzx/k+9iBt+esB9OFOCTvfhB3rW/tZktZFmeK0dPWufKhi4xGBBSRnL70XqGbLC
	zf0buA+Te2dIY331fak1nF5IMchac1wCm+Nqm/Su1Xh1WjtOX78H8i5hFIrZsbKqiwsJh9tmJWK
	qlOHYnNWttVJWAQpr11wzo++l20zsyNpGmXebSJf4+wnIpgFyorcsfMLsRBYHtS0iQtlnGL+ol+
	6MhS3110T9xoxrFVdxO/qww6gvtPkHp63aJTMH8zhRKp2bzh+TfhWP8EWA6czxt+V1ghqKiJ4Sw
	0XWf+wJccIo8UvEWHTWWr/m42+owkPqFts+78JixV6uVZZkglVFVX2jBqbvF1bJpXeHhDksfUI4
	W3dDi6fUjXNS/9be2jsQJnbDhSj/zOJ9WDw9gZ8y3lKGo0Z8e
X-Received: by 2002:a17:902:bd81:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b269c42a43mr24476555ad.25.1775048135785;
        Wed, 01 Apr 2026 05:55:35 -0700 (PDT)
X-Received: by 2002:a17:902:bd81:b0:2ae:4a4e:1e25 with SMTP id d9443c01a7336-2b269c42a43mr24476275ad.25.1775048135180;
        Wed, 01 Apr 2026 05:55:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242787bc7sm153862025ad.59.2026.04.01.05.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:55:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: sram: Document qcom,hawi-imem compatible
Date: Wed,  1 Apr 2026 18:25:28 +0530
Message-ID: <20260401125528.594108-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyMCBTYWx0ZWRfX/WhI8SsXEr+U
 HDEgNqGuPOSHw4uSHPCin2uuE/FTXGR0ug2CZ2DPuE+NrKP3GLukmYrVSztHNHgIAH0Qb24xRAx
 Qn2F1/w1zciGUeJ4ar13e79RhJgUA1TvslHHfrXQM5PHDaaQs2SWda7IamemQDSw0WM7LxWumPL
 /AO9qEWu9ShtNLgGtY2Cxfn6qALVwxi34YRPYe8gVN4Zu+oMx7yk9MvbXjbUQ1++sSzRJ3zkiFv
 WJWaZOcFJq46UKR0vPROo2KQy53usa+bNrpqO+Ismp0gxEdI6WKU1tP+7o9UNFIqitMh7ss6DY6
 bX1bH4uIZAc7WKSQmzdV9KcVD2q2Bi7HNzr0ic0x4piNjTLVF1CYsM+BP9xrRXSHD+XpATYOlAG
 u4txE57bKRhxRNPptlbmKA9R/Thqzb46OagothzDEg2SSQoS7Gyk4STb+3k+reQ0cf4puAOfInN
 +agC9wZSVYU0C7vgisA==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cd15c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PXCVJtlvcWjSRFvF9W8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: h7W7VFcLh6PRmENfdtN2SuLobrdW05O4
X-Proofpoint-ORIG-GUID: h7W7VFcLh6PRmENfdtN2SuLobrdW05O4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010120

On Qualcomm Hawi platform, IMEM is a block of SRAM shared across
multiple IP blocks which can fall back to "mmio-sram". Document
its compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c8..9bf042f392b5 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,hawi-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
-- 
2.53.0

