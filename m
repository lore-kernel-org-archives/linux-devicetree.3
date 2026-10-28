Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188094;
	b=gu6T82YYm+PRUdJSWnnjgBCmkTvQfjpPIhqBv2Yud4O4N2Mz5UX2qVRXsUBsuqHLAr9v
	 koMbd7QjFmWiLyxWpKCs23SEZzfNkle7YsX1F2Px+bFF1B920+5sBA7udFQ1NUHwIMPhW
	 l3GmznTtPU32YpAcYLtqzuxU1Y+deyZ7JG6/rg9WocFlJb4dLBuDyMaXg7T0S3XpN9I9s
	 UAUENiDvAZhy/LuofsdwsyYlQJLlGE+i146+IMvlBybm9jRzUAF/0g9JcqY+lJ7ladWP1
	 lzeg92ekJx+OH5EHgOx2M2xwHqMMHUpMPPvEqD1HpaFTeT9ne/VoBxREIPwVHgaMa6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=fZD1Orsgb7IXTz2ubC1d2Uqd3ceclYvl7ASaFAHx2OO7WcEGlwbXa3Nr8rB/yVbyP4Ox
	 T9sDyqCkL2iA0E9syEhZJKhBxFjOi9ni2xv/dj8LsRQDCiaPLQTETLobv0lSFOadOVVxZ
	 IvqxZ3qV7pBWLhOuTW0W2t7MvhTAK9go2O7xOh7jPxOUu6s11PnDXLNgcjFv+3vTzK3ko
	 zM1gtTwhegS7gANLq2TPT8YVhOdddAo4TBYyuI0LReKgNxmSAf3LocTh7do3AiJAWWt7F
	 Zhuwd6rDjz+zXYeCiS0kAZ2STGnPrd09UoArVhetRno42MQA2KVsDVeXZs0zJ0wsJaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiV3V4g5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13A606A32D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F13A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiV3V4g5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAKS1606950
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=aXsC2ItG8FlL+JE9
	KAC2z5roNxozGt8CsUW+hq6elaEKAV/ncRmKYtMZPRCnPkDPs2TTuZ2OiGK+giQA
	b52xmXp2aIVv1zqXg4QlS5N3m5ab8Y8YdUaeRtgIg/hIVu9zpzJL0qUskj1AXMo9
	y6I3KADqPUEsGzxWv8wKderFC9PTw5zhGFUC1NJkuCQU/tMjHzuszpo3wlsS5nb+
	jYfWcgqvGgoLTHX+85QB5NOCAVt5SjguJ4+WRNOgeoHQS3+u9uzXjXTVjNjTShlO
	OlWla+SI/vc4PNEPHSSDOJ0oVZyi4lfe1Rw+rw8nogqigfJ+0lbfgzKs00x2aObz
	a8GDQQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j0d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 11:48:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso13086215ad.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188092; x=1793792892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=JiV3V4g5Oio2/IJHLh8nJpM+HoCchbN4wAewaN9moG4IUm39d4Z1nWZSPBKiH2cCrb
         8IwpG2rxhLEzl9sttRZECR/6SUPBCiASC3fxKMz/Y+6vKu7p1KAOBeICSzlWqNx+AIsy
         mjTOt8vo3v50EhS/oyy4riTgJdrC0y6KGOUmRMjT07GCm76eotbLMe9ULe4sJIjUXfjI
         JYNjmkRY+feTFyfwol3ZPFGgciiUHheMrQTYZtZBeRgLkK+lDw0xMEfndDTJd4t2LWGJ
         YXVRyLi+/pjrgENl/v6gp7Tgzlld3EoZhDUQIiIVnKr0xBGKZtlZ+vlQf2uYmOKELtA4
         VoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188092; x=1793792892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=i01LW0NEA3sf8JtAH9QlShPMRUDGnPKSZQiRY34sqP3Ueypf1wdEubzXdqo6GGNmMd
         qVK0Wi+SZ4iJUw6ue6vLBW7MYJqAlWrHv4Kqtt7RemX/IWz5etWE1yAbHiHMBGsQ+dfV
         1e6/sFKiE6a851dgLWI9ATs8PDx+4UiFexVgHI1ECJUneRtIbKnb4NEaghLH3/D1lqUy
         w9fYlOG2Ytofx6phonekhVOi9zR5c/w8BbOB3WF4FEHiIoQD7+FpqrOiK4Z3c/3KnT3i
         jTEyaEba7wuQd6jyBPCrdOa43XN4P7ELn06P45MMnkMyN59qkm/qBc28j5Qu5v9r24Fk
         +X7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrQD7CUYGiHwdGws6geEu8DnBYVk2xLwU+wpWxC3PWRQb3wnwVIbfn5xLMtwVY0ZGciIVHG6X7iUMu@vger.kernel.org
X-Gm-Message-State: AFq9FYItM+Mem9tUrUeiEJ4xUUdxPHqEFkJkUgujJkvDT+MWd5QAk81q
	udpQu4ZkpOBvT5hXFsfFsO0r1gUPSHa7YaoOrKi26M3K3EqKwB2yIjdEtaWJxbHoMcHow/HXZcJ
	AVyLLfkGBzczdjfgA11YWjAd+OgSde0tTVXJ6UlDMeJaIyZTUPYqciFqIsj/42txo
X-Gm-Gg: AYBFou0oohiXZkAXP4ATQrYLVDJ6bLPCuMxzGjJMZKDa6xKl8j4mCNH78NeSGEofTy4
	L9fUqkIurXY9GJzCK15452Eizm+WiYPcBIFhkfOa8GRovZkwblusSby3F+pU2YFqE/L3TotLylh
	baRth3yigCOUbK+3/z166DoUhVkII/B/rx3seiKXtnz71I+mInYlf7qHnFdt+iN/Vj9T5Gaj52w
	Fy8M9xlun3saWW/HTDNVVW3BuFpQ9/1jsmCVimkuVSO6jijf1U39phe6OZXrnXhKS8nVoSocqtc
	+J7vQ+ycnCECtyu5umqWcV71RnrOs49zyyxHQ30xdoWwTyPZIRiZJAw22Cqg5yMI2GFB1rRBVYG
	BlwbbEiMdTfnezKmYLPZ3mejk2nOh0gvWeuEy+8AewxTH18hEkOrP+UouxqNYtI/X2KaWrl/XXI
	Q93yn4VP2WScAbHjz3kMLZnd9omw8U
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527265ad.10.1793188091874;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527115ad.10.1793188091411;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:10 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:44 +0800
Subject: [PATCH v4 4/6] cacheinfo: Expose the code to generate a cache-id
 from a device_node
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-4-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188047; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=n/XKEt2Df/QRRSl8LRoUZx320ZarsgT1ChUAkMLf5iPokWhJmxBSvVq8VNfkWiupCG8INUGKV
 UphnCzwL5k6Cf+mbzj5Cf+NoXIJ7fNZzyfax3mT22Nr/pOTnN1hhPEm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX16ohGUHu+ukC
 ujjvDHMZgzjtIIph0C7V9pMAbqXxf7kPsKeCvYPSE+3HX5RkPSk0ZVZJeFUK0kgmN3Vj0lam/UW
 +7EcWwGoA17/Ly4lkp/QxqT9fWcER4U=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1e0fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Ji_8qMBuQcOsNLg1Vx8SQFDSRHiLSuL9
X-Proofpoint-ORIG-GUID: Ji_8qMBuQcOsNLg1Vx8SQFDSRHiLSuL9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+/dSxhWTMBec
 LnzOhGabD9y+b9kutpjYBpxQdj08VUBrLrsbTVfhFY/DiBEYoxZ9lRbtBfaw0PIusoEqdBCRg1i
 DdCRuX2rh0027bAJ5JkZO/jH2q/2PDsGtkaJRKlGVZsEh+8CtURnStSMRHAvDayEzQVcD6DPueE
 HZfuIKcZZvl6sdWeU8YmnZYv2au7lHt9rgSv2RDkLl+WVfyMcn81y4F8BpyuICv9hpeFjDHP31g
 3ApVZrINGM0EJmVlJs28atxnx3/FMrHKom/el6XKl/a11zYCe6Bgusa9Y/H1r4kMvTt+DQVO060
 p31h/QfSjm32SVF2PpV5HroGxYIK0/gwZHmcKVD4ZF/ATKfFJB45nIF4H5905msK8A7ZaMTymxp
 xCYK5+SYLVVIZtWkbz6kqG3yhdXfUk/kMmzXWJ9GV7hz5ma0Tf407Hg2kmbJfnkdPkWvJ+ZRq+7
 MvQwD3UU7bSz8XJHInA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

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
index eb8a907f6d50..a4b10f3a9007 100644
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

