Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E169C446062
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320864; cv=none; b=N+VSNUd4v2ib7RjUTLSDpXqxKHqqFh3uprgm5WKp7TaGULdd9f4rgT3ooe0aRXiHR0Ke9sgtPOGZa9/JdJWT9GefD2f82u29BptHVWTBTmt1bBb+6r97W4rarPKQBIlf4XoMHEh4em4AiUvUUPZred5OawA5V+QpserLHBe69rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320864; c=relaxed/simple;
	bh=VA9ryQpuFW+TP/KlLhRrZsh20avtp74GOWPwmq6me5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3xjU/3AqurSoPsMk6MWjQLRA+opscmYMKKp0QI9iY7BxZ38/ffQaZFK3DCs77Te/0x1aSnwDPtaMIiJHFU4R7oSv/jiPFVwntrZc3Jga9sF2Rsg0lQ1KP3hkgezgOBsyWs0hYTK+eX0JQi46nK7adVU2E4V6ejSvzeWMlkEiYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=geRhkQ1R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVLLOboP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="geRhkQ1R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVLLOboP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ewfK2326545
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pYfMPL52K2NTKf0PF0OmsrszrBlQ7Hy1Y5N+shPjCXA=; b=geRhkQ1R/KaRnr5p
	Y6fJlxSyajb2ZeAJwqiiG5lcNBG0ymcbVUJ3+gf9UwKdmhpu2OejScJ1WUZLCpo3
	BoU9w0AXSdedeVG4Y5O7CkY3Oy3Emjzliw8BIG31SfHA6TtR5RIb+0qwHDFLwS4U
	Qz32nf1VWSRoif3xL/uZ9243USFfyfvWfF/X9ioDRNe0hVxcgMN55RrIGxWTSawv
	EY98V3CStxKk5ZHk66N1B9W+/K5MLGkcmhz95k9hSem1YbtGOA+1NHr7Md4Q1xLH
	+XEuERwCnR90NYNK+78g2nRrYiZ7ue9aOdxpzNSEwHW+22YOMuMT0BLU6v88kWRP
	tvEpBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1h6fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccbdbeffb9so2105675ad.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320861; x=1785925661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYfMPL52K2NTKf0PF0OmsrszrBlQ7Hy1Y5N+shPjCXA=;
        b=cVLLOboP2sRc7F4lkf7xscwv2KeIqYRgQS9H6psv3/Fzl58i7b+PPl5SQdmm9Rz1a1
         wehwPEPTkDAH8tuVOR4An6pFoE1AvWgSv5dLN2a+XBGXE3PcMjeDPMJkNTfwfLozC4aB
         bJG4wjMgOfTXO0/4Zjcx+AClxeSlT3lv/CSrj6fES0wumDd8w6eHqnoXqGdeBMMOmOXW
         YCpiVRuXdQ+vzdDqlp+WRBb7VsuZX2E9lXK4q+ZlibjmhHBXNxTPVpwq8IazIW5oCuIX
         aqSEjZhSZ2eMsMPas3rhfjmZy1AxbolKQ6VJ+2eKWLmgXPyB4HAKuSLlp+EkCBVynAGZ
         zgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320861; x=1785925661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYfMPL52K2NTKf0PF0OmsrszrBlQ7Hy1Y5N+shPjCXA=;
        b=CZbSpE+gbkMTLr6xmSE4viXLMjJzkel6Ic4mgQs3Yl+hUPFeg0hd5Owfr3uEVKoCjx
         I8hgVZC1qK+XcpJ1jBuukSHMqqmwHWv47GJl1Rp3H+B/2fKvEsB9Cu+2jtwlweBxvJZj
         tso/OzhlNJqocoqoCLzaO2k1TIuxK7LGqJVs6ivd+BybaBwDYsxyJZkeqfzLSoqMN15R
         WbPCGJsD+lSCWXUGqbByrmbhjVl2bp8JefPG6A1nbMepXBFKzaMk4MLVyrXpOvox2s7e
         6/PLk+EX59Ye9X3Arrvp8FZ9XcOvlYZWwpce5bijkU9u1ipgnfBc8j9hZRdEo0d2O3j5
         k4BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJaxbZjHbidd2IvbB/FKVa56xrmacnYBY++XbIxgHrn8/jmQuG1YhpeBz+pyH3BKgJjWE14LFmbn4i@vger.kernel.org
X-Gm-Message-State: AOJu0YyWJ0QuB9PqG1sbqm0FZhOz3Bq4GZjzlPRl/ObSJTe/QYuEYUJS
	UGNnMjGz+lXVl+gOccnxeEzWlrqAxpG08QY97pRLbiyuYEqrGcQOqxRoJa9fo+W1i20HDDjTr4w
	48IwV/Ko00sccaZ25qctadwC+0OY8/OCVrhdG7A1Uvmvh4ukN83D93ojEP2yaOswDjKaDKnRe
X-Gm-Gg: AR+sD118DYCifEYBhMutk6uiq2uNx5rWN4rR5BmyHyt42qtuHoW0eS7KkQd7KqEJyLH
	wuX/U0AMUeQKvdX/NiMLQ2gQHc43zD9ofkdET1xIcYpaKxVoHa1G3VsWwje4Wie0VBT+1GkasEH
	eT0DzpGWB/KI3Ilbs1gdldrliEGn1LayL+bo1GLDHeF3qpxACt355WarODsDXnkIf4lVdd/Pphe
	MDNS3EtbbtsN70I3GSDCHq02UeqWd6w0bYaiDn4y0GImZQS/GKSDfUiz54fiQHA6Ov7UITKbgA/
	Ei5rvZ9JVFeuSlHAKTqdoC+XvTfrd3lqSGUCYzLGUR5bpxxf5ahCpyI6poaqHqM4QA2Gus4iqyJ
	olqT3mdC/c6F6b0cdzb1jij07VpUDq0rk2VpGYCrh/ALPEg1AvyY=
X-Received: by 2002:a17:90b:1ccb:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-38f6a3796a6mr5651530a91.4.1785320861489;
        Wed, 29 Jul 2026 03:27:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1ccb:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-38f6a3796a6mr5651484a91.4.1785320861026;
        Wed, 29 Jul 2026 03:27:41 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0ed10csm1121477a91.4.2026.07.29.03.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:40 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:57:26 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa: Add compatible to the PCIe
 Root Port
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-hamoa-m2-dts-v2-v3-2-4d7ef9274575@oss.qualcomm.com>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfX1Acp8eU1/GXQ
 Mv3iO15Mzc0qL9bkMv16cOJnfAWaRypUlcCXu/40EVOMAGpmnYiGj7Gs+UU6JIB66HKPiK9Bz/N
 Il1iBWHIee7Z3bv3T/qQZ8dwWm/eenyLBNiFWx3olH2U6gdPji1dvgQ0vVsfoQFU+Cb62iolaoj
 AR1N/iSVCtMofFRFZnZKB2vYuyRFqiBiXm9wNpb3e76kx8tXZb9+EDEC6a9CyD6VuvLqYl1gXTX
 58TBvYp20799foP3hxBx09mFr5clkG5kCIW3CWvdo1zxBMGqmMVLPTEU7KecqGoO36SfQcmvnUM
 6p1pNQHU7XWoNjpNRmSzeGJ/jpNf+3PrR63aD5mgQnzHnHaNg9bXRHhCChiq/NlYw7Cy/FSYXvd
 TZ8hjwjcKKlRoHWY4vsA+tLAUYKhpSHOxoYQnb6DTymneBtOOxfsu2CsMd43+Q9UkVehmeEKhqk
 Dwn9X2v7WbAWFh41b9g==
X-Proofpoint-GUID: JODoJUKdDjy0O8DuRY39XGrcrTqZ6VpW
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69d59e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=unBuS9T_dDH4f9JXRc8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JODoJUKdDjy0O8DuRY39XGrcrTqZ6VpW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfXzQjlaJCmATmv
 nHPnTYy6JdEAP6sJgXJkG9SdR/Opb7jFQT0uXBOmy5XJQCwOJYSJNpFRYrR14/5c9/TZ0FKSEGY
 +4e7PxwFk/bMiwK3KQ/g1+zuaQpE7aU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086

Add 'compatible = "pciclass,0604"' to the pcie4_port0 node in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device, which is required for M.2 connector graph endpoint
association.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 724471152fab..767d2fb1f113 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3782,6 +3782,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 

-- 
2.34.1

