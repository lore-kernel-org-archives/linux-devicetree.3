Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A83CB2D4
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463605; cv=none; b=cYf6TpnoSCQcTOI1hZnMIWs5gyPidMBHaQE6Aq9uncpk/+G+mtUjoffaEAbUxmBrRr4Ms7txIfCWkOIUpxXitn/c1HKQVi844fxehSA8S4xfjLTDUpv+irNDsW5xLegGL8DTmry+9hKX41uI/h+wyjnUgdH4ffEC+l6ATsxvHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463605; c=relaxed/simple;
	bh=l+ekHsjdvOsh6sae7GA8C5DSKd0u8GmVxNxbacGaueY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mqe22axBcBNzOLTrbWCXrR2iA6qTmpEhGiJvkHpvf4mvaYn89uQuj4WcX/1N3GZpTVMg0UZikgPU/+PDjmNkqzuFBwQWNDIXJlqzKv4HtQNXpQKaN1mAwUloTdOqGYf6X0kspji3lMMKv6HoAugmZwJVEgINZ7kMkzk8t2JnZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yj0eTD2E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMruvLNE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj0eTD2E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMruvLNE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWvL3766908
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fCyXY68Xed4P1Om/zX71Lm5gbnJzBIFQPJ1AVc2MUvU=; b=Yj0eTD2EFe5L5aS1
	FAnbD88ODHUpUkUJnF3XmzEZ50UWZdkxN5DnCGE+gWjGO4gtkvQh75IsdnIWHJD3
	9W8mNBDtwjlPCaQLtik22ZmKhIQMI7X5YfCzC+M+0uLcD+lhszTFcHS3+HubNj32
	PR6cJZzZyAFwd6yFbWa25E2vQ22kqaCc+jj9/EmFq4pqs7kqfDri8hEMPcJX2FRD
	R69ksGPGx+kQf+UIkSOSAQuqF1XZtLPVOQaJhlb1iieeN8xS9D12WXC2RGnYpa98
	pmcPVC5zEa0VE1BqNvb8164QPwpZZ7VoucbSooFdk9j3svdlwCvTNJGnTu+Rrh+J
	7DhHHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q11bk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so18466a91.1
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463602; x=1787068402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fCyXY68Xed4P1Om/zX71Lm5gbnJzBIFQPJ1AVc2MUvU=;
        b=GMruvLNEibQk2DKwPkykhleGUPPjCs12E89ybwJZI6CuAbHrs4TSW1vJtdTInpesH6
         c2qb5R+xjj8kYEVju9YqzU7L0LypsXuifRKYiXBCA39plBm7aah0/IfLAn3YLVlUG0G8
         orkG2hKTu9nS9GOaGwDYyucW6rPBNhUWWKxiSLpvUPx61K0BjrlY8vHggsjEKu7i1bRZ
         nGkiu3suV0NoDxLhv2J4PeKgqFWPjstk23sq/k5AXyHu3lrKAmL6virmjVl7GJaJeOoi
         AZCk+biquwAMA2WljeG+/aw7h8CVdqodUZMKqQpjhrCRVnC671YBzSHNDg3iCciwWzP4
         useQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463602; x=1787068402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fCyXY68Xed4P1Om/zX71Lm5gbnJzBIFQPJ1AVc2MUvU=;
        b=IndmnAFo3nwbeIDq4QQ4jVZlqnzhOFW1cwyVzx/FMc9axj6tW5gnnEkNhp2R14zutx
         1aQCTXch2Va6JDIRJ0+olz7G1XWtSscLx+VAibIdPvulRote4HjqZer2c0ydlTPNsXWZ
         A7I1cERQgYHWDw/hKdhTP7untGxE3HhXCjO1/pbFfA0r5GkotHIzKq6A2ObUvZV3BNwT
         rn4A+Xsv+bcjfCgQfrYjcNzR/h2QHrKcMJRCDtZATMr2BtX5zjFXxYfSTTvfesR2CSem
         0QrHuD57PUuiLcqr207pOlrT3gKCqkVCTckAvNMhus8DKjZ+ySQUOz4WHxQycKPTUOR4
         85WA==
X-Forwarded-Encrypted: i=1; AHgh+RrGbLPtzh06tQb/LOsfny1hEoKsP5o9k6WA/tBtWW9jeKAMvI+kSAYyhFSPH9ZKLlNj3JC+YULzUhbb@vger.kernel.org
X-Gm-Message-State: AOJu0YzWcr+46DOrDflq1gSwLJjm8QFXEU2AshZa1mfSSg6ebXRJSblo
	SBV4R6Q0bgDYo3JFJCoiwsV/jJVuqn3F07G8Ya2DKxDu0npx/8dfmkz/qdDPqyFGa3r1w/oX6xc
	Qd1TrYECPldh7sgIVFQlIgERUmom5V7rkc8BL+D50xVn22y90GDP9EgrLT8D25dTE
X-Gm-Gg: AR+sD13LALpydvpyQYF3GKG3rB8F89iSlQqYfTtLOtqw36HUYiNiEbSOzrna8NUG/qp
	yISL7c/ay/r3xWHTpNvWsAuEd/N1fMsVg6nGSPTO+4wY17WylvOieUrZFIx3cTrRwPsrctU/qxv
	7ybuqGhEUqt2QNOAzQpx2ZM3vksR7t0NfIvFQIVYGS67Poio0pAbtPO2gA8AscWtTdFpzUoIeJr
	BZHlyBOJcuiw3K3jYYBLpJtL4IdY9WW7OGrQcjXKlB3ennO6pR0PT4ptYm4bbpMdJMRtZn4PJmE
	fPAd3kPSL30X54BbabedNXs0IvOkaIYSj4hyCxAMSPa8hkNzumOo3SKJwSkXx8T5+uOFxznzUGa
	A+tIwOLUtsHgJ7yTTWpqs8TppzHcZmF36HR4oe4jpUvrehL9mQN7n3UPx5yh40t7b4OVA+6TUAD
	i8FjfRDykQXUg6JMv+x5+ZCFL35XCsD+d94M0=
X-Received: by 2002:a17:90b:1d45:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-392ec4d3d94mr4600071a91.5.1786463601628;
        Tue, 11 Aug 2026 08:53:21 -0700 (PDT)
X-Received: by 2002:a17:90b:1d45:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-392ec4d3d94mr4600021a91.5.1786463601202;
        Tue, 11 Aug 2026 08:53:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm1143032eec.26.2026.08.11.08.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:53:20 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:23:08 +0530
Subject: [PATCH v2 1/3] dt-bindings: interconnect: Add Qualcomm IPQ9650
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq9650_icc-v2-1-55b8efbd62c6@oss.qualcomm.com>
References: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
In-Reply-To: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: EtJXNRRA7Q-txUBXsYivhOxlRXD2HfM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX+YFRq3Gh1ULb
 z+gfjyZnmv1n0u63kUooTAnzb/Irsth27I2EKmnmEK/aTcSAzC2b3W0g2I211tYs7R1Bpf5hoIj
 WD2NXx4e5lKdyD6ztirzToiV/SjdxG8q+SlnTxlhEC/48pwJfTFFoaMKHXcJT3xWRdAURg3or5j
 FiPxXAQLUcYsoNdkWJ9dcFzeEYqZZPqU0YxWE1aX8f+Ktzjxv77FO8/Vhk4aUT1xfcCVhYCQnQd
 TgSYiYbZ0GlWgOpMpsRy1kFL97heuRL3svImgmeHSz4nH/3pIiVOBja7b8GCmTkYKH9fwlP6Pbo
 F5hbM8WrszJX+AuFNH/7cfpYiwpZO+b8B7WnIkNWbXYuhPruBqUf9tQzJGSu6iqVjEY31UQfIrK
 SQ41R015qkfzZu9ZKXjxjBoxnyDJN3OLB4B1O5bV5b0C1gkE7C+kuoFU+dmNZaLI0zC6tA0hF5E
 rvIWclpC16VP/72KNJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX5Vp9fo4FBJe9
 Q53rTbN60rCmM3V0xJ2AyT1uHmhDgxT9Ru87R/zqZ/QXJiKpxTnPO2XKcjK2OrM1R1+C3n6UA0L
 EJ6cSA4S2r8ZnnEIOseBc2VoZ3RMXiE=
X-Proofpoint-ORIG-GUID: EtJXNRRA7Q-txUBXsYivhOxlRXD2HfM2
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b4572 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cx5HlDUoyQ0isXJhYOIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

On Qualcomm IPQ9650 platform the interconnect busses don't have separate
RPM / RPMh controls. Instead they require direct votes through the GCC.
To unify hardware descriptions (and software interfaces) between this
platform and other Qualcomm platforms, make GCC export corresponding NoC
clocks as interconnects. Add IDs for these Network-on-Chip interfaces.
The GCC schema already defines #interconnect-cells since it was added in
the commit f92b778251ad ("dt-bindings: clock: add Qualcomm IPQ9650
GCC").

Acked-by: Georgi Djakov <djakov@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq9650.h b/include/dt-bindings/interconnect/qcom,ipq9650.h
new file mode 100644
index 000000000000..023a3878cc08
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq9650.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ9650_H
+#define INTERCONNECT_QCOM_IPQ9650_H
+
+#define MASTER_ANOC_PCIE0		0
+#define SLAVE_ANOC_PCIE0		1
+#define MASTER_CNOC_PCIE0		2
+#define SLAVE_CNOC_PCIE0		3
+#define MASTER_ANOC_PCIE1		4
+#define SLAVE_ANOC_PCIE1		5
+#define MASTER_CNOC_PCIE1		6
+#define SLAVE_CNOC_PCIE1		7
+#define MASTER_ANOC_PCIE2		8
+#define SLAVE_ANOC_PCIE2		9
+#define MASTER_CNOC_PCIE2		10
+#define SLAVE_CNOC_PCIE2		11
+#define MASTER_ANOC_PCIE3		12
+#define SLAVE_ANOC_PCIE3		13
+#define MASTER_CNOC_PCIE3		14
+#define SLAVE_CNOC_PCIE3		15
+#define MASTER_ANOC_PCIE4		16
+#define SLAVE_ANOC_PCIE4		17
+#define MASTER_CNOC_PCIE4		18
+#define SLAVE_CNOC_PCIE4		19
+#define MASTER_SNOC_USB			20
+#define SLAVE_SNOC_USB			21
+
+#endif /* INTERCONNECT_QCOM_IPQ9650_H */

-- 
2.34.1

