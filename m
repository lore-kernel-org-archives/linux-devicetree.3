Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB23DB630
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280239; cv=none; b=sOjzvxi3iMlq4Gxa2VcjmDRiybc1NLNc7jiyCV2xL0tgmgwy99LrhMHPo8TY4RqD/l6yYL+IZtCBDy6u6bT2RhPa7x0MpFZ2rLyUHoRCnoTSMdljoZTu1nfPyD/JtAiQQZDCqHiNUSprTrIMMIvwJiK1/FTkpFWKF2m6owqS/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280239; c=relaxed/simple;
	bh=kDUg1fRRmqKzaG6Zc2sw6qY3SgF2FeNwHEhldgx/a24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8EjPM9OUVZx6TPGuK2aYRCC3Co8Yy9h094Ds357bRjK01l+4YrVFFV+y+KD0azt4bqIUgp9l8M5RdoWud6zk53Nd0dx9WwvCc1kQJt+deTyw6VR5WPSENkH4HKwq5ZT1qjJnfwSaDwdvf6yIYNV4PDaFqlkqQxeZliQvHYQKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUyim16t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKrvTdvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUyim16t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKrvTdvl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966dthD094592
	for <devicetree@vger.kernel.org>; Tue, 6 Oct 2026 09:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=; b=HUyim16tfFBieg0R
	R49TMQCW0m1I7DQ4IV6nXOkrqZpMMMUTYmwrngpRr32/XG5tiUq8Gvx7KUg+86wR
	40l4wp87SBqCeFRq5nGs3/+B3U5k59RAxFzYcq2w04P/CZmZTNwqS6yLSMKGZn8J
	Tj1HKxmP1mYhCi23whIzmO45hfvr5eUy+ztOg8kuRPhrwhrGfg8RZ/vbBINEmwJy
	y0F6t+Ne8DmNVtCUd8blrqjZn8ph3H9Re3YD9qUpw/uOzFaRS11TFDCkUW9/rJ5h
	RUfBkYiGdEnpTTo/hAAMk0SBZHk0xggzssWTpB5u7ArP5W6ORW8x4buYzlnsWvgT
	EDS31g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3k14n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 09:50:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8886059d3faso5650955b3a.2
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280237; x=1791885037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=;
        b=eKrvTdvlUKPjvLbWLV2l33l1DFfOXTehIUQk1C6awtBoY+9vPAgeEvXz1eBQ4k7Dfo
         zS1/SyWWdLsz27whgtgXJdFiaYlZd29Jczlym9M5bISF/UnfUeTI6ATBvojTGR/4kzJr
         uyW1IYTAaTpnJuYOk+XaBoP7WTvx3av+ewDWTKrbdngJPmwGvZLMRsrxr8ISiZAqSJn+
         MRA+eFZwuPU1sqaFC75zHqOjuWsVag3VeszDksYmO4x+hAkriWKBnq9ea8w6/IMs7FPc
         OjL0yUa1CJIhtZCBfUnSmksxaiktRZGoadKkJ0vySUk9hQ7C/tVAIWPPZAttvue41tTq
         t1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280237; x=1791885037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=;
        b=xOxjx/w4YqDwQ3uz6xDotfPRc/VITxrMwp5s01+xhlUd28hGH7ZDYJCLncxosNXb9a
         zlJt+0/wA9u+zbyyMb3KAlRwAAPPQM21AfyPGA4o1I1stGES6h0zwud1sJ2fte7xJQZF
         +wmbZE5Ku5tAPqtreJNvBaj8LPF11OSZycDDzMaThziihte1vqzXp8wu4yWkQKCCe6hL
         o9Lbb3nwZuC2Js0PbWaGyB5mfWGhmBNaM1+Sw9+HXS9Js4rexReQpQsbesefziA7kuuu
         2YhIzZ+aWZFbtLc19V8T8ERwSN667lTFuD16YjjN1QDa/KgAXFIajJUozCZMsEqtX0ra
         Ks5g==
X-Forwarded-Encrypted: i=1; AKwUvBwAqPxk43MQ3XxxxBSXhMdyEaH9uTFzMt3ZvEU9zAu6HUgVbMOCD2zCAciv+IRsogBSrB96Uea7baWk@vger.kernel.org
X-Gm-Message-State: AFuF++kmPPfYUfl23awP97YKWXZIL95tlWbahrvGeIdLOzFog7Or+oqe
	LWeC4IArI/hC7QZmi5ksaPhcBC+0CnmliqiwEuNLairJK9rz3ZqqbfIqNKgCICGAkauIGabsl7W
	ohVuJ/366AfaFwCOmbrkIywcy6DCkfMPEOHJKzjcoOsV0hYSeCNZVmFeUccwk+2n0
X-Gm-Gg: AYBFou063oMybgogmnBQz5YGocs/qjoesZGWi2QBHs7TB+DJ2TrTYUdgd8EDCMgTftK
	okTDKIS4Et5L1/j3XPyJr+vK6PXoowmOJZS8VAgEg4zCpDzPRDfaQ18Jo69OnARZDuqCmwyg8Yo
	NMdj5z9B1M26q5YoUNMcKwlT0AZYLG7SWq8vNrQ9+YCPTYFx1dWyECHUIOD+7IuG38G5m7Iqd+m
	G81qEnY9U8STzEJ8holTr6ML30EpaRaRII+OWLAZXfMLrXauzk0kIYeNV2/KbOmeLji4FFzjUKh
	6SI1UXNIQ1J2LwSHTsqzEPJyuaplpvEw1CNHBBji1IhPiSD3+dj+9chCbJ6kU3L4ugNzsC0Y0Yn
	OMtg97vwKQsG7Wd2Lza4IcHhym6N+c2cim4cdXragMv2XHu5qBDclCYw5MjWyvJ0p
X-Received: by 2002:a05:6a00:1581:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8911caa4c0fmr226495b3a.57.1791280236602;
        Tue, 06 Oct 2026 02:50:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1581:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8911caa4c0fmr226486b3a.57.1791280236192;
        Tue, 06 Oct 2026 02:50:36 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:28 -0700
Subject: [PATCH 2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop
 8th Edition
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=952;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=kDUg1fRRmqKzaG6Zc2sw6qY3SgF2FeNwHEhldgx/a24=;
 b=m77AJBxiEiOXnMON0T+PwcT1ix1BgC8IkQTobT8Dov8QxJKID6TD1khw2uuZIQxKCKSH9xmMr
 1OX4Ljgs05bBI2N/4rdGHcvd2OBZjtwSRHvrJ+XXNQTjncvV6HJ84PM
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: 8X30ptVhq0R-BTLAcUBAT6gv2O0frXpC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX6NJUmgIVh5b+
 Z5tcsaiMQuQzl6eDyRVUOWx0i/jSlr/j0dNb7JOcXQkjt1aCKcwg1C8x/+tFdr6DYgwj+fbj0jz
 vGUmbx3maqwYgAqwEx58og+LmqN4X2o=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4c46d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iOO-S4HMiWNIuKyz5uAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX3EeAEWmUf88x
 XdGIfC5jY0wuJS1xHtLPOJeVXeXTsXZ+gefeoDQMKaKglWUMP1WbGZ09PwJNCdQufM177wEB3jY
 kQ79SvpcBo4erxdXwLqsQUHPnbntsf7eZdVnuElNBCa452L3tmJ+Yc1eURmUPaSpemp6qSEZliq
 unksZCBSKv8dRhS/dEmMdSPrSfx9lzq9kGTSYl9xMxybTAY4yxgD6+aDwYPoIz+2HbVEQjvqUpt
 lddL0tXbf64CJwyDahobajk8/AVVxYtEJ/kubjFF+TG+zz0LXlcX8wotDEoW6shNvpg+Q02lR8b
 Gp5Rd5SntK4OZsOzFq7GOL5ZJDWdjpm4gKVBgL8s+pPlG11I8okNy8m6TnPfRfpMoAckA55g3j9
 wAR18heF5QYIxzrFqko1x4cJcpFN/7Hw/e54p3UPXZBzJdE41NiXb1e6vVl9lMgQwAD3mBiWWuC
 iAK8k9xA5/aT+xVcLhQ==
X-Proofpoint-GUID: 8X30ptVhq0R-BTLAcUBAT6gv2O0frXpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
13.8" 8th Edition, giving access to the UEFI variables and the RTC
offset stored there.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..1fa912a9f700 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2255,6 +2255,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "microsoft,surface-laptop-8-13in", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.34.1

