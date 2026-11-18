Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794985239;
	b=yn3j8zU9Q8jNzw8J16KdwxPB7tnshRfwZ882zekIICS8VleN8/+qiGZUBoKOXvj1HQig
	 kdqUi9IBGJbFbzcV6olTFTPthTxFBdYmRpCdnQ/rTsxzB+OZ/Ms8haIg+hk4bi06mkfb7
	 w8kJycwVvxW3avZ+XGGuzA9iqKnBWQqnzIfMlqkC3k+sliks9wMAcnApdg95p2mSls2C3
	 EeHhoLaTL6FkoHxCuU7x5eekbxMvh2RUQVBCa8XTKUlR1tgH5TS22wdS5JbprjZaPIpaK
	 2nkqZPyFtFn7XDl2nflzOaV9sVCNi0FCjanLXZp7D2KhZFsrYIqNQekK5usl/btcBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794985239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
	b=eGeeiLyRszI2CxLEPuQhf3JtX+BKkQb5qvTwFs8SxcJvF1b3MuZk0Re7njjMeUG1AyFw
	 rH7brWnTTtQBueSaIqR0MwFaHhee/9x1ZF8sIMcIpllx/i+VDqzNQQ2XDU1ByxUPLh0KI
	 qBrEylfXq9wnCMkTkW7AWG/oGUDLiBUPhTByA5Odd8O/EQQWycnKANt0PWVq2UPg31ctY
	 MTkJjaNcfrzSZ6KlKGPLezZOjwoWefyKp4ntU2t1T1SoWtk9JPK2WUPyiieCa9JXoa7YX
	 5h+/5r1m+T1FVRfFKZrGKNiOWfAJ4sSpdX0K1p4UJlj1VrYMkv7aS95j60QxvlIIMcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYsIDQUD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esdnwFZ4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3467A606A334
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3467A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XYsIDQUD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=esdnwFZ4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UoQh3371272
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=; b=XYsIDQUDcnIRxC4e
	rKcO48ZiJuWI7O2yuqilCetwKDSvWa4v7cH9BCD5Q5923xdsOa0GzcNrj8Wdda8R
	RnTNegNGDOrZyrUxyJtLBNZOVCBQfD+pkD4pL1Fi6hglTi6rrzWmQTdKyphS56RX
	CGXQBwxc6WOfL+k5yn/ozWXwBlDsp80SqK/+Q37PinhwxnBXnF9Q37weBIw43Aw6
	4dLL2sIycTnGppq1DfYssbusr69y+r6NR/fJeg6fyp71LnSgCG5YIUw31EbRn5oc
	Rlj+wg6PGM0HnkkH4foChujx07znzDIQWctWk/IWbQsHYh0mijyg7PlYHJb6fDxc
	YE82Lg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sp7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 07:00:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso1508770a91.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 23:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794985238; x=1795590038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=esdnwFZ4G3+kF2oRddDkUmzyKkFsob5QvhXLe+oVFY4GJu+pLzoXvckjhi6/jbxp2A
         CaldhaisVRArA2mcIW3qL5mtQ7eR8Tm2WcShnUTRLfahjBSH57WdoduvRKjkbNEFoCNQ
         mQw57VLLI+jF9DsvhSVd1gWjQ7H3nA5pycWL/hyMipBsXEhLa8WODj5i4KS+WfTk3Wih
         M5ABwaKUqQbe3MDIX7gJgf9lZFgC93pTcNROQPw+qJbW7Dl+m1GrOrI7uRwECqQ4KQ5Q
         FA6rZipwjavl4MEDs2NXKIic85hQhExAydB0yhjtJCEZUHrhdQDCm25PSxq/FG5n0i0M
         xmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794985238; x=1795590038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5kdx6NAwXYQ+s5wwaFpxHmeZDnTcIjhOIZ/bjBA6CU=;
        b=PY/XYU94wffI6TjLzICP1tHp8+jgYRc8tBLOFSQpra0YKb60nDdjOOReDYvm0e0MF0
         RvOwRIsNqeolMZjDmpDK0Y0RVWKg+tMJE0hThWyZRXYQCLLJtpeRZS1a38w46EirJrlG
         jZEUsY/AkTqLcNJkRGTk+UVt8iqeRU8u+zlqq/S75DMbwLaY28zhxK7ye3JJNV0BOUWU
         O1aiZF6d6IqEJgytT7q1Fg2G9f3I7iGQVyYFxYpczGbwpEsr2zsGvRbwng/t778eatW+
         4mTSZ/+6axw65pe9ijQJJVTrCpzQnP+Hm7sJ9DcNd85cFfyq9VtcX5VMmZt+QXGISKPt
         aEVA==
X-Forwarded-Encrypted: i=1; AL+hErHq6oiJaJK4GrBaYzHpTWSFvEAeTOhQWr3w2rnI8weMUCFes785GMIsOGa/+jXdXGVb1Da6yn5KuXi+@vger.kernel.org
X-Gm-Message-State: APuU4Z/29iHLhH6M+xlGVDWzGLCn2J3y9n6vpO+Te2DNskfw5l9uJPmF
	UFmHIzsA9fuZ7mgX+ny3WbNN0sFa+wMpos4YWBWwnLjVuJ5Sfk+z4+c/9a1G3YFOJRMqo3yl8KC
	HEfZBL9HB6LoB+7iw0v6WAUhOkFh4sLJVeYOVGYhDnKgFI5/jCBOU09wU061yDMpM
X-Gm-Gg: AZFdTZfmTosJdm1LYYnGMzOenMGhhQ3cC4mX6nqDWRLEqpkMfRNW9rL3nCuoEJtrXSG
	1ymnpM8nuaMFyneaEsqq/HsNpzFTFAzi2Yjip+AuHVKYdlwq13/Uk6YmQQ5l5b+KfkLvmERsSMp
	GXOuYnqYEoaOVE+AlsnDMaAbAH8Jv4hmPLwaWnMDdpdQTqUFvRczMrZVWXLQ2MBdFsRmRfy0msu
	IYBPseWDbD7s8Lx4HO2SJ9lWErzD1KXQw1fnXBGAA4R+4eZYPX28DLncLnxwRR8q76oOe/G8tvw
	c5K7Sx7n7bScmJgdNigWR8WZqOyPW6kLWAJtdFqysChlHj5qYzGILcF7kKG3MBL2IkyxUdm2u3M
	m9WyhCOUeHzGL0U9l0l4bRkq6uuqlbM58kMhSGwNGdcgupiWzI47UHtH/Panq1n36W515wzoWls
	bcIS6B4CtUmEUbYS8QfX753wBTUnH3gSC7tQGMtjuukGKXww==
X-Received: by 2002:a17:90a:d60f:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3d063d6d9mr1237236a91.3.1794985237839;
        Tue, 17 Nov 2026 23:00:37 -0800 (PST)
X-Received: by 2002:a17:90a:d60f:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3d063d6d9mr1237210a91.3.1794985237187;
        Tue, 17 Nov 2026 23:00:37 -0800 (PST)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acd118sm2743262a91.12.2026.11.17.23.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:00:36 -0800 (PST)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:00:06 +0800
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,inline-crypto-engine: Add
 Glymur support
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
Message-Id: <20261118-glymur_ufs_ice-v1-1-2ffe4bb931a6@oss.qualcomm.com>
References: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
In-Reply-To: <20261118-glymur_ufs_ice-v1-0-2ffe4bb931a6@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794985229; l=1009;
 i=wenjia.zhang@oss.qualcomm.com; s=20250717; h=from:subject:message-id;
 bh=d1zDDePFJIPVs+rwiQvZLUWqDZvC4Pb/+gxCqJ3DmHU=;
 b=95KjsX53H6q18VdjLq1oWVWsUncuKbVOF8jqFhBV7JY0+t3MyJhid+MeXsz/+TG9g7qrKaYTD
 g7tAVxNjs1ZB6WTLp7bFT6SZsHK02VOtB4y4w9HNI+yINUY6rhiAoCk
X-Developer-Key: i=wenjia.zhang@oss.qualcomm.com; a=ed25519;
 pk=Of53/+6KgVgPh1R/xUMTbXVCnBiHTmHby8ySh2ShLtw=
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd4d16 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=B4SCuiGsYTXXqFn_0MoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: gphv58E8reMmZ5ZHHuLfN3HFJ1V1cJZB
X-Proofpoint-ORIG-GUID: gphv58E8reMmZ5ZHHuLfN3HFJ1V1cJZB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfXxeV5MM98Rm8j
 u8z8nQS1uqtrWjx2f7R6BRZoxmAFU9466TorIJl8NWgpIP/AM5fyusE0/RS+20/fq+2BWzEa5Sb
 X6v3SrzgYlfhNochDVO65zHuAnsZ1GbNDzJiLsKEavNVASFE7v7bx2xsqzXjKv5JCJ52LbuxcU7
 R0zo8U/vIpQY3AMryQMLDduwEGCzhAmdKdYmXXII9pGSpIFjRuZVQhWN3zuMa9mrX5aVJbsbjHT
 Lm6xkHPB+/Q51zJfbhW/lNVk/FpG1SnTXUypcQc1gqkzzmZD1X+Bl//7yWOnVdpXGS+/oL11W4E
 sHYbML6/QX6XJCT3G8218ThetbHakXEU+CUO3n/SRc99a6ALqhgw4Q+s2OSXCLQcH8+n3UGTcab
 yWCL0bXTf42VhpR28hyThgkVtdGaLq75heEzpmofgJWEayxEhdc1kVQrx50KwZVCm7ap8SVWU7Q
 FZzk6uTi5Nk+a7SqdlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNyBTYWx0ZWRfX2jdQ2IuHSiib
 v7Wm50phsPz0xULp0nBf37RKwlS6rAi5HU0U0M6liubZLlmxcQh2nuIc3jtC66zCrMQ9s9pO4MY
 nchCdyD30s/0SI/r9QMaey0nuVW7tD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180027

Document the compatible string for the Inline Crypto Engine (ICE)
found on the Qualcomm Glymur SoC.

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index b98c4c6b77f05a4295b7225007187a7b05387338..01a1a36652d759610e36d5ac3ad56f4b2d45b96b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,glymur-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,ipq5210-inline-crypto-engine
           - qcom,ipq5424-inline-crypto-engine

-- 
2.43.0

