Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14A24E4A8
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 00:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177735; cv=none; b=o6fRtCnoTdC7jJe3LkGt7ydaRsith9X0p20sD5F8J9ty6mMUBWl/CRzeHS4kgyd9GkNN2yaR/usOZEqsJtFaB05J7ecSt2+KlFsF1QqA5pxEPEUCCjsDVREdNG+/jOZ2WIRjvldRgnyS1OTHY+HPxNVqIlMtKtSkCT6K0nkL1vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177735; c=relaxed/simple;
	bh=NNsFy9jtd+cTfQVMSotMHHa2fIjaYf2NqeajsZA6Vzs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iCwCsXsTv49K/OEsM+PvTlqobyl5FfAz4HwPvr2vdLu4le6ScTLaelDrQOeQ/RdjbytSnk7Qk72zHeUzJrI7ggBfbx7HoCvZF0nTg6fd/BpPDGe4GFhy1thkdENSxGKj4kDw7/Un4yHgNjW0sUizU+71oHA1SWrqGXKHhNz6r8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ua+tlL0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDyYEif8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ua+tlL0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDyYEif8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4axo2255206
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 00:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=27cufHd7wNynO5b5/z2+Tv
	oo25GCQZFoaqYbXqPWkDc=; b=Ua+tlL0k2mqdzo9/3JOg6YeeEWCZMbvxPlj3Es
	I//cfgnbDkM/O9WtrVFZTGs0SteIArfirrZvTFvbVGOgMaGmYqeFsTbLGwCdFvHt
	4ynVLUrkv90IRqgKUJPEimgjUJ+hs5k2lkjR9OsJR4/iQztjTewQbRs1DHkwiSwC
	l0LMB8sfv5CsTzMU/wcwq9uxI22PGP5QpbwyLtKubozsH2R7jhNIexP63audi2O7
	93tdXtniVTg5NTi8rPq6otWzeEmdbz5mveecaX4yOCZ3KJwJg85QQSFQ5qZ+++pH
	TTXGRrwPIA3HjqphM90LUhhX7hEWk5KBIK5Zg1daYsBfi2mw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t399m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 00:55:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2c8ac8e422dso2297617eec.0
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775177733; x=1775782533; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=27cufHd7wNynO5b5/z2+Tvoo25GCQZFoaqYbXqPWkDc=;
        b=TDyYEif8yw7oVL/g2Fud0e5+OhgiL/ojny5m+jHMIWWWunisI250v4QW8eUbGVHOlj
         fDgAIs6Ph3Q5lEz51uUC98aXECdAFgwXNVBWrjj5NK7nPeeCJgBZZBjQjdXwzNqrTTVh
         Jd70t5hdYHA24xxdtcnDKb8lHcusbacbxfWiz9JnOSjzXAZBjCHiUpMX6CzB0YxnnFEw
         FFyrho42HXcvhNBXdiwhiAxDC/Ni/4899mukj54Ga4pEZfI3av6Ls+qemVcxL696e2rh
         e+Gz4AVnGQBtfPfrkC0dz4sajZuCb5cvcD4ZwKrIWYlo5t6oOSpBoLDQ/1+48vvCxzAl
         ndSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177733; x=1775782533;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27cufHd7wNynO5b5/z2+Tvoo25GCQZFoaqYbXqPWkDc=;
        b=auadzKTaxlkgTQ+WidLQTWDoMGN4rhY8DpvPlVJakaGVjJlevKBUf3l3ei96uTAyKi
         aPo816/N/JGqngXuoqyu2jsl9D/NMclgpeQAFfEx7kC20zPorDIGg9V3fwGvUSuqOO4e
         PZ4TIaLlGpth/Eu/QNA1up1QIOzQcbLqdJ7ynOjWcGqnlKhpgOPSteQX/24Hp6WZzaRn
         9LMsLFYNC0DudQ9mXo0vNa8jIrEf9Gp1lN4ZnFoN91C3KRVhqE9bz4wKAhM8QZZuMPyD
         09Ix9tNa33jL+yWz94/k0zAzgbtrA3XSpmLQUR6TSqo/QtYApw+Joq8rakGNSwu1/qCk
         lyzg==
X-Forwarded-Encrypted: i=1; AJvYcCVVZupmYachNTcV8sTc/f48bI2uzJ2o2WDX8mhDwwT1giSa49Sncm83lWf/Px5oZWBcFLeqI4WVVtju@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6YyP6rCghGVtYVIam+nn869idaQeOGqzu1LIJuEltML9fpxc8
	B4RrmeYg/ctOrblWRlJ1lXlv+V3Dlk1gJ7bRidHsUc3T7iwLYXkhJ3xG5ho5knFojB4i0HaCtgA
	ejhX83rZjZH4s5K+491NStTtISZ6lnSkAKsG7k0a0wKdkMPqC3Olqg/NPQO7aZyILcE/GRu5kto
	U=
X-Gm-Gg: AeBDies1ICzix62ZQHckaPX7hPFl2LP2Ya+wLahXHVM+N+TELnv3VpsdNdHvbpD+leQ
	r3gL9BTARd6WOpGJufoW9IWC9GR1vfdlnXmYKkVINaooHtHAgFxm7USxVKiUasV6Tbd2/sDXXvT
	M84s0Mmzb/7mrtN7BSzx4OLIOPqwlVrL3jfMshCXBrLdAPJEAhM8yVkPr+udM99adLa13PKC/tb
	IenwjKZqd7I5AaPRx4L6A9yLc7ZviHTkLCUJp2HW6K5tKsEf4eNqiroGhhGn15Bxziw3W30BUFE
	/yimJeLYawaOdHnqpTtl/NpjSznORE5Fa9Gqtd+hTecOdFlnVCzB4yAgJl+v7VakItBzuYY1VO6
	iAgVotN7UKUtnt3E8dH9pPWGGEocFOH28gqvI/sn8jhL3OwFeEqnyVn9QbuZv77ij8z/IGc9o9Q
	==
X-Received: by 2002:a05:7301:6093:b0:2c7:3a7:c7a6 with SMTP id 5a478bee46e88-2cbfa2d8089mr711378eec.13.1775177733047;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
X-Received: by 2002:a05:7301:6093:b0:2c7:3a7:c7a6 with SMTP id 5a478bee46e88-2cbfa2d8089mr711353eec.13.1775177732463;
        Thu, 02 Apr 2026 17:55:32 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm3750800eec.25.2026.04.02.17.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:55:32 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] spmi: pmic-arb: Add spmi-pmic-arb support for
 Qualcomm Hawi SoC
Date: Thu, 02 Apr 2026 17:55:10 -0700
Message-Id: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4Pz2kC/23OwQ6CMAyA4VchOzvSdROcJ9/DeFhgSBNhsOnUE
 N7dQWLk4KXJ3zRfOrFgPdnAjtnEvI0UyPUpcJexqjX91XKqUzMELECi5K15Eg9DR9ygto0uFWi
 jWLofvG3otVrnS+qWwt3590pHXLZfRW2UiBx4bQtVAyoJe31yIeTjw9wq13V5GmzBovgBCsQWE
 Amo0heFBCWgPPwB5nn+AOBU/kDqAAAA
X-Change-ID: 20260323-hawi-spmi-a29ef97409a4
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775177731; l=928;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=NNsFy9jtd+cTfQVMSotMHHa2fIjaYf2NqeajsZA6Vzs=;
 b=b0oPikiZHpTWkmkWWCPomey6wfNOgPfhHOnowCZPSOHaHmc105MRj74NJTPTvtRNwdpoDhXxy
 H55WNlwUdajA5Sq85Voenr8wfY/gPrMH8JZh1cM1EOy2bIOmzxETj8H
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: Se4UEXklbRm4-Uge2ZOXPjRvEbvm5LTe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwNiBTYWx0ZWRfX/ipWy5o9r38M
 E617qgouKS4PSUXU6xE1CHIAuIb8m8Uogi/n54UrB8cE5P2TB5C7sKilFc4RtPsVbSigIq30pwj
 VwCigB+kJAb7s2FZ0xB/w7AKSPoyQc3583LFNeS+Lp937Jpf2EhhuWT2vID5Zky1SP3MvGV8QfY
 pa5E0VEPHgytVxuLGGMr8s2F8jDPeGxtDFGEXuHt+lzK3kKIpKeEmiRAunlflDU5R2CaBYiLS27
 E7UvbSkkBBePTQGr5wHLNrFbVp1vExw6yDHWjluSo5XPEsYbReMaviWC7SKRyVkoc03SVuosXsr
 N8zsh/bogyArPE8zry98F9y6X5xwYWXsP68R7zekIGY1pl5kP+aCKv2ZpbY5/EBR62D5B9SMXEj
 DazpZ3jZ7oSFUTb0z01uClad6Gou59U2OzzdzIDpJ1C4XZiIeN5Ozti04yEStzhtaH7iWsqegXH
 tTx5WFknmO3gyE8op0g==
X-Proofpoint-GUID: Se4UEXklbRm4-Uge2ZOXPjRvEbvm5LTe
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69cf1006 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=h1JfItXC7O8gTr-dc54A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030006

Add compatible for Hawi SoC and add pmic-arb v8.5 support.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Revise patch 1 commit text to highlight the new features of the
  PMIC arbiter in the Hawi SoC, and clarify how it is compatible
  within the Glymur SoC.
- Link to v1: https://patch.msgid.link/20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: spmi: glymur-spmi-pmic-arb: Add compatible for Qualcomm Hawi SoC
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8.5

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   |  1 +
 drivers/spmi/spmi-pmic-arb.c                       | 69 +++++++++++++++++++---
 2 files changed, 61 insertions(+), 9 deletions(-)
---
base-commit: 840b0dd6b8c169e963f74265f508c54f1fe3c968
change-id: 20260323-hawi-spmi-a29ef97409a4

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

