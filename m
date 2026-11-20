Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182244;
	b=iQvEzRaNUdLzmX/f+gQjQz+lnDEqaRDUyurQpKldhU8zmPppX9J4BUV07fJw64JC268T
	 CrJaw0wxlTUr41sXyFLY5VNQs8kJ0+bjHk6d0Vbt0bzD9Qu8DtlbUAyJJqzlzvf+NIZ4D
	 jsK+wY6m9gXrcnZehThxovFKKq7w62ACOBge0+DGbPJITAya/En7K+gIb8NICJjTR7D3G
	 PruR4bbN8jLTGaNWoBTzKtZn54DEJfpYQNdPyHaowfhzUl6pA9RzhQyRQGAO3nmr+b2gS
	 rTPC1ppP+UmQ7n3+Z2+Xfs8RPfuw4jhgfsOtYFUJ93ZNMftDWHEYWdXProozmlqIwKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
	b=Ouea+oPIeb4pUvtfQeXyvNOqmNTjJPdfVy+/h1ync+3yKG6b9QEu6ZLIJmb5OmwXva7D
	 hSXQFvGjsi6lGNCyaHPlIjOe8XS2x4AvOzZHg8HmaYYQ40TM2xmlEm4BlOTx6aAoDfJK9
	 rvozegXo/kd34Tdr4DFiQVqfycY4HiulkL5NNbpRQdZzq57Qg5qjqK7wrKWLv2SaiOOhw
	 FApRK4zow3++RF6+kXZkudhLl8q5I3UCYVIcrqShPk/rslr/uZmYudbyfvkaoEPa/GaKH
	 5YbBbJw8/8n7nlfquhEdI+e8YaLXbGJWUZl+VnrCRzUwyhSjVW0xDD64m8KhEBS9cTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx70um7f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46A560A2625
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D46A560A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h8lmYrck;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vx70um7f
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6kN3987224
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=h8lmYrckPdPOTE9c
	zBfMzDPhb09b77c+f7yC++L5R671ZuqDB4ARr8QmZkVWngg8rVQozVA5dAT3uwMv
	DeCalnH3oHpSn/4mMtGROnCaGRRte5JmgxEh9tBuWB3fpmh9OmhYJncenlOWJS5E
	nqh5ZTC+V9bv5AfI119C5acSzsYxl3n8GU+fZDBPKB4JMtNxusRxFnD1MxlrSC1Z
	VYJ9wu9fcadHw/OusG/AhSdbWLb/tdl7JFVZ3Yn5IanRMQ+MZqyxIqWwMK3bU7LZ
	m1+mSlPSPFfVi1VUwXXkwVx+E2Wm3BtbjC6MQnUEmULsvha24zyvKq0IEt+p4uAK
	yS/U6g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81q20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:44:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38131260a5dso2341893eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182242; x=1795787042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=Vx70um7f0J0eyXpM+/rcbMyho5v/zaRarIUVoYd2Mex+/5bcC8u3tJQlfcBQ0+ePhy
         ZP+db2jL61voc0tie808NH2gFchKQsYIk4ylFxKsikk46dFESVSTpjFKke0fgZLcMEKf
         Taj3YbpWseRziy+xw7a+PsRu9WWmvYFpp+7+Ro7n5biYJGe9Hy9MtWZ26XaJcXzJURuH
         OOWlUt8JL74GNOzDJD7vBsVRQLnKSbGZDQuUrjQMc0oYssq8aHzLNw/GRmNfjpelcEO0
         z4idJ9IBqjEEfKa+iea7D3PBmfGdg9CLUDSjK8ezvznEArB9uS8JrRxIiCnMtnEYDvrc
         YjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182242; x=1795787042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=OpnXkfOtMGNoRyyOkhr/gA+1BVLI5NKpwq19slpSui3uu6qmatKqSCvxEKaVa+rMkE
         JhRPIVNt9+IGbWbTmLf0rGriLCgajiBQbALHJRi3+t7vIQgLm0Z0sqRjiqm/RCWJMMMI
         U8OjQC4J9BZzyfM55j2nCC6LFXrfUv7R07LKdOd2dCddF3V6KpYi7bZLpUR0N0ieOOSD
         4ajOJbmktFB8h8FNouCm7gUIz6mggL68CGehPCcuIQ4CMDVvKozpYs3BxrEbYoq5aFoi
         63aJy/q0fghEUd0SzlwBgn6QhrYt5r8RXp1XVYGdhMz4dCX1ObZvnz83xK/T5dF1KwCp
         n+mQ==
X-Forwarded-Encrypted: i=1; AL+hErHV48aKbCDbc/r8gpuOWHgpz0E2wHN+i2Ny4lDSxubneTN3n89zZq8x7suXO7Bt3MyvsF7upI4elrEg@vger.kernel.org
X-Gm-Message-State: APuU4Z/yRTvGKPx/LtrxBIUlrOQGA2DUMvijigsYLB8gQ9c1TBGPQkJI
	U9vW1sh5K5RStKobrJxG8C9qnNrIvW2Jo5ib3q8g/gg9vY1ckKP3eUcIZq0MRnLbo+KUmIIlidq
	S52pr3mIyMcoNRG/ZcyXfLKtgMnZyEW/TPGjctlZi6h+5fnG4NK703nZCfT3Kmcdr
X-Gm-Gg: AZFdTZdKkzguZxbX/iuEMozRaGAu8+OpDVVHRZKS0/xvK90yaPEmEc3fsUCueAO7byx
	Gs6YhaD9qRdgYnV+l2FAQo0R+GvRFwSAYn9qba1s0PaAKhmX5h5AWDhm3UJTo4W/TryoH0TDPL7
	Ksfsf18E4whoOhVhyesVHd+/Q2NSPy5tivoZCxKcIDTP67cmZLexQknNYRr/XD7bWY1G+1mqkFE
	d+HepBCOnh4PafC44Y1EcUIfNSE4O+C8NI8Kklo/9il+pIhZplMP4vBfxAX1y07sHrc6VPzjcWB
	30IXfWP0hhFVCweuQ9o9dA1ZYXtHtbGp6RHuvAc+NtE+D6o7umJ4U2NA31dxG/tzImaQEUxVhKD
	m7uBmBPxF0Ye+06QMXmeUJ5qYNk+Kl63Oy2GcXM9TV3ILB16ZUo9FFc50wdoRnUkWnAhzQG0G/9
	lJOL8=
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214229eec.17.1795182242300;
        Fri, 20 Nov 2026 05:44:02 -0800 (PST)
X-Received: by 2002:a05:693c:87d3:20b0:382:8358:9e03 with SMTP id 5a478bee46e88-3856ef457c4mr3214196eec.17.1795182241665;
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:01 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:49 +0530
Subject: [PATCH RESEND v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-18-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=ruBw4Imxa59bxECtm9BfDnEQ/DhLV5sEaxl2SqHiR8757X6GkqgD6J2x9UuFHUZeWElYLwbS1
 eSMtXQ8gr56A+YS8LcG974uxZbhOFOHcVO3rJlm/kmCKVRbZFPz+WnV
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6ArGGpw6YxlU
 6fEKSluLrF7ujL2b/2e7ItvujvbXtkZN781iyt50tZFY9y3KgpPC+h4T2bmX9MujBuNuqvsOgn2
 jf9OHkxRy9PkB7bL8NMbWRjApFvcmJ0VpfMoDUaVnRTmtJuFJgYUop5KEaYbVwZRMCP1fEg06Xy
 bGOZgHjmlePqsKXz//dCCS3oqBeViZXzBMRPXA8cyICfVolvFNQVRZR7fflTpD+jWt9UVdMimoG
 +eJxE6ZB87JQYuJ/rh+Bqc+dV2F/ZAKSiciZabdSotERErzQ306tFZQLNhFV+MpYISQFebXpV9A
 qASnBuUNgmGBmaS0RAD0qsSHz7YAr5q4l6qVW90/B+aQz+g9H02K5xPsHccuxHFIwxcFbqjWAoa
 EeGMOejMsyZMFhaEBdyFYXicbCO92ntLuPdWWEeuf1i7B84CeKqmrxlZQUwp92U9/ODUHn42GQT
 FuW+acWTx0WMMEg8Oyw==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004ea3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: x7WacvK-ohRCKfeXa2iLSI41lJKAlxB8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzExVlSBJE2mT
 SO6cJYCaUPCPsg0IHkYQ2IdcxdoBEkPMX01d9JgkkRG77p7P8F2ec27qFJdQC6t0fOHqOiaC2l6
 y+B5mWk8LNb47lbuqKjXZ5QYBTglro8=
X-Proofpoint-GUID: x7WacvK-ohRCKfeXa2iLSI41lJKAlxB8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

