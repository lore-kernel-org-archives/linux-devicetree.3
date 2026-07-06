Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698A39AD39
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321891; cv=none; b=cyzqtwmUMPh+iDl2F3XzKIke7ZVLt34+UIGYp06MrxtOZysrSgwlq9fGrZ9noW0M2aAEmgKa4sC6lYNrKIxAE/B1ZtRBErCnLRbNfU3JET48E5jIUYeRIkRmh7OgSBZ5vhkdPflBr0tpmTNAEG5pC4lqMIbiOD1eF7cUp9jyxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321891; c=relaxed/simple;
	bh=kElZmKKbm5xIpz+kSCtdFiFIH027FUef5BgpVJDoZU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WbRn0LbHIUAVPshAFC9kRKkHcI/SguRIa/5llPSRJ0+z+jLBKF1+lnCWHexAboDbREX9kNaIGsv/bqeWRqYgV1YRbFxCWzGEpL1iPN6bS43ScRQvrQxRy2SfLOl6po3KA0C/GQitPdKbTyBQ4fsHFIvdOK0buJQ1El3oTM1QX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6kIbUFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hBLN8GB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6kIbUFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hBLN8GB3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641nFH3624728
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jwkwWmlhw7+
	/E2DUZ/PK8cNjP86wV3o1KNAvztdcFs0=; b=O6kIbUFQGlaJO8O8sW92QnXpr77
	NLrEYxxT3eNYhhLlti1CvEGeW8bqZbABiDSKqshRRr5HocoI3+ZheEMD9rr0TlXX
	QWTJK+vcyB5tpsntRozmrUKLXkJNFCWUUMVHeHqHXq1+10xokkuoaz+EbzevHhYr
	5d2Bc/cm+JZOXqqHyeXE8AAMg/elf+uB018OJRUM/U6FapKC0O/oj33yXlfKNhlF
	CJNqNET36FXjc4cKzgtj6L0TOpXN2WgfvGXA8kZ03MBGazJ37Vp2E0WGgXPZMk8a
	loVZFuawsflQwEWdCi+At4tK4AcZp6VZ+wjdJS8ZTVw+rqqb3YaR6CRgExA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw3cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:11:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cb7a3eso507159885a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321879; x=1783926679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwkwWmlhw7+/E2DUZ/PK8cNjP86wV3o1KNAvztdcFs0=;
        b=hBLN8GB3P3zva31o51S9WXXFPVQSxCVQR7+yDJcL6Yj74VBliwpHVQ2+FfRVS39Qxw
         5lItD1r6JA93qyXxEEMHI2gogPwv0mCmWzljGyd5co63HFYEwHzEKYqJplw8GAkXTekj
         4FBeH2VRAia+IkjQacqPBFrFXviGM3+TjFdTJKEIzFXvf/EoV6P+qyXeHRyHj30oO7Jv
         DsCQZ41Ka4uUP8fsj+RxahBPtKDLY8Kys1EK3dE2xyXHOjauC1QSASOUBK0vzcMa0dj1
         CBaiAfm+dRQw3vNZfkv/kn7lUH/wQhSAsMKFth9qJEOq6TK/VNxJ/6jSKCCTt0XGKYis
         HiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321879; x=1783926679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwkwWmlhw7+/E2DUZ/PK8cNjP86wV3o1KNAvztdcFs0=;
        b=jFal3BOlVm7JesVs9TPEJ6ezSvvWBm/A/YvjkJmSR7YdVkksUp7uG2doN9eGSnrF0c
         svYI/hRYdgz1UfJT7EB+Q3wxaGxw7rwdvNOCyLD89TpJuIDKnmc/lI2+keIHUxKmhttZ
         qmiWMLCeF5TihXjuZVhLYXOXZAcX1yFJTI6w9Y4ga3qaFNCJqvAWb1ebp8xN2/iI5GxJ
         Cw4jLa4vsbhMBwE6IcK3AXuZ4qi3DvWugFBpv8LOKbTANk7FWT/nN5eNLVuVVf0vHnMc
         Yu6biq6bw75T5ObmwtmBuGVIpK1m1HxF3qKHyrpcf4BK8mBejuBfoJy7hgjpfiynG+s7
         vjiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6CW0qT5usCvL4CXq9UdVU9qS9giQrqA6R7LPjSE27Yy2kBd2Rm3mWvn3k7TP3QeZJJP81Qji2pFj0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyua5LRud1FSNfijZxeWkCUtQfOxksArJwL4MsG7pyAHXFBj+LE
	N7eb7VbE1Gf6JWI+XsRmOjJu0PgVDFvFdD2Kt+4aCWzvpaVIv0sLlVw7veZPNZ11PLwutoHejst
	DStfpDXJ8HMeuFM9ATZy5fxmiY3BH8+DC12zEPYWdj8YbRTYFBNzAUfHl4yQEru4W
X-Gm-Gg: AfdE7cmtfnodOaNdmMfkOi7nNffIE6ceQ5Sgm6h6Ed+xov0LQi0o2mvvByoAeSKBgbj
	yEqRi+iynlogoTPK6PIb9BsHXb0RPpTKAJEd3p/utlEFjNwlgn7+rjiwZo0OWkQVNUEiygO7sS1
	0RST43go/4wfnESmSX2X7WYB0MjmTt1P8Wzvb94H/8fu5H6CGTjqrMNwdDOjTbBJmHNJwNmw5n2
	S48CoiYpBdS3kjgfAi4u4NSApLJyzFawFRqxW/Ri6wGCwMumSHebc+WIiGNdmdHzBC2Q6JnXcal
	7oWnd6J5/Fy+ov5dTl4fIqYk9PrhWPY4yjosHGxHOMe59zvTfuJ+YsozVt6QWFwfpD6/fHl1d1N
	BptDVwpfBwLb9rGJUn5MCYljoJhB/PP3ATdk=
X-Received: by 2002:a05:620a:4110:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-92e9a418dc0mr1248768585a.36.1783321878913;
        Mon, 06 Jul 2026 00:11:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4110:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-92e9a418dc0mr1248766085a.36.1783321878516;
        Mon, 06 Jul 2026 00:11:18 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:17 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices via DT
Date: Mon,  6 Jul 2026 10:11:09 +0300
Message-Id: <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfXxUp5zNYNjzlX
 Is7g3PJO/iNXf+g3ML0OxO3xifwd4pxjJZD0SP7CiumVtdxyVRNWi7oFgqr31Xs81J3GgMDhjbz
 tZAIyNV2xnnagbopRlOraFhXynxu7Yg=
X-Proofpoint-ORIG-GUID: wgGDaJgsEEyjsLoky-1M1chEvaNBjA3s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX09oDLLmGK2xT
 MBoXtMlE4H+iNmxigNSFV9wzfvh6u8LG/z5WTXCSxF4y8sB35cbftXjKnjfV32VrHSb1520Yr+6
 p2FkG+4w7bXkNJ8qeNaoqZZy3RH/WcCTxHXfRIa4er0talNdKJFAUshXvOgsjQFJYqXm3YgzTOd
 MmJTdOzsahriWQuQ7C4PY1qgfIVyGuJTipwXYtR6pXtuZUtBC4fX8Fm/m2GZHenpXu/JoOlclMn
 3JYNONNwkhSNr/3DLLFo6K8/hrfUMaZ4DRkq4uiuckd0vc7oepWnziVOVfNkry4ytjQZNq02qrN
 Ark/nVWz3BzdRKZqaTQ4Nq3kVLuSVSGdYsGC88sY+PTWEH7DpKwH+cJYbH7lpUSLYGDoExemK6x
 GUmaJ7fhSgkmo6LBCJCK3gkQwkGRE5bErB62gUQaRFD5jashqdgsNPfGMbh50diA2J/yYcV5C5I
 sL3nJeVwi49NeUMDLeA==
X-Proofpoint-GUID: wgGDaJgsEEyjsLoky-1M1chEvaNBjA3s
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b5517 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=CvTwmiUEViyTWuGqE5AA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Use devm_of_platform_populate() so that child nodes declared under the
CAMSS device tree node (e.g. OPE) are automatically instantiated as
platform devices. This is required now that CAMSS is modelled as a
simple-bus and ISP blocks such as OPE are described as child nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..95e655a8b6aa 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
 #include <linux/slab.h>
@@ -5362,6 +5363,8 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	devm_of_platform_populate(dev);
+
 	camss->res = of_device_get_match_data(dev);
 
 	atomic_set(&camss->ref_count, 0);
-- 
2.34.1

