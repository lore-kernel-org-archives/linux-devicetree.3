Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C1535C691
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784712445; cv=none; b=liOvdEM4HVE+ERIktHWYvpy/KJJCBgJ1MLf6aNuSYsLWPuc4LYcDUmNAXuxuDpltJtTdfzDkDu0WtY6WHWRadLOpsNF4Cv33D8rnt0IQoB/59m85KWdaOMwKgxEuR+g6yq9l3K/YnNUGSwyzzPCx66JLugaqZ7kfPms6wwXtD+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784712445; c=relaxed/simple;
	bh=ucguCpxbLoqpQk+XkZyYa9zl8lvCdskfB7s868tjUho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nv766JP4AuDYQ4Q9ELs5G2CZgbKnh4pxcXUldHXzw0rIQev7TeX/gqsHTqZyExZWHb576PU19E5EmhRSqlRpzH+vcj5jKM1D3OeK3IR9IkGuhJUNrUeDXdYt0tvj3agniqFulT7s5ShHySRXjJ24A56I5h0jTZMT21CMM7t6+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxa1+zYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQdtSCTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxa1+zYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQdtSCTQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M9Dkh9049575
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvsphiUTv1IYzvNQ+L1erXBxMCXBfQ0d00Rz/ByFdTc=; b=hxa1+zYNAgFeq6FK
	PUG/wAZTMeZRqBlpMcL4KehgeAj6Jnqy793nM45osKv4s7iAGllmQS3pP2B3+OYf
	IXfJvJ1suGly1B6HplZZ36+8lmwxSUvyz3TUx261cffAP9LUhTlG3pMp4OUpVDAV
	OKhhG2V2V1ggZAUhbwkCLzc1/ovHO4b8FiBMgSxt4kMMx6zb/AoLmIf/ttVlHI4R
	XvbKQpjnpbkxlyQAWGNkqAxYISSEPRLNjDO4S5yLkI5IAhnxWV5JyX6TUoViJKFn
	YQKsuH1hEXZObIIX2HjbQTi3tSiRlg4UadUIl/MkSsh9zJClZeB0ZYiA7Pg48HEb
	PeCsFw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju2281nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:27:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848544a8496so9987609b3a.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784712443; x=1785317243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvsphiUTv1IYzvNQ+L1erXBxMCXBfQ0d00Rz/ByFdTc=;
        b=FQdtSCTQiKoVtrIvM2tdH1KFHoSTU3UgcyDttnf5ROlv62mmYVHsTE7aL+MP3pREpE
         KhbcuXfmnvjrayy4rHOjKezV6xw8lEPprP3LagJCaLnVxyZ1kvG9KLlnendXIjosXg+A
         wsZ9VzDqY4yi9EP3NsNBZP/ZAaKVYq5lK5q+UZNnVAwqwDFz1RJI3wOYNGh6gGIWrh8u
         rpmXBDQwXAYt9VeTEEgrSLWvPZxlESrq4M8iqO9Bg8NpaGA7eesXAjlFhVwMarm+MJ6D
         w8NCATTGqqlUYD2T+F9WpQf0XKt8bH/lyWX+Nn8RUWgc0KTu43rNXFWiFyBo55vbG08n
         z/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784712443; x=1785317243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvsphiUTv1IYzvNQ+L1erXBxMCXBfQ0d00Rz/ByFdTc=;
        b=qyGJBCiY5xbmfi1ypdhOwIs3af5kuAPBB/VzKQJYS6sxHu7I/IU/3sN6GE8OjwO3/n
         u7LmbZQrFOaoTwAcYelimgYzu4lYwSVbWy5IoZ9/AfQOirpL9hSjPegtHCruGVsxWcaQ
         UjCIyrsO5B/IrPQnJa8puAbOayVvQFX70EqY6WJTkA1zOL2E8zE+KMgKEvFFPggdg+MT
         bgSmmfV93vMW06nHSp+vy8Fr3aPU19Fv1gpreXRFd+ri62ux+WIzEyCyjfmSjwGqkWg5
         mE9LhK3Mzdh+YAT5ztjKSqopmXeO5M7EA8s44r/x0ClU8u+p8mQRC47GNPsZComd2twf
         Mqkw==
X-Forwarded-Encrypted: i=1; AHgh+RqyMYc0UjHZNr9YtfUmaiJnblajNz2v1UtMgNvb9KdmV4y0n14460/wHHrVwqjzKyd9TDbwc+cHuPKi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzim7BRPWfS6ycI6S5jEpP+hZmLXyIqvPNKJRYV9UigkB5s6AEY
	Dq4oOJzrXhh4NwhXvUs8ywM8OQsKm72t3wMZwVy7A0eZ1lmtpL7AhwtZfMwMhLS09hBkNmikJLO
	oj4Su1PcFVetBL77Mzt2Yf1l0xP9tF/8juzdqm434Dh7JjwK1zdGc+/Uwjrqmizac
X-Gm-Gg: AR+sD128mGWUfr3oIBxX4kAtpO33xQq9RbcDaY+/tO0+ZOeYZwgsr0UiKYS0Nw8ftTn
	v9pbb9U9r4S+g0VW3tqh2+U+a5xKOeiZDZWmPF7nMIIi21+m/Dt+o3gV8IpRsNjZxh4MTUeRFUI
	GLl4QzxxnyGgL1Y1QCFKLEn9OSo3d/xOZBEK0pCSfH0n2q+0HYZ67qyAkyQhKa+V77qglAN2ZUy
	1d9n05B8YBW2TkAptS3/EsGaw5RCpB+QOQKSSmN5vqh0XhGEtEUGZ40yOc4UQfGIhYcXZn0pRJQ
	OM3JE+xOgS8ogtaQfxkd5PNV1EYGA7mqGTtl9IIw9yv3F+PjQnzUHnZQOZAeKmUqSUjdIEiWkuN
	DXiOeGNG0uFfJFu9QCUDfDok1vfeIhhAHzP/17pfzwnU6TxdylsH0FdAYHBIgOvqRoPG6BBL1XQ
	==
X-Received: by 2002:a05:6a00:8d2:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84c292634f0mr21693865b3a.12.1784712443342;
        Wed, 22 Jul 2026 02:27:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d2:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-84c292634f0mr21693826b3a.12.1784712442900;
        Wed, 22 Jul 2026 02:27:22 -0700 (PDT)
Received: from cse-cd04-lnx.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f18f08asm850677a12.21.2026.07.22.02.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:27:22 -0700 (PDT)
From: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 17:26:29 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: hamoa: Add ICE node for UFS
 inline encryption
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-devtool-v2-2-d7e609ef7388@oss.qualcomm.com>
References: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
In-Reply-To: <20260722-devtool-v2-0-d7e609ef7388@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>, kernel@quicinc.com
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a608cfb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7g7wA4PAc6ioHu1SxIwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: PJ85MhDlgab8oFfEksfT43V14GAEfFrq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX+sO4R/4T5Eeg
 W6rUj+mRe6RLVFCLfUEhCY1RL2laPvh0zULBDTNGiZjv4Ym3A4swq8d0TuPxKSBhGBJI09PTi+2
 FWRdx6W9yPLSH1Qh3ZeHQ+CRmwj7gh8=
X-Proofpoint-ORIG-GUID: PJ85MhDlgab8oFfEksfT43V14GAEfFrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4OCBTYWx0ZWRfX+6zS7N+fCfI7
 TZyoh08TwM01Y08RxYsWLAsOgMKShZ3krj3LdBtLq+V2M6nbV5ZqjE5bpDFQeL8g2tikNNSuh2e
 KV7q+F9GYsxwYyJYXia+1nsj6H8is1V7NjzzpXp3i4dEdFxJQKw1lFLDyBRrW90HkLqH0saf+eH
 6y9jFo6lHhPsjloutTY2fD3exLiu5t3TdpU8Fu1RYr403rdPpcMLMWUiGc5WX1Jxb1UldLMV5Fq
 ywsr+NBvTuaXPUHek+Dvx6j4YcBZef1Z5HZOh6G0T8jWECv82GgyzNrkOFUSqTI3e/0aSH/WmXl
 DEQquhMnMB3qT1RpBuXdP9If2Tkmw4Z62vaRGevXsZ+ZPElIkWS5aGI6VI7Tf3x3GNw03t1GxPX
 2pEp4DkdH7MCHjBiZaBg5C6m66X8GUuFA3gqBI0FcpTKm7EyClF4gC8CxRi0IBUJfRa1pEeUIwa
 n/d7GAdT5oUCiCKlOYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220088

Add the Inline Crypto Engine (ICE) device node to describe the
hardware-accelerated inline encryption for UFS storage on the
Hamoa IoT EVK board (Qualcomm X1E80100 SoC).

Signed-off-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 0840eb2f884f98d76442fac7888ed49a07780898..0c9b459055d720a528a319272161d1d7446daefd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -4176,6 +4176,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 
+			qcom,ice = <&ice>;
+
 			#reset-cells = <1>;
 
 			status = "disabled";
@@ -4221,6 +4223,17 @@ opp-300000000 {
 			};
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,x1e80100-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.43.0

