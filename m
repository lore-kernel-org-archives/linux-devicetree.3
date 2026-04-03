Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A07C261B71
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176579; cv=none; b=Ds8c8hFqaOj+XIgahIT0JU2WyA2qGsatS5fG65j0lsNiWqcTWTSSxKSIgHMrkSw25heaPP17oP0yGAXuWyhygpVHjYnkHJR+3ziobahIRFdyO9d+4aIvAfPuT7zh2ItdTzHqBc03FGSJveYCCZc5FByo/vfXjfeGjgD9N3hJj5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176579; c=relaxed/simple;
	bh=RpiDGkJOR1Okpis1o/oRcRN55/N3YkysXuZaJy2F9x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7v1f/fplrg6TjlX0U9qn9G0uRxKHet8qtOdulEISCZXzrDWzbwIu1R1cayn4Fbo/CLqqEAkTPFdSUoI5K6jdS5u8tzFgk20GDByPGCAvX74Cg2BfZV/caHzzD0ZvUZup1lzohmSa3QnmCCfc5zWszyTbk1o9xucLdUJfDKOkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/+rg6GG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEcCECgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/+rg6GG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aEcCECgJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4Qho1380439
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 00:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4QnKBqRJ8Pxlp5wm0lmApGHFXTpwJPHSwOx0pf0DVY8=; b=l/+rg6GGMyR52NwQ
	VMVb2/fctF4G91zT908S+dhIIZC/12ez/pi8/bmthsjhwKjk1hldmOesKWDOZbMT
	tF012LbTRptjCoebRLa2APTwqy+a27grdvTZytLn70qdxo6nfwDY04tt9BJz1rJ9
	QSGjh9DA5VbHNsf6z0ZVWpv76T8ywBaM4J2+kTMDgGtz5zJDKBgVstspFXe8crjx
	Zluao3fwGvu2Qw6ZaUq9OXE4EhZw1gufCrcpC0qqYR1KkKipP2q+eL/qPvxnAgV4
	trbRoUovr+sxRvqLDQ6xRGiEQOlLGIAkv8S22QKKuy6uLcadKNJFXLQYY9xuaQa/
	WRdchQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myhb9k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:36:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12bf9974587so1099999c88.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 17:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176577; x=1775781377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QnKBqRJ8Pxlp5wm0lmApGHFXTpwJPHSwOx0pf0DVY8=;
        b=aEcCECgJ90UVf9rtqpOXucfpfmCWJcGRlc8uJqX8DpIqMBUp0uajQqSYFjZcCQm7B/
         84fQY6tyVF35dLtrjUTcKsrvQyYj89akMV/3mZ5c3LW02o8msonsRCLv5m21o5GIcUBh
         nHUkRCOj9IgWD0SlBNsBLK9RWSsbIhUEWPW9g8InNWC9RINmOe2Hh30IBvmI5IKmzhrl
         iGox3am8REoFSMQ0v5+J7RN5vvGI/EwxUajV3UTs1Ye+6j+64gpiX07FlHKX8Vnn5Z3n
         TJua9cKUj2Yn966CVaa4XMVibUlcC4urWhvMjf9Y0DcZGehdvQ+3ZSlly7M6Rr1iWwy3
         lmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176577; x=1775781377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QnKBqRJ8Pxlp5wm0lmApGHFXTpwJPHSwOx0pf0DVY8=;
        b=PsQT9jPHP+1bPB6GOKmYA70OsbHqIpUk4kPYmm74FpSmkuOl0I5aNLDzb2JR1r9eUL
         jfZcq/V22zHJFoefoaSKIYGdz15fGvisvubrPGTuYAMW7CnmlO5Vx8xS7xSiKwNes0/x
         cVNRIhLKOXFGZ9WH1IColVGIfVp5sGyyM3ohVyAOrvVH+pJS9Be+PLtq+WIV5zaLYh7G
         +6Wowr9iLUjzdoJYYfkDiiyG59IqE6HqG42IP8ncsuUeBDVJCEqlLeOHNgtvLFooFjWb
         90nVmUBtaWCzW5HFnNJXWlDKAF7n9NTr8bzTzYlSmuoglPb54w6/rY1H7Ed9aMzuQkBC
         fmrw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Y+nFTWJzV0R8KGMAjiaHOHUtecXT6TkWpq7Agmb2m9WP74RTOXECPsxBMAVIh5VgHoXSZ8qB+CdJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyriBFRnQ1s0iZp/j/0q3Edgl1xCl7kjNAv/hGkqxUqqC5nxXjf
	mQfVan4bWLiz3cZRmZPgsHPHirwuPJ6kSzlzoDWEWc1/eo2cSxxxkV8NXmNr8UJN5ejvsJBkVVz
	WWfplVuSVx7AoZqFKauAzYL6hLRIzn8LSqxO4RA27+HrUyGiKFwIszmEKJ21eA++z
X-Gm-Gg: ATEYQzzgc1Rukcm41spIx2LpgT6Is1uxTFwS59gKOmmBrM9Bam9jqComdTpeGwvopbm
	zIZtYGw1pxlpWbCUFZ8Ic2gAV/fJb4Du8rVHv44fivp0fknsKysBNeWHQgLwNtlQ7enZZTuEuoP
	MNiTlhK+W7uHyNK6R/DLIZsvieJfhhTakyZ6nXnnfjeyUKfaK4WuzS2N/x7yHToHP/he91p0AeA
	d33h2muuMZsgNsQBEQZC5vmlPz0alkzv7pJPNESK7R6/aVKrZeMcerXrQRHuvislOPM3NYvxQw+
	v7AEbmi3CVEiyeG7jQlWIBiut9wH5XHYqvIgnWRZSyWLTYou1wYp97ixXxwnYmR90Fcymb2LSlL
	BRoiek8hbKud70VaUPVtcwpKnsAvA9snVIwGD9n9p84BOFZz36sJFyDTLzXnh8Mf8rBs/yHakRg
	==
X-Received: by 2002:a05:7022:41a3:b0:12a:72af:83d4 with SMTP id a92af1059eb24-12bfb6ebbd0mr555503c88.8.1775176576740;
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
X-Received: by 2002:a05:7022:41a3:b0:12a:72af:83d4 with SMTP id a92af1059eb24-12bfb6ebbd0mr555485c88.8.1775176576142;
        Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm6290550c88.0.2026.04.02.17.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:35:21 -0700
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmhpd: Add RPMh power
 domain for Hawi SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-haw-rpmhpd-v2-1-2bce0767f2ca@oss.qualcomm.com>
References: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
In-Reply-To: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775176574; l=3267;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=RpiDGkJOR1Okpis1o/oRcRN55/N3YkysXuZaJy2F9x0=;
 b=w5vWo17PutDYOzx+dGXZzF9z8xU0BVO9E5tXb9ITVIpTEQz+ZzR3Lqnn2ml0Nl9FTrhKG/30X
 Q4OPX6eB9tcD4/taBHXjWirbQYaqCLrulk9V228Ks+tY+Tlc1dm+ki/
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: COx1WEGGQd6T8tgDFZMZM8sowsweMvEh
X-Proofpoint-ORIG-GUID: COx1WEGGQd6T8tgDFZMZM8sowsweMvEh
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69cf0b81 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j-8-n3vk8KpYigB0PxMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMyBTYWx0ZWRfXyPlx3igfJnaq
 o6S6YVdcdlQugsY9mL+9SU29/bWH9IDaLE6ifiv45ssMqhq9za65jQUNgAteVS2HnJOnFxfBH9S
 ba5u77zhjla3aaFjKcyb+9T1wohBU057Tc5MQYXTBd8tSihvoqB0E1Hmw/Pl0lKPWwxr0hG7ytQ
 6rSqRDI3G2GoTnuEWDFzv9RZtX8PQz+jC/OokQHar3Oov4CYiZWRSIYwSnzB8uhqVbcXFw1LBg0
 uQXyRvD3j5Mt4Rx6mE0umecBjcNNTyGW23Gl2VpltyYtc7w6UIawtn30RxtomoDkSU+xaAu2ntd
 Ppv72hpbKeYRKjPvamcMA9tKToqP4yLvdD9s8UYPdJxOmF5EfCys3SFzT2OIyLfGxnkc7MlbCgq
 eNPjmFV553aW2G/aULkzvkBZFxvX7b9UcKeWCrKCBk4tMFr6XLXYOoulgo1VPbqVqqAPeTJ320w
 DD3BJViDt6mOUighY8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030003

Document the RPMh power domain for Hawi SoC, and add definitions for
the new power domains which present in Hawi SoC:
 - RPMHPD_DCX (Display Core X): supplies VDD_DISP for the display
   subsystem
 - RPMHPD_GBX (Graphics Box): supplies VDD_GFX_BX for the GPU/graphics
   subsystem

Also, add constants for new power domain levels that supported in Hawi
SoC, including: LOW_SVS_D3_0, LOW_SVS_D1_0, LOW_SVS_D0_0, SVS_L2_0,
TURBO_L1_0/1/2, TURBO_L1_0/1/2.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
 include/dt-bindings/power/qcom,rpmhpd.h                 | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 27af5b8aa134..35a0e01c2015 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-rpmhpd
+          - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 06851363ae0e..67e2634fdc99 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -28,15 +28,20 @@
 #define RPMHPD_XO               18
 #define RPMHPD_NSP2             19
 #define RPMHPD_GMXC		20
+#define RPMHPD_DCX		21
+#define RPMHPD_GBX		22
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS		48
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D3_0	49
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D3		50
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1	51
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D2		52
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1	54
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1_0	55
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1		56
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_D0_0	59
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D0		60
 #define RPMH_REGULATOR_LEVEL_LOW_SVS		64
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_P1		72
@@ -47,6 +52,7 @@
 #define RPMH_REGULATOR_LEVEL_SVS_L0		144
 #define RPMH_REGULATOR_LEVEL_SVS_L1		192
 #define RPMH_REGULATOR_LEVEL_SVS_L2		224
+#define RPMH_REGULATOR_LEVEL_SVS_L2_0		225
 #define RPMH_REGULATOR_LEVEL_NOM		256
 #define RPMH_REGULATOR_LEVEL_NOM_L0		288
 #define RPMH_REGULATOR_LEVEL_NOM_L1		320
@@ -54,8 +60,14 @@
 #define RPMH_REGULATOR_LEVEL_TURBO		384
 #define RPMH_REGULATOR_LEVEL_TURBO_L0		400
 #define RPMH_REGULATOR_LEVEL_TURBO_L1		416
+#define RPMH_REGULATOR_LEVEL_TURBO_L1_0		417
+#define RPMH_REGULATOR_LEVEL_TURBO_L1_1		418
+#define RPMH_REGULATOR_LEVEL_TURBO_L1_2		419
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
+#define RPMH_REGULATOR_LEVEL_TURBO_L3_0		449
+#define RPMH_REGULATOR_LEVEL_TURBO_L3_1		450
+#define RPMH_REGULATOR_LEVEL_TURBO_L3_2		451
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
 #define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO	464

-- 
2.43.0

