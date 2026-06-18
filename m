Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ACA3C414F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782537; cv=none; b=DB20JpTuAp4qRDMoMLvpArzaA7344xcClytcLXdUoKfC4ZNMIRrbRUZNwGdKw1jhBw0/ckqBIIDkgQlfTtSqQnpZBRvGcTGSNGxLc+iitWC0ZBClDSqeHvDOtjMknkf9x6f2BDgPVuDoDhs7v/OexhUouhsopJdTyeqL5YF3stQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782537; c=relaxed/simple;
	bh=mlb3na05TSFuumjcboA5bHq99pBRdGeM8PJe1BADJk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oh/iebaoyf340Fap7gFjtsiz5P8JqENDu2fw7KH1G/+sOW/ZMbG2tSAwpfmp2ZnHS0JbftErdpIG+MJHNA3UomPH6OzFh4fajRSGtL5QDdHTnRxyJRSzN88chtDSbjiLpgwJ/5jYyjdLk74TnEE6Jr9zN1+J520rgPh8mXTg4/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOKJSaMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cY8tgqcK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOKJSaMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cY8tgqcK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IAs42Y1334220
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c24HNE6lCA8
	fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=; b=UOKJSaMDiviT73FR9EwfxjtxFdC
	5HyLYwsYDcz9gObNjlpHyqjeh+gHy1nQ7YuRldJBiMn7sZkTefLoLEEHTUBS5Lq8
	7hVgnr2zz0Q7Wkfn3SNV6FN0RxYfA1eGJDOJ+T5je88+NMROx74POdOSZjkKO5IQ
	+hNeUW8O5hejZzW+xjGn38nhU7iY8O7b/+d3FKkSYvanNUxBEE9xkR6j/MEi5fyb
	BRgURjDh6/X+89SUlahMbUcv3TlgRGClL5lrjz4XcZ+HPfml5E3wp+JEFNRKcS91
	AY/o46cCwk+9NnsF+ZVyHeDItEVSb1BZ4W6qY+J/5fqoTBH7hkaK6LPPufA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2y0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 11:35:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c9d82cd57so1039732a91.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 04:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781782534; x=1782387334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c24HNE6lCA8fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=;
        b=cY8tgqcKc7NdTzCJ+3OlJyUOZSJZsY4y0lyA4QA6qwtQk+YJL6MM5+h6Q9YqXcdA0d
         0LhIx0DBAkK/OXV4Gbvjji06+ujAKpKV5wwzg8DWvUf4pz5wG+sSJLQhnjJ8vOXgIGqJ
         clPEggVGgyq+2SmpKPGu5uzDCG8/GkEhjzAr9UYZAzShEbo4/dv3Vj0GbYbyz9AfwFu9
         4YlvYZm4rGtfAUR0ix0qmyKdZ+X7sZ4e0P7Y9kAJwztJtjcMI/ipD46zFwEzbYL8jhDh
         ByJzP39MgEYYIShKhXEgNj4bwkdWYcAGq4EaoDRoSH9Ud3z0938IFpHdDAcRCcptJpj9
         hJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781782534; x=1782387334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c24HNE6lCA8fpSztzgUnXvl+DfaDo/AAtNxdyNGgpeo=;
        b=Kbgv3l7x1Ddlah7i+7th+y4VkGMWsb7dFb/a66zEZo+1RXvxdL0HwqWmTbtWzMBqiC
         aN5b3ewk9H0lv2OSMnMtxp7n7ZmPkYw8GqfwxjQxCA9zTzQ2S6/CM5dYLCs7V/9gnnGv
         gtPD1cskSm47gZ3c1hZPY5MuEwg+xhsH4AHR0840XoDemFHrBO45dytdjuqO/6WX/3Ed
         2KG8Ft7W2UZn9ROOX24UizI3GRpiyA53Rh+H/q9Qa0eEyR76R4Z7ZtKL7lYGYolIQ2hn
         80YX317ifXUCYkasV9//NuFITyZ8QYf5pENqFGjbz0Iuyn/OWfrwwzJZx8jVdRFv0os6
         RC9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9in7wD9YhD3Eli7hJmFpJXJdqgQJmariC2OJBsDye7eOlwTu5Gaok1pDBo1fMGDNMzFIMFMJcUqJu8@vger.kernel.org
X-Gm-Message-State: AOJu0YyiTN/SSBg9/8Lbmkn/C1S3BsbG23CmIVETboEWlh1I8FhdJ8An
	Q8OM/onUFroSTdY1QzHJH7shiF0aeSEhiUrKHOFnCd03hWpTAqhYfylb+IemBVPOo/svqSnQhR7
	D2IfkXvuPkrhehIFWGD3wb75YxcV3R9xi14vaaGTCVGJuLZVEFuy4PuUa+u9Xvxx/
X-Gm-Gg: AfdE7cmAy3JFnpOxx7/gGrlgO1kEhGahNy9cBGXoxwMCCB9okxSOhAXrRxJ0EMdHZlt
	EuF9V1EjQJplc6i+IfEUKDkCEJtH6s2XvS0xvQIMKOq4bkA/uyRasRPAnXnWv/9VdM1RZmKVQRQ
	i5J5YbxMWTs+bR2cHDXA1O5EOF//Tdng9P2T3EBrOf+a2ft2fFUAjrILtibfjLmfYpq0KSSn00R
	9Qs1SFa4BOq+7clCNhzfwlAVJiuvnsqwCcMBrnTbW0rpXJD0QO8IAgPofCK+Tm7oDwA7dA7UFi1
	aAb8vu6rC0S44pxkFLIEsgczeKqp09jrd04/+KrsnfJZ4WpYv6aEvlxIUtKXGdE1zFVTf5JRKb8
	cRtKpoLwWLoSpj8lm8gIUXkmyOA1Vj2CHj0gf7Xs=
X-Received: by 2002:a17:90b:1cd0:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37ce4512df2mr3166724a91.6.1781782533988;
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
X-Received: by 2002:a17:90b:1cd0:b0:36d:ee3b:fcae with SMTP id 98e67ed59e1d1-37ce4512df2mr3166671a91.6.1781782533508;
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ca7a7sm9067856a91.7.2026.06.18.04.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:35:33 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory and update APM DAIs memory regions
Date: Thu, 18 Jun 2026 17:05:09 +0530
Message-Id: <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33d806 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=giDWo1LGG_5EQGLNojYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: DJ_UNen2xTrLwSh1mjt0m7r98qjGJlfd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfXzJAdz+2SpJTw
 19rfqpx7Ssu+sPnmbo3nrGd2q+NnNO2LuKANxfaHMEon+KJcohZDiwfwjOFCct1XpBJdiwOHXmK
 a/q+fUVI90nQldquczE3qfPKYHEuMvU=
X-Proofpoint-ORIG-GUID: DJ_UNen2xTrLwSh1mjt0m7r98qjGJlfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEwNyBTYWx0ZWRfX3VGIsGuJf3d6
 rX+02JeGyZTlSpWG8HifbNBKV3Eb4wtK8/qBBWExR4aT16kgoZhbxIVZINMoEk9o0kQYIIji/6z
 XLRIUDWpLFeC2NxbSkfqb2+ZJ/eNxyVB/W+1yvv4J6BH8XaVn3e1PEGyLj2pzlZKeyoAunV+nss
 ccDSFHpDjb+2fDd1GipOjU5BdfRozKfFadXBsOVglFSScMKRnNuYg8YX84aP4Ty4RbQMwJUPZt0
 w69i/wZ1Bl5bkppzlr4ciKiX9UNNl41hRLRbOD+snSTK0YtrbwfwGBEFeWpD8fVFEGx9f+QfCOd
 zJpzF86ZmRZG4kdpMzjE6FC+DxujwxYddrqypj8Cjto6uL3BlhpRqg7+LSNuqUSB6zgrhqslON+
 Frya/suxIH51RTp/723GdHSnrIk2YngTlbSUYLVPR7ABcN63ckPrAqxQWe4IouD9tkxRsEw1Dyj
 ag3lKAv1u+3QDmpyprw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180107

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 88954ee943ef..d744f7e38ca6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -365,7 +365,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -1935,7 +1942,10 @@ q6apmbedai: bedais {
 
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
-							qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
 						};
 					};
 
-- 
2.34.1

