Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590774;
	b=IDy690qVchQwiB/3xumtjp9RpWXUvdSQBnk1RflQCHaRVDbuX8wsw9dHkmNyzXbPUWtF
	 /UktLOwZSmI5368QzDHW9Np+udn8rJDfCXITTBWJz05BFacoLbcYVH7cJJqHN3tIW4Ero
	 u93MeDPcrIUu26f+glnFzXrErco4mk7nDvVVustU99IXTltmkokzuu4mX+iL0V0GQl3dj
	 FZ8wGIma3gLABGDqz3A532SzxRReeoClSnmfoy4dP2ysqljJgea4reN/KmvhpsoFWJ+KE
	 6PH2GAo7JSPmEq79lRC3YNYNqvE1k9cipr9AinHyoBEc4cdJEFKpZAtoYY+AlC7JxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
	b=CSRjDLDfhle6v0FM+6z7I3W24slVM7R9z7tgmCyKoWRaLjaAMBmGEUAG57Lwi0L30n/1
	 IJ2kmUVYgkTXyX5VgX1OIwox02WG030nzgVIL+ABSSsaCAXaCQLQX4btCSyske/Snc/4S
	 o0KgiHqUf68FJcgMfmqm108iCl+u8PmRTxKYqtSjx82uaNWqv206RLGbVv9n7aFaevM9E
	 /zayXKXPnemn9zisjjllSLZYotwBFDORV40aR0dRAmsJUwYOlhGsnTLESFhZm9SYpkUIL
	 DqhpCjFDMAxrWXP2Ie4KlpzaSQYXwLBGCnQwK4iwg9Id2qi9oRCg/LWrUnkfSUR9evA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlClsJFj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I5zSOI/U";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D99606A69B
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D99606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BlClsJFj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I5zSOI/U
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68eCY3113806
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=; b=BlClsJFjB+bV6+xF
	AChiCcAiVqgnIN4K6l0emyGxkAfxCFXO3mKAE+afP0DujrN+EZz3ut6jpA2O1GIE
	L/a5n1lzvTx5i7W1f2M1fi/Zzag2kNPuKOztinb/Sxl7Bt1fRCFoNgZZeOyNaU8h
	zMg8rV7asXGnOAHWOOY1rPrKrFbFnRNTbn8uK+x1nP96mcOBxBU8iYiDRd/GmJh5
	hLo0UFVlib9bzhWb03xg6JtqHs6vkBgsFen6lysg6p9O+za3xXE4LsSN+vLhaJhh
	lwNLSPN/EVPxpWpNrkA97S0u9bOmm3DdHQR3g6L/GBjiek1m4LgZ0eshS3x93BZF
	kCqL6Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsa7nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 07:12:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so6578302a91.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 23:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590773; x=1796195573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
        b=I5zSOI/USp8xsc1zeJcBBYYV/lkGdfWUl/919K1JSP5GYwDwv5+ZpBv/COwM+V015/
         4n+JMtOyYUJY92Vx6w1PY5ouSwtv8xw3ADZcR6hgQd0glEjEqhQxwzbSAxU6g2H0kD1N
         KZ2uSjxbg3NoW8MAnqy/kt/ELaaXo6kqtjZ5sw1iv4K5IjLX55On7p5RMviCXc/9ORVG
         PTNiw3N2LOzZai1zGf84T/G0PfkwQCcMX9WGnWmMYYpQ7wBMPGRj/K2xZfaqjI39f+U6
         0EzbQLHgtQBr5EqMUcJ6mHPpKEPiD5l4Us9F3RbUVCf0NKOK8R0b3DnkSUpMD3uRSQCc
         VN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590773; x=1796195573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOuRmHqNmmjdF0MwsvvDwFwMYI6nn6VlaBNky8glyis=;
        b=aPrMo8aOLNLH9oZhDvO4h44ivvrPVjrhkOs5yZi/sCSzcTmnMTJnzM9ixuHz9FqCVU
         CdzYjrL7fbpAu/eFLXfe2RFQ0mJIod5AYJ5uXxdbTyfxAlSoRUFY1JqxG7vdeW9P6y7+
         /rGodv1k9DwlS1hrasJaWqHst3XF/Voh/5jm6oXS3h74uYmFDeGP7LVuEfVdjf3uNgvX
         3W5Nn5MSXO/dWkA1MBroknmMCX9NulEgzKibCYTULWyhjjMocilo7g7FbEhjo9uwaTNm
         SlobCmfxR2YBcrw6/b0ZaGLHSUBfCrt3VIvuVIdr4urRimrUdSyBkFEExNermcqNU7dk
         7apw==
X-Forwarded-Encrypted: i=1; AL+hErGnGvf/OE1fx4tYKxviI/bkHdkHthIIAz/ZK3sJ9A5pFU3BDXV3gD/m7tvUMdGEv7mMnVesFlHrMTJR@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y9b8slrFrnmw5CdJqpIFSG3qAaQ+xF3s+84GIUElPGGMfIQPA
	UOYEzCz4TVnwakH8eI2A8PFp6ya/QMHjwwCADvh/kqBDDxipEMIJOXEJYe7SLY5tJtpVb86RyYI
	RZdz8UwyVPYlbO3kqDgbLbo4YSHLcCPE6NdtwGs8muv9uX2tSQV+1AiGsxcKfOMuE
X-Gm-Gg: AZFdTZck+BrIxvzogRKaOjVgxTmOsp/wd5sUEY1Nn7Zwj5PjTC0PITvRjnNFh+0XXZ8
	ORrA1GlvbLYX61xmv3/YSnCuRA2kwduuzM1TxGGJxYVVl6IuN06uGUH1b0KdEA+F0jRBQbuJyrD
	e9gac8mDB+nLsvK5C7t0MgCOCLB2QgYKmrppUok2+pSzmyZUIMxLFzoGbAHKbRAHy+FsyNGrlY+
	XlG7/pNQ4IrcNo1hqoU/sC19VyMzdJkHMZbv8XDz6zTqHWCxeDZKGU6CBjS95yHEvhGNEUah7+r
	UnZL+cQPZrwWmJU3CFZnwqV2aIYg8XTulhpwRJsX9Z+J6A2F1BzpqyiN0vE8UCpytFWsf85DUol
	Kd5Qi2xiyQ6Vp1Ppe6809e+dJFwKm8wWUDWmpI2JyLkY2vsCpgnPGEUVxzG0ydBiflbuVrgY=
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18399576a91.60.1795590772851;
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18399550a91.60.1795590772381;
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:12:52 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:41 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-1-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: jKONxp5-75LkFWyKcotIM-tkqbyWT_Um
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b068a75 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pcj_qY4RVFpoKUdRnfIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX/i/F/4i+5thY
 ys0WwQMdLze5YqHKe+VB68Y0e9r0VOcXEq9b++zQN53dkX+obTGsrogj99YLGWDPy2XckNFbRtO
 s8scpdgycoLspN184MEi1/TgL/+Vcj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX5tYNAKEWG9VB
 hBkOc/VQockqEe1fjEHfMeX/4G30HCLLfUC7K/3a33QZgDWpfUsAoKNH8NhF9NYx1Wn2Mns04DM
 93FLk22Vi0WIg2QTX0SDo2OC78NAwd5yJOOIgMpX7zvVnszvKUvJh1T+BazNdZzCB167JLcSSti
 4ySPvos7ZHOS7Dnshm3k7TnvLDwLWsqEwzA+5gXZeZKxyI3N2SaKvQHT7rgtbN3SIs+TIfesTH2
 Uk5g+xrP4IPUsXzZ0a0KLbM2B2Hf/bj39nyaCMQ2wpQMxlGBPSRFACaJ5nPghP7NW2qTXfu5uGw
 UGhKmiYQ4Wj/KH3PRa6CicEmb/7hTKNLkl54ngdnKUXGqXWQIN/UYHiOPAGeIcoav8Ax5y/jT6l
 TXpcVSbkCRgrvpGWFOzUKHfghkhgap0IEW+M+ef2cgtWfqZTQM7Eg0IjYoZ9r4Z729BjQ76mEsV
 Z8cfjkDF0jUsYrWjvcg==
X-Proofpoint-ORIG-GUID: jKONxp5-75LkFWyKcotIM-tkqbyWT_Um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
than introducing a SoM-specific compatible.

Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..d0e30d6c1d4c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1089,6 +1089,7 @@ properties:
           - enum:
               - qcom,qcs615-ride
               - qcom,talos-evk
+              - qcom,talos-lyra-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 

-- 
2.43.0

