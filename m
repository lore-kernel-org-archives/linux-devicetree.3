Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280938;
	b=U2UkyNsWcDgLAtUXHzskQvPfxL5Qm21k679HAhTKODRbrFoAN7Lf7HihJMqe8KjUdJNv
	 OjLozVHVXuYsUlsopP/gVrNf1uEkCXFsVcNf3ytk8GOd2l3tJ46AyxcfhC6T/eyPAUxgo
	 CSMzueeaJ44NwU41kUJNGc4lKm1QkHmkzA+I2ZUQQbWmtN6ETdtnrCOVe34yfVmi/FMj1
	 S7acIiCBQWCGwR4/t7aWy/F6eUuOBReYtspA9C2/KEQXcZMIABczDSVcTmX3k06xgx+9C
	 NH2p0InWi5gfqZ55OxxXy8anrrFN3+cUF9s80PflLSiAflY6LjfpN8HJJQ3P1TBFffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
	b=UrF8GOHjpvEBW0dnQZB9GdNIMuXpK/MYmu2OoPvjjAfZxPgDmbmfn8RAG3ln1kYFEWXf
	 2Ws/QcjZebkts30yFF055fjXZRH5oGkX/WTxhOTx5OEqFmvGDLF2m1S4+MUiPad3M4jNP
	 oo4sJASq1bBMVJOEzX1dmx5sdXJ5wTytFCV8v5etKth3VaEK46ChuAMSoSeknmMmwTAmi
	 yxFWw584POWqj41MMP3GLdyiOLQaGw7NGbB6bBkeTcCxNEkzxwQTxbQfjqYL69AEgJoTq
	 V7six2hT6lAiShCSeDX52iimikEQLGzaylWaJ0+4tqBsY/+zi57l7kv/3pnYBarwh5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTNwGDwt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BC606A334
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13BC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cbaz58si;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTNwGDwt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jhNt765210
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=; b=Cbaz58sibwWzB0b1
	DNPpR+nVrWn/Ft6CSpW8EdtDjOw51AeZKZdb3xxiO/rKgWhmSQWg/+6B6JLvAKTE
	44K4Qr3b7gO32xf+a6jNs3RVPt0MRA24MbnEtLlhxDrOt4R8ej7pSW2AD9q9ZfjI
	AADbCK7GgTl43gWxRJRwqqMbdjVjBCndjjzwyRPP6pmQMkjF6Ux4YFdlwj1JFFN4
	Tyq/XJKn1y+BjkpITIhdhZQz48OPC/o1gK0u+ggse6RkV6+MbiQheyAWgc1FTzUC
	RrGSJRFMTkd4DPdXrB/aZ39AXsnZDrzTNEXR8MJsLMMsDbq21geBJtVOYyiUCaB8
	RMikJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkh57m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 03:22:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed077a15c3so15886065ad.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 19:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794280935; x=1794885735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=iTNwGDwt8/Fa79UR5PY8rVcK8vUMDw7+xytCcgne8LC2yMICPB3ig9ahE/82MKa1+b
         geWODTA0+Hj7urNzhwfhUklh1Rp3vgHvvAsOLI6Lm2GYYek7tWm/GEsOIZKOO1fm4vZk
         GIWDlfLNV64LymzI2Jn+ONqn8X5lvq7IT1tYJFPWqnhwEev8ExdASPo6UbIkD9yLg1Sw
         gndp8ryyEQpRwexSL6LcSYVui+dB2vG8BSdI3rvEY4n2PnywghZwAq/1tCQGoYyIqziL
         jOI3sKYRSuy+m6JtX8luLHpAihbQrXWCaxNinoHx9YgAovluuMYo/kNfwCXo8KsAYUad
         zIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280935; x=1794885735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRHoL0IowPBtdkXq6acf6pO5kP7NbE/jHqMLo/D6VFA=;
        b=ymQWI3j2ca78DIgCnx3Q1Gpzvs0LtGGCJJhJG0vqxIseXelpWsWWXMg7bdIjx5Flma
         7hBIeN6zOy2BA2RYnQRmHt17XrIftWZTQ0YbtplMh+JC5ywczmg8S2IdQBu5pY5q/UOV
         tr5xIDVa4Foq4I6ASk2TZrwohtEu8PkymvOWRq26+wnzCtTfvO0FO+qajCvwDRGKnK34
         hywSiKsf+Hj3pS3XyNKAxRdMGLF1V/RifrcDiU6turoOvcMb/ZV3fxzqe9QD/ZktXb5A
         E43b2IQ0Ss6BGIp8eqlBhposhPHv3P2ocJoBMX4QAp8N6NJWhMS9X5qJWtVm8OiNf9oU
         P4hg==
X-Forwarded-Encrypted: i=1; AL+hErGpzmP84YOQMza/sW8rwJgBzfYMhZ54tffD2ovovg0NKZpopcCMg+aXSt1c2TbjKokLhUXGfCj5Peeg@vger.kernel.org
X-Gm-Message-State: APuU4Z+VufPKlwPoAGl1B+BYVqai+2tCvOA7OQH+f6xxFce/mtnE6VnI
	tVYqTLgbxgvKKZ3r3XOZs2kD5h7upYkJs4FpovMaRkaLEOiFl+YiQLgEIGLPCjdg2JnS+nqnnzQ
	OpsN28dIZNRT04EUraJTheWm7Cauw4DKqxF+VeQ4ULuJYpG7oNQfdqcvrtXrgwURT
X-Gm-Gg: AYBFou0mZEzIIWiU0wf6t9S06+YgsUpDXfIZ7TmG5nHBS0vWdLn8YOsGwUIoMkJxyGN
	CM7KTyFk7jhDD99tFWdSsL24g4KFpfqyFIVXnJpjb58f771tjPBM57nYcErL/Sq4riFNgYsDFKi
	KExUEScgW7beXFESLh7kLSYqQwaq8nBztP132p6aYCO/LWj7V8CVPpAoTrZreuZblSczPPZWlrq
	9gVRBKddx6MfFkDUsA6E19JjcKaYcYDWBXcuuuj8RMElG3dE15S0iBWF89IAGy4zQg53bD0n1QW
	qRW4NP2nGFH0sWvPLFsTL0VJ5wS3DFMbLUalKZpRiQD3hKZui3Hh6Pg9F6RmdWtMWvu56h+gOXG
	CfdOul5c2lIkCwa9z0L5fOfuY7BpadbkhID/ZC7xORnouN9EICw0PzxTB2MM5hqVEOV2wwNudK/
	1IG4zL0QbNOSSTcwEpFdwZql+/W0sM+XG8bebO
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671708a91.41.1794280934780;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
X-Received: by 2002:a17:90b:224f:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b166d0512cmr1671676a91.41.1794280934315;
        Mon, 09 Nov 2026 19:22:14 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16fea4243sm2341a91.14.2026.11.09.19.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:22:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 11:21:23 +0800
Subject: [PATCH v22 1/8] coresight: core: refactor ctcu_get_active_port and
 make it generic
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
Message-Id: <20261110-enable-byte-cntr-for-ctcu-v22-1-05d48c0eb110@oss.qualcomm.com>
References: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
In-Reply-To: <20261110-enable-byte-cntr-for-ctcu-v22-0-05d48c0eb110@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794280921; l=3915;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+oZshRSJK34bHEGxdoF7ktkVcnA/k42MY2hxHJFiV/4=;
 b=f8pPXp/NPBBf5arnW7j1D7MGNcEC1eM9jlHACtmmEjygK2LstAzouhm035tQzUlqqjXVnDHmY
 b3+9dIR3KzYC8O8lXd271su0g5mYtW91OCUj4q9M46oxk+UYGuVE43H
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: m54yf-MBsT6DTN_vcwBnZ32rIvB7DgEc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfXwBOdIkmKlkr/
 U+Me/P1a5xvTy58XjlifAN1IMT9x5aeSAMxEtG9/7UBsY3RdswKaBfM258yzE7YdxGTxB/BKfS5
 v+l6WiOnP7MGaawnRpKr7GeIw1Fy7IA=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af28de7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=lyq7_Muqgj1vGRpOYO0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: m54yf-MBsT6DTN_vcwBnZ32rIvB7DgEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMyBTYWx0ZWRfX9bTiZubF5HwS
 Bm3eZGQ1YE4/RY1uhaLL2MDA69Ve+Oq+oF4TP8gqxgeUxHOkp7EAK8Gn38DLs7L+7WLsUlqvUlN
 OyXrGSNDSP21D5C06/aTgCRh+NyGjLErvwfZRNlZFdE8E1yv5GeBQ61B67LDfxVrMlY96IVWHhg
 UsZ5f/qen6hcw8N2VN1sWkgpyOyZXO3P/k+QZXEBWy0s2tFYQdW2TD4iJ6q1T4ictUmyOIkrx1i
 B0Xfb/ipjX4f29aKJSfQUedAxJuhS3LoANfzZe8qI+O+gBHn5wmZZITfU4hJAczMpEP2mGy7u3q
 dmZaDOzOTG0f164CgQi/mVSS54BLjkjAnlOepAYGJUhzE/NDPuSIHt9hctJOWkRTYhnS9dGEbqv
 LZoe6Bkh29aBy04ImZkm3b8Ra23zqJ4Z724/UDnGsvNvgv53+WRKhHQitYKQHF0dZDr3U1DuF9/
 WyIveiolpmpMV8vZZnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100013

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 27 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 21 ++----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index d2f9c1fb77d9..32e8b3e51519 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -773,6 +773,33 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @remote where the @csdev
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (!pdata->in_conns[i])
+			continue;
+
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..739105acb0a1 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -116,23 +116,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -145,8 +128,8 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
-	if (port_num < 0)
+	port_num = coresight_get_in_port(sink, csdev);
+	if (port_num < 0 || port_num >= ETR_MAX_NUM)
 		return -EINVAL;
 
 	dev_dbg(&csdev->dev, "traceid is %d\n", traceid);
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index dddac946659f..854c0a3cb080 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 int coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1

