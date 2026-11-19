Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081672;
	b=QQjdb8vFECpLhs7UXw2YyhvwE4mghBHxkPE0zw3d96qZVstDnKya0APACy3cuLcao1H/
	 4lXyNw9+MDmTr3eZoOBeXLS7POtKmwmZoFFFMt3kHupXLuqroC6W/ssPJ4I/jEp3A0xh4
	 pDzMHX/xOzkWpsHpE7iEKykfNJ6C2JFqPAKl04opgA+J6fi9r7Q2Dpd+B+g3kCJy26loI
	 O75n+ViG7X3/x0Eg5XeLBXrIbaGqMabFSPYt8yL4D0mwTOWqx/dH5Gz56fuxKxg38wiLZ
	 Cg8acYRLdjzY0zEQ9zSD+B7Fb5Ep1rNyKdAha0fh7GVl00wjyouF4AFYVfCTjQZ0pbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YDKM0GnslWm0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=;
	b=lvtGMD4YKMYsqoqsxd+FkCcjv9YXUIrMramjJ5K9mlTYqWyv3B1hFF7Pv3QelgXy31fd
	 Q5VRZ1etx2M6wfRWSZX4x9YxOL7DVLzaGTQWiOnt/VI55eVfDLGrqmWJZD1ECx4h+aBV0
	 AFVhNQhXHUM2qsy74XFERn7yCahFpjUnypdIe3o048jLHk0m0RUbbErInvozznYW3yiTH
	 PFGWn41qqDGiAaikuSixa/hlNWvFR9/0lO1qdC0eJgXB93VMDVGRbJI3vYiMJS0gbtBB9
	 cT1Qjs0Asuv2oqnGKNdFxbXeQdwNTqCRuWS8JActgNDVp4rhootF5gGi8gkQ3uq9gyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3PmX1VL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDPh9ozt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DEA60A382D
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31DEA60A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3PmX1VL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDPh9ozt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vFxS1681175
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YDKM0GnslWm
	0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=; b=O3PmX1VLnG968TtC1UlacMdd5Ag
	pC639/lanCDVFCRDPi5IxEe196AXpb5p9LbHGaTd1C7PAFXv7STeKPw2jAL3LMYE
	gxITqjGqC+gzlXc8i/MvTAmCsMcyLJ8HLRriGIk/M/+7dtcVcdjhzjkvyDZWmtJO
	oyMScC0eXhwBGSCm4g8L7pfyzzVbo1KXtWGfvR++ORuRvQtnXwchZHPeI+kFhMBL
	J6n1HvfSzCDIDuDEzkqQ9XRWgf2QFTQuq1f+Ujl3VFHEp86LKspiInDANeFe8jkH
	dOgIqFBjoPNFpnFjA0YrA1mAHj3axF6iyB6aSBeyPN9yYMzmQqNBB89Yscw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdct5kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:47:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-921232005c0so12697696d6.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 01:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795081669; x=1795686469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDKM0GnslWm0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=;
        b=BDPh9ozthZntHDMe5PrqBFBcWLQz0Yl0s7GnxzhY9wEFId7J62z+2MPv/k8UE8r1kA
         QVBzmNszFcxpVyAQKZHqtD5EFKXy38+j8OrZzU4wkvDkVhFjnsfsfbuX/KHHYh+IHpVV
         PM3MdShy9aUYGlwqpef052WJcrOZUWEppE249aafxUJnQylNpddk44BIHx/f1OMCPmdd
         QSBt1Sn/MvmCU0PiinKjXmJx6TWl3EKrKuAfKe2raLarLtgCNfaJF+uzDIuRqQZ00Uhj
         tvB+E8no+FetzXp9qDjmnAA9yqcIZbqFB0+5XGk1ziD9MFW8kt74N+zLf4fN8kcvtksp
         4DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081669; x=1795686469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YDKM0GnslWm0swyMpWGTkx9eij2uqm5Ft78sdozYTFg=;
        b=nNQP9QDeP8evBEnflrGJSGM4EuC+oKNMJKUuGeUMD3Ytkc2AGDPaMLKXUn6PomQv+u
         Smp3IWaTocKM1Y1yaj7OQqcqqXOLZV9DdWB3r0xXmopHg90KAa9+eH9iiNpmxIwm6y+E
         GDgsY/biGtehSSMmBHU+D8zSRoGKN44/tVLC5MAKN7Wx3MKlZb1Icj5aOHgUyfGNlHah
         3TGNZ30AI2889towGikGDMjQUQ3ysBrsfo5q1GJnTYDAXzVTJHQbZEzm5sLyjt7nFxio
         q4bAzSzWLe/x+8dAXDLhnletxuQrzUFLiCDBUX5iDXS7SMZnfnUEe/RBCGbzHTZ/Rd5J
         dOeg==
X-Forwarded-Encrypted: i=1; AL+hErH0huQgAzvWJBBdq98Gq4tsPzU6zFdDYkOwTA1Sr1JU+IL6YK034TpWchKDeOBusf+GARSDVQ+/RRRB@vger.kernel.org
X-Gm-Message-State: APuU4Z8tSsoa71Ol1xZKF5wfnW9lgXGcm+iQSKCwHjtq1FjpnXgDhyvm
	tW8vDzAX9CND6Gis9hSKAtrO3pDxYyzeNuT75WAe/fmILNBsrcbJ5BHklr4TV96I1YskmhAz4dU
	Zrd4kNGS3plQCqdJUoTGJB21MSSCTerrF0RIRPVrBZCUYLTGMZ7zN9dyOBOKya8Wu
X-Gm-Gg: AYBFou0p8pBD7/Tdq24Pdg29NMduRQHdDVlxLeRUE1N+OADpj2UzpspsxcJGyM/5mIW
	e18qDhxYmOLmmOtW0IbCziINkll3iX9X4Wb4xBY8CXeX/VuLW0piLcB6mbV8uyfGsZvLAy4m7zp
	Xh2oGhXHvOV10UUyCM4CbsbYsp7iQI3OzySnvFxi7DtRw08hXu2vbq/ubM128AmctzceP7vxtMp
	w/31MU8kJ9s0vleZoR+0tkAf5oKr2MtUHzZewzWLk8FIlKXm8lPPeEX0FdZz8/CpZsU1olqoxpN
	dDgMOD6zPOgHBeCbmUOfGptHcDxTI5ZcAbTK+E9NQSjfSc//gvXpOYjXVKs3K0KOIpTggfP+bsz
	GTsK9bSrTpQKSV+0lUkerfuzqGxVgZrm9ZNhRUw3eSXMXQzYYYvSf0zMvOL3rhLlcScKpWziFp7
	/p
X-Received: by 2002:a05:620a:6f0a:b0:93b:c58c:d3be with SMTP id af79cd13be357-949995ab389mr889381085a.37.1795081669331;
        Thu, 19 Nov 2026 01:47:49 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:93b:c58c:d3be with SMTP id af79cd13be357-949995ab389mr889379385a.37.1795081668831;
        Thu, 19 Nov 2026 01:47:48 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d162:32b4:dec2:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c1145esm9652992f8f.52.2026.11.19.01.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:48 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, rafael@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 11/12] dt-bindings: thermal: Describe multi-source zone aggregation
Date: Thu, 19 Nov 2026 10:46:53 +0100
Message-ID: <20261119094706.3439040-12-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
References: <20261119094706.3439040-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: osu4iK6l-xoQOoOCuz3sVVNnjb7cx0Cv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX3eCdMemBQOq5
 aVocfrb1zrb542DGCwFZSTZtfr7zIMqOnP5LyFZpFfxZPsJ8BH51CTx0pdWtbubuoTi8OnJQmFy
 +QlX1FtLHFeqklOnGA6gbD46iWtZKFs=
X-Proofpoint-GUID: osu4iK6l-xoQOoOCuz3sVVNnjb7cx0Cv
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afec5c5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=MW378T3nY0SQNsI_83wA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzOCBTYWx0ZWRfX1xTpm9BIhGbf
 TX91/Mu0np4b13nivC6HhEIQrl3OfK7vdIuhv0USHntwRxAgBpZfZyArzaAFolsti2BSJLlhVYP
 cxWY40+NG7EvaaQThHJNreVLY3W2GmUIBIQIPGQJDWFNhJ+iKrril6mVd61MPFiNi4maRFBozdi
 GEgdAm2KzOqJNk/onzlNN2xNRDrem5T7Rtt5GNWApE+F0oGIo5QzdqK7ZQSDyVKdZSMtvhet9se
 5tG2e+UMmBMPVeNDDKS0IOf8CwIDeaFNX4ZhmAQjJUHHCndXCF+EmtGPq5Dv4K7Kv+WVLJN4uba
 W4mZ2tO+2SS71licwjRJHru1rYUYGKOx+BQEYYddMRmt1e5c0MRIGk1+80Hf1QQf1malRFwCuNZ
 Vv4saluRJpDpFfqdcRV3nnAblpS4S9crfwiiwLmLasrwuq1g2hs/+/yMruJkwx7giJ+7oUCXcdX
 bPuPLuLt2nx+FClMufw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190038

Allow multiple hardware thermal sensor references and associate supplied
coefficients positionally with those references. Use signed cells to
represent existing negative calibration values and aggregate offsets.

Document approximate averaging when multi-source coefficients are absent,
with unity gain for one source. Explicit multi-source multipliers retain
the unscaled affine interpretation and are not normalized. Require
nonzero explicit multipliers to distinguish supplied values from the
core initializer default request.

Preserve existing single-source sensor-specific slope and offset
interpretations, including zero values and driver-specific scaling.
Add examples of averaging and explicit signed multi-source combinations.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/thermal/thermal-zones.yaml       | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 72e419124f98..10cf1fb8cb9a 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -95,10 +95,13 @@ patternProperties:
 
       thermal-sensors:
         $ref: /schemas/types.yaml#/definitions/phandle-array
-        maxItems: 1
-        description:
-          The thermal sensor phandle and sensor specifier used to monitor this
-          thermal zone.
+        description: |
+          A list of hardware thermal sensor provider phandles and sensor
+          specifiers used to monitor this thermal zone. Each entry uses the
+          number of specifier cells defined by its provider's
+          #thermal-sensor-cells. Multiple entries describe an aggregation of
+          the corresponding source zone temperatures. Thermal zone nodes are
+          not referenced by this property.
 
       coefficients:
         $ref: /schemas/types.yaml#/definitions/int32-array
@@ -110,9 +113,23 @@ patternProperties:
             z = c0 * x0 + c1 * x1 + ... + c(n-1) * x(n-1) + cn
           where c0, c1, .., cn are the coefficients.
 
-          Coefficients default to 1 in case this property is not specified. The
-          coefficients are ordered and are matched with sensors by means of the
-          sensor ID. Additional coefficients are interpreted as constant offset.
+          For multiple sources, the first n coefficients correspond to entries
+          in thermal-sensors in list order, not to provider-specific sensor IDs.
+          Supply all n multipliers, optionally followed by the constant offset
+          in millicelsius. Multipliers are signed nonzero unscaled integers;
+          there is no implicit divisor or normalization for supplied values.
+          An omitted offset is zero.
+
+          When coefficients are absent for a multi-source zone, the temperature
+          is the approximate arithmetic mean of the source zone temperatures.
+          Contributions are distributed as evenly as possible in source order
+          with a total gain of one. A single source consequently has a default
+          multiplier of one.
+
+          Existing single-source hardware zones retain their sensor-specific
+          slope and offset calibration interpretation, including signed or zero
+          values and any sensor-specific scaling. Their default slope is one
+          and default offset is zero.
 
       sustainable-power:
         $ref: /schemas/types.yaml#/definitions/uint32
@@ -339,6 +356,21 @@ examples:
 
             /* ... */
 
+            // With no coefficients, use approximately equal contributions.
+            skin-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+                    thermal-sensors = <&tsens0 1>, <&tsens0 5>;
+            };
+
+            // Explicit multipliers are not normalized: board = 2*T0 - T1 - 1000.
+            board-thermal {
+                    polling-delay-passive = <250>;
+                    polling-delay = <1000>;
+                    thermal-sensors = <&tsens0 1>, <&tsens0 5>;
+                    coefficients = <2 (-1) (-1000)>;
+            };
+
             gpu-top-thermal {
                     polling-delay-passive = <250>;
                     polling-delay = <1000>;
-- 
2.43.0

