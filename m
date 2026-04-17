Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF0F37F019
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776411316; cv=none; b=JSS1Lm4MHqjxv4TEsnh2Ow9FqM25sSCGlz+xOL1UkeiP3Ss/YlBDlMDQSTMlPkNcXDxOzD8yw52Jugxz3MraPlMzZaM/I0jPNQc9VN0TASy8vtfyTcQARQQKgQRfN7xhsXxl/5X3KqVQtuQ5OLB0knG0/x5fPGASkZaqSK1m8xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776411316; c=relaxed/simple;
	bh=/GxrqyShWZhhCu9NPNw1MksJCRtI3frvzN1IvUNV9Xo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UUDnRCiDyn7jWxM5bvHV3OObR8ofxzhNhV7IotSgFd9cJLZfMZ8M6ZsNP6p/os4p+rePW0FhImEMMFspo34A80h58YLOi62NOAnK+2sEPHUvz8PXO5dyqrnHaM3yKD1sdrw3auZcQlkgKmyC4NDbj1sgu+p+yvlLeelOYQu6Yj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkaTCHx0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRJZFq0u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkaTCHx0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRJZFq0u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H0fqdr1981934
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzlwHG7jhot
	LNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=; b=UkaTCHx0RtCDf+fkEkOhUHMBWjg
	3J83PH9M0UvtNbr8tdG2ZT4RkRPt2ImAaEUFe9m+SWSTi7yIlAqeDtVFX0KO5aG8
	n5DXxjvEUaP7jPIv770RNiG/b1GopU4phME+XUfS47P1A6NOWt79RHzKi3qF80Zs
	DDbun5ElxRMAE12FkSuDsUIDvb19D4oqavvMliOf95HPKU9FfstAOwJasf4kZ9p1
	oBgw8VzPCRnhE8d6IqzGL/hgFzOXudszMFP4Ng6nw9vXvSVpihQMagBcsrpsSr5u
	+cUZOBCR1dWPz538Y+qBZQH8Q7/5YzIGucncFytmdym8jlrC5jLAGLWHgEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jj5d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:35:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso373664eec.1
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776411251; x=1777016051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=;
        b=HRJZFq0uohC3deWbtU1KyDi/Bubn6Zsv35BbPOtevoJ4ZeaMjRjNA9PTSA4BdAInd5
         H2TucjhruyC5+/NF++Pdq0od+YrZFxSiD+JRBrjkYQFPvXGGliXMJTaToo/gGaH+KjKk
         mesQbs7dsUvfq3kZS4inzyDWaSF1CAav8/WYUtd+SrjXrIF3MBOBiHqQeuxHHz6vxULr
         aH/hvnBsg2PMMWm8WbtcuCDi80ULCnJcAzQqYNOIpZIgnOIRZkbKj65E828ILcReMkwW
         s3fXVPzahN+krNx2qUjhog37T9Vc4WERhicC2WQqc0j1HdGjYoV4lxykmqbZFztosdJ5
         noKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776411251; x=1777016051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzlwHG7jhotLNRO30L9UEJODwYWeGVbGNVOxC1oDuvc=;
        b=ZmwtFGxv/4QeejM3QaOG8t03BvGT/8XoBX3UHqIx5xhfTW+fyBwbwvVfw+Ee48BKnO
         ALOk20i7kMKQA0qosWKI34rFV/Z5oOyegalhUfrbRcuHvgg+M+XtngWLKONLvDePGZHe
         APrkBGRXZNoxOW3LTuX9Uw4ujX8zWWxP9QGmzZZij0/zpxv84hi1M+Yyqd1qrZG6eCoF
         GQKD7y9Ydg8rj/xqIV0Mv1J/SmR01Lpg6ZuCSucZqYXWCrLha11PjT9PfL9bfMh+Vycu
         hL5r+l9w+9/zGW3rZ+kbymNQf4J1C3ZDl1JQ/C43Xtze9OdhyVP6VMeLwYadff/B0pLT
         wrmg==
X-Forwarded-Encrypted: i=1; AFNElJ81eWRtEmF23tLvUbNDrGMMEHIw+57yban9AJlH8QKFy1t0POHhyPoEfgh7hHFuhjE5DCBO4YBB9ZGz@vger.kernel.org
X-Gm-Message-State: AOJu0YxzajzBxw1HSwvWzzMoJVT/CBkBboq2Eb8hIvzHtQx2jWnI6G68
	cQZnN2+ypfDBNwxs/E40yGOPDt0wM0pkqQmWrERDu7b2/8zVHgi3wUT7QI0OBd8bCzaIsDejHlN
	qv7CV4FoZWXevN2k3ZBK3jR3y6pDWANkg+JZJr6KD+Kb50EesG15AyumxuC+Q+MZO
X-Gm-Gg: AeBDietPhAggm7r28gL3rlpP8HvktgrsVkFzKI9lOXGiQBOPk1vukvJq7OgWdsow8sn
	57W72u5FMVjQA3+Lpb6aFQpisHl9Ebd3OikC8ydsQKkyruMuP4EpAOySps6OiZ6K3JbEXoqLY5M
	I4DTQ+e5gAHEs9lFjAY4l8Fwx7NiKvJM4TvHoYWNuf0+QtEilWP4WxSnSMCs/M6jGaw1RT5tArP
	x8Kt5cltQfqZQT4vu7gw9ACQf9eREQcIurPzen+YUFrmlwKF0En8OrkflDsX5wS5/gHnHBoiyku
	GddQMcZywpXanVLw4uZcIrGFPhHK5+1I7Da249hk+Pxdq+9Kj8hWvhNJuAbR/b4zgSmE/cuyO1i
	6bGamTKyytY4b0X8ZRN1HgQSIzYRCUSatkSx5Tbe/H7q/dG4JI7DgYi7qz7OYp4NhB1gn7oWTU6
	+hpnYfuaBF7Y8=
X-Received: by 2002:a05:7301:4591:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2e479214a0emr691206eec.26.1776411250714;
        Fri, 17 Apr 2026 00:34:10 -0700 (PDT)
X-Received: by 2002:a05:7301:4591:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2e479214a0emr691194eec.26.1776411250104;
        Fri, 17 Apr 2026 00:34:10 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm1135168eec.18.2026.04.17.00.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:34:09 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: [PATCH v14 7/7] qcom-tgu: Add reset node to initialize
Date: Fri, 17 Apr 2026 00:33:36 -0700
Message-Id: <20260417073336.2712426-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e1e2b1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: dYxpX4ja6oANmO3Mcb3Q58FLPp9v-QlD
X-Proofpoint-ORIG-GUID: dYxpX4ja6oANmO3Mcb3Q58FLPp9v-QlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA3NSBTYWx0ZWRfX6HvcnnUcG7dg
 Y42hgiEzKcIwNtf7oaKUmOSQUowUIC/uGaRWBwXV/AezgEM5Xp6nUvr4SuYQpb9UEs4m1C8ZmFy
 h4PKfFfosiNRcX3Yjmw8Q1h0wuXsnI5iwNQr5KjzCrksTXMFC+b7GV4KQMKjafC1lDL6IU23Itn
 QGovjG4YySxuYr5Z+vOHGEyvQx3NKDZ5Oox2tnYilC4gOgJ6m9T4+KLvpA82X9jcilJhdA++eEQ
 NfI753hNduzcTjqNZcVhGa1GR40YuEErukUXeggLz5rN6EQU14MaeucLYRWViRRO5dZMGx3u4lt
 PP9ripgHDb4aF9qm6OZuNx7vMAk4ajNkDKK25U7z95OScoEgNB5ZlxlvilPMrVolEZL36OG//hl
 ByLta/eVHfx+iDvhSXlogRTTXv/9Osp+CCwHlr5iAZU9Esz2RNMdJYr9IvBskoIB8lP7l6YhvL2
 s2zOq6ESDMzeJJTIj7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170075

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 74 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 7a3573e03e27..a6b6019c8ef1 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion:	7.1
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		April 2026
+KernelVersion:	7.1
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 6d5bf2621cb0..9fb51f2a912f 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -420,8 +420,82 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	u32 *cond_decode = drvdata->value_table->condition_decode;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	spin_lock(&drvdata->lock);
+	if (!drvdata->enabled) {
+		spin_unlock(&drvdata->lock);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
+		if (ret)
+			return ret;
+		spin_lock(&drvdata->lock);
+	}
+
+	tgu_do_disable(drvdata);
+
+	if (vt->priority) {
+		size_t size = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, size);
+	}
+
+	if (vt->condition_decode) {
+		size_t size = drvdata->num_condition_decode *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, size);
+	}
+
+	/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_condition_decode; j++) {
+			cond_decode[calculate_array_location(drvdata, i,
+			TGU_CONDITION_DECODE, j)] = 0x1000000;
+		}
+	}
+
+	if (vt->condition_select) {
+		size_t size = drvdata->num_condition_select *
+			      drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, size);
+	}
+
+	if (vt->timer) {
+		size_t size = (drvdata->num_step) * (drvdata->num_timer) *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, size);
+	}
+
+	if (vt->counter) {
+		size_t size = (drvdata->num_step) * (drvdata->num_counter) *
+			      sizeof(unsigned int);
+		memset(vt->counter, 0, size);
+	}
+
+	spin_unlock(&drvdata->lock);
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1

