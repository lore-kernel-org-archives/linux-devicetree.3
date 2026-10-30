Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341308;
	b=fD9CSDw4cdDqmrdefHW660W60VlcaO5k2uZ1YAuH4hVla9D5uuduvUoT5uuf6ywK6n6S
	 XDrQday7zlc6sNj0DzXdC4ygdEY+RUB9Z5Pvajn8GuvrpYblhNAAX5rjtFEZUMlAv+WxU
	 9WWYwiMw1XQIu6HWvsGJMQ5ksYoLuYazP0RDZnwn5qDDF4PeZaZA72uobO4LwvzmYtb1Y
	 LAH+x9FTfZcNSN+PEEgv9PGPu8SOsMl84Hpo3g5PhEI6Q92Hw1OiVnc1QcDvmRilRjqhk
	 YCNMQ5ZPrzGLj0G4dxTF3QFcp/mg0ECitvbrTzsOGYb5UP3w+oplgh6wDF7uMvdS+Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
	b=cRu5jpwiIrg2edX15tcJ0nyU9KZB34G7rBrDcsUFGzqwIQA9crSQOYG1J8zWvhN28Ydc
	 qWAb1FI9W6Fzv9c1W5M60g7+JlqWLZa2aoBgCIokiYMBty9PcdNNf7D08KR2jCjCfVPiW
	 So0bWdn/k92fLW0wJH2W2J9izjnPzb3r0YNI4UqYRz2V0CPD6Q6sgH3jWHJe05qKysoM5
	 5YOZIqBQHpiWESugcLhBL7rI4nGu2BOYSl/nxXOmkMxoKDZEq0MiWQxDG9gcYYt26mx+F
	 V13Z34zuaI0KiyJSWOGQ8ykbrChuZIq+DOL+9G9kNxCb52cQ2CrPufgyYR/rZZoJ7gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W2NoFq08;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ib+kh/pF";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CEA606A329
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CEA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W2NoFq08;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+kh/pF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5Fctm3346041
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=; b=W2NoFq08rtxUAvsN
	5I70HKm/x8rBFeUgUoO6R5JtceBmk3TfRYbXgXlL7SNHqrUPfWEyBA+ObvtTBXTI
	mqOYae3KVpPmxd7UpWts/qlpC4ptQIsiRf6AdOwKGXmewnu+cyOFWacu1alLPcTe
	VDLKbUopda99U3hoLHpY7kRMkHxXPhtwlgCdW9+MaKg9BjaKbY6cl/jscf4lX82z
	yvc4DfjTkhh0lqHVj5B6f2nT+C9FvOTGfp/8C+D/nDHzwfz0Q/tFEbRcYr0yiA3E
	M1wrBiy685yF1Z1IfTdrCkqmnicEmFlFzhV5pEKo7l9tRNoLTkycNWGQFYtskitJ
	Hp4cKw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme751g10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:21:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a065d0e9deso441632b3a.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341306; x=1793946106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
        b=ib+kh/pF1YiniP/tueCLj0C3+ZKPmbmiQvv1R7dbTFrvGea9EZgwwuXS+3h7NJZKbC
         YM6S5Q2S5iQWJwL9a8RKyzxrT/CMTjC5L/zY/xrj1Ki7DkEACEMu8Okznxlk6CGenNyh
         Jk7HVNJ87iSlTk2QICllzgIsHqWhqD77eh6Geh0VYDFzEaSbbr9Cxxb/fyj+pOwoTzJt
         H5JUXwYTHRvAkXvWaamAhsZQCrEkGIMk9NuqlFCa6xIPJWbrX3fbOpxSveeztUd1wRbj
         sAtZy0RQtxDELMv0ym1s777prT2kj9stG7yVzDoG+y1L2dnL/M2T6piVdVVnJq9SAfON
         gvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341306; x=1793946106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixcBoe3mK4tgsAsIGtJ1+xC1HHMtbJXTczrr0LfU9Aw=;
        b=qQQkS9qJhTLrzynnQV6robpcFco+IY2MYnMP0Wbwo1bN3MazNEJMW37i+5WF7Atnjq
         VMIkg4ONu9WwldZSrwaKms2n/i1XYDrxtmYahi/zm4rQx6aMEbTNfZb84VgRfx94/8yE
         ChfPMf3pGNM7KZ01xBYRyN5RbghQoW5arcMPUwcaonCHESPONp9AahduHemB/KiZMObI
         82nVUr9X3W2ZILE1HC9v+hF7Xs1lkgQ/AQ2hC8OltHXSp6FUTThLC/La34dqtBP4XVrC
         IXQlhFwU/6Kc8VkBKgLrWDm2R4TdSTsfNccLGmba1y47eUJ0+8DqbL1daDjFHaUrtU/Z
         tQ1w==
X-Forwarded-Encrypted: i=1; AKwUvBy9NBbDgYukH+K2VtYWB4mLEWj0ziwDEDTYVIdNZ3dst7X7u4q22NuFSauDQjd50JwWYD9HmX4ScRE3@vger.kernel.org
X-Gm-Message-State: AFq9FYIsmti2kjl5yzVd+S7HgKHMDsHY2Web2KmXr67eCU7Ttvr0xfL5
	l3U3m6fGIEl6zGCD7blRp2SbKQOorL8M99FiPvtGE267nWfsVCC5wbtKv6i6xQxnf5WALhg5VqL
	5P28WFxZDCU+/Kph2RIb8HTNksMaIKzNtC1ejW9H4saTMjw1YM+sJ9vEfxK2aHmZm
X-Gm-Gg: AYBFou3eXRBnN8xVTQz1hPqpJLJC7k2bRv0okZSg4aaSH8NnPu0m2q6VQVIfFuN+v56
	UBYn0QZvsz2631gYloTXN1oCTRI0y9dWGjoc06Nls5MuTV2x9bViZpv7UK+ZKSa/34P6Vl0r5HY
	H9Kk4Ih4YacM9LqUhwYclMOfzEM4SQI/JfIplpKvU2MbD6L0HOjt1UtQ8lxV9y/0a0cMnMfjDxq
	Hfsml4wHgkkrpCLws6pAD9b8zaWo9DWT418h4czdih0bbogWkVUVYesZM+SEEZOZsHHqU5sFTY0
	2DXhv1rDvfUSouRwraNxZEh7ghZNYRYr2+4gNQNwjCKCo8otOsHZzzmGz6lpuYpAsoKX2+cn5gm
	m6yIrjz/ujkWT12njHXfiIcpBMYjeUmETFSfElPVGi4K+JSlk3jjNsSM/n3ZnI0jhEV4=
X-Received: by 2002:a05:6a00:3393:b0:8a0:6ff0:d29d with SMTP id d2e1a72fcca58-8a832a94a9fmr3120793b3a.36.1793341306252;
        Thu, 29 Oct 2026 23:21:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:3393:b0:8a0:6ff0:d29d with SMTP id d2e1a72fcca58-8a832a94a9fmr3120778b3a.36.1793341305803;
        Thu, 29 Oct 2026 23:21:45 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ef08b936sm351163b3a.13.2026.10.29.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:21:45 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:50:55 +0530
Subject: [PATCH v3 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
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
Message-Id: <20261030-pm8010_i2c_support-v3-7-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341260; l=4324;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=iOss1N4oaDpxnlCURLVb53pk4cSN1jSfF2112q90j4o=;
 b=4J8fIBakoKfjwuQ2kZOD5bffzCS2igeg2i4LUGF+Zk6GGL/8N26O+9Sz42Pvw/X4WRD2osDuE
 BQj4oNauGlUAIaNTGOxcMf2bbwxBrFnO5GUxOgwNYJyy49OOwh0JwB7
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: AZfM7yFVUJ7yAcVgID72088XAHDr42Dx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX2OgiS5alSnhV
 m58nf0BRkEQZdZXmHXflYSZ3EqH7chzRldRzxV+JEwC5mRVU+YKB0lc80XkTMaBknpEbd0H5nHv
 CzSPjfAXsXvghTMLio/OgqIlwjIOsTK7u1e8bJqRDDF/OpLvXEYMM0DnQ+TAQDULQ0jPMkqLNXx
 11VoYXIM/8FhVDRnSl+mcGhYN6UiBZe/g30B+l2Jf4NVqPFzJjWEX/sUpXQTL/3HqiFFgk6Xekg
 umKPDFnf1215EPgNVmssUgg6r43aNsFDN49BGYZpye2qNFD8/dEAWrvutN+cNz5nJHIziI9PxPZ
 or2aqw1eki4xDEMfatW1YIVYD18rp4Ib3MAM+Twk+x9X95sSY3S0R0FhUQhX0ZXujenWUVmybX8
 X0fGkkkduqNfNzenyivrD2p0Fy/pw6Jq/Oof0SHMwXt4kZwlmOtZcundO6r/hn6V56tWRFLxVkC
 s3gNaXE4HtQdXzDOGSg==
X-Proofpoint-ORIG-GUID: AZfM7yFVUJ7yAcVgID72088XAHDr42Dx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX+Bu5gmPJIUMy
 g6OQ+bXGiX6E462wpdiTqMnKlE+FD3eblFJlmjmoxJK7IICTDDEvk7lv5TX/e+6iqvoRR5OoNtk
 oLGuKzbsLCiYoaHgh+M3xI7keG8WWBw=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4377a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300025

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 39fae8d48e46..9ebbecb90b0f 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -215,20 +223,51 @@ static void devm_irq_domain_fwnode_release(void *data)
 	irq_domain_free_fwnode(fwnode);
 }
 
+static int pm8008_irq_config(struct device *dev, int irq, struct regmap *regmap,
+			     const struct regmap_irq_chip *irq_chip_desc,
+			     struct regmap_irq_chip_data **irq_data)
+{
+	struct fwnode_handle *fwnode;
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, irq,
+					      IRQF_SHARED, 0, irq_chip_desc,
+					      irq_data);
+	if (ret) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
 	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
-	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
 	unsigned long pmic_type;
 	const void *match_data;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	match_data = of_device_get_match_data(dev);
@@ -255,6 +294,19 @@ static int pm8008_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!client->irq) {
+		switch (pmic_type) {
+		case TYPE_PM8008:
+			mfd_cells = pm8008_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells);
+			break;
+		case TYPE_PM8010:
+			mfd_cells = pm8010_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells);
+			break;
+		}
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -285,25 +337,11 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		ret = pm8008_irq_config(dev, client->irq, regmap, irq_chip_desc,
+					&irq_data);
+		if (ret)
+			return ret;
 	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,

-- 
2.43.0

