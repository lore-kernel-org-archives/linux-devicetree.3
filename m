Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0980B3F1073
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253597; cv=none; b=H3Y47d3ACpNgCQK2d+vLtyS6VJVy0+CjAmQDJ+XMkvnJLpbmUjxpntN5zze9mGEaoN/ZP3ywb2SfqDeVqcKIYz3odhlkEMWc7g0qHCs8oRJq6viUinxzQb2kQQHcYlAqCnhB5hEk070N+BWL7oMlAw5Z47JuiWIfIGKZdOzjt9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253597; c=relaxed/simple;
	bh=CxINbAgj0KrvDpn80rfuC0LTbqzZ9PR7KL+bHMKUQPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQ6pbGjonBtGJumi13XaDht2o+jCzWHDcuUepcslj2qcpg1yJJa/vUlkMwssELwYhZANU6FnWTz+hw9t1sV0hEAQgPxHVF8jA3uZZ6ZdMdC3+Q1fmYi/ucXPyswq8wE8BwDP8/PlNxDIREfiFZpZo1G3dJNJUyI1Az/Dy2RnyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owe+Eb0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkAqggJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owe+Eb0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkAqggJL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLo2g5817523
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HseOcJDMkSV
	2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=; b=owe+Eb0SQ5iWsXh3cPMn4r6vbWI
	fighoJnvEZkaPKFEMGUqWw8+3YVdjzylbi7CjKJP1nzJgoeAJvC1UigSGsYKFfFa
	3jV8KhYqqxGjHpKqYA49UkkfbhWpSuVL/H2xK7v63rNUISAmJIZVc4ksyRYVGAHy
	UKICzxPaGjHA4BeYMOgV9kaUpZXP998OeJv/pdsiRNClw5L5HCXKn5z7+DxyUHZ/
	fQcjE5dZIzkCFwA2PZ96gO440o7+q0ZhA20ZncG/D9evpjbocnMZok4809Ym2I+6
	5Vs6BwlIaHgoJWJJC7vhvW9GPf3TmLtmc5zKRSSx5bD1ImVqNedG9+adjlg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ca313-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3656781a91.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253591; x=1789858391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HseOcJDMkSV2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=;
        b=FkAqggJLDJ33m55Qlwx4UZao09tL05vUTx0AuCS50H9Hetai9JqnlC1eC1Z+12DlUJ
         pvHR0oXpN8ExkVps0DVT9VoK6VaM1Yc9PaXVsh21TYLRWlIj4npViDXE7aF/H4t5IQAs
         EW7k/EQtnvRrI10fPWd7qYR5FPGzvFwMLDAutGAO7Zpmb64rtD0EsYcVbN7ArhxkrFKJ
         W/RTi4NCKf7Y19bkpC9WVLY4/YamzD5EZnfvxJ5eiPiwV/CsEaP1n4AZFxD+s5+jb78y
         ij+1fkWvBfsHAz2z+qhflFx9H3tVjrHvv+pXLLvFn4WYGpQk5GmCKMQOw4Ck0th/yhRV
         Fwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253591; x=1789858391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseOcJDMkSV2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=;
        b=Ml9EbwLQYuJgMWyiwhgqlIs8znItvaX0iszq7yGUgNysVN96uN3ow0eqmerR6R8t4V
         JVfBe1ytiZwcUVPyKm80+UFMkopspMZ12QD+9Nq41vQNyq49qoyCHJRplaMrPgkH4l2C
         K/Y5ho5I7f7Sndplg9aAcDNVgz0MQxpGHdmwZIJxPf2GQSxeneeH5DUPhZYnlzQYL1BB
         goE54RbY3E/P58/cmhW04C9OQFJ/pdLqcdOTrNYk87nj0G9ORKfxgYWH4rkDA61mGH6Y
         j3qCso/cb3TDB3KV4+STqF1wkLGcy7mopXAQUUyj8YwgXKEcIPcNW7im8pGNGez32gj+
         jFAg==
X-Forwarded-Encrypted: i=1; AKwUvBxZVaA7mh8KDekRgx6c+oT23aSbviY/TJDKT2JVD3XEeSQD8cEW5Yplzf7fFjXLHHsa2MRH7kb4f+m1@vger.kernel.org
X-Gm-Message-State: AFuF++kSRs09lz7lp9LXvD0a5XVNnR/2yrKLcKDF3Q+MTImq9+nFc0ky
	55tnEqtlyeqF48Uqh6KXc/B0I6RYaj/lURTImijVPlN2PbxQc5kLe+FnWf7ezbeB5iJ7Ajigdhx
	S7q2psXJq4PFVbHD1L1cMddncd3tsP9RwTMr6aJN5n6xiGGAKaLR42YarPA9JqXqD
X-Gm-Gg: AYBFou1PDZ83hJDZ74Zy7lTlkn7IabUvjVO/lFfQxs4GLBScm5rfblxia6mVkEhhN9L
	mV45T3VizjCwr/8dg3y+GhmosYcdfuX5xMwZB9G8LmSGvxMUd6HvLIS8cU1Y5XWSI/M7k/C5KhJ
	eRixjtVeIM4bISZscVED+Nzt2KC4Dr7c0ZJbPE8ecgQRRJyw+HSJOyOXoHgIgBdgdBICuRAq6IX
	Fx+ZIt1WwMrMY5SAVsBCBaH1nQjJJH9YlzgHfXhOTErIXuapE6khhJ3zWVO1tgzNYd55DPxcS0R
	BOASw+vBlq87nRklsSgNj70zXLY8LO03cjWsCD5qTtNPT0SGTxGMy4ZNwhINgdy8D2Y/8EnFu+F
	Py1wg824BJcwgKimJPgRjL9uXPIgFY9IW6dHYzVolFjTCMMtEUluiXA==
X-Received: by 2002:a17:90b:4c0d:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39dbc6a3e56mr8467488a91.13.1789253590693;
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0d:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39dbc6a3e56mr8467436a91.13.1789253590284;
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:09 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Sat, 12 Sep 2026 15:52:58 -0700
Message-Id: <20260912225301.3396556-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfXz7r1ychI9jkO
 yusVDi6rAJyc2o55yhKte+5Q/m2rRcr+AwW6vBUur4pUo/sFELuiwBXwB7V6Dfil1lNDhWiPTzE
 i4BOlD5amOeAbJjfLDeUhXDNEbLlcSc=
X-Proofpoint-GUID: lyZUhurM_lfvpXZP94K-SMWBFlRJjeIi
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa5d7d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: lyZUhurM_lfvpXZP94K-SMWBFlRJjeIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX7DQv8NKX09wR
 OU6vXJylBc1IC380o5P8qGcLvpRtff9D6tsnkVp+l26dwqq2HoJhitv6ymVNHzzlYe9ynwdN3Ik
 8UQf5fQ14ACr2btQEYc1VTcHKk6/S82SNTX3U4jVMv4URlYw0xi0bOqSICURizSmrRyeZsJihFF
 YIhwLuQATMGlhPcZSLcfGb7hL2+J3Nww8zthFK8lB2hVfmDrJT1iFSb5xj0qBN3wRmQrJj1oeH1
 Fj7zzertPRIWHHl/7BOqqnhjB2E5mJl3cti/2l+jS1BPfX1pgrnbj6MhF5zbG8L9GSUIqspEs84
 w2BFDkrILuCNIpuHvsNm23AbsULBqQqL6xxjuODZNOIyr0miuGyUFqodkDpaukK+T4FKxCBGRJn
 dgDIdmMPRUr5EqA8cpYBmnhg2iv/17s3gI2f/8NVuAADbGoDJWNifPbDGwFVYHyle6CSCT+H787
 L1wvPWk4cAtZm4+2Org==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index e2694c6109ba..d280628370e4 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1

