Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172864;
	b=QF2ReYpELHLZzmj+KF8U0nUduX3vZsaYXYaKyqH/Zxmx+fZWfBECVprOK/aySLew4514
	 neTbRE0gWHHOr7tnXUOAPmnS2JyCts7MWnPDqXltpgp7gL21J3Jplxjs49cwWvMM/Bebz
	 SIdVeG7/RBKjyNUsTp3ed2+dIbQH7vWoVR6iEX+xebYinQks330agrke2AF9JZxYJUnxV
	 6xSnWgtF89XRwcCQmhWcbKqw0x1DN56i3kjFc1awBA+OPIzxqWVFs0hQXQYVhz3RQSKNo
	 rlb2NFbmaHEXOPRDufpsI8HkcMvU6DQvo6d0wMJPWL2VtlVl8L/xLugDMPi0QcFt2nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
	b=kQGFQpwTCBf+RyOAk+XYP+hWgEtIeM9StxxqTEA0yQQlPXhI9zCvaTvBbiVlZ0SyjPB8
	 3tih/8w7ZaTpMzLBfpjxSDq5PKwHclsfj2zc7cz4LTaG8dk+NBShjUeR5QsH3PKNUEJr5
	 dywsYmxT8dkC/R4/fJOdomp5OCfKKFPS37Zgq0/Ec12CmyAzajP9T5LPHTT/vmCVNL76L
	 cblZhgZkxRBvLiZdmFvB1NyuKctKCLm+7x95GlgG4TLCm3mnfjRp/jTUE/jb4TNoASmf+
	 YHhtuxdxPFtUnpJovxXPUFvzdnko83nIo6aoTb8blFNRtUVhGy6dPjlsl2pA0tz0kqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWPjB48h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A4606D845
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54A4606D845
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWPjB48h
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkDWW1017066
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=; b=eD9RHG7zNlekuLQO
	Umc9O8xT3sNIDqKFOpEJw2iDgZ3UfIvS+T35wGpJlX84qZGQC+eeIoUvJx/gnzIK
	Td8+A1/IePDCjvYYhmGwZ/a91lgNKSzXfm4B0oEksUvnsEjqmq9q/O81ui6T+2du
	ZfjLYl38qtj7dwtdRaXN2w48AVpxdhG1ig1/BwoN9eXvxdRXMuOCyS08baF3/LnM
	2wxO8Cm4QZr1cIpLNKHcW3cJzRP0mg/mSEzriD8CKv4oXCVw/GR27B1MxNDZZtZB
	2h+PMVP+NyI9oHIACyZJhGWKA/JPDCDXVuRTH1n2z3QZjJJEfhinBUVZKY25aNEM
	Ims5yg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3724667bc16so592070eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172862; x=1795777662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=cWPjB48hnKmYKu25mJWz8MZ93llQlUruAvcfYL6VfAlG65mBPwBNBZTnqOZ2bNBLXk
         qJSL7OiYtfiA9OK0MKfVQ/SJP/D8S7AgwbQpOf/t9WE4kBQ++l52D0CCjbM3av3sm9nC
         V3tCk2/KOuOSUM7gzuuzT2hnSQsZeZwGfMiVGScEvgTgtcurjZcFUsCy3jy6055BApoL
         Cdh6/v7eWXPX54zgwBub4GevXobP1RNBAIooz6bQyKYXpEzlhkeGJ/xLd7Vi03FUL+89
         LlMsFv3qn+edDBp9RaKZ9HrXw46Pv1O1WvGFQ2sesWa51j/rBUkWTELQjjf0Vzt2vwGD
         0ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172862; x=1795777662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=pyP2MwOZ3vdZIVFdpfPY1mXHgNvi7QzKBBNuURCnHPCmUsifdEEw2xL2TZ+SJzYVQb
         NoAt+mHW17CVuFJCPilG1n0Zd7H65uzcb0Us68Umoy3beMen2ynL3RF8LS5eAOtFjA/Q
         bytKbJUCzIirXgWd58wvdD91mwLnwzpZ2XH3goiSIypvS33+BYsEjcc8/91uJBf0DnDE
         fqs5hik+cdvzMXqJ8CWRSxaZ7GrQ7L8nfr4x2CPTqXps6U5Kql/8qMQhMzcHjpooo3Nf
         qyaSAtivpEXZT/RgKAe23cM8hu+FZy0on7CGafx5j7jrmXVieM5NwhARm4Osro3qgcIf
         0i/w==
X-Forwarded-Encrypted: i=1; AL+hErFhtHFQZNS8/PjwOUO0eTDuOmUdleWVg9wRtVG8M30UeIsgbRdyWRelqvrIGZEaUDx4u76xMfe35BaD@vger.kernel.org
X-Gm-Message-State: APuU4Z+M/5cN35QeGhoVgePmijMhI9Oem2kfYCVeLuWAVLS3LbW9liRZ
	pdJCvcm6GXp5ophZvXeUMIExvFrmpTN4pML/oCCJmVoozANOtDnIAYrRMb7O9Emskq3HZfe9vB6
	hoQfQp8lAHOeryQ248s5jGCiwaa/8x63n3ycwAtNybkLEtUVonOsrCeXTk1P0m9BT
X-Gm-Gg: AZFdTZcq4vB1PUQz1wNiNASfOZtkCqc4Imxp/Em4WKwnCjNA+YoJ9odLGwfdDy5b8KT
	0EXQUFeOdU5I9oCteoJ9o4qaLHOl2/fzSTanIoikd+WNs7mNzqGuoPV48fUJue7gJ1f+UMu+rC4
	5LBwKclWy44sDPrczGiCivAALJiuGzC5ZRPUtTT7VyAs4XSws/vgT+nRbBjlf613e32ofHrBdjH
	XisDVOIFe9Wxlk0TSuhidpmtMhy6PqptFveDNzEse4Y7DAMj5U7XWtrqaj1m/+Z5eMU6Ctv+nCD
	z35xdXJzGNchjI7rHzZpggvMK3FCMzfMC21oZzY8UG7opwG5dddHFN+YZ5UIGVRINA+EaJIXJ1M
	XJ7i13XE5mNlORkxNgAkg2GDRnHFHHU5s5k2+d09fD5i2j+y4m77e2dBqeBrM9qs1gWBoKBaPX/
	Kgmkb7
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160541eec.21.1795172862116;
        Fri, 20 Nov 2026 03:07:42 -0800 (PST)
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160488eec.21.1795172861446;
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:51 +0530
Subject: [PATCH v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-10-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1335;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=BJI9Qa+ALwqIsUj0DfJo7B+SV6DPkM10cbLytxJMbcM=;
 b=iDWhFdAcUQz86qchqaGgo72B4dP/xA4xeHvIsaSCpx5fY419WT9WrzE1fBkWEtNJC2d3KiBmo
 LIRDLJ0PBAlAUyr9Gm5xL/jT1k3Sol2uGi8bvu3WZCc4c3ZmPDmZ741
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX35XOnJWYAH/X
 5ndYX7BMa8/FZ21hEw+gPsq+XwsLOnWedUQjUZVBE/1B3iQkQIldr5uJ3iZMeXlUXR4BNTX+SkV
 KiEry7qTkhFtBI5ocpvgdUzJzfP11Bo1On9xoZOmP1acj665O8os1bHTrGrEq6rmVR6BVrXqmkR
 MM7nkwEu9Y7tY/B4Olf1DU2oMOcfuMFUSIzAMvFFgynBSurzrxvRhT+HzXUGba0WBt1gulvVfX9
 jzeOGrC0RF0WNjVw7nBKWiD+AdGWaIUMJcBdzmRH5RfLFJH1J7pDe0TsRHJc4qyOrlfxMNY6o+p
 KCaySk43B37tQQGKtF4Thhol1cdFZ4gZtWFYiGyQbGyAT64P2UiD/39DuXrQ9XvT2l6rvyR4Z3n
 TSTH3XrBqGloCoMta4MBSyc8pOOlvzOef46jWpvjtgiDLZ6msN02yeMEG5hAvPhXZXQVJC5OIYi
 KCyfZwoPzTex19KiahA==
X-Proofpoint-GUID: FJyBzzeSb1LALhxfD9igS30Nez0SbujX
X-Proofpoint-ORIG-GUID: FJyBzzeSb1LALhxfD9igS30Nez0SbujX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1XYpnadQUZdv
 o+0PZaKJzxHIa0cqcN6oZOUfqURAQesr9NJ2wdDXVlq5TJ/Wj4is4FkMcSMPb+8Xv9vlV9q18DU
 KIS4TF8GVm6IW9KThtjPiLZNqYacVyQ=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b0029fe cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..88a39e5e8f07 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2280,7 +2280,6 @@ gpu: gpu@2c00000 {
 			operating-points-v2 = <&gpu_opp_table>;
 
 			interconnects = <&gem_noc MASTER_GRAPHICS_3D 0 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "gfx-mem";
 
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
@@ -2410,6 +2409,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

