Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995712;
	b=cW3cbpkf1lskRdGCy2VHLJOsnMKLffqCJYeLcNcOuqg4CLikY5e280nZ5reG4bBPG3N0
	 FBGhOjFoQLVPM+XQ2k+BxrrlxqmXuG730HNl7hMWHA4/cGvvNSihTfG8u0D9+yDBPXyYV
	 RmtsCD8+7MSL9cq+5uwF1U1HnEj3DO46k+5TqmEnwS7z0etYeHMqM1YXonry/XboPoqhm
	 I4bkz7hm6yI9E/uhXpEMQrBzmF6ykN+CEFb0Xebg8ekrNUwJEIsQeeb/n18An3DvEac9f
	 uaTdmh1nTM6EigdajGT208QTL/fLw/etjuQ26SxrJFMCo3j6g3szgJa3UHJDoOR/2nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7FZHHcrZ1mJoAVaF75vGJduBM/gojRXxTol/rGNXLc8=;
	b=G2rZ9Rg9rFQEcEBs+wVcacCUhlO0fqBPkUBt387OrSi/K20Guk6xHhiYFgMFelcPiPc6
	 TVvOy3v+QvHcODb8Mx/gOzramBL8H1Zgbx8SylL5MfJkLw2uo9MsY01Z30yD0ilKiB4AA
	 Hk3KKfFMdI1vZY6hwb084JJYHRwRul1h6P+DvGniP6QauNSIFppSVNYXLO4Hr/JYe81Sp
	 gSl0AqMvtHgpHoCNlDI2yIzY2JmsSbrQ1fp0npByi3BxewB//QRB6x2YxOG90J8xmdyRG
	 X9LWHlKNX0S+CVcfCEGWjj5rMm+QNBdqHHVUtpDelCdXWuCpHA/9ujLlPUPkUJqG1HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgk7a1RZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CfXhlVnJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B93606A31F
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B93606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgk7a1RZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CfXhlVnJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b17A2806329
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FZHHcrZ1mJoAVaF75vGJduBM/gojRXxTol/rGNXLc8=; b=Mgk7a1RZdCXCGXio
	QbfSnOKislywPPfSv25/GgAcrobRGFgcESsj5E5o+F6Ltlyj0ZlK3a1SBr5TEfYN
	8ZEeRZZXx6WEeMxow9+bMiipzOQz/BnC6bQy3nXyGRloULoAjYCnex9fJ1Wx9ldh
	3TuCT3XnEniY/uZEpt7prcX7JiVgp50U/1kl8FYuxaFYv7tCSxeK04BYalQ7pLMk
	1X0ju6B/As/Z+weWpq/BH3t13dbqqcYD5ey4aR1qbXcbmV5/Cri4AC8wPNtrDNfl
	Nzs+91cQMpMh7eMku7c4zO+mvmRGkztfU2wXZAp1oftG9eVJx+o00C6ZNR31PPvJ
	1l/Y6g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xn40f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 06:21:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2487141a91.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995710; x=1793600510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FZHHcrZ1mJoAVaF75vGJduBM/gojRXxTol/rGNXLc8=;
        b=CfXhlVnJ/94CIV9X5yT76MmQXwLJvm+m4WDqJHtIqxRIaO6oHSQuikBZCwn0o/6G12
         obMjQX3FzEEEV3SluaXqqYYBBoL416Zc4+CmNG2nxPSxJnvKODJdbym/jXplhRoTTuT8
         WFkzGXkweib7h3+BrvDKGOfI7boXSj9IxeQ+B+mwlea5AR2JAITKWCNhheJ8l5XiJvfY
         +Av+1tePw3XgOEOj9HmH2F+oPTzSApuYEoydG+eSvMsRIwsXPwbnKeO6g2VoJr1EkKD3
         GwG5riOx5/zORGtXEPJoJKf2sxvUT5idpAaKEAo1bOskL2E4GCxAEAZTp65g75TXqR+X
         8clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995710; x=1793600510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FZHHcrZ1mJoAVaF75vGJduBM/gojRXxTol/rGNXLc8=;
        b=N+UNq/nUMXKckMq/58f8HaC0bVfPgXCM0bmoe+ZGdKiaCsltCiTMtMYObg8mwd6/ly
         Hhcu6bVCzBpvWtio1BkBgFqEUe4EICFcpSwZkosq1gPMGvmhj4Hb7Hm/4CPB19Fj1y4X
         A2+ClApNCA7MP42rXLJaGgg15KTst9SVGDEJ+fTiDzGELg+DK3uthvhToqENGPPoazcb
         Ptpdix4zempnKhWa5w8J2zjAQ+6KlZSHbuvjVKyBppDe1J+OzBokK9VaA2mRep9709b4
         1aeuPtzJJ5kaHkYiwow4hXnA13l230O1ZB0m2SiUAsRPtI2tFLzk2gXhMHQAoC3jIvgh
         vvWw==
X-Forwarded-Encrypted: i=1; AKwUvBwS2DfSrQg4VqFpcqcRXmVzh+34l/8A+OQWvXpWbWDeb3Jyero18RMfCT159XqVJbmTznPtlmJ3o4Wd@vger.kernel.org
X-Gm-Message-State: AFq9FYKRT2zMiqVwoeRXUy6HGcoiryQmxpGpgE02MHez94y8oYnyIyu4
	wPv3CsOyT0r8N2pkcI0lzl2TwAXqOGdhRWG+Tqnl/EOghXWdDE2wjNCYRwuCktGkXYv0yzL61nZ
	f7llZRbFenz8+1Dgg2ep3txnlkv2QqjUflmdSe48GAaPNl1IrlPBeQKWKdqCduawP
X-Gm-Gg: AYBFou2s2YfwEkSZwH2D/IneJ8mwbTYHhsTE2iAvYkJSFQQ4cydtf3Iwcy0xgpc3yWB
	j7yxYulRomNEijZVAk6DOnHn915p+41IkHcvwCx8AgC+IlLJYF+iYFGKthn3knwe5Ap/ctIq7Ce
	tQXnu7a+9vE3pFO4Z9UXOju9W4xczObx2sbx0Wwy71HLJH4TYxS18+UdZ1ayFLf4r0Is2hcRCJN
	3q3sqW/WrrzkzT28zgAGt70O0MwxNAqEqdPL4HACqfqLP1eluiQux5//1d3ZByReIXOOT96KF9P
	MOP9H5suAPQIya8eIs+ZL24KvRMsw3xqdErn7cvOi+flLoqXsC+loqSOdf1pN6s7Wq/wTGuaTp4
	QAtnaPdOmawsSPnaepgzLSMJWxJUYoJnlrA==
X-Received: by 2002:a17:90b:5105:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3adeae71db3mr5213956a91.29.1792995709671;
        Sun, 25 Oct 2026 23:21:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5105:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3adeae71db3mr5213924a91.29.1792995709166;
        Sun, 25 Oct 2026 23:21:49 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:21:48 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:11 +0530
Subject: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=11866;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=kncwAIaVcKMmstln86ItLx0LdkQ8IW+1BDRAhbfUNbk=;
 b=xt/h2zpGk0hAsXMwAVDCWzN7PfQtq5ZhiPt4ODWT9FJcC3rJmnXtU30NINFaFtngRfr0yUu8V
 bOq3kzkQOTLDeviYjALpd9plp5w9cLZg7d6GxmYqUqdMkbX1Y80ZOhV
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: z2hsRD0Lg_2xd0aVVU_-2Pzcg5TBfMRf
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adef17e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Xnps2CMCGwolWMWMphEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7cNAo1H4MV9E
 8UzkNcpKPHmjPApjKr5fUYkqmbL6FHDmVYUkg1hmezL4StqEQcaGP3P2YmEmpsXB+Lwc9fHQi++
 QEnbpY+UQkBODYDBT3zw4szNq9pEPNA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX7WEcesdKdvss
 mcqglg/yx7OXJOl7GH9gWdAqH3IYgW/Vf4WdKerh8vEu2nFCmr+EsPsRFeC3K+WvJ63X36qZNy0
 UoUUoO0wRO0rGUvCPr+pSsiXFUqe6rFwbrJCp+hWtNMFApqLPTja7tegxZlouGNfQSzqHZFYgmN
 YHNFGt7NjMxT/kwegdt6oBdk3j3XoU7OyNcv04cHDs7GMRbjq6aW45ySkdKp0i5CfzUeKJ0uHvz
 ZKwvAJ/FlYNPA5HieKrPoWthd8H9z53gjzyDiO13eFDNGUNFXiBkZ/Nu1EffqIxdbwKn2utu36N
 tSJ0Za2iMwrsX4su6YRXDZ8gU3E4EcHkC1q3BYEypLCfV+ECobjy9z/uUiPatvY18D3BUrmGk18
 6LfiobTwjlj4IrKaONKN9tOjstr04wf748IVUP4EgxILy2TUxPQdRn1PQg2pUGyieqpJaWyu8W6
 Jzp6eCNMrHyIgH69WCQ==
X-Proofpoint-ORIG-GUID: z2hsRD0Lg_2xd0aVVU_-2Pzcg5TBfMRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

DCP platforms place the display pipeline under firmware control, so Linux
cannot discover display resources through direct register access. The DRM
driver therefore needs device-tree descriptions of the Qualcomm transport
wrapper, display topology, IOMMU contexts, and panel connections.

Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
subsystem. Document the IPCC power-notify resources, transport and
framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
after the IPCC power-notify sequence has completed.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
 .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
 .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
 3 files changed, 334 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
new file mode 100644
index 000000000000..9a0acaf00bb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp-dsi.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp-dsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP DSI host
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  A MIPI DSI host exposed by the Qualcomm DCP VirtIO device (see
+  qcom,dcp.yaml). It follows the generic DSI controller binding, with panel
+  devices described as child nodes. The DCP INTF graph endpoint connects
+  directly to the panel; the DSI host node is not a graph endpoint. The host
+  node uses the dsi@N naming convention, and its reg property identifies the
+  DSI host index.
+
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
+properties:
+  reg:
+    maxItems: 1
+    description: DSI host index matching the DCP output port.
+
+required:
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dcp-subsystem {
+        compatible = "virtio,device34";
+        iommus = <&apps_smmu 0x400 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dcp_intf0_out: endpoint {
+                    remote-endpoint = <&panel_dcp_in>;
+                };
+            };
+        };
+
+        dsi@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            panel@0 {
+                compatible = "novatek,nt37801";
+                reg = <0>;
+
+                vddio-supply = <&vreg_l12b_1p8>;
+                vci-supply = <&vreg_l13b_3p0>;
+                vdd-supply = <&display_panel_vdd>;
+                reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+                port {
+                    panel_dcp_in: endpoint {
+                        remote-endpoint = <&dcp_intf0_out>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
new file mode 100644
index 000000000000..96f6c2a17e9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,dcp.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,dcp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Co-Processor (DCP)
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  The Display Co-Processor (DCP) is a firmware-owned display subsystem.
+  Linux communicates with DCP over HFI through VirtIO and does not access
+  display hardware registers directly.
+
+  This node describes the externally connected display graph between DCP
+  INTF outputs and attached DSI panels. It is assigned to the VirtIO device
+  by the Qualcomm transport driver and is not independently enumerated.
+  Firmware capabilities and internal resources, including pipes, mixers,
+  CRTCs, and clocks, are discovered at runtime.
+
+allOf:
+  - $ref: /schemas/virtio/virtio-device.yaml#
+
+properties:
+  compatible:
+    const: virtio,device34
+
+  iommus:
+    maxItems: 1
+    description:
+      SMMU context used by DCP firmware to access GEM framebuffers. This
+      is separate from the HFI transport context specified by the
+      iommus property on the parent DCP transport node.
+      The child context is used for framebuffer DMA performed by DCP
+      firmware, while the parent context is used for VirtIO transport and HFI
+      queue buffers. These contexts represent distinct firmware-visible DMA
+      address spaces and must not be used interchangeably.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      DPU INTF output-only ports. The port number matches the firmware INTF
+      index. The corresponding DSI host is the child node whose reg value
+      matches the port number; the graph endpoint itself connects directly to
+      the attached panel. Unused INTF ports are omitted.
+    unevaluatedProperties: false
+    patternProperties:
+      "^port@[0-9a-f]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            required:
+              - remote-endpoint
+
+patternProperties:
+  "^dsi@[0-9a-f]+$":
+    $ref: qcom,dcp-dsi.yaml#
+
+required:
+  - compatible
+  - iommus
+  - "#address-cells"
+  - "#size-cells"
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dcp-subsystem {
+        compatible = "virtio,device34";
+        iommus = <&apps_smmu 0x400 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dcp_intf0_out: endpoint {
+                    remote-endpoint = <&panel_dcp_in>;
+                };
+            };
+        };
+
+        dsi@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            panel@0 {
+                compatible = "novatek,nt37801";
+                reg = <0>;
+
+                vddio-supply = <&vreg_l12b_1p8>;
+                vci-supply = <&vreg_l13b_3p0>;
+                vdd-supply = <&display_panel_vdd>;
+                reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+                port {
+                    panel_dcp_in: endpoint {
+                        remote-endpoint = <&dcp_intf0_out>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml b/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml
new file mode 100644
index 000000000000..6020e848ce25
--- /dev/null
+++ b/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/virtio/qcom,dcp-virtio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm DCP VirtIO transport
+
+maintainers:
+  - Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
+
+description: |
+  Qualcomm DCP VirtIO transport. The IPCC power-notify channel and
+  associated interrupts are required before the transport can access its
+  MMIO registers. This is a Qualcomm-specific transport and must not use the
+  generic virtio-mmio driver. The DCP VirtIO function is described as a child
+  node and is assigned to the registered VirtIO device by this transport.
+
+properties:
+  compatible:
+    const: qcom,dcp-virtio
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 2
+    maxItems: 2
+    description: The VirtIO-MMIO and DCP power-notify interrupts, in that order.
+
+  iommus:
+    maxItems: 1
+
+  iommu-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      The firmware-visible IOVA range, specified as a four-cell tuple
+      containing a 64-bit IOVA base followed by a 64-bit range size.
+    items:
+      - description: IOVA base, high cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+      - description: IOVA base, low cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+      - description: IOVA range size, high cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+      - description: IOVA range size, low cell
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+  dma-coherent: true
+
+  mboxes:
+    maxItems: 1
+
+  mbox-names:
+    const: dcp-power-tx
+
+  dcp-subsystem:
+    $ref: ../display/msm/qcom,dcp.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - iommus
+  - iommu-ranges
+  - dma-coherent
+  - mboxes
+  - mbox-names
+  - dcp-subsystem
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+
+    virtio@9be8000 {
+        compatible = "qcom,dcp-virtio";
+        reg = <0x09be8000 0x1000>;
+        interrupts-extended = <&intc GIC_ESPI 956 IRQ_TYPE_LEVEL_HIGH>,
+                              <&ipcc 13 5 IRQ_TYPE_EDGE_RISING>;
+        iommus = <&apps_smmu 0x15a3 0x0>;
+        iommu-ranges = <0x0 0x84000000 0x0 0x04000000>;
+        dma-coherent;
+        mboxes = <&ipcc 13 5>;
+        mbox-names = "dcp-power-tx";
+
+        dcp-subsystem {
+            compatible = "virtio,device34";
+            iommus = <&apps_smmu 0x400 0x2>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    dcp_intf0_out: endpoint {
+                        remote-endpoint = <&panel_dcp_in>;
+                    };
+                };
+            };
+
+            dsi@0 {
+                reg = <0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                panel@0 {
+                    compatible = "novatek,nt37801";
+                    reg = <0>;
+
+                    vddio-supply = <&vreg_l12b_1p8>;
+                    vci-supply = <&vreg_l13b_3p0>;
+                    vdd-supply = <&display_panel_vdd>;
+                    reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+                    port {
+                        panel_dcp_in: endpoint {
+                            remote-endpoint = <&dcp_intf0_out>;
+                        };
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0

