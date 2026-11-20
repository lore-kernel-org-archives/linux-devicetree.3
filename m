Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182170;
	b=OcKzBnf8jM/hjC5r0BFEptecnBPhivey76UGsdhKsyva1STJKnJbqDe2CJuLRu61cXzk
	 9PicBNyPupCNKNsk3sNGyuqG21PsG7eVjLaU+H/B49VtsCTsdiwEUp8A+UyUg9X9o4A/e
	 Tz9INGdUi2GhwtoCxsKdmhyU5YaSOMcoCjIfQ2YKDzthXtDpOKYkXVA2zoCWN+2dR6cmt
	 jMnJdJuHGvw/A9iMxjeVKIron+CDyjQcYdn0hnU8mnWHBvoWprrnYEMz1gJNGYlo5K4hn
	 2XDfB6q7VnEKeK99mrY78c/yuS6JIffofw+0Sz/JDovINozgH4P7tHqs4lbBPdUpvjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182170;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
	b=qjwteDpNeEXQXAoKV0l8eQAdJnE8/HMvGRzqu3DyQK/87X3PpbURnpD4D4XtDRqu5Dor
	 npA2nKYEhoYWavqo86aQ6GoSAeqGFc78tgzL7tfcnG1p7kI4eTNHZGFA4Ybdh6UV3jvq6
	 C8iXflhFR4/iwchlNrrdIJ/Dcql9gAdlr3oxevbxmYd/5c/it4sUDci+lzN79EThjJa8w
	 TqsBDjDtZDAzZvktXMTZ1OOzDcZpVvuC8oghUjrNCrq4C1mA4cYBcte2z56YiSAeKWnXr
	 mbdOkXbXHEn0sgYQDqWQugGASJrFhDg8I+T0YY0y517Dlx27/BWk4/lEKCpvmaTDfyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crhBRk2L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A2E606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A2E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O4brvdgV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crhBRk2L
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtjo1528505
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=; b=O4brvdgVbiXuTMc9
	LN62Jg1q5tbIRntaWRcl3gHKiwH/ChVhSvmetIuALcoqkh2eEgyuRKknvmJ7fNPV
	AUvlfaWXST3o4P/Tivqu/+rWteNLV5YIxg6oQVDmXM2dFp9JP3P/fSFSmEcZhkQL
	ZKwVapbDXEvrHmL8Fo5Tkl4ahOYZEltCgO21hN+AA2zDCqtRZz1pPlVpClBldPoE
	7hiUZwYrItU49V/3zOMkWRL31X8Egy3EM5fO+JDlhFsYUa52ok3gYZJ97cn9cicH
	FO7Je6M/A7ryMgyt6Z448yXcLQ4TQK5bbbX2lVMEDZTo0qhXWrEDY/luGO3evel+
	spNcsQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:42:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-382af5cfc58so2555876eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182168; x=1795786968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=crhBRk2LINSaQrjNVeq/9cHEFUi49r3+A3PUG5PL1Z9XtgNDarpRQcoyerF7ugKIzZ
         F7okoJeY1HS0fOdC+fgCrms7O+1pmhy+S5Sc/BBMdONz3wAr/DGSR2FoohpDWfCE0Ktk
         zpLfUDdIsS6MhouMFFG/VX9XUQHRv7pgYUSIBLePH9sNS9hfFiTW0iqEYRRo6kgUgSNk
         J1A+QkAWR8G4/q6+MKYcoh8DhDRmMLKKtcpPw97XGFXwYPAOMJ5s/toNuGbHMdagzpGa
         UIj8GcjmTxOBmcS4U7KuDDiNEsXSZc24ENQZUamNRq1gF5oE+mGYDGq34Wy0l0iH461y
         zXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182168; x=1795786968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX77h/9JYEKncD7zN6WTTwnGVQ+PExqNCDHg6+L+QbA=;
        b=Au5sct35a1phV+iwXOj4llX1K8UiWvf3s+Xvg0+1mKbKdo9ztcy7LyCxZY/KeTF+bR
         qdz7/WKL9UJG4/3jOJOFy+eWOzjd9fGyHcS1gGHftFuDaR+seYU0y5PDVbX9EGRxZfGF
         kyXQAfL4wq4dC1ptLJUSSNx89QfkvOi/YehSVYhHglr/jcSMsICdfApigQG6N3uvw08C
         bLMJdZC3TOZPO4aKgKkfmFtdd0/z8kM8+N9LS+sHvZi9a/kU1w0L9sUy+iR9rR9M6XQZ
         QBJ8owQmnLfQvA0JPTuODXE48p60Lln4LV6x0EKs/sSaVIIn7ubefj7xFhOAe/4LdG/u
         zNGg==
X-Forwarded-Encrypted: i=1; AL+hErHVXXqFIBvdSETaQnXi6qUpwmOiwMr4MOhkeI5TiduOvk64AIdW7S50+SPVo6/RfhxLEWY57t10p6DU@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ta5owGwdATqwAqOaNqNmFytmp4XJ+Ogy6wNtBlcaferhbv2cm
	sQY16F5uaxLGbwy1D6FPBE+CICz5n/m0wS4yH2f1OcioTBoz+HDXbiyAWWKl1iQ+M3vPMQRr2XU
	qOiNjylzS/jW0lkxUZJWmSzvdhgsxcYLgeSh3AivGHxhVuuMJqlTn3SOqHqoXXo0jVIJNW2SC
X-Gm-Gg: AZFdTZcG3LunlTsyE08dQsPklR/E4Ok2JtnJh08GUkRH1I+Obzeaqpuz9szCgPrdI3G
	2yx9zwOK6GyeU8/ywbUg9XBDlrsbDxsjKv3/4eL4DRL+ZO8AM9Z0KxsR3z50Zr91MUur7xir8Fv
	poyq+iJXoaXZZK/dIIkFEdSzO2rAHN4yh9HCXf8Prd6nrG0y5R0ee6aBei3NkoDfTefbwU7TlCM
	SEraPq2GUTBPROx+uliep3QTPzi7AvAW/INPNmGXDIBzkj2LJJm4D3beuAXtp/QPlNXNeOZKs1e
	tYBmUqnGuKSmc7jLBy6iyX6c/Eb7xjZgIq93mKLvaD0QxEFuxMgmKuZsR1CDVWiD0GLaRlx3jWi
	bwgXalCgHCp/7S5G80kscyShXMhDbSoSZ63lTw2+OMsQsn0afAzWRC+iy+yrnJPzw+VWRkqWEa8
	xvhF8=
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187793eec.24.1795182167466;
        Fri, 20 Nov 2026 05:42:47 -0800 (PST)
X-Received: by 2002:a05:7300:7a21:b0:384:b001:4350 with SMTP id 5a478bee46e88-3856f04b191mr3187750eec.24.1795182166834;
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:46 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:35 +0530
Subject: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1069;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=J9MtDhNBRc3o2KPFtx8zuqYMoIVGqmO1gPFbpzrqgQo=;
 b=GunXIg6kgvtDV3uM/J82EzQCVo6lYY/weJi14MRG4ovrA4l4K3ivsa2Ji0ZDR/1rr+ACTwOJb
 JKuZYPMYWySD+fnfBCErjgyWMClxa6InplJWk3v7QoUiLidllSJzi8A
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: e08APs8M59SUz6auE7WpkSSEak4l_9tE
X-Proofpoint-GUID: e08APs8M59SUz6auE7WpkSSEak4l_9tE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX+naWQapf1LA9
 A8B9Hl4HlxD322ZBS4YBvIQOpPla46jo6W7M5N+2VIQy239lgLPTa/HFnYUWBpDcb9bPufNaCYP
 44wOPcS8eguEfIqNvvaH4GUYrEfXR/xjC2tbg4T0vgrS7FYLfnmL0gjMEThraWcOd0TA+5zIkp4
 i90CTGvUUlTzS8OS6bkzKzz2o6T28nmrMDdVligvMffNELdSjofu2b35TNNwmjV/W0AjBxeewjm
 vFWGMXlquZRI2r9k+TN17uDIBCKl0Jb8tHPV9UWihy/YMGGoDD65++LgyYP4Iwm8Ida+kP7Gytv
 k09fRTobA5QgXF1fTqLr9KOst8XQTpiDjlu5TDpOpU2CfvI6l0sWh7eherKTClDcE/epRUEGA+0
 D2tudoOZ4/elyFORWdmLEnBPV/GBO9Q7SuXLk5hLdE/bWVAXCU3cW98XAGH0LcjAskYVS0ftWBJ
 sR7chG30ZbeIaaFimzA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e58 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8sweOz9C2Kge
 IRAmPNoQHaHtfB/+vi8KEchCHyVymAmktFqE5xXXB3JqS6Fk3onXIp29cYoilkX0lOIjwc0AvQC
 6zM4IjBrKGJ3GEDIk7o697djpDwGbag=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..be71eb30f997 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3127,6 +3127,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		llcc_bwmon: pmu@9091000 {

-- 
2.34.1

