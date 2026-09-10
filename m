Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3B48AE10
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052606; cv=none; b=akAZBW9Ow4ndKDyAGeSqY1IsJgYJJC+tnqXZoiBZx81MsLjRu9ulq7R2VnngmJ7/rjYQo9PgZdgyE73njIEUd6HvJrqN+qa39VowbKfxWqutjnxfRv5lxZAuhh5JRmm6S3K/cc3nb/+vNAam7IIq9xg5fDkUbQVPZULYqj8jV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052606; c=relaxed/simple;
	bh=AAHHmOjn7wLgWhIqR+F8O7B1Dze2sQ5GrP8Y0jUE5GM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL1xPSyXh5KjF2oxyAb31/5xqu6rcFkSfFD/t22/+eLPt7XigoS20/d+l+P9qbGrTL7oJmd76nPsiDH8jOTz9EjpxBVNxUYHkUgCFx1YR7B8rfXF/8gzZwhbL49mgeIAodSZwNJQpXhATuSiNVHMaf58aVzgoY/U47cmOnXO6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pK9Pm47/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gxLj7ByU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pK9Pm47/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gxLj7ByU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ADvGtZ625795
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8WB09ozFppmUtRLfsVXdBp0l11ApnIOq0cWBDFs3qE=; b=pK9Pm47/QGXlbRQi
	J8HTBjxcoPazhLu580f0jzwFTGZvtE9sKivhjC/8+MelvS1MM6oCCJMorFuBg+pV
	exOhyaMeisNUPh6/LHVY+qVE2JLwTg3X7CEBgQgEVCZPhllpVgPgkeEbw5iI8aTg
	9/+4gi2mjj8gSqeK9i03dUozuRnx0761G3GlT9GW3v2zZ0+cAw0T+7JUnuYsYuDn
	Rd0DOz1ZY3TMLvWqrbXqSYv6o983L3XLxz/b68C+RNtutFA9zmX+iIBMHCWdp3wE
	3eLN5/vYy5q8nAXvzU1E0DlXWQWnYkvqJwq274ssYqZP9Maos5Q4iX9UyLX87CZt
	I3Trrw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwvx0e3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:03:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc489e7a701so5490584a12.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052603; x=1789657403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8WB09ozFppmUtRLfsVXdBp0l11ApnIOq0cWBDFs3qE=;
        b=gxLj7ByU6cCF9aB7XRteg7Unqg1nLo7aY3c4RrKxZsQWeVw6S+nzpyBtf3vt7F/nn9
         kLolmfSVU0yh1/N/EiAmwfY9ts3K5jeBSXP0l6r99GvOcJoxjpCNOD+hz7JpTX3jDrL0
         Rm07T0EklpaPmqorW5s88QJ3hcWG3LIsJaHZkncfHMIAk0duEAJqlS+NVTIOvrrFrs2i
         DPcpvfAhVt/7SVEMy2Wx6UHbn8M2WhpZlMLfSEy6O8rbbH15djbPw8sEOVTdh2OAw2zn
         GEAd3r2IT7/RxZw9tnljuow/uq5vabNDYsevFXWXrpSM26AmVvJH+ddKnw7/XukbLsC/
         CUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052603; x=1789657403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8WB09ozFppmUtRLfsVXdBp0l11ApnIOq0cWBDFs3qE=;
        b=kX7GRzkWuGGtcnaTX0qIjQ7cZE829BRAb6ppPcN99XUjFagihMjPcPs5i+JTgReRdm
         uFaxx23xZVOmPb9iRvTzM+KEboSgWzu/hPyL6SNcLNCcFDTeQXIoWryio/aEq6i/jmYi
         pKGMVylb6tU7BS7rHo9MAixD3dcKiUgtdXA3Z9VhYVbqnaXkWILbDPWgEI+amta0Mhm5
         k9r8WRrRqX8yfIs0PFKVpWbXUH7eg6rwShZPT0uxtwySkphhWMF86+IsTqtlWmF/AmK4
         TJoFJlu1effCAmj8OE6jVFXhXTKBOjcJrhnYTy0YILqNTSUxoSHXh1QKgMFw7IOY143w
         cJjg==
X-Forwarded-Encrypted: i=1; AKwUvBwMRDqgPFRzLiNwU+aHZfCX+oryDFJrqicQfPLYJf0L5ooNGlD80hFT8FJWGw/gh93IqRG4/rCiLRlp@vger.kernel.org
X-Gm-Message-State: AFuF++nsvurkZYrZG+gURpG23mG15OgcwW8njLJgNv7MLPTom2oFhrON
	o7qP3o61xz0gW8lhyONktOiLU/ouJqJbtyx7Lp56xquxaeewydeFWMISX2CSHu3jLojXd42zXku
	f0Jf8d7ZDaL2FsP4aII2yUjffTq5WbU6G7Tgx7hE/RF4n7J92I7eEhimX9j+cRv/I
X-Gm-Gg: AYBFou2AtTwqO1al/xqjTAuKqJvtmGw/mj2Vs3YM5NZrYSQ7fLy+uMzg9a9gsGg3J+q
	WPmNeHvhkp/ngliznz2Z7PqficbrujfWSWMgcZMsswIAhxlC/zW04D7wgTefXL0QRDkw5yS9aqA
	V4qRE1x7G3YuuEkKIbahROg1nx5tl1zjgKJkZZe63AIsUXEDFVGtmZuClbjctr7YVde3pf/MA3E
	HklPms+Jwmkc989KBVg1AUCnGOeANXXHcafOdN4eHjbYvCxyUflu84/3dozUEHvNZrcQBMvDROs
	xI/EEJoD8j2UuNXKBD9uGVJ1rPk7CGRkL8oqs/VXfpoLD7aRZRYjM4iFP4KNVeViSskUj9RFCVE
	hHb2xpwLMmENjcsnN4fzQfsVNgKBT
X-Received: by 2002:a05:6a00:b4c:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-8694644a922mr7586619b3a.7.1789052602858;
        Thu, 10 Sep 2026 08:03:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4c:b0:85f:1492:61a8 with SMTP id d2e1a72fcca58-8694644a922mr7586496b3a.7.1789052602085;
        Thu, 10 Sep 2026 08:03:22 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8687b479848sm2357060b3a.38.2026.09.10.08.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:03:21 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 20:32:41 +0530
Subject: [PATCH v2 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk compatible
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfX9W9NAqB5Qy7r
 RmAQWCUe3Sko+iYzDGT7hpp2B6kAFctllQQgqJXgDIHLxrv0XGG9RWwn2nPnODQ/W6NEZKmGfnY
 hAOD3AeyDgsZ/i03kPHfIuaJ6QJVE/RnG1y8RPe+ZHH1bx+PgZqrpWtYQ9CWwhafiQXoQFLSCL1
 mseOuGID3Z78WhVqUwebht3FIZEIDdhdiMfZkYfhtSV4HuifF6lH0Bkk3Nhfydqs0jZe0mntjpm
 4CY2QGfLTHGhOsQLrAAeSvFm6kYSal3GU/pWbaK6wt78xRdPPnHh1P7S44mxtBhAkddJb4099IJ
 FJoj6Xd9OudAYyS1fzoCrJ25sn/R4zOGUPW3RlOV153wVX6xoXPigst8PNMKXLygHYJrsRKUHnk
 HDSrx7TnJzCstKp9f0nMVv7NLyHu9E+Plnmig2Ufxl+W1NqN4lIGAyHeF43N0khlu0DgHaXzTgk
 TPKGf/9STxVBSFxs8aA==
X-Proofpoint-ORIG-GUID: 1V-rdAeoI0mP8-Ys9-bmfIfQyAuRMqQD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MSBTYWx0ZWRfXwS4v3WhliqQJ
 2wnh/ATqecIR1YLkcqEa7+NyJRHDUFmziXWDRO3x2D+zSImvWH86iIgZKwC7s/krfyCg7dROjdi
 3zoIp8LF4ka/BQrnxTKCr5bH2H4OU98=
X-Authority-Analysis: v=2.4 cv=AdkkjHXG c=1 sm=1 tr=0 ts=6aa2c6bc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mwyM69RmJpR6kuacx_4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 1V-rdAeoI0mP8-Ys9-bmfIfQyAuRMqQD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100181

Add machine driver support for the Qualcomm Shikra CQS EVK board.
The Shikra CQS platform uses an I2S-based audio path with WSA885x
amplifiers and PM4125/Rouleur codec components with modem-DSP based
audio processing.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index f9fed5c37c7f..5bcdaa192704 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -535,6 +535,14 @@ static const struct qcom_snd_soc_common shikra_cqm_priv_data = {
 	.codec_sysclk_set = true,
 };
 
+static const struct qcom_snd_soc_common shikra_cqs_priv_data = {
+	.driver_name = "shikra",
+	.dapm_widgets = shikra_cqm_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
+	.mi2s_bclk_enable = true,
+	.codec_sysclk_set = true,
+};
+
 static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -602,6 +610,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data },
+	{ .compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
 	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },

-- 
2.34.1

