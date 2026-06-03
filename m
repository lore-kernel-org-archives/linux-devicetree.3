Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6092244DB9D
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485059; cv=none; b=s4P7Nc3dHcfqNsQtW4qakzgSkb8cRVEn1jjOnIbSQxFdBCzQjbPIzkPDiZ8UjY+yp/i80i162X8B0jhg4uiOjbuizQc50I2CghNbqor9vQtzJVQX02/hOnozAAYO0N+W0MTQZS8Vv3iVrghs5WI6SKI/Gi5jk24e+J23sC3mP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485059; c=relaxed/simple;
	bh=1dObgRDzgUT8dRxMLMRa/R9TRzn0laSrkEbhmpC0VyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nt2QWXywn8dtShS5JbYZ4fa8Ptv3inKzY55jwKPgwE0yhF3nu5hgSfoPdAIfXoktNxQY2YOTaPxjLz20ITXdqdHJAciCZZTDjaF0TmmEk5pFDsrlNZgG+82IcE7o7QN5mTBH4rncQsZupmt9a0m66gxZKvkKxXPN6/QcTaKnFn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzSoM0RR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d184VGCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzSoM0RR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d184VGCJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RMK22076419
	for <devicetree@vger.kernel.org>; Wed, 3 Jun 2026 11:10:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=; b=IzSoM0RRdKxOgb2+
	GBRNaAckI0tbIx9U9k2mFDbmO1w8IYfgB8ZolDD0C4zsGRs3eARPbKsFcxLGMo4U
	1YwfxjC2fsJOdVg05iyOfKr3oEXobRrhNELmzRLHvJo0BrxUgSRdmBIVqEUPQxEU
	zxqsCkNDH0l0KdfLtNQ2mMN4jgSHoY79ifJAI9eTcH+r2VcvyoewHc+K2QM8oAr3
	pdSIMX1c0Ec5p13XY05xPAiLNYvKlAqjMiPAy9CZ806O8LkEhBfvkHfQomeK/FZ1
	z/m1qDc0CKTlDAKfqdWi/1ctG4pRIVhIMc7dmLBtq0ZoWhcrvco7A7nXtYAfCT3c
	gfvcpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejev197yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:10:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a99db8dfso43345695ad.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780485055; x=1781089855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=d184VGCJ6Q/4hUU6u1jutY9LIycxLeTh/JU8xwvA3QS1j5TNHvH7CT+aryW8IZ2rDB
         G/yKnJ2w7u1SdZRP8NLw8kwFTtoom1SdgIsl2c3wG/iIsElW7+9Ut23N7YaT9uODG319
         DDHwfjm5bAw+iBU8cCwLpF65+B3HNox0dDBAkNXF/1FmvvjqKUhHZBgN+O+J2mFWu1wV
         wkt0J+SxLwuE7e0uQah6tQtchVdjdTCADUSfNjyIO5qjCZ4diuOUirdkWqjU1Q194qBe
         UK1o/dVRVV9OC+q4jJ82tn5SPuIPklOJRxsXQY4KkHz95hl6u5JLu6cyGUMn8vlWuTNR
         kOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780485055; x=1781089855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGgysCkU5Fxr4iYQeCoa2SkvebPhhyRsY+oXXx4ZaWU=;
        b=cLn1TcJ4l1n7MIeJQ1KA+ODaB4ocytdq7xV5fyXi/QVdxS8vOPjnTqBePiWOuSomcc
         lPn/p43DW3BSOLSZGOCifqH6CojmWRqO4dnsGxWoMyyVlIOKMPQNk52oK6ZU21ovsG/w
         ujY1SSnKMZQzg7cKL7gCzcxJULZJ+QztvoJmoQSaKS6u7duq1mQA/ts0kTvlO5Bq0/wu
         aoQdq5n9WA4TyCvtb19mbWHWrEizNWpLCeio9EsKnWC+4uNIWqi0+nhBYlmQpIXn7Dm7
         V8oFQUPaTcj2RUdmLik5HZWGu4FzcILvmd0QzRtBN++M5rIhyVWaaVub6fAOsvw+CVMN
         2rKg==
X-Forwarded-Encrypted: i=1; AFNElJ96ambFZVPFSFF/EeMrmMqZqGwMbilV6pLtOaoz26JNKd6xFHkmhUOjfuvoexxVI7NbQewaVJW8XpC2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3oWIkFdpXobKFSMSrkhXGLQUzJUHGaq9TvN+yD1aXJwp5AD/
	of5ESOw8AluX7ykM/WkJ80qh3quWERbBgK5L2j8VC07EzqL7GAtfOl8B274mVu1V7YVh/xcj/Yx
	s2eIwuD2sJoAGyagtRGLQnl7UST/XavUZ636WE4DLoTCCOBUhq6xEDny0UbLXz+KZnHInarmE
X-Gm-Gg: Acq92OGFezzIT97UWHbTOc1HQNd8yFW+uLqxQzqUoK6vD149JShPWlTf6tmrU6ynERi
	D5VSSoq2PXsh70L00ULoNdqzv8nCzQynuFfGAj4Tu2f9oGeq0s1jmJUoO+ctppL3g4unh3ENzx8
	B42F0Jo0Gb5z2QFKG3LcFd64pUJIEoSp0rz2hV1I3I+cPURIQJJghHbOhTFM8Om0p568HX+P+O5
	nGNmnn4oWF9dNTo0zdLWMHPDMdpNmg8+9NmjvzuORi+SYyedN/7AbIpuVqUIP0izUAphg/QlBC3
	gH16zW8DARUPxutEEaOLv/x2mnqzhCwt2bpiRzaWF5UmPZcHk334AV9X7t7nlgJ3peTsaiwpMsZ
	xT0iDxRJ2GZ+k4OPEMR33wPzuzvRZpC42p8+qF4ZT3mmxw07duG0Z3EA=
X-Received: by 2002:a17:903:3888:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c163fb26ebmr32182705ad.29.1780485055406;
        Wed, 03 Jun 2026 04:10:55 -0700 (PDT)
X-Received: by 2002:a17:903:3888:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c163fb26ebmr32182345ad.29.1780485054984;
        Wed, 03 Jun 2026 04:10:54 -0700 (PDT)
Received: from [169.254.0.2] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e636sm22148805ad.51.2026.06.03.04.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:10:54 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 11:10:37 +0000
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom,shikra-epss-l3: Add
 EPSS L3 DT binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra_epss_l3-v2-1-480cdb5abc85@oss.qualcomm.com>
References: <20260603-shikra_epss_l3-v2-0-480cdb5abc85@oss.qualcomm.com>
In-Reply-To: <20260603-shikra_epss_l3-v2-0-480cdb5abc85@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: jA0GUUw4UpokMRNmCWJKrXsOVpE9yaWt
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a200bc0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_8IM60h0k0ddrWA-9CwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jA0GUUw4UpokMRNmCWJKrXsOVpE9yaWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEwNiBTYWx0ZWRfX9/Yp1BkApSMr
 35ZGXhe1PTZhTOr1PUaWzII5crp0aFVA0JZ1ZsyyjE+wcajGSM6tVU8MCJU8JZn2HLobb28HfZ8
 E+hYwfRlsHoJSrLjQxnDvGOFNVYjV63vwST2WIaV53AXa9KYg4/0xO2zG6ORHvsHkXrjEEPYHGY
 rjGxy/rFRq3aETE+wmtgkKP/CQtGUHoLzW2elQBGpcw079cAYeJi/2VW1M4OwQ2U6wrrcehApQC
 QzB0sQFpeVT3HvbKSgHcIont08knU0zVi8rj9oT10Z11uxBkVYIo8lvojczSJB0LpfEcMAxdRPm
 Lyo3Bzl00aNg9Kb4aRuDwBeVUk6mUSNlBd+X6Ihj3jPjBUMYdxr/vL1UN4wtRSokcotQnAOZcjb
 KXFTRSR7ttfCB7RP68Ivg9OomKZe+JW+CyhQf2/Zp6NAbdS37WpL7zNaP3BwicuAm/WlMEZpYIl
 maJVPGAhU/85G+78cwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030106

Document the EPSS L3 interconnect provider binding for Qualcomm
Shikra SoC.

The Shikra EPSS L3 block is similar to existing Qualcomm EPSS/OSM L3
providers, but supports only up to 12 frequency lookup table entries.

Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index 41b9f758bf8b..3b8ebe17a976 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -17,6 +17,8 @@ description:
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,shikra-epss-l3
       - items:
           - enum:
               - qcom,sc7180-osm-l3

-- 
2.43.0

