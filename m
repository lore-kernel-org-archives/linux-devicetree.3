Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298853;
	b=0UI6oK0c8nwI2YmgMPOQnAmC2elm7cvmY4sLzaQ6vb983/ACEFgUUO2X+MUeAxRFrdHh
	 i3dr7d38QvsJeO+rWEDPI0l6zyvCRU9oxrQKd300FrD8893VHO7kJiaQ15bUbZ1kfk/FZ
	 VHx9/6GErhdbFfeQ2VvciIOYQHhL/G+bR939VfqDFk8lDW1+s9eafT6K7LVMnay/Zdcmf
	 //IBSpP9miS3nzMKKNDTkSLvEGVPuhFmC8Il9hyN+Yi1Fm0JG5ND5JyNQDrX3xrKqQ1Wu
	 936DOVtjLa6JvKiH0MY0PC/7+q0DfwEOyKGnOHovploPibujPiKfa/2SHlXazD+JDNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
	b=5C4+3MDbPL9bcfY9l/9dQGFRrh3w2jnnNJLVJxJqT5TczArv0NSVH5Pq5NrKlocA8i6f
	 075Y4WrQhba/taSHTEtHOU3/VkOINRWFVXtRzWvlWp3gzHhln7PqVoRjYcU1JgAi+Z0Ns
	 Cm0hTBTxFpG5r3yId7/6EXNpk53R8BAsc7xqbeTlnCEjhdtBu75z3gVFhY9+9EGq+g3LT
	 16H0ZMTFlzZG4239+IrXYKeSdrp+b9X+E4TWI3mBLlBP2NSRdHnCLjTMfT7UUEvE+E+OR
	 xt2tZnphQFCrigJCxXRYOxtkOCZB9oMRUi0U2SJVx42ZpZOTvSo1qfvsvDQXZZLo9Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LTAV/hBF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEGfHPMX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AD606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD9AD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTAV/hBF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MEGfHPMX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69THDgOR182086
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=; b=LTAV/hBFUOF3eU7Y
	P+88dahkfkq+RtwhPBCqcggiNMZj/6mdi2UzlIzsqLeysPHaeOFwKM+c1s9QilgM
	ZOfl894WdEJJubhhn/3Hb+2eHOCsVcmkg5bLtUSRB6OBSeECOqEQLS7BcneJ7H6R
	+pjcyieCg0b7+zCmZjxE64TPOW3NslyXB7ykRSsxEqOw2vLh/Q1ZOD/KBTcy+w3M
	ymdelOhrGAVTesh098FiAWjsbzwQDW7tfrPTKcla9G5Q7hbVDY2WFhrNFALcb5/u
	75Rnbde1JWl0wJmjvaa7tiNzPQeKgAbR6/WBDjyM/PhratWSu4ds7sl5a0aEn8JQ
	dkkPiw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmac0rf41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:34:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so4915747eec.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 11:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298842; x=1793903642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
        b=MEGfHPMXgil9CmH+AhI5NPn64LXT4p4X0k1A/ZYyeaPDfqTMzsyu/Qi8Y2O7k94/Yc
         gE6Kj6NY4gtVZ1jA1xq3b30oDoZhBPX6N2qUf4N9L7P/kFnDIZS8HQtEuftJIanxCq6P
         UtjPreCcQa3lLilbmtvjCUOC0l6SGGTx26no8fCkUmJw09fMO7BihzMZC+JAPjak2hxO
         muupQI/KJ1k4PxVKz57gEoO/WctaCU32ME3rzIuSbM8643SPHSiFgBeQDBi3RyVg16JY
         f6XbKohopSn2BBCJV4Et2hSuS/nHWdvIF95opkLeQ9rm2MQwVgaKVSLlCjhQjNBQb8Aw
         C3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298842; x=1793903642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izTXLzeSqNlZdzXJjonS4JDVJ3O9uZmnVXAMwdG2zL0=;
        b=rRqxtM2yWee46uZOq5HvB7agHpdIEo94PuuOaxTwOkMLnsy1U0GdlXFK2QQBdbXcel
         VwrPLiGARG3WovYM9H9gN8JpkOVxQRMjePWoNb5x1FB3iRxNENxB4ZazxWyuNyufFOiz
         7ac9inRebN6P1Ry7VDWj45DTKhgRnVBR9frAKUC/UBw/YzzCAgvLxNn+hZ+vsjY7PhKN
         1WJc2JAO+hRfonqZCr3rGfEHkEV0idzsCLG+3CwhGZbafSDneU4/KtN2edutE9z6/ZN+
         QQolHC6z2TsxT0FpfNXjaIUxA5oh6YUNHiiDvzEOamFO/qgkA1dbR93PWrEMBgDrUyrN
         2eFw==
X-Forwarded-Encrypted: i=1; AKwUvBycleC2ugc68TZk9FpS+YaI4G2su6HVmoSPNK1R70uuSh90R0ImwmsHnQ53jFUuvNKAhsl5M6zm/h6T@vger.kernel.org
X-Gm-Message-State: AFq9FYI5oA1DNqSu8kJqwq+dCUVAg5EDmefApkcU51wzwrbffqFulJ2m
	MKk/Wq5IstvdIGQ4Cu22lEnK1RWFs6kDALlutxlvJxhK9YCYjE+Xs1xxdDcbT79C3sDqIsZ2r3W
	sjzZDcfqhWa/s17onnwhqJSLNetEta1YtyI7YHWcgNIx8Dm+mLnd+NqtbvZxs8S8D
X-Gm-Gg: AYBFou3v6YiwaLdljRzMUXhwv9GpIqAetBBGwq41ZQ9rsAOFmgPqpUaefwW2jGOBWJQ
	hTjoyc5js7Luq069Qz+D1f5z1VBDiH964Md+KgYIdZR/21VEyRsA+6cihXfE4iwrNdDVp7UnM5d
	b42tA0N03jlSYMH0nV4mcQ+VhOaWVopmxgoCNgnx5OKOQa/aLX0WOUGh0m9jyThgmoWWt58/mHk
	KYI8UIpWJABWLLaj9Z0NznQmDkWfbFfUxOwvJlcCIhX1dRH7pY6ATLfG8mjYzSsLe0M2Mu7Fzvu
	M/ReL+pXZgDk2XoBvaiY6lHny+CMe6X2VbKWsJX7qbIJSyvoCUx63rshKnSXYYHomJ6ZtK/VaOn
	WedohrraO1ot1lxt+s9G3AfgDu404VFFLjTPi+0TJwkI6O2MJY3sHF/A1T/cLwApmaTQ7zIdCpM
	wPCXSPel88ekX4XvtHdWazlcMm3JtYWHgQIz4YBzcA0w==
X-Received: by 2002:a05:7022:ed07:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1a6cca02dadmr8092432c88.21.1793298841206;
        Thu, 29 Oct 2026 11:34:01 -0700 (PDT)
X-Received: by 2002:a05:7022:ed07:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1a6cca02dadmr8092406c88.21.1793298840580;
        Thu, 29 Oct 2026 11:34:00 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:00 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:39 +0530
Subject: [PATCH 2/6] arm64: dts: qcom: lemans: Mark USB controllers as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-2-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=957;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=rEgskIUnrUGNrQ3rmaRBXMYPTob7wd3lSfRiOcGwpE0=;
 b=xzFtGNopMJEEx08uA3aSNHk0c67SVcSW57ix87iGRnKA9RHsVCeUTc9+PwlS18bkR9BG4xp/c
 SrV7SJQhiIOA7WNv3S2QZw4Nj1Fehl1VkpgrrWf59rWp1LzfngAGPh3
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 1RE06EzO-QbAjkhti4zzn_CKz58pqWvw
X-Proofpoint-GUID: 1RE06EzO-QbAjkhti4zzn_CKz58pqWvw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX9VQgT5ZP+Kzp
 SAXeQLn1y83NFvo7ko9sR7n8XoZvlvX604u5GAavap9NTZT8AgX7fT07XHuhf80PC8K38gXR4w2
 EGsnpxLtl1SWxpwCrS9aqk005ZgYL/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX4qKPMQESw3x6
 lKqevsE4RFulS1FN2vX0AJ7uZ1lEnms9PR9kPjPhWxkm4kcUoWx8oJjCAngRvddt39iQ3YjDCLX
 VoeJN/8C42l48wWoAwZQXMTYTKxdQmEpTUsl4s3Lpj+9r7C6Eq3gypzA/tgEEczp7D7R0cDg3p9
 fefKI7KCsCaUj1JGoVsld4b883Afq2rnY8uwB4gLamKs4lrrwhd/vmnsPhalf6iJe2tohTDbuQJ
 NqbcJ97LzBSct+PMTiocracOsuUnL1Rn8Pwn6SaKYkPbdWDjdqQWZDw0/o4dMyvAVqzzqb1PqXi
 3aMnSkfg07Mtz/MPcenAi54AV2vmP/CBjUrajhx2IwvTnZs16lSKTA7cbwvZHjf2GnIbXyU8Cgs
 +h1zhLOPjmvhJktBKNaq1+cWuDgQDUZXtSh5JXOEh/o9SeN0UK5FqCqHZn+FKeNgSgpk1buzxFw
 nF4henMhxiwWnvZQHWA==
X-Authority-Analysis: v=2.4 cv=I6/w19gg c=1 sm=1 tr=0 ts=6ae3919a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=iPg9V0jjAPOzTywj0KsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

All USB controllers on Lemans are DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..d7d3e784f093 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4501,6 +4501,8 @@ usb_0: usb@a600000 {
 			snps,dis-u2-entry-quirk;
 
 			usb-role-switch;
+			dma-coherent;
+
 			status = "disabled";
 
 			ports {
@@ -4568,6 +4570,8 @@ usb_1: usb@a800000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			dma-coherent;
+
 			status = "disabled";
 		};
 
@@ -4616,6 +4620,7 @@ usb_2: usb@a400000 {
 			snps,dis-u2-entry-quirk;
 
 			usb-role-switch;
+			dma-coherent;
 
 			status = "disabled";
 

-- 
2.34.1

