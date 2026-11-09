Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218868;
	b=yJHVoqd/BrTVdUuD9h72O+Qvb8H1PUYeDTevX/mKTToIHMiBdpnDQzUPufbx7XfwTBRa
	 2Uoh/RRqIgyl2mY1X8XT74a5SdtaMFWwhzsKFI4B1HeJ2vH2HHZ6M9emjXiJiKT394nbu
	 A3P/qyhsqC2EMIMD/4GMdBncGZZfoQwDNqRnXlekgIJScwXJqeOGc8/RbAiqQNIaDQguo
	 neL/5RS+LweUn3QgmidSnSapE7Krgqupy5H3LshMHuEgY3R1EYbboSFa5cGxUz1P1Vkc8
	 TxMsvz88VxJcwWdFaMEsEO+vMk07V2h3QcoK1Lf9B7HhIB/bkEs/e5w6B/BRQMT85cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=VEHaR3A3dXZt+kZBQq7ly2/9KX8yeigR+gScA7kKoWeBexjMcJ87gWjvJzPSSPvTZLPS
	 46qzkSPMMNIIv7kd8RSwaRlV4HhMEyDvTV85gr9pMTVytlRYCAeLowQw7apSgxwUhXl9m
	 JR5hSc2ggxDOaRzNIYvJ8RKf6i6PD6S9jHeAF5P4V90WOLjvPZfj0bOH0bGkMf5al+plq
	 w/AkeMV8nDBipAnm4on76Mo8pAozoJV5Jtf4+6IseyTXqs7UXBBGmfC0XS/sU0VS//sXV
	 fOj5+QwCdTezty1eci+M+7QkdSxRlj5VEI8ojXGho5A+ryXntwLituFlfKAGeVK+quQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+K1h3dp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF1606EE81
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DF1606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+K1h3dp
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uu7m3792023
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=bNbsAyBBBX47e9R8
	e/n73IMqaFJxB50b05woDjdvPpwV/cafqvJ6Y+b2MXb//LgN0+r2Oz/Mjp7Zrz5S
	AxSiaEhKEs7Z1O0RaThalq0vYzPwOWIguspYyVKuo9+BVS8PIq+ELy6TFU03pyrc
	Db/G5joaV1/eZVI7Km6Ztx/vyRIp+xH1WeXV7AyEmBZ375TI9Vo08cv5glb9/PgP
	CF1Wild9WOZT4j/tjtlsdxAu23epLhz0uAe4DW4AGhv1V8bf5dWsnmQyoX9xPOqK
	ao/YNQZI8NB7944kQORemBL/Ovq/7RYn0VofNKam3iD3LPmW4c4cE962v0NpK9Zv
	hd1ujg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagww1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:07:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a098dbc7so740273a91.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218866; x=1794823666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=b+K1h3dp0NzQQVOU/hq+Yhw3Xc5B/wcOXWGdNhbmpfkOcG5sX8FzBD9z4uj5fqyjdF
         O/hi/XGa9qVBt/3zIC0Mm0nehYYSqOW/1cbxTpr8K4wwKYjSyHw7H+wrtAkM1X+TEz/V
         NfTYYS45rVbwm2LDPoQPNwGaVvY65osZNNrfqhWmYVNEShjpz068M74s3nFwFjzg444s
         nNRVwjBE63hBTo2F7R3tk0bXSwNxROF3kjgzymDaCxaqW3X/4gLhfZnzpADCXJfgCkNN
         GPXM8PtNmeHD7qIFCOjd4aXEaoSOMPDyPuses7u1/OSwgcTqW10FkEOkk2717xOHlpRG
         eg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218866; x=1794823666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=Td/CyPYsaAPsV6QivoSuCKDsILL7H1RsfI4+WmO2DPtBUdzhSbWLu4LBiH14cnjUqY
         ywNNT2x8zGI8fZJpDV3DsAB6YD2T6tmCrSKMuWgs/bfMXsRDiJPjIqtSwuSQmnsrQ2Q4
         ZBoxDRxPZwYM8OSPEKkFJoGPSitUlf7Rf1GudM0YRIjT+VwJrGJuzObcwHGKowerZct2
         ITbQ56bHYYZiM79WIL8Gujr413LjsK9aV+0tQkIvpULPIEGRyy8jbggt6Wzr/dMj/Gh3
         h6Z9FiY/YEJ0gWAnWmgxV6dexAN4q0z+4IKabp8Wkx830mbbDnsgAIGKzfVEwUniIrtb
         PglQ==
X-Forwarded-Encrypted: i=1; AL+hErFTM+tSS1ze74bgk86q6cWGaKtX9JTwrgFIeHYcql8dqm18UOaiHEdzDLPBqvHsFaFpWkhSuoCtObuJ@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oac8vjb9Vr/C7l6SzgYWNyMyuV1h3RinN2l9eoJ2RPQFOiQoi
	D0I/0fyZ4mMAPEwc9iqT59a8DEMLlXQjbF20KdnqxmAcK/TP1qeEXFoSBPywT+cHQWgEoppo8Vu
	rFdzm2PTv/R6WsS06vutqwnF3rmTrQI5lG+CJzEPc8uYMbWhNJQns7Ehj/TtAHxDh
X-Gm-Gg: AYBFou2fpmsIKP2aK1bAOYGm28DN1Nfof0RsL7XjS4wGe7hABI/IqRFflpB88WVmwae
	VVxZFAJvCT6jhbFJJurhztqJ/j1T/4Xlsq+WhVLGXghiS82vjK14fu8IrVEjiJ93LKEqko5oy0s
	KNLSflnrV5HOpghqLJRNEPl6LxBg3CPU1V899uEB6Zfk2UwpY9MRSBVNhQcCHfIqbYfABbZ02QV
	hQWgfyQHCswIdX+xToztszlS7OrrWHb5YUj+xnx/fBO9xGjUcqGmz2LVBVVllallVu0NCS37EFg
	gWElFmcWgNg/JlVo4b7MkFfdxWF/W+WWXT0L04doE3HJp2HSPvoSwA1DKtBwXmDW3nyZsyL+I0/
	wgJCAeHbBKOVAduiWnOGS7zMhVu69vXc5fxladE1lF1/w2aTiuxLc41GTknzDtceLyl9MaXv+w+
	YaqXS+MDCmDyPME4o6G3VorBPhUT5n
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363415a91.23.1794218866284;
        Mon, 09 Nov 2026 02:07:46 -0800 (PST)
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363381a91.23.1794218865811;
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:36 +0800
Subject: [PATCH v5 4/7] cacheinfo: Expose the code to generate a cache-id
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-4-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218817; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=ozOGB6eLM9+WzelhJAT3yEtCsqCzkfhBnvd8PVWm2gJ8zV1FxEktehv06soBEhpURkRFYpAcE
 GrCUpKAbEj+AXLMisyOFGQJAee0jz2pKuUsGzIKusD+cqkcXHut3kO1
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXx8+9grRZdtDT
 KhBsJV/ULiIVZUmCiwd/UhsUQzHucAjeJCJowYdY5H9y0dUZI5eEfWD8YCeiec9zo57Gf10ALKk
 PNIZqhdce/A1arWCGYSM+GwFZhcACjtuiZGfdQnMJnMEFuaxLrcKNMooBdNq1h86PwiYaKjzMbf
 u16wQO4pGwpMHfVExxWIYY6c7P6HuqPpir/HJhtu14WH7GVHnqPzWmDcQaRdooiKEeGhu6TVzg8
 ObSwbyOovHSs0ksaBM+MxtzoykaR/GSwd2XNe9bNBeGbmb7D9BeTMq9cnNsLkNHE3GNZNzwmfdH
 bPu8TCro4Y8PwBNUXYup/e/Gmcq0eM6QawSrBgw/bj3kj/OaEBlGZLwRL5Nuzi4ACqbM/EaTCrR
 yLV0vLAlUCQk9RqlZT5LjID5x7gI4SDWwxWoU4fWmc088vYXpTMyiM7EqIjJ1IFZJ0VMz0Ge+vr
 zdmrhS9cd+BdZrQO6xg==
X-Proofpoint-ORIG-GUID: fqnh3GQe1H2DQ6g8QXfyYKDFeDvJhGui
X-Proofpoint-GUID: fqnh3GQe1H2DQ6g8QXfyYKDFeDvJhGui
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXwyDF2nSRDGpW
 Jx6Gn0+NFbpTz22U44HR24TjsZGD/GT+6wZDGBlJ6tCnnSAEhNyhF6ugmz3pkf8hY43AzW5NQZw
 XYEih1Oi68FQwsAUmxBaBhMY1HFWT4A=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af19b73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

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

