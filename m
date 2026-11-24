Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522590;
	b=3wP6sb4twJdaGpgODF+kgxmowMco0Z0uDayKLUoZTCJAGjPpz23gRK4p7NzVRzO+jpS6
	 GkZaFS7zP3frxJzle/9ba/Yw8JXko41DJVz3zGVdYC3spzBNav3c9AsQBVz/nz8sCjXCn
	 pTfNB9oru6fg06wZNRW+5sqmqqCnFJmZh27r4OpQ5pxKqU5re8srJh+fnOQaBfIRI7UoO
	 126G/kLqlVOK/HZk63+bgh430TXu8dzAyCfEmA98J/6cu84dD0Q6JZMQI2RwTm+XWCqU1
	 i3T9rwXfQdJOOKrHSW2cSLRlMWByGAJ0YoTK6wQ72kbFOf1hTHsSqHmrf1C12+AOO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=;
	b=cfYRFpK+J/OnAIlJCS8ZW7ORl6QO8B3n2701zjfYBc74p5sktPU+BwBPxLQqv2hRpnrn
	 n2IulBva4WZbr4kn0XWV22bqRw6P12lFD8krdFeMocwi5G7U9a1YW2eP6+JLiTQ4oFRbj
	 yPWGiP8hHqMfWWKG50GEt2BmJusUR4/S9mP/0pDlfMvNNlVs3QjAUI04r8sbh/TDmggZK
	 1W9iRDZ4T/UoN8o/B5ixYgS4Tk/ogSAOF1czT8pM7M+Py8SQO481LtsTLA8aXHWIngz9w
	 XRNT36OHcz7x9tP2U1QBW+qG2zo6RcAF1hPfXrIl4ElR2t4AVVy02OgzBOmkkOfvmHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b2UARMif;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMiupnBT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8663606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8663606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b2UARMif;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZMiupnBT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAujBB601638
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=; b=b2UARMifHJia2SbY
	SR2Fffq/WX1293Eg0LtfWiMZ/hVw5YZ7RIDDB9FKxHHy4miA7up+IjrD7nVzZUuY
	osoCdQjGp3BtGCG1IIjup/Df0hX8faAZh5ARECl8M5qlfjZnk6EU8bOLIg7r38lD
	eOXTP/xi7uqgHX+vCCEcT/T4iw8vjvyYB4bykO+gRgPIk2ASLL/Zg1f1Ge7fGUBX
	n+nOs9Fj87UDrwbry8/lnjGZddYXbTsqO18B/n5uVSDIXZYDadyEgeDWXbd787mB
	Wa6OXYCm4r+UoRWzOewcSLy09ZcFvkUsP1ZuOYb4fFRjUjqy05/XJ/l6MvNgGnJD
	JBMXTQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky2gs0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 12:16:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so4054608b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 04:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522588; x=1796127388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=;
        b=ZMiupnBT/NjZ+hbIwXq7cL0wW6Mr4IErv76YEunZHTAX+SF4J4uZpGOcecDvKLuzo+
         e9NXOfCaK1FZHfQs124DVo9aVO4esZgSZ1NnKK4WfmimT0mOzcKr5R9O+PF/uSnzkU7I
         ZhVp5ctoXCqx41KKw9JMmBRPodzuC9T8YglldJlY8WD9mJVECSOAj9o3/RH23+9g0RA+
         4KCotLc/x7D1INLsTHyi3oCt7qqZnJExCA+Bwz21GVOv70vLqSyUszYLQNBi5yiEJPeH
         bGOQ4SRTSf7lQF8n2Wrh/O4YBdAZADPbL9VdalxZJlavJP363J5ZS4YxCZi4Ai4151TY
         R8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522588; x=1796127388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOFKsbxpH4KzFXDCaYL69M3Fbp9dtS/WswHdh7QQcJ4=;
        b=uwkBMt/o/aaEWDcMBpx+do1bKMrPh9C6KE0M9ck0UcbKjXB47XbHYu8qSVzI0fwF6y
         khu/0Jaz04IVXMgnWEiJH4g5pk+I9ZT4KXUS7nGuR6gcfZw2yUQUjMvkp9lYZ7CKysgd
         OTiit1NvDj8vfQvHE0TiZ2HjqINIeNVawSZ9XLnjoOVOxhnOkcqxSGcgsfwVphSmbLAC
         7CaJ0Qoy1Ad7TAnHQqgJu0Aempf/d0iN+fXJe1uDvip5xzoORBg9PU2UwgDJqhrzPjHC
         foxLmptW5coIRVmiqSZmqbnlVYx9SzeT9lrWuioD0PWMNiopFXzgc4AKWr5DyoDHsEN2
         g/Cg==
X-Forwarded-Encrypted: i=1; AL+hErEEj8MvcB/AgLw8ARoYVP8R6FlfF/PzLv1+LZRFb2l6OsW3DwS+w+sGJQO+r8tgQSf/yxkflLU/X/WS@vger.kernel.org
X-Gm-Message-State: APuU4Z+ENzqYVxrbV69HBHT3+oQsnPT2M5WFIkQo/GkYjtE/ejuUWOTj
	hffTgwS/yvGEBIKXTP/LTyIl5L5lYUbzw2t8Ytf5XHtoaOOcVp/2ypb+//86L3ovHLqsmQHkKCD
	R5a1PCZDrEqXDCIZ3lT5hcReiJp5TbQEMuhF6c7o/bV/vZghLteOvorJs3YlKOYz+
X-Gm-Gg: AZFdTZfrm903GnREmgV08kANYL3g984ELB9QLj/hn5BvKo/8rjzPo/XT5wi1/8fXPGk
	SUojs3urq9nUzU2kHAglrQyWaivzUt97c00piqiy0QeaiNsORO3IomquqTVIQUy1PznFbjlcPQ0
	eWd3InhQyBzbO/EGyhbjT6/iVBnV3rkrfEZgrdot45yfab/K9W73SAQlZzAm1xLNXgD6bb6IoIh
	clbr4AfURHoQfJ+ts5KGdwEZRHHu8949zf51A+ddGsE3s/7KPqk3g+WJLMTfvoouVodzrx/n4zU
	dusYfa7HGqFpPRmIj1jsTe38q3qUhM4idHnE3CmIdLpnur7LMxEHbK+XbNNOlOM4ZmxFiVVKbRF
	B/49Oh9duEElGFnYXiYIZv7xuSzaghYknQXN032/eXrQ9mBJuzRUGduCcWmvciPvbn4nUR2FdL2
	R4gXRuOxY5
X-Received: by 2002:a05:6a00:b80c:b0:8a0:644a:d1e6 with SMTP id d2e1a72fcca58-8c87bfa20b8mr13052694b3a.28.1795522588265;
        Tue, 24 Nov 2026 04:16:28 -0800 (PST)
X-Received: by 2002:a05:6a00:b80c:b0:8a0:644a:d1e6 with SMTP id d2e1a72fcca58-8c87bfa20b8mr13052667b3a.28.1795522587825;
        Tue, 24 Nov 2026 04:16:27 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm7245572b3a.1.2026.11.24.04.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:16:27 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:45:25 +0530
Subject: [PATCH v2 4/6] soc: qcom: geni-se: Define the QSPI firmware
 protocol
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
Message-Id: <20261124-qspi_qup_upstream-v2-4-cd69894107c8@oss.qualcomm.com>
References: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
In-Reply-To: <20261124-qspi_qup_upstream-v2-0-cd69894107c8@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795522563; l=2240;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=55ZlMjRkdONF+TCCiT2mIr0TCDYDNs9cTd+Da/93QPU=;
 b=v08YvBaHpvji9aixFBPMZtsrOMFNQDH8Osu6qZohJxJgoC6EYZ94wDW0zH9toEdvjXxxfeyP2
 K7UALWXHdfVDAVOFiu17M69dE3J8HpEAiDw3wMsqbZj2q1tY3NpJWjx
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05801d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sUBs2YLvzM1exbN-AwcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: NlFoIXieqW1fKctPgN2_f1lX9Ymg0_g4
X-Proofpoint-ORIG-GUID: NlFoIXieqW1fKctPgN2_f1lX9Ymg0_g4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX27on2YlWrok/
 VBXQB73wwr7jNCYGXwjJxCUqch1zTsk6XMO1i8bj9+dprenZnvg2IP1p8gqLkzMZFpKQol4LnZD
 nyjsZmo7BJXekuuWk1wxZmShe49/roY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX+JdHDWPTQldT
 1YSe1rLW3BpY+uuAjJSkU3wYzZSjf00/4tRDpmVZoDAnKEUIsQhgve7vOC+lMarPAt2SqVob1vN
 ZsRdJ0RzdhOOasj1lLdBSWms24WLIXnaIYrzSwJfVXfTuJz82KKB17cj7MF8+xBSPYzrvXjqtLl
 TuFzTGCRg/5Qb+QW+kv1yB13Ac+sU0x3n/3NuCu3OvCm+TZ7LRbACRwZyudmDCtoUTlEthvNIHy
 7ThCu1SH5hDwnEnQnUlwtWtPNz6iW3SKyIWPAoOx0icw536foGSMEdgYN/tlbvSA4A5RscZluca
 ePI355u/yEMPJOO50sFuMEaBaqThp7C78/73bXKxJeN5cZnGOwES7N884fb5oCzDTOkdg4c1KdY
 S07sRGulcekJGIL6eBkaGWhJJwYaPnYnJ7BtZTd6XxPgvFn9HKntUFRpPd5FqgReq7YMQRn/EgR
 4WOEAp9nWI1ofdTI/VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
Add GENI_SE_QSPI with this value so the GENI SPI driver can request
QSPI firmware and validate the protocol read from GENI_FW_REVISION_RO.
The firmware loader also matches this value against the firmware
header's serial_protocol field.

Extend the protocol-name table with a QSPI entry at index 9. Use
designated initializers for all entries and reject unassigned protocol
IDs before looking up firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 12 ++++++++++--
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index ee519108c107..270e7c44425b 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -126,7 +126,15 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+static const char * const protocol_name[] = {
+	[GENI_SE_NONE] = "None",
+	[GENI_SE_SPI] = "SPI",
+	[GENI_SE_UART] = "UART",
+	[GENI_SE_I2C] = "I2C",
+	[GENI_SE_I3C] = "I3C",
+	[GENI_SE_SPI_SLAVE] = "SPI SLAVE",
+	[GENI_SE_QSPI] = "QSPI",
+};
 
 /**
  * struct se_fw_hdr - Serial Engine firmware configuration header
@@ -1581,7 +1589,7 @@ int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protoco
 	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
 	int ret;
 
-	if (protocol >= ARRAY_SIZE(protocol_name)) {
+	if (protocol >= ARRAY_SIZE(protocol_name) || !protocol_name[protocol]) {
 		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
 		return -EINVAL;
 	}
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index f77c3a47c3d0..e2b93afba4c9 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -37,6 +37,7 @@ enum geni_se_protocol_type {
 	GENI_SE_I2C,
 	GENI_SE_I3C,
 	GENI_SE_SPI_SLAVE,
+	GENI_SE_QSPI = 9,
 	GENI_SE_INVALID_PROTO = 255,
 };
 

-- 
2.34.1

