Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B101448D1D
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770324; cv=none; b=UkZCANPWE8sgzbLhmGCao305fLMRqOcL2umeTmRG0jK7xxnt+TyLLPJKA7tThWup+dMFDWnxF1yvU4GjaW3a13x4/FOv9EKBRfNxaqlBfJjB9eYkwlgGknyVk4Pi9/bSYxrVbrxMtsJnoodGduE057q0nmcZyGbpCq6fM6bBZL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770324; c=relaxed/simple;
	bh=iW28TnsYJ0VMS/rwDLxo2MLYsPIWZDhDjeusU3juDdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4W8qNEBj7eToHUjX3vfa312lrNq0QGHT8mKF7vTzqm7Xe7PaPmYGbmQ8mDkIrhyyEHMDXpOetAIRxz8eIyl20KWkn9oH+sGaiKxDS0VKnaLM7gpF4s+h0BrB6EziepkXK1ux/tj+i0PPEFoHothd0OuJGBuEbxpUWrX3VZwjvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aia4/VqN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTWIltLH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aia4/VqN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTWIltLH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6878ZYOG2878104
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NZJ7nSDv9GL
	/FplrIRnBTH7KK1iSSswSLlWYBNxdg58=; b=Aia4/VqNgfaAFLH8Fc401vv3Ocx
	gjJUCCh3hgLDHq8fZR5/Lr949yRtMXhQJ0wXNgL+mG8pUgAxmVkOygG9wjCh5j8M
	xXITpR1o+ArulQ1SmaH89MkJx2yUMUMyM38TQdHeutrt9/WA57HXJpjxGGl+AT+4
	H0F/LlrMuYDjfhDSAXO5+MKUk4q6q0OmMFi1+pI3EKtkpFJ1l5SMv0n+GPXGBI22
	ZstC+2mmh4fexTcz/1slAjvUQRe6VKx/Bzc7+aWhc4Bfe6uMLXHS+35BnBYAT8qB
	KefzXzZPRDrhrOlhVSXe7gWjQeU3NL0MP16ai6fENDxtZVNZnpR9hPr60Ug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw200ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:38:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso512305885a.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770320; x=1789375120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZJ7nSDv9GL/FplrIRnBTH7KK1iSSswSLlWYBNxdg58=;
        b=NTWIltLHAxoQUWLV6qKjWYthEkibG0mbKamHyTRuDmsR3W6pQIFTCjsom6tmTLb4Qw
         Q2t2P6eOUndYxqMtVeISgu8fOJVA6tYEC/vArPsplXRQ+Vdwm+54Ph6RCs4oKOaNnc4F
         2ycLHooJnwXB8LVKgdienLM4cfPCh6/NJVturHLEjHzjC0rqmqZVIfgt2qzhCtF2Xmic
         8nS08KCOyH1aa7loFyGMyb9JRLb+49UIB5ltBN464X3MjuHtKLgxRDh8y7kKw6WycikT
         DseKlCuHZDNhEm8TXmqlrp/PJZ8XBgpNc0sIKlMzX6mkAPq8rt8CbLk/H+StnF3EklXK
         DjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770320; x=1789375120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZJ7nSDv9GL/FplrIRnBTH7KK1iSSswSLlWYBNxdg58=;
        b=oeDmCMA78KxPCwkCopo5j4VtTtzpjwalENd9tLwVkXvw59MiueygvpQLS6BBqcXFAS
         rtO8hpVOZNBtRUcqufiBzOSFo73Ie7Ae+urb7kIs7DqlskQ7lEBCg5OFox2BjY4mwfAz
         Z53bDJoxPqTb2NLPoSIoeQVRboqkbtH7UEwJNjRv78qcH311/zGq8lYu0q2uWWwTwU/1
         wsYnEBhr9m9jbHe48rYlKUS3k7BcJT/V4h0oucRv84bdl91zSE3qJ+N1GSDId4KiKjb6
         f8AbEcX7P0qpw4d1Pli7ApPHW/yXfScpox6RBqZTYrCep/uiNhAcRK+llDe3qswEN+9J
         0ebw==
X-Forwarded-Encrypted: i=1; AKwUvBxguZS3uFDOtE672aO+zQCBHWSDqNVdlMivgjmI0MxMInF7R+rQORhU4F1yLtX3AoZkmy3gqEALMTJ9@vger.kernel.org
X-Gm-Message-State: AFuF++mhD58u65gsBo5/pdnsho8ZmdGFSN2NgC5+gi0YDHaIWI8yeO08
	Ci2SthM22EI4u+doUTd3LokPAOlN9gNO8b6OeBqB4G6oY08sCD1t7tyiBWoWBNglf2Y6Lf16K0s
	yL5J513/bkoenkA/MCLTjt6xo36RZNs6Uj6EMnjJ7e1K0QZo1GjgSeAMbKZmkOa6+
X-Gm-Gg: AYBFou2ZH2XszuMy6CC9q6O6z1aVRQqhAF8BmWI/5/IZvLPoBShQTjQd1mEm/m3ydLR
	cwvLG0NePNsE1XCRT5YrDaYALGFPY7OCG5AZaqR+yBrW5XwSehtYRio0p+xZaYq7lrn+DFWN7zX
	hrJG/O33e07Zu6ncaVOrsapzWRquycGfOtRiVWQ+l++Wx52sydPP3NSitAj57jdNUQWaZu9TMpO
	cj15PhUg+XvJWShVN8uGWSYzvHcd5yoo4IX1JOAzxIc4q+y5nBP2bi7KCxrVuuO/r8P2Wb+C7UO
	opOK0BXzdK96KGF+p7HaIFpBMyhmRgrkWXS6XzXfUnwwYZGRMe20hGviU5d19HuY4IgwuMqgp1q
	J1BCMRh2utGqM2Q==
X-Received: by 2002:a05:620a:2720:b0:939:6dea:374a with SMTP id af79cd13be357-939804f807fmr2245693385a.46.1788770319996;
        Mon, 07 Sep 2026 01:38:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:939:6dea:374a with SMTP id af79cd13be357-939804f807fmr2245686585a.46.1788770319319;
        Mon, 07 Sep 2026 01:38:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
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
Subject: [PATCH v2 09/11] ASoC: SDCA: add sdca_apply_default_control_classifiers() helper
Date: Mon,  7 Sep 2026 09:37:23 +0100
Message-ID: <20260907083727.733705-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tN2wyh4bezi9a4CSBqYTbNBae5fc0nWT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfXwtslYW+Txpoy
 beujHZ3nBo8vwJ2hR7fMHTdpGgqOr+xvwNSdGD5ieZ3f76whCadNMBm9sVSUhIG5sQ1Fcx5E5Ch
 +3+DOjkepK7YtR5ZQ+DxCyo5MSCEHPk=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9e7811 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KCW3dyBotJ-MOgbrRv8A:9 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MiBTYWx0ZWRfX9ZSd5P0hcR4p
 NbwnJYebTMRcNkBXiBC8EkXWOQe7HhITcRRwHAkvCTuKIy9tGVffOuhqBJXnjIqfbsMvsOovf8h
 5uK77HvOF0xy9WUzXq28k7YmTlIz8jbuvXf7QWWoCeIF8J5FpH89x0rF9Dj1/N3+r4Vamg/o0BR
 3HlXi1XWa52bL1PsyT+4LlRlas64Oos402vdvCuCGnS0fLy/TPDDUVZFG6KXfR5vnnDNWpxSh1T
 j7LANHEZcG4ERdUYjVdRZ3cl0sQOg/ep9TBS4yYP5pL7JE/hCvxADes0pSaN0PIdS6vm7qvK1JM
 v/EYTGnpAy0Xfc+ieh5n/J7bEZjavE7XXfD10ppZ25t0X1UyFCNQ7CkgU8hL4uyoqp3DBmM7UTr
 WuSmmHyrktoN/Dto5qYgkAqTa3tpnEfcRCrNhkfu9Auszmj5Lo+Vf1VCm+B+4Fka9MaK+s0jNEE
 h+Wk8QqJ2NdB2sYKQvg==
X-Proofpoint-GUID: tN2wyh4bezi9a4CSBqYTbNBae5fc0nWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070092

sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
spec-defined reset value (see 02d851b46b36) from each Control's
(entity type, selector, access mode).  Codecs that ship static SDCA
tables via populate_function skip that path, so RW1S action Controls
end up with is_volatile=0 and get replayed on every regcache_sync.

Add sdca_apply_default_control_classifiers() to re-run those two
classifiers over a Function.  Elevate-only, so codec-set flags win.
Call from the tail of populate_function.

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
index 68a50552f4e4..8f4d04e09032 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -2268,6 +2268,35 @@ int sdca_parse_function(struct device *dev, struct sdca_function_data *function)
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

