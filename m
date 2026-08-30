Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998A2E737E
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064204; cv=none; b=nzOhpVDhqTlgEt30mBLOS1buezk5LvenNq6hbO9KP5WudXlm6ag9215X8spQk04y/clmQN6qEETKjcCgQDK+toByiR+fTEE4t+pmii3cllE1HfiUR9YrzO2DzmIM6QQ9OyqkrrmDy1W70hc/mdu5TlJGSe0IsmVyNyzCQz2tgY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064204; c=relaxed/simple;
	bh=gSbPk6PQOjTbDMU50WEy+eW/Dadr82jN0oB9jeV6KJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVFlTUHmz4QE5dw/JpKc7MCaKwfi2LysIlVdwIG1T9UKcBGr1pe1YwsL2oDRNZwH2jkwRMc+Pj1jqdO725KMHy0Ya4QP6z1V7B8t/Yqxa68eM0jwv3Yu6boJ0KFztcHIkCR01l6lEbx0APmC8oub/QoazJL7CIcgSBQNo5GxiH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1pkHtD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyuS+ItU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1pkHtD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyuS+ItU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2RJG7412178
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V8gw5TeS7xi
	QV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=; b=a1pkHtD/9FcWf1qKoI7Fwcgjx7p
	hqV4VosBeZ7XHhmdi5oguVdulBA75fW+cuO5p8nwR6rJpKEOJ54YpJTEfZtNQRAX
	G0XURRHgiuqbH7kByowdBgVXww/+0adu+PlZ9Vy/vdi1wXTKy5PSypGEIceUcamS
	r5RT3zPglW7/mVgIGo1RqDl7LkojlVl8y5UdG7P2jDbQGaySYcnoEtpVX3VMqQ09
	uD/4mxam+ueZ8TM8lWPFVcnFPyMJp+Wsg2WOfZmCa1G0+2oO22uD9AITOzIS2kya
	uCAnMF8MH1BUiKX3uLOBA7JKkpCbbf7RRFAxvJdEcrxvQWNEogqiomxYHeQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmtb0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 04:30:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso4059883a91.2
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 21:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064202; x=1788669002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8gw5TeS7xiQV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=;
        b=OyuS+ItUQme2jSFkLIcK6KFl7DulqMQdOuNL+4o8j7pfqhS/o/E3nRXWAo5ALbJ7NE
         A1oT5/dPfZXa7CvZ31H+JNqBla7K8ThEiXUoNGisl6zUnXe6DUMaIRboCfu5tGYlUz9F
         9AwIBNev0NyosP22nkdCfqDlKooD3uEj6wSylbQgspjR5lGxJaLeXXKzAE7MXaLUSjjz
         9xo4WB4OnTaY7KMoQqZt/emQ9FoAl/wlPmPF6bmujQvYaWTaOqBVI4H3kcJExrNGMNc+
         +ycW7W+BWCDYz3XazUy7H7s5DY06c87qujV4Hl/NXvToWij8H7hx4F/qpuiJ1+ikKJY/
         wnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064202; x=1788669002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8gw5TeS7xiQV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=;
        b=I9RkmyD/VvueTn+Xg6f9DZY9zTyB+uXJsahMT24lmZ77SwWSNYfGw8GM/MNS4GEKok
         Xzqb6nIK/j2Ecct7p3oA1ga4PjB/bnktJaKMQHhd9YgEPxuUVvn1l3qUc8MwRevm6iBn
         UyO+Kp07hPfzTNZHcHNoT4eLhiVO+P2zkDOFEkoNhAPl35syW9TIs2O9WToyTKqQbex/
         NGBJpNtOpS9z+9wQVvizgG9n/GyQans5jJOJ+D6Gmd9o88bJGjhqFDIG0FqOhE48oeJB
         Pj/+YOqA0bjAyPL/RpmQTtPkoqcMz/bih1gVtM4v/8m/8/qyQ18Z91E2IUxUYzvsZfVY
         F+vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtAfbN39WY85xj8j2ruaMiZWBAPTl5wY1WNMyUYxJj10nZPTxUeeTtSSn9sovenSKIKpRTAtfVIyFZ@vger.kernel.org
X-Gm-Message-State: AFuF++kPgqptX4CwGVdL2P/97jVe9EksEFA76P965Lp1t8oGUDKCEZW+
	Nxl8tHvh+1iP9R0ZwAvKLtd5HbMsGBjGBryOI9H/Tq9zGRcIPCO9mXpE8b9ft1maZTcUcxdvuit
	6ju3V5K4JoH3fw8qHFb8boxDRAjevzY149B7BqmFJRMdq8nVB9FuA3OAJy5/7Wp/S
X-Gm-Gg: AR+sD12OB7IjnzJhkas1XxoLz2lOBO6Gxfs8Wa3Ub8Lu7W53HYBSOvEA1fOVCqby7/a
	X13jf4Jv9wGPW6M2bPATQ2tQZY7D5Gb3WDgDGVizh3JiM94bcVtTC5bjeRxADV+/cJ7wwz6tHa3
	3FPRHYakEjnkmK7E2jfWdXl/FsWFLlBSutkJWJxATLCZOuLaa1Ssg7T2wF8iAj8flWgpW5yxCsy
	Np5SKvo6RH9D4YbW0G177FQ9R3j66NIJCjmSkdimFXlZxkfoj4YSQBZNFNiSupoIXPYwuSyKLZg
	R+ppcd6gy3CTG+MqFwfiA3mghI7h/Lg+Qe4DSWO4YPZs3+kKQd7wUMBoDdbl74UqaOYkpF5/S95
	8N3LkHVFnFFDSj17C9NzIFuMYKlswWZEEyiRWlJjdiesolMCGe8GOL6/zDu5S
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr28341062637.15.1788064202071;
        Sat, 29 Aug 2026 21:30:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr28341043637.15.1788064201663;
        Sat, 29 Aug 2026 21:30:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:30:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:39 +0800
Message-ID: <20260830042939.144376-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfXykErEWLVwAtS
 hotoIkzVVAL/KRovktaaMTctxdMrXlP+vTQr3yenhB3oe8FI64noA8tA4NB03hEsbab3+petIK0
 wMUEaZ/z6aDYyCD6rsDUiQxw+zbl5rlkgc+b6j+nR0ItntBNMs2deNXqv1iD3dP4ZHClGC48OTe
 AyVzBUxy/hCRVaDkkVSKc/hfR7ayLlPjsE4OgaD06SuQFl/OAMguG4wcUfs9C/mX63TNgT2ujHb
 nPMOKZOztsRtj/4uGJUvyXQ4/EjbEPzuDTQIjHZEJjJYlMgPBfoSTZfulN9pi2B5ZSIFa78bssb
 GDhRqOuj9lrZSnWuvYv0Iv3TY0smue9Y6eN98m45QJNjM0C9zTk7eHcViI40QuE7cw0ZvHQsAD3
 YH5yiHUlC+doBXzlOPwgod9K4Uehkoqf5xnUSp4m+AsxLuA6TgTen0pqHaqs8/e3tYnU3pRmPau
 PoFUkCxVPnXz/BlHOAA==
X-Proofpoint-ORIG-GUID: XrFygNMuBbY429qcYyB4-bbIOgYmVIg_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX00nqcIHcF0s3
 6X51bqQcqj9NBnpbmBRukg9O5aEdzNHjTV4T1FMX1ngVT0SYq7NABH+7ulotM7khVyL22frY6rq
 eePI1s7dY0Qga6v9ltUa9g4WlRq0ftU=
X-Proofpoint-GUID: XrFygNMuBbY429qcYyB4-bbIOgYmVIg_
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a93b1ca cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=a0wLEVJ3kHAuhMsajo4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300035

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add support for the PMAU0102 PMIC GPIO block, which has 12 GPIOs,
used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 922c27177b5a..f6dc43e27b38 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1259,6 +1259,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmau0102-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
-- 
2.43.0

