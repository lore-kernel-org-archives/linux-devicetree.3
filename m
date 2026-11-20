Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182228;
	b=ieVJIfyytc6qQVtAJ4kgcnjVlh+gQ4VsKOZS2c2J8yL0/fkq8mdoq5RQ1DDNvtQWFxvy
	 IMH+dOITeglrjk3IOR0bRa9//rswyy9krSzeOFIfqZoEGxUfc+LdEcbNckz1icT9vU7OR
	 x8iQx79JIzxJyvJuy95XviSDf4QK4ZKkGiT/Q3reNecvMo5JCpG226MVs/zlLBEA9iHRq
	 LbvmljQ6RQWz9Acq0ZK24kEaZtbmQ4afwUWxUqW0tL7QUwuBrQM9gcIDQ2Ux7P0ZixgIg
	 7MOkXV6nCNqc7Kh4goN3cjMf05yKiRHlK5kb6nAyepD3+gQi3TgduT2gah6GAZNqsdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
	b=PksnHR+04ITCN+d67tlLaSNzmY+QkOdKT+synyUqJY5Svl+cPxcPXH7hLnntbvtRDINO
	 84gUlEICtc6YcQhkdgmVqgmNDgm7+1+120Q0bItkbNI/Brh63PnY2RNjrS1TqMmu46sqz
	 UfYwZkAEeqxQyAKKSsuJbBwJ5eA4wVNd3r+1z1ri42N309Zz0Vs7ggBbDcieP+LVdzMMZ
	 UTF1cghp1JKZlqe4J2sIt29EmisoiPpsEiTL1CVZq6R/GhPVCZzQHU0Rhco7Go0X3gQjP
	 R0kN9godqcNs2oTtID6zGlwe/SRfOClXJ4HNLY1K+2QKRLqQacvHiBDG6+05ZYfqUIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY1f0pnI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FA960A3818
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FA960A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YCsF+IDs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY1f0pnI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6kL3987224
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=YCsF+IDstQv6MIvZ
	xsCj27b5QrM6GVtFKhA+KTZ8aWrMjUB1690xvobTHxxplPXUy1Z5FnIZLbs2kkGS
	62YheN/JbLYl6x1eu7setWiTXCBncPR4/J//f4/OOXMPTGzDrFNIeDTGKCtqlRe+
	UqOdIZA2zTmxIcbgjIRT9hn2DUZ2vEJUTaz1mT5kpOuB2uZTUaXMBT7oa/hP6fxz
	LUW/S7MiERWNIFQ4Y4dTKeJMGAMdoUMscUNh+T+Xzqi4soHVa6zqO3sPgM3rEQ8u
	joaJQsAPVS5506TQmnNHOEk0sWdrytK+n6cZX21/EOwkFJ0x4U0y14ZNZtpR/uC2
	S2TSPQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81q0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 13:43:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so856142eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182227; x=1795787027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=EY1f0pnITXvk2YAREOAKqvYArQzrqWlvSN9baRenuKhXUZmERL7PLQ+L9GZXKVETk3
         hp7UmpSangq/AGTVKN+AI4+/MWJJy0qBcWNU82m16HvcZ4HWECWV4lZECn/iTOI+etVc
         Nc0aSlhK9jrJ0sYB8UCVu0gb2uhSSmSjBBgAWX0lBEnaVyPCUGrPO2hlj32wXK3xBQkS
         PO7WnUeLdPInkeiyJxelEvELt/Qq/lVzwGhoww5otlmdXAbG7zDTFFq7YcjBqogXaHnM
         bi5unf62nr2p3VciiQZP0skCK0SSJlOkaDDSv/VUckhWa3iKSN0HH7eWjKIQ873Cw2FS
         P7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182227; x=1795787027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=moNemyptLVkcP8FKCMV89nTncekHKbhpVtvMLCbSKxePRuSHT/BSD+CehJWrx+dDO0
         JJJy/C/XyGI+VnkRivcHOq18dNg5G86dAQ6f1ePRzDZqypBOMzxT6NYhnCvqfj3gbToK
         okZ/pmVi6v5FKw5yQ3DQ5IK2tvkSxD8xBu52k/tA0ZhOhCNw87+mx6jF2EUClxZaCVWe
         e7BTgtDgAHX55RY/O4BBe+Hn8Rx9SwcBy+Ln9v2fR6VZQYFq85Xo/PfLyw6SdiWHrGIf
         /IT5SIE3wDvsqPzdNMwvtV0LR04x0dL2kO2apHex4kyLBpYMDd/dsd56xMjtJH1xFHfD
         2TUA==
X-Forwarded-Encrypted: i=1; AL+hErFbdOD+9+yiS+2QswubuJS0KYMmy/G9+fgxWQKeSSKvk1paCQiXqpqa6Ow5KIzKm2aKutFiZwwzL9cm@vger.kernel.org
X-Gm-Message-State: APuU4Z8FaKV9ETiANRUNtyvyPVCsjc+8Q7B6SXWMSPuzXlvZbIiJTMsK
	UUVOErGmr6K1ULyn268Px9EsfdCNDnco4EYkkZwr8Oru9cWy1uiNj0FgZHcohgVSQvGOO8416ZF
	3UjTUGv2v8oJBdwibQZ612tADzaAzj492go0za72Txa8SxkMWXjBC6f6eydffmh+J
X-Gm-Gg: AZFdTZfCTxx1BQahx3cy19zPYunEqZbj6JYIZoWuH08W0OVyKMwbXVvluLMr1hTQpZv
	t4SwRYgflLnmsiHfTYCszhnki7VcB+81W6fkyO7xKW4b6Ynaq6uNqIuEDE5cLdudyTM+GMiuyIR
	HfF1EMPINu5VU/14j2rHwTGeW3zGSx3TyVuXvFO3ri4RbqlWGMrunBKtCJ3+w57kuu5cM5IwkGU
	w0/jI/aKBy5o4IsMIOUWmByT74skXs+eOQrZRte1fo/3Gv4mriksUvBpE4Szfosd/iyVFDdi8La
	ewpbu0irNKTQeI5Jgm0xiQPxlKfLRCLAbaxc357uADBsU3j0YID9divz7cRUkXxmo7hSSCaR2vk
	8eGMcAButjQY/ABqW7mls/tccOE49VtEKOCr61W15oTeqqCOs/mvIfdpZhEaRLgZ5IFGzL/ZhNa
	2cgRc=
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694909eec.6.1795182226351;
        Fri, 20 Nov 2026 05:43:46 -0800 (PST)
X-Received: by 2002:a05:693c:8951:20b0:384:ce59:5e19 with SMTP id 5a478bee46e88-3856f257bd6mr2694873eec.6.1795182225726;
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:45 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:46 +0530
Subject: [PATCH RESEND v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-15-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=shWpSkfNSnmk/Jcw28HmhRNuejqHcOqrgMbIwuKPiGgefABQtWtryhrv+xF/ZuYuxLXp4XrdJ
 0EjfJJi5GtKD+6oXZONpBDOmHdTkkm4Cw/3B7UEMYg15dD4bavucvgu
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4KjzAbGRRLV2
 qIapdqi5UWkEGSG06vKdzi8DANjqHJhrXcGdts0ecXICv8RgiY9eADTUyMlyAnJmyosJJJ14dr2
 CM35qYwWhqjLNf5Z4narKZywNhvYIx3BeHiwRykRjVMY9+QpDgWfznGfvdSmwEmqo10MVhOaf/X
 7hSdcoauacejT0nvCUrM1o2JVDIBix8JPMHBcg7hew+qbxQdU0sU6GNR4xUIFMqUtgUOFhiqItw
 uPm5Z6ylTteEClVCewtPmxT0BzHQWIMZwLHWo8z+6MktCR1QeO/7NuII4rUFd08vjbVlJfZMSQi
 Gb1HoqetccVbyEJW2NnLaNnmqcFk8OeuC2cqFucDfsIouALw8Z/VdYC5LX4hbzFt9wQEUU9Fd4m
 Tq+W9ddYGy2jjHxOvvZDA9XaophnMCHym9mkIO1u5iTopacU5QPBF9+OIV5fVZ9vw/5RxZvyXPC
 KEfWOSUmG9/SoHWRghw==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004e93 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ABjeBd632R1TBavL6SZgDzq97FRaBD0Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzRRWcCgKIGDD
 +8ZVsVOAB3mp4DohBKiTpW90A8+ZNH4KKccRpCC41WitIo8QGxIzKDwqLcvzvV8g/i/mu2k6kXO
 JAh8OlvmENPxXmfYcAquNGo+PQFxM1g=
X-Proofpoint-GUID: ABjeBd632R1TBavL6SZgDzq97FRaBD0Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On X1E80100 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 443c1a5c212d..f5b720d73a4e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4289,6 +4289,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gem_noc: interconnect@26400000 {

-- 
2.34.1

