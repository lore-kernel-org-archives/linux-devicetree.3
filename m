Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8053A3E78
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117501; cv=none; b=jJs7GpdAlu/GC6Hm9CZ7ZowvUytRXLHj90zpE8lxV1uRAaAASuUp2ZmK7Ao+flefcbpvK4UQai9GMJ56OFnmdG+r6f3+Xmm6n8xLJDiFjo6LGYorokOB1Fbbls63gmxeVPvPEAjpDVZ1yWcAxzpfnVR9VO9tFMoRGQHTPULvWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117501; c=relaxed/simple;
	bh=BssiN8tl0qU1iQXG8+lB5lBZKyz1PiocGJtwp+eWGEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnZi7qGx8D/xssWGtnWeIzGRfRBkV5/M/laXkL8OwZ5hHETyjdPK0RQsiUSEcWOaHBPQCYVD9JMtuGx9QXk+t8BE26xdQnB2iBnu4TbMNdc4pTjH18VZx7d/4j+P7RrF2Fuo/DMoQ/sfF3zJc5fGM8OCW0VumFtca4Q/kkh6Ass=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfqF+dvo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DG1X5DSu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfqF+dvo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DG1X5DSu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63271jOu1964880
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 08:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eSDnacEmZXI
	09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=; b=CfqF+dvowD9s0QhWzwX1dXqey1Z
	T9ZpC4k8ZVF4hFHsP/E1TaJbOKyDE9GVQQoXhEUYzSYrpKTBassT9RppSxxb0/wQ
	ecWvwifwjmUlD1MUkWy+ZJVjwDGCSW3LVdhG1qpBxX0vMJCLJwUVb0zQYfaZSqpP
	+Goj4VaNHxV5V8CWZOLRV24/rxTLIY8/8VIuSAKDoMSR61+l19j2G56GNfLI1HPx
	QsmaHh3j9HKTu0Zus2BRTpjARINLso4ZjUcCxFalEbJBC2leozFT8mnDpNnnxJno
	ky1jgDPKnNcARi56KO9HsqiiLHfgfoy57SkqRqCR7/97hoThb9skwhOd5jg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h237h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 08:11:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093a985e21so16338611cf.3
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117491; x=1775722291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=DG1X5DSu5SG0U95yTjCxBKKGUxnRBZWK7zjbYmkfJM9zNEUxPv42Z1OmpirO3bh4L/
         ISGUIIV0GmEvbe2/Q0ElAeCuKd4/ea1CPosbftMtB+rVqrINSJqJBjn397coYJE/GT/Z
         3xojJMFsy9SgSDxKVW+ZU3ExstjtIYgvVX0aCe5txHNHl/vpvu+nGPQMqNH7f/quc3kA
         UNL45lm9kigFMoJGZKjSppUy7h2UQn8l0dT2D4l4afc2D7mqZHwTnG/PMRm7qekUjAIx
         x9Xv4fQG/PtkqcN9TJ1PsiIXXPMMCj0BlwDWeIooTeB5V8gOugLp50BNOt1/UfwrvtqU
         Nhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117491; x=1775722291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSDnacEmZXI09UfS9vabkH7g9erGJLEY42mHV3XwiZ8=;
        b=AH0Jgo5Cvpr60xyvTDRYhUDjIH46oy6b0DHSLYgiNknnt9nOBV37w2DxcQYLIlFznJ
         pJPpTaCx8BG3c+/okOz/8v5k0zaPjG/MFCV0+xrx+z7733GwzkOCbd1k2HP7MDUcjgNT
         HYjqRZTVGRMVl36npylJmUOTGM5XKnAzUeqBYA+MWTN3voFn5mtUAXBF3IlTmosytyDj
         STuKTAKmbY3DjegjdMNCA4q1tz0uv5de3C4+qsh2XSsImsxdtvIqUliQzb19RqkqarZG
         oTcW7qC/byeuA7MpFPucOtXNnx8X1EDYkRm1cyexY2mYQTbNCp0SRrrgeB5aivI6mgEK
         NDXA==
X-Forwarded-Encrypted: i=1; AJvYcCV2it5ur1bFyruISWkt+rb/UhDXgXN/AQZxZLt2Kx47Lt0hD4cWlysv2W6X0vJGjr9M9o+2uAiw9rcA@vger.kernel.org
X-Gm-Message-State: AOJu0YyELdkbtuKJJ2qN/Gqfse1uc1UThHFizZrWOuhYA7J4WJyNIHis
	B0VP+x+cKLrkMMQJl+eMCnHOD5KHZuO9N88E9ZNXT2yQyeWQNdng11PChKg3gl81K2oAyY+OU92
	PCYpMnTyX8IBsocTwcWXQ/LIWZqKE0sHqDeSkqJNlEQhDyYuVVM6vYg0OHMyw1lio
X-Gm-Gg: ATEYQzxXPb2tRZBWdUP7iO91mDyRjLaDdUenWl5wHsxhC6YHvTXERqSAAThE65yGIx9
	MDqVgf3LbabazIhMpu1wvNkjQzpQEm0KKw1trEzQa2UiWhWq9DTUy0ojYUNEvjrWZ99BKsHY6Z/
	QzHr14Ewqhsn33MPlislfvHIKtCScuXStG6gD4Zs6dRJSgw1y5uaLKf7FiIioV8JdKuMINPR3er
	b/s1uC8ihK0yXzFaQd8ZuXI2V+DGbJvLZe0EOuDmBXV2BU1vZWhhMFKlHN4LyeSAAIRx7/f3vGJ
	W2GNuqgPEFfyvCCFILPxnqYxj7C/4NOnpnZP4URartXy67i45a74L73khCd/JyZtnMpKy6Dsjl5
	nhqDxG/B2isDPUfeby8gLnDSMLMVdkBVkk3DzQj8ZFdhc3ZcIr10GsFE=
X-Received: by 2002:a05:622a:54:b0:509:2858:3c63 with SMTP id d75a77b69052e-50d4bb5f1c9mr36507601cf.23.1775117491406;
        Thu, 02 Apr 2026 01:11:31 -0700 (PDT)
X-Received: by 2002:a05:622a:54:b0:509:2858:3c63 with SMTP id d75a77b69052e-50d4bb5f1c9mr36507241cf.23.1775117490889;
        Thu, 02 Apr 2026 01:11:30 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v9 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Thu,  2 Apr 2026 08:11:07 +0000
Message-ID: <20260402081118.348071-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce24b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WbEMVPVtDBSXEMPt_8MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: adMCigN2OWqGpDyTXs4pckqKRf8wkqsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX0wxxQSHljISm
 mIw8lkSONHvU3MQyFSEanN8+eJpgjCNyRsL90hoRo0sgl5a2zFAdD8bZ6JLdpd+elWt9dtxyFev
 EtWUYSIghooCW9etZ+FcEcA2NJgfWnn4OQMAEzj8EPSDydr5qbj6ZLcbXJzeYoJ40JQm1CaDjHz
 5xuAzRMIcNva8SsyCwylcZPDx1sij1WeeWJbySguNh8XmZLRdbIzbkbGFbby00rLU7mrxeDzpl5
 ekIGJozkU0wTc++2GyIZYL2heKObLacxVE8p2wKw1Px1n0vtyLbLdcLuRP5EkMf4Ux8Lbi38Ddl
 mm59Iu/yZBjfvOSHueSsITo399rJJ+IC7jQRjiZZ29MwnzGmwhTS0VWNbFrM/UgWwo9+q15glDa
 ycTq4SLOSzKqiZ1UxZV/M96q1bDM2EWZ6siyrx/A995v/qYyZaPUdjKaXgWgl2cvM33lwEiEqsi
 rrB8sFZzm24VYsxutnA==
X-Proofpoint-GUID: adMCigN2OWqGpDyTXs4pckqKRf8wkqsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020072

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by depopulating them in remove callback.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 069048db5367..2dc525c8be42 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -762,6 +762,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }
 
-- 
2.47.3

