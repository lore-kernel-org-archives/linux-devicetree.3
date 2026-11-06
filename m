Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977329;
	b=i63DGA8juWCuvSI7SrzpRUCsC7f48g2QvKTfcRffG4yEu414oX/hAXyou5tlC6b6a4QC
	 EOJsZe/QOgaLPeqGS/1ZM7RRl5WANppfOmdLeaIvPrhpqR+SyIOZTm0DtfFLQWsURhkF5
	 /YdyLSI9APymyPFJOhGqUUUbMQcK6nBwOqpI8pX9bjzGvqBqYrPVQdGqcek1RWrE6aLP0
	 CeXA9CD7gdS9miYaEH4UDulNoozL9B5SbVTfnomlyl1aWL2ojQrmh421lGSnL1OkF+sSe
	 iLSxfDYGSvLCIBZU2hwcNPObo5+h0Se33ZKxUkYF6p9qLnMLRjZXUT2vFeLZ/Rq/ZiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
	b=4fjPcR72PVxaiBtttxyw00rGPVEYgWWjVyE5+kZq6qQ5Nu390FMTIGciOZR+HBN2zSDq
	 K6E8EMW4v2c0Yt6Pd80Mq7YFSb0XlpMdSAz7kVvgI1tW9OzX7CR/qZoYlsWrJKB1N5lmW
	 Ae+wtsVW4ikVKftJhOZzwtHdMngEcwfrJrQ63BHd6z5t0MqMarkXAyHM6mpoTVrb/0lSU
	 ojOdLZRF6xbW1aDyudUvAvsZMC0x0MhfajyfmFBDSk9lJutvyS/ZwbwI+xBCuhDlWPiic
	 2o9LAXWeU243zKvYW5YBPzTNTYcOLCQH5C2WoRf6ky/V8OMXjg0I3j2NtJGNub9OFAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37C606A33A
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C37C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F03L62671673
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 15:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=; b=SDZaldbOmYwG9NEj
	hM8bmVDNFqSSe4M/Qe0rvTogB1uxI7CoLNtl0nHoSNhO2/lXxgR+NS0kohM4SeP8
	ZTTyMogd29tIx+VsK0Y1peZr5KeQ6zAeYxWBbQAtW03cSaGVqqyvmRGZry/Zsu14
	JD3u0XniyklpslbdRRBws8fC8HN9nqxSSklCOp3yYpDmGN4slK2p2vbVQtro6Y0f
	FjvWudy3MDjLg3a+tg8qpvx7L3H1LeauMZwclexb0vmVD1/IxAJ86XX+lGqz2rFT
	NwHX5qwFvmeb2jGM+xUNldas+5nAfCDNtusDBYFKxVxxV8yVeKO6pxMHcBuTaFcV
	ocpQuw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcb8th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 15:02:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso742637a91.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977327; x=1794582127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=a29Yh8cU5DH5boyQ5JnEXfDmNLDEwuoLwWF7eZfcVoNKtcwFhIui1WhgUCp0pY/BY6
         QjoMBBTwvUa/Q6u8p+MxNAG903gsnOKapgxhwvV7zjD/HmD43n3CNmkmUgYt2nsPtc55
         /EIqORXvyUOWyhDfsCR1KSGFcrCfUca6mVxM026oy94A8gNZ1x07omgqwzmnS+zsNtxU
         GfwJ9V9HZzCl5AREfhFaIlSFZGRUXT68fVhYNFd51N3FW0ZX3jT+XZ+8N6ua49t0W+9b
         ZLYtW8PmjTSQUjypRFyEhoOlbWU0emeQmobKbbvwPaZDT91Dy2ggIjfTPMsHJ49wLrgd
         L3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977327; x=1794582127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=GvxFUJcY7SmuLp0fkKrQP4EQiAPijnaLijU25V7Zei29CbVJtbC384e35TxzWcTAoR
         agbiXq1u1g1DgBUQ5a0QJWC4ZFqLQpgBlTmKj0iucZPKIV7AiP0tF9zzTSEijZE5Aaja
         +WD6+YYXvAdOI3yF7lA++8CtCqMwfSw+DzS5W2coj26cPMI/g1E8ge6NzGAzXpQeDw31
         Sl+s0CyDHBkd7aY4UhNNW44vfvvI9oB2qVuVHJtVhNa7WWBVMeCRbkxFtrtex2Ptt3gg
         LVP76GZkoOSgl6pE8cGqDXRxBR9vrHSacOkxb3yveNRmo84mHYeTXMH22ofZ0+66bY8W
         ulhw==
X-Forwarded-Encrypted: i=1; AL+hErG1bUSRNLf0xB/v0xz+fflpbMhAB+ijZaf1azW4UO3K2c139B4CR0DUSGudiz8JMls31Z0SQnnajuXa@vger.kernel.org
X-Gm-Message-State: APuU4Z8RORlUOlhZj+asQnPESFpAxlsNrLAVwaeDB/WARhbb72budWCI
	En23zVQHyGQ4y/Ggwc8WK3UirFuOZfcRc0lAxGdqBSc/2FmXI/dzGOhWTUFAIt/+OkBxEGBLsAP
	TIaUPE4PzwWA0wVpjj6JeYdSHCPKLOLp/BfyoSLr6T2ysrNJmqcMOsf9eaWBuxfpH
X-Gm-Gg: AYBFou0OlHklT1a0xzpWd4A/NhQS62RmTdYd5EFckB6LD5HMnR9bWdIDZ7JFNY2V2xc
	NjGKuUwZaic1WyTYJ1E6GeDbwWItrcpcX07PnwcQryPIABEIZca43hfkuafuTcpqlcdKPBIndR1
	prcqZXhHG5HZI7YUhFx9b6QDGDi/ONNhhHHTAxy+R1+8VMSvtIGYUaAzNvwkLgOnsxW9BeKPnQM
	+dcAoH/AtEkySXHaXpR6UxSGG31wpBWOgc9/SaV7j2WcJ4PDYCs6cs/szxwl5+KtkzDiNxmnBE8
	IxyoVCcvRqAyv0pkcj6vHWiC9cpf8Y12pYYIJ8UyHulWZKveLHW/srhCKMuQjcXTyvJxXHuun/3
	XECKu68cFlx5VzKWlwTfNJLrA2Fj94qNkuFjOBn6eio3m1pOZF/39A+3zpoDMLdgF0Inv4nyXj4
	0aMXTfuz7b
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344796a91.33.1793977327101;
        Fri, 06 Nov 2026 07:02:07 -0800 (PST)
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344749a91.33.1793977326247;
        Fri, 06 Nov 2026 07:02:06 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:05 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:20 +0530
Subject: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=856;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=iJecahOznZMfSn1ZECEomSzUGcetmfIMkxUzE7I2o4s=;
 b=B5SY3JrN4UIDmzeORd0lh9riEKx7+MDEpI/r2Yb04WH6sz03eNKv/Py/s1LJ3p9cSHMUByaFT
 yK4pOmm/NlPAouJHsvCk8M/r3gq3qJbwpGP+ClC2qE9librYyE2HFba
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: zEG8TtdQe42fEZR7uORXd36-MfdZEd1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX6xSlb0ErYo53
 gP+uhIh8twRdqDbiVyvXdG0L7Vg6iUAjJTJBFt96ZyflFa2h6SZbS6mRGiDUOXZEORqKbISE37x
 dtqB72uiLV3llqdLQIM7BN1ktmcgheOKu9NlwgeyxyrCJ0igBr1MBFbp46fVnS6Fqrng2rQd/4j
 //J/07bEtFLUodUx8WO8zJz67mf02/ibM4SO3bTaOQFzGxmFOz+zQElb4MpaQmzGekHmww7p4uS
 rEaUZMZwbx/yq2WN+YVIeQiT4k4x8ETjHLsHLjP8XWW7U8XIXsMAn7ncf4z2g2n4lP/Slh1ZzM0
 XYsHT1qnb4+2pHsGg9kTWwhlGwmbf3KwTR/gtrG3FBdkr54aArgusOM+c2q+jDYKTAcwTY+kKE2
 xT5DtVFSUI6Bic5wSHZZLjLEliUFDLxh/hQI3LBL4iXo+5AmC6mWGQGRtKuBKS9uKMa3PDtYccK
 VTdbvs+v+l1NGCkJzYw==
X-Proofpoint-GUID: zEG8TtdQe42fEZR7uORXd36-MfdZEd1E
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedebf0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=htPuCn9dtfDBuPHNxMEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX3lMhQ++aqBJA
 H7xbQyvUoidJsWYAVfaAHhONxqvl/OaFJ49GvhoyU06JsdCmm6QaOcov9qmoZJZQHUm9PQ/Kjce
 WEV7zoEQq5Mrc+wQyBURGeL40lzyHOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
specifiers. Its value, 9, matches the GENI serial engine firmware
protocol ID for QSPI.

This lets a QSPI controller reference its TX and RX GPI DMA channels
through the dmas property, using the existing channel specifier format.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..68fc1414af55 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		9
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

