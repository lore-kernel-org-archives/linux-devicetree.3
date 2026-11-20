Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172911;
	b=Wpoyh6iWh4bNLtAM41ASajDXL1IjjfBHbnxwof1VMJ49qRQszkIaeRKUGGyHllgVcgmJ
	 QdoFqbyCfuXIC15DAWGjXdBgQggIz/h2JFptij8846iO/sOEDlPviudz4/qHFxVlyZp9l
	 Lu82UiopZelefXHhZV3sxsyKPvxC+1OWxlEID4MA98qpQqusHMco8huYnKS4DPkk7cyma
	 tWSZNjR9HuPheOW7PwqAe+mgGwrVHO3pO9dsOlxVVUVLsj6syuopFjTIq+R0/XNtIQ91s
	 UCZiXiFNKXBaaMnSES6mN+8dDCeswTFzVH3zd4eSGKaFpv5pjFMp/5uHsPnhvfsRObA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
	b=C4v/AKs6R7ECCVQM18MXpFtTXC9afi1C872QLEgfWyVKMNxCe5Og4P1Oa0cVwqlWIAxa
	 HwbSIi2M1/gCKuz2fFaz9iWymCIsAjvGPUaK3Lb1dIVm1WLkFYyVyghqkbyz5WbpwFQjs
	 eayQi9vJJGoUNRYwSrZShqL52dnUqk5BWXyDtzUBPbk0+bf3szoAj8ik3pftd7SmElVyg
	 yJwUrcErydrPVF5hWgC7W9mrN/KSZdf4lkP6ckb0vDPNxQKYH5m5aiOqyjM4Xah/qaKBJ
	 unVR+S2qREGRoQIHO6kDYC24QGo+4Jt5mTB4bBa1lof+f6ruUJ32e620JMEAZt9TTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XtnMhW0v;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DF606A339
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B3DF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XtnMhW0v
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjq9a1681886
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=PpGetJGQ7pBoK2Dv
	V2W5Gw0cdxOoP1ZJ4IwxWGSC1dqg5+8NDZ2ba8egXMhLsthVoHZFC9RfMXQiuAF5
	gBR4XyAeyHp+ueZgRRzVj4kFHvK1/O77TW9MAiEq9fiOdF/LEdXyudnNQRpedwUu
	tsgyvP6Tn+vHlA3uH7pwnizO5Kfmlr36hZNohqvK7iMgaC6u8DPKNNjNvsoag+AV
	Z9aFk2pYt7bue2Wm3eRtj12Z8z+9DDCGSzr2CnkJ+U0UROzb3VMeu1cUFK9HoF6T
	4NHBraoGBIaWon0bwvQpjiAb1if90/U36LzxRg+VAGGjn2InlLHzM2Sky8Jqz5Zh
	avi0Qg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t42e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38131260a5dso1973396eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172909; x=1795777709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=XtnMhW0vdP4/lqY52wkXUYOAQeUpWMjQ/jwjoikqejchOXDLWZ4xc1PRU4qo8RVZRq
         UOJgLQB+qohCF1G/L44CYdsmL35/UMZvHrhGON8ZE62JFG92m6t+8iU/WAtWMyya3/BV
         jSip6QEsRDLxUqT8b6hP9bRmvaYXoJMgNkJBJ2TkDM+hbCqH3VcY0z++8DFINhJoDGuo
         Rhx/4AH3FrUldBB7Y1TZqyRtdqb90ILoxfYMV/BHNWjh9fPaqW8SKKr2m08sHJXmXU/F
         DCxd3T6ARRpGI6fUVkWzAIHbBBziF12CZAFzQMGRY5nOpF0ZAkAfr/fu96WZ2xHIv5Ap
         VQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172909; x=1795777709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=NLaqtwZCqI4qRr1hfYV09JvuFbUzV/+eiQzqC7vkoZaIFUi07C5fLjEvBz4LiLFqKe
         mgHd6oBdpW6qy6HvTIWx6q7co5nAxsmuE8KnPruZZvV/NpEUz4ou4I1HRyK+57UB+jmV
         ntcrgGDlc2fPhL9ctVCVMDUZkunvC2EPxvNtpF5bTeShlZ9OvwbMcpmikGfPnrZyFLll
         XTZfzFkVupOmrW7VP3lXhwCyEkOC1CXJumWeJv+Spn1fmr1tRESwXPldgmAYt1l+LX02
         uFB3BhNcPIYPgDILrRC0lbRbYBhT69sXejg52oTMB8GtmPaYjfginUhUdMxME7PzMDtp
         Qa9g==
X-Forwarded-Encrypted: i=1; AL+hErHAHo3+seF/sH4zP5MVsWLvJo9wdQp7fr8ffP+FwBiKjlrsKbLqrccB3Wq1HV9rrFWrRQyXKNDkm3au@vger.kernel.org
X-Gm-Message-State: APuU4Z9lvF6TkMxRHzcwmF3pFmlHGuEUWOJKVbITemKMcagNdNh3p5Ca
	IlkHqfFs098Y3GhIIGqvpW2MnPQHbPdZVZapy/RBByoJjfSelbPr/abB+ygeoWMLZ96gY1Z+o/v
	TFqtxAI6xBggqsNAHU3gjfzP1OghTfp/WwjKHEXcZSZ1AoiYkXg7Knb9sibjTQsOG
X-Gm-Gg: AZFdTZcnUoX4SDKifVRdzeTB0PcXSeVtmbVyC3ByKklfo4vhz2I7vpL5Byokvo5wmsf
	A/5/PshFv9xTejqaXWI7qs9eDwQLkYVa5qh86S+YlfRDBOc2NuoLH1Y129iumJyAnkFN+1G/aCG
	epz5O6HnwUZv0G2j4CEuYGSYWtAJJyyKtngEJAI6hOvbU2XK5uiq38WznbXlxQxldzgn6k+eS/1
	zziDGKnuAEIIanLlGQFtJCNFpWFYdSKkCXXQww0qMJeIjQy6No+cVtSJZKMiyNyqluEUEeKliUZ
	DBYeWDVQRNuxQ+OVBAUyYakC/A/k1z5lzLaF+B2tl8NPOunLVGqQW9/d/XOJxnrEGr20FaY0+pP
	kj5+ginEY+A2exG+jecVUW05RYUCTNdphGjGX3pUOMJBODS9SiQylo9MTAuEM0beJWo3DRRtpbm
	P1MOSh
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548346eec.14.1795172908945;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548284eec.14.1795172908315;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:27 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:00 +0530
Subject: [PATCH v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-19-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=PmL/7/OIAhKe6+7Ml8hww8O3m8ab/UwFs5/yUv6UukBwizaGo3hlxGIlCcYx3COfKyuE5mfYT
 POM6ORiOASJBu3Embpz97TTwUKRZxIR3vDX5gO3izhLjXm5xK1bvqGt
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002a2d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: OhvLz0BXkhmy7u1bq-Q6fjDIVgiTWb6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6JVv/byal5v7
 IhXzbM7yPGOpiozaUI9T/W9M1O0jMgsbsOd66Hzf2UqE1AYLbARAOIfEM0JlxD0+yQlvCBWYy1u
 tY0F0Wp8bl+gKogGvc406EiNpPW3qCkmhWXUN65vzBX9bCLPNiz7Qrji/dTmS0HHxywkUrYggZV
 qMHbckXepPlqo/HLMCG7Eten0nHaUc8v4mTu9kBFAiifwJsMdkBpVN3ZMb08evHSr3Vc9Gl206C
 hYADDGWZAQsvy8Y/1YzibCoKkoEhwSOmfwjBdF4usHzF4Sinm3jGErIql5VDqIeeRXBzAKj+6Nd
 1pXKd8dsAnlfufkyzxmwE/KPYa4tE+ZLqtCF/IH1wo4IoXV6m+ltNq2BNLEOlxRWT6jhs8wrSxy
 X9+TY1bFnrnRkw+Z4o+1WMCBORoqBt41ZoN0CWxJPQfk0rj4WNPLsHaU6RJg6bTgToY2x8rTxij
 a/fpWNwY56CIBhexQTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7PJJtDNZ0zYY
 KWWU3nscc7Q9a0QEm+kat9nxYoMM56qmeqLJMLjoNroiRkglqdUm2D5HfvQufJpE1aLeSZT6qqY
 Yt2Z6fDzw1CP4CJYI/OUnbtZZ6ZqDm0=
X-Proofpoint-ORIG-GUID: OhvLz0BXkhmy7u1bq-Q6fjDIVgiTWb6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1

