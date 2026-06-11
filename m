Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED240BCCD
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186736; cv=none; b=reWkCv72G23PzRJ7sivsr6Sh1Z0XQHkfIYOp7LRZV4Mu7hMnH3Kwp1TLGOXYxLyRWbNM+1IZC/inM8R12TkO0padE1nm56CsZNx2JIeSQ8+oaha8rebAq6C4igLi2+MeB9AtIBf1cWyDOORiIv3TD5QUFmAoCxz/yo9mEeKZWvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186736; c=relaxed/simple;
	bh=cnmPhElCTchkth3Ndc+hQDCapDaZ8GQl8BWi+yVn00w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvipVi2z76cX1olCksrJcHWioYLnfW+flX5AByHuCA8dWcKSzbwbNsrE6i8D2iCb0Dfcrl0cl9HqsBX2W39swiY9PFLo++2MQvctSD0soK9T7a+CyXJPgp231qJdrPgqFAmUY2dDTBVCJ93yu7OceMSmaqesO5oEeg5Mx7KTTgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTD6mq4m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMQjCf8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTD6mq4m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMQjCf8J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCT0xS630656
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=; b=YTD6mq4mrxS9r700
	dr0Xg/ypFRHLhKAh0xa6EQP6J4dLJY+odVzne+36vxt44BJov9uumgvV6SDuGfOB
	suct7j066fcgmhCbX21alTW/miQmW3Eb/FbnnnXQxD5ynjoLvcVeHugydMZZZH0Y
	PS8w5Yrj01D0YIC8X4/adyhAB1jfE4UpE+OrFlZ5cy9seZTaaYtp7NOSiFl9CvtO
	i0wXsxCMXFbB0SmBQNJghLWJA4lntPshITWt7LXdTeMINAxM1UERIOp3TyBL2VJv
	TqrHnbdbzB53mfMKV/bBTFNDXO+EVe/3F78YhfAsoCLRb6AfpTjbrpSjYhHPAl0E
	OAUk3g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5h2ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 14:05:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d985df4cfso9461790a91.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186733; x=1781791533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=;
        b=EMQjCf8JBdofJIEAAIYUnCkhj7XtewlITyg+1GphzbLmJSCLCliXiF5BkI9Hm+nnsB
         G+ARONMi77U9ZU+0jHsJbemcccETbHBVa5awIbgai24dlLtD/beIpiLXyxo7QSGXMvYY
         tVMWnMQB3r2ShKq/QML6QC5NanWUAAQlLv3L5MDG5ICxt1/MABl+skAjJhe1YrBhUqg0
         Ysgj1237p/SlAEaCZ6P46eRu3S7LlW2XTurPQq/9A4SSlg8szizRrSB18cy3RJCsDHbd
         bUvY2FYVtVD1E0uzSaTamwomVWpd5YS9UU7+TyvG5co7BFMlWPz4CpLivxUzEezqQkc7
         vp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186733; x=1781791533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KUbjYXUbqTMzIFkJjml7ONlkKsWs7fQp6JNxTiTreUQ=;
        b=UxmxpUBEYeovLI0ljrV5AVNX8AyHQ+/6BZY3yfKBoaeQ6CUYFhJCoOI/Jca+EBicdE
         MhZirr5lfyNAXT6pxH21jdK9DGHs4O0xFUfsVm6lvZ5pqrHKb9BKG7ZNHOkCs16EzK7c
         WVD/Ksq4W5ozo6sDo5mVlf5eFqWriwH1eYSKVqaYXAxbr8K5vDBbnJRHbCpz93JtHRLw
         8U69x7JPf6fCgeBLYnJUPY9WBKB/4LgZWBUI4oXOMN8BLK1RjdX0snxZNHpK2l/hpale
         XAUGXFJCJR0jTOnGgMfJ0niL3FxCGKBufd1H/sIu/eB7VLm2+P0IUvElfvfgeKReM6gX
         OWxw==
X-Forwarded-Encrypted: i=1; AFNElJ/vUePyf7cKD2eignAWMCpJEHAyyOR1CE33cRITtJfDgHQVXwMjxger3kOR4nR9evBVLhswVFwSvotC@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHiLFYcZol6gi3bLmOBUhiaXbHsOFe/BxByP4Iolew9i721tY
	M3BMTZG0mnzdt8fv2zOYKFa4YjwPnUaGG/G95GwWykFLxt5pv7OCJTWFiB1Q4AOp5Qr6bE2PUJW
	Puc+vpDU6qd3IGGqRUfUOLGN3ZO0OcGLQ1nzeJnne208bJJ+/o4n/CjbQmRvULMGp
X-Gm-Gg: Acq92OHR6+zDa5p515suKe6i+gAwI9qeKhj+rnqVy5EaAUEqsE53xtp++qfmrEUgRUc
	GVzQRZGOXPeWKmyNvik4KH1ZYXlO58qZ77ENTLe0EgJI8crTxgwmA9ChRvgbYUQi95O78vC1s5J
	X2d+Z1BMoaiVLwEFQldTlz/i3AQeko+ZU7CgQJj7WCZ31Lnd/PnznYYLDoq9CEdG6J8PHwql8AR
	DTF6ISLUx5CQZgPTR8Tx0JYrOmxMwJxb39tynasoYYFlOz7KYfGxxlU3V0GZ93Z+AFdzAaPy12g
	96uRkctFhNV/SLDl9bPMdaFP29/etDpzLilPYVWRLlxiuZoQqTTgMzKhPJSwF1HEDYXGqz2sO/d
	qkJrdOWWLTJdr726inrcYq+nAfP4hVUVJI+UeV449VW9cL/ZdWnfq/Lrd8uiGeNjQcJ0GL4S/cd
	HIAq/3mAwTBILCQOmwRH9LEdqha3BIdphDFNasHulc40niFrglNdZh3ZcrZkQSB2n8hfzakql4O
	ixbnw9lV0TY
X-Received: by 2002:a17:90a:d2d0:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-377a62a4557mr3298404a91.17.1781186733517;
        Thu, 11 Jun 2026 07:05:33 -0700 (PDT)
X-Received: by 2002:a17:90a:d2d0:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-377a62a4557mr3298357a91.17.1781186732922;
        Thu, 11 Jun 2026 07:05:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:24 +0200
Subject: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX4uaR6Ku3ZMlL
 zwVqRP8x7KcUu0h70FgoesbIYeDpbV9V46CAeJnTm+nw+UhxxBjwKWrTE0iBhw5XDCULk0uXEHt
 rncBe+Lz+xrHA3+KRGt68Yb5nBap+NdTnHtjeSGjwGad09fNw/WlAmVioW6ccEC7qR+6QcOvpEH
 yBbL7Mza5RZgiN4KKDA3zNxa6gzT2TEIjTqwPbVgDF6rVpXDPhL5TlsscunXcsWJpmbn9QCNuin
 NLqAGQ0ZIljYIAFg8IG1yYi3bwHbx8s68wZ8d8ij96DCp9nfY53jsGwZ/Rliadl0LG9EfVutkV8
 Ex4H4xH7DyvK9hM7GHHRJRIt5rWJ0YCiAZwzziewtC1PvyxydPI6J6lyaM55xXV4i9LN7HJGgSd
 FWkWGPUADVpu2haTxiTfr34+NFQyqklQ0N4gTsUkYPQGG9ZSzQ7XWgC4G6gjoPCMnM62+vQI8Rn
 PzwbfXBv0GzYTsSqc7w==
X-Proofpoint-ORIG-GUID: tKXjAVh69TvzT36mlZlWFc0xY4mdfWbq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX+Nt6Rb175nhC
 QP/kyiiM8z7nwa3d0tPmbfGlzzOkKhvTF8s9aYpEAmt4kjrGXQey+WO82eEHK8GW8XTPLtctg5f
 +MfzrbLu6HfMthS+94MgwZv4W8nF3hY=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2ac0ae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: tKXjAVh69TvzT36mlZlWFc0xY4mdfWbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 009d78b308596ca795bebdd160431bd718b127e0..a79ade3142fa4f36f2ae4655bbf0db8ad84ec13a 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -28,6 +28,7 @@ properties:
       - ti,ina228
       - ti,ina230
       - ti,ina231
+      - ti,ina232
       - ti,ina233
       - ti,ina234
       - ti,ina237
@@ -114,6 +115,7 @@ allOf:
               - ti,ina228
               - ti,ina230
               - ti,ina231
+              - ti,ina232
               - ti,ina234
               - ti,ina237
               - ti,ina238
@@ -136,6 +138,7 @@ allOf:
               - ti,ina226
               - ti,ina230
               - ti,ina231
+              - ti,ina232
               - ti,ina234
               - ti,ina260
               - ti,ina700

-- 
2.34.1

