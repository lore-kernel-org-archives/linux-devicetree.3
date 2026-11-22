Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376497;
	b=AaqTt6qjsHdZc7pylwjUZFeBCOXcLNK9+p4KNigp15eO2lf9LQ3QVFtnXoMMg018qOaY
	 fnGGmIV5aJI31Me1y0j5/MLQo6pIfF6QCJ+dypqQteILLWOU5EPNAUczVHKSYmH5FGMB8
	 rNFX8VoGvo9X3IpjsjefK88igZ9PPjQYU1cKC41/txtRjijq0y8DiG5Gm/5fjjzf9rRef
	 8hvFkVxvChUTukYv6wiRkCmIXAFs7yJmA4v/virHEghTUxIWlFm7bvDWX2ztYv2MnjONV
	 pVJvOhNL0Yr92FjLYPlGyH4PtBomd+ZX9qcaBZnra1cMwRAAijyM+JZoX2HFbz1s51Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
	b=JzX2fisKBKGU5fw1pudp6rgx8kpRZ4wHq+VznxSMIuTdYyHxZwNe8lPBrx6w70sGS7O9
	 tBcy9819ryNOAHhgYucewHrMnp+puwU3nBXGl2ejLUEpUzhn5IN0dhOwmfM+CBj/Uzo3l
	 vpd0/35tt6X71gP+42kZ0cPm2/2oUWCQ0qZVPqPvfLL3ojlejk29P8BiSSZbflOtBcWmp
	 q9w1v1B6Jkmy5xIs5kdbp0ioqSwrUHOGrrrFgtTw+giikKrt0Q9pDeuxJkrOv9Pto8kg7
	 Jlba39NokSqplU45ehhajk0UJdsOCGAoz+OIto+0j7K+Ngtwk5KJKlHgVHDhNzpFi4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pznymhil;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ILV/6SOY";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE783606A686
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE783606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pznymhil;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILV/6SOY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVFLb1381024
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=; b=Pznymhil7qOIumbz
	nZbrB9lhsptGjgcMYzQY5uAmT/V/6eaUXZpghNUTB7U+izXm4cY4/fqGN1s8HmR0
	JCxmMJFmAmvnaDOFlHzTlIf7cirgBuS6ycUm4RA5O+oonVXR9DDavagU8o/29kZO
	vksSDnHUJ39jU/RJ3aU//DRLvmRwqvc9sU7hIfgCM/CokDYKlS6u8avSyIQ/WUIq
	LMcXPvVGmEVHq1vPhWjOD/wEodUrWgRLKiPLurpRZu2AljUheDM8J3aSLFL6PUFa
	iFAf1bOe/eslvKwvjIA8/VhFr8Ak88Z5Yfp1Cet61PBp5e68UmWFYTdFi3w5cU2r
	sOz9iA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w044ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:41:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so1207579eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376495; x=1795981295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
        b=ILV/6SOYE7PN1AAGndLx4hbBk1HC/fbw6WfYaW+H7UR95CgwgpfwAq6teqssOgrtWK
         bqMT4pxbIpXOy2mJ5HV3QljSvQBqPr4GBPSHaBbHF22PAH5DqHuwJOZ0uLbKQ0M8pmfa
         x1Vcv0nqqB757WBxrGMVRsY/05r5LKt5LTxiaugUAQ3Z2SxXYVb6/d/GN55RwwOACXcd
         +NUf1Uks5f5nCTKwxOMVdlRkQZv4+ldNSUWoOnfyXkDHN6iS5txFSxytMmvJCqzszrsd
         UB5iGSEf3Dz3ZACl7MPYxSFkT0vspotm4HCXCb6ICOLuVbazhy/CMniJAwOGRzRa670e
         si3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376495; x=1795981295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTyZfh2vpkguWMlHu7iQNp2bVhFcR2C7lr2zyFVmITc=;
        b=SV2vPTqYZnfH8xIzfIDUNKCCEhM1RGns07emc4PYFiY79vnxjb0h5oNe7bFiT4s6mR
         MAqJR5Eq5Eujhw4Y6RclEdLMEUS0PHL74moNoPhPENUPrAfLXiGKphdS2D57NJQ/3aoT
         lbiQxkGG5dvrTkKdcQ2kJV+iAJhxHTyTjOJYwyIt706nYp1NJegxHdhwBBgm461o+fJB
         Ly5NwqP0e/CDrPm6ZHf5Nw0sO28VtJL1ISKePPf9eCsE2QEkHox5zqz7EVW1tSBqaGmt
         vRRe1ANfEYVtGqhCRUd9d0Q0JievBfg5ijEXFou8TN15/k6DrEy7uBFA3CVAoLrNPB46
         yA2w==
X-Forwarded-Encrypted: i=1; AL+hErG3b+8DxCkDccZy9aQS/9EcTwKcuaSu/9kAv6sTDWji1OK+0eFgA6tvxqVga32NhA8k6imCe71qukoI@vger.kernel.org
X-Gm-Message-State: APuU4Z9Tdc+oHNjMmRmLoAdqn929zp8z6aNdZQKIZu+26rzXDAtVrxMs
	wlE8s2gUFF5k/WWchGbGORVp361gM6ih1LjML8/3Pb/cfL3NPlSqrNqhwL4MbRWivPyXxG7Q0OM
	8N66yqfZa6FAuNc6qgUkbNOKOoVGBxVH8PwOzYqTY69XiYl9e1yX+aBvbpYtQ1T90
X-Gm-Gg: AZFdTZdZJQil2LP9Lxif8lO9ABawvMH1nacLEWBzhNzryfCLLTdtBtDRVYmFncdn0CY
	bO6LJEadApfKv9Q5Y7zuEJpLEJwYaoBfvOZ0YI9uaJNqRMo+hUT8UoJ+803ZMkykLZR1wtpzKla
	yq6Hy/zrn2E8Th+1iF99DM/SuQCVRkY5iOtO2fQj3Dkmuje8bZqr8pwGrw2ibXJ7JoVTTKsmDKp
	I+0sJ5VVqqTNzVhveQ5mf6jcIfK32WU96uypJoFTDHwiFfeOmEn6avwKqFIsdJ7F3ivuR8z26SX
	4YySKUlSy6kbqtqcBUmqLJ06u3FOAmUoJZFRpfZ7LXJbK66NdoPHeY7DXaLXFCFNZOKcXNuSLuk
	ayVipdkxyhcjFXBb07E8H7vK4Y8FbNoc64okCztX6p+lflayl9P7DhDFSpa1SxxSXecHNIN2ykO
	mbosL/P4batQ==
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr1994512eec.27.1795376494737;
        Sun, 22 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr1994497eec.27.1795376494258;
        Sun, 22 Nov 2026 11:41:34 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm28348711eec.15.2026.11.22.11.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:41:33 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 01:10:50 +0530
Subject: [PATCH v3 5/5] ASoC: qcom: sc8280xp: Add shikra-iqs-evk compatible
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
Message-Id: <20261123-shikra-machine-v3-5-e5d074264428@oss.qualcomm.com>
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
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795376465; l=3030;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=4SN6i2HTiPaf0z6YipTowuymHZB7HSO+hD8naOMtrSs=;
 b=yCNiyJCyxUQpouVGL6b4NFUw7GuuO8QG1jSu8cZ/elffQaehHG3tdrSoCb+hi6/wdgoM2ph2d
 Hr3QxhcWZ7SDyR31777E+s/zGlAqNLFhUgaTwmZ/NBjvSnrW0IXWIHJ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX9P/Ej7kvxRTo
 yEsYdfv8cmtNkKeM74ERAN4Fft/oNsLdvfUEzZ9oSFmQO9+AJOx7GtE493MmoWrIElL6TktDI5V
 A9u80vws7gUZDOLWOIDbt/TEGiVxqj9fZUUqXNk5Mbl9NjCoAdRe3dCGY+r+ByzOJyIYlc7TYyw
 YMFU8GlGI2Lu3MQNWKzWYKLK6+Ls0PnWsLiy/GcHzENFPztanc41p+ZCcaQ/bH187CP6+Iw/Z3J
 GBmg5XCEuazZr7VhCoIEl6PvYKZsDoqpJy8fpfviyzFy0wuct4od5yt526fSswmCtuW9WWWiBjW
 8WJef7rXLs2aOseJoWaTXVum/hgMnsN/gORRsOTVbF83DRHvxGfDWKraasHVCAaotT4X3m6PbrR
 kCRyOEjgB457WijEdhCDUbH2dnBWNd+pYxEyUFHhlDLGjyL+A9Hu3a2uk7vQqMkh64ll3V6VbIr
 SnmV7/m7g/GpRVNJZZQ==
X-Proofpoint-ORIG-GUID: BlFcC-u0vDx3RNl3QYHmRbzZFeaBo-SS
X-Proofpoint-GUID: BlFcC-u0vDx3RNl3QYHmRbzZFeaBo-SS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX7WJc5Bf1Uyzs
 0LHQLu2vJZNIsq6z0ARqKhwpF4eheG804lTU5/jn7G9rW3/6zcG1v9dwropoFFd7Hfejs658n8s
 EszDkHkq5bSWaC505jjLcDiCLMi1uFA=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b03456f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fMRYn1g1GmHmK2_E4s8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Add machine driver support for the Qualcomm Shikra IQS EVK board. The
Shikra IQS platform uses a third-party MAX98091 codec with modem-DSP
support.

IQS requires board-level DAPM widgets and pin-switch kcontrols because
the MAX98091 codec driver does not expose its own endpoint topology,
unlike the Qualcomm WSA885x/Rouleur codecs used on the CQM/CQS
variants.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index bf62e8330276..a380c82afefa 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -45,6 +45,7 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 static const struct snd_kcontrol_new max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic12"),
 	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic34"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic56"),
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 	SOC_DAPM_PIN_SWITCH("Receiver"),
@@ -56,6 +57,7 @@ static const struct snd_soc_dapm_widget max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic12", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic34", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic56", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 	SND_SOC_DAPM_SPK("Receiver", NULL),
@@ -755,6 +757,26 @@ static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
 	),
 };
 
+static const struct qcom_snd_soc_common shikra_iqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = max98090_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98090_dapm_widgets),
+	.controls = max98090_controls,
+	.num_controls = ARRAY_SIZE(max98090_controls),
+	.codec_dai_fmt = SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_BC_FC,
+	SC8280XP_DAI_DATA({
+			.id = AIF_MI2S_RX_0,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+			.jack_setup = SC8280XP_JACK_SETUP_CODEC,
+		}, {
+			.id = AIF_MI2S_TX_0,
+			.codec_sysclk_set = true,
+			.mi2s_bclk_enable = true,
+		}
+	),
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -826,6 +848,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
 	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
+	{ .compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

