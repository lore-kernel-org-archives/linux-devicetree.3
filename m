Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E733E763B
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894204; cv=none; b=VInEPk2EypqoJQbMlH6ZEdwjctHJKcM0MYKWCcBpNk3/jrtXBmwPUhgfwTAxR1ty3RSX5/Qi4KjSB/MdPkuDxWRk5GCXP6s7NkqkyZzigKGSBpct0h/BzpxHYZdTD+SrRLIZy48tRTVol8nwDxoPQFm8BoKnStMTihackObDmUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894204; c=relaxed/simple;
	bh=yQoh4B3TH/uFnMoxO5cD/A9qDqZzEegxSBACB5gc4Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ad5r2ULpdp4iYOZHCCfmFzT7DzbktJW9oqCWNMmPwbdFfkZZFQZMR1vJOiL/H32RL3ogEAgQgn4Oi5tvm8DoeyBqkkWu07XNWr8LjIC3RDcPTkpTwOkCWxsc6kqy45BDZ5uUA0SPUQ349KVdp3iypcreYqDSiS4rjQDvXyC4uEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0s2ntfd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqbdAq58; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0s2ntfd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqbdAq58"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VUhH1242497
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kod6a/x8RN7
	WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=; b=f0s2ntfdhpYrztm1M8tc+HRyYgH
	kz21ZPCTw4SXolNiE5B81DNM6lfTeUA2oqnnq8WzRmbeoG8ykxLh4KFT3axcUuwt
	fsgEbGy+CLpU8RbcFziUDbcs4rISgyqilfUwc06gLrwU7eBvQQOoR4KRh9YEEpum
	HJHoDdU4uI5XmVsOxAYo4m3CrDklE0u98oMOEYESGcYMzCbpyXsLDEkUQUeFDKJw
	i5px1QNUxmGT37oCGdBWlugSuW4bLAunO+YDc3jNYQtgZvPucGo1HweaQQKVTCA5
	czwW13ch72Z/tje5jH8v9Qg05fKcFGkTmCcXL30LMDXODSKvsy9c9CKgwCA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82j9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 08:50:01 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so29795475ad.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 01:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789894201; x=1790499001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kod6a/x8RN7WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=;
        b=hqbdAq58B0dFxES+cxwlwXSyYjCjwh5d1ohlquYzrJYAh/wRFmKt//sYt4pYeOAciF
         l6Medw2U29pJxMhGPvweK6rQ/MxFoyXgglzixhGUJTU/ME9cvfFvh2sSCSI07Se34YgN
         yw7msg3eKh1jQEeohsUxAEEUS3kX342/WHttEHJ6xrcVDjjMOb7LIFQjbxwcfHfvwbxq
         Dqj0O7xARknI0mG6AfNmu2ca5cu7rqXiUpNVASqeI3DQY53jtvKH8ScilvQKU418nyzt
         BzI6D84youiAEKTke8kljt6GkHAzS+5Q2HlfpVt1zCST6LI8BxsG4mMry2hJTqInwc3f
         ix1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789894201; x=1790499001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kod6a/x8RN7WalgHXkb0Q64ON5/9kdjSXWThu1ze+jU=;
        b=WRdvIOBwj7SIPmNlVhsAI7oVd+AFPv3z8FRXbW5KukO8cWtpn+nc5v8yiWSbwvm9w+
         bQxHfUZzDQ+237vY0USOHp/EF3ZB6wPOrab9UYXrBgYVNG6Hkm9D+HrrtOPWRPW+tas+
         f8S7/OWfv9wjzuPRvEsiSuVLnEBun0IpDgn3Nac95suVRhe75Y1Jfzg0OCldSRbS8ng5
         whRYUNtdKMpL3+U1jRAtdvAfzwi2MmRFgywsnZ0Z7+5G3JTIBqvOA8iHj7EoQE7CqkjU
         bK/XNbUYtdhG7bCP99sTvtSiFAzNqNQX1mTKwytYSi83FPuKpzyg21X5M4F8L4w/35is
         mZ8w==
X-Forwarded-Encrypted: i=1; AKwUvBwPW4Q1K3Suznr3+sj1ylPc04HaBPd0irRmUbnv7ZAhHp8CwPzEU2u1HyHXVxDY3Cv9uKVqbOUlzNn3@vger.kernel.org
X-Gm-Message-State: AFuF++nbbWDM6tXn31X/DSwzgh/0BxUpjQ+/UfdmR5vxcULAQm06wmLL
	ndZBsnox3M9AjwIMyW7Br5EMwixwSPEGTDxloyYquZ+T05RVmevH5x1usfC12qKi0GEiSZtad24
	rF9hMAUtoZW6L9qhynR9JjWKYUf1YjPGjQbjOmFQQo4ZGuXWWnp/Bx0M3EHWmg/9p
X-Gm-Gg: AYBFou2G8dVc/gFJXLJjV0CoeHVShrC8xqvzHMN1kwfT8c0D0OUiyeoIb3/4k+9x4+G
	QRdctnmTJry1FORbT5SQw4+90IAnM6wrSusezT/vS4k3Es9XSF3W78AawbBCzhoPVvhkYV/VeJQ
	asamIlR8WIURXPPx+NsiS8qRUt9WUECo2fDT0CYiJ8agXEWdWJYQfsMgyd8lSS3ee0Z9gC0F8mx
	3pwwdLl/PATgs15+rHDb6rxbu48sVMdws+TXb4jMBs23RYkWrb1jVOD9WQ/9fMiC84EYC8uurjA
	HAMbh0aHQMEfBICc2PRt69+RB3Q8rKaz2A5q/NDD1TwnFIy5GLGAYJUNrs/Mg5YZAC5wJZocgBP
	I4n2MAGpJM/vBLNFQ42EI+CvDLpjna/Ky36RpHCV2ITz7ieF35oI3+CGLCDyx
X-Received: by 2002:a17:903:b10:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2ddc0540974mr56657945ad.32.1789894200477;
        Sun, 20 Sep 2026 01:50:00 -0700 (PDT)
X-Received: by 2002:a17:903:b10:b0:2dd:c053:ec6d with SMTP id d9443c01a7336-2ddc0540974mr56657495ad.32.1789894199649;
        Sun, 20 Sep 2026 01:49:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm11180808eec.14.2026.09.20.01.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 01:49:59 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: Document Nord Ride Embedded board
Date: Sun, 20 Sep 2026 16:49:19 +0800
Message-ID: <20260920084920.2201418-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
References: <20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i5USm4yzduj2CMQjcgQ33RMQpOWdDsfn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfXys+8F2KkYGoK
 LvoNqhRKaKdUitofiib/TE3qvB9YDk7s1hC71AZD6zyLv+YYu3rFl/RD6hDvzCsduAogx6mGK0N
 Rj1y+9pf6fwv3fFJ9xqO65sHnUTd+tY=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aaf9e39 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=O22JRHuKkM2UMjjIyrMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEyNiBTYWx0ZWRfX2N0xeayQxJcD
 35UJ8boUkLHw4NZtarp9VCHxaNb/IA66j+KErRZAuiQykbEw2kiUoa/TVo2iNves6QlObSEOM0l
 BQ/xHrlcAm2b8pN79htYEsub/ZjC19uCOfUrIEv6iCZY6cSshA7Id5b1psCCIItPiEsgd4NZGUm
 ZLYMBOqpbNcEAysNaByqT11a0+zoNkZHo+FzFjLR5P4wArQvWl2li+wj6Xi90MJk4i2hjBdxxTL
 Ejxh7e8XHdqA3bozrRSz//xjotgB2WP10uRDljugqL3h6VX85JD0tJz9r4cnkS6msW+lvg01AsG
 ihW7CdxfZ4sBkLBrfJOIQLOREsOo14kX/ZLDjT07U+mA7MoPECTwWnPDUNW+XERCJk01rBdOd/X
 MvYsX53zsA1E7WNboLRbJtYcW77r4ymQ5bV/EW1K0umC+LbI+G4Sh0cxxxT5TwFnTwb2W68Dx7W
 WcwGy+FJpjLhi5yCBuw==
X-Proofpoint-GUID: i5USm4yzduj2CMQjcgQ33RMQpOWdDsfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200126

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Document qcom,sa8797p-ride-embedded, the Embedded variant of the Nord
SA8797P Ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f93027caddb4..07ce0fab5ea9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -413,6 +413,7 @@ properties:
           - enum:
               - qcom,iq10-rrd
               - qcom,sa8797p-ride
+              - qcom,sa8797p-ride-embedded
           - const: qcom,nord
 
       - description: Qualcomm Technologies, Inc. Robotics RB1
-- 
2.43.0

