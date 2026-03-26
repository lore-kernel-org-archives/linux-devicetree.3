Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6349C23D2AB
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774529932; cv=none; b=B6ncm+3J0e29awxcPTjbyUwAwuykyPEVbWndIzwFhVg8WFIve00Cf9AECRpAIkdjnWJHGreLmxPxomf/vZ0A8Vl+YJ7cyLnKvTUYC5C7FWvfJv/8GMvYwklmFuGzllGqDCup6PGUalCIUO/zYBgaOIsAHC2VocoLtArhRc4mIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774529932; c=relaxed/simple;
	bh=Ixl7gLyyEq/SPWGuNNI3GOGTtT5V3OFcz7bvTjmm5Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGkkNWoJE0d8tHPHxbHjtub+ybRNwVBw+VRGwKaXky4YkQUOhQYKqQtPwIOTv5EVfD15AIIKnFHIh4huLJrtwPZKkp1zZAv3+Wy3hjSp/2bS7oa9rWgudt1tM7SCAyI0OUNSNHOCljh/k0KRVNA2Z7tqpTrW3+por3U9TeOY1NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNj7sv3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+AIHeE8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNj7sv3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+AIHeE8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7clj42887508
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IAUY1T64AJ4zQXFEnxXtoGFezJ96g7h5QWZ
	s/MqIj2s=; b=MNj7sv3cELfSx0qzLdTV6y28QuBelArBM91cjY/97rQwz2rHJkS
	XCS7G/NIdLVRgeUid61RBahVG16fR2XHDklQg7qWcyJkAzqbpjQ46agdPagnagA1
	iJ3maovuQvfJzpotj6NZ5TKMYPLXcIoe1Wt7NIqB9QIukTSB75RYIaUPiBQr7YAt
	OrjMG44jb+eJyMy1Vohzy+aUxr4qZW4vQU0E2dgRU+RwHCD6jDW41cg/Ec2T5vfx
	ugG4gD76HTEwhSH1+Tc1HPf9UcNkcuIRaMQJea2i51iU8goDEdWCUEnTLUK4RYI1
	+yPHzLuD5wK7yiiQcHLh5cwQrLUlje7HdiQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kg9314-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 12:58:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4987c698so24713491cf.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774529930; x=1775134730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAUY1T64AJ4zQXFEnxXtoGFezJ96g7h5QWZs/MqIj2s=;
        b=f+AIHeE8XTpSInpPHKKGlYkDVLs7WWgakTHtlWzOwQ+egBAQs0nWd214pM1Ti3RA0N
         Ah0ciWCU3Nnc70B0bxqs1vTOt/v70LFeaSbxOaoaWC/iShNxFoQiiTIi/xyKCrreHBVl
         LjahpEnIgqiFE2G4oIx+8fcRJB9jD1pODsTk/rhpOkPt7lZMzu95qZykBVjQAKAnlZXd
         2pqfHeitucIRfSWhyr31JpMkrx4cLH0RKrk4/3k7PTOFqQ3qvpRoUqoVm9GIEHDbtIcR
         hxc6jbgxd7XoraM3F9zMWPliMhLKGMKDgwddLmiYwn32eEEt3r+StREuuD8hVKtDBemP
         sB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529930; x=1775134730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAUY1T64AJ4zQXFEnxXtoGFezJ96g7h5QWZs/MqIj2s=;
        b=rmWrDHnmnb9+VeQn4npskC//DuS8xXBxrr6AKpK7QCo0C/JgbTc/1uuik4MwGzxnKD
         TxD+yPVCX/Apdu3ri86H0EaijNIahnSxgs0ey4PzM1mtUd3ZDlNOXjZ+tVcVZ/zoDGOE
         fiUN9P607+BHsKvI5iEdBOQ9zXIscPFJ6dl1g60fc0j9G3PgZSluXQqI46qgOdjB14yB
         1HwE4zhkT/fBRDJHbIA3NJz5ZCxDtWB8/B/6ucT4PN7sPAZx2+J53MUnMUP9Tr2z3zCb
         ufcKRS/i0mPeFo/IohcvNn1cXfFH8Rf2NMKGdyQJarwXWn11PRww+LvdbnPeKmSVDAdD
         enUw==
X-Forwarded-Encrypted: i=1; AJvYcCXX4vhwN7+qULm0ipivC8XMfhyGlVEh0giX4M0Ob2mgURbbtuO/SNUqGErYnScAl6Qbz02uvCVofktD@vger.kernel.org
X-Gm-Message-State: AOJu0YxiWL7gQgEh5umz6IjHf7j82UPMZ8MDUl4rQ5jxWz2x0GkIEclD
	h3cjNQ50QeERIh71bLgMuhaeXelpr/ACFyhHItAU24WdswqmzfT2p4Ovk8o9VblXz82D9+irkte
	noqzfmmUWeTjV4GQiO5ANmXd1IeWYe61FHfrm426iEL4YQ9i7fdxH9tIKzTa1Gje+
X-Gm-Gg: ATEYQzzmZn1K5ktb7BGX9rhtgaRviOLnUEaxsNRYdAz8XJmH5ujrf2H9fzWKE8YvAPd
	f/APowHxPj5rVqROb9gHl0GKii86zJ97/cxM1Yjdqd8lfB6wc4Dq2PYOSz7X5TL6wQlbTfUnPuy
	5HLqPmTPqAMeWVae+Q2i4sxTVTrE2lPbqay+zOACpljz+NJJFssvMWlcjQwDvqyfzi9+B99YHIz
	qpR7sBWy2zGR02VqOkGc7YXH84l5bELqvvYbG8d+syvY6Uk5qJKrgCBv3NqZCeZIDjOy+ez3D7G
	NkSKp7f8mXzrZtXG8VET1AxUSrQuEXWBcxepe/Li9IpWAlp3/twbnWORpS31j9+Fz6oLKaY/lAN
	iJD6fqgZTNY6O0Gg81eXWi5bb77s7NWx3Rn7XSI9nsTo7vtjYOeBUTK4=
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr14197571cf.17.1774529929875;
        Thu, 26 Mar 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:ac8:7d05:0:b0:506:baf9:5dd9 with SMTP id d75a77b69052e-50b993e4965mr14197221cf.17.1774529929450;
        Thu, 26 Mar 2026 05:58:49 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb0d83sm29253065e9.13.2026.03.26.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:58:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: monaco: extend fastrpc compute cb
Date: Thu, 26 Mar 2026 12:58:34 +0000
Message-ID: <20260326125834.2758331-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c52d8a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ebg3YuX8VNz3oMcFMKwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA5MCBTYWx0ZWRfX2HrICi3fF2+U
 9xPVeqwbT7qKCeZu86LQ+0BiLNjsAHbryhemkfCR8//+Hy3Ul9Wko7dGa/JWScoPfPOhXvDygWW
 F6nZ82CC8xpI2D3bDq6h5M+nY7qEuE2H4VkoiHbVbYNrV9wQXj5rfUOI35A2kJIFE0Y8auyITiq
 KkSQX9BUKJrOknXwgpNpnoGhGTquNq48KaDO4eORb1rhqAtHeJXq6WeNE3j11p7nzXGBO2/PnWp
 gYy3twhdGD0AOJI8U9hH1NdXhYvHx4wB5qLSLD8dQIzJZOvo1IevszuFUyAynmGi7wXYZcvLFLf
 vU0sPBqzG8ik95jY3ZDoLw1VNIg+nm5a14pHLjbJJRU1XOL9jF+C3aqgLtW3MHXHEFvybjfAgxe
 BK8niOKcI0vM+MdVOeRKK7yENh4ddmi2gyZiLYMe2yeaoQZH1i6Gq1WjBfgnGwK7E3wht/VtvKU
 hdu85ybZpbQQJ26SNfg==
X-Proofpoint-GUID: FJUSed-gOXD_meZdjCAIkRiY-njmC-3_
X-Proofpoint-ORIG-GUID: FJUSed-gOXD_meZdjCAIkRiY-njmC-3_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260090

For some reason we ended up adding only 4 out of 11 compute cb's for
CDSP, add the missing compute cb. This will also improve the end
user-experience by enabling running multiple AI usecases in parallel.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 10e799dd4a78..884a49c0b019 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7739,6 +7739,55 @@ compute-cb@4 {
 							 <&apps_smmu 0x1964 0x0400>;
 						dma-coherent;
 					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x19c5 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x19c6 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x19c7 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x19c8 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x19c9 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@b {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xb>;
+						iommus = <&apps_smmu 0x19cb 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@c {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <0xc>;
+						iommus = <&apps_smmu 0x19cc 0x000>;
+						dma-coherent;
+					};
 				};
 			};
 		};
-- 
2.47.3

