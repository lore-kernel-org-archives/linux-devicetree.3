Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4643E37FF67
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670978; cv=none; b=s+6hcIMs3bjVMWmEQjBYDF/UhbCSsJKRS1ii6jtHouaz+ZJOwRviBG23ZVvIpMk34VlTph6OAn1hSnmXBlw7EXKdQFNIlkDZlw04sdvcoPi8wDLV+sBeTREXiTeS6Va+ARE9xPM4856xv2YdBozlhutERy3FuIG+mZgGmOz962g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670978; c=relaxed/simple;
	bh=Q1YVADOEM/H8yPrWBx2029EnPk6N4Dn4QdnUNTrIaLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfp9kmFM2HZvK++NiVLtpOxP8uoWvlrX2/53pK2OWxc8L3KLqvgFUqnzASFTgGFuQZH4u4audnFYacj+inAPLb1EmhTfzEpvbClhlZWbIbfI4z5wsVysaH997psY8fvalSstSgVCcaseFLYV/0wKmab4+TronyBbAN8x+9T29n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Psx91NOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KuviuyRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Psx91NOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KuviuyRf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7LbIk2386855
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=; b=Psx91NOD8vtG9rLK
	HMh93K2AdYpHIeWzSBAEE0C1EoeLpl9ZSdLRvDrE0WNTdmwHdl98xAinS1fVD3YS
	0JwjeK9G8RLTVKUQbs+csVjhluwAHagRV7vGk3L6m9MRICMjheYYbQJoGklAFafb
	zhApjtsQRhA8EomU4iosTF7sbSEgBCR19Sn4l4hPRUgar1ti2uuE2aEI308elXgd
	5MpgtF1wZonOLL68EfrxRJKNRjSZpWDTq9qKpa53YOLVB+TEFx1O0WOfw+BC8P6H
	RUN4dVpQ+eCGux0CGX2ipUkLY6rx6INj7Ixi+Ubw/jKk+/ukMHGhOn+fV4wmrZnF
	t1BQnQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2qamqmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:56 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-127876be621so2475301c88.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670976; x=1777275776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=;
        b=KuviuyRfMhsQQfDhKG7ni7PF7Wsiu+TVCb76j8GC8S0+9wI6bDJ/fB48UQomD9H773
         y8bb3NhQAfTo0cmp0BT98W0mh0hYXSxyuWYNKbnDKhT/xRpTh2UA4FkCfiB56WTaJ21T
         e6Nhgk3v2ELm6KD/OQz4zL+QTL+ZAFGtT0WEwN2JK57wDU2JKvR0Ys1xzr55iEdfgXe0
         2pqE1a6zEmf2xRa4q5Xf5ncvYKL2f+zMA3DpbiQJy4lrrUXZeUhNmWidNPYvkugezruB
         b9hOkEJtmjQdiFf5Fw3uxnse3pM8A/sRFL9Eq3GfXbiFNVCBuMOzxTuy1ra4uo2ObDrL
         E4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670976; x=1777275776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT/5fdSdZCDjQY3XGwGGBbsSTLW6mbYW5o6yxztcETQ=;
        b=POVAMQJ4ciq9oO/mdhYjTEETnwNOb7nlwMKCD82pCSdXePygNY7Dh+caCcVM/s92yZ
         Il1b2ksO71GWOEuB55F/CX23NxaE7ejvgrydMtZ4725taJGh6sb1EO4FEdGpt7bLoOLn
         1qfDNw1ojrwrsBi9KSZ/hfMx/UHDiInNCzFN2TpZZrNXQxSvaxUMZJbf6G2WJk8SXX8S
         30ZXOigPTGh1pJZ8PU8Wp/j0qVZ2eR3L+4wI93GX388+akTs5cPomtGh5yryLJLc24nd
         W1xB4ZZ37HtHNFT2jrqYOL40IW4U5qCCmuW+OecTkXk6sryUkXsSUcN9mxb6JJRWsAgq
         PQ9A==
X-Forwarded-Encrypted: i=1; AFNElJ9mTZULHzqKsmSdGoP2XtUAd9N60T8IEl4bed1BV7I5PbfmTgPXKd5E5SReakmKv/jrpRnZap0jBNXl@vger.kernel.org
X-Gm-Message-State: AOJu0YyuhH41Dw26iVGiObEP0i0vA2jDUrSveLpb6Y3doPoT5sAeS+PM
	WzzjLr0htP0B754emJ3WYtRlFikc/8JAnL9JbL1XxREdAQHjSC/5H53RQ4lNm/Wt2g8BS+5M+fE
	MTytHn8hSX6SQkR0Gjj9Kk0u50K5iJNb5h7yhNz8OuEl9prMggoR9/6/E29BGXH92
X-Gm-Gg: AeBDiet0G7B833cKpDNAzSNHBwZGxCt9kVnMD4+QWK1eBA4JarxpEq0lVuZs43Sl0PD
	nnquKTW7bmSyah+DtWC7vJ0eG8O9Bpo+8to2Y8wpPAKgmvhKTIVe1vGORuA9vi+KgWp9d3lEkMe
	DUfeFC9OEtMuPNpM3Axw40Byp0LHjyJNkOAov04sgBWM4jtFjWCMleicqR+ma0tDgo28Hd346L7
	njZDzhpBxaK4wMwp1sBMxIrcShCaqfmC0UtQc87ORzn+KEqEzprlnvO1+JIcSnI2M3Sr28pIbAr
	ekSHzAeNRvSYV1OQrfxNmKWy5aJer/OlvhjnV798hNV4HXBUA4L5D8FQmLS1Mf0pYQg3m5zRzxD
	OKbupFvyY84nh6IxXc+XWhCn0+2GQkiQrwdTlwZMgHR/A9VW7nzOLpl6vGQ7NYhCP5GGHgSvHMT
	XyuKk=
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id a92af1059eb24-12c73b39a41mr5122724c88.18.1776670975881;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
X-Received: by 2002:a05:7022:fa2:b0:12c:11d4:61dd with SMTP id a92af1059eb24-12c73b39a41mr5122703c88.18.1776670975346;
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:52 -0700
Subject: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=2215;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Q1YVADOEM/H8yPrWBx2029EnPk6N4Dn4QdnUNTrIaLA=;
 b=2Ppw1ayWt6U+LCwDrGerHPiMKcUEYxUpE0Rh04Xf6IFO1CImct7kjsoQXcSH0nLaMpj9UmHiy
 ZUZX5kbMIKzBdfN+QvTLMUFlTACjPIg7+/NkUVnk10rk4lkyd7qILsx
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: EqNXUIdzU-8ziiyDSoBlqnBDkkorFDN4
X-Authority-Analysis: v=2.4 cv=KdDidwYD c=1 sm=1 tr=0 ts=69e5d900 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2TsNLSZGWbgVkw9tuboA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: EqNXUIdzU-8ziiyDSoBlqnBDkkorFDN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MyBTYWx0ZWRfXzJrjBU+Szewi
 eDzXj04nVxoyMkOkeqNpi8Fb0kAMqfsZ5ZADwOxiFmXeUpddA3N5SmCXp/+SoGiJ8vTNjxD5nZB
 cJA5G9AtI5cA6xletbe4125bGQ4vjulivoM2nPiGV1YFqtUemMzpnKU+9zcSXIbKV137Iw9q1XN
 fqwISCIZJZUz35dXwXIjJ821/my6w5DQePZgdjAuukNit5DtHVgvFtttpgVuzCW3P+75/SLehcO
 IQc04tifiNQwhu5vNsM5RprQsbXWm1RDXzmy/qAF919g85gRLy/UMvLjinvPXQC57dO/c9ZksH2
 OP1q/b4ObEPTktBpZQgrL/BAS0P7ljjNTIlsnQGC3EK3ERaQTAL/DAk0vtXZon4aU5KwGh5mZBf
 iusT7pZG6L+xiqIv2vybAq0RxKIGN09fYOpaCn+8hc43lXLcs5lYuc7NZP5SucE1umPFEUYZh0W
 fbZTarZb4bQ5tCHlGoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200073

Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
required by clkref clocks.

The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
QREF TX/RPT/RX components, while SoC-specific topology and instance count
differ. Document them here for qcom,glymur-tcsr.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 1ccdf4b0f5dd..0cf612e6d7ee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -51,6 +51,46 @@ properties:
   '#reset-cells':
     const: 1
 
+  vdda-refgen-0p9-supply: true
+  vdda-refgen-1p2-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    else:
+      properties:
+        vdda-refgen-0p9-supply: false
+        vdda-refgen-1p2-supply: false
+        vdda-qrefrx0-0p9-supply: false
+        vdda-qrefrx1-0p9-supply: false
+        vdda-qrefrx2-0p9-supply: false
+        vdda-qrefrx4-0p9-supply: false
+        vdda-qrefrx5-0p9-supply: false
+        vdda-qreftx0-0p9-supply: false
+        vdda-qreftx0-1p2-supply: false
+        vdda-qreftx1-0p9-supply: false
+        vdda-qrefrpt0-0p9-supply: false
+        vdda-qrefrpt1-0p9-supply: false
+        vdda-qrefrpt2-0p9-supply: false
+        vdda-qrefrpt3-0p9-supply: false
+        vdda-qrefrpt4-0p9-supply: false
+
 required:
   - compatible
   - clocks

-- 
2.34.1

