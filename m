Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC903C9426
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269978; cv=none; b=Ipw9sV1ZG4SS/sFu6GMmqPLEufKj9uSFcpl6nYCKQMEOR81IxlBUCRcr6w7VPaskqegW04fFaPQpv1WL4HmjzlDfzXlu7oXmf0TAZOXL1uHW5TvZM403o7tMvZ/64s3xMMAiNgq/Z3ZJ+1vBP+2EG8oEyWaHsQ9lwGK3ErCOjtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269978; c=relaxed/simple;
	bh=nyUTaJzP8toGAdl8HalTJ9lS9wZuuQpE6XykKghAhR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=epz9J4+riZtrmh7lcx1dzT7JDCVk7uakCduc8ik485Yj5aS/W0NgriPpq41b0kR+EUv7ISjk8W9Eo57/+fc7hgGB5q6jM70dAYXhT1kIhdbuw8C02/0K6+7XxCRd4r6PgwhTxA1pl4FH+pKIeubELGVMKnwyvpPiaSJjHj5y+d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyXTwlq+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApF60oeZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyXTwlq+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApF60oeZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7R5Bj1636906
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RzwAq0zllA/
	1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=; b=YyXTwlq+7GbDNph5kyfsirCTIjN
	AYOykHnXxzu4KIBbjP2r/Gh+KsCWh14kNgVKxNBlWczX9/6YX4jl2wmwhjU1o5F/
	We/jXO2G1Xyazce7dQaNSFlbiGbjs0h0R+Hfw5x3sGTm8Q/zDnsXLgu86UxzDZ/l
	X8qDihS01AU85KFXVFVbXDjCH74v4gBs7hcIshzO4qmP0Nj3OsLx9VYDF+QJSWXo
	lYc6jQKv1tl+JFC49o3erl5UYjm6+tAaxHlCXVigHvh+y0X2Zhr5aOa39U8AoRNa
	XZVKfGauHoniTSJZP4H9QR3L3L+njrXgcA1taBLRscO5WBJep8tKVbdi70A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sbyfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:39:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7378ad0so49533835ad.0
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269961; x=1779874761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzwAq0zllA/1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=;
        b=ApF60oeZVkJYBgpQRqAQ/iicNBluyKxCPfCVVWe1fQ/jPc2T1woqAYMNoHN5AJAH7F
         RR6EOeqfg7cpI4WfXEeybGYv6aw5kfL0UxE2GHnbpvL6F1E0yoiUHJQkJPEgicaM1oXW
         D5bY4FAL99b9eXNEbFwzKL5Eeqo5i3KPISvxMSMhs8n5hmidw+aWKwNmicQ8zUyvHkgV
         K/arwZHMy5ncUQcQsjcxyKPcFX/+J1CdC9nch6nLJuV4bFoazvYwp/s44ElxscoPCtMe
         mmMIrl8+9ytygJOKHFV9/eK2HTYN1OnCe8VcUZI0PvC8i5x5CU2n3nNWCmK49uzSaTY9
         Nk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269961; x=1779874761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzwAq0zllA/1JavPJ3XlwFBcA15VZo8BZL5M1whyRJE=;
        b=Z4XvbWzWMDiopg1af0/ZkpozIRllZlPecye5iyMGyq9n+oCRbLuWP2QGRJWU7chksR
         +4V3fGvRyMJCluUbOWxBAlz8A03RBUQ+rZZO+lzX9Aj6Fcua+LPi5gniK0eCqcikA2QU
         LaEAyuRHUBI+B1RiyTKwSSUfoj7qi5dsLHRvPk6K2h2fSiB7lfVH7mzZgZiTsOcTktMV
         vnTI4FZYqu7OBXXh/S3JXUYdWaT2qu4arYj3cdXkwZJgVpLxe8p+eMYVFIZe4fPNqH9+
         oyFrlvzckaPaJaztbrHBOmeD4GDqzQmM9TmaavyZDGGIS2iXze46g0MEzRTSmDWbpkJP
         rsqg==
X-Forwarded-Encrypted: i=1; AFNElJ8e2IHVV/wNno1SB4gt2LsgWdoNuBEU99UrJZWMbNfSJ9FKWmBDsBKhsgAbYbAldCqni+IEwCGYoEIt@vger.kernel.org
X-Gm-Message-State: AOJu0YzWeZLn8k/V1oOiE3tDAYvtWb7Tn3Ura7Mc8Cry11734pxTaW3v
	iYFLJwSBRPtcA3G41Q2TpiJjN7ykCgjTGmepji0/c0O+Stb9vCuks7tcYCJZrlYiG4aS+PRM/Op
	Mbg5nCOHb8Ft3vXGeIHZEEmlZ2oBpP2J61YLeRbxI2pmiFukoBnJ61AujfzzshePE
X-Gm-Gg: Acq92OFXv+9iP9/NfTsfV0lFkNPdzsc5c6PVvniQRAQo1g16fd+jncHIgNMm1eO+1RQ
	DOVVwcpYoN5wh8hEG76+DCa1mcaPMFs7F0sq3S1kUtAhV/DasCfOnxu/X/cdUmhEdxgwkfAOw0l
	3htdASSNhwY5lz53WwxieS5Fk/dxfgW7HEvDfgRVwkKgXOhjdEwDQPnozIeSRXNHeFjhQ7WI/i5
	1/whkrKy4zDXrB4LuvRUwtAmuB/XlejthicnPQfrjQrKtrNBKDHqXYEsukoMgLi7SJjT/HEZsvm
	tScg99HGTo0VjsWWEZL2+4nzi9Efpqgs3aEDGw/HwtlcigXEoEIu2Tj6ZwapsYHxLMevf7H/VdC
	h1JU62WdNl0EcraYL8CM6x2uXpxVnZ0vbPeDFaNm/UNNZVWPgMw==
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr167294885ad.1.1779269960995;
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
X-Received: by 2002:a17:902:b181:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bd7e862606mr167294695ad.1.1779269960550;
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:20 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] usb: ucsi: ccg: Add support for CYPD6129 (CCG6)
Date: Wed, 20 May 2026 15:07:34 +0530
Message-ID: <20260520093902.2064730-4-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MiBTYWx0ZWRfX/HQkoXrn8X6F
 RylU5L0hRw9dckonwb7X0SgA+66L9XkDHUZLFaOGRG+0KHTCN67pxNCpHhoUDr9e5sEbR7rJiZg
 sqHQ7KeRa3ysVOTqNKWqeW0PIlZxHKYG+xoJXQDTlruJVOZXlWO1jqOGVD8x8VUDFYV+vB2hYRC
 75EEBqnDQJdac9XuDhXY/YI3MvqbKeUxyYE6fcDlcsYSXi1nm8zOnUu6fFNBH7423606Fl+NN5H
 cG9SdJvcar5lamt4k3FqzayIpeM6LBteDNALOpaYFXOra1j3Rs1Xjp/U87D9lUZKSKX4zFncBuE
 qIrXEAJkk+NC/SkY+sMNHX0hG6TnY66wWzU4poljMrg2amx20fl9ZCIWK+P4MHaA0yU0fAQbv/y
 D8s7NN0I2FdJxl0cU5Uk4OeD1+3kFL2q9avoZ15LTeTJdq5bh+9SGF17tCwPpGV9syJUObbwgI9
 p6Tm4zwIaZxGhvo+6Ww==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d814a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0svvs9ifJEUDWjkQtegA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: U1Sqr3s9ayecYnbBb1pGzfa7doYHD4Pf
X-Proofpoint-ORIG-GUID: U1Sqr3s9ayecYnbBb1pGzfa7doYHD4Pf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200092

Add "cypress,cypd6129" to the UCSI CCG driver match table so the driver
can bind to CCG6-based platforms using this controller.

This is required for monza SOM USB-C support.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 199799b319c2..0695ce348135 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1520,6 +1520,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0

