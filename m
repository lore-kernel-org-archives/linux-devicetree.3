Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9CA413233
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482116; cv=none; b=B01/pnm93KQjM3IHpaUBawxvUU04PF5hcqQ1iGlVpdEKtC5+VdN+8x1knhHQdB03wR/HPek+x/9TV6XRVxJqrXgJy9XavqukqyLEFJziCS7LmbsexBUcuOZ1cnX2fRVTC0e8bp6MksZzipYj2hzYg0EYTkSSq36YgRh5IwfA8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482116; c=relaxed/simple;
	bh=5t4du17pW2GAwFsQZwduJ825MCN2mRlucu8HnAoe+JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+U89YeLDwCDDZqnwMJCl/SwRe05py6c1rE9hJoHUAiuHrXH/WJROStBF/4ShrH7mlz8TY5U9Yl6gTyDkrGFbncCPDtw96ra4kPjmi4Ndscn4RmOO6+cDceGLZXQH2ALs9W0xtRDxBJJfDmji1smzfSkpISbxxAkVLxJesCB8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5D2Wnb0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjtqoZaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5D2Wnb0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjtqoZaO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFkfUX963223
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=; b=P5D2Wnb0Wi+qJRGr
	VpYjZ7Wr2P6wxgn3m2tBFQ1LQmNTyRodGnXhHsZ7oN7TSZSFVTGsuFN90nFsKXNP
	gHAKW3wDt5nwUYNLSGbUjZyapVTY9r6Ud40Gwa0txQngB0N+KBXIqmsXPOXQmd1n
	QclY8Ge8yN2k2h1DcEP5nOD7fSz/mwp0oDRL2b7FlnNTH6V1lBCYVPr6MaLecN2j
	7mmzL+MCrybF++ql8bPzdFSCH+7/hTnxoAzHySKDWNiZPlm1HMueuQajLfmhwZOp
	8AXQ7HtlKlJND0w7UfTOwqd1bQlJytsWY3Y61sTK9G9AF+2huEK6D2ifYYTVNKcx
	Ru0FTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4vgkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:01:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso138585ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482111; x=1778086911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=;
        b=LjtqoZaON/dE6Q+No+p+DJ2FvXOZ6iL+85GbNG5FgKyVriX8/gqQZR5qL+bewOvBwe
         cKM6oQpZF5wvwhoAnTDJyeNZM+m8n/7g5TGyxIPXGcR+/UpU+zsSL1ksD5X2ZYDvcSRz
         IJFsGsCGM0r4RmBSvPqknxT/WJy6sbKJYQAtSSl4lXeBiSL67vrismPDruMzZmjAJBfs
         qyb4p73zGwhw7cRe9NdSyEhWbs4m1hw0cyDL1w4nR2+y/anib9sRZg692ziRWRjOHFUp
         e2xLJPbIXiyPkOPUhSXutNkVZOIxb38epd8UAcwsSJrgTJ5mAjEgmmkU7y3tEhkoBrsc
         SUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482111; x=1778086911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/wOkbSklVvbS+H6PhRnBsyYaO1IEl7yP9PNWzZOxPs=;
        b=jytXaQGe7HpevywWAThJ6AHYZaQEz7xUIhSyvTkBBd8J3B9gpiRHBWd8nq28oyu6Zb
         68jjXJ5Vce5odvtmHo36X5z7DApRQhYMH/NO+mMvhP6zu4i+LNWnXbuMEgAkpEXzA3zW
         FAoCN2Sv2e9VkCqCax4Nr8GncI3/iwhBhHCKL8vMG2SGGAy2CcTDJMjYumHH2P/Wb2UR
         gPZm4TKxASBFRijcLSQxzUa7WeBJ4TPrPqUANNaies1lcQswRyQqCnw2nWuStvNyUtEg
         nQJi8KYjQvsT8UErBpb8CLnDcQkVM0m9KzOMqSlr0gmYjrNB0SZLvf6tzYWBqTI+oETA
         00BQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rtJvu+0x8LtTM330kcOntC1BUlRPcJQTjd6dsb9yfnqlyOvuAX0ZH0x4EATDuQzXUYDC+9yT97DhQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9KLiVn1VptybPukZ7SCfFDDStYnrPw4BaB0GmyaFP8VOzRWT+
	ufjE5WUFLxCvQumN2Yo/ejmQmun2gZZV5axfQbA1I1EJPf6AVPv6lSLq72Vy0bhcYg0/DXgbDN8
	mBqFv1kJDijsL/5MTPawY1Kik+39hHOPhyWyusY43I2LskHrz8UAgAyfnI/621wMt
X-Gm-Gg: AeBDiesRCtW4THrzJo3FJxnS87d8UOjzPn6Ky4VHAa2xmKUvkgYOoVP0uM0PUbaq/nf
	AJUN3dR/PcExUQm9zYYM5nUrqVHQFw6dkEYe7x6koggJnb+Mc1RkbwE+Arag3l5m0bYIXj5neSd
	Bj1w/GGBE7C2Q25jXi8yfI0MYLSoiLORkg3JmYDzSvJwPWRx2B8Jec5ZAY8nTd0OpGxprEXPuwF
	rZHcH1j3KdMNDWOUX9h3AfHAZcnsObzPVl3BCqHTzqaUPcY5nPIEa7RwcyYPyIjGLz5qvVOHYPm
	LyMxP98Desl8xCI1o5TpXkm7gqTKwRCEEmQdWXFtk/GT0tYEXg9N/0j7M8lyfOX33VYNTw0OhV2
	SW2Z+NOFgwCV0hGccD7vkUoMa+l33rHswKoPLMRJQoSkyCREKAlMNhMkfT7oedgdrEFQn
X-Received: by 2002:a17:903:3b88:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2b97c4c8339mr73071585ad.37.1777482110759;
        Wed, 29 Apr 2026 10:01:50 -0700 (PDT)
X-Received: by 2002:a17:903:3b88:b0:2b4:6d92:b002 with SMTP id d9443c01a7336-2b97c4c8339mr73070765ad.37.1777482110005;
        Wed, 29 Apr 2026 10:01:50 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm29530195ad.18.2026.04.29.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:01:49 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:31:36 +0530
Subject: [PATCH v5 1/7] spi: dt-bindings: qcom,spi-qcom-qspi: Add
 qcom,qcs615-qspi compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-spi-nor-v5-1-993016c9711e@oss.qualcomm.com>
References: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
In-Reply-To: <20260429-spi-nor-v5-0-993016c9711e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777482100; l=1728;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=5t4du17pW2GAwFsQZwduJ825MCN2mRlucu8HnAoe+JI=;
 b=ubq3Le4bhkPJndnu+yAED+paKqEaLepihoC0EmmsBp+qqI6Rs+XzX7w4wLtll730DSU4h+C4o
 VBMK3ML5Gg1A1bJcPJSSnAKO45SlUyS+CLKPN69AEon1adcA0xl0d2N
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MSBTYWx0ZWRfXxKkzIdXAvJQe
 O3H1YLneX1ZeFh4WKAfsI9gS3KuMelaOHhVY3/n1yQNxhk1bAWwDoPhlSQsbYDeBpHnfzw7BKIq
 63wGfBkGw+Tl90/I/pCw2xhqtwyAj3jNaXMhEhXGnhL8pOjgZ9ZC7X1OVsPTqIS4ClxRx4BDwfV
 pZNa9UOXYA3sJs9+a1vALnEO3x1p/bFnKKSpYO9IqqLkrmfg6ZjW8pGtJpI7tt07zlUyLZU3G5t
 8G5TJQWmv1K9d1DMe1UmX+vWxUZwP/A+Nxnz7al2kG2GOyDDe4pynAS+V7rPmuRWGAbmEoxcHrs
 F2ptvcUJtr3LZ/LElUlYwIr2xcs+V/wLswiwpZBBE+la+zoqKn6AR05LZsHym9TVc8WThKOmruK
 B9Mvxzi3MJZ01urEDOJcYEIAKilU/LUtfaxtJlP/ZbwCW+qOhLQ1xkrLO4nG6f8Xuh0QrjD8d2B
 BmeqY6Nkp0l+xyK2oYw==
X-Proofpoint-GUID: 8HpYC1WTVveQADx_NisgbPBpo8OXSbjE
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f23980 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kPckM-BePm1yi5if5TYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 8HpYC1WTVveQADx_NisgbPBpo8OXSbjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290171

Add support for the QSPI controller on QCS615 SoC.

Move allOf section after required properties and add if:then constraint
to require minimum 2 interconnects for qcs615 variant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
index 1696ac46a660..ee2199027e89 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
@@ -13,13 +13,11 @@ description: The QSPI controller allows SPI protocol communication in single,
   dual, or quad wire transmission modes for read/write access to slaves such
   as NOR flash.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-qspi
           - qcom,sc7180-qspi
           - qcom,sc7280-qspi
           - qcom,sdm845-qspi
@@ -67,6 +65,23 @@ required:
   - clock-names
   - clocks
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcs615-qspi
+    then:
+      properties:
+        interconnects:
+          minItems: 2
+        interconnect-names:
+          minItems: 2
+      required:
+        - interconnects
+        - interconnect-names
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

