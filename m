Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F984BB274
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491454; cv=none; b=FRkjYSIITf05zG7/GYQmiwzGPI9nJZ/AeM0NS56o7BB8qU9lLGhWmRfPBJArzv9SYL6AhUGsShcTRtuM7mDAVDTTyMC0TnKl3cfOOh7xwOq0QJS2GBI4OzfJ6vhgJMtdWOdgqckqN9eYQA99rRGVYhIkMQBbTXFAGSprO2YdV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491454; c=relaxed/simple;
	bh=AsXKWMqSsZYic+4+nHonSuw6IKnniuZC4TJ17xky5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UjS5clVpG05nbnFyIw5mGKpjKjWoCziNchiysE8VUdRN0IcJMOeW2IVRAUhGoTzwE8thy+Or3H7InlyV5dAwfK9OE+3ArQJsTbabqiW7X0esDL4iLUnanZps8K8Bgh5HITKSn/uduSSwDCTNFyIVU5auyDZBNO+i63Ku/q8tcls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zvh6+Xes; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fc+JoXIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zvh6+Xes";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fc+JoXIK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAU2N4176143
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vThtmsH7s5Q
	Z/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=; b=Zvh6+XesFDYRzFtmL7N7o2bYwlh
	+X/vj+7zZ+WIL30wUvLTTeuvmIrNCDP1iFE725JZnZP5sGaTBz6FXQbiYCztjX7/
	IWTQT7gtjdnd+b9RCrcSpHfvdsryqyQnau8qvLPdLxqTOK4fkaMFoILeD1Pv0gyD
	EMVTlxJJltQDvKrHH3pw3BEjOd8hA8PYWr1KtH60jZSAuWqHouQ3P3dJBsDZ7YLd
	QF5hJVwPvCGYGbF/Ew1Mq2dD9rgTqa6r4v7aXi3aJgKrkTxo6E9xjYTEWOT88oiY
	VatmXztCcTXdD4/WTs/BPk3TNR5x/O1EAyouKDqceJfTbpWL/DWbM8sINjA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2jk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:57:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78d25a8ff32so1344113137.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491442; x=1790096242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vThtmsH7s5QZ/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=;
        b=fc+JoXIKh4kLWNUi0T4sx8voKaQxFWZon8d/9CheIWwXT+C66IC6/IhL8zUkQ5hMpV
         PW7g5AG9imIL6C7odqatxwKZN6d1q2leBRFI4qSPBmFehA0KBXlIjYX2ug74WE89z2aJ
         55BCsT/Oi5Cjl61H3tELcAr3JbsgYWyWLmwGHFvVELfsVALa82Ot0/GLozHBa+vvC+mj
         SXNbJMGXT4UTUCmAdVO6AjrG+emc5B+TQgUZVoX/sC5cR7tAaV7YftzpCU3kRnfU/1Cn
         N+GFeE2buoOaFqoKARtBka3EC0cOFijJvnoeU9Pd38MO+6DrqYXHCkHwiJ+cuAOFzR6z
         i+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491442; x=1790096242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vThtmsH7s5QZ/N9eRQC24RtKUvjkzyNoDSrqm4gjePs=;
        b=2pucUqAGHa5ejpZoq8IXyq8XXhkbfHNgbBOkAM+zxF7uJ2Ts1V1Ubc8vsmSSzAjCMo
         JPHBdnZs0EEBPwKGS69aVm7MYDWywwbiSNWvssC2qoqSKEY03GmmfmtWhiQ1vmmPwrle
         wfWmwgaXu4hAqVKF2jwsd74/m7E+8qWJZyJJympxVIbVbtmgPc7U/0SV94g8uTllvV0z
         IWjXUT9wqfgOhtsYVvjPdOJHOeM4D+oWMqeOLZ/kLDGi1nITTKNs4/2eWhOuY2XRsv0B
         nef9o3sDFBSH5Ymq9wx0RRCAR7JWUrf4v97+fXmFkwIHlH3NaWC9iAllL+jEQcOUTa5G
         rIQw==
X-Forwarded-Encrypted: i=1; AKwUvBxzPHSF3rXvPY9xbtrDq8ZV3/llLOUGheeB6eYD+SxE/OPLMnX4gJBnCoPAuELq/+2RuYquPqq71H0+@vger.kernel.org
X-Gm-Message-State: AFuF++npFcYcMnItIoaM77UL+k7j44mS9yGMVvP1hZrymp+9VQxB4Yqv
	gKBftl31zpaW0UJnJgH5lpBYEShEbEvbwc072R91HfsQErvfhBBNboGVmezlINRyjIRKBUsSelr
	Zz8OIrB/CpmAgqIqWeKuPT55VVA7o2iJ4GxTDWNGtETgfDET7pgmv1qBuYQKkVnNj
X-Gm-Gg: AYBFou1Ns+lgiiQhufE5xtF/ssCZimqwdkzu1UX6RakaW4vb+qSrR8ZkqOJSBK2Pu7q
	e9TXJ6w72uIEhMESLrikvdAkpzZMRmXtbYe4Ua4m2YtnqzL3DS0LLwbBEf6lOrsuMDYgn481Vas
	3W01bk/AFU0Bw0y1v+KVhrGvJkmU8HHFs4ANCKXJnhYZNbA4huxaKB6stHmZT5FwkSlmsGAXp9S
	TU8uZiRW+Kc/5cKZMej6G4a1tYFnbAw/ww+3VyFX81KST3Yy7vG0SP7POBybaG4FGRfl8F8ckSl
	BfKe0ZZB50rL35/ytxgZjDa2TUGVLeHTmOg6jwoB5Vw5zvhQQZu9RuuD0qdwm5QfZbndRLGadYc
	6yfoqkU8OiH3t4w==
X-Received: by 2002:a05:6102:5f08:b0:79d:8255:3bef with SMTP id ada2fe7eead31-79d82554188mr6083042137.4.1789491441968;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
X-Received: by 2002:a05:6102:5f08:b0:79d:8255:3bef with SMTP id ada2fe7eead31-79d82554188mr6082921137.4.1789491441493;
        Tue, 15 Sep 2026 09:57:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d9057dsm4361335e9.3.2026.09.15.09.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:57:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 6/8] ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
Date: Tue, 15 Sep 2026 17:56:48 +0100
Message-ID: <20260915165652.914893-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260915165652.914893-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DbhahrEHEn3aNJ_nELK47Y74oBZMyZXj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX58o0GhNgg0J6
 ZvOdkakDic6hgvUrBZCMm5ksKc/fZdv7v8ymeFee3KT/6pGwNh162ybKAgxK6VTOTn0SkabA5uC
 N635BM6OrAkRrs6Ily822KrYn3kOAnI=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa978f2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=V3wSzEE_ktrjQKcqLJ0A:9 a=O8hF6Hzn-FEA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0NyBTYWx0ZWRfX2MKeKdaUmjV3
 AQLPyylc45L1v8XpwPFFJLNB4BROyFG3uLpW3yo+/9XHI1gtuG2zPFdU9HLdm/2l3T/f0cY6naK
 hiigvz295vm0FSG85+HX0HZkxokVafXRQAUodeEXOFX533QKRlIJtgI8eCWPdM/0GRMdj/OyVQ5
 rWP2rQXH7qH3BtqXYa2BnJiC7zPrprvA9vkVYTYFcVlR+LF0F9Ua6wwADRlVRoI18bVl7cr2DKA
 ozS7OuyCLBBaVWu6J4ZmPjXCiTc0/geGLTyH3mgaExYt5/9gs0aoJwW4Xx1WkZXjBUPN3YlwfXA
 ikMkcJSuMXu9sDDx6W5oooP1zbdCh+qN29f/WzfgJY0IAExs5IKRJsd3UkBh7ZXpK0uIOGtSFzv
 Rz5/l6qvM6DnSql4oM7+eMK/hxM1LexenHasXpdyh9gudMBik9I3nV6lDsC/I+CPKMFOb13ZAdH
 1Ev8GbCcs5oxfDWM7+w==
X-Proofpoint-GUID: DbhahrEHEn3aNJ_nELK47Y74oBZMyZXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150247

sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
spec-defined reset value (see 02d851b46b36) from each Control's
(entity type, selector, access mode). Codecs that ship static SDCA
tables via populate_function skip that path, so RW1S action Controls
end up with is_volatile=0 and get replayed on every regcache_sync.

Add sdca_apply_default_control_classifiers() to re-run those two
classifiers over a Function.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/sound/sdca_function.h   |  2 ++
 sound/soc/sdca/sdca_functions.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index e580201d69d5..d3d77d8bb7cd 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1464,6 +1464,8 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 
 int sdca_parse_function(struct device *dev, struct sdca_function_data *function);
 
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function);
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type);
 
 struct sdca_control *sdca_selector_find_control(struct device *dev,
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 6eb0e1059dbd..4196c5c86a85 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2267,6 +2267,35 @@ int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
 }
 EXPORT_SYMBOL_NS(sdca_parse_function, "SND_SOC_SDCA");
 
+/**
+ * sdca_apply_default_control_classifiers - apply framework-known Control fields
+ * @function: Function populated via static tables (populate_function path).
+ *
+ * Runs the same per-Control classifiers as sdca_parse_function() so both
+ * entry paths land on identical @is_volatile and @has_reset/@reset fields.
+ * Elevate-only: codec-set flags/values are preserved.
+ */
+void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
+{
+	int i, j;
+
+	for (i = 0; i < function->num_entities; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+
+		for (j = 0; j < entity->num_controls; j++) {
+			struct sdca_control *control = &entity->controls[j];
+
+			if (!control->is_volatile)
+				control->is_volatile =
+					find_sdca_control_volatile(entity, control);
+
+			if (!control->has_reset)
+				find_sdca_control_reset(entity, control);
+		}
+	}
+}
+EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");
+
 const char *sdca_find_terminal_name(enum sdca_terminal_type type)
 {
 	switch (type) {
-- 
2.53.0

