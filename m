Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810B4448B84
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770323; cv=none; b=jiETcArIHslcOChA6pR7Q89gVDSR/kcBOqhPlvWe3UYuoTmD1LhBU0f49GCaIvuytpYY+fQGrYe4dGXE518gHpHv1gM9VRtmXo+t+tKwwxYede6ksnA9l9de6Wmg2vPHPpQ7pOTqt6SiutGrG1zOpc+fKkxY+cUO5Q3yZvYLACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770323; c=relaxed/simple;
	bh=nGv5PetXuMnjGRkeIe8kY1eFNyjb5QBvGtSYOUuF9OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKiO8FK3zNJ3fmA6UHURieGqQrKQ+gqgn8gXa/wbvmD+WFou2fzAhGcUT4+3H59wr4G1k9HXcMDCBjGgdk9ucs7QzvMue8/EheQMp4MQOF3W1Ym5XSnb6SSLhKf0w2JL9klQC8jVj/ZOcwd5GNgvMVP4izWSIKC90gTPZK/BSNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fm3ix7CK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKnK4BJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fm3ix7CK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKnK4BJE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877p0Q73657529
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 08:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uo7ZUub3lrZ
	EEc8DFMNE8az0niDw3dx2TBatUAmNhAA=; b=Fm3ix7CKWGUCowiXlEr+Uue7Hnz
	3gZYvz4/FECE38qiTik1WO1XqhLpLh/tXjDOMSzVb7gh78zy406jE4pi9R17GJLH
	UidSOTET8i3AaPVVo+nrCNNrKZv1dnPUoDhu5/LUdElUHWucW09C+s6Wdju0oH09
	j8XC56KYJwf/VgX+RgK1tsXpEOMiSO4/HVFzmUYcihiXkVjDUk6NellH8RAQPv9F
	WozCSvnD1WMwEV9wB98ZPjg2WJbi6dMwzWk9mpchUF3AjKvhbCEA8lIOg7/dmyQZ
	kdzvmmxeSTi64DP3ccaVdoTvAb5ktBYX9Syt3lfykjVaW0uysSazeeuxLHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r6qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 08:38:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939a6937513so116732685a.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770318; x=1789375118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=YKnK4BJEUcJga8PapVQCfwFPvuE67segraz7Z8xE9zBF66w5IAP51EPRNKyG7i5vLA
         Nmm6jDmOxq2s53LGjLsoV5XrHsU5gWu7s24Rojf60P/O5Sfg2UK+NHlbIMI69664EpMa
         IJer1kQtfwIUoibaVaKMrErudHUrNxIWYD3lNmSkOfP+TTQ6UGR7zur/0ILEuY0DWIbl
         6fyRjwjp59fh/y9R8k9LWKy53qTMlyjfAF2TLgo05kSRvsR1ORHbjYc/5uETFxDSb780
         o9ua+hqxo+oJDoRJ3ehOiWb3+AHZvtgMc/w8OtGbIF99Y+RsrAu9E1zQgl3yRtNXU0jm
         lfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770318; x=1789375118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uo7ZUub3lrZEEc8DFMNE8az0niDw3dx2TBatUAmNhAA=;
        b=Z+HKc8YZKj+p0gzyoqsEVMQ5/43XOC5KkmXoqc/5c3TSWoGwhnf7X4bo0ZhAN1AQyA
         Tj2jd+ngO++q87V+E3OqqUw9CoMnpilx/GjOSQP9V9FEbkBiH84/lJGsZTfkXXeYnXfJ
         7H0T2Bcnt6z2RoNQ3+qc3J3OTJcyssG2zvLcjLg+IZ47LJvv+DpX37USW3B+NTEAuuMu
         U6X2Bm352XS1akrDfP01nkEqT4bw/wbh57swh37Bl0Ao4u3/lQFXfS4O0niwpaGFEvou
         MZnuAscwg9TyO6wLlgCvTS5ruwwANlt35noi1/7+VSl7G7Lu0RNe+lYs3kjSgJDi+gR+
         S2FQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5GVhXXQ7qdu6kN4+/hztmI/L24ydYINbQ0vvdiYPkpeBbdyPgWF7nV+WP3Qtv0kkdUJXmBkxrgxwm@vger.kernel.org
X-Gm-Message-State: AFuF++n/PKIQkxLEjrNIjt9GH9Mf2awk3T43S+ZkBIZIpx5PVd61z1Sa
	BGdgQdOZEs3SKCatuyG6pWgrFGRCF3aehGaDlJafKI0b9rY/lWOS6f+SHCdHoAEsOJKPZrpa6bZ
	Rx/PvEwV8WvLmx/vTaV9darwR8S/XyWRO4+ph1ujKy8/oS2DcSV4E+986zDB2YV/Z
X-Gm-Gg: AYBFou0khxBVYgJDxo0B51sRiznIyOZ7AeOGP4angF0q/iHABRF6edZKMfAWVr6T4Dx
	WSrfOsl1Kob2X3EeLFtO255icl2rNMCXqb+ixCd9GvI7UQnyvlTF6lHzCvWYSlmnVIVPWZN9Jp/
	v/jWxmfvbaJVeOmc8Artv7a+vtSZzGux+M8PHxYh6jofFrziqGo7dG2yMV/q56iYLsPD74Rzq19
	o0V3NLrfqdU7EUQ5mXaYnJNNHRyL53PyojL5R6y/G9bQDE9ueDfeieL63unNK0k9D156sVvBTAB
	IOUjCVkEDt2c063qnlLwbY91w0hr0XGvpMN+k2ZeaY/hLgZB6r0GM2LqvRa4bW8McdEJn5NTM+x
	SnRuDuC3UmlaDCw==
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209542785a.0.1788770318362;
        Mon, 07 Sep 2026 01:38:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:934:ab73:ac53 with SMTP id af79cd13be357-9398013bb1emr2209538885a.0.1788770317851;
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm30852179f8f.25.2026.09.07.01.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:38:37 -0700 (PDT)
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
Subject: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset() return void
Date: Mon,  7 Sep 2026 09:37:22 +0100
Message-ID: <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: NtkwNNXUAAim0m28NLR8a0yyn-Ems9hU
X-Proofpoint-ORIG-GUID: NtkwNNXUAAim0m28NLR8a0yyn-Ems9hU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfXyBsFRS3xOOO/
 GBMUUrMGY/FpGkd+yxhV6U6GEkzQBlPBfiMyhNt9fYlTlF3H4D19TetcvzO39Zndsd/np+pCcd6
 f9CUYP9ndcGhSKfp7HbywZynxY34guc=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e780e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-Ca9_MJ7E5AnbNBKvfgA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX3ehgAp6ZQ/gn
 NdJJXsfc0W/trqQZEBvacX+7aANMHBfDs76VirtgPHrl9MVZOJg+QDjJEEHtu4J48RHQXMzFCGF
 WILr/zn2FLHMN/LVF0KF+Bls2x9lpfmej8ivM7MZl0F9b+HVXtL4IyUUfTk2ptihW6zsqHZs2et
 nX7Lu8EQZo481LFGDcDMJASeovbOOMwQLTot+xsgj7q2W+OxLTySg1KQrIj7m8AjNpTxSdVb9/o
 E5TcYNfhsZ/pSkpJc7drUf78vInLtKl4Teu1YvoRZQwNbtdBz25Z8hdTknmN53Ktf6gSOG5vcZR
 m5Ooonf4EirzoCXtQH3KYIv9ynHUf4l6wsCAFmY1UhAX9QquqVT8FTm/n/JyqI3gMIEY9N2Nvt5
 p3oQV+qZCti0d51z6tf0QoH73hI2I12f9niiocmEcl5FSUwSgik0d7L2n3ixkXIsx9pJxq5gYpt
 JRNK1Sw4xQbU9rZ7yow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093

find_sdca_control_reset() only ever returns 0 -- it just sets
control->has_reset / control->reset for the framework-known
(entity type, control selector) mappings.  The int return + caller
error check in find_sdca_entity_control() are dead code.

Convert to void and drop the check.  No functional change.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 25f95575c731..68a50552f4e4 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -922,8 +922,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-static int find_sdca_control_reset(const struct sdca_entity *entity,
-				   struct sdca_control *control)
+static void find_sdca_control_reset(const struct sdca_entity *entity,
+				    struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 	case SDCA_CTL_TYPE_S(FU, AGC):
@@ -950,8 +950,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
 	default:
 		break;
 	}
-
-	return 0;
 }
 
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
@@ -1032,9 +1030,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
-	ret = find_sdca_control_reset(entity, control);
-	if (ret)
-		return ret;
+	find_sdca_control_reset(entity, control);
 
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
-- 
2.53.0

