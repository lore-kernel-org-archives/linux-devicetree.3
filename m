Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376493;
	b=yYtaokxwcaTgyOimXFxkhejabAB2F3xR7x9fM7pixr+dKno4hKXnHnVVH72+DTrUx9mj
	 aE1+JTOTQ+AIK2bEdGT3jpYIrepJLwqYMoYU9HmDcPnwx2ovX7P20VtNyuf10Ui8IZIpy
	 yMsovKkACwqZv9T04A+WKWJ6PDzb+254EvGX6IpvOxMEI6EplL7rWaLGV36yHhaCn3bHa
	 wGsG7cI9UQsHEfILMFuswUERj1D2iNDLCipp3H5Ysu+7c+w8tFrie4PpkgbpxZEH73lkL
	 mJhU8CUSSKlSietXUWnKukFiWFcxMBwdkbXSDH6Nx1jn0vLSbEgqYXtyEzXcoUXG4aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
	b=IxFyBBsaOHbPfBaqjnzjIHvtAPTBZaQikV9y9bQmhOdqDWjYnbHknAv6VqsW7Da5lII6
	 uuY8eusnVFTKJbz9mOdbGKDyUZHgyjtRv+AZxMdn7JFdRTmwMsXxwvqwTzBXVx6TO16s0
	 4iUCpHCcgk4zKm9tAzjLMASnHWWiOgV6zIPThgtsaP7si1SAxtdO/FK35vAOvAERXact9
	 04KXIPexYsTDOisBc9VFB83DbN3731uwX2Tu/LLpOuTAOyVmYuLxwvzTJkijxLtOGdl2x
	 +7oJTyWBSgk0psb73u2+Mv7y+uISLyGQi5a+sj+t3wKkskSv87XIpRp8sWvieOFe0hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE6606A683
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFE6606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaZcjbGn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlP2y1Mk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUuGT3985632
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=; b=UaZcjbGn3TKsKDJl
	LTnEuIUZvzso3Ez6PKujRGseSzEHxp3rQ80tLfEES+2Mx0wjvxR3epUAfM91udkv
	btk6Kgi2bGJC5UVSSsLlMEs3I6tKkHpqETJThdz+kAWtflBHY1nqmbduerjdtK93
	04tQrWwQaqPG6K1oOI8mexzLei4Zl1e17gfgqDtdceBgxVuFstXT8R26GArO2D2m
	9OaTYwuWMJQFrDpI9s83I/4D4RLG2o7DdC5zJIGZ4K3KTb2ho7JP/O/FzSS3sG+i
	7trNKwods2YCZp/ZmvQnYvfcfgO8kvz/Tlsa+x/0hbA9sYlrrT9V9dsdVWk5WEu7
	Hkbexg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu4441-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:31 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so3392463eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376490; x=1795981290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=LlP2y1MkHTxcoBaP7zNBlC4lSa2q4XsGLohm1/xx0MOjMJgBmrPh11Tvj2S1pdONuE
         aEXd9Bddp/fbqFWLCSjYe56o+VC6EJE1X3MJ+ukmlzV0BJCt7s2avrK0O7s9w4kmoVg6
         1jt3eyaLA20Sw4BUaMj8h8bQx3L3ql/Jo0C9UqRugs/zKQq24qxov/qQ3twBcD51W9f2
         RE3bfzR38XaGL7kQpCsahoXdkzWt6jg4myUtjpGBYwWckErizaRwP4TB8GBE7CHHH/tP
         yo5rjOLKgo6YCKnm28xNQ8jjz1q33dyWhbITIxFXLbSbuAbLu1YQ6/4PohefQohXzS/O
         TEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376490; x=1795981290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5u2q1i9V1qn92Ye7x6/iyWkL4rfUPqYjAyeVyDrC9ew=;
        b=XMtyLogJbaC70/uq7PUEeTwCU3vzxl9pKShC+YQvJkZ72PWI+fGeGi8vSZNwPR27Oc
         mSNI1c4jpGfetLYamVRZOc40VF8PR1lGMvLtgJ2Erg+24dm4+u/y1MxxtJXDirn7wouR
         YZfmR9/HyxWo8wVAcYfF/r/5j8THqpt+qqUC412RCBIamYWQpGIS0chk24sstCP8vnMP
         fZ8UAAPF/4d5tHn0Pi0zhoYSFsnvkS2lMpBmEISyOx41ohBXkJhHRGeV3x8amwHdzvvZ
         FwM3dODf7UVhFb/j6mrki4fqOmoShlVxuRkcdx3WdeGzYNNR+C/OGNX7Gn1V3e7Ww6QF
         QtnA==
X-Forwarded-Encrypted: i=1; AL+hErHEZ5oYxQ8752DZYkYiMGLhJLUjFHAxcRL22PUV9q8tDdeN0E4ynLBc/QjsM8Ooyaet143hNRqvfao5@vger.kernel.org
X-Gm-Message-State: APuU4Z/ImYNlB7shrm9aBJWtnxBqCmMfOYtWjzpsT2Wtflk5+PK/ihIb
	6ijQRj5914f+Xf7nZDts7wWurZDql6B7PJb7yMJrZTVKKiYlneUJLge5zsbap2nrMkYxWd6+xW8
	GOa86zwqNYHTKi7iuq2z0PmxiEj6TPfl3DQJc2zGcGPFSYam2Tzcawjq862q7hhhg
X-Gm-Gg: AZFdTZeuy42zbVt79hd9TpWMaZGJs5NiuasIcUkzks5qn3bpIdLbioRl048Tf/mvT/M
	Z4McjJwEsuxHXLKPc5b5/DondjJ3aV1/tAAbLgMHcPm/KioZlyKX+o00DGjHX8EgRMr0vbEAAId
	p+HI9tLdvN75C9MIAhhkQuHeQjnSxVk8iQz/svpOyuCWUm0+L4HM36f1T6RTqoM5LIdifL3M7vy
	KmikMf8MXpB12KlcOaSNMYLee9j4cB0iC39s/RRvUd4mdDWlxc6mD7p2u8bX/RWjefSbauW+Tw7
	BkvZUOclCkoiHvAxb8YLSbaFaaaxWQ52CQQYzl/bNMX/Tj6CIbgdKlym/vVh/QGqyZ4WFjwTe7t
	o3ta4n2NgJyjmUdMHcLuDvBMWRIf2ZidmjE6lhlqo8xB2Gp2rxzxMrsb7DBHTSVlUr71kBq1gGb
	a3wLI8fzkK9g==
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124324eec.8.1795376490226;
        Sun, 22 Nov 2026 11:41:30 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr3124301eec.8.1795376489687;
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:29 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:49 +0530
Subject: [PATCH v3 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible
 support
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
Message-Id: <20261123-shikra-machine-v3-4-e5d074264428@oss.qualcomm.com>
References: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
In-Reply-To: <20261123-shikra-machine-v3-0-e5d074264428@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=1890;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=ADHxLIKy80YYC4X/WhkVFhvJ5Z+R60FIHCh10Djdnek=;
 b=MYmePnWbGhM+LBfRzuDNc5iosZycgXUqbbFjEUXtFtc4uLHlU0KUIberGaJgtp2yMw6gOJcAW
 cdCELuWi5QGCMFzrCtLiUX1l8WlK2G7n2iiyQ8V/ELH3cTBudZqqV6W
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: 3pFyI1Xqcp0i-YFL4Zprmdy08a-7ipAz
X-Proofpoint-ORIG-GUID: 3pFyI1Xqcp0i-YFL4Zprmdy08a-7ipAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX7xVJOaI09rK0
 YiR/rGUkREigB4UQi9t9YsdLB515JSF+4B+Zwg1tO5NOqOFG4XFmYfroIbs6tMnQ/LkZQC4tcmS
 5qEdNzsrjQhvxITZS1dZmcBgJf/rLggt8NIuCQ6VJKBmVAId0aJvVCIaBY5tEnlQiECT5zD6JCU
 4kKaznXeRJTjCBtbvXFToAIKcffmZxmNnVFIDujFl15M52qcmXlZBEDbN25BCdfab/miMP50EcR
 k+NGw/rZzjKENybAZA2ZOE01QWDeLy53OvPoURcehnGXx17Ge5+D8kL9WJjRgTCfhibq0/oduUp
 5AneT/vJAxqvfCl6E8MGYsW2zpKOt5aDkdLd6yPQl8ltvp9/W4plWLQ3/r1oDgOm7PsX6iXkJgy
 KY2OknHxxr43xYrc3qNJGVLmV7sBHWbGc/E2bO64+ebRetc+k28R8luPwu1N7WGZhxQxIkfW7sV
 318P4anJwmhU/aZrWIw==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b03456b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wXg-2A6JSwDC41Kdh40A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX1bPOOeCygM+r
 ZeXEAG3E7XWDNDPEZntkjq+ThjaN1lJo/H8BZzFuJdMzur22f/+KFIX4q4VFMQqh3Xu6Czxj5Kx
 BTaSnioe/hZRF7uANEkwSNW4hxmxSrI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra CQS EVK board. The
Shikra CQS platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components with modem-DSP based
audio processing.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index e1d701a1b1dd..bf62e8330276 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -742,6 +742,19 @@ static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+	SC8280XP_DAI_DATA({
+			.id = AIF_TDM_RX_2,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -812,6 +825,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
+	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

