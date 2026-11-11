Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415766;
	b=AfgMakpxvJqagZVj7znMXOX1wpe5mx3bCyBsJC4vhAsLS7w3GZT8FNNagyN3XY1L84Er
	 4SgSeSvOc31JBJJRMrYACgIzHGwThW2xCuo70KSKSdM2+G0nc/Qbiby1/6rWixCJ2DdwH
	 KVOIxu2oHafo9+44ToHLSxIVbjEJAnZSdJEHI+F0fvKWD4/frjYvvm+0GSbxO9vvvVkIW
	 Gydr7MK3naB5KuWNNLnj9EerhDbgOez/uX5nkA+SgEimsuWVRo5qZ5Wp9B0nL0yfRdDKG
	 t/H5bI+nujlroaBi0SD5Hpzl7iimJEPF78HMEsOOPe0xac5OEIcC4lfaJJVCj+3wg2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8TaySGWxrwzJNf+ca7AfJqo8L2MFxcf4YcqPChaH5EM=;
	b=RprAlFXO8pIPeJ5ndrrICIWIeVO2mZtWz6awO9QZ0livEPN5ZsW8Kjs52tDBtwn8ttNM
	 wywRo+XtoD4pqMQy9Dt7fDcwEBPSKIDyCm7oVbjGu0eB9XD+GxonI6LGX9FR7adBeR7Ef
	 NpduzByD9BEhCo8gWO4dFTb9FdOpGfUddrOFif5LV5QomuEClvMmm1vr40dpm9MnJXYA5
	 J6Flr3geNi/m5kvUHDk+CLt2n79nFXg81KHC+DM43ywY1pZYWXUpnDS+xzwWgZDhZ2SZd
	 48Un/oQz8IFkyUCWnjCbaF1jw9WTHimB1jp8EAggK5j8spwM8RW3psOBkY5OoG0RvtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fM/L7XcL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlQqVwC0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28738606A31C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28738606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM/L7XcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HlQqVwC0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0OJj2665121
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8TaySGWxrwzJNf+ca7AfJq
	o8L2MFxcf4YcqPChaH5EM=; b=fM/L7XcLJJ0Ksni0tOAYu70ncd/yoaLJYjV/Ou
	2JF5rc3kG1i6+qthtc2Xi86erT7O8m3GYlkU+rygidAy+uEGCQ5yyi04Yx27eXlL
	Xkb76OYtuteSK5SXT+WaGM0CAfyvnrGh8urPgJ75Lxzn8EvFzFIBNdoO+PuddQeq
	HxQBgs1sZ2TmCRymHMg8BhVrosAywdDTiYR7ZDBxZddmLeTtyDDNJ3FiMUGGNJLt
	ulIqbUA1j09OBQEcy8KS2+sO3rDIbYp/WhYNzwf/3fBkCvWybK/OwjuuTraem5t9
	9hW2Gg+6RGeWEXVQI6dr4wet/ErQyiYtKWEAsRxDypw8as5g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdjtwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:49:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so32349a91.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415765; x=1795020565; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8TaySGWxrwzJNf+ca7AfJqo8L2MFxcf4YcqPChaH5EM=;
        b=HlQqVwC0uSdjPa3iMBflsvMaN9W7SU2ncrcl1u3wHk7p2MLWDca+qn6WTFz4jiAPaU
         H7LTst41LvA4MR70ucvmvBM4D/a9KCrsWrrHFavyJflhfaDmF6PGndVvHa/uRmXx+2zt
         EtlliJVdh2jcUrQIHXlo45umrLpo0DoAv9V0SGP1eKjndZ2d7m/HZTGdeemLvKmCYXmN
         Xv9IOqNZj9Gle53O+sqEFSVDlNnQy9HT7lBF9xMxc7oF389DDEBN1O36Jbm2iBXZ3Xao
         Vk3A8fdNmSu77TkQOzGV12DLedzfRm57wg9zU9xG3gsbEJZs+DYe3eCla6s9AVgvZC6G
         SPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415765; x=1795020565;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8TaySGWxrwzJNf+ca7AfJqo8L2MFxcf4YcqPChaH5EM=;
        b=TgZQKWdIi+KRPzeP0Qpir53dylH/xVaOGSK0ogkd8jELBd2d0x4vf6F/J8Rm9xacpK
         uDpiABZh6fT5Apq3bV0IsyGCq4O93ckXQ4VZwG4MOfmteWvOrlfqRBF574Y6JTM+2iAK
         8RmAPFjZ9Ia4TXkFU2akCGRz8hGBVdURrzspf3VYbhxfQtE+FMisle0IrSBawXpKXn1s
         RnU83B0loiyYlxmfghe4Nj8HOh6JVM3YwFFrQBbfx6/38Lo6BXhMjjlx/GGyQT7kWgWl
         VXtWRVXkcUHidoRxUxSvWrxFb9BPKfocXKxSUz0d8Myfn25tZEDh0Q9PoGqx8jAenl/9
         VfyA==
X-Forwarded-Encrypted: i=1; AL+hErHM/pbe1Aw8yow1cK+6FPYp44cw3aHD7Qq3X7lLUbfd7XQQRI1WgmR8DnUjQNpwyXwOeqkjrG/adDAx@vger.kernel.org
X-Gm-Message-State: APuU4Z+nQok4og7Br8HE+8UX8aP3Ulq2ikI5WJnoMcryQvDVEggEzGpY
	GAme6+G/hv6sYPrFsmbVuHOp36rXwZ+4UxSWyumE1cRLpliKDM1fkQBgNiTrD60PqwWwvgXAAxk
	QrkutA+sEgVjePyjaur54fcSsqIY4HtbK5v7+A2+Mmv4EuTBZ4WMorth+KqO9wLo2FeONQ9bh
X-Gm-Gg: AYBFou3wZUKKkGEDCH/8ZAYH5VFGpYWe2MtMxgHiApQ7xBltYOo48L5YKUQ1DkS/Rpc
	YFhjuXRD29HoTf9E7qJuqfZgXrxYCNQx+u9U+A55O7FWyzqtSoDzgj9EZYeX6PQA50jWuGwQWYJ
	DfXbHwY8rtR5FOlHUpnWJtwCZpDfbLFMn54DLyk4SqpKq30YDhFfwNuVx9+L+GsVHuD9yNGYyYy
	DwbYAMtE0PLZbzisdgILchpk1H3hnWzlW1taNbqFdyYWyvou3bgandfCVp5fhgLjqrGkIO3tnDO
	6al4AWVKbK7ne7tsylxCjB4+GHx0Qn5h6tzI+TGFBcNQoxm2F0CyRsP8V5tDHNoUKxWpSY664uF
	EKlOUENxDHrEZpPHTgyyMHw1enXnfoEaStNtgXM+MajnLsAGu5EBbggZDBHEokMwSDSGfkePGkF
	XmHmGk
X-Received: by 2002:a17:90b:4a89:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b197c96f7dmr35244a91.18.1794415764603;
        Wed, 11 Nov 2026 08:49:24 -0800 (PST)
X-Received: by 2002:a17:90b:4a89:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3b197c96f7dmr35223a91.18.1794415764073;
        Wed, 11 Nov 2026 08:49:24 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm39691a91.6.2026.11.11.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:49:23 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:18:32 +0530
Subject: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context
 bank
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
Message-Id: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF+c9GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINDNSc1NzCtOTjI00LUwTTSxSEo0TzQxtlQCaigoSk3LrAAbFh1bWws
 A9v4NMlwAAAA=
X-Change-ID: 20261111-lemanscb10-85a48ba7a439
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Ling Xu <quic_lxu5@quicinc.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794415758; l=1428;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=+ZsbLm7dKaenF30k+KJrakVPCc+VOnDzs9ty9fvVESY=;
 b=MHTwmLw5qZdKKe6ppLp745ovDpgo/Q7vvHbERt544JKoCUTsRlTM5JQg/E+5GkzaUXBOt9Mls
 Du7Ak8vzMMjCRp9BXf5tJTynd+0wAYV+Eje74w+j85epVaqmv00CJqC
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af49c95 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bmayPmC67nidEJ-jaKoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: m_EidzVPLlm1J_oZnrFdTBc_2DxOZfSQ
X-Proofpoint-GUID: m_EidzVPLlm1J_oZnrFdTBc_2DxOZfSQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX+MyTNRCpTelP
 PJlHc5dNtTB3Pav6mxfmC23jDPXlbePBZx6x/+yUY6bL/O/kshm23i63xs3K+cV/2U7ngKiZYTc
 I+iPQJ+ZcDuobkLejZfg0aH4664T0sMQQ3iuGoVwZXKPfylbd9tnSLm8I232+qvaRBoYtYNfEO6
 n1fbqTlZJ7sKwfWq7Xe5lD5TYpLTeE4mBuYRLoOX9zWsf+/TnXpLUZ/KtHPhnMM9nL++lCwVpex
 2pN0secILFsj2f7IwbFCj8gyKTE3AU8MRxIg/dcW7VtGBhkab5fDcx4iD+VkGWA3tIO19uziM1/
 t46xRR/1LGXXQcMgZdipJZEJKvsCJZ0kh0k8Cne07mfdXqV5IPVcvErAhqXK6NCN2sPkTfGNQIU
 g8m3jySiR9aQnGBRg6Dp4Nyh/lNyKMqEi41cQ/f5sgmanCaaAMm3dF+qKpOK4hpZ3kohemZg8Dm
 2v4Zvwn65MrDST8WmDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX8YWkc5oBcpK/
 6jBv2qOa8kNneltmHJEes/6RPOkJMzy8dM1lxMkh/iPsju5AzMzGD4gN7SfjV33nA/SgaadX4M6
 Wl11GM+oyJokdoaZfUfM7h9pDvSmKU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110066

FastRPC context bank 10 is reserved for the secure PD feature available
in downstream. The secure PD feature is not supported upstream and the
context bank must not be used by any other PD.

Using this context bank for a non-secure PD results in an SMMU
non-secure global fault.

Remove the context bank from the upstream device tree to prevent it from
being assigned to an unsupported PD.

Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..e298747c06bc 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4668,14 +4668,6 @@ compute-cb@9 {
 						dma-coherent;
 					};
 
-					compute-cb@10 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
-						iommus = <&apps_smmu 0x294a 0x04a0>,
-							 <&apps_smmu 0x298a 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-lemanscb10-85a48ba7a439

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

