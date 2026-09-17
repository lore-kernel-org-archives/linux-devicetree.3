Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC124E2F2E
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647958; cv=none; b=Hz5MsvqkgHPRT8Xwazi27CKuD2baMOnzWTZLjapAMi4vvGADwuOnYhfujVqh8kq2UX35cQN4Zk3E3yXcuoXkpXD7AvxwhIXmSH8dQZrTodULLRrqyOkXt4eoSrfoUVbJAj6gU0txnsgFSuEc6Pyddz+SAR3uHmYWmsO0OTec0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647958; c=relaxed/simple;
	bh=wsoL4nEIAJ6nsrtXPaie/LR99cvgCumfdGmB+Anekls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5KsmLcUUyE+U2EyPXq5yHDHwtcEic/xw31Ng7heU9DqFm8YBmzvFAAaGPY0n66xZ917N6igidtiuWwI3yTGhhoBDpInFTxG71jEk5NbVPQwvtorqtf9+OMM7QI0xMsOox1GD5YUWMlJx/BN/kYTuqFgT7RCVuTmr2jTXW8sZAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paBXPwL9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TpsBgMGW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paBXPwL9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TpsBgMGW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZuVN1390210
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=; b=paBXPwL9/a0RPdKj
	lW1jgzSkPzaI6TFud3AgM57NbU1BIZgpXCBkMBgKJ/Mq+TJKY83XZ4fVzifNKE47
	pNSj4WtQI5f+1zHyxAm5vWYT5xfoVOjGTFnWt+0f7/8mdW7cOVOfe67eTmmS0QlB
	cu0chgfnT6u71l9keMKJ/2aDyrwar0ehivbEeWMujDgW6/QFC8jhtA31q6I48hyq
	lGzwMWdz/UpYLFyCvigAMxEZYBsO7rc/tS2bdTkb4ENjg56g2avnVHa+UDhoKPrU
	D3MB9/hx1iLFVlHzzuG4dOM1TWb6lZuXFZMVgswugK6NH6VAgfsdFxh2i4pvq1Pr
	6o6m4w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d4bba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:25:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1126031a91.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647942; x=1790252742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=;
        b=TpsBgMGWfyLbeF4+w764XZjEnxwYPPJfLAYXCLZsdPi5GbDA+c1i1+S2xkckIzyp/1
         65YavDJjC7a6s8lMNhGwUzqKHk2w+K05YaUjSRGQ2Fd0zy8wYsDr1NJn7lCf/CxV1mdD
         9D93m4GT7hQrZhJHRrqMDQRLs3U0dHnJBccJE5FvjKlPd5Mk23GpZSZf3KgWHDPNm1CV
         dlRdVwNb2Rm8L+T0wdUDA+jmiP1F2khfCdbUHTRqe94xrAO5XebeR8cMd7KI+zOjIr6w
         YoP7HXRUeha1UA1D6Xr+Au2KZ6MuwKxuRuO4hVsp2x/ZM9X6DBSVeHkfC3It2eci7OUH
         y46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647942; x=1790252742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3sBpENGMFchxTspN96ZFY9T8fU/WviG4LWoRDeRi1lY=;
        b=ME9twcKK/gPK1OkBoZZpbGDyFje04SMxcA4QItGAri1B8LOhrTkWO/BjqK6nR40gJ1
         B0Quv+ue7qrDUSh6nfz65qPqGRFeYVRcF3Aw7qSQFY+XH7DhYLkUlF9k8G/iwDc1O/lq
         wX81R6CsXwOpet/VfLEUygrWFC+h8BtyF0iJG1aqkmIKMtIauUnSbqbzXZKKpxnEYLP9
         OHFXmNmYkChW5NRc1R0cl1SXUlyg2LYfQykFi6IurtBVBXGkPa9JTfZZn4siam9uzgZl
         txa5S9m3sDAyBB5rUTtkRaZzOKqyDhjGl7wFH8RSJBFwsYj0FDtKcgLCcJ0qc6EaxNij
         dUOw==
X-Forwarded-Encrypted: i=1; AKwUvByTFqGwWEtyDQXsRgiWHsmUAWWnzsaaJEyO8CE3gmCdKI9CaPNB9LeA9rbNnHhKgDeip/mE+ybq6+Wa@vger.kernel.org
X-Gm-Message-State: AFuF++mjTmcOEI5r4HXDGzGR3I0bL6MwBqW5NB8Ugya4TZZOg2qQ6SKu
	RCwru4Zt/r0USgyyU9vcZsG3Kt+kFMeuI9Qlp0xQCw6nn2NU9ftGEuvEzW9AvRweUrwRJQbhoPj
	yDNcBOdSxl8ZZBwGR2IOq8/K9jnH3o42TmSOyEHqCZSBH4AqTwB4FV/hg857RlZPl0gu+MCyI
X-Gm-Gg: AYBFou0o7iTHxCKXdnR7OB9D3d1CQMzVd00lmTtgvNE0tpn0iAIsXHu351hVQGjS+h3
	QZVIE2RyH8H0CWnzR8vFUrm7OmP/YxArLxHVyylmZyg4O3XkIsHEy5NdpdqweWanGWMgm1X+xWF
	zr4GO8/YZgH/fPeaKvYbmng6PCp/X6yKo+SRFvhK7M3uu2TrS9d62gXJWN+I5ZMNLZ0SoYrybYj
	iwsVIO328xVkqdL+0NWxHFTXa+IDaBi63IcUUvTeG7VEsmJO9FFVubfKUWb1uL3chVUPreo0J9N
	m/Zn97nJg5EcYXmusMtdPvDA929qlic0eScIbYy3d1wmSL0cRpIeNG6dSrxDjTatbDYcxCoSrg5
	HPPdAzpoMsx22V8JSe4fCmUeTIieFKbsoVwo=
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr14729497a91.17.1789647942173;
        Thu, 17 Sep 2026 05:25:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:39e:1693:c3c1 with SMTP id 98e67ed59e1d1-39e1e4c8bb8mr14729442a91.17.1789647941627;
        Thu, 17 Sep 2026 05:25:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:16 +0530
Subject: [PATCH v2 02/15] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=1566;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wsoL4nEIAJ6nsrtXPaie/LR99cvgCumfdGmB+Anekls=;
 b=AXq3bfs/uk8yxo7y5nQmGz7DDL9JgJguq2IRhZYy1U6hAAjlJbJ0yniLEOCGJYPGUem5bNJ9j
 OkGSJ39yxWoADMgx361Ma06KZdtuOHQuiBt1+xH39E22bdECDV76Zk4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: OnH2s2-xrIawxUp9jpQUFPNuGGZ2xRlw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX6HZoLjCI+nwq
 KU/kxHR8oBycm4OQuVxs5WDKQWfSklnQcdu23NjIheE8BBrIQlGr8zW/KWgmn94eMopXCjCYucZ
 d5oFjwn+QWA4SQtf2laI79Jebm/n5CI=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabdc46 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: OnH2s2-xrIawxUp9jpQUFPNuGGZ2xRlw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXxoP7FQfQVXkd
 UextiYRdUI2TXx53QaJkWStVWrX14Dusm/lq7xvGDy7PsdG2thqD0Be+0ZvyZ/7GfKRrdOP+6tP
 FCpk3rMxsJW7Uk4pY/NMlE0v+E6Dl+jiqS+jdYmTyuAl5o3tlNE9qqoug1REzNH+iL+a1DzsWMk
 tZL7MHBa8wd9iKb5FpDdNJ9JSY0ax7ydtL8TdTskq3iTaVI60ldimvrmFI8JeNQtO5IQipKDyXW
 0JTtHC/cCMwbm8EXqd7UNjTM7ELRJjPt/dLk8+TVaIy+FYSjfeZq5GMLFnod6g6Or+ttlKswG2R
 T4IViu251J518qvV+Bfi1XR2sIFcQyodeSVQuw3VE4mUAY77WyUiOVTT6YvPF3/XK2KpY0+OJdt
 jd7IxInrsp1hN7CkFCOqoR6s1GvfFTJma9bKZbdjpdiKKmsbWigrilgXc3kizYdoI7teN/cu2NA
 HK7BJH9F1OMV+nAuvLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst GPIO property are per root port
and belong in the root port node (pcie@0), not in the RC controller
node. Move phys, phy-names, and perst-gpios from the controller to
pcie0_port0, adding a label to this node to allow board-level
overrides, and renaming perst-gpios to reset-gpios to match the
binding used in the root port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5038d0009c1a..bd8b69e323e1 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -928,8 +928,6 @@ pcie0: pcie@1c00000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 			num-lanes = <1>;
-			phys = <&pcie_phy>;
-			phy-names = "pciephy";
 			status = "disabled";
 
 			ranges = <0x01000000 0x0 0x00000000 0x1b200000 0x0 0x100000>,
@@ -969,13 +967,15 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 			iommu-map = <0x100 &anoc1_smmu 0x1480 1>;
-			perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 
 			pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_phy>;
+				reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

