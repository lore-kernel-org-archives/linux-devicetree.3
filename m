Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952011;
	b=OEVKnxZgeHRPWHLuyrU31UgKheZyI67dJqeurTt959Mg2XBAgRlfPeFCPbkw/S1ZVLp7
	 YAsSOyf8Z3uQ28bPLZWhHkbRVhQGzlGafR0xSykewLlwRkbdr5CsGgmUSxkW/O7sAEixf
	 51DZbytEYaNfrW/0i0UoBcR3C/LTsXAoPcqPItfFRLZT9zO3HZk0kZ5QTLBY/Y/MWVOY4
	 2vbUx7et3/NIqddtdOTtCWCb5zDJM80PlZ3ybKMMlsLNosnCL4mdtOa2/v9oCkMHihzJM
	 HF0QGvZpC9ejOxj/VKbeWM//K0iavYfnGfsF0IBJrkyNIP89V6MjbvN4Lt6rQZI048w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952011;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
	b=2Wn4GjRB02sslN71FIUJtC3eUE8Fb6h1pdbrDklvt6VoyEgapx0p8wfPvFKwSaG6JCP7
	 0BvNF01zI6IFNCUmPejkf/XAF/krK0X5unoUoVmlQEq5HmpTXeRBu6GrvY3PrxDWPk+ad
	 JFadebz/xMMGcUE8rGqJ6G8iwzJo+RqdWW9o3HUFv7B2hj5GbfwRocdkWZHDA6Xf9/Yg6
	 m3sAboHZK+NxrWoMF+tEL1ndiLdYmHBHUsCtx9GiAWQanoryQn8Wc39kV8VfyCbpTwd+g
	 ALaX6NbN4XG3pGjmtrpNiyHLR51KoCFgz++cMHMHGP9PV6er5qO7sG3pyteP4kYSXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4DA60A2627
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A4DA60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RBv8045282
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 08:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=; b=gC4ka6wvvexq3Eu0
	A8JxHpN5jaGWmirVAolVsqLvMcdmwIap1vspNRy0s+jHuDvekHoidn72sFdwBx16
	bJO07CJq4C9vGt/GBELk79ytBriG8pfUljeYFbl6K1e75qDIJloPdKEDd60yRo8t
	Y//fkfZvDNafbU+f7UAjIk+Gd1tq3MFETLNJ+OloDV8kZNwfUietf4EogX1BhJwk
	yCOVyvg6RBsZawfhg34uTjT3ubDT9kAFNyVBqgJeSH+PA/5epwO3yK4fmNVEdSBE
	4pOHytjyfXVjy3qK+koWV2s0F4nbGJa6tFwCDrHGDuJbBOFndqDwbe/9DbkO7DGB
	ff2tgA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9srt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 08:00:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so320888b3a.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952010; x=1794556810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=ib+hXPl6S7u31rGkVQebZyJV2wnIcYQLMP3qX4z5T5gbZcbBA2SlTALlOld2aWwqft
         aXKWARs6vRunH6/qolzrMFvrkib+yoZn6g8cAi9ex/iJ+KpLUQCkiHY5JRSw30eB1+CB
         +fIGIFbEoc01FiWX5QWOarC5Pidsaz7st0AoQle9c3KimFmsr2eNpamM/79Z//OPXNpG
         mlkFxF199g4MH8MRroLCEw8lQfBqdyOtWOfcMDtBv+VJnM7/NDji2PB6ILg4EHIMTT6c
         2YlERtted8zqeIXsJpTMa3h3qwLLR7oY4Btt67J6jiFZkJzcvXts6EmBOFteGhEKV4X3
         dEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952010; x=1794556810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=0M5FWBnLM2eYYtpbmTbvDzXm+p4OPWySXejAkrN2TBapKL81slM75OvFzKpXsvdkhR
         kR0HQRSSwlG7Roj0mTxWR1c0v5IIszqIkiBlxYh04SpLNrU48mMx4Ccu2cfzdai50YRS
         k2T3alMJiQ502quxTQAdFJZU/unZ+NYVu7MeTr+6uNEyc1yoEfif6AdET79BbrmfsxnA
         AhKOaDrhOmDT7ZOWYSludt+Ta5pIgGf3SBf675rfiv2q2Jz7VbQbF2SVQfYLRIMLgmeM
         pL7oS1sRbbte3mpG0aaxAsYwDXNd3rgurJhT1XJT+9ULXpszzy9PC+DJ+zNuHsFgeg2t
         KmMA==
X-Forwarded-Encrypted: i=1; AKwUvBxXAI4eZOqFGwLltq2EVXego6M78Lu2RSu3OFJCQoTZq1/9ga7GwoD5ixfboUBzfIZuiQtnLe8+1h0T@vger.kernel.org
X-Gm-Message-State: APuU4Z98BipRTxfbnGeYYls7AD9EhfVODranGughzjwnm4Y0huFCT3/K
	30vdFz9TKrruxXYbYhUkMJsixrUFdlrNmDaog72nFeBgEGwsL6L94+1cJblqRHVazRrWfFuGCRy
	TBrFJcUyYOG/cjkO9G3v8uDEj+8syJTGsLP/OxVIgdQ+KUNZXhBcsitzpIj2cKPul
X-Gm-Gg: AYBFou2EnsgEzqjTYtBkHyofyQLvTB3HJ+qnsRNdkEEobX2cIE0DSHOloKVPQWV0zTK
	w9W9rbVl7lJjEd7KJ1oYkJVLKUwHhdgY3FDj+rRnk4WPKa6u8dbB3nOK3Km6GvD4pDBgH+f5AbQ
	uV1lZU3/pjg4ykricdxQgyc8Sbwh5++/yTFPBXSylubQrO6KxuD89ik2z/yK9CcSjeYiIJWg0/1
	HHVKleW53D93VmbycnwEN8T7LE63nWFwCjwc8yvk2ZAs0j32pZM6B/iFmn/3R86yGZfIclopQU5
	VRTNAV7WmCWgc2kuLgW/zD3ccVUEy8E1Rl/s1UltWbJokQVV5s/zpiJPB+DbroWT1DBE1RT35Td
	BFPoYhyGlGVyP9ktXX0PYBIJTOCvM9Giu9VETc/tPGdPhM8k5OTFuQZxLdkQHcQxmNk4jLc3oGi
	X074yUxiPq41RfowveeJenW0zlq+Bkg6qm3tTKey3L6fNwpxXWZniTS+oMBoyzAfyfxhbi
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772187637.18.1793952009812;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772159637.18.1793952009345;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:08 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:29:41 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
In-Reply-To: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=1463;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=v1VwzLIVBJen4A0nAYBoJxmCuCj+Ao+KApsK3wQ2L8c=;
 b=3MRGkfYYbz1vuQJwnIQLL672bkTkOf5vmz40JpS3zxg8k4EEjIuNsZEYz0lalZTfJbetjMGr4
 87pSXFms3NeAwtmca8YzIgsmXdJPY5fLe+mBtDylQlwmUPGfKh6+tLO
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX+f4c2a6WHLW3
 1Sn4fSkZywG86jhXCgipemisjDUckNCyyjIUWxhEVVg2Yh/A170b5g/pAKyodUinnD8QjIgMA+z
 GCO7kpzF2VOr5l/KBEpw9z5vxCitv8M=
X-Proofpoint-GUID: 7guTJsohT6NNqMBoP61CUqBx7MtWZH_D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX8wHmd7Ki05Dk
 sNr9V6TX3ONTb9FWBvX5nFy7v8ju6Fv36QJy5cTX/DVdyoLq7k1CYONj0ORtZg2so7+qiCfXQ3y
 GuPWrGiFDUTi5zQgM4dxbZoM38wD+NMsbPNfNwzGrzZsbm0htY33rDa6uvQmqDSnv8lflMd0wQz
 aY2y6IukDx3Wzrw8zYXtCZx+i02Hww4oImI5mR/rmjE5iTuvA9qi7UOS2odALG9wgyVtaPrF8to
 VpU+2/JVrAzpwdaaizAgwX8YZj/pCg48acjlc2N15kVE61zU0iYWbx+y7kHbwl5/ut0ctIXeHhk
 xX3/Qf/w6kszDvYfhISHVpPK2XmNPUGIhoe3D3Y88joEV2UBmkVPgyKylEDOtPMDo430PAK/BQ2
 Wpu8KRyKq0kv8Rzyb4DmP02orPRfaEehD9Q7lLkZonTsS44BgNoDrmjM0WE/at+AZ1EapqH2rjn
 TRjd8fRHAtp1ipb0Z3Q==
X-Proofpoint-ORIG-GUID: 7guTJsohT6NNqMBoP61CUqBx7MtWZH_D
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed890a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FfQU36pP55OiWfDkhZYA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
be owned by remote island io independently of the selected mux function
even if function is non-egpio.

Presently egpio is treated as a mux function level decision where as
hardware programming guide(hpg) specifies it as pin conf level decision
i.e setting egpio bit is independent of selected mux function, the
driver/apps claims the ownership of the pin if it's egpio capable in
case of mux function being specified as anything other than egpio.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0621..d7ea3eb4e124 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,13 @@ $defs:
       output-high: true
       output-low: true
 
+      qcom,remote-owned:
+        type: boolean
+        description:
+          Hand the specified pins over to their remote eGPIO owner. Only
+          valid for eGPIO capable pins, and leaves the mux function
+          untouched.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

