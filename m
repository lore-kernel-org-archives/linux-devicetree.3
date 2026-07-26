Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454B364028
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045132; cv=none; b=GVzbql0R4jtQpYEHUPoASMJ5YFRsERer+bORHr+f8V1o7sTWpntzq3K71+l/m0f6B1YRAY7ux1+x72NdcbXSP79Tu0kzrElo46VMmpnUNIAz359b1+TFpezm393IY5Cj+EXII3ByjzZ4zRbQZ50P8L7kma6rih+JKd9BlB9+Qrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045132; c=relaxed/simple;
	bh=QMtO0aaK+jEwfLoS/FX/xRFAe8jOcUGQ12dvcUB8g1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nOmencpFaN0MDTneaIoNZTrNUayQbDIUWuPxpDQ9m1++Xp49p+/I1q1H2zN9eqLJ4TveAZvCH5EDB+e/qe3X9Mz+p7+ranzdJHp8OqyuXG3Chjc+o7GlSJxHKFvCn+Jx9FSa1gTQgSU7XC8GCgAmUNJp1DgENLelu/BczPnoCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1GwRksO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eq+dIIvi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1GwRksO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eq+dIIvi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RKmh3489553
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=; b=K1GwRksOkSEVHQXf
	5n7T0MfRhQat+SBW+pZX39b1mXmF50QS8Ch6syDFa8piOfRkH7Eq1H12dMAnUETF
	zOtQ7FGdTfBK/49ilvEdf8uZfImByCBnkxcucc9ntmpzU25T0ewwNpnhq0o0u5C4
	IGJyYAEdouiOhukhIkmPzk3nfdGRgDoEbMtBa6q7T5gNEKWCSU0NgGKEMlM/EX4j
	xCOon6TmSt3+VWIv3+HCuz34QAgVXTahfV4Nupq7aGVkDQDelH08b7pSpaOHN1J7
	ppQIex0+eNhnBQt3hWn/cJ6qDMI1G3YS3mqB/niMUJjVtHYNP8QCDCA+F7yGlCIN
	aausBA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajj5t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 05:52:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso1290333a12.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045130; x=1785649930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=;
        b=eq+dIIvi47aFw3re89oZAGWu5LnthGSU1LAOuLqG9ENYZlCLiMRXR7mdzeCVnHumjE
         96oNv4WyJhHpkoWB27Tw8oW6vXgaFwqQAgCWoLG87iZfLA3cYCthHj0jlrEmPQMIldVr
         FWOmHHW1IXCO+oExMclRSj5QKOtfYYkKQRxGSIrBzA2qs2/yyzFCykPBtLMmW+xamF7L
         rNPTW1o96/2TlTQPEY0NTLt0WEdBBOU9paXkthK9LUXT8TOnIZAdsfEUZ6VXkELT9HjG
         NlRL8yfGPT4jqfR5CRDeIdufeydG4QSDtUajE8dKY936oSFZkibgGlWr/tfMfmgyHprQ
         qceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045130; x=1785649930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bMCoOHF+KRjaR6jwkz18K6wWxQZjA74R5y1B2yqirho=;
        b=Kkd2wrKqNOyK7D/klrsvi+MX+cBhm15QVVlN7fXnxNXog/EXciI1TidRi4jq31SBIe
         zJ6deeGGamRX964VCw0mt+o1w+xVwIKB4vp2Bv6VUc3fSoZblN82kLGACALjVNYQplN4
         hqLKatS50cj6zQxKQA5VEi7D8tcq0FTpFhWXZDykS/VhWhRn7FIQ3n5fTLZMZr7Oi57Y
         X7H/Drmm/oDhdJSokf8wVmnCpCUeURI+uL1YGmJX4xQUpVMKiGwmL5FsVR+pQp+utP7M
         nuT89f8Y9i8Ph82hG98HPFIN/oKzgSvPnCorXVj3Y0G23BZja7xTVJ7cPrJaK3HcfoWa
         yZcA==
X-Forwarded-Encrypted: i=1; AHgh+RrbRNQL7NYn/Q7W4R9ZeGqvDjzgKDOyPnDAA4cEqfWDOOM3OvLzWpl1WV4p6ErqMgMZVFWibWPQbAwn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnm5P8r2uxWzAult7PK1G8bAa+A5vjLmdrDSO4GPVcKwg4anSG
	Ak5AXrp7Q0qLZo7d9xisgliJFI9ZzNSDgAAOhCQCaEvH+BpFmdFlL5/ujJAGnJnUcEkhzCqIPHA
	eF01MTRqFDdr1mWS7cOu0wV4VP/jeLnm5hTEX6Jz8cvi1mjn7LSm5uFP+zo8mczN1
X-Gm-Gg: AR+sD12+wEoxCz5/Hi3ZAZ+TWIaVFFxrW/D6KFPxyLVYrfyh1fY2aeeSHWcke9vxYeH
	XLi7dXnzwx9k+xgedszubca78PO+rm5D43ssmWYumwypmiiDunxvfB9W2uQBgkfIf3aGxdK1iBd
	iiNeKtte4jU2KBkXsGidks3MwoVH7sh6kr2W4k/U3dzeJ59gW+pPt8sSdWYqldFPYeed1DQ573I
	ytkBK0YTf1CsERgVeAifrLqTTpvnjbv8WiXVjWHnJ1ljncuVX+tOUBQB8K54hCgEcl+mFzG07Tq
	ko+wbk3dbwGfmH0DPHpT2ITXWWeOlZgL5ILKD7bTLcbHfC13np6xoXPYjxoGZTAuMzwC5bpyrbV
	reaDxdfx12n2ZyJvtMSIAf0gmldHtWjSUAw==
X-Received: by 2002:a05:6a21:3393:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c67df285fcmr4613017637.48.1785045129491;
        Sat, 25 Jul 2026 22:52:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:3393:b0:3c3:b57b:628f with SMTP id adf61e73a8af0-3c67df285fcmr4612994637.48.1785045129054;
        Sat, 25 Jul 2026 22:52:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:52:08 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:44 +0530
Subject: [PATCH v10 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-14-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=1017;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=QMtO0aaK+jEwfLoS/FX/xRFAe8jOcUGQ12dvcUB8g1Y=;
 b=k2vmy+1Hvs+i3tndHQiZE3m0r+Wru7GaVIqoEaaJnGXwex8ucR+WVe9BqSpoha508idHXhkC7
 0jlWG27zHZBAwhrqnLiZ+0Du0lmPXC8wakvmfuDl73IGSbaA4CEy0LP
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: caK05AKOMoIBsF_kzyxKCYeN-PtXIji9
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a65a08a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jls_Txh2LmBa37OkJYYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: caK05AKOMoIBsF_kzyxKCYeN-PtXIji9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX1gnJywxJJ5Lg
 M6bYYuVDieGaLekoquYtTMO6Q9vy79Nxqzq+jhC1pJwjPiT3U2DxUnCa5yEzXZ55DnvTI5AH27C
 RJCw95X1/0lrNHBCDb/hwvS9ZSl6j/ITFqqPVfKYHnedpnoygn9TBbIFcn4D14hTZo2/shrHsxF
 GG1NdaSynXO6ghA+XUGgvzrkS+BguEbLnYd1+A3ey6Y+znzvvyC/LzMVSn/V2fDF9EAoxBcozhV
 zqbu1hukvM0laV57umbz7hr/V3ZePxXrhqXIkV0e3sEKS1PZaQdpnE9QXTpIgQdajXjnOG35T+o
 PALwg6B3J6ciVU9PWTvOkl0bSKb9QeCbw0CfOn+3i+eD/u9ZVHccQdyOwyEIxCh2qYlmRXVEpEP
 OopFJwoAI12wt2iv6c8R5VkCRLFvQvsaStDR8Hkt7EMzwhBb5bhLT5aSlEPVOz3gmkWO83+gEd8
 iy1om+4t4JOyaG5apWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfXybJrr7LM1Di5
 D07Qew481a704LVx0SrC7/WtTkCYf3ZteEULBkkuPczqgRGjYg5g45sU0ou5SLrlS1ZBKJ04ufy
 j3bl2wt74XnCVw0f4RiyVgze4EZjMX8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

The iris hardware block is described in the glymur SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index c12808abbfe1..b8eed6e99588 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -695,6 +695,16 @@ touchscreen@38 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+
+	video-firmware {
+		iommus = <&apps_smmu 0x19e2 0x0>;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.34.1

