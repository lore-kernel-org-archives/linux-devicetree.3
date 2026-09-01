Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4B46C4C6
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248440; cv=none; b=Hu6SlEIydMluIYSCfEZieh9vyUwxHifYca121aM/MffoVrZJzsQdgWlrRlTQLy62OZtQxsVKJEd7erq203DsCafAlg6RvD9uwpVTFMy3n7kgTW8fHOqR5SojRM5XJvmSWVQDkJzbAJhMBa3vVSmv57ljdqioIZCAZfTSXwJzNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248440; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NctWSvtXydM7cp+2obiQS/ChXa0dk9hsadCLIWVXji+dRKDM5zqWCpojjW2gHm4PuUtSpjVSoD+sn3iOtz8krPoQq4JGnzG6y4RD5QBdS0lt6tuGoGIrjCulc2vcjvuWpxHFdwDCp38dzgPEJELhb5lAPUqPC222Y/ReIJoq+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RD5usTbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdsQvDRG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RD5usTbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdsQvDRG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179DLH1892404
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=RD5usTboIh0wJoaR
	G7pPnPR3vvmrc8rRlrHFPlvrDElLmcu7HjrK1Y2t5UzvzQ4Xg4zqYa8HKZdezxb9
	pV5BVkm+yQ9p5ehsbZKxlGGwXitp6xo3xTOUUL2ZjaIqSCoIpCRkwKVejWhaWxgN
	qd7YnyTzIidkPHc9UMmz6IqCC/IQ0ixP1tRYegWWfbrVbhtokkMf+vfjfGZarz3d
	IVA+TrJERdYNsc30d6dxyZf2rFX46r0q7b2B4advFL2t5GOKkOLJDiQaijQYYxd9
	E/jsAXEUqCApc4OMs44eXFYSqcLnFCYQaWXQ7vrpxXB/FsLbGZE2GrZyitveNZBA
	wm7/5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c94s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:40:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso990619885a.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248437; x=1788853237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=CdsQvDRGzwscHbGo3m1zqbQyslDmdUU8Zwky/28Xx+RkQ0YetxsygfEKB+g0HGJbRn
         qjlfh4k9W+r5/4OK68bx0L0SibQyQFDvlt6qTI21SLakQ6LVPFiH0/EEr2QEs7Sj5shW
         rJIGvTCWEGbO/ARH5g9KlKoUl86J09/nm7VxGblE7kIKNlgdp3+YexdG16szBfWoYTx4
         ugrb7yGEYo9+EFOa5B0aDv+78bEL7N+JbeWJDlpKw0CxJ8VkMfoozEg1lm847DgM1y/R
         0Vo0xu+3SlOp3iCcX1AO8/MnXGqFlLiuFOeCYrgBc3Mvqx1ukEV93FqgJ7rQLp3ujDnk
         ozAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248437; x=1788853237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=H7dDROL2fi0izN8Z+oM8rbYANjpNmO+bYrih2vEcFhB4Ud3wt6ps3LsIzXJlv2xIhx
         9bMLDQjarQt8df7+MtWpeb1FhwSRHjKSkErX3L2YdaTNLk0EbBV3zPBxgJB/xi7jWsjs
         KaeoD734mk7+ewyjJRUYkEqQAnOHpofyMZi01bwQq23/2AYnoegbBaLXF1KRCLpF3IO5
         M4HAdkrvRQLXyr3TEl/EuONRZ3APrxISAisU7n4qv9n8mxNhdw09Km2NmFlzYiTfMlhg
         43KZCmiqIIJpQ052QHfsG2GoQPHviKyMdzXrhAAQ6wy9jpzOo9FvJlTk7KLHzZqFI+GR
         ajWg==
X-Forwarded-Encrypted: i=1; AHgh+RpO45nzHf3Vf0PzfkbsN2iIZlnBCVEiMAUOJtSk9Q1kHwOx8s2vMp8e1QxrP1NitlmbQ2665LlKo1aG@vger.kernel.org
X-Gm-Message-State: AFuF++nNxwVyEWIhHe3lzh+0Gw9Hh63Cz7FQE+NhKDs9aCzGPVaGnxpL
	L5HFEPHcpvpAY1gKbtkDa8wd8mhJLzaV9N0LRW4AOAn9PCF6BJk/M405tV7mNw/ZMmrFBOgwwWb
	T3qFE2yJh1xvRWwcYM1LpFdBujXqtKMT5dc3qxaQ95SRbGkDxQ0QGKH7PdlsD+19MXw2jmqFwPC
	Y=
X-Gm-Gg: AR+sD12CKnqNBh8K44xxd2AQSMkTK0ihFvwevdioPJIfj7fjXfaeTZHtrCXaw7BrQzS
	PnWYTHzEmZ2I1VK3+Kz4iSn0VWilKfug3toljdHiPBv07FzuJrL7M8XOX4c4v0K3MTCNGROSql9
	6Gvwhv9atXB8xKsdnyn/V/AlO1b04WZHoTLP5DSglgW2ESLJvcp+nQFQ3UIzo5B4DHcmwV1pA2s
	cW6OtMETbiVNHNR16BmA9Ac49ZX4IueNjdXvUvtyHRx81acnzcBQbsUHNEV2OL3tnv7Hbl+cj40
	jKX3bhuFSFaIJxSPtKRuanXKH8iyigxaJITTCp9fznIFATtmaHnyyLkGwR5hoO6AaxnSkPQ05hX
	ympmk+jOe5GHjGi6I0Rnff6UfnsS9zoqMgcsQqaeuUJdT54Eqt0K0Oy/2wioR6qQwHrS8
X-Received: by 2002:a05:620a:a414:10b0:937:6aa0:db7b with SMTP id af79cd13be357-939137b375bmr2860706285a.5.1788248436716;
        Tue, 01 Sep 2026 00:40:36 -0700 (PDT)
X-Received: by 2002:a05:620a:a414:10b0:937:6aa0:db7b with SMTP id af79cd13be357-939137b375bmr2860695885a.5.1788248435296;
        Tue, 01 Sep 2026 00:40:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173f2758sm960412685a.37.2026.09.01.00.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:40:04 +0800
Subject: [PATCH v6 1/4] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v6-1-a05b2d04c892@oss.qualcomm.com>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248425; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=yVRIHwAXVhXH14MvIsQ5q7D2SW+lzFPAbllEUFjWurhJQ0oOM8BbjapX6dQXsuGSsOZJ5Rb+k
 LqGT9Ow0Q/TChtnSjooIV26OJYLB2zKpBxYLUn60OMUaVPlCntM/jsQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a968175 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: h19XnulP5mdosMNL0bPnCBYAANfHBRoV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX7/eWPhDSvmsr
 3iuTc6rASZzqsmXMWzj+5vCCatTp0iZZ6+f9A4Te2szjtoOH9t7qVnCNMKnIS2oDy6fotdNUAUL
 Vozhsq2o3v9k+pmPEWxeFnsVKfImnTI=
X-Proofpoint-GUID: h19XnulP5mdosMNL0bPnCBYAANfHBRoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX6G2N2ixTLkjW
 zWCWCLcHP8OozCxlvD6Pd7Jm+/FUbWyfwHx5UcfZHFvwMNq0sEqdLrlw1z7ORhsEpzTukWiRThk
 l/4Tf5j97olXNDQJmr+uL5pzGO/jIPLxjBABGt08+X5O35UdhdR1TXgYaYp36dhmCQeWcIoUAH9
 5CsZpE6nCnM+gkAzr0/bWbKwvVTxwglTnQyx0cjH/Nxrk0o8ee5q1ndgEXWA9dCRukJ9QjLeXCo
 KEN400cRzVyOHddGWaG2EwK+PKFRNv03DCM7I/KYHN7ILtMvpjLM+vk98EyVKbJm2G+JwjraMIE
 lP4Z7qIqclvdgtCAkvATDrk4WKV+poFlmHNXDu4An6LyRlLu2JbWRh82IkByLQwUcfn48uz5GN5
 2TP0HQegbokkjYVdckbzA2NVHrKKokLR0yovYRbjY0iF+kWl+iiQf2FfsrKbLtik0x/nsHxvWsd
 LCF/JSy44ogBV012PLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010067

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

