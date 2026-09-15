Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D9B437463
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491859; cv=none; b=Gq7L0NJIDFYVCUID+HhQSAs/4jbtZprCn0LaDymzqL0tbtiP4pixx20fyhlT0/t+kcRxOPctmxzN4kEiw1fTLa4YuospW/5wJEVPmONUdORqF65S2OX6TfKq9f4G6xXBcrVFKnWV+iHC573++ujRHMTHh5ASrDZ9yINv+DqgfIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491859; c=relaxed/simple;
	bh=hjntdJUmLLlpSp65R90lod9o1WQrohD/jePzZpT9g+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A36npTytSE/m4W9bDxOPk3F4SL/t6Itnl0+f3QYIOUvBnzNJ4469osPeU8qgNbKsSTp/qfiRE6h0CQciMI4kLzUQffujABxRkV0HSALspPE7qabup4YD7hcKOhY//wx/4Co6OuSCBtmJI0RBI0eSsY5/sSo2s2XVxqGQMjOdMVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TUFcwhQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zb9sadOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TUFcwhQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zb9sadOq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAe812836573
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RGhQRLp2DcKp1qv6Y3qdZKbSsx4vf6J2PmKbcj7Lreg=; b=TUFcwhQLxOZ1ZSVh
	2pWOjkjT7kzWdOOm/8ZIJ8b8Ndyuz4jq3LAchyY1LlyR5u208oLUH/RTANjykZOA
	cZwHJ2iYvZaTWtCBDn7vQoEvYv1dUH49WFUXtS6AMVevuUhuU08ux3yEdTMgIS9o
	XrPXJd68ApkjfodvJzVGDz3YQUW8s7tH9tQz8t74Ii9TGnGf+LsJkQvNQgNL5VSg
	QaIPZZaQBLFKlTSDX6Oxv2eK8I33NoAczNXOia+RPVliqhPzhxOJ7g2Sr6oHQ6PJ
	VdXLv0PeFvz5VJeEKD5ao2auUvJQ5Rakgzb/jhP+eVGbk3Hdt3vVwn/wzvSRSL77
	ZtsjCw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpb5mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 17:04:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7b0f8e40bso5814128e0c.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491848; x=1790096648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGhQRLp2DcKp1qv6Y3qdZKbSsx4vf6J2PmKbcj7Lreg=;
        b=Zb9sadOqbHzp4LtilkImzjN/X4l+H1DAPhRBs1lgHb7xI9IYN07zXYAsBzN+QfRsC2
         xqvXuISFJHphQ/dmDmzoUTag00D0H3TPUUwUq9RYsfKgRHwKZ1ybxVzaAlbu/O97d1IO
         v33nB2rfLoYQ6BUyyDUdiDvvym4cq2OIUr3WRsdVYfRL+uKH9Gi6pBlIIHzYrsVm8kmi
         3C2ZxYbOxkfVSOXkxKfmrf0GId7tJPwhDKXYfBTRq/a70KQ0bdOsWo10w6xyzl1g+oWs
         EIGXloGsnAW04EkOU7rv6lf2Hm9+Rk0XqQz7ddFVyNO/9i1lzPUSAbohxBnRQ/FblU2K
         Tlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491848; x=1790096648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGhQRLp2DcKp1qv6Y3qdZKbSsx4vf6J2PmKbcj7Lreg=;
        b=fmv35q3AJkZB63sMby6R2qt6Fzzw86z4FiY2lnwGPOrMBaZTlXkLNGZlPgqsTv94Vr
         xaxT807kXxzF3vL4oVyLxUe9l6/pKx5bdhG9GTeH78o+PwQ405fC3xs7hcoCZTcqhVlv
         WHE4t2VkAyM4fMmH09B0/C50o1Zg4VQkpexTNLJUyizVErnRhuY5t2NCp59bM7JRlDbS
         7TC3kHid1qKTLAw0ai1QiI73Ye9e3NLRU0ToWtAc4ft2Weo5B4H/GUR9Mzjr73QexHr2
         AKEjN1x27wU9tp9HJyMv+4NSIl49tO4JED1Ly92Ww27NSgP13n0Jroqu0sS8AIYCuo4R
         5hxQ==
X-Gm-Message-State: AFuF++n4cDfvCsFxH9F0bs4wY+ehd5OvPhJ4iCFoxO1IR9yGbBmHn3YI
	XT1ctkknOmMh9cDl+xeVHEyeNAxFVR6dYibx9mFe5ujjvf79kwiAD1O5FxETuJaE//sUgT48LyB
	PLZkrBa+nxcUpUEUFCdzKpPQR2Ga5xs6ymxLknO9w7Q6GCjswhzEkYIWlHyu4Xp8H
X-Gm-Gg: AYBFou3jajygOYlG6VDUrMp0pxmF8QtUNHgu0M0kG4ZUxRcmK1QswcSel7kdQ/32ltM
	x2kwFBMmyheKIuuYjzDckOsnO7NLkPd/SxqwtwXevyBdmJm35lwqFRRGenBxmLjJCtj2GTA1hM4
	yn3JhaLrGrU+N7cHeXVPe9SmEFMTuY479lDX1Gi+Y6Jnihkn+u5DqpnQ5Qc3t10P8n+sLa+vwu0
	hrGXhD5h++M33ebao0SXRDGMbpc4zuGPJkDuXxeXmMA0Zg2YnX8dA5sTHZB981AA5UK2Oi9DfUo
	XaQ0HmILfHxt1UoKXaMUBjSJAUcAqq+0I8C9eCRJARjbt722XeWOThyzZuwitCJutephJyxlPdz
	RnBtzRgANsBWzSpBvZNgY0dM=
X-Received: by 2002:a05:6122:208d:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c993c40be0mr3650293e0c.5.1789491848152;
        Tue, 15 Sep 2026 10:04:08 -0700 (PDT)
X-Received: by 2002:a05:6122:208d:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c993c40be0mr3650191e0c.5.1789491847684;
        Tue, 15 Sep 2026 10:04:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:04:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:03:49 +0200
Subject: [PATCH v4 5/7] dtc: dt-check-style: Right strip whitespaces,
 leftovers before comments
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-5-5b8e09b11ef2@oss.qualcomm.com>
References: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
In-Reply-To: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hjntdJUmLLlpSp65R90lod9o1WQrohD/jePzZpT9g+4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXp56de0sb8Y3WwMeTi8g8H6V1h+EgMUW6N6B
 mIPS0hNv9mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6eQAKCRDBN2bmhouD
 1/QED/48YdEsIcg2HhYUkO1L4ZByufS25ABygaWF+Kk7kqUzC/8FaSbIoH9DVy89dOUdfHJhvSW
 vwLO435Ozip2xeljzjCeM1qtoMYqaGUavmaSkBtAFvlIea33xM9sG94mb84bbLMimUUOBufGLY5
 XiGBMS/JcSWzWJBIzjOsK6TZXrJfpqKhKh5S8o2qdkvNsz2sVxpVk7x7AapbRxlvq5HD8wlMCxK
 sobCzFqOWkcQp+fE8NR1v6zlKBlbz/A4phX4ClrcL4sRzuFpZRagQjRlmSZwTTyB1tRnucssIbR
 fghsYKRapXskJUvmRkmgOri6IeaITl0gKdQWeGHG2iIuBSfBmckp43bNwh4X9SBwKEAs+9GERiG
 wUAVc+jNoz6gt0iG4bzQ8bkoXbzi/sIwymWmCxBv5f26mZvtWebhX7FVvjEFk4AQhhUi3AQsIz1
 SzbXc8iaCMVeEQQG1iwo8nzVK2ZPiIwDxSo58dTTC/njSDO2XO1vXxZCOLnbZZshtclIelUMhxY
 V116Fd6Ww3s0acni5YXdGKyf3OqUppAqy1BN1tbsR/3Y0XNXKrXhZWCoJC3un9l1FLkknobBFN9
 m5KGI31J8iEzDy7Jp1sDw+NVLC1tc9FAMRB/3RHCcAEr63jt4m3i9Mv6TocDUV0t6ZtoxjYFzao
 TS8X+oblhunpqtw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfXyadlWYR/w7qo
 eEkvHxx8f7bXuQolLZVtOT2Ar3Mp4q6t/pKwXbkDpJJ++8DFe1BwBPl68o9iktEUEnL8ol99y20
 HxbilQRn7Gdrob5LG+2Fqhk9zb+sH6g=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa97a89 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3nWb1Bopbj9nUPZVt68A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 5hMtzKgVNWYHYLCf_PIfCiXGzO4E26wY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OSBTYWx0ZWRfX3otSKx34K537
 Pa8tC0Zwwa/+f2h85k06gXuGIfxVYG1yVL4Vb+B+I6MUxhj98xQhHrItWxGiqg3nqg/BvdNsM1Q
 NmrGn5gVYFUvmHAunrjtulIImuAp4upUZWdbW9hzS22su50aGMaResGb14laUMfh/VB83i63+xo
 w00iGVaH6C7VrGwp95AAvCiXmO36kYrtigSFi8vin+6CrX2sVTR6ExA17e60W705I4ik5NGyexu
 361F+gOdgEpc3Md7aQ7Mdkqm8N8pQ2LByTuJJVsec2yJGqT0clMXdt/AyXOk/lHw1VAALik6/I+
 XpbesoNQvtxP2El5jP4Vr/RnS8tzahCHuizFohVzvyVjuULB88ITSRrLXngsjF17yTHyqqkhKPd
 X9GBs1UhFeAyiMnjiFHGMSULz0Q7EkFiyz/xxL4Hp4dISK/aJfKEP1aZArkieWR53MEawRrIJhk
 cU4N1bgsbMclFmj9Zyw==
X-Proofpoint-GUID: 5hMtzKgVNWYHYLCf_PIfCiXGzO4E26wY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150249

Stripping a comment from a line to get the code leads trailing
whitespace (e.g. in  a line like "enable-active-high; /* comment */")
which will break DtsLine.code.endswith() checks.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 41c97d996882..a36c45c29476 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -91,7 +91,8 @@ class DtsLine:
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped      # Code without indentation
-        self.code = _strip_strings_and_comments(stripped)    # Only the code, skipping trailing comments
+        # Only the code, skipping trailing comments and space between code and trailing comment
+        self.code = _strip_strings_and_comments(stripped).rstrip()
         self.is_root = is_root
         self.prop_name = None
         self.continuations = []

-- 
2.53.0

