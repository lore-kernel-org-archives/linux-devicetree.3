Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273724;
	b=dlj9RDbCVFUkGMn2tOJ4A96qccVjW8+G2peXmoFpuTY6AjRM6BMVqsFRSyFSKUK15KQ2
	 nbQFxEp4U2aSYBg0TQim4nlYXR3iadrNJ91gTtewv2I/iTCdmBcqQz6HqfYPG4McOS1Es
	 FCeZIWMmMXm2IoTrDGfdTJKWbH9fIroKU3ZLgymra7l56sSU8KCdweb//M1l/8PBehzes
	 poo8r3KNHmNXjFqq41owBn1wVxfn1FmC0Tkcc1FKmpjeMq4XYF/TSrmQeAlOhPZUqK2yn
	 v5cA7KaKGtWPbZdJphqqgNAYsjlD5Aq8n4/7FgMC/SDz7JQ9Zxg49pqoV56gcyfxEww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
	b=wN2TJdMv+yX7zzE6Z6vIHP42G3aIzTfXsIWA52V+v3xHKHlxiSngnSJ+h1pgDWvusZxX
	 0/wGDMjYHrcqSAGLsS3rmDtNbjFNv8YGr6Jr62PpGENObetM+7f1nc2IgqSPAy+PUFLd1
	 YovniuNmUHlqD0bu8vbRe7QCUfPrJQ4bar6H6RzQCSP/BDLfADjw6Ltez2Vvn+ULfCAw3
	 Sz2wC7B5NUYlArN4PEKBh4UFGXOppAjbDP4TLe2zmtN0w6XBnLxX/CqWG1j+e6/MQSc9k
	 /szi4N1iPVSpfTWrWJTiXweaDnog5qj9TO4jMHdU39TLeeIW+3kDosidOh0Qg7h75bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGhkUH0X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E54606A337
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E54606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dsq7N+Jh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGhkUH0X
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jHOO2474766
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=; b=dsq7N+JhZMxNrVHK
	6avJUuU8XEYPugS+EB2pbkOQeq9tS8ttDck1z8A7L1yul5jIHwTYekIaQdUL40PM
	5eI1zQ7Zn+nK6BiIVKVz8tWTd/zaypIQ8N5bbHf5rgkxQVDtafCdPTSmUxmURJ1J
	KjhmyKGUZWn/ulqlrlAHJYFLr3fl/6OtYfnifwY2k8EMFHiJBofTPy6EHq3RDPXd
	jPPqImrLr8AOaCO1b751WfEFGQm+TQHi/XHnz/upu6dtqXArAYe96IN6nxNI6A5d
	1VJnk9K27deOwEpZ8s4ULqSRa06rFVVvkp28uUUvYyaR8O4yXJyuKLC/VRy2aqGk
	g+MFkw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg10ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:22:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed00709df0so14284055ad.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 17:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794273722; x=1794878522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=RGhkUH0XPlh9V+X7C6THVKsJ9FzptRLO8aUNU1NraM06Hbx9q0A2I7ZOY5urR9XlJ3
         bHzBA16GBvb4KgwZV/e06TGUisHlaNTfA/lBg9iXAl5gNAzbHuVxR5u9L+C+/aLilBun
         tEZu/AeEJ3V7Kb6odrq5HgNi0J6ZCFv9hgcx49TH9mXcJ4PWdXQDA5FKhJYiknUa3oil
         xwVaJcq1cOISXJ0WBdbZJe7jfqNZ2WDJKteYzLTN9IVlTe7+3kNW6CxknnIn7GzLi3T5
         ge1NXXfbNijKGZZGf2QYPlFVttLXtwDE+KrBQaF46e9YS6q5UCTq4FAjMthEK1OagioC
         iIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273722; x=1794878522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8So47bPBCZmexI/kzj7aaVs+HdPn+jjIsV94eZRvyr0=;
        b=P4/O5l17t4Dzei/k4kDrCXACvvJ2gFiiVWpTFCBudfBEc3hzaPrn/3OxcGDkQLvSnU
         1+V5aF7mdmTUORlWlkZPVM7IdXqYF9hLLYwCZ2E1NJQU92L0jiAcq1CnfHYgne7VydDt
         ML2NIACKTQ2eNMejLPtc6pRvHDAxGWuv5VYX+mV9GR4BwGQ7N14ALgq4JurVrehK+Y9Z
         iMmIwIldM9V0k9eS34gXMUna7v5oBO9H62WMa0jU1TXVZpIhEWBzntqUIQUgWV9mu3mU
         nwKmCeyHsafyI3k2VBLWvZIvNVaw76KLgzs2qK+uh5rp0rSwD1SeQo+4LyHn3pPAJX3f
         TokQ==
X-Forwarded-Encrypted: i=1; AL+hErGUA2e+UkGYR8VG4CW9N+NuWcRXjB7bovTux7Zv+ZiLO4r5f6op9Tj5a5YjJ+PdvT2wNJXRrSR3dFUe@vger.kernel.org
X-Gm-Message-State: APuU4Z/s6BB+syRDaFXaZDhAGLy5DTNrWk2b6bQtzpal7qCyDwTp2fy5
	Vuozz/y1iL9uQ40pzslwmDigh7uUUnoz8Lu9ot1b16D7a78D1I832oJl6R1vtR2754zWo4LvK/C
	02WeLWyN7brhCAVtkX6gPT3nlCzv9fJCiBvedtC2o9xgULEBtH2GTT4juS47CVGRG
X-Gm-Gg: AYBFou07Bk+Z/y6YxpxFul/XYLmDYxYz3nbHmMNJ9JCIjPvwxXzFkXZm3UwzL/ZsKIW
	iZKZvIfSsX18ZOUULIhga+Lziq9yfr2s7A87M1xifAyzWJNJkUySdPGHII3sM8twcgRqRoJCrQY
	eCm7BLfXm3ScwMr5hqNwRygMBxdhuuVgNJGcA4ujLguKWfW7JpoLZ5qbrf1VJ5MahpNSBqBdY9B
	sm0fd1TZW6yX0cx7GpuR4092wic73SVGDYgz0l10BXAJ/kHKcvhRVu+VlDOfuR8JtCbamUFGL5U
	LNkXHvn+NmtSrJT3B26yqoI6I86k0/6H9aw4hkP/NuWAovBXc7XcKpP4kjpIop4/38ITeNsvSOP
	mxMa9iWKxfVxvEhDAStSohlermirN7Kwk7S36/eMcgqlSo4JqDRN+AIqO+i0TU/5cquLmWXWeM/
	sIr6AXnLoIboRL6NCJ33zfv88j9BfwcbNzcGM=
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076415ad.1.1794273722114;
        Mon, 09 Nov 2026 17:22:02 -0800 (PST)
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id d9443c01a7336-2edb8f95b9fmr9076165ad.1.1794273721629;
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm3148065ad.71.2026.11.09.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:22:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:21:17 +0800
Subject: [PATCH v7 4/5] arm64: dts: qcom: sm8750: bind traceNoC on the
 platform bus
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
Message-Id: <20261110-fix-trace-noc-probe-issue-v7-4-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794273690; l=1677;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=kZiNHGuoVNQkmFL0f1QJxaveTsNubLnCPGMK37H6F3U=;
 b=e3fMacKJRF3qjdJA+5qwXtZU3e/TGJVbSK8JjnWWrajul9wrlr2x33918PI81Yq/4MBAFZPAN
 GNkwgEpZYYAC0BEf8rSHydVrEwYZ7b9AW794RJSuX6CJPb9gfS1BoYv
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX0DyBAlEbwRyx
 E4RdXRznMqADl4RH5IdzWEUquV0YOarEi1VEN+U9KZPhqXRxOMXnEpEncqZFjY8XfkIw31Lby/d
 pO6DODv5Z6Jh8dmk03RdObE+2ZydssQU9QYuwsSod4l9/VF+X22du5I4U6R0pLfMxLjvmmwx7Ei
 1pIpReH9IsUOG78R6+MJmkXmupKBJk7WrqwDTL1Uda5ae1+Sn0j2hEvHwQ01hQ8OQJcpVrXH2ZV
 iGSTtUlFknwy4zSyyq476hHo++p5qMv4z1E2JYodivY8PLYaL1FsPITGpZ6Uy04SZZCdgEbFyth
 l9+els70qTuXRiEj2CxB9fYxSc0MsKjizJi8DgZp2Dxli9jyXdbgoLT7VbWYNEjQ9pN9GGlI6bD
 kunJM5pWYHhkJLU5arUM3UVIk9sFM8E1HcrlhcSgKy9PvHvIwqpdpuj0MgrkGjcDVpC0ffh23KQ
 Sjj+4cv0ngUPWCZ5fNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAwNSBTYWx0ZWRfX2AnOFS7lNo7x
 gqHXqp6eHLcewrf7JnLRB/bT7PZbNAkqd1LJi0fCHByqAUdWmIZLwMRoN8tOX2tgNkfP9TK4GwY
 lJzDy6QKWoHwwBkUxd5FOvcW6iGecMk=
X-Proofpoint-GUID: sDSoDoXF7iu1MPAImayaeIuULwW5D6Fq
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af271bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7Rut49xxg77_icr6qwgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: sDSoDoXF7iu1MPAImayaeIuULwW5D6Fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100005

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus reads the peripheral and component ID registers (PID/CID)
at the top of the device's register block and matches them against the
primecell ID. The traceNoC exposes the CID registers, but the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the match never succeeds, the AMBA probe fails, and the
device is left stuck in deferred probe indefinitely.

Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on the component ID register at all. This lets the device
probe on hardware that does not return a valid CID, while remaining an
Aggregator TNOC that retains ATID functionality.

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc5760..13f05c0d67f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -5172,7 +5172,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

