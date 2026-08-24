Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C33B2D1A
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581580; cv=none; b=pygfQXao8tUKcZfdyjxXxGIZwfcwnKgnvaX57Hu3xPhTSA8eUJishumWofA2R/vEm0q/MftcGFjMQ0+v0CIeGA/3I5JRgOMI0ihSK1WG7uBbF5t92tqQtcHvc0/5x6RUrjGKvz4QcaNiPmWYh8jAw/aywrpaZ2S6sDpCdNEi4Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581580; c=relaxed/simple;
	bh=07fWoDKWlhLp+o+voMIwf61zTNZp2ZtvKXItlluoCmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZosFe5GZbVdqMXqQ3grhbBVGvmmtZFB2nJs8BvtMUAexSd/0ZQZyec4gHAafRKupgx8p+cy3mINqdqQSetde/xK2LJz9/mxtHb6PhTA9IwunrnC/qIOKgg2tXbppcV++f+bEkFRsaJIWmAyUvAe7JPsSiubkrxsJGFZpywB28rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPC3Zrek; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsW4F1I9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPC3Zrek";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsW4F1I9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OD9I1V3102844
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SY8+egivx5hMX+E10IaKzHuFd6+P6fa7OvrZXy9RXk4=; b=IPC3ZrekBD71qPf+
	T+Vwn0+FgmJ/OCYOiMc/BpIumdrPFNwEr8Q8ij5FoDdaIH1ozRW1/pnHQBdQOHvW
	FKKvnYCBrkZvByRoYUGq+46/MMoUjOxAMLXfEvGdOQiBUpXtNIfeVkRa3Y5cidz3
	LMlnzXvxPcxg3pGcFhcmC5NAtu02T+iaMjlG+1xB9qtq/kuoB5ZN2FLf6jgSUn9s
	zNTsgwkkPZzmPrH53NmLu+0Jy91N3vEpAC+fkoabHW3amh6uxC1bwkxaV4J/CV5D
	02QssjEQpxK+yQS5gbsbJ4mtPx+vfmTPk2KLY8FIiA2mVHUVqnLPhpRbc5bUXrFn
	Yjlbnw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdga1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 14:26:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6c166bafcso14172325ad.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581577; x=1788186377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SY8+egivx5hMX+E10IaKzHuFd6+P6fa7OvrZXy9RXk4=;
        b=PsW4F1I9MZx4HyUMKuV+dqk1vfhg5SZSQZ2uyfoX0VA9Mup1+HBXaEl4wZVch+dr3Z
         s5l1JV9WnsAd6bribAoXk+un7qUYvd+r8HtfrFfzg3lqXJexGW4OFS99WByb9DSUUZZ4
         LumOYTaPOuj7WgBqf3N3vAR8AN6hSPy1hZ5sbFqFu/bCJqqRtlzuzGhp1l2ZaARI/Rbp
         Iufm4srtYM77ScGpWRfRFN5RvlMdaUWgZtMppf+G0uwij81dya0dllFRhaS/0YVzWutn
         D1qRN9tA5wo9lKfMZLjhR6agP4g9OSWDn/0AoXozO28g8Dr2Q6uGmZZFSEGGQwkuxKVH
         p0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581577; x=1788186377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SY8+egivx5hMX+E10IaKzHuFd6+P6fa7OvrZXy9RXk4=;
        b=RSce2Oflkr530Y05mtgR9e9lp8nKgRrTjckC6Ue7sOeD7f5A7vLLv4g3HKpPZUhBtf
         0+7KxstwvwaeWKLBxuaDONDrITpqSNxZ/D5n6oFqTfpFa4pNd4M6rej78znHK0ZVtY75
         DP4RKW6yA2nO5QF9tQzBx6magKZhN7i2NKbAju37NgGxIIJaFAzHXJgASFp/JU5FOSZv
         v5ID236zHQYtjuSVbBRF47nxHqr+haSmWzcb5GILTXCWYowjAKM6fF0sOBok2rJj1mUi
         OeNElDa2ioe5J78Suo3T+XnomRo8g9Kqcn8Te2u+VBXK02IaVd91w0TvHW22TCRHe0L8
         J27g==
X-Forwarded-Encrypted: i=1; AHgh+Rql/hULDE2cJjGh8OGBVd4HcSm0+LQr2oEMIPJq2R/78ORTkpQvvvF1WxjxIJPSh5U2RileVhKdS54b@vger.kernel.org
X-Gm-Message-State: AFuF++kZ3p25bJ/9pAxNh5UKgDGGKqWqASAPPC6pyaodAqoGFqvxasnv
	YY0UOoUi1VvHktoNJvw2snijp/dXpD6eWfre83uKQzqWJAsYEDtYDEd+8xpzu4ud+DqSGq4vdX9
	iymecZMGGJaTWR+E/CBzugISCLb9yWVxAwfFU6L+tLBxPTJaz7U2i8Y6ykifNVfTW
X-Gm-Gg: AR+sD12UcgDV+kfVjDPt4wfHDyeMW1jNTbajpzPsXLCjvt0pE+85+ngOQjGwZX5Qmx1
	1kmdkRRSfaHzMlo4FhCs9kv4kXTeS62aFGfxVZ+7dUYIu5M6RQofDpq196aT7q0DyZwQ9PM7Pyz
	7NYSnTtqoPILLrb/P+hPC68SCdtmAKYMKB1NVt7xDzJeSDQy4BgEhNgmDDIaLNlMMhHQfV9TgLY
	DEGnHLPiW91rCHdfnDfA4oKX8O3UWaQtgGoalrPF54m3hI1Yq4WG+QDcTR7Bs7R2QuKgdB3FOXg
	TVd/3Hi6tcHhUWT27RhsXkuVgkHY5fp9iaHkBeRnwcArcPMUAupKkAVJS0KE6ImxUluKU8bI60Q
	jWn7SsQr5hjHOmNM9heEej7BmhJbpggpRrg==
X-Received: by 2002:a17:903:1670:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d670b61a51mr341735665ad.3.1787581576888;
        Mon, 24 Aug 2026 07:26:16 -0700 (PDT)
X-Received: by 2002:a17:903:1670:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d670b61a51mr341734425ad.3.1787581576307;
        Mon, 24 Aug 2026 07:26:16 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761fbcsm18523275ad.4.2026.08.24.07.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:26:16 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:55:59 +0530
Subject: [PATCH v4 1/2] spi: dt-bindings: Document ready-gpios property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-1-fde2ebf043db@oss.qualcomm.com>
References: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
In-Reply-To: <20260824-use_gpio_to_notify_master_of_spi_target_activity-v4-0-fde2ebf043db@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787581567; l=2206;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=07fWoDKWlhLp+o+voMIwf61zTNZp2ZtvKXItlluoCmk=;
 b=j/qELHbdgK66Sh9pwZDF8rqgN9s6kBB+zMziKi6AIGAwHmMhn+hwXfK/chaNvH2eN+VUcb8KU
 vfUNcn6KoxtBmKO43KNQynaJFvmZGBa7MG2ElOPalofb8/JOlqSIDtv
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX5zGjui+fh2QC
 FUGrjAN5FuMKXHEWdWRgZHJHnIBIYX/1Nu0j5EfNnVhJ0t8Sb2tpjGVwxM3GbiiifRJz+dACIsX
 fBLjL4uDz3jnzvDs8Cx3FWjAl4DtvH8=
X-Proofpoint-ORIG-GUID: Hv2skj4oyM6YSd6qOEuEbRjTfSW_RyL0
X-Proofpoint-GUID: Hv2skj4oyM6YSd6qOEuEbRjTfSW_RyL0
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8c5489 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=esOR2qCunaKGNcCvXUQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMSBTYWx0ZWRfX4+4eQ/kX9/qL
 asfLWgQYVP6mHaiLqpzWRf9ebDsn3i6gSm3b3bNF85qWM8xQz6SaO9U/aaKejSlHcsocdBQn8gD
 3Lpj/vyXX5IxXRIf914iyrshnHu5zvi8RHrNJUJLtIpKlIjIzwQfsCi5ZgkO6Ivvi/qJugtjXdC
 QkPUf9l2591kkyI0JA5M9DrRfMGXP3/XBBKmJTVYZqgcUUKApDih46jgPg6g3jJGnF/dNoRmX0B
 xKW2cXrnxl6+1GXK5wqndv932g1Z6fXUvANV2RZFlO+e+ytHI4TPYiQqT9TFeKZ/iTtOEF+myml
 r7+9Zv7cSEGpbsQxqP24UuEQhtwHvWcRxwQKCdXauYlsq2tvm6NjXTNKFYF9myX994mYAur6GZB
 vpWp7Pdj2d4B0J3spgiapAiu+J4+czoFS2WzAEPHMzGdhvzh2RiUXyAiCAJIYkLjefirn0oTsa9
 7Khv/AopqrbE4a+JDRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240121

When operating in SPI target (slave) mode, the GENI SPI controller can
use an external GPIO to notify the SPI master about the target's
active state.

Document the optional ready-gpios property for the qcom,spi-geni-qcom
and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml | 9 +++++++++
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml    | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
index 6552303a4f52..33eddb395a0a 100644
--- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -39,6 +39,12 @@ properties:
       - const: power
       - const: perf
 
+  ready-gpios:
+    description:
+      GPIO used by the SPI target to notify the SPI master when it is
+      ready to service a transfer. Only applicable in target (slave) mode.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -46,6 +52,9 @@ required:
   - power-domains
   - power-domain-names
 
+dependencies:
+  ready-gpios: [ spi-slave ]
+
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
 
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..8d1c78701657 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -67,6 +67,12 @@ properties:
   reg:
     maxItems: 1
 
+  ready-gpios:
+    description:
+      GPIO used by the SPI target to notify the SPI master when it is
+      ready to service a transfer. Only applicable in target (slave) mode.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
@@ -74,6 +80,9 @@ required:
   - interrupts
   - reg
 
+dependencies:
+  ready-gpios: [ spi-slave ]
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

