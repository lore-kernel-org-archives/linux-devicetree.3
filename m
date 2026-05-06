Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23461494A1B
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 16:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086294; cv=none; b=IXPAYXXNZYzeUbi7kMzrgR1a/utII319x/Y2+9VeNScLJakrLJvBYS6sqIIIM0hWXkTYOXjwvTVVswOdEop2RJd7DAiR6eQn8fBJjLq1v7S4kDwHw3vFnt7PwRaaU6GkB1Ed+Glt2/B2jLuMxQyyXhpbdfYkzeXqaBh61egy940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086294; c=relaxed/simple;
	bh=9nb2DIEgS9/ifsDNV/nljVe+IP9/uJNJciMsi2kStis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MN/HArY2VjyeJ/JhnypldWUehi7UG4kVh50c8DDbJXoBlJDwYQkN4c0q2J73/H52BvB43lcOy5Z6t5o0x3Z0IXQUFLlSSWEIcdvKddctQeD+x28YO03BVYB/nGmaqbox1RgJisBeT2m1X83pzMR2pnravGMqcy12fom4rTTm1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLbcff8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IqmwqOCU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLbcff8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IqmwqOCU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646FF6g0443144
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 16:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=; b=TLbcff8b87ai4LlF
	ZukXEO8Z6sCEquzkQMnBtEcTaKLO0CA1SmqiCqF2G+8QpLAqSvLbsHPQHu9sA8m6
	aEZWT5jIVSVmTErptCwFr9BRloUzTW1Ku2yILEVCITTCMEXsq3Lq+rdxoz+oMIBN
	aZGbh9svErduaDVCfR6dmtOMDweI2bIbjDNsmhAfdwfeta78vh4kWidvE7lNv9Tf
	YUQW1aYcMYK58zEpwesYGnGSSbsSTP8HmZmik6ucagp/KgXIznUlmBg4H5+tsCp5
	1qss52avi3ooMP7vHpFfU5eGnpeq4qZe39VAxKaPkdi4PVArEv4W3du9xVXXCMR8
	fWL1rA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299husk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 16:51:32 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so13522544c88.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086291; x=1778691091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=;
        b=IqmwqOCUFIWakoyPWvCMc2gNVqkGvDXmKDetLAWE+ZOp91ZrS6yFOkYKB86dBGnH7b
         MmTCeC/cLlTy26cp6VCDs1H2T8haIL87hV1PMBLVcpG+CEhrfuOKGI13KyEB15cpOuuV
         qfXzuuzU33ME7LNjdTySBT5DXhlHYnCJwgZWfy0YFsAwQzR0X7K0yeNLUHv6ORUih6Nn
         6+3zM8Mw3H25Qu85qG+OszxtW5B6yyPMhlzw5X43NRh1Wx/1vFC0xJBgiIhxINkV+iXC
         maUMbjTjkaJqS8OirjcyBZ7sthBgJGsDrigBIoPzKU0v2ckjSkbxI3C91BcYSGdvyh6W
         pa3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086291; x=1778691091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VBLVZuB0UsgPJBELr6HlVcHnxD6Ajqh3iC5M2T3ZrM=;
        b=eZGsKUgprE2nHQwY7AviV/6oInkg3T7qoeMSaOHbmzhu3X++Qt2qMutT0EO/7INzE5
         MiTvB4azY5SWOB/dOFW71+khl4tYXIE9DvEoBFz859ToA84vf7XMvOAL1Q6EJf4bkL7V
         v6TONCNsfEUb2s3L88j94TYvDr4AGenPeyDyCIdR9lT+W3yUl5p54SE68jAtROC3qLCy
         jw6rSxfoaHODvejXTmlD6tJCxMLLBj73EN86x/2Rhu2xhaYkLJqgNZWyP3zr5U415xv1
         n/H4m+BOE7BFFnkDbImV9N9Txl9+hBg84gxo/x1B6XDvKZ8vtGQOHuDDnoIpuJWls5Oz
         z/fw==
X-Forwarded-Encrypted: i=1; AFNElJ9+WnTfvTlM0oIVkDMa19sR4eaOLHeK8jkZfuqp0IeU/sowAKzlh37DYpKN2/nPweGcaoKOl1rzgQKd@vger.kernel.org
X-Gm-Message-State: AOJu0YxES09m7qXTji6jm2rjjph1XhsYOWILgFJCYASLylJnhDwULf/w
	0aMZhvYRFjAkLMQAaIjLJGbz0DLhljSzvb/59fa+mzmMNrKe701c+aeud1+brcPKHSu/LtanoAg
	Y1qT3RpK2SOTm/vqzm/tBIA/cCARbs6MN5dTooy1A6d0UHq4joOQwiM2UulrFS/il
X-Gm-Gg: AeBDies2cfZsX5dBuwOC3cv4uempsmT8QvcGFSmzXL4aG4nEDbJmzrIb4j/l81LQy35
	ZCtM0BFOFkW8LU/WAcnGnTzINJqbltbw7/9Ax3EcgM5DrOUNsM+EWkoArKRhFrhCXfZPfDraX2c
	MwJgICWAQlTus87D0BDmiUXvaHcSz05GmFkxbfdd1//z/GYsxRi2bLTBxgW0Bi4koaELs43HmLa
	346aXNOrqi3+ZP6pCarrZRXP16i3xgwnUf67UAVItWhTng4oCDsOrW/xWmff7iEAymvc6iKNZSk
	mwA0OWPKpnNctuH7Xm4HeRpkllxS67YObBeJAi+ZyO7ET5GGMsHrFBWHUL0oEFF9IpPMrnMvfoc
	6/b5/t3L2p8Scu33jUnNnWb7PaHat3WAvtsmkzSgy2/TghKoff873dqu0M/Rhnx+Jnjt4F39GuM
	L615s0EP8gucw=
X-Received: by 2002:a05:7022:fa8:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-1319d14d67dmr2296657c88.29.1778086291210;
        Wed, 06 May 2026 09:51:31 -0700 (PDT)
X-Received: by 2002:a05:7022:fa8:b0:12a:6b3c:de54 with SMTP id a92af1059eb24-1319d14d67dmr2296622c88.29.1778086290651;
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:30 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:40 -0700
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-1-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=1375;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=9nb2DIEgS9/ifsDNV/nljVe+IP9/uJNJciMsi2kStis=;
 b=cilCmQQeP71NThlAZoUGUm6R2LgngpsgVb/+EOZgaxEDE+wtaaLqw72LPz7peLPIP2VE/u7I4
 5pCYIaUFnmwCksuaZk0YEKVb0SlvaUqqliGwBGfBQQhlm8xxzvHu1gx
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb7194 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cY3P7eX-TFPFg106ArYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: _6r_VOiJqbuNK1LeKDA3O1ZBDowMvvSo
X-Proofpoint-GUID: _6r_VOiJqbuNK1LeKDA3O1ZBDowMvvSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfX72bMu9xQ4AeS
 ikn2ZpwDhEv8OReOkezlmu89Ln2EI1bILAJP8LD9jUoBGw3vywRsn5dyvF0VgQz4DxA/7fN5PxU
 FM70sumxH49JuWgk4/gnzWSIeqV+GkOvANeA0gHmlJpJBcNRSGYzbHfVJBw9y9NExC/f7CcL/TP
 w9Jgl9YAT/3oSKwO6iMJXTzP5/AR3bsmWiaFEUbWAwhJ2EI0PYAffVKd+kxAdYbYO47daOVufHC
 SxzVqK5XKi6XLcGFAR0nH2OzHVm+Dmt/iutKGt6J9I7CdtjwbrKYjRofeVKva0ypOXbVuck6xPl
 P2MG2rj43i9u8Ufp5LtEDE8EGMHN3ghHKMCoS6egvXF5FJ4KnbG/Igc6Hrp3p1pJxyEkpx7qHAN
 0FFcQURJkf4XZPdzvdNXkPDx3ZpE7dijWY7ST3sAOZc5ENRkoTmueMOJZYHwnAGsshbcj+SKiml
 zxsfxXX4AHdqFuA5gmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164

Update documentation for the RPMH clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a2c404a57981..d344b3386042 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
+      - qcom,hawi-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,nord-rpmh-clk
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 0a7d1be0d124..2d62d5d0b08d 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -33,5 +33,7 @@
 #define RPMH_HWKM_CLK				24
 #define RPMH_QLINK_CLK				25
 #define RPMH_QLINK_CLK_A			26
+#define RPMH_LN_BB_CLK4				27
+#define RPMH_LN_BB_CLK4_A			28
 
 #endif

-- 
2.34.1

