Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5BD3BB673
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729641; cv=none; b=aiAF7r2iKVntjE4mcXUNkDXTX1WI7ogWwW8XUq5PCa5je6WZkIN+sJKxVWIRhO5leOg834m+FtGXPfJE9cOaxZ4CXEEDOteKksA1UjvI81OVJ6w/tzELhKNM4gizo2mGtEpAD/cCWoZFrpIUBlfYn1UC5KwIew+bZuVF6OYXJDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729641; c=relaxed/simple;
	bh=WyQpH2B/LN7BX5HLrRyjsw1EQYPwQ+KIYTRR12EETqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VPc0T25o2OC/Npexuz2V3WYbAu3p1ubDb+DDyblJ8EmM+rB6tGHa6IDxYO6iA5EjC9OP0uY2rkStxaTEa1fjlOj5vE/p+qZCwUoz0kN4mCR1OabC9ctnAjNXNe6rVkKGV7zTweWktS907sjj+7A28NfIYqP/yq0jGrit08jMjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7skX4TP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEVMokpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7skX4TP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEVMokpV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3N12646937
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoMHToMrjef8bkWyrGDSH5bIV4nytcZGBlHCm1t4BLQ=; b=Q7skX4TP1liilTiw
	zu+DLIje/fnAVgYuWnBM6hEtRdDxFsKU/pIaI1M83k5khj+YDKloUBJ200+usjLr
	noKTvkDq2fLkCwkUzB6bQpX9pAzCgLFaWOe/YYbAjRR3D4+xdJz6KFqWZPwIvwz5
	x1yanUj0r4nspjiV/7twQ9l9hYTTMTAvxoLni4ofcLfKbDWqavigkXSpAs2sVCb2
	MhMMmO/vGPYoUtuRv2SWrBakgD+YVEMPoRym6Gfy1VgpzICQpCanIytxj/XKJgD0
	uVkqaxWA6+3DUE5a/4HZxt1NCfy8pYFWuy/WbNLLyn5BiJYq4lLH7MfuvhBHM0zk
	qlkzsA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trup4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 10:40:39 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1384427c3efso9740593c88.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729639; x=1783334439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoMHToMrjef8bkWyrGDSH5bIV4nytcZGBlHCm1t4BLQ=;
        b=XEVMokpVWza4McIxMjVdh6ZE9vOUV99dslWRv8vgb5yUc3+MxPkEJ6ThpkO7+ECoCF
         90S+mGmEER8NpPZSYAyK6024zbffRFXrFBHdzc8XbeVw+tlIYtsS/F88BegJjxkkcjJD
         SteOoBwdkn6kNJ6UNjlfNGXrcqRGwyWucazDSulAGSZWjob/Ir7tCR7gpkOWTowvI9Br
         9oa59z53PCS/nztd7Gt8pB9ZDUvKgcs6OzGXpvWsXQwgFH69GWGSZsvXw5DGZd7fgMhE
         geMCJuRCvibstWqWSBA+KJBho9tqhaal119wd+/tdhSnksr7rGP5Y96yHeVD6qtwWqj3
         8eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729639; x=1783334439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoMHToMrjef8bkWyrGDSH5bIV4nytcZGBlHCm1t4BLQ=;
        b=WwFSzt1DBw/HPAZYUPUOu2kdlgjRt9wMH4SIVx2t+ZUZuUem85bhOTD6J0mLDHjIDg
         6PxAURV6QrIr2G9nRlvPcv81/CLiQzF7yxL7l2iwxTAigiPGti/T5uWRthvGtr+B+zAF
         lXDPGHaCtMXgFo4RyGwaIi1LDQnUQJ2uRwBG9WUR+mBBTl6pDg3t6BXMSb5yf4opFemU
         BML0oU+U0ohMAGIBNG1R+NYA12WKmvHTSoWvtk63r0CFjCoonq75ivERC5BbyqaHCWS6
         E96uXTUqSkPw0g00R6Y10a5Pom89OnYAEo4IF4sS7aKGUHn+3KEJw13bdgh89678JJj5
         B7MA==
X-Forwarded-Encrypted: i=1; AFNElJ88jpLIktLvFN+XLo0e/A94zT4ueKAHStGuLkPvK3HhDhe/B6nN2ceZVfVgaGd1KVcrqJOMK1eR/WJM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhbrFrQUrul1enYzQt4XjymY2+RChGWvw+qfnPt7qdabFpcW5C
	ymr7Nstw3Rb3BIT61+ZopHzOlnYVhPCUTotL1Mc8ibUCvjQ5s0+Tyot4R3b0DzMpwSFKaBoufKd
	YjF3ftoMR15IfrDw7GV6SPJPvIkzgupx4uTMjo44xUM8r7D/zA5pdELeF1ye5pGjt
X-Gm-Gg: AfdE7clQgTJRITBTK/kjvIfH/V6T26ngtf/RWkYX5wQc6+kxZiglE4ykgUoYSGR1h5x
	pQOg9s+RFRVzKN+/v2mDTO/61nE4qjtOq/O8KLu6Iue5Md8xLGRRvNsOlsulldjxFVIbAtgQmUv
	4onSoQokQaboEnhPTOcruOKfNfLkZh4Bdu8l4wJQbpx2nN2C6Mb3Aq8dFMR22qcZa4Zx6JckaaF
	DMsmNBAxJWkrekvGwsNyogXLpKdb20dFbC7PeRqxCcKzm0I3qoYpsJaVaTMoW5m/Xa81CmwgXIk
	C1lAGWTQWu3YEVSMXGANc02Kzv9Vz6EKP5coNoa4MjK39+UUmF3Kv2Iky5OoZPSWrWhIseRs/TN
	1YSiJ3O4xiIh0+TEHXdw6TLWoI+5EkEO3/b/Lx581mnXjEQ/0WMUWg1MfRmiM1Dqxo5LHsowBGS
	SzXje90XwnkRi4BtKPUcnp54U=
X-Received: by 2002:a05:7022:60a1:b0:13a:225:e191 with SMTP id a92af1059eb24-13b2271d3a7mr117655c88.41.1782729638474;
        Mon, 29 Jun 2026 03:40:38 -0700 (PDT)
X-Received: by 2002:a05:7022:60a1:b0:13a:225:e191 with SMTP id a92af1059eb24-13b2271d3a7mr117631c88.41.1782729637974;
        Mon, 29 Jun 2026 03:40:37 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm25413085c88.10.2026.06.29.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:40:37 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:10:17 +0530
Subject: [PATCH 1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add Purwa IOT EVK
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-ec_support_for_purwa_evk-v1-1-e082b70138d6@oss.qualcomm.com>
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
In-Reply-To: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782729630; l=1026;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=WyQpH2B/LN7BX5HLrRyjsw1EQYPwQ+KIYTRR12EETqA=;
 b=k2RorFCoKpB1CAYCKfinQn25mO3hQpqhqq8NYZ5S20TyNCvmP3n8X3Bz+sUlnvO67VF96ocuB
 5kZn+IqLmP0BPh1ncnB30hJ/E+hreKm4vFDH3IbQ+lfJyLL6UIZYZl4
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX85ExqhC/C7Fa
 YDr9ixFZDpUg98j4OxDwMkG6SsLCV4L4UdCTwcNcqhnKqMsxpYeMJv8n1aOHFhrwS6kYogC8pqF
 IAX1rp/R5Qqpl0gjX106sTTXdDtZ8/zcVdCG51h+0dnuRJF/rcjbgCsOMUuvCqv5kklBaeQSplw
 EI2TrrZE0VYvgPrF2yJVv7SQvyFLtI2Zir/LxPbEKnG2DlVs3zh5YDmtK3MQwV+bMMAZH6YKYfe
 7lI/4sgbk/gsUup/wfUyYxIwyy50jY5r4f/atmoGn5zKWf2zqFhB4HB0JW679xv5LrElW2vHNmQ
 tMvUB77/PgDN4sYU/ymM2il2qvRAkTjYYnZaabJNQruiIL8FdVWB0s9i1shMmAozN6dveE1pB5l
 rEBJwp9Ivt/E3UG/UsU0gpb3gSk4NfpxY7nbN9xAPbx/gmJlI9nPV4XT1yphe+7ZTFmEf310/7R
 cJ+hDeu3zoE8IT2SkNg==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424ba7 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=esgZoLudUn-50EVM51AA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NiBTYWx0ZWRfX9+0fzNkXzX7+
 PBULf6RcLXH7D4MU+gtBkEMWVnSdSKNDvdmLwz/V/oIQnoD2Rn10sVWVPCPHeO/p6YZjLxUyQPn
 +WQiQckA3kaJfVtFlBS3F/pJxr4IeIA=
X-Proofpoint-ORIG-GUID: ElFiJCQfDFiKV6pVYkn22XPKuiEFIJ4T
X-Proofpoint-GUID: ElFiJCQfDFiKV6pVYkn22XPKuiEFIJ4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290086

Document the qcom,purwa-iot-evk-ec compatible for the embedded controller
found on Purwa IOT EVK boards. Like the other reference designs, it uses
qcom,hamoa-crd-ec as its fallback compatible.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..c07483aa5937 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,glymur-crd-ec
               - qcom,hamoa-iot-evk-ec
+              - qcom,purwa-iot-evk-ec
           - const: qcom,hamoa-crd-ec
       - enum:
           - qcom,hamoa-crd-ec

-- 
2.34.1

