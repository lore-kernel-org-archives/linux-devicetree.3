Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182165;
	b=U+om2MZ+921f1oYYJGqDOzgHTzm1kiczbaVOO48ZjpN1KETCJOqCHlATWCGigVxsujkT
	 79nJZsEQtQz6nxod1TLDOx8TZtbFl1NLY9fkBf6D0c20yFBnCi+LzM+eoA/7YCXTz/ZZQ
	 tNNCaAycTBcmadomV2W0IvqgWLADQNeOA5m2XWA4g5ick3U+T9vfijZHXSGVeeTl1gEcC
	 JrjSYCt13mHcdnUNod5f+YSAZ/0lQSaayBxaEtSC9HUYMbY0GVYaVMxXTzmHsyzXbdwws
	 /RtMRvuOPabiohQhRK1V7K8SLMtZLh1xFj2fLDXNfG5r2P6MzDa3VDUvJXwG3Zc/FXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
	b=BGyTP6PUCmsVKjBXfq5PVlsYlnE/JQtL3R4oB3WhZv5WgVwM80BqZ6NriTaPlg4ruK0a
	 E4nDa70ugGLbxtxhxtivmMYnbHMHmXNAGAXYskJ68C6UlDx8ZMLRG+ErEHiXfQfU+v3p9
	 s1Ib4LVosx1hh3sHngjh/f5pIhUMYmDJrrrEhjNjZGx+RdtSBP94Hi/ImTo49BUe6ueqv
	 G1nOGxiqosIEDFm3iJGrj59KbTx4fq86fv9F1NShb0zZj9KhIZsxtGfWP9yJT5M6VVOGh
	 efOnQ0HL8UiUjRzqoVoIoCOn6RuJ3wfcQmMDLjGnzK7fkxdXSD7yMKC5ARDs+Tdem3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bYmi+T/L";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyjD2giA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFE606A326
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bYmi+T/L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JyjD2giA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxwT1528618
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=bYmi+T/LRHoqTqTd
	94Gqlb50tfiow5+v8/rkXqpFl7NdkokObmijgUeDEaWR+e9s/xS1QFWZehImv8p3
	woqw0aXLr/+6XcP9nlay0j/n4MXOypBgrKYgpOQCejOcjtSk88FTAmz+/HeQ+WKQ
	ph6O4kS2r7YX4pwaKw1aexGUQ9H1/7MVBspLbtRIjy5mjPmk3UhxoiLx1tfDkET7
	Ln5tVYMIg7c7NgVikJrnrsBQ3KaFqefCMdkdmK5iDIpYEhKHaoxL3bRzuR+ppn01
	UO9Yu1cnzw1Nsk1+3OR3yNwgiPuiKyB+FML4DLskm4o1oi6JAvpWseKO44+PHcPa
	hLOCDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3854627c1c8so1301578eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182162; x=1795786962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=JyjD2giADgc98TPYiW7wUHDOmLDzeeWSMo+oWV2z++UuYK0j7snNqofjrKHAhkfkPG
         /hw3kcbs4XeS4XMBd9l9GlJmoNAazP7AOHhuWV2FKb9UQGY0nzadKVDmbRDLYXo2oR9A
         uGfqm+YhWImNY1In/uRpTPc+dTiHmY/Fc0Zhy/XhEztWr7DR37XHOqSIjEnbANP7pVOW
         BIc1qvXLdZy6Fx+Q+ozrVMMLK8i5sBeFokDxneZuMksUsJHV9kh81mriK0Zp5MH0KBAk
         VgDQE2+GmAqcZSsmxJ3FC606hLhHNw4feBRQcteOGB2Trts1iADuLz3Dx7Tpp8wOiG3Q
         eEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182162; x=1795786962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=18nLx4YS+nxFu10XSBW8Od6unH7UyzRPeQ2/zAitCiv7S0wtx+IM3OqcqYu5TwUdLN
         M83xfHPiuwc6dAb+VkUsF28aTt5GklAr8qmmvxH6q9gBbIB5IgfG7BQrZFVlEQqzw9x7
         vkneHcXdXYVib+6tCHujCz7TJOJwTaPmd6X7pMw4IeEak3hmZ68lsRy0E5pMq3IVP+gd
         rib6WleADbUUqHhbIWT8VdqugOn922N63RQDUDRUdWknLIpxtQtv6PO4JunOGIt3KqYF
         IteHfEQLfwGrzq0dLucvVXAkL8tH54VNlhmFur7XpxEoaZjPOaCtAqF5iNiYFVgo2MF2
         Druw==
X-Forwarded-Encrypted: i=1; AL+hErGvkkPrGEQqYUZ7+u8WYowoa5WbVPorBtffJ+ZaiDBVzDUs/HLLFWMaco9DPxtGItieh0ul6SD/oSEq@vger.kernel.org
X-Gm-Message-State: APuU4Z+2OI1b96c9NEbygxuN4VAOoRrKJBYrUKqyQYuRsZVb1LtdoTEs
	P+LxIl2i9pz5KfrLbQ7BBJtg8l4c1CJSGE3Dy3+yKARWYfXHK6e4cSccxwtynDsDEiYwshHtlJ5
	4cLp62rg1kMcWvx/eGQrukb39zWtwODg8WpzUanahvSSdGjNH0RhOcWqYa1orI73B
X-Gm-Gg: AZFdTZePNhcU6WHJG0BFQ3CGZ7wQcmIZh8Q6AmWQwviqToXRrIztUFsXiGcUvBbKFNZ
	F4tkfJgBPS8KI8A+HuiM5krYMU0ZNWoDhlFXTCeCDsfliZ2moZbcktAlvnyZi9Li/Ycg2SKjo9H
	zjLKeYeGw4IinNFn3jdIZ9W8qYmDziTS40ygkZOGyDWsjiXX8CrO9Nqmfb//mKfeC/kDWV7JCRf
	CWSkNcecFRzqc8gGHIl5CDJSzvt699n6S7R3Ghr1X9MzUxGeL95d4y85CLS90Jt9OhMAuCVD2Z7
	IrZQdLi4BpIqWEX2kIyGMKtsfJuoIJC3QQPF/fYQSj+mxiSKAQ97gbT90Ifhthh4BLFbJEJSpYt
	N3Wt7hbYNw6k2ckRVQgibdG9tK7krTUmTeCz8w6iCDsX5KSt1B0eXbQ6RuZE/1sN0PWYwOT12jt
	bySDQ=
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275794eec.6.1795182162202;
        Fri, 20 Nov 2026 05:42:42 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr275745eec.6.1795182161506;
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:34 +0530
Subject: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=qTaOksY7gsG0/TAQ8p0w3sFjf/8jFeRmyK9JK9OfJYDfD45oWCkSu1bCDoibZtRSCsznkA/ZT
 w+97sfQhwAwD0LQcjnDqzk8oUA/ULDRgLgiINfsKeFTjv+24w8qpbBw
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: CAzacYWAiANaoum1oyR-Qgs5YUJJPNnV
X-Proofpoint-GUID: CAzacYWAiANaoum1oyR-Qgs5YUJJPNnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6UMXklFcay2f
 PLOqqa1G0+EiWbXJ6YbUQQYY+NZ7qr3bBdshLwsqW+iB82eJLqFLpqQqZKz8rmJIGllxCwtn1F2
 E8vIP0+U7zwwHQvIi2oO5+ALD6xQvjr5zlCBeprceXv9yQYTGp46+3Naey8XRorqBkvOKbIhg5W
 45g9Qnauv6LMP8LciplwM0bcM4PKI2aSCFEX1GuqTsoP7EkudF9doE+kneP1RA/m1mFDV7nVRc1
 Gjww0GTaBQCbA+VGkK5O/MWWtsnvj0olCePWs/ZgGgzFOEuDlQURtNKeXv30c1M81+3gz1KFy7G
 KfHuD6n06sepcncMoMGLts5B/nsOhLId+Sdf94Zpd2zYAovEFbczVbc7KAfWJ9DpqsP1v6f3Anf
 fTyU0BdTfrIXcsBtL/Xl92uqOFU7iYI1kj2BHLvgzAoaNM/w/3ve4Wv8sIPD7uHngPfAt2TMGff
 WlllQxQQv0sjorrzGtQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e53 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3qd9Qh9yYTZm
 +8u/BmsagBPQSONpOtTkswgMbDR8OrQTyKiGf5kLsP58uOZHipFW4VJ74He1Qg0R9OvZXUxDeEL
 DebmvbUdxotWNBGmhkriU+TyxnZrXiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1

