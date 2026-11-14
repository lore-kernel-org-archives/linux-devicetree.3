Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655858;
	b=UFB1K2VRHKHRkqHnG9nvFERyTufO/hBlRqYvweCDCYX0eqdLjgOi9USg6yUHLIbqKTJ8
	 NWVco1ykbWEpVmIChn/+UjJTCjRyPvKKQEhbspx+RUjS7QvPqbdCgNRFeetRCqkNP0M9l
	 NR3nu/lz+VrWICoEDcHK+hZU/Tbc9FsyS/CpYAN08IER7hIEB/ECbU7E3EjKlv0c9Pibz
	 BZkpiOGNpyk4RPAlRrzyzXBuSWykmPEhW6zuYAO6jxJvPukzfXsXmKtl7yBMnxtUo+bCp
	 JvF6/S4q3Ue8O5VFv5EXr5Hc1LPNNFag4xctcs/23AlR281zjgZ7lbyDgVrYzXJZh/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
	b=xDgoQqJJ7EIswJaWtxm46FDBAf+YpBV6sRnYTqNh4pfPF2LoCfwHGyt6OSqPiuZ6dY7Y
	 xAwy0Tm5a163gQVZOnGqjyY01HopjmP4ackZIv3uatoAvzErCV/dVozUEMbukd3FeRUu2
	 3Yo1qZygXlm2SyokXCFOyRhqYPiCYZRc/3GU7A/PZdUeh4pa+89o9obIS2VpQrOcgkUry
	 K2qIiG+Pm3OkEm7gyVB546U3NAbZAJ4D5sMPmpzP/8l7+Avj8WDA8oiJCXMIVrZLf1PVc
	 Fq/yJrynF6x8mM0LPqn8coC3ExsULxlORXOHxHvhPlR30i3IsaPCFuBwliPtlycHfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA9B606A327
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA9B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wIek3164566
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=; b=is+jw5w3FuItCwi6
	PB5nilGPbRX9RDS19eIHfUTmWjeWwtOiuzsjtMtiBzUhXYsXu0f6J9Gx5ufxZXca
	vRHBOCOydbv/BzFG1eo5U0cTLQsseAqR4CqZmJx7mkF39EYa60Yyq6bfKmWzNufl
	StTglC2ubE12WZDs3K7UGE7ahs6LhTygH7/ADGtZqe3rBfGXAzMCXP5VcWpO0Sev
	/z7b7aKFoTa/qysPoj5dyhOY7RKa+zBixU74Xfol2R4J0yZiEkbtlqUI3qjKnDpo
	fA1zU6JgKDwa59vbUE/slA0+7RslM6LNNQeV984stOJvpXWQ4zC0U4FFlRKRcdaZ
	+Ws2kA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkw8kj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f184f3334so38333436d6.3
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655856; x=1795260656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=Zo0tqJdWroERepjzwpX0jDTKyvivB88pDMMdsw8Z/sR230mLN3XUHdefHLUo1pgHkV
         DPPgPsGysGhdyeTwUnpJgQUBp6Na2Sf89D1ks8y7g398828EqrmOzeuOzxQR6Iu/nleO
         pVFU/UHq40/6UHMyhE5DeFifBfvKGF0wqQ47/OYqPb79vAm/VUM9pOSbu3NwL9yhZrmo
         I9uJv+MCgxU7FYGL+5/lKfQcVO15iMeoQIbtKGM1AaKU32fCQ/4VbmvNOYWYoJvcRjjW
         w86V23gFf5jcYB/f/1tePgJQTF9qXLpcqFCoyQmTcDIUGL7JpXhkqNwJuMx1A5AjJ+a9
         aKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655856; x=1795260656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=vUO1GRAzcudftJeFVeb8Dikdbq7xL0Vh+5yK3u4A7sAPYNGKxhyZnGdsvN00CWopAV
         3o8wr8Cw4qPYYsGSawSKAIWUFKDfu0ilBR/0+YP0ZreeGg6d5uU2Vqu3ju7Q9m5w4X54
         yvQRZ9hqCTmZl8V4ePO3zfqWxIlxXOzQqm1a/Pg4iCWuNXhafhVweDM8mFYjSFeFrIq6
         pUElLYBpTDmBCu6LoF1uPJianmrv36kNCdDLv7+3Bq1CMNmiY1QV2NrcHDalrCa8+Pmv
         zmCdrPQssmpkc1QQSNPnr78hLc7xI6Rw+QiVuhS8xJZZhm0dMvHgYFMRW9YzGAlaar9e
         aEeA==
X-Forwarded-Encrypted: i=1; AL+hErGFd9yG9Al7pa2o1+2n5A2z10C+gZlZNmlXswlTK0vOZeJDfJf7ZvIZ9yU6XWmAlMY+NQ4KHWk1vmv4@vger.kernel.org
X-Gm-Message-State: APuU4Z8U7Wmd1YtvpZhgFIUbBIiySFJCe+9jCFpQrj9gRoIraK+b5jeH
	Yy5IfEmQ9anNsWJ/Mdv0JNbwtrOSCEh/d8g4zhCUjGfyjwwx4SNUNyI1dT8dMioxDso/D+mme/c
	zwEgq579piPOyKju0wZxND7Uqj43/Iyzq4x/fC71jdO80gV5jAcohRwcXPyIvQ8rc
X-Gm-Gg: AYBFou2FY7niBKH2LR6LjzXwM/tsnZyv8AcbFV63Awd4OjmLJWEwcDHLAQ1icN3NTf7
	2fhTQCL5tyIYSvfIAfM6AxoVFTYl8FLi4n6/Myzt0TtiKmDvTaFf0EKTqQC+f87gBuez5635lEa
	0KIQVKPJw98ieNVQbkZeXln9PgMgXK47W6711vkFjUhNIkZmKP76OY/SMUA7HVvntORi8lw2Kzx
	bXmNKEbEiJZdWP31JvDbDN12jvSBRZryDCImYHDrl2F/WL1jflRY1EDLf1GAXn/TNA86+OhnB61
	fcxwqhjZ0O0rpR4A4l7F25K2/9mh580/7YtnuAhDB2+K0fQ4Ins1iVSeK8KrhbHpAJ6QmTmMpT+
	chjAKwR50mShcFQ5KowW/OkuLyO0G3Rkrzlag1fH9xTBOFITSLuPajYpBl31S/xVhG0Gvex2My8
	q5as0sjBtmoGUmsXeYOPepMa9lZmqBWGDhvcwnPuT7
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645506d6.21.1794655856197;
        Sat, 14 Nov 2026 03:30:56 -0800 (PST)
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645216d6.21.1794655855778;
        Sat, 14 Nov 2026 03:30:55 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:53 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:25 +0800
Subject: [PATCH v7 08/23] media: qcom: camss: Add PM clock definitions for
 SM8750
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-8-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1035;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=aRxMrdDtYyY97/huckpcHrUdtu8c4K3ZC3GA/RWZCDs=;
 b=vWhSMHcARnVI0vXB2VQvgOzisoN8ZRFT+BwfFUA3Ajfs/RhNvQmm+8FhnwOhPEPYq3FPs84El
 /6E37tDjOSZAaqDqFh+2KI8ArW+N1uCOjbs6QglI38hhbVXTFl71AJs
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX0UEQF1737qjW
 REi9Yv9eI1xWgbtqqLGNxwN9uYgbJ4KiSzgAdGDeS46lucTh7Q2N25sessCegGF5dRZpcwAeqNa
 1zQtl2afumsJtPq0Iswzyzto27eUJbrScXkFulwAjpsZHTujZ5dXvpBxYpWj/JUac0iNy16gLTq
 qj5ezYGWMWH+JdoD69CWcvoQlzAoqz6ZpRKTTLdI3BaiVCNjsXGJvTcx13KnNkUmHe3ze7AIH4Z
 Y1YOKEOkBJbUtmFLnVIr1JtRLX001lpN+N+ONvpoA27En4bbVqKFXvQyjqdvCRE5CtRrCUHBdmn
 7w9f4UWfSuLo1hkJ715jhxq1yH7S/h5ay9b4pFeKH3jOGuisipnifIVbj6dfanoSXcoUwZluFxW
 miEyRjnLQmqB7+8X3j8A7YF8uHu+op8p3YIDRmK1u1/cB6OK/RWrrY4dcQ7kVwV/HgE+59cgpxW
 pY58YECcjTHxKLUy9dQ==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af84671 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=MfOgH6a12QNS3LiSQs8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: XBAv68IRzANmsfIso2hXV1jskzAWyjQH
X-Proofpoint-ORIG-GUID: XBAv68IRzANmsfIso2hXV1jskzAWyjQH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXxEoLkb/HBCUj
 AjSK2Do1DtlLIbIZj9DUI+IP7RlyJsGvEXZ5pGf5WLffUe8nuYEGIOIB9eRc5cMaGOebteFmywW
 d8oL3TfAFVG9uhccrFb55xoo/Fs2Qo4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add cpas_fast_ahb, cpas_ahb and gcc_axi_hf to the PM clock list for
SM8750. The CAMSS core enables them through the shared PM clock helper
when the device is probed.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3f9dd3a2ec088fa87a9ea90d25c906d14b9a1896..196eebc2d7d118040319bcf967b91c4ca98a4833 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6043,6 +6043,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_sm8750,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 	.csiphy_num = 6,

-- 
2.34.1

