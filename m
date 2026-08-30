Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953F331ED4
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126982; cv=none; b=uMT8T+ZlHinPLyfclx9Dk5rLDzq2si94h5qGBSzxwAPoebYIGbFOL2BWO697LYQdcllp8xhGpJlF4ITqeDvmUwpTVcWNkEL7sALt/559Gzno5jmFSpxakBISkRR5WJpQMQg9uS/FHEiQP7DCY9K5ZTwgt1ddnydO8P5ncnoFkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126982; c=relaxed/simple;
	bh=i4CDdS3NcaboDh4PbI2lZHqoIEVckwLxgeEcZeqa8uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adB1vF1gcOImCk8MUp7Xr8jIRWFwbp4QYaPFeRT7MBfZ/sF3CX1QWLXlhBPiIzMfr3vagkR3Nape8UJEujRukC3YWR+aZsaKYFWeIwhMOUQ77vX7ZMNVYPO3jHk12styho/3Rf0mnHwHlFO5xotYU+RNUS3KXEJimZBOI83lZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jetLm8vq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTf9jrME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jetLm8vq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTf9jrME"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJu4N1816678
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=; b=jetLm8vqS1vYwW07
	FxaC1ySiTzEbxsVXfDZJ2X7twO5/bbNMU8/+QRwWQI/sAXn2aoRhDtC9KYuXgMh8
	rxtL+tvwh7iFucVpPzuHBJTRGmxXbd+Z5MqPS3EFqgzMQnsii4TSRTC04/QMkJNn
	+LxHfL6ametiqQLos/TG01kC0LBFwAVUmAJcVNP6lVPK2SJ7xKbFfaL7LbUoLnVY
	1PUeqHEMLls8X0amI9ekM6+Gg2kQ8y5L5/mMPq3BWT0fzd347RxEguarGzmDOxcJ
	qJAN1OPGVGB6Nd7TRzI4LLEZfo8DzHN1nOOzm96okLY8jYskAUG0ObNl+IuoGrOg
	n6Iopw==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdvkre4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 21:56:18 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8563c2a53dbso44140287b3.2
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788126978; x=1788731778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=;
        b=jTf9jrME7t/CbzKfXOEzQ9+kOc76SoTd5qNRS6W4Qa1QBWIDsNb8LlhV4r3/IVV7Y3
         DRHCXfzq2iL+dLHy+GicjStGo7fUZ8BP7xqAz5Mu/umMszYZuTqYMHU06WAOXzWqjFbB
         qK/lMVvtzou1lOMriQkvredual1eltjD+wOVqTC/nnow0k9YN/bpJX5GymHP05gZYFAt
         aXUPTa8nCyZRRcCmIf+uT3eWX0JRADzeny+NY30vnbP9dCWjy9eWYRg2pX3gC+Js2mKi
         lCpt9UxTpmCpVTyR5liQiDeheJ0mBI7rdY//zp1KMCNgINItaco13NgzKHXxq+D/XJPR
         T4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788126978; x=1788731778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=;
        b=Zbr8a631Eeq+G3hhF5/ZjoeDFPastbbGVfNfRlBpJln0N0kKfjhKOz5I/HbsDGuvg/
         v0ykq7YDASJEUlIExDHPfWJP598DiZqk3XQANO97n5prmVftPKd0q7UvENKZW+WFybtp
         bATlYBIt4HbOIwIB5sMB54MWd6zmKgFmgLrI3s7a7VRSHheUAMBXD6oIHq333ShvaBM5
         luSPAo8czDEG3Uprp6GO30pqn7fDNxjbX4l07LeUmJhLmwRD5QkKhybMr3jzvYm6USBk
         SWzYAWEOo7W7+//uJrCMrdDRE4Y2q4fWXzsNIG+cPPAFi8A5R+Kb4sAHy99pLEkmQRT0
         85Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzk8ra+cPGwRWhsBTriOpmdbiIZ0psLa/6AYrq5rhVNCISt9ATRbbPsl8048lsq5/FpyTfae4RmxJJd@vger.kernel.org
X-Gm-Message-State: AFuF++nh3aZa4SImdlS70p4+hTewSnfB/vE5vRHH7rK+Xg4gIItwUiDD
	/Ei2ygl49QX0uE3BYqUCizJ6j+tZiwwg89xIcfVsxWS/fgDPLEuzOUqLbUR/YgpGrnJfwdbI+5q
	pwc+ozlqyBzfHObkn6igi/VTif4bR5+q/STN6typSpZhdO3ThoPt7YPEc4N5wA1Iw
X-Gm-Gg: AYBFou3UV9/zuvWkmu/IBICrbZS06BlYLKA8jwG32OqIf9wTxJuSyJcXy4GuO/hOpv/
	Y7CY7E/gLWDHYVvOQ/icodFLLU+nKa9TGQfInNYq8fVa1yh1n3Ug4o4d1BJPoYOyRaQbakMPKbH
	wpwIazI/UwkaV+DxjHBUVNjHs7x/q19LVtrwhzmoMTQfVF81aXo1hlpACiTwK45Efnjh+up5Lzo
	s3U5RNvdLwOomPZHwgF4d1WFdDBPwELL2bWAxLjZXtYFBBPLJrIKsuCNnuw9uj/SCfqhTu6US/B
	y/4nvEPO9SrKF/16CJGA35jIXeQNv/EUX2O3c30DVpw+uoh1KNmhcySafKPSehRBWCZ/CUM1HKO
	WX3cmykc3BCxQQ3wdHw==
X-Received: by 2002:a05:690c:3181:b0:85e:6840:4ea5 with SMTP id 00721157ae682-85e6840633amr54853477b3.26.1788126978044;
        Sun, 30 Aug 2026 14:56:18 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:85e:6840:4ea5 with SMTP id 00721157ae682-85e6840633amr54853377b3.26.1788126977652;
        Sun, 30 Aug 2026 14:56:17 -0700 (PDT)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1dc88sm38268857b3.19.2026.08.30.14.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:56:17 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 14:56:14 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x2-hp-omnibook-ship-v1-1-9feada71dc79@oss.qualcomm.com>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: UBsNQQKyrfHZee-DCq6_TL1mD72x5mjY
X-Authority-Analysis: v=2.4 cv=P6EKQCAu c=1 sm=1 tr=0 ts=6a94a702 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PXKRhWy-3Sq0_ZefuIcA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX1IL2u4QIhjYe
 vXJARlDfj9ODogpI75KJMrnpiFthc0gOhSnbxSp+9PHx2RTO0LWcqUM2TMqzpAfUQVdpWqD6Qod
 CapZ7gHJ16Zjv6EVxb/btAtfb1zIetdQh1fPWBHXSXN5BuTIuJqKoEb25INoFZu4lDgAxvJopnv
 Q1dWAGEdDS1RXRknvATNHiV8fc+AzhM0BN8ZmH9Na4baAf55WW4KPWmYxDVUsH+hRMuOoZ1VanR
 fNbNt4xV7FaaoBPAH8PDBI2h2QDx+qp5BTnL+gy0/vI6Faja5P9nJUtOvZ+pkJFKjWknXSqOdVS
 LLBqwvKHGeoofQsMiwpLtA2j05fuuBuWKV/6rGzd4BJyt8e0ey64sS5A4ArGEMmNrXNCtYTP92J
 hvfTebcggRDmMBJc9ipzyUALubbb0zhzZQ4lHDpV6KYFZt/ZbUJVFcJppuTTJUT88Bzb60QjAQI
 8VCKcJRsRu6c+Wd4aBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfXzm6P+Kke4YFs
 QFZy2kxmvlsZOt0xD+0FKTmHQ2voUIXSGjVCrZiTX/cuHA7M8i4tRskUBerPVtnP+yDMPu0GZSk
 cbJecdKeYtRLudyoP/pXXV5brwC5N/g=
X-Proofpoint-ORIG-GUID: UBsNQQKyrfHZee-DCq6_TL1mD72x5mjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300191

The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
(Glymur) laptop.

Add a compatible for this machine "hp,omnibook-ultra-kg0xxx".

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..bd940477fb24 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,omnibook-ultra-kg0xxx
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.47.3

