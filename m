Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172890;
	b=JwjdyD3A5kYgbUgjO7WT6uKIgMEASPHh+AEaGW4dfDJMhZAlGMCJjgYlU8cAoeEZjhVt
	 mcTuB4Ps6dt7kTgJ+7J4TuQaBBDf269ezbhCJgRYr1U87pE9pbePpqLGheW08MASuNX7b
	 /U8NoYDk8Wlk+MWXXX4fSgNeDaejBEYVXbUtPh4nrpvREMK71uNCP2FMBlaMW3WuzjaSW
	 mGCzZ3/GClV5vw7ll4OH/RyNn7ZR0y2/zzy5XUhRmgbjZLGPCVkewou92yLD7+SQAmjO9
	 Pcp6SbsAnlTI4j1/8k3ptjxa+HGTeNikalsDSUpOcP59sTcnnyew70GZ9YmQsZORUWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
	b=hOOpR6v2sHWYDIzetqxuImlkVJ61rO1s9C2XT9UWHSZ6wDCoaCB9yFTJ8F082xa5oQVu
	 Z2b6csUrf7SS4ZVPWvHjzXqh7t0pNi66sMFERLWHSq2cEOaKSgXTXtwbIJrG/AjfjML2s
	 Fnoj3XId/cQ24cKNAx5d/nZM4uKvtV19JRnQfm6KEnap5IS/5AJkj3xvPBF+nALHjfrvy
	 nU88Xam3I914EmWZMhodD9jW/0wwemCP4i6bLqFkCIgWHXKYY17TlFHvAPPXB8wZrCs9h
	 l8nOxeKXsNzW6cnXCwKu/LO/oA/BzhIcnULbvl7yNVY7QjB5+uNxQrkYO5OqwoEqqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0cBezbm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C460A261E
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 601C460A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a5z1jAs5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0cBezbm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvrO1060459
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=; b=a5z1jAs5MMdI0hy9
	/2sSylcgaFjGeMT5+JQIh628CxXAkjfvE755/fL9f0OsvxCeDWj5ivd/rlibN1n4
	Qa+fzaJNafeiNUnRu0LFOguj5A86icgccw440qy/gvvJTboiPZuvxSrGzh5F1Nr3
	sfbQq95BT8cJRKWJx4AU5t11Y9X4O6FBOlasoDB6Oq/76AZOAtQMJ2J6J+VKMMr/
	Coc4Bo/iNSUu7te1HH3XdtDKo2csilTZOCnD6x9l5QgQwT7ym0M2ldbfM6GFJLk8
	qyX7GLmnCSTA8B/6rqgXY/ZXu+2L1FfFYpdXIj7jsIFMZII/dvhT+QsCyUoIlUos
	S8ZhdA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:08:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so1028640eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172888; x=1795777688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=F0cBezbmTGji720fiOHaHmV4+awlJht47iRWyLszGWQmescXjbdGJXdiWQv9L1P89h
         6UxAU9XVLuf1tjj2UvVN6hR4DgELXfiOtdyFkH6L+c+1nzh6eg0RlHsUYwmmjpvLORs9
         t18wMzAWDWa0X5Gf40oZoD2/DEhypJHvJpH8pTJkHGluUQnkASfUKT831HkZLO+hUiEX
         Z0OfLQNHvtc+loxzXNaWumZza0R6hcHebx93SAxTDQaGMP5c1bOFJdWz6ERs5pU/5xD/
         ML3UfCdQJa6MIcsRFNnR1e3G3Ni+nrJ0g7f7kxDdh6tEFD3oncNEvcwuKdRCLGPFzTNS
         /zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172888; x=1795777688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGy86xBzxOdtKe/pt5x0J8JCDH7VjEkzSSCaoMU+88M=;
        b=VOOiptH9mV29CRQ5JmpuKmPkiCjSe0qlZtasIYIYnLIyAYzwZPABaSlYNEyJt9Iomu
         m7qD3PNtNB06E1gIjHWjiwQkjy4GsqfGTJfE99xQnIrVqB16W10CqScSDSO/FQ8TdS1s
         3xlpMCur2Odz7TgCTQZRCdD73k368OLqC3QUhcXFlvXohZElTQ5xfnjMDEDVSUAOG9AK
         SpXl7bMyR8v8WDlq9X6uS5CVwqGwg1YUpU+Qs1PEAyLdLvTCdAzDQ1HkIEAU9bU1k78o
         Iwit/JogRzXAMpjnxlYID++EESyw7Ir0t39oE47PjmJ3jETCuWSu38pCfSayXoxFKVYb
         R7XA==
X-Forwarded-Encrypted: i=1; AL+hErGKRwVzTFo53fUUboRjuc1TCqdi3/zmJRrQLkItQALfiENBxwUHoKz7fIl//UBeDgjQlqL2KhdJzot0@vger.kernel.org
X-Gm-Message-State: APuU4Z+g5vbO+vL9WYkFrNMRfnN1STC7Gm5JgqN2pOhmvwQ7euBPHpDu
	O1engmTzSPamp862dDYiB9vajsCfKzCjUYnSvhalhQk+KorewrIAxchrjQnJCvyT+gs7nnGGzDF
	xGFlde/0PegBBMHYpn38Xg0Au15r/1RLE64BPZdxKxK/mFGqQa1Fv93Tpmkm1CEgZ
X-Gm-Gg: AZFdTZfaBju4FXVlgQejhLt8eTHlcLZzCgAXrdFZ/g/FXwjJFyN74pJ6/jefMBreoGV
	/+SuIRvv1UPTM959YkivNA7TKOsvpIB0kEl5qUBYSbkHqvk83aiMOuOkIvIXE1Go3bYHAuYjt9h
	xzuI/jn5nrcdAPvLyaZ6Xfv3YEDKuRY2lQRsBhXFgZ3tdzfvwqRcd43qKMgJ0RD7u+7z/zZJDfi
	GZxIpzNV+8/NluOBrjVA2dEO6DYw0pLMsl34aeHhe/K8qQyJGyY3A80yAiwEattQ2+QNOBom12n
	097HahhyMtsYr5EHL5Mk+pL9vjmxFhvH+BO4n+PYPNMAuLCeIsAGNUAg4TWT7fYOKUrtCcXAePn
	b+aD6EkDLmLvOXwXDdG49nznuUmDJrKRtMQeVjUW0XmsmJgt2kmzfDC3MB1X6yzh4eEFhV+0EOX
	rxrsAp
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199510eec.39.1795172888161;
        Fri, 20 Nov 2026 03:08:08 -0800 (PST)
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr2199453eec.39.1795172887470;
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:07 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:56 +0530
Subject: [PATCH v4 15/20] arm64: dts: qcom: hamoa: Add GEM_NOC interconnect
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
Message-Id: <20261120-smmu_interconnect_addition-v4-15-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1049;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=o8a7Ojp0eNjNzQ0rCM2WmCZSQ5u7xFkQL6aYtQmrXTk=;
 b=d2eocCApPGXdnTgSfpyPl1IT3Npi+VGzlX8Texs24AYeMDJUpxzteo/necfGq9pPJ+rGkHPav
 w2QQPhTc/MEDRSCceJSSG8DMzmugQp/HbB/FtH22nfxMVhA/fxUyyUl
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/3CtD1iDn9Xd
 NcOHaCuK4TiBFWn97tpuVszOA8zM073pxP/ZdfHmKCOlwcbLzw+ol8qQcdHGSUcb2W78tsQb1zA
 d9xJPWQKvSw6rMMAFJ7szrNxFs7QBsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4+dRtS62zQI4
 WUUOKoeU9Y3GxqETIsTpjRjuaZch0qHgVM8elXsb4ffQmNTG/BLsrFPlXdKY8vysCtt96XymbvB
 23F+ZcIweiGhlDu1d17fW345/gLUlPeJC9ljsw0EBt2EXHbvxiAFfT5qcM3pqOi+aOPYxzf99vB
 FkJqCqzXZEX4cIu79WG0dnWDBYpE4xTKTMBh+8/neT/erPr1JUnYZMNQx0tIAHrZT/S+bLQjKvn
 tFVuNJ8qbid8p8CKLPnzaFaBQEAY6069l11OolaviFDGoQwm58d9T8tjBRO3ON6x7rTcKZqEou+
 1Askqj51RYH5US4Yg5jr091EJDGCTJ0pFy0mCfBub+gYmXhzgM2+fe+KGeZVDDnqu0QNdD/Ijsr
 jSP7ME3pmN20lDignfgIpXRNgCF/SXnzlLpVVe+7nRpCzA859TcxxG4H5aMHY/CxW1dy6qri7xW
 Tc/OMbVIfhloRWXMCZA==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a19 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WAcSZy-hVgrt5OVmuNwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 14qkumvAhlTRbjNjh9Yqd2WlhSzmcs1N
X-Proofpoint-GUID: 14qkumvAhlTRbjNjh9Yqd2WlhSzmcs1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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

