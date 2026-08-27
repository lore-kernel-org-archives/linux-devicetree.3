Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2350415F39
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846913; cv=none; b=Oq/US8SjiLiXZEf92RP8aYsyNM14lVOe/ULPED9DF4DJxK9azDSEW86iD1CKp2dOTD28OvMCqt2ES/6MIyK2y1J/V4AmWf7dHKAWFXFFDEXiwa1HiE2TACEB16wmbVLatTZKwOuHlQe7Y3O548IZ29fqaf2R2OYaFD/78kvPfu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846913; c=relaxed/simple;
	bh=Ro1Tw7bimijLX+zSbVZzcIcnTuF4NWioN9yBfIv7fvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPXiDUpGtsHY7MYGX23yEAK/Gd7PZZC6IAX7+XU5FNuNbqVXwAzRbEf773FihfGPelEmw7JfeyLrSRWDS54iKCN9QCIUUxlzRmYVY5KLSg8uXtSJDpjoABpDyqE7bKgXPxgxgs4EQutjvpBNlzY8Y9eYAqnIOx+2FSCJNL7B3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c2BXcxZ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YwnJeKO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c2BXcxZ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YwnJeKO2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbetX865924
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=szEkNwgY771
	Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=; b=c2BXcxZ5dH6V7p/j2Ymmx/kbwuk
	5ypm5J+Gy/Xe/Rzmh16ripn5C4xaaNvcWhKVxilUrwSyL8ZaX1EONIWOJxKjHI6C
	9r8+zMkdIft7vyYF67XPAqAb/fze38RxCGxangfO7+n4KFZc/us+ZyuwC1j8Pr3q
	nXuWhE9t3ykQ9oKvWijc/LsP+z+xEZF0jnxEn6d6IoUsbP/bqvHFOuCzr7iOGEzf
	VCs/kF+aS58KXOsQVJPfBiAwXVM6ag2XRg296GLNCNw+hk8XAYYcFSzNfjV+8JVZ
	KwOz7DPYZ1w7iq4y7PTnCS311Urm9TKF4Q9jj4hYpivdxTMopVBqWIF3hQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8m7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 16:08:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so138856a91.0
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787846910; x=1788451710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szEkNwgY771Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=;
        b=YwnJeKO2/tETm1YssmAf9TuooyWNueZxp1Euin/EvJkcr3V5Xs00frbqR/HUafhpsR
         eN+sfQu3vXfq3oDcqTmu5aKObZrHfsqjOLbWr2+fP+2ctrl9Q6EQfNI4bVW+9mwqo86u
         9KEnHqd3ndoKfKYaSfAUVR0ekjhqLxODL1hUGbwWCpu64rmILLLv9NHqQK9+DRfCXIml
         l/uBJ1mR6aXlfnxxf5NfGKq3epzIVB0nSp72EsyYQFNenrjr64mzNQZYYKMQESJ7qhhT
         mUJthEbCcqc5YlGie7Sm+IuA05xiMz9RCUJ7d/oAwdpFNpRgy9i4xuRhKA0YOqK2pK2n
         W2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846910; x=1788451710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szEkNwgY771Xv6m8T3J/mh1f/ayBeeTB35yTWk5lZdE=;
        b=EcfXFSQjy6UoXMyn8KQTAAdourFSfRbBuHfvaTAIn1t17PYkVMRbK10JdZAYOOGCMn
         tJ5cVX/lx5Sl/V8lrqyIIPUR1v6YyQlPhz2k7fab2+0qaZkHhJRU6e8SxzzNQDcA0m1l
         4fPP2+78B2I7+Z6W2PBbWB+pb4bmAsCyA3QsdlZ/n64uK1uh8pNoZtc26G9/x9hVBVZC
         tjbNTNBJ0iRgSnVTAOHL8MInDk9NHnLgkBNxcyCsvbFBvTgfZhiY8pmwq0SVNbAw/1ou
         ANYooPQbeBuKy32DQ5c/8NoRjf9iUnO8KTPfs2ol2xgQQAmpmP/0bFC24nsMjU5y/1vF
         vghQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9xzHw2cOjSQkj3UP3K9ZI5KbxgUF5Sy3Zb9gW1RbDI99hfZodIUEtFw7eVvz+WZb0MNqk/NtuHFvA@vger.kernel.org
X-Gm-Message-State: AFuF++mA8BJwIOxYG6gIl9r4CBPXDaHaHF1m2PfFvBVYFyOn1wUmfrtA
	0S0R9KbeOLwPr1UwuCMYdRS4yLCW+eBQkjTzpdwKwBq1x2JPLnWxQoadXKy8rNLzg4cUBkrXMhx
	Z7lx/x9sLKlduYHsU9P0s/wLs7UlzVpMF8xDdtk0QVFey1bPMhlhuoFHOEeyiUN5p
X-Gm-Gg: AR+sD124ab330eQGHVm6cM7GvLVJ7xEq8sJDViwtg3gc8/YmGhsLqAH2KIz4bRCpA6W
	u4hWsPGOhjP4lYPPbkzhdquCLi1JVQEv3J/3yOB9D7Kt70uDL/teAJi4uXZ+0UY/gBSLL8GwWtM
	mQwBjjOrMTvRa3mJ+W6ls+y913PDS30EBHr7LHr9HjpEvS06zVnzo1UoJX29J3yKzZ5af2YfGma
	WWyHoXZtGnV+O729VDBOKkv0UmKtuvdCUlKoMuavO6UPNKhQIuvXWMi/Ks5ZSvqo1Hje1ng4aXw
	y+8bkA8AfmTKfxCC8CXxFQc2f9e2VUG+VCw0dG7uBhMLPAEVGg4WuSYnPo0tZ1Ga0xJKkSlgMUl
	Xs6zs4awW0r5caMPFv3FhkwYY/jAYBK2VD/V55EUuXPN0qojEZ0pB9REmCNw=
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr634856a91.1.1787846910202;
        Thu, 27 Aug 2026 09:08:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3c47:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-396d0e27e11mr634645a91.1.1787846909524;
        Thu, 27 Aug 2026 09:08:29 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd9085sm3245892a91.12.2026.08.27.09.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:08:29 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: ebiggers@kernel.org, axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/11] dt-bindings: soc: qcom: add binding for qcom,crypto-virt
Date: Thu, 27 Aug 2026 09:07:13 -0700
Message-ID: <20260827160806.1295313-5-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: svCOByPS1PtqFsileowmZ3pYqo2kwQMa
X-Proofpoint-GUID: svCOByPS1PtqFsileowmZ3pYqo2kwQMa
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a9060ff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=S71HXAmslS2k5ljwlz8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX1KSyRM5QwFRB
 xAuWb/i5Lf7m2GG4kETk6OJpw0mDeKMyBwv1YmeTutXdEkNlhfImuFjSL2SDBIgigIudQj68L3B
 SSrhziIfYyw+jBt/7ujQwlOYylzb5ej0D0l0lGVZqgTvjaw8LNe3jSGCvtOrqNdXRHcPnj1gS0h
 /U9X5tBqr53S93pOxf/any4BvKO+eyJur1vtiimhKuW4RPAqOsLQUdYJm6bti0BtC3kZFZSO+UK
 HJP8VsWTrW8X3RQriELrtd1VyUEqYZVXMB3U6nNTFlWvpzgb7JDT9n4YQ5Gg30nk2NQ55Sy1AHE
 OKCggbzebbOTEO+kWPD6usAD1e0k/c5GxE8Lup5WMB/ViahbR9LMqr17F5MCDcAnWYxVJWGo8M5
 NvfCdNyVFNIXGQfcIrQFXsqS2guHQHPhXWZ+KxJsSw9SdfXI30aJtOt6O9O+57lT9oAzeNmfp4/
 83xWZiPUdSD7+aVkymA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEzNiBTYWx0ZWRfX+0qnbOisztd3
 rje3R2O3kkYg9TfYgFJWqjKOKja9x18Ngv5RPNf4mnv3X7JBIF+P9+YxDRRQ7pXwSSY8rMkmdsY
 5+6ZcrnEvxS6NDhKzFwVMiMkB8sVZ2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270136

From: linlzhan <linlin.zhang@oss.qualcomm.com>

Document the device tree binding for the Qualcomm GVM crypto-virt node,
which provides the wrapped-key buffer size needed by the QCOM_CRYPTO_VIRT
driver to perform hardware-wrapped-key SCM operations backing virtio_blk's
inline crypto layer.

The host does not report this size over virtio, so it is supplied via DT
through the optional qcom,wrapped-key-size property.

Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,crypto-virt.yaml   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
new file mode 100644
index 000000000000..5eb204f29762
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,crypto-virt.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,crypto-virt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM GVM Crypto Virt driver
+
+description: |
+  GVM-side hardware-wrapped-key SCM operations backing virtio_blk's inline
+  crypto layer. The host does not report a wrapped key size over virtio, so
+  it is provided here instead.
+
+maintainers:
+  - Linlin Zhang <linlin.zhang@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,crypto-virt
+
+  qcom,wrapped-key-size:
+    description: |
+      Size, in bytes, of the hardware-wrapped key generated/prepared/imported
+      via SCM calls.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    maximum: 128
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    crypto_virt {
+        compatible = "qcom,crypto-virt";
+        qcom,wrapped-key-size = <100>;
+    };
-- 
2.34.1

