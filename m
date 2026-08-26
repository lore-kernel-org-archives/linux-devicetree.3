Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C16B3C7689
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739703; cv=none; b=iEnOavlg7Dsai5DFfCLqcrZNDm2klwOf9Q24RZaElikMjxFayPQV1qfOZhYpUcwG7Sd3kcl5/vLGhje+ExjpTqORwCCbKniJfiGm8ah5nkj8we7G1Q5m1PILEbIVkgdHUbSSi32BIKE8xSnR+klDz8i5jdzn5T1KYueYuNrcEuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739703; c=relaxed/simple;
	bh=IlBZ7/A+6aQ52Cw6c4QTonWglV2MNSvQc7eWi9Z8zUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U47iaBmuMJ+lt7GuwznYk6WO80c1fkic0uI18kZSbCBA2XYTNsi8ieLWdvy2NacjzX7atGTQjQ7LYG185BrNt2R+fJ2Klwc85vZ+KTAFdanfGEjVsPpjJXKddIahnmMj0OB615X19yPAFgSBkeRATwltOhRVx5tIjfX+R/cJ0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHeD+Al8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTYrX5Ae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHeD+Al8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTYrX5Ae"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGUMH017281
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7fNM/vMVtO8BnEM7l8vZieQUsAHP87Qc2HyklM5VY4=; b=OHeD+Al8IPFgaL1E
	nA/IuscoJMXghe8ODMY3MTgP8d2PxDFWukxna227Jk5jgHfsbwfBjfQ91zmnXqHy
	hcsEPM3hKhWBWBnNX6N/B5IIAVWkSui+flZsfKVd0n1oB4nk8C2QtXgQqY/59jow
	FWPNE4XyaZZuHlPsOLaT38Mmn+DnJ3gr6Ef5GqIpGOXe+NR+xa/pajAN+ZTp8W/9
	2n1vfg0ced1qJivwuRD1yDCNb3up7Nm+sAh8Bo4almEpLoSaaXEGENernrTOAjmt
	xuvcw8veilByN/pP9/EcZczK9TE5rx1ilReDX6tJfpRXKW9nytZlOGinxdj/gWD3
	fCf9Rg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3d45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso14243391cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739701; x=1788344501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7fNM/vMVtO8BnEM7l8vZieQUsAHP87Qc2HyklM5VY4=;
        b=VTYrX5AejYIb5n5phRhV/CNKxsfgt6mFTvPYdTQIZWhQRLNlISPhhNpsM5jC5+zBf3
         XC3vpz/2IJaO2z91MmZLUY3DBNQ2pZMBz22agTVVFNYDyrJ48o+Si8WFdNyOBNlbSc8B
         0o7MSw34GAqbX3Fjm9o32yNwaMHBfwTMdhuuypeajEhYUmD3bJlSnJbS7lEiWNqu4zO0
         YtY+YSSA6W+S4O6GLw1W0VulXpgFWRM3CX3Xbvi7mEyFBNJWiij8V5aPOjuXdAKluK6w
         8g4EEFv72UPoKGzVXYPw5HgxOy4V7ymTKYqSQs6oSbyZLJK2dMl1Mj+WHiaAFJD22Em0
         rV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739701; x=1788344501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7fNM/vMVtO8BnEM7l8vZieQUsAHP87Qc2HyklM5VY4=;
        b=jbx3ZF3e1yuyWTKza1eBk6WHSKkXcicHFthgBHTN5I5naZpBf4hpuD7NpCspI9OVEP
         txXQ6yQ2VopswpmuTmpYT+4iuulK9IdqheFaNrbi+tNs8fD/K0fWIapLf4SSflUD9g4u
         UIGYjwPxk0N/m48OnHPD4OkKpFdQUn9iY5zIoSztuJhRkF2quyYa0XLQcSzecwBC+Ikr
         1+MZcL5MmE4nebErmUuqVNJFP8Vs/bqjsQ1ry2SwZh1ru5wCjuvnWluExUKwy7WTEN3W
         KbTMMksSSK66ZXSOTfKFaAMx+IZtwmtitMea5br2v4c4bm++dHZyPuIXRjFTF/XChzTy
         rOWA==
X-Gm-Message-State: AFuF++mtsihb223iR5Fx6T3qbL6yC6PelCv5V2wVPORy4VwejQqaQhOo
	QwJrUtTM2giYXq2uEz71SIBMePpXrAr1Dq7Lzv9hqNMv0xx+0zaMylFmXAVjt9wXZd3jyEX2lkP
	3b02z7RoNFUFr9+ldJ6BdKDJ2I9ASOzlGXcLP4enQxWZx6IzgsrV/CVFiR3TWIwvf
X-Gm-Gg: AR+sD13ZseZdIY5yPRQLWEU24TkeORkPHgqDW/e+yd1E1VlY/kPzvVhpD0qrzOskhL7
	UFgcZMazpS1KeGWd6V0E1sD0HhLuQ9RlsB3VNzmnbkJpOS7eIet/20PaNR5ug7Zi7Y+s44ExG7F
	H7l3pAnNMjswHMO7wi8MH+aXcs5IrKLHSSgtiUTg4Oz0T4uY+kHsAhGDnH/g2pknku5omhnsE4J
	ZbHC3PBqMTjszhi7hogfTU4FM+BG0Ps8GufUruMOPt7lYMk4M1lSoH8V/rIFX+z5wu+WGO+aj8g
	CtyDxcqb1NpsZoG9wGxFguyEP6VvUW7kWr0gQR4Vz93arl5DGhzy0AVtB3CIXrPiTh8hP8pqouH
	8BZt1OMaV0p7x2WvKSR72+QI=
X-Received: by 2002:a05:622a:2304:b0:52d:5e88:4246 with SMTP id d75a77b69052e-52e42284436mr58145711cf.16.1787739700617;
        Wed, 26 Aug 2026 03:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2304:b0:52d:5e88:4246 with SMTP id d75a77b69052e-52e42284436mr58145241cf.16.1787739700091;
        Wed, 26 Aug 2026 03:21:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:23 +0200
Subject: [PATCH v5 02/10] dtc: dt-check-style: Drop stray backslash before
 quote for continuation-alignment
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-2-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=IlBZ7/A+6aQ52Cw6c4QTonWglV2MNSvQc7eWi9Z8zUs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4mQ++Vwluh9QBMSM0IXqxdLS1apl219Cvyf
 vz42KRyP0CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+JgAKCRDBN2bmhouD
 13p0D/0TPwSy1JG+pKBwbzW6KwTVaJ7OQI/NyKp5zgI2TFNSgSxjhoASd2vS/XEkkIMiYkUDqL4
 cY+zzShrS7a51puuJE/MGMFPSFFxqzWWzRUKiYho8IpZH1Q93k7NGJHea+HddiivIeopCiEHDDM
 uaqqJGNcn4bcV7/zWHB6iC1jzwdQ4/V5nh3/AhQZa5FcVfWWlmJc5yQBZNo4zDwjm5MzD8e4EsM
 HXPKiKWXiN85W9GlpZvgzm4iy3T2o7nHS0CmK1g8zpldUv9h2VdIYH2T1YxWMJyVoiIj2ZdhSDM
 TWN6TMld4/wDWxcaEPLfXuwq2HnH1fr5uHDXCQ49LmbygsyGUD/Qkao8zvFteVlRCsZ2sxFFh4X
 1+BjZTHLRCkjgYFipq031LlGtVEgfaOHxcXxQUNiJzgiuxKwsQeAvrF+gj3e6fSegY0ne18qc6x
 TW4D1Y0SHWm6MZp22maH4Cfxg9NUJJNlXF62a002eo6k44N2sveTqqMxWZrC0EA3dB5VmY0SqhY
 ts+SWcxaWGr6patv6nFGrxUby5AJyr4oKZ9oX2Xmlyoy5Z6ubf/u07Bpgcj73HntQznEDMkV2aA
 VbtXqgD9SfJLmWrRNqMoKBHlt4uPRpukm/k227XcZWWHXWbMkZxe1E85K5lhAfXapL6CXoFjqH6
 iL40kX1R7Z7v5VA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: MABWXIIjEy8o280AEjOF3b-KMqq8TXff
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX84ZeYZx+hOQb
 Klzuq4CmBmGktMT3rVTjjAlI127/7uzhZ9U13/oDsexSHxHGiAw6qniTUv1gNyGgyieDvtMUCsp
 qT3zXOfFPHWegpHTww3oz31P6WfhyVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX5snsqyLIYSO4
 KNXX+wa3rW2RAc1EpVxgfJKzPB2e5I1p9hMXICDqxVP4wuCLmr7xARy9Kf52QJ25mS9qRl82Y7+
 qlfzHSbIis7FFNsf8i9ti8TZuqN/SdUm/4F9UbaKfvPh6D69dLUu/FRuNUSSzkDHyr0Lt7tOfI0
 bzRskA5iLT7/V6CqXnMfvDTGbepbUHKv5xIR3FQTkqpbjWjY4nubEWpP+RImT05gEeTpQYKbTiW
 734z5VlQEB9mwcr8vbTuLG1N4TEZ6Aq3cSdf+0LlOK9xbkxRTiZSDKhkPYqQfsmHjyufsb1ITZg
 4ZFeRp/iW/ggEflHMqUjuzDSc7TlJFLT/cwKJBhzRvr0C1wuX7m0mZobcZKPoLN9RlQsz4iYPdR
 k08M9JZ78VEv/Bl7sf4itzUrPaAbGKw/u8VS5NwJZfZp/Ro1SZBEG4SooWJX2tjvQbd/DDCwfIP
 zBLhEnxCNA/WJmz2BFA==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebe35 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gm1a3DUOUa9zjCqAlRYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: MABWXIIjEy8o280AEjOF3b-KMqq8TXff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

Drop stray backslash before the quote character in a warning for
continuation-alignment rule: (under "<" or \").  Since the '"' character
has no quotes, drop the quotes also from '<'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                                      | 4 ++--
 scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index e5f26d3e2792..833f8a03ddc9 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -948,7 +948,7 @@ def check_continuation_alignment(ctx):
             if _display_col(cont.indent_str) != target_col:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under "<" or \\")' % (target_col + 1))
+                       '(under < or ")' % (target_col + 1))
 
 
 def check_unclosed_block_comment(ctx):
@@ -1052,7 +1052,7 @@ RULES = [
          'lines must not exceed 80 columns',
          check_line_length),
     Rule('continuation-alignment', 'strict',
-         'multi-line property continuations align under "<" or "\\""',
+         'multi-line property continuations align under < or "',
          check_continuation_alignment),
     Rule('unused-labels', 'strict',
          'every label must be &-referenced in the same example/file '
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index b5576dd0f6b1..c0801c56d5db 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under "<" or \")
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")

-- 
2.53.0

