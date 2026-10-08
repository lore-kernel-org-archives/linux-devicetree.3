Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056F04DE71A
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 14:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471139; cv=none; b=nsh/OTjw0yQ00J4AVH0rb/qa1eBKh3h8R1xC72iBFtxAi1c4RpFcdcrQ9USZZHeshugOul6EQ5X5Touf88/mB/olY6sM4sOHO1e7MmRPNbPeL5+HpLXNTBT4Q2nfXCMCQGZOBbEAOY4Y7STegOpYCp/JeejZRAMIxG22eVSHe/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471139; c=relaxed/simple;
	bh=Fx632lLcaDSUoCnHWNi6ZPrUt57HZStccHpz0lMmJPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYh7ZCvVx1xiHToMfrdpT0+G4ub/WLqqN24XH4MXoTnojgwyXrk4PXHw1BGe01FS6TcczaqN1Z91UciCvObl9jA0eQhb06ww84xy/cBWrrrL+I2g5jDil0fLqgOGsfbyenlphGYTPVZ7n2FaflcIh44x8cRv6jdNHXfXrzPOExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3RHLPcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdYPIX9G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3RHLPcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdYPIX9G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVFOA4148741
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 14:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgrE8ae48IWvCHBpXeohUmCoxvktBF7UD9vd3orSDj8=; b=f3RHLPclcdbrV8U4
	8S6cRSNHhInffWVVTY3/Ccjn5B3bxS/boKXlJlse0YH0t1IX4akrgPV3uQiy1FUk
	g5vCWs0de5oyMN1H6VwFnmiy/HBJE/VGWxFAsIH5v0pevgesClqPcLZDkIz4U8Rr
	a6c7+V0tIHZZaF+vI447r3NifPApyxJnnI8+E6tPvEV7cyBeyG/x8MORTZSJxQuH
	BQ7ALBZ82EADUH4bi7ABAiqzZ5wKRZJy/Euhxi9bqKcrmqcd2wKpQNzhLnegt8Sm
	wbs4kBjsItFxm8Luh0RiqhlhhLDYzZabgPm7BMTfpbGOmzsTV9NHXfN1I+0PlGxn
	BN3FGQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6bd9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:51:58 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ae99a44bdbso61647147b3.3
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471118; x=1792075918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgrE8ae48IWvCHBpXeohUmCoxvktBF7UD9vd3orSDj8=;
        b=PdYPIX9GUhlLBccNUc/lhI5P+FAbN3mLr02pCzlUrv/hxteYpTpHA9JJJ9ni9KThKA
         492ZE4LtAs64ca4vGUKVGqgkJjHGCSF/WoHrztBGuxDsSCIWLuGF6jsOiJDEzwkXWvwg
         UdNh7ANewBBb6LUzs53yibHvOdK7X6quiIeyEodAgjEt5Ed/znTR4+eBTsGQMMin2piF
         PjexB3PKC6UqZnf5akwcL3RElDwto2o8FaX9uqAKmyew3EJPipo15TZ6IxEAg7zDz8KY
         iXUsy49bbIDDxoxpY5KAM4i6lT5nc8XOhe708pO8wNvSuu2Uh86cYpVhqnPDJHw3EsB7
         uoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471118; x=1792075918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgrE8ae48IWvCHBpXeohUmCoxvktBF7UD9vd3orSDj8=;
        b=d1EHo5b2H1s75UCPGDcGLlBp1bwMQgvQOO/Ijysc0no9FM/JF+wwjTpFk4Rgdp1UZq
         S5oX8RJWCUzm1wcVtgSL6gpfXxlS21H1L0ve/Ccf4ffnWAn08mz4pXLY7qCTB4eDv28x
         U1rFbWpDX6QnAfCyvos6idqDPgnDILDQDVkMfwy/KLXQ2CfNd3JVuXGQs3kNekG5qvzB
         Ui03rGVgTBriSZCxUcJV84hWxoPZ9mUGUlsJGQ1Ib8PEia66LkeJ4+q9/st/+YWc73sY
         8h5mlA7q9U4CR00qa7+EVQYkj9zhHHOacRlG6nrjgWSFLyDDTX5OrgyQxihB6l2nrHRG
         274Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCLA/cN3kjaonTxhvrFM/+W18LjmodhjzhIreWHD5wDGo7lV5fFHinZTDHIlhhxmeTjVr6/8XCu0Bh@vger.kernel.org
X-Gm-Message-State: AFq9FYJAKwjJ5xNlKUOoHfA5RcQU7VDE/p7Hmltg7YCUxbv0yEl8Jw5+
	M/McQEfRdXRL1lwOD7XTTjUnfQXOGDjkZyxs7Bxo5kMdDVd/G97l4o2n6e7V3N4sn4+//qAn9BS
	wHxzrgw1VYoS1kBvETmnPNpcGcCqdbhhrNLMaeqZb8OeM6iWTSRwiKGLOlwU6SnRH4A01E8mDmx
	A=
X-Gm-Gg: AYBFou1yHscZHR3oKljierFuW0z5BKedw0YviYhAG2QAxIBhQHnLhvgusJkjQ5ECxps
	Aky1ZjF3N9j5OIi3B6RgQXjS8BHdmd044ou60TkkOYQLKx9+hee5pI98UKeR1g3l3/QxnSm2lh7
	BBq2UqNhzhR2bjc00IdyWQA9SvkYCRnJ8FtUjsu8uDQf4joF2cVJw1hL/jCOqyJRjws11/qP+LX
	lkVX0PxwKI7X74rFNM33zmimDf6ZSFBtp3cMELKA23s4HZ9e83bXyPnPqOrtZmH0/cPjSVePDZm
	EurpnMf+9ntJrOeCWxHiMexDkMBEzonmq2JMWEqxGM8zAdOrpnIPuae04YkwtQXAxEPhGBisAnc
	RAs+vllkZdoTyK8cInkTa9kmDmjlZh7t3oS9LcTt8vfQ=
X-Received: by 2002:a05:690c:6c87:b0:8ae:6740:999 with SMTP id 00721157ae682-8b05aff61aamr28837637b3.20.1791471117849;
        Thu, 08 Oct 2026 07:51:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6c87:b0:8ae:6740:999 with SMTP id 00721157ae682-8b05aff61aamr28837537b3.20.1791471117454;
        Thu, 08 Oct 2026 07:51:57 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:56 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:40 -0700
Subject: [PATCH net-next 08/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 scheduler resource configuration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-8-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=3976;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=Fx632lLcaDSUoCnHWNi6ZPrUt57HZStccHpz0lMmJPQ=;
 b=KV43cgjGcnbhtWxdxjLDxOVzEY5Y3sIlAkOogWMv6hUdPUR2jylpyjMGXLFvOh7aHq/oV+q17
 5sa98+OA40rBqU/HVaDpur720zXv9CXy5z7PpjHw25qs5GsSUG9e92v
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: ySzzDCXelXRkoRcTqvRpEJ8EN27bhGe0
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7ae0f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JGQ9ZE40oQCnb2Pkc9sA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: ySzzDCXelXRkoRcTqvRpEJ8EN27bhGe0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX5WmsBP8w/xC2
 NW1C6MFKOF++yEfJ/YLBPMj6pxfFPmgYsknpJH+f8DMrXsT56vKzIeFhDOgm0gtJFyX2wz4lh7o
 pwDCgdd61Ago6q676hqTTk3GXeQzV1gj9aLjcRJdKEXbhZgKgdurb9MStKroCaO8+r/8iJHuINe
 tMT0UFYLf+26nfPbRVmUm7EungSUbktfnhEaKdfDRDfI+/BXYAZVXbowYpJwTTknUWBM5kSoaAr
 r8l1SSf7KMKSxwWIwjF+WT6Uar+T7oocUfw0s1n5stM8lrRsEOBnVbYmlC6Ks66Rmew47LTDiRV
 0+UtD2izLe2WsM6jkIQ3tEYMSesUkNelkxZc+jtici2IngxKPcr9djAOuGBnnTZLZ7h4SDVS4rS
 93xa0iWtFzjCfk2Hkfw0X9twTxSy2IQipU6eZv0JOJSDQX/JNWonaf05url9O2wAdpkN7rbET8y
 rxMBDjKIgDBXHv0lPXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX6zJIWJlN3bV6
 v37MVfuQE3ejusGl1IvkIBhjPEllsXgWDaszyJgHodluVIvjDzlwQThU995rZ/H2XQ0eDNY90lF
 nY239whiW97EpP6mtKIfJ9aMmqEYzEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080059

The PPE scheduler resources, such as queues and scheduler nodes, are
assigned per PPE port, followed by one reserved resource entry. IPQ5424 has
fewer PPE ports than IPQ9574, so its reserved resource is located at a
different position. Add the dedicated scheduler resource configuration for
IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 84 ++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index dec8eed77253..87d55f7b7975 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -814,7 +814,7 @@ static const struct ppe_scheduler_port_config ppe_port_sch_config[] = {
 /* The scheduler resource is applied to each PPE port, The resource
  * includes the unicast & multicast queues, flow nodes and DRR nodes.
  */
-static const struct ppe_port_schedule_resource ppe_scheduler_res[] = {
+static const struct ppe_port_schedule_resource ipq9574_ppe_scheduler_res[] = {
 	{	.ucastq_start	= 0,
 		.ucastq_end	= 63,
 		.mcastq_start	= 256,
@@ -916,6 +916,64 @@ static const struct ppe_port_schedule_resource ppe_scheduler_res[] = {
 	},
 };
 
+static const struct ppe_port_schedule_resource ipq5424_ppe_scheduler_res[] = {
+	{	.ucastq_start	= 0,
+		.ucastq_end	= 63,
+		.mcastq_start	= 256,
+		.mcastq_end	= 271,
+		.flow_id_start	= 0,
+		.flow_id_end	= 0,
+		.l0node_start	= 0,
+		.l0node_end	= 7,
+		.l1node_start	= 0,
+		.l1node_end	= 0,
+	},
+	{	.ucastq_start	= 144,
+		.ucastq_end	= 159,
+		.mcastq_start	= 272,
+		.mcastq_end	= 275,
+		.flow_id_start	= 36,
+		.flow_id_end	= 39,
+		.l0node_start	= 48,
+		.l0node_end	= 63,
+		.l1node_start	= 8,
+		.l1node_end	= 11,
+	},
+	{	.ucastq_start	= 160,
+		.ucastq_end	= 175,
+		.mcastq_start	= 276,
+		.mcastq_end	= 279,
+		.flow_id_start	= 40,
+		.flow_id_end	= 43,
+		.l0node_start	= 64,
+		.l0node_end	= 79,
+		.l1node_start	= 12,
+		.l1node_end	= 15,
+	},
+	{	.ucastq_start	= 176,
+		.ucastq_end	= 191,
+		.mcastq_start	= 280,
+		.mcastq_end	= 283,
+		.flow_id_start	= 44,
+		.flow_id_end	= 47,
+		.l0node_start	= 80,
+		.l0node_end	= 95,
+		.l1node_start	= 16,
+		.l1node_end	= 19,
+	},
+	{	.ucastq_start	= 64,
+		.ucastq_end	= 143,
+		.mcastq_start	= 0,
+		.mcastq_end	= 0,
+		.flow_id_start	= 1,
+		.flow_id_end	= 35,
+		.l0node_start	= 8,
+		.l0node_end	= 47,
+		.l1node_start	= 1,
+		.l1node_end	= 7,
+	},
+};
+
 /* Set the PPE queue level scheduler configuration. */
 static int ppe_scheduler_l0_queue_map_set(struct ppe_device *ppe_dev,
 					  int node_id, int port,
@@ -1153,15 +1211,31 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
 			  enum ppe_resource_type type,
 			  int *res_start, int *res_end)
 {
+	const struct ppe_port_schedule_resource *scheduler_res;
 	struct ppe_port_schedule_resource res;
+	unsigned int scheduler_res_len;
+
+	switch (ppe_dev->type) {
+	case IPQ9574_PPE:
+		scheduler_res = ipq9574_ppe_scheduler_res;
+		scheduler_res_len = ARRAY_SIZE(ipq9574_ppe_scheduler_res);
+		break;
+	case IPQ5424_PPE:
+		scheduler_res = ipq5424_ppe_scheduler_res;
+		scheduler_res_len = ARRAY_SIZE(ipq5424_ppe_scheduler_res);
+		break;
+	default:
+		dev_err(ppe_dev->dev, "Invalid PPE type %d\n", ppe_dev->type);
+		return -EINVAL;
+	}
 
-	/* The reserved resource with the maximum port ID of PPE is
-	 * also allowed to be acquired.
+	/* The reserved resource, stored at the last entry of the
+	 * scheduler resource table, is also allowed to be acquired.
 	 */
-	if (port > ppe_dev->num_ports)
+	if (port >= scheduler_res_len)
 		return -EINVAL;
 
-	res = ppe_scheduler_res[port];
+	res = scheduler_res[port];
 	switch (type) {
 	case PPE_RES_UCAST:
 		*res_start = res.ucastq_start;

-- 
2.43.0

