Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372963;
	b=yeF3A02xZEtZkobQKTojLPyRcm/2oNB+Q80KyDv4LQFZYVDcDZhswgXvnu3JXPpo36AW
	 JkNDNd4S1k1WZyV4iFTa0l5g8OhVFzN0NJxjJQAagF70K4rWnjMv7opSRNYxr0eShqiyE
	 TzlaM6vUBcrIXHxyDk1Y3Bi3HRcL8C5gaqVfh/hIK37646/KYxfVqVIu3n8SbjAxlr3Lp
	 Y0qSylLAiFpuwgl4hIzjEAE4vvPjMu/ltifWOhr1/DFMTcDWNEF8rKx4fbfYL5ggEXPNw
	 RKJX9YecR471ocjRHJsRGB9Hi6K4isFc9ZFJf4HGy4/n+D7m48suLoAIyE4oI0Qy+Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
	b=zz2WH7iuoAexpA7TPczaMLStyOMgBomlQvlXKXVO17icksnOOGtv4otAj0j+z3VTTNd3
	 FuQRQEZrb55zO1zt06Im+Teg8GzAKCmoU2lfvQ/j6sqX4mMCOfoZuEH+KieWcSgMAPaIx
	 ekBLWD69aWaWT53Emf4P5zEJA4uRp0nTNBB+jjsB5Gs6OuOYLcZRyhV2DWxYKL2VDGfO8
	 l/HJ/bgh6eXCeqmZbkDUXKsBRobJNGXQ2vKt8ChlrxN0+6qUx89aLOPTmPxZzbSCutVI1
	 UFWTOZHecNnBAMsUkPm2FQCIiYBeGcw0QcJnL0a3MxSpw2kwVMubLSOZV9xkd30oOtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVqlfr0o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3OHh6Pl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F4606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVqlfr0o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3OHh6Pl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVge63629757
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=; b=MVqlfr0oT4+xkUQp
	YXSsMxXYoUn4w0X3fy1b84sObMFyYFhpQw2Et2LUX75nwX7InOTdR4q4mdLOm9WT
	G69yVUxn49q0mgl/FK8y3lmS6vCC+Bi9Ep1Ma5b6OmaHWlRl6e9HZxhj8bDD5c7z
	Vd5pagggO+5GHTir83up3y64txpck0lUEbp1NcbkXTNZiY+eGWiA4KCHmTs2haNu
	/vyIQbED3lZmTGaiPs3nXgI1Zdkyr+HqPS307BobJOFBVuge5eea7ZU/50FI4m2F
	7uk52f1RrfogbfU8BQYGopx2d9AVsNZFMYMMOlayQMjt4Iq6K7UUpUWabXt9ng34
	C1DhIg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc3he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:42:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869865a304so4695554eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372960; x=1795977760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
        b=S3OHh6PlnGJgPz2FyOdVuyyyM7EnY7yIM5QNE0aP/RrWPFWZc+LoCDxItJTeZW7JhE
         s/yMRrmInaoaNlE5bFe/+GnuiIul2WfGsDzj4xm/q6Pa20deg+wukXLtaPapO90eQ5hs
         aBLZtxwIkXGkuRkt14YunEBLTTYQd6xZOoxf15AnZphd6rCohgPzFW1sYqHBN2fDBJmI
         N1/7pqHE18812zAy9pvJhOVF5/ircOgimm8HFzABzKWvMQHLfNXcxKZXorYCxAAGyj2B
         mFVeyaEpDqil1aJZJARw2opmIhw1NHp68lmnp01/NnSPy+fkJpj/kASMhEmJhQlBeDVi
         k8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372960; x=1795977760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
        b=DA2rWrwYU1GdJYu487dhxiMM3dZniv+dOVw43+15G6tpkKSxGgQcnraNfIqkumn1Po
         TecimlBX1j3eMu6ltZUX48n0rXZPxIZIv/Ld+xGoLjNjDrCiCaXBOnRE5XMcEzzc9xA/
         dtXxiQGWGTBdZZ3ayvvSO3QDnqIJgtFBbhmQeb4Yf5O7oY0OtqbdXwYfPZjV8afrbCWT
         EoMqA6bT+CtDW1Z3V/Ie/icGeP6wJfd8kK9rlsWaf1J99ELVw5UrBsPtT3hrSQbwCC1W
         fXTeu3LjzSuKE5VwigvWdpNFgSrDRDvDdUmIR0Jm1b9acyNnXlJAVex1yk1ICYk2yfQ/
         KxKQ==
X-Forwarded-Encrypted: i=1; AL+hErF9svZ7NDb5LJaoAjSXFATtHRvfTogv07i9sqlBTnYXmtShYByOuGsed/EpCtR7mmnDQyE2ScySQn7L@vger.kernel.org
X-Gm-Message-State: APuU4Z+IRCNlm42ffDFWi/4WjTnHrMUsSZgaGA6GzSrcbU5zJl6Wj1Z2
	pxg0t0tG5ym7vAPvhG6WmFEpBD1V+ORL7yH4dn1hj8k1egcuotC8pStDvm23TwjDig2q4e2R1e1
	3zUfwqAKYhjuX6a26idYcPIz1xz3OW+UfEFN4xqkvMD4+2fGgHwjGsNgc3nJ1uSBf
X-Gm-Gg: AZFdTZd4uC1ysv51/mePnBNmyDw09BAq9FtQCNMcJipl7op7vuFxngJyhTSmSfUonm2
	hmJxafpQri6M19+uBf51lt3E3z000EOGsid1LfwrjwKUs7kLciefpMhs44pYSm+9TnYoj8nnsA6
	YOPDrfplrCOLAN1SRJ7AFQHRj6+H4tH/PdMWBXCnBnFqy1fhiC6TPh0cx+eTtRS2TCvJY9BBJPw
	6Olzuk8hFFYOHOQq6LKr4ZNuAIhIFO6GlURmlB/3HxwOAKZTgNh+KEHF+0AfZszT49RienYuVpF
	R+16CZU9wXWtW9CHCGqkWZZrAlyI396HJFK8vb3EfzZPleQv3EshKhIpQPYcybxaB/SoF4C0O1V
	ErDRsf0k1bwdhCa0TJ0sgCKJyAlTOpoGPI1TQiB6w762ohJUDN/jvzvi3IflBSHcftynt5gWiOL
	JYuucMWS24mQ==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr10851663eec.32.1795372960440;
        Sun, 22 Nov 2026 10:42:40 -0800 (PST)
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr10851628eec.32.1795372959922;
        Sun, 22 Nov 2026 10:42:39 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:39 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:39 +0530
Subject: [PATCH v7 9/9] ASoC: qcom: lpass: Add support for Hawi
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
Message-Id: <20261123-add_shikra_support-v7-9-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2073;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=b/4U84734Yc7dwWjoX+6MpWrZ4xVMl2EfGHGxrL/qPk=;
 b=gYUZRHtzpFBjr3/75J1gKwWp870vSe+Terlm7RWBInWuX0hsNcQq6BELS5GUPU6M8tPjOc2aL
 dNwwwObuDp1Bd9Ofr4v/oHSCwidkAtOfmNKqyAwrIBbJUIrfE62/wMf
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX/DMtugvJvaZL
 qWS55gPpskIm56FPspawDbnLnimm+D06rlpLNTtEhA7UeElW6D7uW2e4N8A3xoSfXB/irs8YJE4
 NBWsZKzDLMkGdXQT3FHhmFJ+bA/lDRQK/1AyoTQhe5XEWJ/pz2VzvG/i0fo7WaqifaifBM5NYyz
 dMYutfRlHBDbCKMg7ETeEZGRYBwsgydLVU1dfY4KlQEB5vnI0Ih0RCFnsWcPPWpJHGvhw57kfi+
 LjxAPNNtostbJu6hfADfIZkmI8KB0JQWyW5JSC7HMxWUBfms32x9HKk+sKJpXO/QFb+KKN0Yg+Y
 NrCPAoArrzeVWjaLi4Is42IRGW/TvpXMOpxJhUmLyI9gH6XWiwtUnsplhUPV09q4yuX/O3ROdUC
 Bkwxi91Z15WFOL0601WBBWaHnEslPekUorQojE+J1nzPB/FsNkxdYgeck1PEknsER0w6ZnsyNu7
 5Ha1WU8UjGdjOM0YMzA==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b0337a1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=bsY24OqhetQib-sbROEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX+3J4cx7miuQD
 ju2Q+PHDeXaqyHY/iq1K3djfCY0k/4GszPv1OaA1ax2bCFRok8yNGmyvztzEeErtYhy6p5+8/kb
 ePA690I7fEXMYpdYA7aM6oZK/PCAcCM=
X-Proofpoint-GUID: 9UjE2HC4LcyWS30CORWbDxzAoHM-Haw6
X-Proofpoint-ORIG-GUID: 9UjE2HC4LcyWS30CORWbDxzAoHM-Haw6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi and Maili use the LPASS codec v4.0, RX macro register layout
of LPASS codec v4.0 matches the v2.5+ layout, so reuse the existing
v2.5 register access helpers, controls, widgets and register defaults
for it. Unlike Shikra, Hawi does not require FS counter bypass or
adaptive filter blocks.

Add the "qcom,hawi-lpass-rx-macro" and "qcom,hawi-lpass-va-macro"
compatibles, both pointing at the sm8550 match data, so the version is
read back from the hardware at probe.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/codecs/lpass-va-macro.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index b3adb32f7d33..09ea4240196c 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3997,6 +3997,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,hawi-lpass-rx-macro",
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8ed8420d7185..8e0c38517a5f 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -2195,6 +2195,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

