Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135403C553B
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927625; cv=none; b=Jvw/zxM9Nn28RTX74VsVIgZFW6jnJnAr/LIsZ+ACVWoNwx5zxxt6ky9mHs8vl/yMJT+ZPeAEYvE18uiQTwrdUcl7J0z6/tWoTVm+0cDrkYBFe5AK0sHZi7Cbo8sS1X9hn8PP5u6eUjiI3ds1fgR3ZYOpmzMJ4BbW89x27yYqS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927625; c=relaxed/simple;
	bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4yLYyguriD/LVVwAkpw6WyUbxkWxmk3cC1Vn0CCiD4vs+fPvGU5udaPsBv30pdI+4xvQB6z2RpOUBL47HaIt2flLw0Oo3AWEC9NoKVLYaerrikmxWvyVOZQk82Z3EOhL+F7tZVaH6ukGT8JcE9MD/ZgaZYbgoe+nC3Peo8DVD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfA0kCOE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH+Z8OEp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfA0kCOE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DH+Z8OEp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DkxfN3275526
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 14:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=; b=UfA0kCOE9uCPqG3g
	liU0SAShDXaNoU6BsRL/1uOoxrdPZII1lCxyDOP5apMDmj+62yWkZATABGGMrzT4
	fPpXI5IDslNlWAkvAHG7E1b1bUZFxuDNj0yADO8ouA8rB9NsJaYsv3v07bsXfsyd
	BKcOuAUJpxMnRGY8dCkLKpA70LPNej1dsCBrRKRfRtv1zNX2/ucJ/xipDFxj6DeO
	Z4DuTBxCetmLbE1lbAPPNsNxpp2L76jXimYjc7qiiwSqVPw0mt5swIbzlmOBeQH9
	Z22mPW7DeUNRKTcnYCxY0xR4BK81B5VkjVdS5ZDl6gkatRf3Z0Aa6tO8W+3n6LHK
	lEzbqQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx402rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 14:07:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf1845bddfso53271195ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927623; x=1781532423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=DH+Z8OEplVe9dlsTa8O6qzOgdpDyEKc60jcTN0GXu+GCSO3ds+n3TLaz7Asrjx5p3F
         9bvFkp8BP3bHq/jEwMpPN4Scq+D1bK/H8ZwD3iWRDuckI8eKbB/YZxCypf4cQYAtbRkK
         xFJ6lViVWzr6epTZkrUq+sS7IJsCYkYi4xgx8nDYK/w7a1Hn+elp6TrDpB4D+ZdLuy0W
         6Boo5Tz35O7WOg5nf3o5cTUvsVRa+vlZtRfkn6bSJxeisXcJ9kTXO3i17bzA6lhMdp7c
         iC32NybDEabT6t7IU20UdNIzEFvRL1QFPzIWaTPaT8C7c9pPvUEXSjWrvgP9cY0C8dVR
         8Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927623; x=1781532423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HehrHsJg5t2jrxEGuuOu28Xh+bL/NdSo7N75AdZwuQM=;
        b=PRBXR83LJ5kmaRqtMRMzDsfGLHhjG3xdjgLHwGR2kPQKFaCWQRiXJiF1oloEW8YCWK
         RZ5w83J1el6FB9bzkT+ZnZJIfE9YpaH7z4IzjotC1sRgIy1deP9Zad57gncnz8WCMHft
         JMPdcjUI58e6BMt4Mp7F1esj64wJCPFQJzkqcizCfvQ4nQBLRJVpE2jtvGND4wP7RvHA
         DZmOlBS7KMblKZNimNSDZgY7xghHjb3boMPLkiyGx3iCqfaKNvC3FLIAaeUv12WsDd7Q
         79ZYXu10VaMxYBYjAQfegNPF3pGqkaXPuRQ47UPatD5lUXYXz35pkenW24gZ6FT1Kp5I
         bdwA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZcrtTC6CAEb6wPODfk3Qjkl3jOgs00f5CA4qT4x+hmf2MfMO7FhV5ZIZpO5A2J/S0WRf57bbdcwGN@vger.kernel.org
X-Gm-Message-State: AOJu0YzqicF6LUYWcKnX5Fi/EoQjsGd6fdiRo0Q9xH1PC2XowWa+Jmcb
	kMU74kD/SIqjv7Ku0itWCMMMa2+KYAqphP3WFAqyFNsdZc5SpDqvRLO5S27aPp9hYk1LloJ9Jut
	la2mzc1XqI1c2dYsZnccN44hqp/LSsxX5BW04xBKl2A9ZguPgcN18Gg7CzJ5I5nt5
X-Gm-Gg: Acq92OGK5RbTVIfPLal2OiGEx8Wq7WE3j+XhHv4pUv8Ll09JZejOniLbKVod6odTttU
	5o7bytg5yBcLxorpNelPR9btZCvRH4WMjAf4fyjMmadsy9PxrujRZ+260XKKMyH8aJXa/w4HZuJ
	HsfIqNykk5XPprYTThXAWkTQDwFCWrTcjBvLCGD6c0fIK4m56vKjckF6gp+70OY5H8AbNjR8w1m
	fkaiKh2KIZczgoF3110cRy0tQBFYRBG8Zk4rJYI1DoVk6vJf1ibH6ItEdjF7FuqcONphiViXzGU
	xL9PibhpbLIVpOdT9scSOhra+Hz8+rouJ4ASfl9zlpI0ab6Hn7fAG8sDzS5DUPlSVhjE7km/qi7
	DFSZFtOY4TECcECqL0LuovqH4BSfi49+Vh92dgniZGGrsyAWQlC7UJ4fp3AXMASc=
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172955095ad.16.1780927622835;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
X-Received: by 2002:a17:903:faf:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2c1e82191bamr172954375ad.16.1780927622304;
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:02 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:38 +0530
Subject: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=1604;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=sqBeLXIeXPBQT0XNNqkPRB4j43uQZiPT+E6BZggthJA=;
 b=FZuP+b0PVwGIBsTb2GSNEUF+DkA8aVrDemOfdhdUPeRG0/7CmMVJj+ha+mLWH2JznULmJHKZy
 hFtJycnzNmXCPR/+tv5qh+moHGxZEQjCuwFQ+XkAezb5qj4THlqUzjK
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26cc87 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1VV9djyPqd4hf17d6swA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: doPZtwandOv_MIx54sCfGo5042rcP1EF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfXw03Re94n4NNF
 fgisWlqmglftKcYDSeBBQLRZnYAVCSvO7ZIxnneomkCZG7BO0hDd2hybpNXlghTsx0wRSHIXAzs
 uZwwmPmuteg3EsFda01b0Bnnlv/JzQtQdMYvsW+OUl/3ZsBEP82SFzLRMn9NsCV/Lp30kfL/2xC
 VjCKvqBAcDPf+LaZYKVtQOQswYRAE75Q9Hzogi0p/XyDiBmphByoXOUcFF6sintq8WcDz9qJ39R
 6lIH6S20W10NM3IuGthUiMEedjsNjm7Zk/eNHRTcHUAWjenTyE0ETbXZ7gYY0A/QCGOjQOAfQ4d
 F5H74E7yuajfEyFyM88yFqtEbZLdDxqGHZwlsAlG8y9iWuvDCpahkBLqoDRU6julgEud3Qy8tnV
 QSnLDbhDsiZm3VE2jL75hmJ7fDY6D4vtkx6NQ4SQOy/dMryznIs19nUkhxvh33CqIqMahZ+APeG
 no+BUUFytPFYCgsOpaQ==
X-Proofpoint-GUID: doPZtwandOv_MIx54sCfGo5042rcP1EF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,8 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
   reg:
     maxItems: 9
 
@@ -76,7 +79,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1

