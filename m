Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDD43F0AAD
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875101; cv=none; b=jkVsOjr/FHQ8c64W96i4f0leepz2t/74N0f6CxF3UzP654lw1E7bMrIh0S4HE//0LVy2aKuEZAP0Jhs2opGVmOjatSckQlmQhP84jCG4jkGrtX4zGNvil9Z4XrPscWjS1RqC0VyqOWon2wYwndvTbuRfmeOJySrZd/Pw/vp8FIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875101; c=relaxed/simple;
	bh=paZ1VgKY/PWrYrl9OfLF0AXbdlU0uMS6CSshSEaH8jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOh01LabFUdBlIhwp344ETRdJ4+1Td22a+lRsLXCArncZLzLo5Px2GBcXe/NtUlAMHUCaopiFMZnPNTMmPp5vDmKBWgo1r+c8ikUrMNCnRw51NgMzAyE+5TWFBJDst0y78wvXZza2mZbYOzvtfgJ2yc7I/PdEZEz0WVXPpAPYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTgc+9m6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0br3CPR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTgc+9m6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0br3CPR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mU6s973137
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sb6PvNVK9vN
	wLF68HWvMgWbl824kGzgEkn7lQUwIrGw=; b=hTgc+9m6IIdfEEnwfsstw+BGK6A
	7HHCV0pqjVD1F4esVuXma3cNa/9FaiUDPc5pexzP0HvfQpvfUarDtauA1Tz7+eML
	682facLQ41aysQlUQPgb4fBjwb/dtODaPGl+Eq5R3X7pAyJhXTOqWNtd9mqDgwYU
	zHUpNZCawVORd4l3SlLm39uLKWfs4akNxbDAyhkpjH50yfBU6CVA8Tk/I5Ekch3m
	u/1eRTghpxBgKUPDEAM0kekJDd4a3efXaAewkpOIlaEKe2iu2X2+wLOyQuJn282B
	G5Y826LFuBx1FjyO5aYscJ43k2FtBQTolgIP1kqbbGO//UlZQvIy/rwiylA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff3ha2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so121425785ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875099; x=1780479899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb6PvNVK9vNwLF68HWvMgWbl824kGzgEkn7lQUwIrGw=;
        b=i0br3CPRLxRv9dBSrlnmysX2YKVKAINIWFZNc+wk4srPcB6yN95A+l0A3DdBR0vEjg
         leC+RF9yUvMl8dIs/YhzI+fucGJ3U9pluiMIrdZt3kFGgMHhftKBYRiwNq88LjrD5YCf
         8IFCqy0RxgWN/d+jkXdrdS/I1C3JXRtpLI/LZ4NuskSBu3TLIP79wBkpiwoYTuMaa8Js
         t9spNflV5FdDVFaj8k35C5SprVjJqCwlRvFvWIyIkCmEG25KPrhhWWW/0BRPhzV61VJK
         0nRsUcOUudO0AGlvOja8s73rhj24NLenTN9o0nsUnAZe6S93v8uZbSP6jBeOBbM3Jc4S
         dNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875099; x=1780479899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sb6PvNVK9vNwLF68HWvMgWbl824kGzgEkn7lQUwIrGw=;
        b=EP7q8gxJcJDPMlocEmQoVqYSB3eB7kd4P3cIxtnmTfHIArMiMe9QyfwDG40mdfk58B
         E3fBqglN9uo5NjWooMR/1IdKX627Jn8LaXcqgfX1tOy/cJANiUjKqYKaUC985gwKSK9f
         hobJUpHEp+EPwuutJyr2xwxsvFKxzjnSyKqz02K/GjmEJEQc/VA7pftlyo5UtoIyCrug
         NWiseu0QNAyiyyaX6dXtiGQ3vM6w3N0knNbn9AS+KJ0CM6PCVMwcfYHGxYi/H15bjCue
         n2Rm9/oDhAN6qDvp5fcu3r6g8ixiV9Gjz6HXv7H7kNfdgtwgzTO7gKyoIy+UNhPOM/oP
         vlFA==
X-Forwarded-Encrypted: i=1; AFNElJ88wvroyEPrzPVNqU/GOrvMeQS+q5id7m+u3FKBUsimRmq1xArxOZ8SMm/m1RhAtsR+RVtDXa1p8XVH@vger.kernel.org
X-Gm-Message-State: AOJu0YxAhglkq6mT5NFGRaa1fgI4nC3ZGJLdiE0S8/SY628EjukWNvNe
	cPmdTHDE7mGHQ62LvoLLE8Y7c+zQvW1dsWHCTP5Xyuqu/VFaHtSLJb3cHsJZcKVs0TwZ2EzNqUG
	55yOJwoF6P0hB/Dnik6FYEdM6nd7d9UhqCpkNOhZuUZ8PMtQBb9VTk8F1O8EN/2gK
X-Gm-Gg: Acq92OFEFneO3n3u1V3FrBKK5iG9vsez2uPR7US0KEXJHEMcl1Mpqwj5q1EmCoFa1Jx
	E1Qut/TR3nkrPywuqmntQaUAXwQQba/ou+VYt8DEopheHoOmSPU2Ho0g3aERcRgLamgdAHGAZ+g
	pODePqXz/6YX0qHf0QZt6Kve1Zp1c0uCW8uVRzlHmwaMFQSwN6yaYCVccLMaTbJM+SV8s9xmbGG
	7zjzCkc9EyciQUwjy7kilK/Iuth6wyJiwWoS+4ADhWW5dPqF4JsQx2PSRdh7mcClkpUQe8xoO4g
	FcWgkoaU4ddB+l8ohDXFIl6ofHCgGxrEsnk8lfs3YAOclNF160Vzpqfplr1kWILKUDhmhqoZ+is
	W1p8VfjM+QHOMtBDzEOoxu4/dYmHx/r5SZUbPCHKTMGv/HIhb
X-Received: by 2002:a17:902:fc4d:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2beb07b5d46mr241734165ad.34.1779875098549;
        Wed, 27 May 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2b2:5314:e96a with SMTP id d9443c01a7336-2beb07b5d46mr241733965ad.34.1779875098021;
        Wed, 27 May 2026 02:44:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 19/24] arm64: dts: qcom: monaco: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:24 +0530
Message-ID: <20260527094333.2311731-20-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a16bd1b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zdDIsRo0uCqYaFkay3AA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LPSQ80MO7eb5SDx1Jz02Y-9rqbRRqYYX
X-Proofpoint-GUID: LPSQ80MO7eb5SDx1Jz02Y-9rqbRRqYYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX6hBHKyXW9DmP
 g6eoqyyOOBEC6H+qG5fyH8feWNThHATNOyF3dA6yl2h2MZNJNfEYmY4CA+BwPSUywBmlg0/4uTt
 LGko3E+oYdqBosTr3iAekLncpb8nwgs0IHtl62hdbi76cOTw5Js+PPHTdKJh+OQcFXZR2GPCrCv
 WshuiW5bTv6TJqdGQNuSGUE7iO6dqUT3kiCBRx8b04RuamyOOzqQ/fkNurEPvYDjh/orUd6Koqd
 19JaabNwFnlfN32XasLMQ++mXxQr+VSFEJPNaNANpK7k2UlmIvXqUKujmWXMqT8lqs1Gc1kNeOT
 r+Pbj8zaYEzdBVvLTI382Xomyb+0OHT3hN+cnn9O2zpZltqu463mmbpEGJeKgyhoCvugEiBoLBc
 M7sYp3fFLZCh7eHc1p0JNRTPEVvsj0qLlcjiNajdkhCfk9GZs5CWfVdfwmt+30BKa4+Klk4bchH
 wDpWYvRZ4hjJ1wKoDzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270093

The OS PDC DRV register window on monaco spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..62903daa9cf2 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -6073,7 +6073,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs8300-pdc", "qcom,pdc";
-			reg = <0x0 0xb220000 0x0 0x30000>,
+			reg = <0x0 0xb220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			interrupt-parent = <&intc>;
 			#interrupt-cells = <2>;
-- 
2.53.0

