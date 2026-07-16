Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F637E5CC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218722; cv=none; b=dytbDRUek0bYGy0MUA9/LYY79Ywb9oQ6AWvaV4Y/wSRsIIb+aUsGm5asWNnTHpifPiTBBU00F5IuC9Bu3ONLSjKCSKufNjQSAn1XmdqyTK+w2UMp0DVpm3SzEDlsgB/A/y2vgevezLIUGvGRyUe5ruIjB+hgPleSKOe0THhFeTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218722; c=relaxed/simple;
	bh=+a2PwVdZXIN3LhIMygJSk6N3n7PMH7uL5OC0qbZNTaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGUjtEkCRjgBONcnu4nNGZnczgnUzNQM4c4lkeaIgR94jlshTKq6qcv7rU8XaIRIbqEhtT3dl7j5Jw+6Arbqm0llMbLkbjmoFGJD50MjIQXFLKhOqn58qfP/J0/JBijDrKk91jIAg7kv+tceNSXLsJWFXYQlHCX9X0ksmemPhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYgQrQs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwinWmL0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYgQrQs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwinWmL0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJbs92946527
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bxz9ivOcsV3K3IoCDrb+Cf/SPwDvUEWG7a6NEPjdfs4=; b=GYgQrQs5ChdhQ7ok
	ReS1TaxAQ007HtFnLTqhwEoCVtxQ379eB+DhXh9+EyB3WcpPU8tjWydTQzd+WbsY
	oiOz6wf9BlGenF6QpKTBp8JUVF9NoDGQqQuTd9c0WQtE7aytueC2hYjZ0TSxsMfp
	Ozzxle9TRnByuUSVxKviwTCqzC5K7FDVPlYrgiBBroOrgoyzJSTp+ap8dP39G3TU
	1NXC+PRyxXiNTIHaT4LNz6d0jqJEx+ls3OwkWOlfWekpRFvkJDXWnT0BgQp5AcFC
	Jy4dP07WLACoVYkYxhQXOHrsm/d7UTtWSYKzoVrsdCwFil2gdAEukVqJpbl477qr
	6UfDZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wbf8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso76922771cf.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218713; x=1784823513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bxz9ivOcsV3K3IoCDrb+Cf/SPwDvUEWG7a6NEPjdfs4=;
        b=jwinWmL0nxCwQlr3+JBLMWqen3zzkqEYXZCFjRKXgf8HzsePXWKugihbD8SLNwZ7rD
         R6cGAri7eHBD+mA6/3ja3KGuDpMUQIqjsBRzlsqri/jFXRAWiGbqqPBTW84m9fEWfE0N
         oDY2QKocXSzz7TxSSe6d2By/gNeEVv9/LNxx7UicFKUjT3GboIbtqT3oGVeJ5OHRO6UZ
         ZdYK40WPEEtsmTpgF9A+HIxJhdJFoET5smc7DP2+sZyf4CzIliydf4Z4osBh7geeGin8
         Aw/elL4C1K4ljP8NLQMuxpQ0LqPjZtV8HIn4wHwrymI5usklAy4SRIDRN5SaBLH6P4vy
         8Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218713; x=1784823513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bxz9ivOcsV3K3IoCDrb+Cf/SPwDvUEWG7a6NEPjdfs4=;
        b=jjjN0n2IfiNKqypT1Z0eWCpiehNBAwHjuYRqGXc5nZm1Gx8ueO0vxAFeYt0P/jfsFc
         5EFobcgJznRZpTteNC4n5xz4b9wQU9H7zKwjnQIL+TPO6ZeNi7V5K5wB4Vth1oSchiCX
         2vPgTrCSm1nELxApGRDDq4Jnf2DVA0x893pD+QL9BIvUN1WNJirFEm2otN7fvGAz6e1y
         k+xaq6aVONuk+Cwr6NzoG9U0E5CCYeAhvq0wBae08qI8CyDQZMUrP9lE6qp2UG89naqX
         40oOAtuyXItMRaUf9AEBmrOaIEuyQB0swOhGEEocFyQPvlE7O6p5wllqWGzaxovk2cPk
         lA2w==
X-Forwarded-Encrypted: i=1; AHgh+RrinqOwrkxY0ExtZlrL8Iqtt11KBMqynZ8c3w8dx4BH7OjJ/JgOIXSTOcXpLnNG/UM4ddRFFZbw903X@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfqfNfKTG1FGAF6uh4PPtKMdc9yiq5cEbtw4b59WXVAzOyybs
	/De4FQzrC8Jm2wF0T7UWkAdfSS59EqArazCCsL07LXffj8uRUKffqXAuojvCRYnyE8VUPbMpOqJ
	79dAB0h7MYI4WkPYab6akU0dyWIb1PwtPHJZKR7NLAcgYtTilL1/o/cWcsTqHjHMx
X-Gm-Gg: AfdE7cn1l9bWMfjM3p45bXqBmfDHZI81j2AEE/jbE1h95LTPtC+ZYVL257tsxQYmwF+
	yNN0D803OKrqo9BKUZoBe7bGRNCZPL+jrfeUPZT4B20bdL3pp7NpsA544n8FIvCPeuDGk2TAzpe
	0oEQWXerkI9nroBZXXWlhXzgrm+lxeMfy/wXSNzC6r7x1J9K203nVwqI2hEHUXZrB8o85rfJfCJ
	f35tfWwyIZwTAOvd8u9pLOEb4ivhP2h5eJA+7ke+d2aznS0uBnNTGv6WSi/XQdsi4vzhXC/yYku
	B8tcMwsH2vfhRGWIR17rq4GO/1uDj4zu8TAnkIlU/CvGG0DwJgC6kknjRVG1QUPpobwZEFpk6yt
	r3+MLtMbxZyaGXLg+d5uWfnA5wfo1am2UgO6LovBOQwYaBPn/Nl4VIFJ63W/pbPQlLUEIljSvGv
	cpC4E3r/gmYMwjck983C3XuW+AHiQuqHeQPjbuCG+AsHOraRrCRhU=
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5fde with SMTP id d75a77b69052e-51e42497dc8mr115017741cf.74.1784218713350;
        Thu, 16 Jul 2026 09:18:33 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5fde with SMTP id d75a77b69052e-51e42497dc8mr115016901cf.74.1784218712393;
        Thu, 16 Jul 2026 09:18:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:22 +0200
Subject: [PATCH v4 05/11] power: sequencing: qcom-wcn: Report power
 controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-5-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a59045a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QWuo0IUDA92h_ITipQ8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oV3RzCuIbWhBZ9lFynajKjG9_R-fH3uU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXwxiwt572NrCR
 TMry1Q/9g8/ULG4piivsSE9bjfoi+HnT2rOi+1Wv0PKLCdObz3o2lGF6nyMd7GbcoAitp26f8ib
 eeH1pEA5MUN+hXziiiYxRowi/zAAsE8=
X-Proofpoint-ORIG-GUID: oV3RzCuIbWhBZ9lFynajKjG9_R-fH3uU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX9CmG+g/vFpum
 nElk9SBF8gcUVpjNgBrJWJMMViFL88h8Uutbb7LQrTD5QvjZScF2D6emMt5e4vFwON2JB63jNTu
 9mHiBvbKbzAbpTQimicGJrfwdfMgjwXCQH/FI201jdiTw81kHjGbn48rW1OBkswr3FnUyJ6o0I1
 CN6FWADY+7kLyCB80v3+BoKfoN2UBXONJYMPeizhN6rEEecYa3JMyjX9TdtrCZklPsI+4A7CekU
 cudgnYiSXWC3001QdDxKxOuVgspiMmX0YesFtqI56g6sAbFCRdf4I1s9v+QI9EoB+JkdYqYHGq6
 u3RJZf8S2q71Dbwk6PBLat81BgXVDMxRGHrYgJsXke1xkRXfXtUDoobyfA1Kj1YLSTe49f7RDwK
 lR6gVET0mqUdoh6e5AncK/btiTt50ZurA97q/j0Vkx5EIwP7R/1snztKMca6cKArqW0IXCFmS+s
 jRsukJ0zbV7lJSTddog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

The "bluetooth" and "wlan" targets drive the BT_EN and WLAN_EN GPIOs to
gate the respective functions. These GPIOs are optional, on some boards
they are hardwired to an always-on pull-up and not routed to a host GPIO.
In that case the corresponding enable/disable callbacks are no-ops, so the
consumer cannot gate or reset that function on its own.

Implement the .is_controllable() callback on the "bluetooth" and "wlan"
targets so that consumers can query this via the pwrseq API.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index b55b4317e21b626e050e022648147770ca7f386e..19b51c94653b7f8e7e1f5a2fe906c0cc1cd46aa8 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -184,6 +184,19 @@ static int pwrseq_qcom_wcn_bt_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_bt_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The Bluetooth enable is driven through the BT_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the Bluetooth function
+	 * on its own.
+	 */
+	return !!ctx->bt_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_bt_unit_data = {
 	.name = "bluetooth-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
@@ -218,6 +231,19 @@ static int pwrseq_qcom_wcn_wlan_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_wlan_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The WLAN enable is driven through the WLAN_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the WLAN function on
+	 * its own.
+	 */
+	return !!ctx->wlan_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_wlan_unit_data = {
 	.name = "wlan-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
@@ -258,12 +284,14 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn_wlan_target_data = {
 	.name = "wlan",
 	.unit = &pwrseq_qcom_wcn_wlan_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 /* There are no separate BT and WLAN enablement pins */
@@ -281,12 +309,14 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn6855_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn6855_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn6855_wlan_target_data = {
 	.name = "wlan",
 	.unit = &pwrseq_qcom_wcn6855_wlan_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 static const struct pwrseq_target_data *pwrseq_qcom_wcn_targets[] = {

-- 
2.34.1

