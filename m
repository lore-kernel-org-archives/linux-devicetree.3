Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218860;
	b=Koy7tjFaD1ZgwfLD3RbJERKnwxiVPz3X+SrLglCLdphxNUELvB9caCv0I5NAVTHtvSjI
	 JZ76aKcmPTNVRrjDs2jx8aoWr4/Ae96wVOziuuR1OabDFOx5zADVX4prXukByuvWm0Hu2
	 Yf4bm4ytYA+G353AAzpO//9Gqtg46/N5w3q+8GRfB2lRdPcjZgA3j8sLeOL3CJZwekx1C
	 XmHeVLvq3fr4mEFn+lgKMqkFO9OqGTy3lTQrKKwIRkDcj9Iri8T1DQB0W+HkEwqwS3e2x
	 IL+eE9dP9MHNwNgc9Tgf3LV9ClLSiB8sXvhyR3cVB+txMz4W+YF4q1RBAe7giHa3wyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
	b=XTPZEIO0C+Z9k/gEjYwZTEy4F51aQV8/Gf0znYIm0OXXopAh3pvgdGD8zOPtoe/PocY+
	 4kvoNbBBN2rjjqzbnY2XLtAES/8X9aIm2BSU31WNaC2DPKuCaVv/8ncV5U5Kp3AxlyGVQ
	 INbSElpn0pU8keK3IEsOg/iIXbP5rHQvJ87pOfVDRC5NCa2pMWjwxNctYKQnfC2KCyI2c
	 EK0ct+VDHObxM9DWN84g4/Wr7tnI9WvoT0RNMJxJxCdj4tPuQfCn75B4nK4nkHl4TEmV5
	 dAPNjbt2Gp1sKGa13u06M0DFw953GhvQcW6h1aYtcrfKLhvX3gGVHPNPariYuouVL2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEKGak7E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52531606D80B
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52531606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEKGak7E
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99unH03600469
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 10:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=; b=BpxvYk38WwQFit5t
	MFSedYMf+M6QN4cY9tsRoTLUuEXXXias5NIYNgQDZSK4bjL9AGt9QMCGHJtab3tT
	kKWv7cFCV5TNdR0TcWWXQSUW3skkYk44cvXZAb0116+e5u1BNU4CENqYahNCZ2ji
	cUKyDGbgikgxNQ0kIsK2o4/cZf/KExK8EdAZjI9V5TgoMBv2Y5BvkEP0lQvaT5Ic
	ZdcVD4VVLybnO1Jp7a6gm0zL3lOQ7hvAD/AAVb3B/SD5cqBfImo61qjJv8k8ZzMv
	qmAKRsKYbSP3/zQejqt9G8pc4vkwDLpHIc6h2rUKD+ndJqJA5ZGplkMvz6Sj8Yy3
	X2x+Lw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588fpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 10:07:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1166938a91.2
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218858; x=1794823658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=PEKGak7E15b7Wq9s0ogKhdVyAbs2rNjvAA+IHClrl7uUbKJAeSMkqbHMHvn9M1L2K1
         ogHFj/W7dwTBOPZ3+Ow9XViTyhexsyA+lY12+duWrYrqPWo7NupWZg0MQP+/FOSzacQm
         5DrKdb9CRAuVqS6U7j9brrV29aaaZ9wBIqAnuPddlYOnO5cIBi1Y9usMRDRWOQgOgBDC
         LOZn0EWKYDc3DDBq6YjPkm4JctiKN9kI1Woeg6TR2akezRXACHHRBtCEsH3Jg7W01HL8
         zvhi7AHTIlmkt/lodrH3/vFdbTSv/EcUz/PgeWozWbmXFwpf33bExAe4jfEZKFHI+2jt
         V8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218858; x=1794823658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=oPRXU7oC8zACP8PggmHYxi+8LvF9lU24Gzs+LgYE+xrM3ZsTqxPHczg5GtbULNnspV
         FA8ic5NaDB3wG2SrtfojkXMARVLjSzzI9K1Eh4RxN/pzhEdkb8E3z6ERoiMe3v16S2O0
         frpLKzwjABZcwRehQYbXvQRkDhyBdTwp+4+Ct5ZpsLTGHj3lDPqzDmNZK60C8LyONKWY
         kojuXqN/OJKQE7GRF4VNjsVmHMPuW6aX/sO8tDDR2cV6BMxTuRemB1VyJ1HyX1HwxX2b
         Fi4OdTOmbBHPqcaYi/e8VZxsIe06hv0hwygRRW3LebgMutzpfY3bKoXp6D6HVjEmTHIb
         3kAg==
X-Forwarded-Encrypted: i=1; AL+hErET6YeLSbD6v7T9HWF8Rj6pIIXkNVGd3y6MPDHHktLWYHeVDdCSyMFfsGJQT13kXByqhqDshWj0ijBH@vger.kernel.org
X-Gm-Message-State: APuU4Z+UBHDgI2w9jej59vfwY+dJxjMHURqDpwK1Fzy4fxxpPv7hGFAj
	Pha4gKc8mYDNMpjMJIkyacxNND2tDvOUjJgylvnvwLyFGyUZfuXCNVdDRILlfAZgDzYklYXDC6K
	BqRHMHTuT9raMvq2o0U7DBv3832nJG3fWRr/Mi1pq6gQzpp8vBoWpAZbDLa05JF29
X-Gm-Gg: AYBFou3redgrrWLMFZ9CPXe0N2zqHfsGMOb9eCj+ri1/rx7SBw0GPsPMIN0dZjoKO9n
	Ov68EL5K9tNXHtOsHG2WylS7jDw2fVVfprpQALBvXNZpr06ZUwc7razzgekfdCDYWG+iHXpTtES
	nxt76Dz2LMYiYNMsdXhJEmYJtjX3yM5VZDvVBKUUP8tvBIo/qPl8TeT1t0tnpR0GDh3mNd1VX8l
	/bWiYhCIyP95Grd4Z9pcDmSV4KW/9G1ejCKe8zfVMmzzBjM1bhUZfRvh+NNZUVvw2D1NC8BP25d
	RNsGlbnmIr1JGJWNiKTCsQ2AEoaSsbGLdTvJkhRsTmGdEKt0rLcMXFQD8rvYpwT5ovGPoQ6JTbS
	jnGnlzAcI96u2IDvCZ3L7fdg1DNFd5+I8vqLfhzggHk9xK5aNdrSETiAQ7IeiyVV9ieL3ZIM4Ws
	CFN03p9Mr7KJRl8PpdEAwE0Qllrzn/
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421391a91.36.1794218857988;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421362a91.36.1794218857503;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:36 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:35 +0800
Subject: [PATCH v5 3/7] dt-bindings: arm: Add MPAM MSC binding
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-3-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218816; l=3700;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=e/4WBMxVgry2cHgimqp2+MIUEtdd8lkn+3G7LQuRoRM=;
 b=f7oXCWEU+g/ZNdVHeD/l8+NR/IDH0Sl7swroTY77eRl2qzAAyGazVFI9LO/ffeLo635HtNwpP
 bhjjbeLvUOUB7vajoa9VGVl80HYysz7epaRiuR2ArhXChsm7QQ/KZhH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX5gCM05/dWpY1
 ddJTCUSRedTSLOB5pwdjvsQAa2+Q36DOe30mJO3CFJWFd2pLfZ9HAKdosZhyzv0jZr6cwHsFYNd
 jY8kFlR7FlciqpQNGYv5qIS9oRRzYV87rafS8ZH7x+cplnXIKEJEDY2EDmOQh5c3js0+hj40WNh
 riLdsINd3Friw6IK9wEPFPvdblkKh31AvieXyELrVhVioi0dW2UJIaL1L+DkUqA87XPSt4ng5l1
 TmbiYGAqyy3U9KG66qqjaZoa4vAVL9XtT32kVX6pFcfIGmjeB/7OmIdt8JyoDm7D3XElJNdgPTb
 ETmRy5OWFORA/YO8FitPcBLFd0p9pwrH/jnZgJv4wAS4uVTYWGwNyTC3+Aey/Q3Lhv6EEUh4rmm
 ipnVPi2dJqCDPXL/3IuSjMWSxlEJuky6bFDswq9wVOGye/uRViq6BSi2qM1XnjMGL7mVmPcNA94
 lyqQam1C8W2qm8hfGXQ==
X-Proofpoint-ORIG-GUID: ql1OlEwnFHDkdhLon0k84J3z1FRgAdqa
X-Proofpoint-GUID: ql1OlEwnFHDkdhLon0k84J3z1FRgAdqa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX72+gj4woFc2M
 QBjBf2bxyVKZiAYIL50Q7Oth3+YTxaY0xn12JnlT3SeHbBEM1EB/epOA+MQ+ri4LiFSZlEZpCbU
 YFu1NiOJaIZoyoTL2R+cQgpZOQjj2ok=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af19b6a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UiIo4169r_Lw2UoxLg4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will usually
be a sub-block of something else such as a memory controller or cache
controller. A memory-controller MSC may also stand on its own as a
top-level node, without being nested under a dedicated controller
node.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema
  field order and yamllint spacing; reduce to minimal binding covering
  only properties in current use, dropping RIS child nodes, the
  explicit arm,mpam-device phandle form, cpus and interrupt-names;
  replace the memory-controller example with a new top-level one,
  showing the MSC as a direct child of the root node ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..b52599b47a1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    oneOf:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    ddr_msc: msc@40000000 {
+        compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+        reg = <0x40000000 0x1000>;
+        arm,not-ready-us = <10>;
+    };
+
+...

-- 
2.34.1

