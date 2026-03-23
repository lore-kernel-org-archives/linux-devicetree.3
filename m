Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FF382F22
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305541; cv=none; b=qHth1olqacQ66DDBIUSlO3n+J68OvkH1/aTuomvUXc1naxJoHdRUMEZPjn99uC78I/xSPpILambWFHYEDEFy4hxmbOyKEMALv0qPssFpXxidAqVzoTSo1z41bmgd8cJLyhY7I2IzEQrl4+rM8QY8DGw6AvtyF9zV/MblDX/zbDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305541; c=relaxed/simple;
	bh=sxyYbj3zxGyfRpI3tYXCbVwGVDNatdwD9Ux1a88/YYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SAW1QMQ744xddU4h63o6PF+Hn3z+Gxbs2y6fdUmVTOSPC6qRAVF9f9Xqml3HVsuZZJgoevMzW8XaOMeyJ9POsAohNGoKcijj4dIvpGsohjZai27s/BbcknJimRwSM7TVKhpRKoNGr7QqBBUHD2eMpOSmZe3wqjcT6uFv8xaRWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lV8xFN9/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FY9r2Xbw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lV8xFN9/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FY9r2Xbw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqcTh943586
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oI+beZBCKKS
	Zpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=; b=lV8xFN9/TBAjLhYgdfMNI+bKSB2
	QMU9jSC21p0V9CmIVqHuf0fkwMeDgVooN5ACBDkl+867BOWlYh/bGQSxzYBZrGbH
	e4XGmxE5bWCcYF4FzFU7hGEtzbDDH/PdudpOfCKV1jsceQJKMmwurSm73Bgze7jN
	y5eLOQ2vznshyrfLbfnDjinmXWZdetHrnsCHiBKXrpb27L3L7KeMhDotKj21XQG/
	EHb7deJuyqdes2uGIueJgmpSrLRdrm3N5/9DfbacG1YYExHUTy1pNVqdcZ+GIjeE
	JCY3JWlLtG6HcrgmCMeJpcQ7ijfZq1JMDRxz7IWKaLh2VGwYjGVnEgmFgeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 22:38:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so167937181cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 15:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305539; x=1774910339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=FY9r2XbwGL+lXKLa3C6SMz/HHM8DbWXLJvQPobXQYVbnhwt7sr/KUJkkhyR86WBTnA
         90wMHkIWoAhHhPzZhfcNZWg8dsN8p1A15LedExpkNYn4fzK5YsisXrcy/2AyVFifad4g
         aZPtDh0wF61VQ0TYem4pTbwOm/ddXdQlsTFMKPf2m3MdqfcN3WXK3BEl8IYixZOvfLOn
         XPo6a+OjWw7IHSI7ONimEIQ9ffEur5WQioayqQO9gkgazm+ZT3PGK3hJjStxIWG3rppR
         iKF4SXB/ljzZAjlRzaZu1hrgIoXOnScu9QZjABHwoLr+p/WrV5pOoSL8kLMCJh6dsNeH
         tQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305539; x=1774910339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oI+beZBCKKSZpk28i+hefm0WpeZ3W9cTVjnimZxiaSY=;
        b=q4/zvuPLRfopUiJdp9ktg+Vf4Xsp7sNge63WFrjStZPBtxC4otJZeSriX/arQPW+M4
         7hW8QOFUSEY5SG94AkFoCoH1BNCyQAbpmEA/Bp47BPcg+92dSUU2Ov7eUgMX2JqFmnjx
         p3Y4f5wFnMysRZNrZ52cHjtGjtvWPZNkrg0EvknvP1QXmrZrQJQrnn0fUHneGTLDVDr3
         DSGpG2hzWrUYQlt/hPehT5PZno011Ev0lmW83V+cTdL0MYfBUtr/cpzlzBTgXX4g9/Fx
         DXIkq/TcVQun5skIi8GoIBoDVcf/DfJHzeZRhAWBabLYggraO8HVlX2Pa2SLCG+tQqxN
         IgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7VZmekRnD2FFIT23uYzbR3mMhmP0dL1VqXX1zCWdoGDoJcWXPxNZnKO2eyAe4vEykxz9Q9nRHKeDG@vger.kernel.org
X-Gm-Message-State: AOJu0YxJuuHbRSBcG84dMcZe0NxRqmdSFx8UTvU7UQ6F9L0+87h9Tf6/
	AN+a59x6th3WnhcWNses+yYRAixsKODixK7qrFio8KxrZz/cF2HS34pdyOwbtgOOL/8GgGI7hIt
	sWrHQzHzQFTsEV2HXn/FFoJq4BP1cddb9imL3toPmM0DMjovFTYuDlx7TDKyDEmCY
X-Gm-Gg: ATEYQzzKAPI2iveVVMXCEULnQj4jpO9GvKGsQJswwEOY1yugy8XZYL/etEXNiqejJyM
	Sd2QnZdF6tu+8cW6XnL7WTBVeu7NpaZTL+FzeoHxAliR4u9m1QgBKgBG6xTXd/EnZJn9HxpDZX+
	LNYZOehKeyUKnC4FB4S/BlQDAK09xgPKxZB8Bepb+ENgx5FI9umD5zreFza69Hc1OfHhdp9qC6B
	6IkN76H0jcPuIXlK07pTJFtQ6QQ0iGbEqpEt3EeNOJMWG1OHeu76qqgT04jIvzMiCAYAG6mWkXF
	2Pp8G2M7/7nf+9jVc0pLnzDU0+lUr8m6EipaD4hHeBpPSqlgDhC6beO6DvFghszDrTvMbkZPC9m
	4l9Aan/o8xmB4DzAD4Xilof3n9ZAwIQsFjo3B1btv7ECP8Exhhiap5Ms=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr116997351cf.11.1774305538525;
        Mon, 23 Mar 2026 15:38:58 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr116996401cf.11.1774305537179;
        Mon, 23 Mar 2026 15:38:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:38:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 23 Mar 2026 22:38:34 +0000
Message-ID: <20260323223845.2126142-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX5tb+IzI8EBN2
 Uw9AvYWsY8CAt+mt+q+dx38HKfhiVVY3F9YROgt5OaZArAi50hJjxdqXqnfOKuxGeyckSgIAWHr
 7sP0a3dLVVEuNSzQEYTo/+HDdhV8l/4iXyz2kyWbtidCADq3E+XwnBwCz1dAbKGF1TYN9Mo8tKE
 CbWwzOiKiDWdSQecQHo5och60la5WqL9pWPlnj3vUuncS9Ir7h+TMkvOP4CxhS3e+5m1YOSejfZ
 G9LU198QJbFLKmi+/J43RN3IdwFegfYTMiOL76T4Ah4NXkyzxfT0neOzD8ySJfDpiDe8nKRXI8r
 dBDz2xK9T8TJa5x3BzYUOrdEDe7KvJibDtAOjACmW+c1YnpQfNM9+eqXs1ZPMYSv7yk+GqU/jXj
 GTI0/wKhR5KzA5kpz/QYQYef4DdN3LFIgXJDOK11VnIrskVUGRecQO3pl0QTdxRn6x5JRHQi8gF
 seDrFMpz5Tm18MjWtIw==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1c103 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: SACRGqqQCkWM6XJ8-s2LxLeMZEzZAyV-
X-Proofpoint-ORIG-GUID: SACRGqqQCkWM6XJ8-s2LxLeMZEzZAyV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index fece0e3def23..1fbcbbf3123d 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -753,7 +753,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3

