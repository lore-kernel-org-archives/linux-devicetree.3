Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A975383C9C
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670032; cv=none; b=usiNPoBa8cyxfXnTIkLKyDg0uGbYteCyF9KZXbUYeGdh7FE5fLT8T74mDN2Pf84+Ztlji45Nj1BhoqqAjYD9985xGKZ+2WgDSQdftVFhCsPUqLg3fxhtfelfxbVSqO5EHPEAiIzW9X9WNRC0nJy6E0JGVpjaLMuPaDtZZ4hEPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670032; c=relaxed/simple;
	bh=SMV3Eo3EZu3fqZjtkXSurkAvS9yJhdfdsvRv0Png6m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BMp92+5CUjtgjsHtPvBjhcQi3lzBGLbSmAHDhC/cC1chhuQb/uU5aC2VeXj6J9TnQfnFRsBnZptvDDDEMdwFtK6gUZDQsI6fm1Vhjgjllanni0mc0rjerze9S8xhboC64jhe4AuoJFRBbr+zf+s1pWf/GVM1Fqm6AYoyKnpkcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ov6GLBmk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f21CssDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ov6GLBmk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f21CssDg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79C841598128
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F+9AeP4qXKi
	tNTic3Hb5cykdpT8EEJmu66u6wxqftHY=; b=ov6GLBmkyK+CQLGxpGZb3w4fenX
	+CWTDSSO0A7jKCYojSM3dFTX36p5T4pE8yDrMiB3kZFYpHZ0KNnPodw6+D6qrQGt
	DTLmshQIWL326S1V7rOc4mH249Tso/VkOyUhacKEJXpFxHm5UEuOm66JcL/xDqE+
	MBNChb/Xy6zMBFeXlSpx0hw2BbfPX3bc7KWwh59i6lUTnp16291Ck3SYS+pvq+6z
	Go8rBSJ7/sdMbt/t1ekl7J+2kqDhEUIvmiXit+twQB4WhGkmq+/32M56/789cajw
	4DoxsXl5c8wJleqbcOgPfmQKjFCFQ9561+IzEHST968RRhQSjS9LT985BEQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgng28w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:27:08 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-126e8ee6227so3812235c88.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670028; x=1777274828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+9AeP4qXKitNTic3Hb5cykdpT8EEJmu66u6wxqftHY=;
        b=f21CssDg/EbLn2ExUnQdKlURg68fc9nAmWAd++Lrw5drzs3gxalGNJkzMZQBTk3r92
         2Jvg+uQ5GxdifjlLX1hg9TA9a9MbUZmUY9nbLpRQhAa/y7uVneLADvp2kHaLNgrzGkG5
         2EG+4jCK80IhgjgxbCRUJAU+IEup8JgRpfBfyPRUWMiK6Hw411N5fEezHb1R4s2l7jjd
         XfxRVPDpOmravbh6Qy4VLgGwdpSmtTtTHrFfvqkTi6Wz+Y1wk3A3H/F9mTweMW4oP/Is
         DCxHsDHF0jpoyPF51P12LjTX3q+fg4wQ18vJr2jyUnyA1h206SoO8T3e3OqnNgWZvETf
         O0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670028; x=1777274828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+9AeP4qXKitNTic3Hb5cykdpT8EEJmu66u6wxqftHY=;
        b=nLGfvTwoHuz6JEY4ANbL2XcIOIxsipBqSlgKJ+F6EQYYCD9p8FfDATjU7RTBL/aAcH
         LGHd6rS5TqGNe7ucVWDJOfdYLRHxBrTjszrPeUuvIQfzH4YLitIHj52GZtJOXafLDoUk
         MD61auXx8s9caYlxHHg8wz4uUAUXhQa+JW8QSN4TKY9luWuUmPuZWWV6ektp0oY1s9Tz
         3FhVfV1wpnj0mSwyCber7QMthAbBeJ4tOZdJUyQqsY/rPUoGvcpqPC3qLLsHeWpX88hv
         VjJDCD1EWDeHF//yhdvPt6MMif/KA0lnQIMmtDHRzr1pLZVeJKCoe9kNOfNFogKd2xf1
         2puA==
X-Forwarded-Encrypted: i=1; AFNElJ+BsGWx843SYKYfHRT1x9UHDuBjtaoQRfU5pTiqqPpIicrzPL5GZyPG+aOBbWXUi1k/zbsGnDE1Mrpq@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQLtZ6+TrcCQIeMih9bI1d32tH8QTT07kWCHnycsBFpGX6zOv
	dyzSMzX+2jqcLcncIDOwaPDNmVSCOgJC8C02jmfWWTVImHrKWPzlPlS1oklX9XmTrXacui/lH6x
	OG9vRC3HauXsTt15ltuZsSnw5WCQdNBLewQmsZGaYHKYG1ntXc/rkQ8Ob7hHogCR4
X-Gm-Gg: AeBDietqQ69M0c6sFfHRPB/gnfhU40EMOcK6Ig/36/4OvXVaTSbU39Hnspd90L+pnAe
	HhH9GmxzX/JJq4T+sCse7e0gjUR/Eum9fcpWAbuyOOJnvtLKfAQ7wokT4tIlltAFxnzru6sETYI
	av2IckzkRS7Q0ATPUmi9EmENSSVWzVvMtV0uQLBeUP+exDeeL2ztP44JbFBQ7j6YDTvFcAxgu0y
	iXjeGCl3GB4tdKc1PM5ytz2yE0e550WiHihjOBXMH1fCkq0mgy00KP4EAqgnQRvxs53B3RFZrsH
	wzGioO7sgb6mz1XiHMX1nvkuOgHWjN2o0x3AB1DmZoMnZE+ijZyxZ7ZVeeYnjVg+ui8cd6AHFA4
	Ou4Ilphlwc5mAcTbLpq12/D1u6Cm3AWPusmZzcuLVi39f7T98/J4wEv+VIRlgZCg75pVN9Z7vyN
	yt03zbluNDsnHKX+9s
X-Received: by 2002:a05:7022:ea31:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c73f64327mr5997262c88.5.1776670027854;
        Mon, 20 Apr 2026 00:27:07 -0700 (PDT)
X-Received: by 2002:a05:7022:ea31:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c73f64327mr5997242c88.5.1776670027321;
        Mon, 20 Apr 2026 00:27:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm529413c88.1.2026.04.20.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:27:06 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,rpmh: Add PMAU0102 support
Date: Mon, 20 Apr 2026 15:26:38 +0800
Message-ID: <20260420072639.1249984-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
References: <20260420072639.1249984-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lyL3HkL3ELDCIU7U2pmdaDWghGIPwFLE
X-Proofpoint-GUID: lyL3HkL3ELDCIU7U2pmdaDWghGIPwFLE
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5d54c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=snxuehwT2jkVSlRMsmgA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfX9XgRTVTJJhfg
 MwP7ieTsnz043D+VvGgguestZrqEb1ZR0YRYV5N13mQAHe2+N7OjngrUFpcUeOyl9xSZcyIBg15
 puNdEXbJU31SMyX1VHTRIFbjFKCClRA6hXEknfdiznTF0tyJDM41ukvAF5vva3mCucg0TZLs1EO
 Nc1GZ5E0dosSJ5MOkVnwSngx9Pl5N01ldMgOOM6NpNRP9Nynna30an8BYhe19woW42THH3zSV6N
 dZcpwF0nN+SbjxUTsoDHdM4AUTeG2CSdXcDkK32lotlTfm6etkRjhZLcmaOI21zlT+VB28+W6oJ
 pgGQjFLz3P/m9YwBRLWpJ/1OqJMuY3nymJmg1mYxzGqbCycnUK4MinX/5jS1EIuiq6wdoSquQf+
 CKmFdPymYAeUpiKzSR8z2vZ5r/PbOh20DfHJOHCkYgSjUtLxlzE7CqgLGLzBhKQWE4gWRlk14tf
 ZJWidpOGz/M4Jvj7QXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200072

Add support for PMAU0102 PMIC used on Nord boards.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml       | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 58bb0ad5dda4..cd5391892fc6 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -51,6 +51,7 @@ description: |
       For PM8450, smps1 - smps6, ldo1 - ldo4
       For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
       For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+      For PMAU0102, smps1 - smps8, ldo1 - ldo3
       For PMH0101, ldo1 - ldo18, bob1 - bob2
       For PMH0104, smps1 - smps4
       For PMH0110, smps1 - smps10, ldo1 - ldo4
@@ -87,6 +88,7 @@ properties:
       - qcom,pm8550ve-rpmh-regulators
       - qcom,pm8550vs-rpmh-regulators
       - qcom,pm8998-rpmh-regulators
+      - qcom,pmau0102-rpmh-regulators
       - qcom,pmc8180-rpmh-regulators
       - qcom,pmc8180c-rpmh-regulators
       - qcom,pmc8380-rpmh-regulators
@@ -413,6 +415,15 @@ allOf:
       patternProperties:
         "^vdd-s([1-9]|1[0-3])-supply$": true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmau0102-rpmh-regulators
+    then:
+      patternProperties:
+        "^vdd-s[1-8]-supply$": true
+
   - if:
       properties:
         compatible:
-- 
2.43.0

