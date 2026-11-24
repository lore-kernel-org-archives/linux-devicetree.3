Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517713;
	b=p7QSDRZ/LGca7JkKhgvKyqZ1wnx65LHOkWmJxcM20PHxrZ0QFqInQ4anA2ba0kbTZMrh
	 9DviiV4zpiN3PhO/D2S+UOOeV1gsvdKyePXvy9yQSStAytImuRleWkAFZDUgcZW+2eYJ3
	 jaC/kANVwKE0/hHRZ3nS6W7CqefE4YcuPIyQzfpIdH5k10qNbPAie+GFo38+MhlnCT9gx
	 /Mx3Q0DvXqJMIIzZTki1I/pzYMGFYSWAzIm143x/2U3NeVAa4S1aPcRwregIQfwrR56/A
	 lIH0nXM6PpacW1Wp7c7CIvzhN/vsLb575O2c17iEENE3hvOC3mK2bA8Jh/XS/Nws5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIzNEkVR5A0=;
	b=XJQzYVI4Ncwn0zVEJ5d4+3y1GOcA7lR7IDy4ViOChvKgRRtHEV6Z6U82i4skpxMEDLpF
	 tTABw9Tg17NneOjHx8Dp/58GZAQKrHFv5JMe+W49p5B19iPlioKginpdUky0e1wqy2mGH
	 cNDZ3/c4ykg5QEEvnyTProVjoUIGVv8N+qJ+EQN255exnLNCD6d9MZfel7pkg24pNrGAf
	 cKbBiTxjY977Kfsymm/22AM8dV7uO9Nyz1/+y0iQcHOswaCCh6VtfqIP5xcimbSIpLrNA
	 y0qGzykJQcwCbbv4vWfTUbd0PDsFPuMYw6bymb/XioGFMcSkIIGCkgpY3wr1iVlcUyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdjEfdUL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBYTndrI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B42B606A334
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B42B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdjEfdUL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YBYTndrI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8YoYP646331
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIz
	NEkVR5A0=; b=DdjEfdUL3QdRaml9UextpTbMDaGlSn2LGb+Ovmgk3q08ZLfZ6ki
	ZeXLani3YjCNTNQpstjrWEKquHYu7QMQwIflQY3W4sMOrUv88JJMgh6awnsENntK
	2OTpD7b45Yr2RSVymTy3TToR5oUAflabDbjQMzwIuQiA9vJaL470vZa8xEDvoBZd
	0BEZLyLtOd9V8qzMXHXOg6VZZnY3umf+4EonHphe975C0CvvneIvIRCZctln9u0a
	cbp6AUEuLIL3kA2ibTmYV6cu7//eb7B2Wy02b5at+hJQ/c5z/N/x7uejLwuQakYs
	I7WIVi9uZ4zURUcOufjiyCr0JeJr3IposAA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2axk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:55:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so2327777c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517710; x=1796122510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIzNEkVR5A0=;
        b=YBYTndrI00vbsUOllGH8s2MyYWC7c46fvyyzgJQu7wJsWoGRtyY3opA2kUmbcHVR5e
         E9lAoXPkBrtS2C7QTi6OUq8enYxL6cc6VsGWm17VE1zj3mEk1cuLdK1CyofEzAuY1c5E
         tf/Dr2kabc1hpkHS0g8fFSPZvDCshUfTW8d3UAvkftGfD1EaQjzaNc/UU3dDwhiKOGAz
         myOa3VAkcEuP7AanIGDE00F3tfSEsTfJ5wn9ifSY70O60PdVjwXPbi9LzKMlZXhi5r3x
         u0svxOzr3QkUUSfhodFS1WwCvH0ZsM/J7MINTUkrDQNNMVptT2qtlJFjhGsxvFEg7waZ
         G+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517710; x=1796122510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4JvzfQWnfY63emsL/cHPtwzBAs/PLs9EIzNEkVR5A0=;
        b=rKcTr9cNHph2XQQTafpnCLOrBwZwnqIZbwTElEcT7VKl1Dnodivc6RTBmN7OmH85RZ
         pt9/cjh3EYQkS5ZgDAL+WMflFJ0VSOyPSiLsNf/Tyf5VgUM6vLWMkD7PNkypY+4efYNP
         C50QaId74xGT5SmCSsVY4ofzgz2rLxAZJTPK4ZXcaQlhGQavmKJdZGzBEl4cj/nr8d6r
         vQNC1ZAfNqTeU/AUi9w3j2j942MBNchZY3JtFRKYDWyO28EG8kiYkOXX2l93IFnSjjbT
         CcTR3d3SNWFauFJH/l2eM/eN2+TURkJmyztAVr7HTRAoW3x9c8CZSel5rpHUt20EPNL+
         yzmQ==
X-Forwarded-Encrypted: i=1; AL+hErHhn4lXO/70SlGR4hXRQ352+gEXnCRbIG28KNpSSAmNSIC9i4OwWIZv5bH0CMqMH5NeLFtwAnQ+J/AI@vger.kernel.org
X-Gm-Message-State: APuU4Z9hu+izmVgSTs5FxAoIexVcMl0j9t8UzZ1KyQ9O4wwXO3EzHVv3
	fmxWq+Tso3NYT2o1hno9qNdZLQwpOVJDaVQpga37GQ8XZqlkuJMcYEVCAo6XQow9gkvZPZizdgB
	3/4MbKkthosAnBTdQDf8RpiW4jPzvBmilblVipIzzCbxMJmXlAGdI/iC1QSyu2WJr
X-Gm-Gg: AZFdTZfpdYvK/XY6BKc1mTqvtzRLRC/LscgYO/MQerOwJDGtJJoF1RHhTwatQLJrAZl
	WyPrOGY9xTJxwX99Nmv7uruEj9KT4L5nL1yXxLR4Q3oO8pbskSVq234q19FyHhv3mWTLUAHYtoi
	hER2HPvNo+Vru1/BQyUSZsxcs+82pFDOcC8+llRDVAfQ5ehfzBoXbIFTW1jCgcsb6NhiQ0JLKwv
	lUT3Js4arXGes2xpIIzsqxsK0FIZEzohA9xIVHy3WEdLzLyRhDNo7igq/DclwpkP6w/CxE9LyM5
	q/fqo7VoPFjz4sb2Us5qrU5iXFHssLa9ggFk4IfrLaDn33NsCz884Jc8uY6vhf/y8QuB/31zqmQ
	jUYHCnho7BXMtLeO4W0q4dTMNPh+iGkTxfWv9o61LXhIdaeGRi3t/h0ICLNmY1geQr+fbTG1FIG
	t6mYWpPf9ZIJlm6m3dSVHSWcKzJd9zi9kxSEaTbV4PPr3BKu5DVXskpwg/
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr14536974c88.40.1795517710415;
        Tue, 24 Nov 2026 02:55:10 -0800 (PST)
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr14536943c88.40.1795517709757;
        Tue, 24 Nov 2026 02:55:09 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm38075275c88.6.2026.11.24.02.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:09 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: spi: Add compatible for Qualcomm Seca SoC
Date: Tue, 24 Nov 2026 16:25:03 +0530
Message-ID: <358f1284a656582ef0ea0e2b7bc07224372f9fdf.1795517702.git.yadu.mg@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056d0f cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3ry+vzCAkyKy
 TpYeH0XPOf5ESwgX2haiqvEBQe2KrTmMLSRcunhqDeL0Tv5B/9koBR2SI1yfQ7ndiGGzz6Pm0GR
 HRjZm12PmlGzlKYKPGOgXz1AadfNN51IVRMdQoq+MbcXdVZV49kUmbTZulA4EGeaS5eOJ56FlYZ
 FjsGOm3XpzpOiXECsOgduh9C4b+8+xMfLp5ZUUSgSrJTFc9n7ug61NKrWR04bFqs+XoCpRtyaZ0
 iMniVMr5/OhxByC8QCDfBm7UaWtNQoth2jWMzAEusc6qeWZVWfNBIMKv4yGHIHicUW3FJ0vHQj7
 as89OW97T3qa7D/sGjFZHi2bCaDEU51oGNdgJI/B1zzHd82XKmh40vkhb33v2anS/kUUrLm3iil
 i0xxLj+5LOLvat9rKrVa5tsFI5LYJ//XeN6bKGj9Xwt6rRHb/CJ33Z2eYZKOALJiOXuW0lQBA5U
 h3r9/HXCTOSY4x0beFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX28KAM3zbuMU3
 E/G4Ait+f2n8ptgQvqDckkf+2oHSOWNvaT4Js6eRiWz3jDsnPVzs5RLikMhU3BFZkCwhxX6YXn7
 S7M+hZ5pQYWtrl6lJGSA5IhbIYHinl8=
X-Proofpoint-ORIG-GUID: NClwD0QmmrtTMAmqtKXZ7Qr5vU6GDQR1
X-Proofpoint-GUID: NClwD0QmmrtTMAmqtKXZ7Qr5vU6GDQR1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document QUP GENI SPI controller on Qualcomm Seca SoC which is
compatible with the SA8255P controller.

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
 .../devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
index 33eddb395a0a..7eb8b02253f1 100644
--- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-spi
           - const: qcom,sa8255p-geni-spi
+      - items:
+          - const: qcom,secaau-geni-spi
+          - const: qcom,sa8255p-geni-spi
 
   reg:
     maxItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

