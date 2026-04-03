Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D925DB12
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 00:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177736; cv=none; b=iqr+n4QSkvZhmAkRnrIK5gV2fH3MIP68c2HtvfXZ9d5NU01qBsjGZl27i/2H3LJUSWM1JUCO1WeKBZ0BA+ZLXVuv2vZHG5LkdxZZpRzMexayfU4bgjCauVP+oL7+QBvIV8E/3amgJSJj7t6OXYGjZTJFLB7UvGkyNKrx7py9snE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177736; c=relaxed/simple;
	bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zv8ZqW7duOcsv/LZA1LSf+nQMzrHRNq/XSi/O07/v21C+f0KeyRK18iEnCCSre/c9/UHWI5lxRnJvWKLDHCKyLBohZLvZDWd6zp01BFRFtWx8e+jjzmENZepqxrg7R0CZHTc3XwKZ0G+mRzmJ6DFx3b9nNygBUn+SuM/MtLVrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsS8y6HD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLpKv8+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsS8y6HD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLpKv8+I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4mmf2528307
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 00:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=; b=DsS8y6HDOKNjt30o
	cr6feEdKADP/tip+iNXU/2wE8ahX1Ih1kKAO4yyTI852Ni/xcEevU1Y6HWhqiZLy
	HYCZqxRoc46T/t0lf79HkGsPluNdvAN3ryFkKlA14HzvOXh6AJcZdK2KdbXXDOvS
	80knjBcW0sAPILAvxg0DYTqU+WJqLSv5Nem7m2Kjf3YNV9rpXC/P6518+5CQ7K4Q
	hZdkuxxsjSCEGBD3/eWuMt7GiMOabrGWg3TC5R7vTc3lJDtwL5Vr6KWXe8Db8Ubs
	5fv2vGtahJHC2EZZ8wMLUTl4Piu8H/BMbZaYlBcDsBcN63vGjY/CI0UxLd+FfgDL
	CH7NTQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9txc9pje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:55:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1884800eec.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775177734; x=1775782534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=PLpKv8+IRNVMxJA3Yg0w82F37joU28TEqW4tPRvm8+EREs+4ja6HtL08dnWojG7vEZ
         uIW1PDuWAG4lzaYeLEavRmZcTHcbjsJUvRI4DVr/d43D2LPL0zawuhVP7BkSiit1q468
         vuQFCxGdCWYY1ZOSMoBcc+es+S9OipxbntaaVoO/6fp4sVxVZww7XHgDbPNRUe9XyFER
         l6OOzJKFzHQgTeP7TITMDZJyyE+8Gbbua10DAATQuHzS9+BAgGCpGquplISNcYTkf34g
         Px+dZp7ZNlLbAx3JytFMjuIf19Si/z3tQPYBEEMTE+Zu9+CBWmA7I35U2WEZnuCAAAwG
         Buzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177734; x=1775782534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=UTYyZKfIjW+hT4rJbQLFoNA6lEaY8+NlPfqslb1/eJDJp5bpYgQNVZkRZBNmt7PQmN
         e4GIJj70Xjxb8v2PWRik0GJF2RTXXqvHOlj5JoxS9SarBD9MJWLIg2vYg0DsJ9Yh9dYS
         2GojyfE58E/+a6HMVltQqE8+kWAuezgUXd3AtbPgi6mRGVIPJGktCbFOCDp5JjlIKCbD
         ZUh8L9pOwf/JZLNeOa1A8BAN61+hAva2ogAq1rqRcD2MqiItb1WMDA8dX57TTFqDGXDf
         bF/ZUhaEIWFRvOCH9+eZchhllILI1AbHUYykm1S872rrbfCL+4nUrDa0UFLqKpPbsvBs
         OW5g==
X-Forwarded-Encrypted: i=1; AJvYcCWXyZo65DNVwn/ECLfpPy2bR9wVnA5lss8GNOoyn17V+tj+vUjGtykeN2edOaVUZK4h8uEsMM3NDDnL@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrSfMbt1QwURdb2nBef3g5JYCSwoXPdZiMb/uF3vabsKZHTGD
	EQWR9hB6zCxtrtpUgR8IAKcg4EH9QkBYpTC8jVdR5V9JP4YRB6YLr4vc48iMmRJI5QYUtjvpKcW
	8bScjZbImTyj7G2enG27qcaE8WLvTGLCs0Ma+ry/kTsrlzVvFLQ1+gqz/cKWyavUw
X-Gm-Gg: AeBDiesB0+aIdPlKyLs4t+ak6yO17tVzbt0YGrO/hsiG6Zlc7HwAWq3RcTYohrF9l6M
	0gag1nbjas7tC83ynwUzpVml9Gbvd3Ujsk6GG39oesZOUb2u57NAC5h3zLF2GrWH1249FEPT5hF
	xmReMIGcIxhcBUVL4JtOSWPnFnxF5FL0jLj7dEDS8VtMsAygQqFWhLL4r144d1Lfvs/GLd4AFd4
	zx6jkXgf3pElq2pHmgSDuIJKlB0WKWbaB7OnWhjaRhKKmqxIvgnf2RvgjEedX4DPqvYxglP6q/c
	jtSDLbDIerDfWcYkVzHXIICGbio85z7jJQWvPeEA8XQSnn59hTwiEG3Ya2zfjrZfxdgti0WUw15
	HgMc4iuoux/ESHdFqkUyi6SOrmNujd5rYgcA1DWJqolAlAmp4LkLLswxQ8RQ+PGQoCbi4qqU9mA
	==
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr646939eec.3.1775177733753;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr646929eec.3.1775177733228;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm3750800eec.25.2026.04.02.17.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:55:32 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:55:11 -0700
Subject: [PATCH v2 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Hawi SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-hawi-spmi-v2-1-0bbe811fe3f4@oss.qualcomm.com>
References: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
In-Reply-To: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775177731; l=1247;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
 b=8tUP/lj5kIW5Qx1PtF2E2NkQKOnkUUclvEoipxhnLMFNRTNqygE+3e2VF2k2doUJfN25msUuX
 iFiCmpXNq4JAuoKcU6r1TBJ/oieI7VaDMLBSw9tev6bwE47hyVYrI/R
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: qoB0T4qAMvfKs92KsRRA9JSXbMtD-6Ue
X-Proofpoint-ORIG-GUID: qoB0T4qAMvfKs92KsRRA9JSXbMtD-6Ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwNiBTYWx0ZWRfX1cco3M06QFcv
 EPIZskCOofHm+w0vJY21KB+f3x4YfctY4WhpIEnFYA0A4eh6MWRuMyRqmSK0TFjH4lb4Ah08Up+
 +tR6sn29UTta+9obdi3hFusE37QgH2FhQVfccJsYjhVxU2BPPnm3mJ3osgbX65MezkLT1LCex5t
 6RnP7aP+2WQYvRGhdxaoUorikoeBs4hvRqo4uWVwxxPwgVjWC+WSVsFUBotHX18pU1C5FlHW+0Z
 tgdhR/NW2tyywOhsmeAOcB66megG2aytpuxiz8tWEt1jSPxXD5IxUtZa+XYrXeA5J+mHGZNxfnK
 rurclcB0kKZe2aV8Msd+sgYTLTGWKA44d7KuKVsdrRILT5gvMxgx+JTLFQ5HGvM5fzULxw6P+Yf
 CW/JqeHMm+Or4/LKugTt8K/BWvQ6uIYqgon8l4okvXcJyi8VOTlE0ES0nhHVrzj/DqQ/YF27EEm
 vUcJ+r75ZOcMJKv51kw==
X-Authority-Analysis: v=2.4 cv=HKXO14tv c=1 sm=1 tr=0 ts=69cf1006 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PsuS8QLcD5ISLKS92A8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030006

The PMIC arbiter in the Qualcomm Hawi SoC is version v8.5, which
introduces parity and CRC checks for data received from the PMIC,
as well as NACK checks for command sequences except for read.
All other features in PMIC arbiter remain the same as the one in
the Qualcomm Glymur SoC, with the only differences being some
additional error status checks.

Therefore, add a string for "qcom,hawi-spmi-pmic-arb" as a compatible
entry for "qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 3b5005b96c6d..1593a1183a36 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:

-- 
2.43.0

