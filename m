Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA6C2E62B7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788242682; cv=none; b=AqmN4B7vwYdCT7R340+q0YZty4zlV7IUhJSAyXa4hMMlsRT7O8yn2Zi234p4uxofvJFrQbTWPFu/4bxZM8d/EcbdC/PNk7a2s5Wd5MMgPDkJckkte25bsId6nU59ST3DJ/y57oLXMxZvEMBKBfmqeFlb06REMlLR3cyX0EL3om4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788242682; c=relaxed/simple;
	bh=NzsD4QcajZOVRH4NV4GO2obUNyWXJF0JtcZuLN8XyqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGAXLdzc1gFe0Myc25RsG8BvHQw4SDFdjVbIIGcHf+guFHCyMSOBMrkX/AEUy5mGxISfEsWsRqRVibaC+zozezY0zKIkXRqtoUEUhcZ9TAN3p66z0ZYMMl4NLFhPNsv3Zmf8qvnqqe0PGu4qiGrihdWUEvfo/i4aQ6IZ0+UIU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJR4n87e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0MBZq9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJR4n87e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0MBZq9V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811q7Oj585792
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=; b=fJR4n87eqUAAMu0w
	dHoJjhk1y7QoSxuuUPx57GfNNBVTIg+MAa8WtGYdWIXTFMsVJI2+ZIiO+fHkJY2Z
	3lzMfu4ao33mXvpJ5GWwfn9aFGGXkKqB2C/ZQ7eTBTPK3tY8NSgBCrJ9mx9uy4qP
	qjqFtltOjR8CRWVuCWI7S1RAoyAA6YB7JBN7RCZiEra8uPGUpyos8dzC9nHTDSa4
	/76eAMAgbi9X4d7iM4vkyGGRW/7q9xAtVOWRPfP3wFqnGH0YYzua+kFgGzEVSO6j
	5sIlHZytlREX70dOOLe9tcKdhSkWJe5Y4MNRdad6mdFT0t2EotiaX8/Ja7kO+FT+
	vI0VzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx8um6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:04:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so6946025ad.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788242678; x=1788847478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=I0MBZq9VO8KQbOgtZ8+ehxSAAeMX4ydwni3PV8vy6Ab6Y6FbwVu00t4dFJcdMeBZ6/
         RLxgYlv7G12T9GgYGLTsrhRSAv494vx4ab/MiHv7NbjplvWccb0XMzmUOFkazltyROGc
         J5rw6LKS5frp27FDOKS4wMz3IOQBXpRD3wv2Vr5HvhuHp9RZKQe1xmdrdxD/kBtSYgTp
         5umE40GCRJPvxrlLG3sJpMWfoYk4fsqbKGDZY2dezhfMxXVmuAly/ItyifKkB5/+q4QX
         x0qHRhtoQxPJen6ua7Tm+gnxCVuL2G9xzgtpZp5CRo0K6vEOl3b6AL4Ab3/ioKPDNmH9
         yEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788242678; x=1788847478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxOiia23GtlGiNnaYrLL6nmn5DZZAppKMl6jIYoOE4E=;
        b=jf4WkEsLKbAmPCMYap7vJLB5c3GJOq/t2CkdFud1EP0+gv92TJSdzYNkgBFlAXWWpv
         tfCpkeZu++TuLwQ9DQJ28Nu7BbWJoEBK0ae9+wNbnKYUoLioUZvOjy5dQ0lhx1H0jExi
         uodKL6Fu0zCGFUCwqJKTGhoVLumkNWka65OlZ3WCJczDdnio/Jmm1Hg0ijNDxy4w4zyH
         Fv/T07capGJjqGFegHcUIpDk2nvC+m5s2Jm3OEIE1hhMcCtpTKUCcK+XgFeYoNtr6aUE
         DF1BIEUY4WBg+t3hJ9FZ1x9ypc4r9+DhAV/2KOCUVqQpoaXDqW6Y+W7h6N5r/c3C+V+3
         Waog==
X-Forwarded-Encrypted: i=1; AHgh+RoE+CiHVUMwrxn0p4MMIDSXLn0As3Y+sEhjaA9Gk8ETEngh6iVkF0vBRIu5q0nXJBkQBZGg2R8SM1P2@vger.kernel.org
X-Gm-Message-State: AFuF++mCtnsxFfdI1Gy85wBLQMSpFxwYR39W2LRvOarBDOTq0u82GfQW
	+NmqWmGIPNfCKGSd1f6UTw9AHb6fH5MuYn7HSS1z0YmQU1vDGkYcfuW/140ai+G6LOUjy4BFP2q
	5Qi1XW8ms3bNLMgCZK3H+jRf8H42DXTTvV+5AlQ7Fjb0I8jLhyFgIjGaYNofL8ufT
X-Gm-Gg: AYBFou07oHJs87eSeyIdTWm+ObnHU31ezJJ0v9iHrHv5v0p1evvUxCtf4EjIRs9rvaY
	s0Kf51MpoQH7mieOP7WXBVulYrETsNCP9vU0OWSm6ck6OKV72RFuUmQQcH4UcsjrXgnejFw6j22
	J0E60aEzFa5d2ncgxDuc5wuUL9R96L6jm9TnmkdeRgq7QvAKiDCPut8NivC1JdSAN8kITzk8zPh
	wwnnfw/1QLZtbM9H8JQ3xqnYx8bSjN24iRsguRQEQABAr604N21+iFHglDAexIGRSnhKT19iA8b
	OLI/BKHfke31i9x+0H1H85SkXDIDipWdKlosP2w78wONLFsxAX+F6+vaurjcgat9CR/Vb+fi4q/
	b0VTy3EwgkCy9sbCMzbU5zu1ZF3kNdAN4P3+Ea7ehdVjNwO7cmOmN4prhY8LE7f5Z1fFDB5hV6b
	KmJS7TbkMo0OkwuzQbMBa6cTDKk3wHwQ==
X-Received: by 2002:a17:903:98b:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2d95295bcb7mr34998775ad.20.1788242678550;
        Mon, 31 Aug 2026 23:04:38 -0700 (PDT)
X-Received: by 2002:a17:903:98b:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2d95295bcb7mr34998545ad.20.1788242678142;
        Mon, 31 Aug 2026 23:04:38 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm35855800eec.28.2026.08.31.23.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:04:37 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:34:19 +0530
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3
 PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-phy-v2-1-cc93d2f3b1bf@oss.qualcomm.com>
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
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: lIE5cPs9mj-e0ttwKZS8XtdAdA96CEUu
X-Proofpoint-ORIG-GUID: lIE5cPs9mj-e0ttwKZS8XtdAdA96CEUu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX3cbU6unHRimt
 CUsctIMFzE/uIdZxf9HGAEYlr/VcbuD5/u/vOgV3ea1bkPLNFoTkuUAwonkgK9gNXsqDJFFPEty
 AZiaqq+rHwDAqtmQTiWWuaE5BVrI+MA=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a966af7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CyeWGLuohibXKJY0YOUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MiBTYWx0ZWRfX6ieJDgbQhNAc
 Xr5shT+kXXzgj5N/oZi3x4Jzg5lIJFzvJ5qlFKP9iN6tfWOeEi24kVN1mYuuD+1S5qJ1JwFtBQ9
 wjPnAIkKJOIuuSr4HF3qhfXP+oi8rA2l/oQUqvc8bVRj7PfnSQne8PzznzFICCkpKrDY34y7jPM
 x3gE07pIAWS/il7wBBkmw0UWSccPsayAav/tXMsQ+oJrPGPVHk06Ze4XZ3LfVlcQLtMdSjOlAvz
 a0u6thqi8ypTsXLNWC0CDnod2whgO9ChMcLc6cJ7Zscl9KwnQ21oCsiMGVbnJK2m/s7EtNAN9b3
 XBINvbQIkO4vJKZ1FO84+dynd/2h00Ys3d1r8L878vQN1kfiRoQUjhvU40++FYC77IApjstTtqJ
 zAFnkBJCJO6oQ8Nes4/nmjIm5+XFVEqVFH7pKh3r6K/5Sea2CwPyO2xunlPOXFakJAnG84rG0VP
 mWfVs77CTRvAkrRZL9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010052

Document the Qualcomm IPQ9650 USB3 QMP PHY compatible.

Use a standalone compatible because the IPQ9650 PHY has register
configuration data that differs from the currently supported SoCs and
should not fall back to an existing definition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index 01342823e57f..746c5a331f48 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,qcs8300-qmp-usb3-uni-phy
               - qcom,qdu1000-qmp-usb3-uni-phy
@@ -102,6 +103,7 @@ allOf:
               - qcom,ipq6018-qmp-usb3-phy
               - qcom,ipq8074-qmp-usb3-phy
               - qcom,ipq9574-qmp-usb3-phy
+              - qcom,ipq9650-qmp-usb3-phy
               - qcom,msm8996-qmp-usb3-phy
               - qcom,sdx55-qmp-usb3-uni-phy
               - qcom,sdx65-qmp-usb3-uni-phy

-- 
2.34.1

