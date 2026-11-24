Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517640;
	b=Zt8q1YXDSpjs1LqBnQfpvOrl53AdPWYSsV2d891RA3Z4zmpvqIeLj2k7sfMOiHLExhh1
	 zY3LycTdH+WFnbkAKz/T9ai/BSrScaVz3FCgVqFPrfBCKHmGdo9KmPm1DGhLO19f3rSDG
	 tdgF7PwikA8sEWUqT5N1Z9N+0DgpQcdbrHHh1epmIPzszrADJQHkxBkwRBeNFaKx/qMBc
	 eCVqeyFhIeogpSUXgaVCi9wb9VbHA77L40P7eLb14zxvDw+nDq0AK9JuLltRa71JQVUkB
	 TOxgBRqhJv4WKdu87oDYzeoA4loub8SQEQcJeBjOVnHGy1O6uovCQKDhT2Xow+4ATgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517640;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvXeM9trYbs=;
	b=C5WsNPxLiBojzf6yTDl0ce4sOa8MFmQrYwe3DmDPGO1j90S5YR/rIhsxrIC+D+0YhcuY
	 yXyPY6aCcl8Zwd5MA4pyhx9GFNnZ+w20TgkLfYXrJJ7w95PmEsDidR2iO/IxxgYXVqz7a
	 0pAN3vGXeO7Nore8pSjXSVl0+ATvkdBblXg6q/oWX2EXiFLnumAquq1wlNFQDY9Sbs03K
	 WmTDTyV5n4/6eQ8/cNBqe8NGzwYoPy/o4gqN1G9tXPkgK2g+ASWfnJEC7k/arxtXHkI1C
	 lRIyj+j5SgFqe/9Fml4wdQyTUd08ebj+PT07qgXPbZ6Yc98ptToogYzv/Ytc2IrAFOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HY9GENZp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWV+PsMk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B59606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B59606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HY9GENZp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AWV+PsMk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO87jvc901980
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvX
	eM9trYbs=; b=HY9GENZpfyOEm1s+M0PgkFPKbE9Sp3wS5UzTT6TSh3wgMdPB7YM
	RKWyXR2NXR5A4AZJpS1sNhSUYD2YVOzfqBKhYL5pmr/f48N6lMNZzp93rP9evGJT
	cKYQMys67t8w5gxjIVcpCUu73SGTArJVQdESfDJrHpmLjGEWebKSyB3hNrQNO0Id
	GIKt6VRdUhtDu150wbSbmsLG0d4YxJM9NfIjyheO/Z4CJdpcMfAUyPt36So4mda4
	7vvCGs58LmalL7SjzcNAqJnqQ5ZYzIKUbBiwdLA6WTe1XEp9BDsdavOgqdjKGW3K
	dq7AW06CCwhagdx9Ep3HzNkFhst7DYxGSrg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6stv8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so3332585eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517638; x=1796122438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvXeM9trYbs=;
        b=AWV+PsMk4Ps5mPZ5xfEZ6nolvYNhtukoVqCIK6fFnmQvLX+I4s0Do/KB0v1NpSeEDa
         qvcqac/tyw8ZmzWl7F0IWnSA1y9FKmYG2YpnsWtttwLKWO3Pj3Bv4peKBuikBahiDZld
         iNvSudURfJs1KSeByC02flwOG/Z4qBIniXK4tiDGyvoeHxEm/g81RDPJk2SzOqaX0IXg
         g3TYIoAnc1T43lS+ZUg2GGi8W+YLJzKQxsxlMR/I5CCyQYGPSZ5ctmXKNzWXUJ16DLOB
         uC7jWL+rufnAXXpgfgFNliD8RDUJyrIhfkH2HQR+gM6GmqHEYGq4SYXITyp9NyxlejPr
         jDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517638; x=1796122438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogWxQ2xxIGHDPlXg+kfuqpwZhrR4bqe8TvXeM9trYbs=;
        b=X3LBG4W45aYOiETrb2NgAn8y3rpvTA1ruLZeNlmPiLN6IkSGfKM4SKQdrE6ALVrH1F
         WEDIKtKmJE0zMZzaEZNzWH94zxfBx40Lx4Bir6KLT+MLy9LcujrUffQi+QRuDoZ0tbZq
         0f8gf+MEc1J6Z/q79rklyidfi5IBFJXMFyp2dEfhfKH5BAJT3FdRBD+InakYxP69kmFz
         Ty6wIjBQ/uDSV1W4pN8iUyyJUmmnx+lP3Ucbu6G34FiBZOj9IUygeGmFLwsHJy82i7ly
         tKGnkZT9FT8/mTDnqhgDUO+rMpGY40JDiCfYaS4UUL96qs2EgUYyU+9THyPC+1C8Q7I7
         AS1A==
X-Forwarded-Encrypted: i=1; AL+hErHaLX3J8HYgyZoUMphK/Zixr1gyJ3KUR4wR4FbwhaDTlH1bWcyJK8/rK31FbfnUUgsxEfZfsDBikHyN@vger.kernel.org
X-Gm-Message-State: APuU4Z+pIj+LTPHZfTWmJjVK9KibZ7UAYS3NAyf2GK2aj2AQ9cKeD0Gd
	GVf45uszBpuK4KDEgf3hbzO0xu9IH3uUxIE37YG/RT7Szh+BFWctUTkIgpyRk05aBDL9owu2dWL
	oQvkwNinS+es43lQgHSjBL0Y/dKOhl6xCwnFMze/wuVzKNmZC3+N7HlUVfwXCfBcF
X-Gm-Gg: AZFdTZfFVZZOfT99ze4OancjYnogtEJ6ugKRRIqbw5UdzxtIE8+g6LXOX9/Ne62OJ9s
	Dp2UenNOLcojsFcyaAq4/VuPMdN5IFDXpCrsWcM3S38BtyUtbURRqI83N/g0VHK6NZPC7Wr7hFI
	XWJwSpIaDmycShTCoETsZINrieqGnBEYlsIL/pN/yTTx/nDAFI4M4Q2VY3QDZkFJZf3WcfaQ53J
	Ay093JK70YGidArOK055ztTNu3jO2NLRxKfD4ofBQ0FCI8Ig+xRJezhIKYVD9ZdUHxtvq2BsXm6
	cQ6XweIk4iHDA6kvk23kNlyL6zY0TedaJuQOxKDVTZmeXwV8JIaH32HF05RjLFwwHyPumWwJ8gR
	AhEX2cMJr2rybB1EB/03KzdO+iG/gPIGN4xSBMQb5GM/DIrYVLHR5gB6VsHnZR5OMemVAcqQd4D
	jf2xPkSKv040zjv+UlIUgANGs/Kkn02fpUXu3mta7d2sylHrn8rDGltW0=
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr16005459eec.11.1795517637509;
        Tue, 24 Nov 2026 02:53:57 -0800 (PST)
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr16005427eec.11.1795517636854;
        Tue, 24 Nov 2026 02:53:56 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm53796353eec.11.2026.11.24.02.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:56 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: thermal: Add Seca TSENS compatible
Date: Tue, 24 Nov 2026 16:23:50 +0530
Message-ID: <2d8b5fdcdff1f5d0df738d84773b0ed54159eee0.1795517630.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NNwvOZB0nXLBybyJB70ft5hC1xl9IsRK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX1cb4BDjnnlqF
 UCeRK6+KV0EEO6LR86KpAw/rHuZumrEuFrwNHqEHGYcpqGkVDbpp9Ti0132Lwc6c7RkW4y+8Rgz
 xoQbYnlVxubpa5Nb5CJYh7sFACLJi1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXweWDz2Aa+CIV
 X5+IzqDsGsW5cVJaf40oSJapjNXJyz+uSu0GcTGubRRt7W6/2ATqtzZ8dfDS3y9euZkqiIz7wyb
 pYf3AgzgzBfAyzsxPtFQgJji1bplm+7qyvIvrNaTfjgTgLTyUxRJxGD9DFT2Cl3zBML5BY9Kakl
 qBufReRlZSFz6x8Pxwhio1A4s6YNdqbisYIwmPk9oWvljtJIhvfsXxvCRyn0LUXHSyLhiySZvSt
 mHzRzGyekAg2zPI+CYD0t6LO035mliG1oyrycqk5fu166xsIYBB/Xvf5eR8jQjEi/x0OdFLm+7k
 4gciZANoCDEY6h8JtctVcLw7ZGf4AFFXPMDwNzE9JX89+Ra5TBTc1YpvINOnxvIfImAZsNmhWLq
 gGQsohO+fvq9ueFbWfzbrh1J1ZyW+O3nmfEigbszWU4Kva/SXS38P+8gh3h0btkt7P3Hsnw7A/y
 8n4QScaJKpybydetXpw==
X-Proofpoint-ORIG-GUID: NNwvOZB0nXLBybyJB70ft5hC1xl9IsRK
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b056cc6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240042

Add qcom,seca-tsens compatible string for the temperature sensor
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..a96f51feec87 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -78,6 +78,7 @@ properties:
               - qcom,sdm630-tsens
               - qcom,sdm670-tsens
               - qcom,sdm845-tsens
+              - qcom,seca-tsens
               - qcom,shikra-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

