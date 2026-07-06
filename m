Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE963442134
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 10:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333168; cv=none; b=P4YghQUYRQyNOqFEst14v0+PRUrc0yJpolnRNjr/lFR68w/wt7jXenZ2GwOlOwMr164POBDquLIL7CJUDIkrrEs+XpBuCYpT7X4F0DtIW0taFNa+/SA4Ks1qraZ+RtDREFCp85kCdef203yvQ5VnpJ2bxiLnNbiPpTsrfmUzigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333168; c=relaxed/simple;
	bh=7dT1rnwDJw2CShE8t7sxuVTIlJ+TFysprvo7cgK07qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpZebdK+by53ZKDshPChmAioE1LdQ2yYhV9qczHt6QGZRGTMwdCaOIVwwncOyDgeKifIy5C4kgCj5XjhG6S6ZjhW6+gHnOclcDrGKFfGiVxEzFB3q1PQp4Om3bojsHK4j54EhGM/jQqHRA9ihFMaV9NUMNIYTh4iG52VyBIrAiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/FqHofy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuZSNMj5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/FqHofy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuZSNMj5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669pUBV237307
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 10:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxX
	Awv8+WAw=; b=g/FqHofyrjtKP8lmI7JGxxZjUohdd+y4DCC8ntAndOUlbKy+ZGn
	lyHYBqWZ5yRAPc1EqgBN52Ozl3acAXhe91ZhFWArquimP1BkFRmWClw10WNQalGF
	/MtzxXGejrYb7E2do7FldKLmNbcxnmYP+hy6cIq2gmOEJz7SnFIxNtMFURYXo7ye
	MN7jFqkSZY8e7BHztOhmeHMhWSQlY5KQWGPq3zKSAEHSV61arJ2KS9KCg6TqFLqq
	s1Hj/quNUoQ0bXOtRjquFFfB5S0K0VSfb3FLo7ZRikk/XnkzbaweHBf7gy7ZM5ON
	CfRtewzpBlmnN6vVErTHZrEf7JZWce/17vg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r03qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:19:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92d1cae5939so280307085a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333165; x=1783937965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxXAwv8+WAw=;
        b=IuZSNMj5kZYr50TIKbmTJgnmIdusOAPbL1+JGravaEk8hXnWSkLjvLs2l2TiLpdN6M
         jJ5dk5A9SoyZZ7CavE5sLvDX4p3hs3BMdUWKPQxVtoEfS0R/FrzzEFfei/ngOH4BHb1n
         W9KuufFJfT1w2zc/YaDiL81WGdIo20/DDfuHHegLTf3JOY0vPZaO3cE+S1P/+PDQGZyk
         8nm9rnL6atjMwM/1tYWRxSOhKDIbxfLzDwKPPnTZB6HTsAcSbWbfmxlPHWQezzrvnoKl
         Os+uCLwM6j2RyWFHKpLwbWPLGOP6gQLPbnbFTAsWjN57LvMG3kc/Y8odHkCl3mE+QHwB
         SBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333165; x=1783937965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R0UR0KqbpWYYbudtpGSvsUKkINFSCvAyxXAwv8+WAw=;
        b=RRytICyIM2SmACEVwnCHzZZl2ayc9DsbYnT2RNMaff+QyQlXBL6yXObxitCB13S2Ct
         KVwEBtNX8CW2VeUMe4exQ3QAZqG3tKDlchRqNEVAfpxLVG7JtyT3+NMayPkQ9b2WPGyv
         EQB5zLz89OeLTVPeQI2XJaNLZxL5TF4MSc1wkZDSWDwOo3U9Y7iAZUuT+X12ePy6wA2C
         uHK2DUymNyeAYs9r9jAFpu7WLGr0sQoPSjgBTf73GCy99cm6UfJL5qduIxBvFshjE3B8
         qjed9KuCvhf1g8+Ir1R9GZ8ToBgRCd/14OaOBip+Hw9IHW3mTc/aqa0+z6ws9bmlOl0R
         PMJA==
X-Forwarded-Encrypted: i=1; AHgh+RorYcI1Y2mtc/fMJM33M/4nmZYySXDh09l0Ps5RgcpSEGWzg1fPsNzBrT93iiiFHrK2BmU419Bbtwi8@vger.kernel.org
X-Gm-Message-State: AOJu0YyKtiAg7bR7oOuOP2wNyQQOoHfAMr03CAtbeJA3TE7L2v0YCGJb
	4NymYwASb/MIim5tP/8kqla1urDThkipRbMhrFhWqY72K3g6FOOKFy2OnCc0L9ZUTsammIsn+1I
	sxVyUkm/iqOKIMlPmsoeX5CEFZmz1b4L8ivBSakk9+KuBZOmYrTs0kKR4XroR1vkP
X-Gm-Gg: AfdE7cnajjTcZtpbMiCToZKAtoJNmjEjnmxQTAooCn/T3StKavPuMqpYN+PQwXBjxE0
	9gcFZGl8QsOlj1WmBoeb8wr6lBb0PJBHBaHVu6Z9Mmx21fZNdDDDEI7jBP03hhV57KGgP7hACYs
	fAAuQBQBq5bnKUrDUdrpNtYQvBm0Aqd3BkCMcTxeXPmlMN5PYDlznMwrVShdSqfdNHeIupePR7E
	IlETvFOy14ty51litnKUaHWEWihSLyAkLBZIkVh3mwXVMtwqj6sKTkbsT7wxz55bQFYoTJ0QW6x
	KVJvStm3pCVgLTqqR9GxGuK7Xx9xWw/GQII3bPflVNsqBCf2F1Ua3Y25RQrM8n3TlLWRW4urGcy
	Z1zRYZy7irOojG50l4BKkB33CGDE=
X-Received: by 2002:a05:620a:2552:b0:92b:67e6:8ab1 with SMTP id af79cd13be357-92e9a4f2798mr1258755385a.59.1783333165173;
        Mon, 06 Jul 2026 03:19:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:92b:67e6:8ab1 with SMTP id af79cd13be357-92e9a4f2798mr1258752385a.59.1783333164790;
        Mon, 06 Jul 2026 03:19:24 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm23472714f8f.3.2026.07.06.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:19:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: broadcom: bcm7445: Correct indentation
Date: Mon,  6 Jul 2026 12:19:21 +0200
Message-ID: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7dT1rnwDJw2CShE8t7sxuVTIlJ+TFysprvo7cgK07qg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EpPDSD5pa9obhkMqq+J7902LwJe/IH7h+hG
 hOgiJuIKwSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBKQAKCRDBN2bmhouD
 11RND/9q3Ere+0+Hq7zrm4mcw/inOIvCQRbxkpKKfV6ft3qYAMJWHRI9ehYiNC3lA94QzX/kkmX
 SHLvpLNLK43yfjJmPMl1XecUOmfE6vvhnEXV96QW6xaL0NaNHYfO/kfu+O77IZXjG1llYPWfr8v
 xogL3e83vyMPTSwnuPSX7k+mTwDgvKFJlMMp9jcc2jA+ACR1VBgGr9AMjEohqlaiohPrAgyWAJx
 DyU5fvMBHaeKaB3WM8+CusM1osnXvc+nl2aGOp9KXdR8TO5I7uaLm3zx4X+XdeNHQdAvAJaX+VB
 yaES4HAtm6yd7NhXZKOUuJr9q+6eN+C1kbcWKi2vddEskuRfIRho7jrAKVLxpJVocToZW1FqERS
 5VdhD3HJp98/jzeftQRNn0ktat5NEpqKI4HBqFrs6lQw8k6nhbC7tsMqpsCg82rl2WwLApvTXYn
 ILGWQD90U1MXXMvj+5pM429KMJnxS2N/svFaPuAubLExbmTNSru2AYp3tM41+7Zm57QTspjwDoc
 2d/gKEnjOaYU4UUHm0Cj6+xnYJNfssNVzgYel6z8irsIITV75w8HrtSA7023pKk7fTUHSpqV6a9
 b+K0IWNbdl0uOqsxyNijCNCTkKxmRHGGhyIShnW84hVXPyA5ysFWhSnnvulgFjlZMy9iKRHmtG2 xZmPfSemqcrIp0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX8BVIv+XupGUE
 eTFHLidBnGhKxHhCcNx5D1JQhtzrZS/VDLYGX4SeXO6sx5i9n6NTZ45pnRcxyWzvnHJnf+w2ROm
 4QcD3dF+ETSnm1ox1hrMaYpWyHDF+r5+3pgMggUhe0VmEFLjMfOGU0Ryd2yHXkRfhG9yt5t4xaX
 9RA+anOgj7vJYtaNEKl88QLI+96HN3bWgXi7zjop+DvQm0yTpSnVZiA4F9inkUF7lyxJ/+wx7Ae
 DGzGqyT74QdFOo5WEx1xFICgDktgXvCmNk8mekJ625z0JoimlCHW8zA0qrnuV1X6Nd+83Iw2nTt
 SBOsB9EI+Vgd7+HeBgUjaJ2pcDmNJIOfPs/eRxwujmKpYHmV/VpWMXo+Xj1HPTUYK9BodnYA5tk
 RgPQV5v1AT4KNkBiDNsWR9b0f/YwcbiyjTOn9ffzzrgsGS+McLsJD05BSGycwAAjLbKmbIepkY+
 0B6vUfSPiICshk03r3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXyeAxwWcBgRsn
 mRubJ/T0foCtHkn7VYQorqXcGI8GqELm/ivaTrLKsQwwa2QK8wf9QLbviHQ766RXYR7iYaeRhO0
 VOUZRzizVCmSJ3qiMOq85FK+d2YCd6A=
X-Proofpoint-GUID: oPqri-Pw4GkhI7w5QCHIWfBhHxYZ22M_
X-Proofpoint-ORIG-GUID: oPqri-Pw4GkhI7w5QCHIWfBhHxYZ22M_
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4b812d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/broadcom/bcm7445.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm7445.dtsi b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
index c6307c7437e3..7488781e0301 100644
--- a/arch/arm/boot/dts/broadcom/bcm7445.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm7445.dtsi
@@ -132,7 +132,7 @@ hif_intr2_intc: interrupt-controller@3e1000 {
 			interrupt-names = "hif";
 		};
 
-                aon_pm_l2_intc: interrupt-controller@410640 {
+		aon_pm_l2_intc: interrupt-controller@410640 {
 			compatible = "brcm,l2-intc";
 			reg = <0x410640 0x30>;
 			interrupt-controller;
-- 
2.53.0

