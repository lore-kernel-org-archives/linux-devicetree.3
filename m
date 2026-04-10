Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D93E63B0
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846597; cv=none; b=FnLUzRKmEPne3sKEYXVjqo4nay6tk/TK6Xc44ubersF6dC6A+wki1gg96o6jcm3yQy1z5iP2l1pH6wrkw7xIQPU5vLPRlKZ5coyGiq1WaHu0B68ofyOatSH0HmDzpod2Jx7nb/lKzr3csPr4MLbyLeLDeEmGtHmrqDIpD4VMQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846597; c=relaxed/simple;
	bh=VbQczkdg/Wq/Lm6s61vmfonnmuIDHZnjRJGkjeEEMpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7v1V/FFNmj+3EbakAQ/vAEvBhmo6dDy0BAbzjH1NcNxEyiEQ2UsGO+eSvnYTO5LpGrxS2eQtzELFJNvu14yRZILvR9bYWv3Q/cNHoVaXsYalJ7i5tRhu29VZhosi8WBiXoJEL1opuGkkYEkmhBcuONV9Uitxw1fRT+O28VDA1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVcW5yKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifoh2vFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVcW5yKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifoh2vFp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AIMlec4147281
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wCarvTqn27l
	EtNV+xySOSgEEb+W/JDGrb6R3dZR3COw=; b=NVcW5yKmmoVR0L6RBj151v8hTA9
	nI+iM+4ri3S1XRAhtswZ7N4+0a040da38cHpxmsNM8xsfjk0Clf/SeGst+E63thA
	TF0k2JTVZaw0Mk+h/hqaD0WfydDtynW/cODFbhJSQODkUmKvYA1tS5mMDl1YBDEe
	cM9dK5j24pui7PNERYTDQlhsEkn6ZQYmAnekzBtWQoZ3FlGf7BBlYsh000nTmdvt
	P3WDKAioqRzF2CGQkte+TnbXnkakhTIQNp/+SiWCh3ro/7SpJ9v8Z1g/TnQtdF7i
	8VMap0LZ3mQvqxIw1NqtRt68l+WSViQ7Tj5cEASuF3XbdNqrEs80MIThqHg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgjhjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 18:43:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82cec239147so1506083b3a.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846595; x=1776451395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCarvTqn27lEtNV+xySOSgEEb+W/JDGrb6R3dZR3COw=;
        b=ifoh2vFpXnXYY+H1kgwgXT+gl/OXN0S9ub9N0i9uJnrQABuuSTxxAPO9nJaxB4ppO1
         IEegOraUa9bpFzYo3Zr6XogE0aVONWugj7+4x62hdp1k69/It3E+hfK2H48nzr1tiEA3
         IXwDmgSwHPcEKL2Va6gsw7nw7/lhtRzgZXVJSzjHaKFY93d9OkzECR4YnWn2wIeK0wEj
         5x7d+b7gK8w4XNz+E0wXQU8pP6zAr2ZygL6zixoJ1Yur67UDj0H30usz6osAv7ItATHy
         1sdovREjZj5YjE3xvcn5NIue91vlVcDIKRrqTtCPYvIcWXR25WzMhA5OqRozjc9VM0jU
         G4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846595; x=1776451395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCarvTqn27lEtNV+xySOSgEEb+W/JDGrb6R3dZR3COw=;
        b=PR/ks2QBsYwZ025V5oVvam5J/I18GAvcKLQDoRB9i2v4EeRX6px1Ww13L3fAErEkYc
         5TlWOO2/JPu7Rx01ho9R5d4NydegoMWPFZRdjfO79nz0dL8LWxLhEKLE9q8cfi8y0H1q
         dJVbacD6zAeKLuJ51bk5BDnMogOPWS9SfsjOVqZoR9WCvOIyXNHonzDkPKgNbG6HBzT9
         0hmPdqZVuL+YdsG4YKAqosfRZ5IKIIhFXzpuzMfdSAoy6V0GmwjhrTaYljKPkxOmo3c1
         chI2zUnsowBqzMs/jnrB+JQm2JljiLDCwLbK2ODE3r7f9IhVObMBqyJ2fap//4nOlZ7h
         NqDg==
X-Forwarded-Encrypted: i=1; AJvYcCWK1tNlJlxNmCID7S2XfR1xszPEFYepoypxHLHuzSApFnKU1BU+CdLo9EPmCokzVFgjkj4UnnblHEsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfcz+Iff8ga7h6a1++zQUo0N/GVeel/HEzjWUGQp3VjT3c8kq
	NG46jOwIGSKCNkix6P3IXTv6yESCGjrGN/kr2L10dKw816rK1lIPLSht+jNBKLVqyg7va2f6KW+
	Rp1clI+gFKmKTLeqdc6uPTcNimt+IKZhk3t7j/Q2w7AgxUdcjU9whmFciFsK7LMqv
X-Gm-Gg: AeBDiescWIbMa64CfTBmUVSdLrBkilGYhJvNuw0Kp5Gxoozt0TwB+Ly/mkcl2Iuvtz6
	xOVy+QNeYz/tQhRNfEpGAW0Qe01aHQwxLCivVaAR/efPYWroFaRhro8/Ek5RWezdNlJTPavPeiH
	Chg43dOxhImPf90GkTxsx7FhzJAeeiu13pTsnXYXagfEy/lb6b/kGa73LzB99JaxCUKVzWZouzq
	s0waRwTWzkJNUcUC+z7l0ZLZgdplQUJ6UyMEc48vhxN3NlsRRDV5b2tTLpUq8ucY/ofzYGHU5kG
	QeTtypxCD+pM272jX5Ko3Rrb1SkBPedaGXvl223tQzEs1RCULqmd7uomY7WGfMY2XewmHisAzOX
	gm41C57WP2Jb/0GJK8YYM5tcbvRPrslktV/wLnExF7aX8KaOn
X-Received: by 2002:a05:6a00:a802:b0:823:1444:7873 with SMTP id d2e1a72fcca58-82dd8b7de49mr7714456b3a.32.1775846594779;
        Fri, 10 Apr 2026 11:43:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:a802:b0:823:1444:7873 with SMTP id d2e1a72fcca58-82dd8b7de49mr7714418b3a.32.1775846594104;
        Fri, 10 Apr 2026 11:43:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 18/35] arm64: dts: qcom: sm8650: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:10:55 +0530
Message-ID: <20260410184124.1068210-19-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NCyDaNpxEuwBtgXVZ6OlAg2Ox-wDVlkq
X-Proofpoint-GUID: NCyDaNpxEuwBtgXVZ6OlAg2Ox-wDVlkq
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d944c3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oy73fdSuVNde8ymsYewA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NSBTYWx0ZWRfX6718F/H/UHvY
 4Ezl06EbwtaDJ41mpdaV0cQWMtrOufuMFRWcYKINOsGkxlKGjAjhLAE6CygcqOWOW1PnuxrqOQ7
 pLQ2M10eOV1YxcUCclivUCKTO90g58a9tLBD0CD2Zo27eCPweNz2NdFYs66U4hlksVEmNgeESXo
 QEKODP0EM0bN12LfM9o241cupMTVKDgBRnezJ5vFcTFhu1Cs8Z5RbT8speUsQHAXNig+onikdHL
 1IHfmwGjf4pJiRUY5GlHHTVskfDp1EVy4aX1o1xYGVz3HcCTnPB49SCxU+3kei9/hoJ0nzqwE2E
 Ksf3Jd7EMUU989kKjHN6YCC1GLfrQxG1zPzAYRxmJBjPBbPvZcvwA20geSZPsFl7D1LKX2SHvdr
 9IfiLzu81w+JUbAMxpPYwiPvwd5UAXmvZFk59DM/CjrisR8BK94uFryWoIfRfKjoYbBMUnMnsxL
 wLh7RG4KmJKTCPTWLWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100175

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..349e19b429f2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5987,7 +5987,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8650-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x174000f0 0 0x64>;
 
 			interrupt-parent = <&intc>;
 
-- 
2.53.0

