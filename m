Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA5435AB6
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442240; cv=none; b=NbxsiqDZFBGcrQ4/lR9OnbY01Dd8tgWJcMjaHM268YDI4Pp0RPsPTJt/8P9RpmmRb2sGv5SB8GUvunXXOekg73bgv0wm9v1I9d/8preVW9zF3mc/WKXhwx5zrAW4iWxURIr+LRw/aUtAPyA3uxyQYMOjFHuvp4dyqxABA923abA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442240; c=relaxed/simple;
	bh=1pRcnJjp6HnPGF7Zr4pGgrauHhSfDRBnsJl/xn+e7ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfE/WjXM6K2tSE/i5Fp3zjV55cyWiLRgS2AlPmPQdKpvlojfYIYkaip3LWGZmU3khUqMhMi1Dt5xR+Vn/wzJJ3iI/NbnimXorV54VckV1sXoSpvixdfH1HrhLKa/YWkAcUotU8JAV8KZHBc2Td+PbtqhFXW119Sh+daboBVJAlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eD+qpjy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqYHdV3i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eD+qpjy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqYHdV3i"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FTMBD011712
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 16:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Dc3v8wlwZwc
	bDVCWkXzPT5udgXKUwWddG2yEhAPwIYI=; b=eD+qpjy6ngi0Mb0DF9mQpgSFZnP
	9t4L0UoM1K1IP3Dxb5STAvpFf4eK67djAGdJeoplZO8oeePkAuI7hBizA8arWemQ
	8Lk0qIhRFyjMd2JeBAnCjTZp/yh5rGvCoKYKR66L2v2RYCYZg73RbBuHen0lbNAj
	2uxak/hF6+qELGmtz1B156C99gRcyUjmxLuvWKAczjGCXKZ6iD3QkK+l6hebxJzD
	hsLDortYKlwB5eb2GIwYjOPFmYdIKh9ltMLKl8b4p/uJqdLM4jnRlEeb8Q8XXcWZ
	YZE7evWpwnrOu435zYqW+CzfeCu3O3BoZ8ydVAD7CDvQ0h4WuzEKK0/5OJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdjaemj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:37:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c33f48ee4so49163811cf.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783442237; x=1784047037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dc3v8wlwZwcbDVCWkXzPT5udgXKUwWddG2yEhAPwIYI=;
        b=hqYHdV3ikYVhU5tp/s5rNKlHODoSe7933cy4r4spKKlkIgzskLXvdUZzvLepjFQReN
         FL0KCWed3+RrvBCSCVrP00g4FdEGy2GEfh4muEuV3fbM/yoviBWBqY+aSI5rxzZcm6wf
         BzvHtb6yVb71XBkC5RCuac+wyTReootz8Ie4pnyAQ3y6wSO9eF3pS9PDnFNAkUWVA0/q
         bwE7iJkwW6HZAv9wkN/ejdbKZa7zh1MW+JEOIAfxYIju3VEuQmr9DMQtSvZKOdhtgkuh
         ehWq55cZlRqP/X3FTCWyEyYksAV2TF+dAcad6UmS+r5ucr/AGWnXedLnR7lV5rGTfUDt
         vwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783442237; x=1784047037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dc3v8wlwZwcbDVCWkXzPT5udgXKUwWddG2yEhAPwIYI=;
        b=JJbwxrMwCfO8mtuhN/lJ4gf2VPjcD541pehi5xSf2vwCUUD2jS/ll5A0T3lqDPJsfI
         WNwYBBqKO7wsN42MnxTuEY5E39FwDBJls16wg2EsdoX6j25cQYzYmkd3CCLLffqtgfIk
         acqrfKIejsVsDVajSg1WoueFLzFmuTPLw6KLmoZeCRG1vFnoZiGH85150S77jf15muP2
         +EIRyvkdR4Pp0iLt8HyC/iNMSU12dYDzP3JEsoMa/LVbyasswRjeLqkIxCt0hvq+xohR
         A2nk3bQVsUSgS/wandNvzPA1niklWKRvVddcKoyNej6VPCFZnj9N8yi5Mh+HGCh4zg0a
         XB2w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5tmrlwvCLSyGnzZjXoCT6dmSD7Cu8juLWk2bmKuREsWi92dKfNjx7o3jHJQIHGHLCBaOJs3j1MU7s@vger.kernel.org
X-Gm-Message-State: AOJu0YxSnerlQScZry+6U6/VP6gJvOPXLduYGWn/KcJkF5C9PPo8yeJv
	/6qmxYgff4VR+bg2KWtus/PCifmfVY5LCxwZ0Evurrn5S9TM++UZ88BXkDeaTbO61ICZ4/wZOLG
	zOaqmWWB0icqOAkoT0wuL8VH23pXZMuxHdpbT4vzpb8moDk3E5mgY17tzLATl2ahK
X-Gm-Gg: AfdE7clAec64eX0q2jmO76t998ZB8vC6kArdsDaYiVuV01zcZN9gx2/BNiTQ/vKton4
	yIaxXcMzGZCHuNhZMaLkRcQocNSDCm+vparjHztj5s3VCxCjrw5QzonWxE+MJR6o+wnqZDYbDXa
	MlF47tQ/1WuYzbdH6jLu7px6EGl3o0z+bx2CDuHJMZmAo0BdJ9+fUX2vW4UXaDhi4MMhehvz5nK
	p74sPjmiA2oLUS62HgorMbVUApLP+An6kJ28LbmU75Uik05PhkYDatMytO6t1spTHCi2V8t8hX+
	I+RULzona4kKk1EQyI7R7c72byiKoYheV1b9vH+Z7UGmyB9UDwd7WUUrkJNdl6gOg/lML1ZM8Xz
	H4K0DhqPzsofH7XqpJp0a0fdN
X-Received: by 2002:ac8:6109:0:b0:51a:8c97:9389 with SMTP id d75a77b69052e-51c748f1f75mr68613421cf.64.1783442236079;
        Tue, 07 Jul 2026 09:37:16 -0700 (PDT)
X-Received: by 2002:ac8:6109:0:b0:51a:8c97:9389 with SMTP id d75a77b69052e-51c748f1f75mr68613081cf.64.1783442235658;
        Tue, 07 Jul 2026 09:37:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm34627699f8f.36.2026.07.07.09.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:37:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-arduino-monza: Add label to sound node
Date: Tue,  7 Jul 2026 17:37:02 +0100
Message-ID: <20260707163703.233405-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4d2b3d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=T1UfASneSRU468WR1wEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: HAoYJWP3M0ROgYnplWzI0_mGXDRk7_7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX+CnVLqQwrjfW
 Es5bMi9UITC9VhRS24f83OstgrM1sLo9vyEakSu808iu3llqD+8am22a3SRTNBOtbUiCfRDcECY
 IMoOlImC9fZdyplaO+y5lJNmcLqy8nzk+XVB4aOjZsLD88IDpA9mV8+xhh34/jRvAvmErbpwVw1
 Dfq1wcoQXqKOuKi2ZYRtD5lSeIzS/hw+J97JmXQf2VtVsZikAE/MFByIy/LNgLlmGKkXVSM1Gnq
 b8MLnEZotmLw2MkcZCU7prDm2LXDQwwv4N/rVjoZG4ui5q3NCwU5OFt45f4DRYNF8Bj17JhyH2R
 b1IIcc4G2Xo0LVHKuS1t/iZfZ7v1mzTSRGLHpe0HdtMo9M9PRE/i90W7Bd7Adm4p+d6jA1hHBwa
 fEAGp+Yv5CpX5HV0OqxzFdV8gyzL0i4XLmDozIcix9sQFUVzHgzeh9qkgAY+U0La2ZuG4l7BMal
 ZTb8tGb+AyuRuefzQOg==
X-Proofpoint-ORIG-GUID: HAoYJWP3M0ROgYnplWzI0_mGXDRk7_7H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE2MiBTYWx0ZWRfX2zIdZO6lEt6Y
 PnLO6Quc8BwMJdrRkV+HKgsW/wtUzdrbzjDUdXPjekChs/dFOGCBqpDv1Bgnu/yKp+XAxpohwGs
 XU8arDXgviP5HTyjvAM24uKut+nSrIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070162

Add a label to the sound node to allow DT overlays to reference and
extend it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 4b1975dff885..1f27d92d9ec1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -55,7 +55,7 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
-	sound {
+	sound: sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "arduino-monza";
 		audio-routing = "IN12",  "Headset Mic12",
-- 
2.53.0

