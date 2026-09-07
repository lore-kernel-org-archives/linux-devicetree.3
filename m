Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F2445AD0
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770318; cv=none; b=fTbtHWN2uHJuzVUrF2heBXJEpmqxefR4SDNO9vcHXbzFzfJTb57SfALdX1sLnaZXpW2VCdZS2LmyoFrec81K/xRpWLfQJ2gMTnTH3hrJJ4dahk3/5PQ8RsfGMmOpsIKqBHHRsFx9OvxPmajrDXx51BHyXhHxRI285wQMNr25xGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770318; c=relaxed/simple;
	bh=S5Rg1wd2Oc8SEJcKALyOC0R4mCPo46zXktRi4uyJdmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=slIZjp9/DH/5YsBdDQj6iNGf0ozpfno5GDfTUvCq9lU4AM5OcOiIJZRASAY3UJ3oCNA0YxI925d1hILKDIvr0GoymjM7TxafeWqhE8goiYsUSjx7TyW/AkGBc2zghuywjjtcG7nOyCZo+gwTYWxpCBKH1OZBqhIDzimLMLSRywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EKQ+fM+f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V0XN7yjD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EKQ+fM+f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V0XN7yjD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777OMe3363574
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CKSOhfN5g4f
	/KlUyb51hKqxizTlCn7d1Bpl6LyJMzEY=; b=EKQ+fM+fJBNrNwDgLg3cFjxzFWu
	tc04ie/Gl6YCAVttXrzuQ7TZxFYto3CKJVo/6TDaOfS9uhEWn6pBPflmhe3JjdwT
	l0jsUYGxCDDBoLtNq/QtLHBfzvxMhHM22MocQdU8wL3Fqm5IIsBZBJp9vwECs5Zv
	rf2NjDKADfCZCwchUAADKX0OkQKF8088r/xBV67qqp6eqZuRIyAxVM9ZwuwqgbBv
	a4TTYZdNoixlzk3my1HUdoBEKEGkFWl+RsQ2ETsxKkk0Ywasq7qgbb9c77irPOLN
	hYV7e/D3huvoxJw5u2ONwYmCJGgdos+EyvKHqi/9P05pPUDv5xgE2F5ce9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj130y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:38:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939281526e1so224183885a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770314; x=1789375114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKSOhfN5g4f/KlUyb51hKqxizTlCn7d1Bpl6LyJMzEY=;
        b=V0XN7yjDKuIiMqgYQm4qFHaQKdq+GDR5SbQEcYvmNPGVSdSOfeVa+SQr0IREAd0Ibs
         AP1ppN8iHwAfcG6/MBmxkNr+2AYmLensPIsiWsE1rcsk6XtFBkUeqCyudOJgmd9pJJ1U
         zS9trn9EJo14p+dyeYf667IEIZSJldJWUa4iiTIoaaDGMFLzh1XE4RFUP7ND7YCqROcX
         qWKjcUeCx1LuJo/3JSnD/bF/HNfOfHpkUnHCXrNF2ZKyKjIRQxELAJtykZTE+KPbLP5M
         gjRmjtgruHEUR6NFR5j4080TYRUq041Nc1rDqXkROf11mfKKBztkUBv5BYkfO9L5tZsT
         X0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770314; x=1789375114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKSOhfN5g4f/KlUyb51hKqxizTlCn7d1Bpl6LyJMzEY=;
        b=NOca9+zq5HJYlzS30DJf0Z/5ida1uZ+S+E1iXtFAkB6afBpuyitbPhB6QDE0+mx59+
         oKsR1ASNz/s31Ctmy2VpI33by1eftW/2wj9avYO+RuP2pGhTXNokZ2X+1M5ALBua+BDg
         VK8SQm3Y7qL8yzcgwIj55KXwf6YzJZs9c+Uwr1BDB7LJSgiyxCLcd7mfSnWvo7mZxjzz
         iBHmlfs6TTLaG6fldUEASyWTbCyvrjf5+C06qmUeHBzEjv2OXNn/VNBtP4EuA7y0ardy
         WGnhONA/o4mozcih0YxAMAIkB1AKfh3ni+1ddcH212pMH8CzoXKX3Zl16rq8CsPmMYPE
         sGfg==
X-Forwarded-Encrypted: i=1; AKwUvBzMm1HKidLxeajAYDrHx7TKAfGwU13oNQsyII4q4ok6E4BbN7kh0krPBbVtNAzYZN0p4HsSUhSSudMt@vger.kernel.org
X-Gm-Message-State: AFuF++kuilgfoFPn5Y1WC5pZD2r1No1JApIsugBL2qD14PKSCqDTUbj4
	hqttFbZu3lHrPm8QxYFPek7RNwyFPv9MZP0+pGMv5IRWGhbDrV7X4zKwgTOvCmUaqCD07rst1g6
	MI42nJ59+04yuTb7H18KacJuzy4sOjO4lK/8c9Cz5e1msS6LJTGsJ1dyeSQPVBZD4
X-Gm-Gg: AYBFou02RXIT6xt4n19dNErTiqqBOGaRYVWkCaXIm88eb6nyeFM8dsjQX4X0at27mlg
	O8GshM5zc+fS4l+olmJfxWJUgABTsUyzxWVkkbDyTTNgevjst3EDn6JCdsgq+JQGctTj03nVuEN
	Y8lRNhqycIqgCwIhw6gXPLzBkorxcIaiBU+3orwPQ2f6Aohm0gi3bywFGPGGRb+wM8V8LluiGn4
	gfngwO1JwHAnVb/Q3PM/xyR3Csow+ki4zjfzky9tS6HevzbtOFOKp+GEuowuC1Kqpojkb08mTtT
	GIgDsbddsHJaX9yaZtarzB03Vk9rZV465P/DqRcCqSq9ZY9w55cb++LuctX017O4+e+XwaPhpLv
	qXfqCxysbTFKdmw==
X-Received: by 2002:a05:620a:56d:b0:937:6772:d8d with SMTP id af79cd13be357-939804030ecmr1377321285a.20.1788770314184;
        Mon, 07 Sep 2026 01:38:34 -0700 (PDT)
X-Received: by 2002:a05:620a:56d:b0:937:6772:d8d with SMTP id af79cd13be357-939804030ecmr1377319885a.20.1788770313688;
        Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT function data
Date: Mon,  7 Sep 2026 09:37:19 +0100
Message-ID: <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX8kn51Dls246S
 pANS00bFqP1dY/oUVOSegeHAk/XwFY58nWnKnqMw6oLvoQvO4S0enqu4ZYYWON+/xmgk0MEbP6x
 GnKG7Va++u3tcuZgz6j7WdVlx+Fwz/Uz0vFOMLCZESm9J/GJu8ZWvya0sCiFrRS5zpdhDO75zG1
 iqv98xXDcb9ETNn/Kspf4k+8a2rsV7lHFvwZ/qqQBGQVAD7H2uUzdpNkR010/wH6zMJ5FEezEdZ
 9wk0o7+Ed+ISKPg+9ElUB2JB1mpCg0GZgYiF7AJGNl1yyiysU+JeeCTTuupMvdh+7Frdo+j5C51
 zXOUHZVOXZQCBvM7QJAKxqGbP65uwv3r55E2V9ybfTjmyEzotYkteq8Ps0FTqxuroCTtTb8oFhK
 lvh/xYcb6QQMsQDjjF0GB7HLjDJIa6UOczZjMbIQ/YsBpvjfv385iKzl8a7aX+p5OXK12WRKTO5
 PMIRYYocwgi5jqsfUpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXxwSWhKpsbZmY
 mCohRYL6rcaT1DD2tBZEqhafVJ0wE3tnKYnxe+n+JEVoFz4I6ChQ2+IgQ+kB4VktnQ079U3HUav
 6lK6cL8gMzG1J+elkNDXvgx3Xhq3HKM=
X-Proofpoint-ORIG-GUID: adyTczD0Mllht0CmCqjwViJDvyl1anbG
X-Proofpoint-GUID: adyTczD0Mllht0CmCqjwViJDvyl1anbG
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e780b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=biI7FBfO6UU1CUG-efUA:9 a=O8hF6Hzn-FEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

sdca_parse_function() walks a firmware node, but on DT there is no
DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
function descriptors come with a NULL fwnode.

Add a populate_function hw_op that the class function driver falls
back to when @function->desc->node is NULL: it fills the caller-owned
sdca_function_data (entities, clusters, init_table, delays) from the
codec's static tables, matching by function type.  Leave
@function->desc alone -- the framework owns the per-instance
descriptor, so devices with more than one function of the same type
keep their per-instance SoundWire address.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_class.h           | 6 ++++++
 sound/soc/sdca/sdca_class_function.c | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
index 3342937d09fd..3a1b6d65048f 100644
--- a/include/sound/sdca_class.h
+++ b/include/sound/sdca_class.h
@@ -26,9 +26,15 @@ struct sdca_function_data;
  *           before the class regmap is created and before the slave is
  *           ATTACHED; callers needing bus I/O must sdw_slave_wait_for_init()
  *           first.
+ * @populate_function: fill @function (entities, clusters, init_table, ...)
+ *           from static tables in place of sdca_parse_function() on
+ *           DT/non-DisCo platforms.  Must leave @function->desc alone.
+ *           Return 0 on success or a negative errno.  May be NULL.
  */
 struct sdca_class_hw_ops {
 	int (*hw_init)(struct sdw_slave *slave);
+	int (*populate_function)(struct sdw_slave *slave,
+				 struct sdca_function_data *function);
 };
 
 struct sdca_class_drv {
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 10a2b031b572..8bca88865a4d 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	drv->core = core;
 	drv->function = &sdev->function;
 
-	ret = sdca_parse_function(dev, drv->function);
+	if (drv->function->desc->node) {
+		ret = sdca_parse_function(dev, drv->function);
+	} else if (core->hw_ops && core->hw_ops->populate_function) {
+		ret = core->hw_ops->populate_function(core->sdw, drv->function);
+	} else {
+		dev_err(dev, "no firmware node and no populate_function hook\n");
+		return -ENOENT;
+	}
 	if (ret)
 		return ret;
 
-- 
2.53.0

