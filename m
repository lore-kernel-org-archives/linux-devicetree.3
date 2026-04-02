Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636033446BE
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097099; cv=none; b=u0lQTsXM8YqHufr8RikBAZkRuPYqd+Qc0Hf+s6EiCJuChL4oESpDHM1zKoz0T9Zg30gVixCxwJtZ6vUUoOBIwDsQoNOSv7rM3TMHv6+OLD/fA6qxMfcGfWX1XepNlQ0kS3gaCSlKlz+SW3gWlL3LGVq5sVp7cbMkoltccif3vRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097099; c=relaxed/simple;
	bh=1kCOpM72dPu/jJ2UXAO+VXkaPzHGqBbkHRFOj7DlmxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBBRmt2YnSYUcUkKwVHi6n4JVOhEA19cDxFdF6Lary+F2HKy83U0Pb20JfteoRA8xEPFoWhzq+bxD9SIVqyAObd9t/75Gs6IVVTWdLoDsjQ8HCw1e0aBvRSUxCVQV8Mbm0jTLjM0yskuGQzi1Gw2y+IUzXbLDmiGx2b06/JRaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqLWNnHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2EfeUyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqLWNnHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2EfeUyN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4A2t3335163
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 02:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XFMVSi6m7jTvlC1WVFvR2BivIrVG2cKO7pszfgNPw20=; b=OqLWNnHfMVphDupQ
	46fLr27Zu+ero2zaTVibn7GLhlyofO9ryHWp7hgrFvuf0BsGogdfe8d87s4Lgde4
	p08unYBdZjxlm9lNGKHiGUiREuge742m1i/lqRZ0D/x1T4zgWbVq4ibzVzKj71bw
	XqUEU5a/f/GQlDsXPT97IECAaFZ7cVImrrNPIYwcCscieOc1y3+HDssG1+HCSZ8U
	JPYimxEKqj9wCwosmVSCcLuj45NJBzF5W8mRWnxdqPtMC/VkcgBaOvXsxu9xjH9P
	H2s6yDAEB1M74BhBhlqjvzwAkgVDgIxp+emK7I/Zp5vHH8lMW9ExSElitIatroLN
	SfKN6A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3v5hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 02:31:36 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67e1381ac1dso1715722eaf.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775097096; x=1775701896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFMVSi6m7jTvlC1WVFvR2BivIrVG2cKO7pszfgNPw20=;
        b=G2EfeUyNbSf+iZl/IQoxXvrXxUEB5z6m6Chmif/jqGFZ+/If5J8lddZUSKPv5X9bE6
         wuBES+8UjLMCw/OFJVBC9ZigE8OA59T8ADec3TmrJuR2ckapXFZMoojbl477fguCebbe
         Ew3gAWi8DNOUSypTS34Mi+AdROuGX1vAgqrKnh8H/ujr0MXkCsF7RLOIohfgugEXEEdU
         VOeg1N57xCmE5ojWgFGguDxZYdrljBapEiqlcIoocd7RnNPJLkd5CT4+rFG85fRR6D4k
         VYluusP5Pib2nk+eLxH1JkWkooDVqr+VGmwRyukQyIOApDHoKqFFXkgmzMm41YSGL5zA
         YvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097096; x=1775701896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XFMVSi6m7jTvlC1WVFvR2BivIrVG2cKO7pszfgNPw20=;
        b=juFDvb0EPYaSHWRN4TQZ2q9HSfSy45ykRjJqpf9gc/MMyZf8rqeYy08OCx6t5zQOKY
         sZ20ekgU1YhfLB7frcOFE6cJOD4hK9I49xi6BmDq5TtV8xbUgHgeY+FDTr9AtPJ0be7n
         9JnqJygW5JmkdHzqoNB8PyB9URb869NQLNJZF6CmZIkjd0z5p/WBAliJnURHHnbvaK+n
         0Ilul5A/9Tey48AAopjJpqAteqXcKPJ2yIJCmKC9FPslu0yhPxmbIg90pJIHswVOwz9F
         eMJccDaFZDedczq+J3EiWJJcAlC9inv9oUudiAlDZQ2RNDGzvx16ipE/7s6XWV9C9PWP
         4ZcA==
X-Forwarded-Encrypted: i=1; AJvYcCXVusiruxMT6WYR9nUK8LQ2d4lqFvjKlpoqb1NleAiYsPlFF7dH1tWfNLJjRtgh8qxPlZJTezyxBR26@vger.kernel.org
X-Gm-Message-State: AOJu0YwrSMbmGtEC/epY2/WavQlPaLWFGxSpgcXjQDxbNOwM/+PDED3h
	fUVDKg6HxbE6Q8zYRHLDGg6FMQnth4qtdlQ3bTBk1gK6chJIKpVjwBTxWSecwR0ZgrUgB5Spz96
	jhpaLkd+2iNjMll5ZN8OMCIkkQ+KNnMEZx9dqTQpqpJawMqKffbURX0dkSA5QNg5S
X-Gm-Gg: ATEYQzzbGBoCz9x3xISqDph1GwDgl4yJ+PrMYL/kj21L9KKBl0h0lUsLiEW+eer8c13
	Uhi54gFfi3TFTjPPyayd02QtEId2HxPKdI8z5ChqlMzfU+NAcLLUWWVrjQLKlyohrdn0Ky5/Myi
	z+iNAy71G/aAEnGZ44yFWX2iMbUGvKVsu1w+VpbgWOhGp8nzUAWetP/nFR3RThaIbaOiRbY0vl9
	bM17ZnKOIdGjNX4F1UNUvTS/zAYr6mPMz/O1SuYj0tyEdqCDhU2MntGFdtuhuOyXEGoEGWGY7sh
	wzoJ5sdOVmk/6a1+fOpq7R6a+hWpMY0aOY9f4U0gQ+7JTzCtlXmxHoiru3sLEu+1PXJUD6rVpyJ
	IE+6/IVBgiy7DtuBhAlxppnYjr0kkiNfcytgl8VzXgOE=
X-Received: by 2002:a05:6820:3083:b0:67e:9a9:5baf with SMTP id 006d021491bc7-680a5ed5871mr1173066eaf.16.1775097095707;
        Wed, 01 Apr 2026 19:31:35 -0700 (PDT)
X-Received: by 2002:a05:6820:3083:b0:67e:9a9:5baf with SMTP id 006d021491bc7-680a5ed5871mr1173054eaf.16.1775097095301;
        Wed, 01 Apr 2026 19:31:35 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm990215eaf.8.2026.04.01.19.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:31:34 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 21:31:27 -0500
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 IdeaCentre Mini X
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-ideacentre-v2-3-5745fe2c764e@oss.qualcomm.com>
References: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
In-Reply-To: <20260401-ideacentre-v2-0-5745fe2c764e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=1kCOpM72dPu/jJ2UXAO+VXkaPzHGqBbkHRFOj7DlmxU=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpzdUCxwhyjpkcYXJCDCpDIcCfSIFLfIiifXiUU
 GoutMRlDwiJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCac3VAhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVImA//YaHut+qYLpdZAgGfGt9wPBiBpZNz1TrYbSiBWAU
 2fVFsIQQr9n2QFuxlcgIkc03xyzks43kkZ/cYur3dEMmb84yQBEFGiSYzLRhVanzLN2oa0+pa8Q
 mnTJL9VaAzltCUbpEOYtDBcLewhzcAKg6QAbBva0H+6SPNhS6gNRltDKHHbmsUkC4iK5fZ7aC9W
 +4UDZ6Fz6Zpa/BY3a54MmvqTJwaJZyAoqTbTH9ayW6CBhF53RKokIwxhvReiXiJ4wYujmm1UWlL
 VngfYG0p1q0djWZ0Jf/jMNKHTfEdniFtSSoLUavHqPeAwqm3Zxv6buwgzy1YmV1k1pBx7DVyr1O
 Perdtn8kNpjkxDEp8Fm4JLS9egT/wWx8+62zlEjhIy1oaE2BY67uOqdNc/x9gAfAn7PDdIilbaq
 FjQmZpbCJhkf4C+L+dpy78KBGdgIAqo/lCJlLjD7MNJTt7ocMv+DYnB5ZDPJxp4yjtRoKjiXSuu
 1HHsPj8rcXpQ/JuqUzjtX6qJBgoryAyPFsEqNZ7nNfhU1j5cnHiceaDTAkd2XX6jfGqdxakuOyB
 S3nIWI4aks9sbV1jZGMDOuX5/oubSDThaSemmtk3bjN3Z8ugGR6o1nGVk8/DtQLlg4EWkMoSs9B
 pTNcu3EypdAfJO1Q/nCcDu34xEttiIE58sdRgcX8P5Ck=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cdd508 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gyDl647GgXGSOFt2m_oA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: fPEIOsIkaO8vQ8bc16y_wllcPHnq02Sn
X-Proofpoint-GUID: fPEIOsIkaO8vQ8bc16y_wllcPHnq02Sn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyMiBTYWx0ZWRfX3exL4MPSj6am
 YXW4XWqV4qewIDagk9ZIW/yn+urWnlw8JW3UPMd8P7sXjJg8AitOhcJbs98USGirQzGjfuEOrY5
 LeTKzZ15UWHsvXH52/o5BCVbOMQS5K0y99Qmwujmji/So1JHxnoYpfmkccK4MMISUJHrU2WT6PG
 NbmW7Aas4bZE9tcr+VQScI57+LUDjjEj9YbnEytiWQS4aVE1OP4vbxnIQubrmE3wf846P4w12V7
 P4gjkhzL/0BBYWTWnvoAsadbLdPeEGl7ty4w5yA9Nb2n6E7YWoSnh39bBf0BiBvTxKaKdm/Tf4L
 UhJGdY4EFGqKQejWB3RXJC8GIuxBiFX+GTkAppDAkpZ3DiKKuvWkWPR7ma2jvvghS9wRunruBsQ
 FvIgKph8EZEpFU70cBBPLzr00HTomYhGuiVQf1bel+yG5ko5bXnJESy4fGDeqpZJ1JI1i5XSl1G
 m/1bA2QiXCfeTeP4kqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_05,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020022

The Hamoa-based Lenovo IdeaCentre Mini X provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9292af4a76d215f35c2fac28acfecbd199296daf..9b06a69d3a6d76c9e3b0a26be4cf7880587e8b3f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2299,6 +2299,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.51.0

