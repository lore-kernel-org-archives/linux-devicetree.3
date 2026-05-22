Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F147A37B007
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479677; cv=none; b=rXG5kdRDFgfb+E/dDPQ7Rc+l906/NqfFe7hJKYfY3ZC8Dek/KhtvFtLRxbZe3qR7jMuVlNoExz29DHIueNJ3Ned56DIooir9sz3QU0qLucd5baUSD6moulKEELFSvAY5C8HfwIljUGG2Kd+pBAFrr4yeJ51Jkrs2DDQV5K/8cYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479677; c=relaxed/simple;
	bh=Qc3nZ3OcdnS1cPCaTe9FyxRpFxALJ2JgOgiN3fJelqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbhthQxB3pFF/jevbFxpAb3qsYqeQaijs7FZiwTidr8Fs0dfLIPTrE6FSXnZOdh1vQcXXwQYTFpm1iOmerdH/Iu3y1t5dj1efF50EO+tVwf9YwzjhEJqE7cJTYdccB0NFi4CXkOj14U6jObAu4An6pu13ZxJtouKKATxxMu+n7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oibm67GO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APD4/vuQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oibm67GO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APD4/vuQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGv8cH3947403
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WJaC5/CErHJ
	2VUtX54RfJ1hB0iwTR636c4FlUn5aImo=; b=oibm67GOsp2o8QnAPQE2f3ngoCi
	36487Pr+GSwi9I3sDtig89ZG3rLbfpfrUeU77P9jfy/cY+XEztY0bFqGlqvcJhtK
	TGpvZFqkZYngfVFFGJ3YDw5PBdblaz2V2Ir4CanDTQF8I5Tu/tesf2LTjJjuutjc
	GvxERRwuSmtlv7ywDMtaoXYmkoNK2bH/s6mIiAnMwRFQ8eyf3QNRMOz9EMr+tVmd
	YjY+cqsAw8xkPmnh3hjfbrqwLZWTakMGUpkFpjuSWJuASC1J/tooF76e8yQ4FEwx
	iAm6iscP97QmB3UCgHDwFs05ulQ0kg3f/JlkpliAxv3aITY10Z+hXaqElKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2nj7y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4678c6171so81795685ad.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479675; x=1780084475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJaC5/CErHJ2VUtX54RfJ1hB0iwTR636c4FlUn5aImo=;
        b=APD4/vuQXlMfrGnCqPzSedwDoKE2FFAqwz0LOIFLQb4CBI0cKHzgMryKVs+1+pTS18
         dBMnWthng4Va2Jzbf7HpQgjO6iAI3FojsSupwpTGkI6T+Z08X0c/eD/eqxflbYQzM8IB
         Um3yeG2VYjsstjod3wqiBQwY2GDn0KYVxjuyK1VXEy2GtzIdD/eZJgG1o8vMfeY8i+b8
         092zPUFHeOkIIJJFRSW/YPvaENhwlOEel2AkLwEqajtCee+TJsoX41VWqqTdbdQe+Rln
         p4RO15EW4olYjNVuzOJPupuGvsh1zR/Js+MxO25BLFqrzE4z7jKoX1SFsSQ/P/Qds7rV
         EJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479675; x=1780084475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WJaC5/CErHJ2VUtX54RfJ1hB0iwTR636c4FlUn5aImo=;
        b=fm4C7yWHBG4Ceyrl5JC0bihJpSiBNRkN0mjSJP4aYMXsFdPN8yoETc9MJN8nSsZsn0
         eHHab9UQPiDuiT/DxrpgRp7cETTo+iEsx6BUmL3GU1b8fxVFBZkpwEG21VdDCGgUA4g8
         Auq/sdxI2WZPqV5ye2Cy+y+c3gN/rB1yakBGgadRvRCKw60yvtRL3VrBideBb8zXvuDi
         7+sXQrCWZ5lhTrHfMkVFNpCoVIQZXW3qbhjE3RXv+zNcZuaBORoLNDx+IJyuinwlhpQ3
         Z5w0W1zM/xQPm6J+FFWDQ5EMqKqEYHOU1ZN3W4b1+mYt4L4XcUvLqjZIR96RRJEyxzVY
         I9IA==
X-Forwarded-Encrypted: i=1; AFNElJ+B5tzuZUf83kqYKywtseqvQpRGwWHM3SmkS6hvJ0mrX5EKlQpmRI4iQ8WcbKEJpiuvFY6pO6L3jq73@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8y+V9oEZN1p2qqptPjoBNjOW3xFtvlPyrwaRDDT/rZyluknGl
	3DnmlDyg1CcALd64YeIK1AKlb81YcOLmcdeq8zekcUPZPsxxRkM/wzGle8yfksj3csiniuCjE1j
	5f2zUCWRf92HiiWITnD7akkbTfazgS94c/b0SZN+K6z2bUcKby+nTxjF0ERWM8d3y
X-Gm-Gg: Acq92OHrWW7/64SpbFhl2pHkjS/EreurFYx5kduE+faac28PxG8pOSJ+Afshj3ne4LN
	yvwBX84P8G7w19Nd47QkswyrhCgWdk0Q4z6qK1rx0PnIHLa/hneao1nnScKGQsYExbAog1+Gbgv
	19e27jfjCA+E2YrJouqQdZreqrd0JDkkfA7Wzo9zEM3UN54NMaZuAjYv49z7NVXds6ySJW7WwQ/
	0eLId0EbzIVvsRFeRf5eQg15RS/zFgt1vuX761vRZfqZJH91FUVXSOHw58cpTIOZrhuX2sy6A/W
	KhaX8vPuRbKsHL5hX83ZbobmIH0CWTSWUBrEvde9p1SThfLjhwmTuBYwn3YLTEwVA2ptezKc7oS
	9oCdz+zHANgg9qYUTNc1yXfil985EJIFA4ObF+Z074Ejw7Hc+3IH4O1U4BVw=
X-Received: by 2002:a17:903:17cc:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2beb0722d9amr56947815ad.10.1779479674671;
        Fri, 22 May 2026 12:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:17cc:b0:2b9:cd2d:6f13 with SMTP id d9443c01a7336-2beb0722d9amr56947525ad.10.1779479674156;
        Fri, 22 May 2026 12:54:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 08/18] arm64: dts: qcom: qcs8300: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:59 +0530
Message-ID: <20260522195009.2961022-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a10b47b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cce3eo5V9lAC2CK9kT8A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vVmuLIiSJ6apl7pULobOkImu4xjOqFOl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX2J8U9jMtiOTr
 c7czniHipb2sp2tHVwKEEdwty2mfqNEd+PDns/dX/pHGtFGURRHxiO7/JpcRISCl6O03RDIab+r
 86aTIUD4rv1yd7Vki+/ipfDXvHWBldhBrKCn753R8SclaDo1fz7+Ss1mnDQR57VS8V+l4YgRoFQ
 /LD20b7ko12MY4dt9Muo4u+j41iqRNkLLn71T5b8VFUdKID8NZet9T/JuUY0oHfRJWGD9m39HzG
 KoCT6CsqMs2li9hLiRfXBclW0CUnLt3UXrDzOheMwV6vmL0JiF+utyV80ssidABr11gq3ztjG0l
 PWsVrUdfiUDtNVfew46WYElbPUXr9XL95mf2Onx+jyjnaNl/Vjlge1qW3m/P0a/6HX/pN4IIzFq
 qYu8obyk+yUz+3u+WG8yk1pGozTHe9RfxCra3JNxDhjr2upwK+YEA/nmJL7zLV1fYsOWxxc1bDV
 o59FUCIQNavMotT/UpQ==
X-Proofpoint-ORIG-GUID: vVmuLIiSJ6apl7pULobOkImu4xjOqFOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..b408ad9c0844 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -634,6 +634,7 @@ firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs8300", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7150,6 +7151,10 @@ sram: sram@146d8000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

