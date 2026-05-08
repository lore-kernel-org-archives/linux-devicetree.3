Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD8332EC1
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 05:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218473; cv=none; b=Bd+Mh/qtT10oK11WsT1L9fUWt1e4q505vdh8CyEQILsJRxiHgT5eU98og8FElQMsd/Zcfmh0WhWQ2Y4545SjP2sVYvZW0T/m84ve8al4xm93a/D8VutUi4wfkZGukMaMhJj1pXFN+q2rAWEFoiIw7ZeqJSoGO1U9A4vaOhGbD+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218473; c=relaxed/simple;
	bh=pISyNZIuCFXRI/CniHWZu2oM98s7b3kt4arxfCTfhQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYvNyaIJ6Yzdoy2otZkXOlm+aZRjhabuA7gC2sEKhPnz5jx2sWvjRzsBpXzdZHTNrLb+rdwjn743l5KQ+H7kvSG+2bIaWXM1UAtCkPCQFSal45b/EUKT7eBpGYwkxzSOUYs9Z6L0ccE1Cj3/61b5DMQCz9SYZEXQw1TTY4jtp58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7gCElb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNYCmPpK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7gCElb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNYCmPpK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648224nG2384216
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 05:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqruoExKASOIObZge/m4GTc+sgArJrSylq6nzpIlxcM=; b=M7gCElb7OmmitbUt
	5YlhoxFn6TlDm0Y88XFLokyWvYP1petF+Ku3ykpDEgeDQ4JCGfmqc9n9H1fK3q64
	i8iSdHgR38daYOYNM4L0h1AN7k9X5mzjCQmALjhjG1oljEjGNThE0hWGhuEcrq1i
	ClIM9elUflw79bxjQIMOQwYc0wbPVDjBRzq3UYMT1vMJ9x5X55ZrLYE2iJovRQaO
	z/XnlwjZRGmo82j2msZcMTKasQHeqqZxiN1823cZFCHBHJsx+PnLuEvv9DcZ+ToP
	7vNqyA9KzgUhuzAUFgnfPZBRkgWNdP9N0SHvkLAoqEf9zTSP4H3or8gTyG/DYlce
	ZgZzjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujhgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 05:34:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2efc342ef15so2505255eec.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218470; x=1778823270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqruoExKASOIObZge/m4GTc+sgArJrSylq6nzpIlxcM=;
        b=HNYCmPpKJPudCkfrBHmqLs1YoMJE96YGVop46lnIsx9vKQykSLuXNagwQ05rPKJ4im
         V9j9aIeQfVUIyqSvDel+CaF+wkupqZyAcENCw+5AJuMox+ojtu9F/tSLWHcqGCI5YLye
         FkhktpO9REsSz+ZnD/k7a///8Znkx7DkuBQJPvHuWG0SjwdKuJ7PavwBNTn5FNK3io6g
         1xRearP8NZGuj4+0fdnP6uEHUMzhYmPB2ignN3c1F1iEEalZzqFkyrTbt5wn4jR2kaFL
         gCxKRExRCw9+vIrTapiBwZnVxI5febi47ZTFzR/xq7PWu4Yx8iC6UFwzCnCsfwjTX8Aw
         93Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218470; x=1778823270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RqruoExKASOIObZge/m4GTc+sgArJrSylq6nzpIlxcM=;
        b=S82qSXTMyaOAkPy3wQ7RO3Dnw3d9/WOkTeyygW9FQbbUqHS5ysbf0btriV98tVXd+x
         tVpeT5CLFTIntTb4IeTdRZtCPF4X/RavThMJUNXOFO7nPh9DO5M7a1J/TaTaO0w2VbMa
         qTJZ7T3gCfGdYZfEoqMeG48v5GU8ON8T8vI0YUsiixAwfgJJP7hQ1bhrNthgPy2oYHcb
         ogswV5M1j5lDuoWuruHmEnbtcHp7r3h0679dCEM/BhTX4h7yaWblx+9noUyOzDeFNwmH
         /jpwb3XwPWrM/IQVufL5rfmpPAHXkJkC0q62zs4ApQ6ZVaogSWDctYtJowkXEAhNaweZ
         o3cw==
X-Forwarded-Encrypted: i=1; AFNElJ/3Qod9OdmTQ2rdf5ERv3UjwDjGWCkv2DjwdDd4iA95mHVMIodH8pHfpRyn/n1gjHFk+PHyvJN75Xe9@vger.kernel.org
X-Gm-Message-State: AOJu0YwsbUdqizcJ8c85ywoszkVAn/Nea9nk0cYz77yvZC8fE4Ybwxo9
	w5ZTDoaQC2Iuwh+QAWHOQmIJBrt1ugXAU2lFo4uXboCx0+9igG6OFMQfb0sj3ZXOmJC75IbyGAj
	LtrKQnUqe0ka13jXpXYDbFt2q8hwSxCrXAT3+LfjciwNLCRXnE9v/4qB4D6ZeDg86
X-Gm-Gg: Acq92OHiqSXU1ptS5JevE1uoY+fF3QF5AoqR6yJPtGRxinj/wjbZpd0ppxlUYqTOglZ
	HFu7ZcQ9aFepsTB8E3y0EAafJeUcXU0Cs/EuAUnhwYilWWtmTq438hTqknZgC0M8LYO5ZooIMh6
	qz7qc/SKvyQCcylMV+BzzLuTdyijJloJmucL8d2y9FlznKsiC5BlHxUhjxDCGHaq3+dqPiz9XYQ
	jhbAX3LRrpf0jsiP1KWnyfazrtKTU76UPG8Mxl4ItqRamykvJYtaAzAmgjPHVm8bJA6SZFtstxx
	ss9WL8CY01mL8qoNNDwbeI3YR1kreCUUfyN4men0xS3IiY7tVxsUeIEpTIZ/sf0IWJtOmWwLI3w
	bHgA9R5nPtCyy8RNBgTyzWUWHfJthznyLXX7hmsXWGCzHZC9s/zaX6PR5nuoNPzoO0o5JmnYQz/
	zW/hLYj9iS
X-Received: by 2002:a05:7300:e82b:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2f54b897f52mr5444483eec.5.1778218470223;
        Thu, 07 May 2026 22:34:30 -0700 (PDT)
X-Received: by 2002:a05:7300:e82b:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2f54b897f52mr5444464eec.5.1778218469575;
        Thu, 07 May 2026 22:34:29 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:34:07 -0700
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom,pmic-gpio: Document PM8010
 GPIO support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pm8010_gpio-v1-1-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=1418;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=pISyNZIuCFXRI/CniHWZu2oM98s7b3kt4arxfCTfhQo=;
 b=U40Q9VrGLn9fOvNj7X0c3hC28kI9RKMw0q08SIAhZybrBs48+XsiJiM86BNPy/W4wCm8e61mE
 mEvVvlesejsBk3KIqRL3Qy+OppTp8KI9YMxZL0hXQyuOu/CBrfnd1XW
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: _17eemOeaGUgvObtgSPGMImNUcQOUWOb
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd75e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mgDomjQpAil9CXNVPgQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfXy50YqslKgtqI
 +hdg3i8h1X9h6lvF+LMWLUaXOUbCCMhk5Csu3STbx4/8+l6zDU1dQFGefyCCkG5cNPxuCzC9RQU
 oSlSFTfzfMvMtYvbT9qJwPtqIyy6GvhbmyJV3WN8e9zRMJ5ZQlSaDmhk0pEW++Fr3TvDObObxnF
 rSViWbeikTgrD6v6D48k3dGUOWmNvajtoXnJYobL8nvHH9X95ZSeHKIj1FW7DOykeUbn13FLZT9
 c93yH7xk/hkNNv/+H1BRe21DSrjPg+I1Pn7fccuOHmfjuN34J/Lhy5NaA3tsMk5X22Yd78y6wt5
 0iiccRchjuGT7lRDnF1jCX6VXaebwQyBSA2TW1LINiAvp9WE44LGe559cUhkjno2axG2NmsOGGm
 EcilkiotR4o5L5WKL6kmPmT6loRoZ8yVBYNlzb6qs45XcwzIRf5pXPDCIDsXD94XmQDprwWugAX
 jmMyFvui9KWxHoFmNRw==
X-Proofpoint-GUID: _17eemOeaGUgvObtgSPGMImNUcQOUWOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052

Update the binding documentation to include the compatible string for
PM8010 PMIC which has 2 GPIO modules.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..b8109e6c2a10 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,pm7550-gpio
           - qcom,pm7550ba-gpio
           - qcom,pm8005-gpio
+          - qcom,pm8010-gpio
           - qcom,pm8018-gpio
           - qcom,pm8019-gpio
           - qcom,pm8038-gpio
@@ -134,6 +135,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,pm8010-gpio
               - qcom,pmi8950-gpio
               - qcom,pmr735d-gpio
     then:
@@ -465,6 +467,7 @@ $defs:
                  - gpio1-gpio10 for pm7325
                  - gpio1-gpio8 for pm7550ba
                  - gpio1-gpio4 for pm8005
+                 - gpio1-gpio2 for pm8010
                  - gpio1-gpio6 for pm8018
                  - gpio1-gpio12 for pm8038
                  - gpio1-gpio40 for pm8058

-- 
2.43.0

