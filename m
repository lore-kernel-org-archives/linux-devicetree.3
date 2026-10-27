Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101809;
	b=ZHAuZqU5mt3yeMy0JfyLlbeKMHzWCIJ95LnQq7c4YrLmh5Cn209p4XQjfUbx56TC5ji7
	 MX01Nk+V8aKgBf6R8fcl6xDeQfsi6xCnTV/lSHzanVbQv1gzdJVWfCpSSVqSMSlH8UEie
	 kXo08X7SckGZmICJf2Y3WGQ1Q5Mc7vHP+Dy3nGirqSfJHSNbJNAqAyKKqwRA2+3vEUY72
	 WJLFG/WA/u/PJVuHNuxlTaVtCBH8vfThI6TTzuG0K9JKBpArjd428mAjvdzwnT/9061Lr
	 nP68g3rEVdOFTFDJpx2nyNffOs1Ta0HjRZqoE/zYTXTyvfWk76DNUz8Z7TwiDf9Rplw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
	b=aoD4p8K34Cw7yHTyIBft29J+6Orcpv/cfLbuM75QIr1482KiQrlRwuJ9qTCjNyWdhofq
	 aw4+jFIpw0Ed68TEmUGXxKacPw/jaJJSEKwJsWRX69qXT+M1ZzHYhu7kLvhm4a/BsbxC5
	 FLFYND6tdDC+9SCjy3OGBXv/0J6Saxta2nEFEQPiFEogrdn+hIZT0BIoZD1dUYxailHyH
	 zvuhPG1KV+DxTHnB3g+UhtJZ/sc8Ip00gRJGgAPLl09rbyXlr78OPTRN3k5Gz3KHDoAF6
	 dZQUQ4qlAanvOooaajwsZ0HXq8j3A+cb1h+3RDt2BcVE3RSO3cN5Kz3p7vQHaRr6Xng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOn8RZOL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FVTWW6HH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C8606A330
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72C8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOn8RZOL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FVTWW6HH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeGkV3026463
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PkFYMQA9efe
	d66cH/akGO8FsOX46tW0maNvLeqNarWM=; b=mOn8RZOL2DSGU0iRzZHIFNYMhuT
	sxk6zhcQAMrx4SDF80xmvnG4SFPp/RB6e6L+kJWptP1YsxNvFsBMSc49pm4NFaym
	pM2HVMXcLD0psbT6ynTIybcqYWtkkS1sDcc5ixgflCbVnvCuMQjYX3PmqrepQSrG
	pSdsCKgB9PsfcIgoYsGnbLnfC8FYG6oqoSBNZDOQQcintMF6a1csSU0y3McYsoUp
	Mr03yCzOePoKodMabZoOqqHU/K0/mLf+bBr0bSf9rddHbi2vPILApd5i6FbxpLm2
	5WFW7U+rPP5kYmc1ogDGigG6ltPSB2p2THILlwXsd8+OLg7NZa2udBPuBog==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a9t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:50:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7196775eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101807; x=1793706607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
        b=FVTWW6HH+gXB0r5GLy0A2FbpkAXLlYPK/UlAAFO6T8wS23hiN4u+LQLbPV+3cots/k
         aNZJyhQuJyldgBodeKL3tjdM38x78JDBYfqI5G1FjMEsTxQoaX8WofG+SVA2cxK89uDz
         MIUmkGaL6xxbRxtWxNuYcnXFfNB+2sTlHBaMlSbU6wxdBychp5+C1ztbqrOTaXIcOwdH
         fQXqi5Tc5xT6aFbu4aZfNi0+bQRjGQ713zAHYFBZzdJfJqSJHoj/6I56Xqjrl+9UydRB
         laYQsZIEoMubqI5uR22e+SYKly4et9TYWHKDUOs5GmiFedxPj9E0OQRdTlMjMDFQGi61
         XE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101807; x=1793706607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
        b=Zrmhmbip74Oc07h8EzfiBc3HeD7ibudzelH968hYmEWRIcLEWUm09ugIXKiIKcrsJ1
         PVsmM9KckLghcFEfVMaoCXRrYSqWxYKPlDlRh/Lxz29lhG0/NKRGyTgkuqAQX6NveLcR
         etnkrm063d6Yf4XbR3Lxxtsqcu/vw0+x9q4a4acjyPZDgVpoGak9GrA1f9/r0o8naMHH
         C/VkpiAPbnJSlEbEs9xj8YP+RX5byoZE/3Xmgh4x5N4f2GE8uh7qXr8zATS7cLqdR/x9
         SBFSXjnyziRDObpQ9RcOEzWl2ecfpWRYChTL5NxNES2Q+cXjM749Lml/kJPfE6k2oL9t
         C2Mg==
X-Gm-Message-State: AFq9FYIBgSdCfma0v3Qt5akqLMJs1qJRbsa+EJEoAO/Ovl8mWFNGEX8X
	RUQuNm3Lyf+oqYqoGXXPzjt/NOCt5D5/rzAxo34zaU3OQaayOeQbAS1RznuCo5HCua/2Xzem1xK
	ZmjKVAMEHDOx+ZyrFYfwf6/8kd8poJt13pIzRyyrWcpOkOYh/yFmw1UotQwpAlytl
X-Gm-Gg: AYBFou2lAc3MgcLkiH5E87tc6z6qh5/zkOe0OHVVj+9uhbTD0GemRN7iIozwEpArzLt
	vOEeLT9qrr6AWvjrvOlEhe0OshDn5LyEyUwHNhw7flpV7SMcErqEJpGGS7HSKL1kkGiY6nn4VNC
	t9J+KQ1A90kpGE1evknqgaDHy/Id0jCcF0WF1t7ltiNyhi+mrD7xKC4OGJkqZftMrdz8HXsL0rB
	GSpf+UvqJQBEuXf3QecIdqW6P2hvFVpj4iUnDTMxErp0nMASsxiPHQkVIjygSUmcuDZiazGhj2f
	3ti8QG6/gSKA/Pbjeq4vW/09UuibAhyg+w27P9wdIUoGXBdnL/kBLAw62e24JW9lxpKr6KDl4wx
	JLDxYGvOfiL08XMs7aCwBRejt1/FHC3nLa5bdtXvvssD5k+YRw36kTtW3LuffrnkN+aXM+nra+q
	mn/BLmNDaTnHJdoGYlicXi8w==
X-Received: by 2002:a05:693c:820b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369e861c214mr15193449eec.28.1793101807124;
        Tue, 27 Oct 2026 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:693c:820b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369e861c214mr15193410eec.28.1793101806511;
        Tue, 27 Oct 2026 04:50:06 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:06 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Mahua QCB
Date: Tue, 27 Oct 2026 17:19:52 +0530
Message-ID: <20261027114955.1266499-2-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: BTHMdPJK5Iade10u9X4O8mSfLs9rEQzL
X-Proofpoint-GUID: BTHMdPJK5Iade10u9X4O8mSfLs9rEQzL
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08ff0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=WmEwIusUxj_G99g7Fb4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX9n0DI+jM2DD/
 rQb4G8GqbkLUysmAUk9i3PfU0n+X/nSkgfHNxjc/71uDsby9pm4SKjlZ4Z2e8h+AVoVPPHZK+Dq
 Eob33EJvl0rCIZHSBIh1l5a7X7CJRKe8QoRqJYKaWmdN4XvXK8HIsQy+mBlKT7EfczML+DIxtoQ
 8fIt1Pi+NkFH3a5HQrqtNd14XAO5sNRltIKrjRugW5Zv1pQtHaCY6FzG8tfdQd1B1xnemTvfCs9
 xr+UO6W+M3oUHtC/2WXvv5xiE3Om8J9O/EnJ4fpJIuismOOrJCqecPAhmwHeUgpAD6Ne8nX1kW3
 qSLgam9Ilf0MpHBEK5zweh4wB8QZFkiCwaR/+00uzkqS6L9vHSqLyJ+Hd4ohikqCz7ITmS9A/BR
 +5arIrxBXHhOHRPrSYu2xtVCnpCV44ZB8SWDlQ3eISG3tTc+dch5bHz9m+Yx2k2bFgh3D9WGcTQ
 sZO5jUHQRIceCnyUPxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX3Y4UJycQNSVO
 egV/sOKv7XFG51lVBhSo9s+hsHVZTTxA2R8FZGau6JUtyLZlRe1Etx6IvVVuENx5a00fzIgNTdm
 A32o8zoHBoKG2mKstYo7TZ1FURD6JZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Document the Mahua QCB (Qualcomm Compute Board) board id, an open
form-factor Mahua board intended for compute bring-up and power/signal
measurement.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..933a2361b5d7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -192,6 +192,7 @@ properties:
       - items:
           - enum:
               - qcom,mahua-crd
+              - qcom,mahua-qcb
           - const: qcom,mahua
 
       - items:
-- 
2.43.0

