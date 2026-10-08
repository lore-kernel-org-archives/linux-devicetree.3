Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB43C9880
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442072; cv=none; b=TFj72Orsr/p7BEmvQQbcmxHbKJTMuq3Z5jL3PmdvHZ6LVV+nSG/i49wqHSC6UdomNXniNaCti6BhHsYw/IwLjZqXcdX1JrNYa6hWrSlwe1CARZZhHfeL3LE9pZnCo3m63ny4UMcLepmHgQuVj1hsJDrlq5E9bn6ePkgzAYh13m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442072; c=relaxed/simple;
	bh=80u2pAh3kUz7aM3k22MQUDFGQu6/eDakd11zKkQnXlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aI+KZFr7/SDqE5fR0DR96N4O8QUTcq04hDfQ0HBFhtdjovbCetilTRG3IVbbDuf41zX4WZEHI/18uk5BOYy4Qa9rFLRY8Lqhy10G9MrwvUHgFGkYgbRsjyQ5Z8HJag3SoWasTmnAV1xhaOPn8s6k83Bx+GLVdn+LlHIfbDYeT/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nllrtFmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TiepFA6t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nllrtFmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TiepFA6t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bi241776068
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=; b=nllrtFmYxX0K4LxO
	opRde25RZOXQpTiWhKsra0U1rovwhlB2fBW0igQUgaWB2cxV3pVEH3pNKFhi8S5S
	8MlqNg+QqKVnoHbCRIP1ad7PJ+5B1lvgHCDhF3etz9STYjSaxLxJZ8UgUYTFf23w
	2lvpb8SICblKu2ZddsrCFFR6MGqq12ZD7uYMkAWXmccComSBfomwbTGjq6lPdGme
	MTDkRSMQJKu3h+ECr8GF0mntrKkZqOQ42s4r3ASZgsa615ZoEoxzCOdxneX+fIAn
	oP8Gs/et04veczNvi9y42zVjBfymkj7/IGr53XuoLqRz1N+dMWedeqMHDJDtP+8G
	UFMScA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39fum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:47:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a4f7eb79f2so5015841a91.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442070; x=1792046870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=TiepFA6tGBECgdgerPLd+xF7eaKx8tpZyp9Ww3hbahPOJeoBearv4qp1NpZ52ax3Jq
         chxBolF11YpUWww4eYBuxzEFkEGrttyMpCa8aJ3bJDEkSrVr64zLTK+9Al52xkzaHp5/
         p0886Af/EPmvt2CxTjY/8xwX1I+Q2+zyeNHO9mZhOVil5TRcxjVlX0szwkqaHwjeLCIJ
         TXN9u63rT3LZ8auT1wDlgfFI+1rEV1JI3ieNFLdu+9T3w1ZgfG5FtWA2NY4iPVhW6KI2
         Y3Llc3dcREVH/gkV9DplU9QsmqZOZJxeZX4vbLfg5OHRy3y0TARj8yeZVF1QP08abW20
         qrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442070; x=1792046870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=swkKumCed9p/XqK4gFrXuWNlfWULvWjNt2TzrB+vNnRI2oVQ2t+BtVTzcHPKYQJYuT
         S1eZJw5NfxjgUXxhpyFXhh2uVpNpGdfUkxYVo0f8dsRmRfGGQIQLcRMzM/i4oVAo2bCj
         FnJi3fkw3veXPsEEm717sx/8zyxEAzzAzOVno2JpVsE5pj15qYKqpoTP070EE5nhDI15
         Q5Hzv4qVii9oVAAEprj7GvladS9a9EXAyvVgQ+n54x82JE8XnJ5LqppGOHyb8+6Kx6rs
         i5R1g4o03Gru34Ho6M49ADHxDnGLqZElOyvrckiOwoEZnFW0EE738z3vj7xzzaXsVRv6
         qrTw==
X-Forwarded-Encrypted: i=1; AKwUvBzYe4kiDBJOUF8o+0zrJcw4K+yX4jaSZpsuj+cFDbutaIXfdYKwdMBn0Ge2f4gzF0fBqQYei5y8K4U4@vger.kernel.org
X-Gm-Message-State: AFq9FYLAVv2gbUurvQCClmwHvHLzey4w1FKJFymuYxmVBdz7JkeHtsCy
	97glcoutQlJzMWjJLjqQQH8FGa85YeXwbAkSY4MTPJTngPjS2Cw12IzsK1BZ/o7t4SHt+omc+uA
	5zMaFjhSP2RSS01CMXE6j7Ql8zjeIgP+uQHygpSOG5YAqB6KG5glspuD6Hlpsi830
X-Gm-Gg: AYBFou3e+CuHfcFYS5Wr8plW9pElZOc3idp/B3TJLMl/7CRLsljReunG3SlctPeJZgD
	PCgCBBVYdxcl43OClZRF2nZll3k0RZe/mRuoxF82oyGzTaGYMx97tru9tJYtToRr6YjRPzkkcpJ
	8+GF+MYPvtreeEc9KPIZeTuArgwZnlYgqX740G4xC0dbtb/eVYljx8tFRzyAWM+4TJ0d1dyZAgf
	izImGsh7Gog2e2D1tYNDkgGLrLW65rybdeEgdrYWhVaSF9O3edctxP/oUfg58cmnnmGr5LtpCIe
	0F6FERx6CrnwZEhxKeRRslOMzWPk+NqcOWysnrVE+Jl0oV4SFzlrv3pIgJOpIkTPud9x/xnHq8t
	LH1949+dpr8bQrEaiLQ5NC7fnV/gAf42cLjIfFeNVxGSOSL7pbDD3FAk=
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245388a91.60.1791442068738;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245366a91.60.1791442068213;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:13 +0800
Subject: [PATCH v3 4/8] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442023; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=treBZjfgVIBmtiVlLTsGxNxSnTktJbBCCAsYZ43ZZlE=;
 b=3SxhVsOuGeNgSvPZ92pETLYV0aGE3Lrja1mLwS8TGb1jJE+U8AFQP9fekEsXMRiNzDPorHWcu
 NsTLPixLPkKAmXzZ9LTTdmipd90gcTa2KYFnIBj5anxhOUkg4ybZpuZ
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac73c96 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXxKgfslca9G2M
 8Ir7DBK+ayPrmeRnYH4ujFZX94ipn10XuGFLHEAEFQim0l+PK1tkpGyf7+2WDkcc9Shy4/iOyMV
 N+kjxDNpNsH3MXdxb8M3i9sRBg2lDMc=
X-Proofpoint-GUID: XCkGx8KlYmWNs9oFDz25oHo8vFMXNs9c
X-Proofpoint-ORIG-GUID: XCkGx8KlYmWNs9oFDz25oHo8vFMXNs9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXynJk75o83rjK
 y67KqAKK0dzOZtpoWR9E566wQHtJLdYizpn8ubk6wvrB53pm237QpsAnlSN7vocc1EZcSPw0g92
 MGoamxj7+751L//wj+nBPgI0s+bDnqZEMyqhBqnQ3DxijKQ20sM4hdMvkv5LtmrfUHbuFn1Zvsz
 H1UgupmgZg8ro4/pGblERoRHfWiHmbWD/8d98zNeTAnP57Bnb1SX4MxDwVS/jHQlNQy0Uu9eqyH
 reKPKndnGDK/oLhgx7dUsJNdH87QYfz9tysmlYfuMkt+dgKkWfvO6YUJ/D/n0OLGovvWI8mz6u7
 rPHr5k6oo1p9o3uNC6rn9PhPwMEJtRuxQBJKvTImA05Wbaj9/4eqQwJh4iTpt9aNsAUpweGRJ10
 6iMW/ZywhV4eSlT5TRyd/lkSFXaqbGtNe8WgSwH06boA4YKizjn0lh74EzBGrSb+3+P0WobagIO
 Eg43wuee+nZElRGMqrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index c4394baa7e53..5187535c8338 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

