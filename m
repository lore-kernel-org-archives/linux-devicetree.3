Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182192;
	b=dhN5x9JpT6Is6S4okuhkehzFymgZ/gIsMMX/1j03eCN/CC0orgoho1R97mV8Xe4x5acA
	 RTDAR3+3XTpAdua/Q1KJ8zIgNpbuGEiNlJvyp7kXAY7UE5lWORP5b825U3Ny18sWO4gRd
	 /nDLhkDOBL8hBihkfDOSCzzHUDYH3d7xm867b6WVMJQRs2tIWbB2HDrqaTi5Mda5Ehlxv
	 DKGY3rPHD/pVC3PcaPQ3BObj9hmZJdid35zc91ES7/8G37kuvnfHcs8Rgry3R7ephphhB
	 vCaJaUwqWr4k1YU1/3AsnXMIkOT+mNNmG/Rg+hX+QtaYFUbGjINeiegUbzHnD7xhkVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
	b=taMJKrBH9odKWdedQ0lbVPutRR4QhesLsmeXsmVk8AP+jpumQhET+hO4pqMIT05ovNOx
	 ZQ1GrmmxSpzTQ/kELON5RrbHBEZslk9JJS0Y+uAWGR+bEUkEPHalp8lh3pYLyRahaNJbR
	 JZowGY0ZKQQPsqTE0JOKTBCS7+EFdRaCSGMiKVQhSu+/0BUAovwt78FVX+90zMctYeOgH
	 pqAAKGdD/c9fNb7vID/XH6zB4PeW4aLBk7Kv7KuOXRb3WIBBCAyM+Kf3fZ15XUH221dcK
	 ELZKRAy17+oJfYSkxitapcwP61sVW9nYM+ajk2tzZ3h79vLVc4PXIULBRFAW4K1LMvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hk+DaFyp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA91760A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA91760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lV2OMf+A;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hk+DaFyp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtjs1528505
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=; b=lV2OMf+AO/WIMczd
	5TY9H/Sm6NbzH9KrP/cYGNhJ81qogUKwQTc7Meeq+vgjWerGjMpfPO/MjrSjjpST
	jJ3NZSsDfUVYzUzbarDsHW8szqr+yN3H9aIugcOY1QYd4qRo1MmdzfnSx/uZMn9l
	rjhKsDiQuJJwhdRMuwEHQx3510yA5eQMeSZpIRzAqWxgadkbSAA4POKqFyYAD8Cx
	6hU1uHB+Xu99vJFaEOmYvmnLP3XxDdRnA9s0QprTp+J3CZxUMXj2vC/08UdO2Uhv
	Ubr4aRfxO5Xw4qipLuA/zBwfG20E9msp1kYB024jfyw7Xfum1fFBbSyaHsK7XsNi
	84Mngg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtt2m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1373018eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182189; x=1795786989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=Hk+DaFyp0xuBNzwQjaFquROeas+z/UbRqnGBImj+9FutfrNQ6p52X026Q+StuA+QUW
         cnWMYYtQhHnMoRfNLpND/M4eFRKLQtAxAsrDd3XLr8xhbb8k+lohUpfMem2FzDGYYoHf
         5uYMbJO+0mML3E0fN3/zQURJhBGEwEnLCNykmpEsoN2EqQY8b80o2riJOCUQNCiLFqW+
         Jr8mKiW2hZ2YPzDx5aZgpGLzq+TDa7k6vNjeUaXMNLv7KfjUxhviIJaIs50D086KW+yd
         C7ELeybSPSkTqrldQJ08jNfd7yNM71t9c17XyBKt72aR9C6495R1gq9hpZ2+0s5ep1q3
         LoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182189; x=1795786989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmZxYNnA0FlqXh17OoqgkAggLp3AAiOCxOAyC3Iq++0=;
        b=i+VT3RFynXpoi18CAbHu7NTt0IIaV1oUx5zdoPjyTbgUiOaC01cRmyEHfR/SslD1ou
         TxqP+tqu4uyUaPtlbmVE4bSWx06WYNtE5RV9zXRfinn19ejxgeAHKPY5AzIdfqkSO4rN
         jQch+ZrllQraIst/7iGI7UqfH6xWzADU0ieEFW0v0Q3mVHRSykqlEZK+3bx2wXARqgIU
         oRzb+7YYyrgVApAgjXbsKD5eJ3ie+sNq7mSxgl5VkTRH35VDtuIBMuy7gWM9ohjTus03
         6qTvJaNN/LtXD/5Wgjj1hTuMATv662GhvUSXoa/gxk2SSbEvBRdr3WpmyDafdxuKlJDy
         0Ebw==
X-Forwarded-Encrypted: i=1; AL+hErHd3IgRZ+q3tGgrHz3TTVLX6X1L05n0XYcyc+eGoyhQuUjKRRq31hV+yQ3iV0LqRGKC3xrfEWQ7wpck@vger.kernel.org
X-Gm-Message-State: APuU4Z93ktlPTOpLX5D/g99nVLuc60WPEQQEpAkACa3w842AyolJ1vRE
	MONnQMlp6R67/xNGScnk3fc3ijPL5ynZf78Cz3SbfcnjQIbdUwXms7lZPG748Bv7uv4LmMc46YF
	ZrNUlvxnOQLsxtp5QLXlOLGq5ue8SnrKqcmYv4mnELn7kVE2EYgULdpSwmDRMNpbC
X-Gm-Gg: AYBFou1hPWoRmnGAcjSJhpa5LodTHBSWTWgiweIk/bo0BIYbCJvaTadyCbTwJ70Oug4
	yM3LmywYP/dm4eMdQf4uzizcBKEgMNDroberYiay/joV1KUdw6OK4hrk7u1i3VfLDjXBLnuHfAV
	HRpWDBu7pizdB6oZfxvDk/VBZw7T6eZXVLKdtQcqyMfVwiqjQ3eMVqnmihpOlsWmKYAZvEbrhMw
	am2AVuoRvOWCrWZ3s6B6uf6Vbn5S+3LiD52HcWhryqAZcV8IcKBysbL30ZqkpFFnT/GbHisu4rN
	UYazWC8eGN8kxVaCsxr65vatI5wqAs/mS9lKHRhG78JatoSA36117PShgy/XQ1b1nfOqC6pIYl7
	sxdn+DD+nMAKZxTbfRwGeVVOYGOx+j4kgFYakre7L1MQ6i9x+wU6l9Fd8cMoJFWMU41yv128PVz
	JPZJo=
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940784eec.3.1795182188838;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
X-Received: by 2002:a05:7300:601e:b0:376:6aea:ab with SMTP id 5a478bee46e88-3856c5b58e2mr2940732eec.3.1795182188122;
        Fri, 20 Nov 2026 05:43:08 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:39 +0530
Subject: [PATCH RESEND v4 08/20] arm64: dts: qcom: sm8250: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-8-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1033;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=W3R0vadqLaDaPerwJqu9PSx+OZnsGkbm84YuXP3uSZ0=;
 b=UXjvyPjVSFUzv8MWkI6PHpXR9uFIip+8s4FKDI3V7v5De6PmcMG77hWXmqGhPzGsaIAqRjl5e
 dXXkYAE7cPcDTXRoKoXj3qGk19IsmRItdN1AB2V6qAWzSjL23J+XvLO
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: jaDpj0SiAE0qEsJ23ol17DJEjj0R5a4S
X-Proofpoint-GUID: jaDpj0SiAE0qEsJ23ol17DJEjj0R5a4S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6CEwwAmDgNhs
 7FBsXt2YrdJ4v2y6TXBsQUHfnoZfkzt+GXs2RpLL71jYwYyVukXPyoQ8hFsZf5Ll0nWBM8hQIoS
 iLbbjLx7if/HpMyDF8YvQwMl/igvAhURVUJzRw5XphiwyQQvejv9tOE3dIN7R7f5aDqoZud52u3
 XBX3mxu2Stp/WYeedlZCi81dyPKPlM8P6XPpNdOy/3ulpGxiEJcmTIfYKiNHiOI+zDM0t8Y+CeU
 lS2Va00C93yRDmI2ECD9WFzl8W8HYM8RKY+Y45Pz9uXJLoBRM9zV47ryB7p4gNfV51860yhBfhz
 ghdf12X9Kc94+OhsLTZiAmvdDDND0yfiWRZUeMFNHw7xGmScGj82np3emKnYUGliHV9cgFI9dy+
 4pZ/pQEYq5pYG2qTaxDmkzDlG8qJ905UXDV8RSy3CGXMtq+wVPsf/nNWIIawXhIM5bkTjY3Vf7r
 CqcP8l/mDoCzXV85WyQ==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004e6e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IeQ55TmpMpvzCWFLjAoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX9c/cwH0Ocnb3
 z8L2sPxGxObGSKYpmMN3DbV89a/fajUlSX83e7wJkJUKGXEi79Nr21RGcTRum9ESscFmqfuzMZ8
 qgwtpLXj9WTVR9HFzrctIWzR0nLJjTY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8250 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 992284e64d38..3a368ef7c22a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3089,6 +3089,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		slpi: remoteproc@5c00000 {

-- 
2.34.1

