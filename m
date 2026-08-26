Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C13C3792
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739713; cv=none; b=Xmix4L+ab/5JctBNJ01N6oTopymTqstzdtEG0M03d20DB1YmGYNHmLdudZVZT4XqleMp10IPbNCSr06V2tzkeG6WROM/+37mZkgThnry5/+qXgmaPW6b6LQ+h84dT9GYI6ydsEQNx5dB6xsa7rMpOedtZW9Eazh2CMoN0svKP+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739713; c=relaxed/simple;
	bh=Hrlo6dukOw8/7q1/7jH7ewRJ/FC2IOpIap3793Iz3oY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNcyIkiN+ANidqL5p80GY0pp1+GIMaReVenRVyOWJ8ajWBPKQhgQYQT+GmnURZer5iDny5eTKPpQiIWwm4mI+4vYucBWIA4RWvCS8coSq7GgkqxzdLPyXmGhd2QG86YXeWNwOSMA+4kB3FDz0ogoGR95vFaqf0mDOwa9LbuIy8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH4n+t9k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaTqiQlA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH4n+t9k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaTqiQlA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGbvv121397
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9wdDObzWEYKpGfapdkQMbM+TvZkeb+lSLW/BmrbHOlc=; b=jH4n+t9kMQD9ZBN5
	pBNkh658V0m+/z9qHZbnT+f3adF/IrdF2JGsjTSIlFfN4PNmNz1xF9kH99q7QDIc
	K7uf2KH2MhoLDKZD50gBua66sg6Q3jvBzu1m69LS05yUI2bKXu9WnnXOkz0YRdoD
	EnHpQfBZdz6k3OrKM6h7KsM2QhZCMqR1t/RJtFtuA7kUJOgiaTN/9ZKhC175nLs/
	ZaYSPvldIo65xnG8Q0gVxD10hFhgzEEDDmLgWmfue7AIiBWVailuGkIwtlesSPeY
	TKdu+bRJcQGZ+Hr4tNoa7EiS5y0L67D9cCOK9/lY0R8k2CYDTdKEzT5gUS6/dcS2
	qMJTwA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx99vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so7651751cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739710; x=1788344510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9wdDObzWEYKpGfapdkQMbM+TvZkeb+lSLW/BmrbHOlc=;
        b=gaTqiQlAclXESgQsoQrzLIbHtuZ1AdkZgoOZ3aZb8xRr1f/X8Tw6SfpnO6zCvqvV3w
         94T5j0fchYOsjfcQLIzwmpvI9gpYXQO7Tn5Pf+5q6Hu2oFSOn5ydjjYLEzfQA1ovtVLh
         EhTsVg/T4WlH9ExVvpHpMWiAfHdKQ2svfqHVMaU6IE19YDjdA9tNpkZoyeE67gLs3cwm
         P+dfADkZIM9LabirsUake8SLPk7LACXukaRwVpSR12Pvc3wf2xtWiGcEFHuRIhfH0UKp
         wU5sL6fm7V/FIE5iUvoofwx/R2wHYtg/UqAxDmsaXaeAQj6mrlgjPb7U6jUzuegxiElG
         H8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739710; x=1788344510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wdDObzWEYKpGfapdkQMbM+TvZkeb+lSLW/BmrbHOlc=;
        b=p4dRjnAteMiaJbdey+iWn6LiGk79qGjpjBJ51wvjVdL2G9DV4fZ+0jTFmAF2wLw391
         Z8Qg0o/w5Dz06+72U45I2kWR3aKpgVBDD8g2h1k2iBBKVpEY+//zlrRxMAjpPtxOSmrC
         Ke5+mozUN5TTOQRpuZltO7owH6aPmnSXGwarg5sFVHz7/RGf9yqAALqb0kdF7Z1DEKOv
         y9IJizTFnPZ3ldordXPFJl98oTH+9Oqe2DtnZ5coLBKUrrE2Dl82JIPNWbwi6rqOUmSW
         LlPLeZbb+m964WvQriwY8ZaHWt5FMePq8T/2ADOCiFUDE8WX41tLUNJmPQV0uBR4SNZr
         9O1g==
X-Gm-Message-State: AFuF++mIhXMlXrja6cB4mLFZs4ErI5A8Juq9OJZVxQHTJ47vF99yiw2r
	lpgmEz7nO6zorPg/ge4+XdbTkxQen0x4vq34t0ZvecSYuQR/9I5T8O425PPI8HgZlBxmo9rWnNP
	gVWW6OgW/SLUrO2x9gBLhMKdOyu4COVhKkY8bOuBLoKXpFzz37VTmDyxomkJlyBLP
X-Gm-Gg: AR+sD133V4Ng1M2IORcjd99XzLfYSVWxZsovk8RjlwfNpM/Fc8t6s/fZtOvGXl+Oq/b
	HveVIHwA6En0vnP3CQdnHo0lH7q1AHRxuT7XMAdqMyryCCfoH721huUsUC9pMX5IJ0tJWDm3pVO
	OTSTPqLsfvdgoFJGRSGyUJOXHf8fLcty+A4aucqL18kGMJh57MU8RKo53bZ7Z208kcoLK9woiNU
	Sku694X5HAWmtfeLrL/lStn6HDozaLsY+v2iewgqwQMGU1dwXhsirF5Fmg+PsAp0q9gKUZo4lGS
	dOyrHVXhFfKYqTfeSBraZPGwlgkaTxyi8ulbacQFRaFp9ZfrMyl87dSIv6z2L5j3vLaG9QO5oGe
	MHm6XOkDz/SesxAcRPAgW6YY=
X-Received: by 2002:ac8:5c84:0:b0:51c:291:82eb with SMTP id d75a77b69052e-52e2ecc055bmr141415411cf.14.1787739709949;
        Wed, 26 Aug 2026 03:21:49 -0700 (PDT)
X-Received: by 2002:ac8:5c84:0:b0:51c:291:82eb with SMTP id d75a77b69052e-52e2ecc055bmr141415111cf.14.1787739709551;
        Wed, 26 Aug 2026 03:21:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:28 +0200
Subject: [PATCH v5 07/10] dtc: dt-check-style: Call
 _strip_strings_and_comments() only once
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-7-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hrlo6dukOw8/7q1/7jH7ewRJ/FC2IOpIap3793Iz3oY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4q8T14FqpnCRVaYWb7TWAHrCW3TIGr3Dn1j
 EQFkTclOmGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+KgAKCRDBN2bmhouD
 1xmbEACJoFcyaRxs2K14S7qXkby8IEsI9KR/NZE3ujBorncm24/+SMGqjTLVzKXaQqCSn/7Lr0R
 B8rHOLoGEFCFOngQ1UIEM4pn3wEbPmN7Pv3AFLUVogXQXQqIZnjHWj4KdAmKSCK1eRUFTB1RA+v
 ntqB/+++iXHfT92Gw2E3yxq4GlF382BNTM00s0LLg8vyVxZZKO/dLklauT51wx2MSUalwk4TVjJ
 hgq3W8MJZl8HmhhbXK2QzIc2p4P8tuqyvgQBR5EsXLrg9K6yJeXDW1G+F7mDx2H2MqN2mSzbEuj
 apWNajwW0q66J4Mri8rve3zTNbI9qdPqpU1TVx5MP3RnYI/deSOFPLIolkGUXOF0RvCBhhtwqY0
 PgHISKPqWeWXes1d+77UQsV5X2wwq4fIqFC2z7BBFmttCxSZ/mNYYc4ijOguFjgLBXpiZ3cAXuR
 TkKjD2/OpdBiw9f1pqIwESzkPXBsUj3vfym1fRU7VdiGjIfoKmI8zVooujlyX5x4AwFbJnsA0oB
 1U2K7YFZCRzZkSPofdTT8V1z0foFDiYP/4Bqyw0X8J2lIGoRle1QqSA1xpY9In8aUEjsijcoktC
 oI8lOPp1qIsP3OtfNvVVwMCQRbbEH//mWwl4s3s1V/ahNMeAOMZ5aBUNObTGWnyRJFG17BZKBUK
 gie1dJyF2w4QI3A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ebe3e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QeQVz4WU_SlHbdLaYJMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: jdujF_zM4eWMIvcClJNji1OltV0GPvai
X-Proofpoint-ORIG-GUID: jdujF_zM4eWMIvcClJNji1OltV0GPvai
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX0YA4pWSw01o2
 i6xQWfFD/W0wUPj9e2gYrUFFK4vUKKZTashMtZBrHu2IlLUYIzZab2U48v3C861r9tEehsYDUov
 jAM6u/uabFVm9zU+A9Q5DgMOHI/Yal5xpGp4FedzIF8CKBP5auB1IDtM5nx+986KhkDwkZYlonu
 Ap/xmalWLG+7rUGvMLjARP5cn2b7To5Iqu1u+fSV6p/vrBW/nWMba5Dg35ckiX43AXkRYvwpbWA
 fU9m2dQb5mnkpXbRBPe0UPqcWZCPzDjFo74Mpjeg4mdbCiPIckaYsRJOA5L+N7+C+bh8WsHH6pG
 bi7QPBt3zyDwS5LS4KkOE5iIwoPDCB+NfN3w3fFNjX2Gyer1mRr833fR1Td3FUo2aXMv4VBQIUm
 HlqBh615tXrABU4DYmwqLMIaqi5p2qimxEmW6AU8ClGcG5qcaMM+CzSVX2tMZjOlvXD6qqo/XkP
 2P1IpVevOsJFo83tnRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX7ZfT7gs3Z/Y1
 r7M8nOwoI/ODUKKAzJGBf4L4dEFvS6YY7MQzGzH0yrx+y/PTZ5+xD4QDRbayabgBh36d45Y7RjG
 1YNogiZWizf4Axdl6Ecb/agfsc1v9Ms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

More than one rule evaluates pure code - stripped from comments and
indentation - thus store this pure code in DtsLine class for
better performance.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index a1034f6b9caf..da7edd5ea079 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -79,18 +79,19 @@ def is_preprocessor(stripped):
 
 
 class DtsLine:
-    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped', 'is_root',
+    __slots__ = ('lineno', 'raw', 'code', 'linetype', 'indent_str', 'stripped', 'is_root',
                  'prop_name', 'continuations',
                  'node_name', 'node_addr', 'label', 'ref_name', 'parent', 'depth',
                  'closures')
 
     def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
         self.lineno = lineno      # 1-based within the block
-        self.raw = raw
+        self.raw = raw            # Entire raw line
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
-        self.stripped = stripped
+        self.stripped = stripped      # Code without indentation
+        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []
@@ -811,8 +812,7 @@ def check_hex_case(ctx):
                            LineType.COMMENT_START, LineType.COMMENT_BODY,
                            LineType.COMMENT_END, LineType.PREPROCESSOR):
             continue
-        text = _strip_strings_and_comments(dl.raw)
-        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', text):
+        for m in re.finditer(r'\b0[xX][0-9a-fA-F]+\b', dl.code):
             lit = m.group(0)
             if any(c.isupper() for c in lit[2:]) or lit[1] == 'X':
                 yield (dl.lineno,
@@ -860,9 +860,9 @@ def check_value_whitespace(ctx):
     for dl in ctx.lines:
         if dl.linetype != LineType.PROPERTY:
             continue
-        segs = [_strip_strings_and_comments(dl.raw).strip()]
+        segs = [dl.code]
         for cont in dl.continuations:
-            segs.append(_strip_strings_and_comments(cont.stripped).strip())
+            segs.append(cont.code)
         text = ''
         for s in segs:
             if not s:
@@ -895,8 +895,7 @@ def check_node_close_alone(ctx):
                            LineType.COMMENT_START, LineType.COMMENT_BODY,
                            LineType.COMMENT_END, LineType.PREPROCESSOR):
             continue
-        text = _strip_strings_and_comments(dl.raw)
-        if '};' in text:
+        if '};' in dl.code:
             yield (dl.lineno,
                    'closing brace must be on its own line')
 

-- 
2.53.0

