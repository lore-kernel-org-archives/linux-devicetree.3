Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D183CBE69
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782893129; cv=none; b=akoWjrLF0ddjUarA+/n9nsvOvPIRJBvQMkHJME70a6Kva9nfYDHCJipsP/eMcJG/jJB4Npf8xlvcsCDqtPNg4rY+zVsnqEMagoUguST2EUlIG/t617+Qdh/SQqwYoved47qdEWA85odVzFDiZDM0XsAWDZzL3SIN5AXjGH46tZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782893129; c=relaxed/simple;
	bh=fHoo/o0pniNxgxflVwP5KWxULHzHkdqwFQBUWy6yCl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bKucyTrwvL5rYva/XQr3SEt7qXNkFH4eXKAPLk47GKuRjUhNyWv93wVZAHkw8MC6+Fv0Trz5vsUEdCnGWzk6rEA9TrqTFa6yNzF3qN5CsRpFaWcDV5HCLC8J12SrP2TKGgSvDhAja1jBFJdLHFw/TwFmSO8raOzTM+ieOdsho2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYdYnit4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPfLDi/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYdYnit4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPfLDi/c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lQPh065853
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 08:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ligDrNzbMK44kHcADmWs08
	4Nup9UVQ++TW5zXTdqAGw=; b=HYdYnit4KQmLcRSQWJzlu9Xj2jKHKHGnsFDsXL
	zzTDLdOm0xiqh6U5Mx4Ycxv1fblkSMTcsqU35IEeBwZxWWEzQyBvhq9T7LVSwXG4
	NFWpeMBdKXu9MjEYNS89SbWFnkiVRFJ1Xe6RB2xkhjv7uar2Fd/vuVP61YnWYNYO
	l0s4k/D9kwSLBlyDh9zhfdcjJA0/zNsk8VZdoja6ugbXMPk5NfgFVePVsWtSL3ap
	dWHdlpZWkb2hf7CHcmP/220jHwD4lRIEcNDgghsIDLIzCOHP5xRc9N2+O0lI1r2E
	OjJKtDuYkUmkRCEy+7UhetpzmxBsMheIp4w3C1MviGUkMgGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqk2ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 08:05:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30efe4c0cd2so373080eec.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782893124; x=1783497924; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ligDrNzbMK44kHcADmWs084Nup9UVQ++TW5zXTdqAGw=;
        b=iPfLDi/chncbdi+V+Yq3NE7p6BQkYiIf+N0gIAcCsmdK/1fcT+/Tr9jUfZAwTgbUOQ
         Ie5l09xCiakpzpIbVQx9SsD4lwkzLoDsZcskxTfg0+wV5ff8ujp2ol5+4eq7bxIBQIXa
         veMlaDi9Of5t6s9WbeW4ZWITQDAKuETPbpHXd+IzmDOUgcTLPQuywh5q1Puyo4ctP8Yz
         boO+7cl2V+nx6yf70LuzmwkwX93YNQzyReCMksHU1gUgijbBCis9M2ow/0mvo/PeDM/y
         YD+redpRR1bUdcrkw6+fXHI3W7pVb8bq+CiFkzGmuraLBBkU2AHHOsUgbV2YQrGdivKn
         1PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782893124; x=1783497924;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ligDrNzbMK44kHcADmWs084Nup9UVQ++TW5zXTdqAGw=;
        b=Kf+maq/psQBsgfYk1HMRU+lh5ndxsHlYNJxoeeiTlybebgr0WRij6zfb5SxZipFwo9
         4IMsxOQl0PrEriNJoqfIth28Op0tvETIfS6GT6VnqDQz9ipTEXvKlK8Ri+Ptc5Pn0R7z
         64lgDHJQtbtQuNGNmJcuMjEHCx6f7/8QJUf6PVehkfB+swZenzvq7Bcyr1zQsxWd38S3
         8o6GDF2n6Lvt50i6pU9W8CuBIj3z8PGs8eOap0XNKADNTXm+jVaL3PvG0Rueq+OsL7GJ
         P3J1+gKMDErUWzf7Qmw8WvvVG9e29xa6oCwgmQY9JlvDN46C289sIGn6vNP13VC8rHIT
         UQ3g==
X-Forwarded-Encrypted: i=1; AHgh+Rrf0blz5JV3NFmka3bAJenedsSUaiOJJpKAmocHgZUl819bH8Oj+o5TeNAFI6vtzHb0Yi7gD2cUpuma@vger.kernel.org
X-Gm-Message-State: AOJu0YwSjiuE7oVJUXfVB5YV6hX8sc4Cuc6El2Jgh0N0yayukaRC3D4+
	ACpWkMbUIgjvaGNCZPzPcXI17s8aPLtj5CViSyBC6O9u+qTM3PEQ2Y8ixZYSpY9IPO5Ew5Yakdo
	vjWS+zn8E2bJSQevW48AOzWRtCIr4VE5f8eo6+pyL++Piq395bjI5G10lQaQ9QypO
X-Gm-Gg: AfdE7ckK1ZjHC6JBsiq319j7pjh5SFsMiovhUZ6/pf7H9oVjmtQXxBg4yTmy7Glb62h
	Fp+JYywbb8umkvdXMm15vn1geP799A2w7A0l/Kfc8vSuBzurgSY7oFeefTa8CMWOWywVfwHiKUw
	0AyXBNt/6cQhP3MsUsbNFEZmNLLcC8V611YPtW7k70mo7xdPwb5fjWsJPgpoBLNiNhmxRAIZ0vT
	ECtJOfQBDvy5lcBD0Liy+Q1YFM233BTAfsZn2h/fYxXhl4TjFUJXyTE5eP3/KegxNytXki4vY7T
	shFD+rVqB6vn6VRPNpN5uMaglrP1DdLPD+8f3sLH07TGMyLhsro9NUO8MmyFJ/ALH1pJq+JiUlu
	+iRDmYtjOv6CDz0ocJ++Vh0rvH+ipX3Eq69s0YLfnaEeolTE3obwPbB13OefHW/X3INatn9xaJy
	zhZ/UkSy9Kq472wfPNlzveKl9JXYzw5pE+P3xp0hjg
X-Received: by 2002:a05:7301:607:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30eff034c70mr727378eec.6.1782893123639;
        Wed, 01 Jul 2026 01:05:23 -0700 (PDT)
X-Received: by 2002:a05:7301:607:b0:2f7:d419:dee0 with SMTP id 5a478bee46e88-30eff034c70mr727342eec.6.1782893122945;
        Wed, 01 Jul 2026 01:05:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc12e7sm16519480eec.8.2026.07.01.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:05:21 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 13:35:14 +0530
Subject: [PATCH v2] dt-bindings: mailbox: qcom: Add IPQ5210 APCS compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADrKRGoC/z2O3Q6CMAxGX4X02hEYwpQr38Nwsc0iTYDJNgiG8
 O6On3jT5LT9TruAQ0vooIwWsDiRI9MH4JcIdCP7NzJ6BQae8CIpeM46Sa0yM0vS+i6E0hpRQ9j
 +WKxp3k3P6mCLwxiE/miCkg6ZNl1Hvox6nD07pRlsgYacN/a7fzKle+Kc3/9Hp5SlLFMil3gT+
 qryh3EuHkbZbt44FKjWdf0Bq0dlwtYAAAA=
X-Change-ID: 20260625-mailbox-01f977bcceec
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: fWWA8RK_gikJfzNoiX_mHODFXz6B4sN5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA4MSBTYWx0ZWRfXwYFgTHKGuVv/
 ovqNykeTB9dQN2wKhfoe76x1E12LCUGVeria5fhrCh+b6hcT7vleqFn9Q/kQ0cWazlrxoEEiMHG
 3SUlFy2gEXkABw8Glh4QpV1WUz6jgJHdVYTaT8XSDjIhQ+rx4L8PdnSEufkhPvqyUNC+xIs/TgT
 jLiG54JACPaCUrFoyk6Uukwd0A/RhGoweW7hl0in0FCw9YHKt2VhNpRjAdviZGuLHQF/RQJlidz
 ipfbeuFa61VDv02hi8w4Bcsvj87jKXZthInTs5tudJBvtIZWoMfClrDmQ+9A8qqiSI5jMX9bVGt
 r0G5B4EFgysWWSxTWUWB5t8BjXEC2R0Jd8zCorAtPFbRPG0zDZM4l+qqlXIZiMcIoymvnRIEzOD
 w7rTQQ9DjntUEZWaxfgvtToNZHP8Gt0vr+uBe+IrlyUs7osUiWK1BwStIU825+2HbSSaK3yh3YF
 QwUq+xTgAyAfZ5Uhw3A==
X-Proofpoint-GUID: fWWA8RK_gikJfzNoiX_mHODFXz6B4sN5
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a44ca44 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oC3GMwBEtLq7gvGfhnoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA4MSBTYWx0ZWRfX10l+Rcrm+suY
 dIxW6LZa/DuGCIvKmG4Zy95zN4xjE3oYhpXdSgwP8vVAMq47lwm+KX5GY1S6FXlQEBVQB8yYfNx
 rtJ3NCSpBT9fTpy9CIkXgLQ+uCGGqb4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010081

Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
APCS mailbox compatible as a fallback, so document the valid compatible
string combination in the binding.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
no cover letter contents, it is a single patch
---
Changes in v2:
- Remove incorrect dependency
- No other change
- Link to v1: https://lore.kernel.org/r/20260629-mailbox-v1-1-3b75ae87c4b5@oss.qualcomm.com
---
 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 1b4ef0688ca7..39bc374300c3 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-apcs-apps-global
+              - qcom,ipq5210-apcs-apps-global
               - qcom,ipq5332-apcs-apps-global
               - qcom,ipq5424-apcs-apps-global
               - qcom,ipq8074-apcs-apps-global

---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-mailbox-01f977bcceec

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

