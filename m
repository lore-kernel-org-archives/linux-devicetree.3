Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B43DF008
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800366; cv=none; b=TeX1H1VQwGTPkU1u4eWpn/42ZMpC8P9YQPLgTChiI3V9jmeOabraQHjOP8bpi6/qpRJud/75q38LNo3852l+tGfae0DBMT30joaLJWifCfuO2lUIbFcy9Zi/oH634BxBRsMkBVM/RFb76V+Z5PwLwshJaFuaCVEhKgY1TseSzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800366; c=relaxed/simple;
	bh=1lUVDSkQiiZnlEzObAHR/NuLrBUqSDylFKV22u8kIZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bfhL/uUoltRXwpB/VLE1mb0yfQfKzzJ3plqvA/sB68m54B8XPGefrXzPXzn7nsh7IHpC/WgKc7NUYens7zSADVsN9LMwswfChrJhblE3U1Imln/jNlEx1XPwXKA+m+EaHO0t6AAoZeRNU6QDE2PbVmNbB4xfQBRb9sZGW83oTUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PN5e+Wkd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dUKRKNBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PN5e+Wkd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dUKRKNBU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDNAH8569549
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0FsAkefoWCa
	qjOsHcPE3Yfj3+ChUaoS1Dxd6hBcUqzA=; b=PN5e+WkdzhvqYcJRL6yYPBtIOYf
	zdjwjBkT7WuObv+/gc9GjQ45zf2KvlVg8tjIjd+MgPFZQ5XE2eAlSG5k0Jk9hfXh
	0hub9O1pIxaI9Qi+50zh99TR0PxeakW5dfLDh/MSaDTPunRJB3hV0cnYHBdZeT1O
	RJjf2vvwzgU3q5vAdRi/xBRoW0hvApBYsZK8TEPdt9EkRFCeY3IonUqwQg1lT7zb
	drM28PaBJydvkzW4AXo+XfvDiIAfH5MVsXcMfsaFxErxOS+4VaK7JlULquNu5yt7
	wPpiJXSmtDHwrj3TaQq6d/HnNdjBKVCnyZGl8qbzv6OlcfoIDsEHjQiqqlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghf12hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 13:26:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1381018a12.3
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800362; x=1787405162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0FsAkefoWCaqjOsHcPE3Yfj3+ChUaoS1Dxd6hBcUqzA=;
        b=dUKRKNBUMe91yGwKyZyWhU/hMclJpJYC5ARzY1dlTnZI1IublCzOAnV62cjLAstXae
         S6TGx7nOatWOcPPvmpTw8mnkJW+YMi29aDtC+CqteisdbnzjmFUOB0qAe2n90CafVaFh
         sTiM5ppHyK7+GsgolGkR7fQyYgX/f2s/ouRRm3jrDl0jRQXOXUL9Sgs7+LARVIxhZoe7
         MsCvdjbEn96ICld2RBRyDtOYExeYbw8zMj67pY7pRbKKgUkaD6WoWb/BHUV+mvvjATKu
         /Se9xMC0aR6JICxqCm9uo1Wili/AWhyj3YTazm//bxHWcaunK2fEpvT9of/AG9wBSD2N
         mWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800362; x=1787405162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0FsAkefoWCaqjOsHcPE3Yfj3+ChUaoS1Dxd6hBcUqzA=;
        b=AexlM9KPK8MpUgUO5Q7EQoI47PKrWypwyqSRqdpk7KTXIYwLdRP0ktjXvQwwdz6yBg
         6YiPeUWl/tzkZ1hGc739RtJEjBm/8cwAJDHRT2vK0f/NQadw70cNqUAXhddQqUupGEKN
         euZwL856o103+ajC/a6lyMEWjwk68MKxvliDc6HJ53EqdLeXvAOp/f0ooqpeA6Vl7yGC
         6YCnRWaTqLrkcGql7bYM5qsy1MIQdIw38AZ7woxb22DOEVAPPwyvPCUQ9hAhyXpx9yWS
         ZUbojaUfaIR38SaInygSde1Oz10/p0dqEzWWYJ6Hm+DzVuZ3L8+4j/03kJfZ4pVJo0PH
         DXfg==
X-Forwarded-Encrypted: i=1; AHgh+Roxa4O+VlfqN5rTiq3YAgDMOxQB7Gt/qYZ35anw4yRa3hOJP/MaCxqmKiOEFx1vLfv2xGh+gdwxkXSJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGelRcpAmhyw8ne+fsoGexVs8yMybFOuaKxef/6CcJkcldvW3
	jiOeYIgzdaSGNXK+K4BDnvtXWGK32fHphE3nSNKc67axbTDn/wZKsv6Hy+xOG0VJ1jKSM8LJ+M1
	yUgaSd9LwgspmfOZr3qJmYRIahxC8XpKnFBeELLHwi3HBXClbd2aDuWsx85gvVZCiJ/zXSXuQWa
	k=
X-Gm-Gg: AR+sD13Vi/qHH3hfrGk2Po2yBq5tzcDfqrxC5/5P+pbb9O3/S28Y22GZ83lWcJKdic+
	o1w7p8S7V3SKJrE2f+V36XkoTVCnpkqgImNytbKd21GEWuEBKkdSTH7/ca8k5vKlBDgKLiw2130
	LcIlQq6JumfaFFMhibG/j8yK0i/VodShWldCZrYbzf5fJH7zNBtVbX9XG9geN8fotg8SWbCGaKm
	5qDYTx8a5n1s7r3EULjc3e/XipU1cIYbxIAycvFmUxErIwtma2gd3fjRPub7Q2SLTtgO1CZCoh3
	sfgre6md7eBofJDDwvxjDx+yIen4vh7Qzzyk41bYzIHxKdQ44dpEheRSV5T/6wjF57bpPGn6O2Q
	r8GUGVmRC3b6z8jHmAdzUBnobTGVFueRODdawUf1/GybJ6+h3nKn4iehwjk7U
X-Received: by 2002:a17:90b:5450:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3933ed23db1mr14066761a91.19.1786800361939;
        Sat, 15 Aug 2026 06:26:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5450:b0:38d:c74d:29c5 with SMTP id 98e67ed59e1d1-3933ed23db1mr14066725a91.19.1786800361504;
        Sat, 15 Aug 2026 06:26:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/8] remoteproc: qcom: sysmon: Suppress notify between cluster siblings
Date: Sat, 15 Aug 2026 21:25:36 +0800
Message-ID: <20260815132541.1575121-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QsVuG1yd c=1 sm=1 tr=0 ts=6a8068eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=S0uwIJVnaEaoYlcdocAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: q__A6Ox2P8VTsEHzXnghQdHRzq614D9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX9dTdDHn/QA2/
 yRHV1J85+soKza22VECetemmuRzAAzGo9h+oEBnWrRgxw1telVzhXDw8nt5fCmmZDOlK3GtBtTX
 qEuz1B/5TBulidVUmqgcpwU4pCyf4QapA63nnj2nsqBGiWeWmSErZdOTizXvsLp31SMxBgsKUe0
 EJ0ezEHkC9RR/eOis7TQksmRDb6fLSvDQE9un9oELZY/JaNHZPFPAMzGi949qa0j7fdm2LaHP3J
 Y78W4f79ynW7epaBnMNhG4Z9mftZBf8JC1NTG5A4AjNqSHAdlfC+iiE+rAT3poZaCubOduEh3VN
 2FADLouw5eH0L0UHUO828h8Jo2mpZyWAi5mz7EHaKGMDEDap5binpp3BNqhxCJZwlcX6XLa+uHe
 hAvfcSmE/De3HOSbP0v+jvBhVs5baaDFtNwUv9OTMubiya8LyTIGTp3WZhWjbY+iWCX75GWjmJG
 PzGrfVji2TzK2iYmoFw==
X-Proofpoint-ORIG-GUID: q__A6Ox2P8VTsEHzXnghQdHRzq614D9i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX7lKzSBqXF+QX
 fhSut8nn1Z0OLZNIbUYvwNHt5GYxqddA4flqaGXQ2nA7d4m1nt5BRvE8O7KvnEo/AIArefza825
 yrJue/jxLX76Um9TCrQJYh7XFzwrCIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Firmware on clustered remote processors (e.g. Nord's HPASS ADSP0/1/2)
cannot handle the SSCTL peer-shutdown notification sysmon sends
whenever a sibling in the same cluster starts or stops, and the QMI
request instead times out.

Skip sysmon_notify() when the notifying and the notified instance share
the cluster identifier their owning rproc driver put in rproc->cluster.
The suppression is done on the receiving side, so that a cluster member
keeps notifying, and being notified by, remote processors outside its
cluster. Instances whose rproc has no cluster set are completely
unaffected.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 61e1038328e8..5d4443ef3bc1 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -67,6 +67,7 @@ static const char * const sysmon_state_string[] = {
 struct sysmon_event {
 	const char *subsys_name;
 	u32 ssr_event;
+	void *cluster;
 };
 
 static DEFINE_MUTEX(sysmon_lock);
@@ -473,7 +474,8 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
 						  subdev);
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP
+		.ssr_event = SSCTL_SSR_EVENT_BEFORE_POWERUP,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	mutex_lock(&sysmon->state_lock);
@@ -500,7 +502,8 @@ static int sysmon_start(struct rproc_subdev *subdev)
 	struct qcom_sysmon *target;
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
+		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	reinit_completion(&sysmon->ssctl_comp);
@@ -536,7 +539,8 @@ static void sysmon_stop(struct rproc_subdev *subdev, bool crashed)
 	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon, subdev);
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN
+		.ssr_event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	sysmon->shutdown_acked = false;
@@ -567,7 +571,8 @@ static void sysmon_unprepare(struct rproc_subdev *subdev)
 						  subdev);
 	struct sysmon_event event = {
 		.subsys_name = sysmon->name,
-		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN
+		.ssr_event = SSCTL_SSR_EVENT_AFTER_SHUTDOWN,
+		.cluster = sysmon->rproc->cluster,
 	};
 
 	mutex_lock(&sysmon->state_lock);
@@ -588,6 +593,11 @@ static int sysmon_notify(struct notifier_block *nb, unsigned long event,
 	struct qcom_sysmon *sysmon = container_of(nb, struct qcom_sysmon, nb);
 	struct sysmon_event *sysmon_event = data;
 
+	/* Cluster siblings' firmware can't handle peer SSR notify; skip it */
+	if (sysmon->rproc->cluster &&
+	    sysmon->rproc->cluster == sysmon_event->cluster)
+		return NOTIFY_DONE;
+
 	/* Skip non-running rprocs and the originating instance */
 	if (sysmon->state != SSCTL_SSR_EVENT_AFTER_POWERUP ||
 	    !strcmp(sysmon_event->subsys_name, sysmon->name)) {
-- 
2.43.0

