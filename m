Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977341;
	b=D4jxjco66mcSj9hZE9nisF+kCH5ts79vtDTXlHTHXKJCkpY1m5NjaYrMvoy7Ox2/yMqN
	 B+kDouEwzRmvq0qk+//AoLf+ACYmHWFkF7W/SdPZFuSONK0YAQ0vyZcQnoi+rDO3rRaDl
	 XOl+NpPp4PjSMLMXm+eJdxHFqsveGMQo9WZlK/5W/TUTCmn8iDqORxbXAl/wqDXQZxuvM
	 nxNqgepW1b+OfPv5PUQGtLJ8fHOQ1oeIFnXNGz4Q/fjcjySJJeiTNKj2WHkTvZKZafGLM
	 jmqq7NVF8Jew2XOFxx3ef3N4VP8UJZZDIFmxT6LyBB5bidzZGGA3LaHbmrFEp4ySmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
	b=ZRK7vJdA+7yfBrdhg+FHA/2ZEj6IqT8GdcSh2KTQeSBlJS7MoaiDY9LIhm0C+RatFrVv
	 uz4Un7KYzjCrJtnMg4ihPx/J3mN5uleauFXXq9nkwKN3ovtM5socsttjyqBDiYcsSuO0z
	 iZbWmKCXE5/MhpjAa4FHcrYPvKZQs0wwo5fnxZtv2CzLz5r3/kxvNlrlbl75G6KIgkfht
	 CTxJy38bde+X3q3M7G/2VC+ZKVAIKSUs8y3kpqzT+Rh69k2XdAw7w2rN+JDJtWUzkh4OW
	 nf49LFhL08oXCa45C0yePOQ6YbPmhdNKLhF9gfOYDBiWnAlkHX01u1sBcEzopjf2KJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD9606D83B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 15:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BD9606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ooiae5c8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvIYChHZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exr7T3722869
	for <devicetree@vger.kernel.org>; Fri, 6 Nov 2026 15:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=; b=Ooiae5c8LeL790vg
	3HfGqpQUSGhnFjRhtcuabcQooUZ2p2X67qIfBqVZ6cJSiDsr89ZsiEPfS16DrFSC
	jmGDzOugKZM1tmiZzb0zZBQlBfyTzTC4DY38Wz41e8+IbgNtHmonNQnFmZWUUy2q
	Wx/qoKO8cVvXowyRBYaLrDGLqv1Fw7WJ8xCMDfm7r32yupZuEkTxJiG6QFDjYUXL
	B7c6U7v9i2dksJOHuTXFC4jWgnHtNwLsf644DC4Rsf2hdisD5Ps6jnfD+b0BsOSO
	raMctBdtu7Z6JnMqLTre3pUEZiQ+43kNLuZ/FKMa/TV+s3xov3PSIC/f9eoeZzrL
	6pHzig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k7ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 15:02:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso787727a91.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 07:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977338; x=1794582138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=fvIYChHZ/VHb44k1posJawhbEGdasBVHP6OuucAG55bMZyX5yLzA4Dd8JcOMo0iIA1
         mLzEd6PHs74xzqhX7aOdUvLf9jHgKSXJU3K86l8Bm37SBIHl35O1tWJ/dO3uWb2+A6FN
         zTov97mqiwmS+8k8D3FahTDF3S0E6/XWQfLBCeOl+t8dWWb3vlpSuukeBi93x/UaKGDh
         iaCc4+4RRNP5dedWVLEl+wUHdQ/xyrY4B1+0R8ZnB1KWBrW8m26W14WCfVBQhb82FVMF
         1CUpzDkISLKoJ5XzgkQEH+jcXHwnOaChgWP2vnbxnLZ4J/4bkW8e06hLfx3Z5LKCekgd
         3BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977338; x=1794582138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yx8cGy6GRV/5KE7+yO4+nlU2i7SRus2h+xb24HPkgYE=;
        b=HMJL8ZsJzwXTFoZliyBKNNXEPN9aXpLb+Rs7GVlXXXDAVgndJ3tS40PLvfx7OyHr93
         2aH562AuiVJzrJf+QdRyloZgGk9kRWbxDsJdLvlm96KVXsLLpOw2fJAD/CI5Qz5vsUkO
         Sp+WyFzjkVT/j1MpO/LYqnJ3AD+7X+6L/TGrpL6g86nrpPHBzg2ClZShJ8GbL6zk9hSB
         1sr+4IjL96x7dGr1axfa7WO2O14zXf5KL+b8Ir4KFD4sHivd55/ZGTZ5D1D2OdohWrgL
         GiVRNkiVQ2N8jLSn4FWdkZljaA9ci2r3F/E8I5OyEiNjdGCx0TRUE/DV5H4xA8dOxqG1
         cV+A==
X-Forwarded-Encrypted: i=1; AL+hErGbETc1Sra5bcDubxVrycUmM99Yohhp06STJGWAR0jbnA9kxh6kazCVaCCArSLnT/wpcnIJkw/W4sYi@vger.kernel.org
X-Gm-Message-State: APuU4Z9vZoPwZw+ZNlwCnf7gyfYLqN0/cmR7VvwNs6CKIjv2MeqitfCR
	Nphub1btw38CBbn8DTxk5IUeHWNX2rMJmIxT+95B3u0QH211S1faJV/w29YngmC5/G+BBg+PHhW
	yys8P3yfegQhbn6lOiP3krdZVqt8yQLvGIemC6Sop+zRGbkDAD/UL5rwhg0uh3dG4
X-Gm-Gg: AYBFou3hpd8IgGsrjDstErPGCiFvTB76zzjBC4voO+5JJRMxUcqvoehIR4g/9P2GTM6
	2U1Wpdit6K1wHmcLw7A/kgSi6hFnAVFVFKaJDqzf6nVTmOSB178n71KN5aDSUnhg98vL4nHdPf3
	8yd3JvPFYRzSw67BCpXGdruFPbCVMx9jxfu9aZl6w0NTm426QelsIUsPt+57rhu9HrynCrhJVN1
	ts6mSkMBt4o0gMhvSZ9QpkUOuoh8lEeLgxWqOOAR6uO0Q3mietecajquX/blkqbXASRf54Th695
	S69pnBj0YTxNgd5tk8QB4HeJl4zLcX/UOshHeuRwveaMDYeOliBxp/W0duR/9/gHV81zw9wQ9JP
	SD1K5+NxzruKeW7zN1bzDMeOwjXIBQ3SqwV3zmjk7W6mWOYQhnQan9vHqbi5tJfd2bsgwzsf9qb
	n1RLVHaiHV
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884510a91.10.1793977338251;
        Fri, 06 Nov 2026 07:02:18 -0800 (PST)
X-Received: by 2002:a17:90b:2552:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3b0db6a8e74mr2884448a91.10.1793977337611;
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:17 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:22 +0530
Subject: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
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
Message-Id: <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=1942;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=ojWeR4VoxNLp6SSgIqv2hrWvgVO2h3SZMPicVyzBSmg=;
 b=tXEQEoZ/2GxkCiFk/2JvJdGrCiIpMiZY7dqXyKOv0bjxZA4pHhyNLUF7zxzajclaa1/wm6dN1
 Oo68+1Np2XfCQpX9o6a5Sa31CNZVIfN+QTegPB27oFb8jKr8OUrnAw1
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: ne7b50JEbioG200c6gFNEFfTpqQMwset
X-Proofpoint-GUID: ne7b50JEbioG200c6gFNEFfTpqQMwset
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX3TraIhJxzE6g
 ZzsABybuHfatysfbw2DmbnysGi5/FdyC9O3VlP8f2JbJD7O0Qm0EkExoX5Cx53NuCk10siRlLFw
 QdFQiBWnKx/yd31qCIWAdpKCGFK+HNI=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aedebfb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0Zn3HNfoxhtf-8mV_PwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX6cFApKG2Wqn7
 P8CTnwS3j1C+48LpoB7GjpVYH/M/b/Tu7xikVopnpNEQx1udyg3mFoIG7GY+7o4XxpOsu3kNI2V
 mM/JXIYw3Pn6yWV0RP5fOfmZrUDltcBvXT0GfS4EwTnkqnaI4R+JE2MkVkiL5d6lJMWw25jCilh
 S4qQfvOtBc5RBqA0jVLPl1Rp+BFfPecAv7ISq7VITGKaAAqUbvkLYvLMryZ5+XQUEcDFsgdddBX
 0QhzarYGn5Fa08b/rnPJFg4XZzVlg+Ss4F5Sj8Gdrd0zUHqag6GGktmGE+aKCjSmTJssRLe6qSl
 xdag9v+1xb8iXFLvZ2tDDDUr0qYnAQY+0twu2LmNB5pFthXonfMfEcRPcwDylHw+x7TzYC5jnc1
 lOQKcCgFX2ZGuHs59uWFxuXkJV1SOh5r8dEaBmitWfItCrnO5dmFPFrDoBtc8XVysvjOYqb5R1O
 yE5H07l9lziNIRYlKrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add GENI_SE_QSPI with firmware protocol ID 9. The GENI SPI driver uses
this value to request QSPI firmware and validate the protocol running
on a serial engine.

Extend the firmware loader's protocol-name table to accept QSPI.
Reject unused protocol IDs in the sparse table before looking up
firmware.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 7 +++++--
 include/linux/soc/qcom/geni-se.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..396f3d81d292 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -122,7 +122,10 @@ struct geni_se_desc {
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
 						"qup-memory"};
 
-static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
+static const char * const protocol_name[] = {
+	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
+	[GENI_SE_QSPI] = "QSPI",
+};
 
 /**
  * struct se_fw_hdr - Serial Engine firmware configuration header
@@ -1557,7 +1560,7 @@ int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protoco
 	enum geni_se_xfer_mode mode = GENI_SE_FIFO;
 	int ret;
 
-	if (protocol >= ARRAY_SIZE(protocol_name)) {
+	if (protocol >= ARRAY_SIZE(protocol_name) || !protocol_name[protocol]) {
 		dev_err(se->dev, "Invalid geni-se protocol: %d", protocol);
 		return -EINVAL;
 	}
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 29a53bbc0dd4..e96266631ae1 100644
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

