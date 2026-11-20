Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172875;
	b=Yv5Jb+wrNcBoBMmqr4Jzh/0dByhmw7D2Bq+Aa3mPpQLO5fmys2qI1ycvNVikmfxAbQsy
	 Ig908WWpELzKzeOiP+kwtPTFeg9hQmTZZb138J+xJIvSt4/ZFmc4cZeNg/gSEqKIUtZAg
	 fCyrc5LyJ15YrvuduuDPc0WqJKm5kdBU6fte5tsWiQyuB80xVDeMHkX6DFRXtuh/sozGQ
	 xuOqMrB9Yv6QF11hpl2kv1Rp4pr4D+c6/ZRi0O37RDEH5SGW7IlnoClfbGM7FYHpBKuMH
	 jd77BbbfhIO5i51jlqJ7AX7TK8rPzlgxeTPzHi3ggbJ8LfdWl1IH4fKOE+VkkH/co8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172875;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
	b=aY79kM653Gs/xLmne4doPW3Lq0kbsJrFlV3/uk873CelL4SG7LoneP1nqVSD362UMCfw
	 1tP+PHMQ6PYTbQj2ZPWQVOd1aCxrQUeW5ZZcdUTOPEGPXiRZ/2iBHRn24PGmeBQ3tlrZj
	 L+nAJ+ny6Mo0OYihV8JnwBKBgeSPBA1HaVslB0KFuoIzcX9lcrtlBcmlH6dIWZdbC+RLY
	 Z76jxc4ZTa/GJdct0OvGOPZ6Wsb3+XIGkT95GuTUjrM3hLzNLl/fFK9byFnXChYepZem9
	 RQMRUjizP6I9ipPOqcGiGc3+8JWPohTMQ6WbyInfQGeCAZmDGOo+w8ZKygIcQRei46w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyqRLmY2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2252606D877
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2252606D877
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyqRLmY2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0sQ1060577
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=koskxqCnq8MhVs/C
	CKwbThD06UaTkkfRTXXCUuz1i+bZzwHF0FcDd8BbxC/exytm6F6k0wa6AzLt3+HZ
	NY/SiCJ7yITHOeZg2qfJtHrfWWIxBHvSlvFtVTCDmANaO1RLAkLotiYHc+Ox8v8e
	av/Zer2K1JHA+rrda/7zA/CcxMUIs7MfkJlgQar3IyarKxWueOMIROmjooMqjM0x
	bfLWuQLR/K0SR7itT8qW/XgKVL2zr8uqRJ6lNL365dpr2Mj6F188YXVfwFnN0La/
	a8uBfhYvu8BtYMnvk/1S8meK7CzASWp7L7lc2dp0g7o0Fu4hFChq/51TMErRxWr/
	8oOB9Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 11:07:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso848332eec.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172873; x=1795777673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=XyqRLmY2732/cZaqegBmfRtwXrAIQz8lRdnRDKsb0sVYSqSCuPwcvxxYRSlgTHfLDj
         Dq43tEPsX8cg08M45CrtWq2jbgZFfIDFb21iXHSDcSXE+xyQXOH+o2/xmyXJtEGlP4sk
         Ji08ZCIiRfDKpgsCnw+W+fX2qRvgk+BCpjLZUmE9xgTwmbe891+VMdqDAyeivyl+0Apb
         buY612HEfbgFqQCJVk4KMPZ6zEdVTL8GvYx/+gmdtQsJ/9kslYkohU34bFgkTX6+C7Cf
         3lravH3SAhMRCrzaxWxE4YVfQctgr2vb6qAiWb1A2w11qhgklTluByD0n3KuXkasu8jk
         APEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172873; x=1795777673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=DWLiNF+YubdSTZC1y6GRTDcvmxI9A5XUJt7irvmsyVsvtjZki3llTPtXHplsUIGt84
         7Zjm/UFLSWJ9RvcgoLnoEQUgptGWoyRYg3LMgQITVfSHz7k6ycknIzypnoxmr3LBhuw5
         hGLn7ZrLyD1A2YUfiKX5iJafothKM7qqH/CVocWzp/V+dGhAdvxJmCITcan9NUmG+ayu
         ZS2oY51girnDBKKurx6gHftCfgEdeydCdeE9jMEXvPdFn5ouaZ55PMR2ldwgOrs7nXxq
         TWdevMgUD//G/A556XMKZCmnaOpxHMsuRGYCoHU3//J42beJ8brSiJM87RhzgNWzwgn3
         V5jA==
X-Forwarded-Encrypted: i=1; AL+hErEJmGv1CEtzIQ2lEPbe+XmsrMQ3jsaK+kWjqjZe2ElKlODCwhJ2x/syJhyXz9DxE916XAozXgaZSb0y@vger.kernel.org
X-Gm-Message-State: APuU4Z/nMNPlFTYPE900MlRDHdmyCr20SURRT5TvArsCundO5evkC9mo
	OYZ4kxL1ZgTiNxbSZh4IHApTQS6mng7DQdBMwJ5BoQQW12EBgOL34uN3ZC2ZnsDugqHR99A3Ufz
	rwze8Msm50YEn4H9LruCzJtdWU4nB5KEPOFF64q4oAIjpfaoJ1Iu6paSMC8tIV5znz24kNiIs
X-Gm-Gg: AZFdTZdQ8NgzW9ypozGLsAJRslqUnxt0TjsL5yV4DmVUNKDy3qSP3Moe3j0LuJvhtqz
	0g9udpudbJhkV/P3kfo0aDFcSrhQLQaevHMsmyY62hzOfxwevlOZUbPhy2PnOVGa8w3bLk9IILW
	Rs/USITmyLfV0jfpRlQNK/7rdh5AvGDrP05LMG2LMU9I8EvVrY6O8+I2VmkYjXuXjrTeLQHoxgr
	VWQSs89PVo2icb5A3HuUGpCk9qGXfbjAag0rCkCL5m/5j6+UOic8avNS4Rr3fz5lw2Gh/QXBIak
	/hYEpVEKKOx8By4WbWCn67kuiL6yljci0dJkVTA8UdsJSk52IQC5oQnphoZsUTCA9z/Ro+tdOCw
	9difoFqjp8ec6C5dDhIBw0XmG1bvv7M5WZYiIzMKu5Hrd0cY7AvdZtjOUsk82pL5A8gc5ZG+mZu
	z/+Oen
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801661eec.14.1795172872590;
        Fri, 20 Nov 2026 03:07:52 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801610eec.14.1795172871888;
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:53 +0530
Subject: [PATCH v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-12-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=9gz/rvKKgvNjj6uwIais3rFdCGo4IChAppqwi1Llk7+aKXWKIB4Wq+mZFHmQafF1TTafELH8Y
 idSDNiNfrnNDmSgmeMAPynBcUSsHZD0PwkqIfI31IXZryVAff+gET7+
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzze9SlsgnvhH
 x3IVIMb4abJadt5T9W75EzUe25Bd9G2mKRNWfJni/rf0ERfY/xHRow+MmqIhBjtoIVoWhBY+515
 usuzweelEMh7bcQOpHryAOCJZwGvuPI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1jUwYyLikKYC
 iROnxjuk0zIRu9VlnBthnXzMSAYRNdgy0f0iog2u5nutP49yDNrYVogx108opbez1QmGhGVl5Rv
 QGiXUnO12D5RdtBlk6v4WDl/3dHIOsz5MbrF3B+nQEQ7rcUv+2+bVgV4QfQmGe28DUxVbe5T6jC
 aFA/+hYvRADjVDeh3NV/TolZpk1nKxw4oEOy7qpuO0t5WXXL5hdUX7NlPAF9sZj2zIDS1EyoCco
 f9yu36D6TNBQXHXD4rNNcwls/HCvUhtn7+FIyWrOCFQhbB/pbwRigsiQIrhvNOpU5ApZDYvkSAB
 sO1/m3n9yyeuwkWw5vH4dE/A1ofg9eFvBpAiU7J47dRhsdWLdEanrnwrJRaRQzq25wK1s22bmBU
 s++R9iYi5IowIxAgoEOgV9dDcGl6qEHO0Mj9y6fZ8q9DtGwLMiZb4V/6gSQFoZQi3XsCMjycfBV
 9zAKdeiSaTnZBGjDq8w==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a0a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 6OFuR-mAHno8-gpvZO9xNPeWKYxEPsXC
X-Proofpoint-GUID: 6OFuR-mAHno8-gpvZO9xNPeWKYxEPsXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

