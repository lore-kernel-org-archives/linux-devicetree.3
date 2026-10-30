Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793340109;
	b=Xox9mDzck/F+iNGLx91VvEfR0VoZaGyqJMH4caUYnQkZcjGcb20v+00ELhc2NAjJvj4F
	 p+iaoxoqKrwbVQoLMMGxdzneT+VixxMbp6QRq1BZirLj1dGDv8iwebzc+NgJTonZwOjhK
	 dF1L32Fqxyn2CDFiT52e3RPZiio3VjcWBeoTZHo7HTGL6nxhDPakt0mGbvRg4JLq6aF8E
	 ds1OSRhljOm8VpIbsx88+59Yg86529nYD+PSM+m8lVjJd3AX694gimU31UqEnLeqwHvTt
	 ukCmU1vQz9nWx7UnrBYLWFsPHNBQxzP1elN8dI9yS1U0dkhqWWaOW958MGzv+Ewryxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
	b=K062CwsjG8mq7gXyw2FxFf0+qTPzhIHCmwmzlEWZDvbvB1A5JshPBI4dsUgiFbvqmfgg
	 VXT/5yMbrHRncyWeNeVOx+5cp7GLqZoEoF7qPoww/dtyTmZ7Dipvm006uO/zb7vKVHvi9
	 gLZ/wCJzlCICliQ7Sf5Dj0PdzXLy+DRS/ZriNf0N6syjOKU9KWURev3E/qkOeWZ+WoZwS
	 zKbt6CZryePvXmkydR3IPfG7GUsx8FX0QqEwqaFK142Hn8mCno6kJ3d/2fq3TVEDvIuws
	 GaasdwYZleWY2kCTaG8N74AjBZU6HnGEMXIe6630nmliyodbWz+2xZgzy6ehg/8eIDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vnmi59Hx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EB2606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p1GUPYVa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vnmi59Hx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F9703312595
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=; b=p1GUPYVaYt5x8Fsz
	9U6Mxmjhx3MccUJd+BBFhjIfoqgJhdbdtnA7caz7aaITIb6YuR9uHHJtqOWp8mtP
	pw03LDSf20pTjpHMJktId1q2KCbPMmXUjG0eM7KNhdF+jLjjtIdEyYXR9KsZCMNL
	XzcXthjfQlumz0fHxcLPbnEkGzG+sbjXa17x6WgRCIpwwd2AtPP09qA2d6DBb3At
	Jo3fF7K53Aklw57ZrUzR4F+v2EGdg5JfLK7PFsyqirn8DvBWC/UXsCOmu0fnz6Z/
	JnmXhDSVy7SLYwtdKAcUGPSzezSG4DCFFYdDYZSLjsZA7jBN5iUC5DlpSTgJl838
	z102XQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rhgmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 06:01:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so353044a91.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793340107; x=1793944907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=Vnmi59Hx7d0WpLM3t+wKO0CKnAITiViGEnJlVvs3Xw1XnYznvbu66qNngxCvcqkdpW
         Qf+edWJBvP+hq35MWGHgyt5m3wQbY5+WxVz/39NQBGgLM6qMVbZnOju34J7h2c/lnh6V
         0sxOUR18twnGjHE+47m+U2GGf37ZXck+LLDJD7OWkslBkf0lv5VaPR5RTh3d/X3fxceO
         7oJqRG3AtXX47lM5ItMxNynMu0dueT3Dp0MmPlxwaffRMduRJqmoHsPp2gUqfKhUT82q
         23gJDsLBJ4aLYd6g+hNIlO8fpXcaSOSWDmYMOUSPqC24LHlppmoAOdSPBEQ77Cw8fjCS
         SUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340107; x=1793944907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTJUwzw6sKx3M6A6ZYfHFpk+jDF6WPTNCmHY6Qk7BKI=;
        b=lQzXqLx/9dMq+6LlrIbfd0OCDxdwf06TsfabdxqUeXiv9mLHB3koy8OTBp9lHby3eT
         ue173wJwZpf2fTEq+K8XGqPB2UaKW35HsGCoT3PymvWFedUK2l0tST0gob2Xlm/7pniz
         Qz2RFZhOxbGQUPhg1+eDZWv5BpMrBv7RzS6wlCBlYoz8YKcRPC4QTyzioqJxYSnQLuSW
         jLnT1sGSwZ2e3ytdeU21MGVte/cSF4r0Doj56tAT2Khr6moM0hBbm3NTw7szMmCRDPCX
         wvDlBeDO/d7nnU7hZ1YGu+sAlsEzmLMWHDI3Ao6hm+A4V/CpmwwtBFGLRMwHXnW++psr
         HOiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgIe5SXmGWhWMlelgBG1IGBs8SrT4rGdzOP2MgGMHbJLytiF9sKsl7UeEHyHBkq0xdEbIwdqpScAY4@vger.kernel.org
X-Gm-Message-State: AFq9FYKMOTUY6i/hk+X3U+o0cDObgaW/036lzoprX/ZOonYgA2W3+GrK
	XwheOf/lXvmzAWQLjLcVjMQCTO6fxjmZNntEp76xr3w0KFMnHM/iuZPeQ5JNvMFui6XUcNMUUdP
	FkU53tgM2thMjkbKyFw5DH8tIGP/Wpb+CqAkW28+gY/lEvV+LFYaWBp6ykC++6HVr
X-Gm-Gg: AYBFou1IuRvLMjdbCT8PAVXsWVZwB9x5JcnlfkgE33BqjkHi6hgxBnz1l6qfLUZKG/y
	AH2A4WLJyBRWmH0+HNyO7WStg20bL2z6G4xdY26AkEJ5xlWEvQQ5Dkn/fIJHHvy3sxFmdeiuhyB
	IUhXvtHguDepsYY5LTxlcbeOKMdQzsz9hX0eixWv3JizNOWOsW2nfni6XS83t2pDhEqOvutQwFr
	Aj6Wzyo7u/Dm2oo3T6y4k3rYqaAsEz/F262ZERdIDmdC73rt+ahE2T+yVzNkUlhSZjQqUrJYvc1
	d08uAsFvn9WRrGZVi8zilYBjo2EWCpBoMK+rykZpqAPjvZlKX5qRTFpNYMSX8KH3PFzT3FssyBu
	16o5wnOsIdzx3Eo3oeENJ/i9r7GZBnQw+8RD0moNmO/Gj509NB+4PjPMg/uZBuHq5nuPOpRpSE1
	tbJ5mUYjwN0MHTM5UnNNWdaWTomiP98t+q4OJg
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382665a91.4.1793340107332;
        Thu, 29 Oct 2026 23:01:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2f06:b0:3ac:9785:4c34 with SMTP id 98e67ed59e1d1-3ae6ece52a6mr3382626a91.4.1793340106771;
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb09706f01sm252292a12.20.2026.10.29.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:01:46 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:00:28 +0800
Subject: [PATCH v20 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
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
Message-Id: <20261030-enable-byte-cntr-for-ctcu-v20-4-bd5c3ac9f916@oss.qualcomm.com>
References: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
In-Reply-To: <20261030-enable-byte-cntr-for-ctcu-v20-0-bd5c3ac9f916@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793340076; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Ux/UFuXxomeyORdfFTzlVtMlH0joNUz+K5vYGMS8MOs=;
 b=zUuxdxhuBcLR8U3IQg3Iv054zxt9xGDwIBldKBF6CFaHA+ue0fpUG/4QbRrBHAyzjq3aGRwaz
 0/2iRE3l1MADNe8/cz0GsTnUlOawLNECCXvS+oE+fhoRK2QP984GRxq
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 5HDNU_GGvYePqXJy2NRi4qzTOkqLWhdP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXx90xyFeQSoAO
 ve06aEyfGecbEvOaI7n9QnyUSvRD3Hw3SITmSxRwsRc/GSehKQAgiuvpQ6bGMJ+L5fIhChbPLmL
 i5BHpx0/oM9AP7/61ACol7jnpWzeP8k=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae432cc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyMyBTYWx0ZWRfXzTPAJt5t524q
 qhwcK21QlZh/3fHfhySFyuPXtlr0Dgwr18U/62/XOeDryYjikLkEOQluggyUH1KTFWEOcWVlW2I
 3fwWg4FaLdiq9QLd1zfBdahYED5Jz0rW4IhGufxNACsnhjKtrBb7YfDTZejO+X+94PnOr4SkElO
 cuRCwAgQSbdHIWu62KQV4e60ggP7aCRDYaUZ9Z2ss7tweeXiTvRl53IZiErbeomIXf6CuHhVWwJ
 ksyL7ZpAzwK86G9iKBfMmc91XBbNBcJcxSjXaOoNbhapjXjKqhOxDIa/LUcC6yjLawHX8D8lVdZ
 witmppIWpqrayjql6hFgpIE2FnYkYIK3P4IJjFbqKwjP7rZzed5b0fvmzGmigP3P3JWDGsda/xO
 oG1aRyxqE/qatY2tzTtd2zOcvfPwO9q+9b4lk1mkh0sXlI2Gq9zWuwPX5aGHCvg6ovbtvHHsnSR
 G9Fx+XA+I4TpZvAbPOA==
X-Proofpoint-GUID: 5HDNU_GGvYePqXJy2NRi4qzTOkqLWhdP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300023

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 5981deb45d28..7d41fdf83c5b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1

