Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1D3F0748
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875093; cv=none; b=ceTbK+JWaPvmuGpwh0hpWJzZ4XFPWCx3XvojPL0uQLC/odzK9EJCwBeC9T0VS+iM3iJgxoUDAQTi7KI6pZ9jeRxJEKB1ASJyUkq8DmKqir2s7gT8VhE+iSwrdHQnBlUAxHPkTx7+RZuDyIFoQGi5bbg0rnJAs0H2JrjA2d2dBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875093; c=relaxed/simple;
	bh=AfGMWkQSJ7LzUVaJkCKm4gZXr4bFLsauZkt3pqx+AOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQO/RBlzQxG/YyorSLdPMxogO4RIsKOCGrioKLxtP08CSwXXV8T0YLapa9PssawL+we3idI5oYBIMO8BINxEVV0fbmx/yE/rrW3iiL5gMQXt1jKKJB4kSQSzlLpaTcPwAokRfpZvz56uFbXTg8u31ri77tM5t9/l5GMo7g6n0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdP+KHXS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNY+rTYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdP+KHXS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNY+rTYD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mROg2152246
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=r7TCBXkC6rN
	bkZ2Na9DbN/Yo7WelMgj9OYLFhnu779o=; b=DdP+KHXSGhCIO8FWsI01l++TIwe
	XbGTk0G1s1IpYJbPw2US7xe7AZsLvO0heYjJPF8VJXiont7pe6JP/zxkGPvicBpy
	FFtKPSBdsdwygu8utwlTjnBXHnK3Uj0UiJ4tCNc2Sl5NmIHQ/V/QzOX4mUfXF4LN
	f0kPSZ12mvKngDPjurfKAf4q2T8HxzCSwLFnxJESlAhZEjRlVDUMmldw6JDY0XDd
	z1IbVuSHf0Utm+nX69mqhihQZotIDOYa1RZS6gpukxtE9UlZc7JejzqRKKWtimWJ
	ia59IniKwQ3lpaExSyNsOlpt3UZVhcuMBHt2S3Z+0HBA59dlQnYhy2eLpTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgt8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so80431225ad.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875091; x=1780479891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7TCBXkC6rNbkZ2Na9DbN/Yo7WelMgj9OYLFhnu779o=;
        b=NNY+rTYDEX5bqpXghKBETrUMOg7gFpa0CgsyKGxLensu0IbGn2swLP1mU2OlHZiq9C
         320amKWadL3s0FxJwpiVjBwVJPGggYIqVzGWO6MpGGQyPv15DgQX6joAF+ADhOyY+3qa
         sVQUVMs3r5JuJvuVeHpVzWVChUKmy2lW1ivst4houra5TbJNnsEDcH3Rlm322IjWIvUM
         pLEqV4xF3U0xukfub12kOYXpi+3v8s/UhEsi5/t5ttfI6b/NvrbzqIn5uiEAJypZcGuS
         5bhQ6r/QL/0qqJs0sXBLMJKTLvjlX8eYIFd9C1LSS0SlLVI4jdd//7yGsqADl5/hNHSX
         xqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875091; x=1780479891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r7TCBXkC6rNbkZ2Na9DbN/Yo7WelMgj9OYLFhnu779o=;
        b=KYR8EIcScw7QRcrHPgTqarEs4fPE4j/GvRGeI4CR/EBaZkXhTc8taizg+onh/Pc9VD
         0WsJW9GQpyTYPVk5545uavEBXZjJRiAJGmoh7ycizIsy1dK9IR1M8X2c/gPloOnqlWUh
         xuA5eTI7UOsKWY37B7yVtx09CSYCGMpTORqOTlrFIWHIBspfKL2B0jf8KEzd+yRqM835
         RtEMYbExOrsK2oDO5/VbrLkd/56iY4plZQc6iB/5NWco/+1Rfsi+cZluRdm0XZWianZ8
         i+V8hEJx01blx00oFVH1uCKXN3mzSQVvd8kaWqFUucSOjUIBdTGKJnS+9uwM90mJxeJc
         Gjxw==
X-Forwarded-Encrypted: i=1; AFNElJ+cncnJ2YV6/keVjzO1+Bol/Jgt/RwI87jUprMcotuKdbUwGCdBqCXpyGs0qqrZEvkLeUnmTCxv+E5S@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmF6HjgmJ1KfF1uqrk565aUYw46VBsNVVTBokA9U7QLIaUCK/
	ydStXJdve3lBa4Xj/732TwONS6x8XaumFTlsQkJg9Gki+RgXnI5ID1adrAH2cH2PXarzY3SheQF
	NaVxjr74//eSCnhLGPYnj58jpVc9eLmow6IXW5+XsPxl2PJTgKdXOee0rJVmdSusN
X-Gm-Gg: Acq92OF90Z2vnEHEF2wWc0aLGHodiE/ahCdvszAyIjRr4cP9IfafIf9z20r1qyS7UJ8
	O0oo77x7D2PLK9T053Obgs/3iKAk05krWOLHnTS6NtClYyFdslbVr9R5HZB6CarBBa+l42z1caF
	xJ2J5K+2MSRWEKALzCeXUYSExT6mMIlWeumUDoaOFdgWxYW67hwLxDUcEqZMeWCSD7ufefqvcuI
	CqvV7Yu0ZPn+JBsW/IjoObDdNNYxdwCqckU1cVGLuwACccpYGCDwGvbiJrOz56Le25YLoN+xbQo
	t055cafNao0CHQcMGB1+xpzvh2jtUAz4fKJpxejbbNNUx3qVK7Ku++8apNJftzfqKyKetM2kVlP
	u6mH/+40lrH7/HlaedOk7TAkvuTsLm4dQOX8AHWtVikikHNJ1
X-Received: by 2002:a17:903:2bcc:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2beb069970bmr238800645ad.25.1779875090577;
        Wed, 27 May 2026 02:44:50 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2beb069970bmr238800415ad.25.1779875090077;
        Wed, 27 May 2026 02:44:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:49 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 17/24] arm64: dts: qcom: sar2130p: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:22 +0530
Message-ID: <20260527094333.2311731-18-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16bd13 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Kg2GlfR0pfIXhFNuCKsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX8X/oHUpz3cep
 j12Y36O5E8qPgg04xKoIDqDdClkT3uBNBTds3SSuCaui5PjtQnLVDF0roxb9r4dGCxKm2laWuBt
 p+LmJytKicYLe050vMmQ/DF7zOiaZYMcNsW9yQgcXHFSar6doDjnZRMhh5qqrZZa6iGx03Hpoz/
 SI5oS1GHhlp/LCPElPNHAGDufvJ7CZ04LHk4A/SxQ09xNatV7g0dXZ3dk8bREku2qNqsb2jQutg
 y+axlXrUdK+BQeglK5eP/HLWOsofoY20L9b9SGF5M+yXas40L3Ppiagqqaslx919JwUyV9Nb0AM
 yq21FInHXqnJLY/Np7O59gkpJqz+h3VsFzti4bC+uH2kwsI1Wtiq49KZ3SKKTceZDNY5UmXPSmH
 PavebWyJZbe0oTEwM9EACCLFZmli4z+skFTbK+wWrItbd7SIKntMQVmyIS1w3SKd4rMpWGlchN0
 Lai4polGWRWcrdTsy0g==
X-Proofpoint-GUID: h-GEtH6EYR4Nj3YdXUYO1MocZ0jbCHii
X-Proofpoint-ORIG-GUID: h-GEtH6EYR4Nj3YdXUYO1MocZ0jbCHii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093

The OS PDC DRV register window on sar2130p spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index d65ad0df6865..c4d48f657e5d 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2417,7 +2417,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sar2130p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>, <0x0 0x174000f0 0x0 0x64>;
+			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x174000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 94>,
 					  <94 609 31>,
 					  <125 63 1>,
-- 
2.53.0

