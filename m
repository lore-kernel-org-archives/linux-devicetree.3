Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC961F3B85
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242687; cv=none; b=skCLeESZXm9NLW9FxEmLD/Y+qY/9WuabAPlBIBqNbFzLAoYxD3rrMflxaZownf+xt5EWsrKV/p4zTFp6aGoAbZvw8rA3ghexbnPszYH8Y3I+zvemohPphLP+Jmg09r22NsC0YnoToiaBqq3wsXOBfxJtbVxvFHaskZjnMMKHroc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242687; c=relaxed/simple;
	bh=bHhD9S8yQEM/tA0jHX1+caAOtuB8zdItzL8U0KBqCWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0/+8ItlbGPaNkJjpfHbxk9ATtSF/fQQRSGKEfjcfBEo8NUrx4AT1/mKh0lbvoyOOiZLkCbFzyevEne5sf5CKnsqnVeKVLzuG3VFclBv0V23rdkV86qTMDfMc78n64FrR2Exfm1urIW4l3kh5xpCs+FUUPc0BYU+j0L5lsvICHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3ILMJLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsDzS3wk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3ILMJLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsDzS3wk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68143IeX1645887
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVRyqShhUujaXW39CfQmaugS97D6lzGxozeWM0ROyiQ=; b=C3ILMJLx1dZKlUwB
	10wsEIgout1fM0IKcB5BysY5unbvZvB3AgpQjgQssijpwJCzlM5ZLBvIpvFQ34Id
	kW5FML/9teNwshyFao6qc+LpPDSNB2nM78khwrjHuheZU5BxFxn82nDpXjQVMaY7
	GlsmUbjLuiU9Crm0SRFqk2orn6kowC6udexaibLpU+Itm8EFZK3q+tv6/GDdf4dd
	E3XLdm+zp3FFmsHgi5bXVTNvz80zGvN/YG81CUHW1T8WNN8JexLx9mWQp9vc7cz8
	hmsiNvqP05NQNkr+jsX9XUE02kGxrUe8hdsCWtTH/VC06f6+b3uFsCtd+5ylP5b+
	b+ckzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0cwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:04:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so9121615ad.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242684; x=1788847484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BVRyqShhUujaXW39CfQmaugS97D6lzGxozeWM0ROyiQ=;
        b=HsDzS3wk1G/WWpbeVUX7SoGtz7P/LpzjfzPvqqGrDyquRggEdgC4Nltn2s6Apn8Izl
         rAPyo0h90ZftC96YE7sStYel/G5dl2pGZ26jBma/QHoZWFwSoopOI86hk1NyxrzPbvsw
         xnxTA6wjS0y6G5nX/GZkE5mosDlJjdGK2iS7Znjgv3davPznRd+Elcql6OpBp2ILo2md
         1o1gK+MV0BMdFX38uGtJ1MPqtMXDlymzx75rBJP9zKa4fs1Ypobuntc0pC3DXO09Is9F
         g4bQw+9j/kPQP9Oi30OsE5/nfNHJlmrGQXBJgn86k0ly/ZmOSIoOjt3d/1DANskn7pIo
         VrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242684; x=1788847484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVRyqShhUujaXW39CfQmaugS97D6lzGxozeWM0ROyiQ=;
        b=Q65c2JcWJM5b4yFhnEHnnWiupoADTwp/Q5R1vDy47VRyWHBxm+8eUfgT6QT+574FF5
         UEQgyD/tosjHd7my5G1qaj62WFca+x6gBnSvs1vEgeJtIbhbEubKv5fu70M6Tiz2ixmF
         cHe2VrEuyoMfGmDeaUCSZp96ZPiAw3O3yJ4H8azxyITmA36i6GisEFnLcotQf1uP3u6q
         CR3yV1st6or/HW5Z/4hOvPyCdy5ZOgqI+mKtYJpRTXk/H/i+rPVWMRRFujBP8aSGLdy0
         jGmhQC1Gsv/OOiwTJ4HULiwGddb2B2ISKXP8/Egc7XgJeFHFfJ5WrA/lmQEDB5f7JonP
         jaSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmm3nmBKXDOB4y5RW8TYbuwJQ7OQfu0RHf5Un85nZSC94VodwTvy5PSoP0prNi/FseKFGBRhZlg2w7@vger.kernel.org
X-Gm-Message-State: AFuF++kQicHoz1/1ay+64cQNWkCRja0Ox2LIUmZX9lQ9Ky0B2VsygUPO
	86yYlh6zazvh517M5RJnSsmFWDYhS2d4snEitakn2aYYcQzPUUq39qCQg5WLRcSSq1XR3+R4ThV
	VaHgoCAqpivukxFV8Xcp/q/VqfpjCs+LdGsKb5wgRsJOOSi9Oj36rs8iXedRanXa7
X-Gm-Gg: AYBFou2yDao7yovmWl4o9CUZI0RzpNiNLt3+qE9NglnVGoEvh7HlfAVF1m0mvjM+ZV0
	vrjpnxajBFKSYdL6Bio9rUuHnYNhRiHfAmt2JmZ/v4lTVk4scWzRfUL4T3jxhC5POY2WwKjgiab
	iIZThgKMxltYrGF0bUr5qKE2LmiwXNLttLUDYY6rxd6sWpdTit0lE/h67+ZlfU2EySnUbvQtIJ/
	AUO4dfkAtw2Up26ZP0LZyrUFtz3rssynjdSXZyEH7G00uGryFkPn/Uo3Nex4qW3YirvoNPgiWRP
	AazS15R+9oWdr/jssrc1lZlawwvTbIDwsVi+elonLq85gxuOxAbr3SY2fpJX2UyjwsPtijqLuGm
	hxEeR6GHSG3YMAM3yQ+GTm1BWcAWJb/kyFQnPjcLf3z6yAMXMEhBBj1lb/Io0BN4MiyTBCA8CLU
	oSnG++BUu8dQh/Iqu53EXphBzdH4zHxg==
X-Received: by 2002:a17:903:3d07:b0:2d9:3be4:7e31 with SMTP id d9443c01a7336-2d93be47e51mr134662595ad.5.1788242683936;
        Mon, 31 Aug 2026 23:04:43 -0700 (PDT)
X-Received: by 2002:a17:903:3d07:b0:2d9:3be4:7e31 with SMTP id d9443c01a7336-2d93be47e51mr134661875ad.5.1788242683542;
        Mon, 31 Aug 2026 23:04:43 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:34:20 +0530
Subject: [PATCH v2 2/5] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-phy-v2-2-cc93d2f3b1bf@oss.qualcomm.com>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
In-Reply-To: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfXytiFk59kqTLb
 toI17rKMJ3UCIz8E4XrEHatx/8lORpLZ0jfk/fXv2W67Jk9OkBhnBL7rOYZkFliKLCcn8Xb4E18
 21FCY5k4BTlEs9FIzvDTGn6XOwNKS98=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a966afc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=h_oH2epWPEXD7eD_HgAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 5lGMnRAOvaF97RXOz7igpweUHU_nTNlB
X-Proofpoint-ORIG-GUID: 5lGMnRAOvaF97RXOz7igpweUHU_nTNlB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX6QAxgYZrbd2m
 btgqA4jwmj9on/0P34ct6MmsuJTumssYONj+Gv2dCDMdRR4aWKCuIWS/lyOh0PMkfOMRYS8WX2m
 gkRbfXPzLf9nUxm6qw97PPg3X8JHDyLG2oBun8G+Ve73SHEJByeVouqUHHaNq0ztMELt9bfJ3+J
 eQjyFJMn2Dr1k72ymIvbBNXI5tYxdltO9BAfBchs8vKPrrx80TKEW6Atx7BGAccIYzhkKCxx9aD
 mJnMG99vELGec73M4nXWFjnH8+rn0rtY/I6cPAD4PXsXRFlbt5OiUdl/c6YAil1r+iLxdREb4+b
 VsdUHSVbUYC8Qa3U3EzTLLF+Qyh1pYaXAJJgnwcTs1A4UUSyZfFXRnkFRm0igFC3JcAekxxOv80
 CWls8J3/cAgcQgdXhG2CKLch5pyu4+BmjCGCYTf9cQtLqxQrldquTEo4TTQ07qoK3drYH+3Oroj
 7rjWgEMdLOuq9CagjMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010052

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

