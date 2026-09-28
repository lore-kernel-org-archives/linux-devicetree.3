Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177064DE711
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607115; cv=none; b=sl/yvFCxlNGptCwf5jWmDbk8daZncDzTUpHU/BfvM2L9VmNAxvE0vLiOtd0zQ/7+NVToNKdfZbMywJo33k3f4chiirqz+h/Akv1N4IXOcMW1P6QZPBwgS7wfJir+wpED6hVTSN6+R83YdEZbO+spCpPsobZbYAtNo7hXIihaUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607115; c=relaxed/simple;
	bh=RIbldL7RmoZJB+4oI+sOM02ju88vpR1QbLJnL5LcQDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdumCzeI9P1MmHKEYaYDHk3gcS94FoWWl3zEjnMFH3nAxsTngWczboNbsyqnDCP1tAB5yQYgir6OlonX5jGcAjn1+q6naLOfL8OPxV3li1Op83AoX+sYtWBAiaYuSqqyUuUDcWrX6URH98RtGlO+djGALoLU3QALpKtY/9OhdB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fks7Ov+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ey7q3/Rs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fks7Ov+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ey7q3/Rs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdrPb1908463
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=efWurbXWJr4
	abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=; b=fks7Ov+ERMIEyZ1hg6hQ3JQ+JDx
	9jovEp7r2GLunvBLLOGliSH2RQgbJqlnnHzwXockoEtJzU1KTfYZ/EwKxnQGj1DH
	xDW2DygapA+oY1eduUgPvV4wO1uDcjEUs2132N/eqsLCu4EMk8OmSKBB7oSnKbuu
	lMpan3KMcK0dUHxEoCnRRxjsKBIn+OxAn9ojvfkqrlLmR8WC0YI3loaU5SGBLIWw
	a5o0dLr6DvdOadpUYyOzuckYXY8qX5DVhoIMMMxZD2V2MZ+zFXULYfFpMGXgSCkh
	3RmakP8R/X2zqOhQQX+8esai0dfpzbqUO09EJr0mvv1RrUcVNuUkS9wr/PA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxhy97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:51:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a04805f8f1so2737817137.3
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790607112; x=1791211912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=Ey7q3/RswWetT3vX3F43QDjmWQfN+oxPJRSWAOxNpxn1/Z3aMMCK5GW7VND5To5mSQ
         BNF0rBiN0areV6Ml+Z9mMy2BOz5pgfkekOm5+SY4f7NyBdQ+Pkh42S+4H+jlPFixnj5d
         UNP71Lq4SwGN5jkeG6ZqVG7SeYirRXfkp29EpA8Jrhe5rjsr1dVbjiY82AgBjHS94oeF
         dvDL8EMDIBta4sAG17/q0CJ+4Fhwb9+qZkOh+bx21wJgfsUBSlXY7YA0jRUcXC33so9m
         EoebANRBGxgT/0jCEUA4TenaBmdIwd63TdSAQdBQriWUAKa8/pkS1fTx8coBJ/BzQT1u
         1xsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607112; x=1791211912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=fR7BZ2ZOvf/c4M2ByRpdVer4ThoU7C5QA1lgg4+7QQrnW5Zij2yH2mZh9h45u1tJ0L
         tdtNF+oDxgRJ10Qi6oMZhxLZJg6kOMwfEmW+Emwack0tTOc6alt+tABVXVhm0ZQ3FlfG
         oB8U0cGd4PTdEaVvWhg2XjOV8owpoLmcL6e2GDDmWsuRGwyVG7GXl/AlJSfEw2ewPc40
         ieBQzeAQm5TBlx7oiVYqGGcEKIg+P/j7qltpSu9F/o6XjNs22YjERFTuvLoKg3mdWycN
         pMN0rs3i09T1ohITkiRwo2tagKpaY7QkPXjJ2b2DJtPRGmz0guakJVib9hqCbKWTXAt0
         s9xg==
X-Forwarded-Encrypted: i=1; AKwUvBxH/iIOxBsJ9iNf2yXfxBKxVZvHZ9+C3fCwk7w4eTGw9v1gaGx+zwzVeNyPEHZLcgBnNGUMQSF6rDC+@vger.kernel.org
X-Gm-Message-State: AFq9FYJVrqQSUtHBNZwDrfs3xul5ig/dV91FNqBxLx+mF7XR0a9SsJhU
	eJB2tBFeMcAXWupetAiTDh+G1Kwu/HLBfFr5mF7lLHMqAheQKzwMQAP/1ljSFj31wEt9aguMGQe
	hUvAZUmNISQ7OHVxe9OiAbE6dFq1kALz3wvazjQr0hM0AnK8xce8w/zOSACJHCCw6
X-Gm-Gg: AYBFou3lNzP6Dt7Q3BhPFQA4WUukt+Z2rgkMPNyO7Jfa81bRDRN8QnVDSGJ6T+wMP4V
	r1InaHuIwOUBAxm29bVdKXazhDOt8yGU4CkDDOFDLb+5eVBZN5eZPAByLyc7WrDVT+E1XzTGYdJ
	o0H7wkrKEYIWW5F0WNONG8w1Y+Izhta1DJp2Ij7gflG+YCAUvg/QFTwbdzYJExoOuvkAKZTnAsC
	C/VvddMREKO+SqocWO5zsfmSox1WEZKJLiWSUVF10rLNOH7c78+/zj2WJxncW2gFaNGh3tYAsiw
	avUPp0Yi65P1rfaX4O25qoubO+0d7IpGqfE8eHqIdYLSP6GYZ8cSM29LrEYFnSBXZIz5uX95Uc8
	cyApGjaS4n9TE
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de2 with SMTP id ada2fe7eead31-7b34199441bmr2429266137.35.1790607112151;
        Mon, 28 Sep 2026 07:51:52 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de2 with SMTP id ada2fe7eead31-7b34199441bmr2429216137.35.1790607109922;
        Mon, 28 Sep 2026 07:51:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a007fd1a01sm42777315e9.0.2026.09.28.07.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:51:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Mon, 28 Sep 2026 15:51:22 +0100
Message-ID: <20260928145122.1337186-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JTqohjaQNUc9rNBo1vOfodjhVtd0IYio
X-Proofpoint-ORIG-GUID: JTqohjaQNUc9rNBo1vOfodjhVtd0IYio
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX3Heb9ISBu2bV
 yrNDpVUwcTWNreHAfalsaELJtjSJwFiHqmgwY+dMSBzh2gqzbB59WUCobT/yWwrrg/s/X9p5doj
 wvMb6ItH4uEdYp9TGK3GemwE+WvMpa4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfXwO1F67hlREcU
 3YZt2KTF1vN2B4UeGaAXb+gd1DkLhgbJSENoFXei6rtgf0JD9tUrdhjwogRpPRTajnA3ntSobVQ
 a76ziO6wboKaDTu0uK7lGEb704vGxQekHuW5Pu7diYBaPaE+cZfIPTU0EdATbf99G/a9mBQ0Hvl
 kD5y/aggYZjZvZtLsGo2J1wcHXwYL0PkdEfmijXVVUHKBMyduGFxTzK+hY+rukKD4C6gdEZ+DSi
 WUjhJKPA/+KiJPVffVCuPNonwCeC1YB1cFEkpn+FYPgcE/OuhDRZgA+WBqgVuxzx1HpE6nLLmeK
 vNbQflUZ8/XjfaT1VJAtmioxSSh4q8qHUDv06/WN3lY3GBNzMNZ/9q1xklUyp046bZxfqZcR2Sw
 fs/ILSb/D5MbMYzyPIz0mqqWqYwI5q/Fd8iIss15ZsNbnIMvyCLelk7z8cUJwq78TkK/pQhaz2Z
 lG0U0po95q9VN1xgD5g==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba7f08 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280059

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 899573674c2e..43e250faea75 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2244,6 +2244,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "lenovo,yoga-slim7x-gen11" },
-- 
2.53.0

