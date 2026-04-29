Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3F33FD139
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469204; cv=none; b=aOSkB3vwj4xaFCl31EY1RtZn+OPSIR8WKyw150o9+Szr8/E6BO2flwDAyB/dBntLt58PK3Vg0Mke4rxCS33c1zBSxMQS7GHQdHSTwjEBeWb/i0B2kaIOTCt5bVXxBamE2E8/9PUpU+etOToyUtGfHZoFu/Xr4FrnHofJ8F2Lf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469204; c=relaxed/simple;
	bh=Sa/LpuWZdla8uglyVNHfNA3S0et/3/tBB8VHSEA9BRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuRPg9AnKyoNapEXzNppRve/ad/r2vB5pzuNqfiec5WdKSWIXCqE+QfCQnqtRsVEnnPMAd3BJXDYKyxBxesgRl3xNVWgn28zaPhEnnK4aW55x8FqryB0lgoIxJIx5haApIjZMzayW1I+yMICp5x9Vckive6TiXDC4c2Un5udAh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5sjB3Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+sq6HKE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5sjB3Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+sq6HKE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pq2i1641530
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9uymofP5RshgT06+JOAscaukPzovafnkKbaYnIS8VNk=; b=P5sjB3Gg5U5bMNGM
	bV+M1vq2JWrF04a4jM1e0brpKR/+GzgW56XlpSDcVaairag09wBGmUqUcIXVkWmt
	VuJnJ0/ytCfbx7zi2KeCvE8LaVF2bLTYQSdjALA4K5IbjhNpmRikHjL/LwKIxHbZ
	ZfTaZ5DByd26Iq3x2SJ2vkrwKYLWOrcwn61DxO0kMm83kMrBErEeQMy7yPUaV7dJ
	M2UcVNGryc0Vb6p5UGB3fzGrt1DTPGADLjoFBzw9d2S8sCwC98NxqFRg6dyxiufL
	x4moi0+VT4Uw5wRsxajsJlt84AKMGbrTU4+WhLnofbLRJaE15isqd4aIgXdw1kPO
	tf7/PA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj81pm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:26:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so13180715a91.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469199; x=1778073999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uymofP5RshgT06+JOAscaukPzovafnkKbaYnIS8VNk=;
        b=i+sq6HKEgOkh4E/p1YOVGF4pfDtKjYU0i9SeOKiMQRfxdXYhjyx+pfWRBe5U7+WO38
         5cTTWCwUXjrxxj2iYsJZIqOAzqYgJe/2Amrg/zm6PjousVrgqSl8DIYrTPgksXYalX/n
         Ekv6TRSJrdPKNnBtxegxQGyVhqha/IAeCRqq4cAr6ZM5GEJz6H82eWyIjfIlUMHW6kpN
         5lKd1mwcZMt/ZpXI9A98TBW6NmkkerWtE8IbyIS8nVq37nSGOsa+NZmlj73AqJdyiuR1
         fG7+jW7qqL0I+sL28YR/xypxD7SsyITZMw8jF7kFxAtmfTizPTFMjN5IgXIh3KCmgbAm
         fppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469199; x=1778073999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9uymofP5RshgT06+JOAscaukPzovafnkKbaYnIS8VNk=;
        b=fJbmrZ/5ksC2WC6lC2JOwEI9HWulKmpvf0wxGq0e7YvkWSEP+TP4+f3DZ4Hs0F6p6L
         +Xe0DTSaLwX3vvhcX+E+G0o2baYOiR+WbIWPmS5qDIwFEfsDl3DojhzyPOUO+6+yo3B0
         iHvvc02b0UL6w7F0VJMW9dbiaBYfE6dyCZXphq9jrbtcD8PgzqHhUYeD2W1K1HUIWoMN
         Mt0zn5TKtubwB2EP2IAswxmX8wuaA1e9Zdzt1TkZ25pSqY5KqWferkN1NTZ/iw4fpQri
         t8st5K6YDvv0RRPaGk2qBBH+qXfy/0Zd7jwShMHzX8tUEoS3IxTJPFIGnD0Qja6hQ2qB
         I1Iw==
X-Forwarded-Encrypted: i=1; AFNElJ+bf9thhvcev8LIm48J3dVaePJJoXsnip0xvVjVQ4jIY+lUk5DdQBciC4nhViOolFESey3m9eK/GITT@vger.kernel.org
X-Gm-Message-State: AOJu0YyOdjFKU1YZ9wHWOdMs3+5GpYL5sjjXP2vRi3PSY3Kmrrqc9vNF
	o6c3bjybl1mFi708jfuTeaWLwxBFYU8ScKcgqRsBi8YjMnCBb5hARa0hw5UuFyby3IARNsEQjYb
	DO0qRMg5yuZoiCzRDCDXhRGUKqqvcaNRK5m9HKLtC7I9OyCsc911Fmguz+83zUe8=
X-Gm-Gg: AeBDiesPhg1Geg6SqqmaXzTm1bwU1efNrC/nWF2eN1bR7pPJZBdKWSfKyU+HYGzKtmU
	q7wRriH73JPbKU2LMAAhBMwLliWji51aw+gfvfNuvE2oOZk4GlZeKKuNIk9PBae8xJPuQds/QHi
	ds7KgPnQbNIYWTIW0M3VrNoFGi4Pv/RLDztC4rC5qa4nmpk0XMUk05R8XfhunNMAMInhAg6r7eO
	dy/tIRegSvwDL40Obd8ABZeb3NtDJ1nMS8aZZCZjZhtoH/lo3pASCQQvH7qVEkNFAn27P7foprm
	RjULb3Iz0E0tsMs4+zY9fTd094P71DTHeBsie3VQgXlUE6h55/xyYNjm8TsS1xSOLsqNdE753jl
	ZRc7LW9gdXzKkEMl7whoxilD2TJEREFxm9pETaFqpys3kNV+B9qqNKRQSh51UHw==
X-Received: by 2002:a17:90b:4fd1:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36491fbefbdmr8120889a91.10.1777469198906;
        Wed, 29 Apr 2026 06:26:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36491fbefbdmr8120855a91.10.1777469198408;
        Wed, 29 Apr 2026 06:26:38 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c5347sm3066513a91.9.2026.04.29.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:26:38 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:56:18 +0530
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,smd-rpm-regulator:
 Document PM8150 IC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_pm8150_regulators-v1-1-9879c0967cf0@oss.qualcomm.com>
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
In-Reply-To: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777469189; l=1450;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Sa/LpuWZdla8uglyVNHfNA3S0et/3/tBB8VHSEA9BRk=;
 b=PHI+khM9SHiGzKFKVDRsYAm6y2z2ZP5pgMUK6cr0lprh/16ij4HFCVCDndoJesyg4E4+ffjcY
 lg1jkph1vd4C/JTGf0aR2zWaUGH3AXb6yJyZtoxe7+6cz1BR3quaRG4
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: CwTMN4efi-KU72xfmGqd_kJEgk73t9fk
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f20710 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-lJ2cGRBeQHhQxfFtgkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CwTMN4efi-KU72xfmGqd_kJEgk73t9fk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNiBTYWx0ZWRfXzyaKleDxiRJV
 DlTQJrSdhOZQc/BvgRZ+jRy05Oy/h6J29ztbd21ihIPyWMeek5v9auhYB9X/dnY6xuXOFbNaKTB
 +CcZJ15vupUnxoadUUKEhMNjPAnyQskpnt3XW33HERLtYbVAlT2L84Fe1jlHBNXS+inowRqXzeT
 f4R5Zgf0iAjWkX0s8biKLiAI09d0hsppm11JxNawK2shJpG5KDr12PD2E9LrOkNj4C1eJb+pyAX
 LAoQ57AGjzVD1GzhYjaK3wXIcEDjb7GLjyzDSm5NKGPmk6+HT/bDXLEJOIiXCX+dWA4JbrfYNs1
 886kpJHdsffv2lzfu6N34o/WFnish+i8S6V7iPrh/ojRyAMJjoWCkKBsZWOnItmh7xt5XsYikwd
 suyLeq3yaCcevmYkf0wa6nMYKbHZXSqnMK1gIvpQwK9LfdfJBn/bQ6ds9QnG0aNtjcg+Ed4F8Rx
 eGroUNzkI9ziMydPhTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290136

Document the pm8150 compatible string and available regulators in
the QCOM SMD RPM regulator documentation.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index b7241ce975b961f2b5b0f8a42828f265ca50928d..0fa0db7eef23cf0f19920445b88409f5593220bf 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -35,6 +35,9 @@ description:
 
   For pm660l s1, s2, s3, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, bob
 
+  For pm8150, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, l1, l2, l3, l4, l5, l6,
+  l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18
+
   For pm8226, s1, s2, s3, s4, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10,
   l11, l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, l25,
   l26, l27, l28, lvs1
@@ -91,6 +94,7 @@ properties:
       - qcom,rpm-pm6125-regulators
       - qcom,rpm-pm660-regulators
       - qcom,rpm-pm660l-regulators
+      - qcom,rpm-pm8150-regulators
       - qcom,rpm-pm8226-regulators
       - qcom,rpm-pm8841-regulators
       - qcom,rpm-pm8909-regulators

-- 
2.34.1

