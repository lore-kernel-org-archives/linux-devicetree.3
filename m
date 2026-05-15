Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2664466B5D
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842077; cv=none; b=Tcd0R/11qXXKbRvwrzcKLufaNK14k6r6sryds5+x8ZEJ1fyQ4ElgqVb9yQaGd9xEqo/Hc6mSfz+PxW5+hBLOGGQbtQbddZLsnmVC2/JUoDJOXe8PfwuU+mcDzkxlNH+4M2YdS6NNmzZy2GNFyawYd01OsgUlsyUMWME6cevuPVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842077; c=relaxed/simple;
	bh=b71yeC59/LhtW1vdjS+Vxsre1vTfwmr11fgGfIEr2bE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0dv8uPQR9oqZhy3hchh0SfCcUFsLnG+Sx1wDy/8ctdvuB2Cn6zaueBEAyL6gE85kH0lB9nggDdHaUnltXq/JsCSy/Uyu1f6BUrIn2bXGxAtcO3QelQBLSdFYZHry/yqjIjcEFVGXyyvcqhhxGJlUUVkMahgAsTpqi0puhzKn8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYBuTwEL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cO3IUEcW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYBuTwEL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cO3IUEcW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4vbf13513635
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5cWGH4JJiSLE2yXBQcPdSMMDAqUH64vfOo+b0Xkv4A=; b=BYBuTwEL/MoUHQb3
	N0SRFh/E8vvJsZq6w76AFlMzQaeCwRx8ZiDDkb2lhO2FXgLg44TW7YZahfJUSLiT
	A0jht+V5m3L8h71CfajHFWEfpr7ukmQzfXgaWrulHivwPorfLdAX6FVgoz8C2Sh+
	h0LzwKNpuo/yyytWx5PUppK+C6I6KHJt1JtX2JKeYLSUT53dShe7hKbCKEj8O/l+
	xfFb6S6qW2W31zo6QTbY/wuunw33NgvfSVMWmh+9CiVlekViGTG6QfUHdyelwAUp
	UAOcTGoPtIjIru9NkdwHksd3E6e5L8+pF5NbvtbsHWaR3HNSJtZTe5B07DlVZ6Dr
	mylqxQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vawcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:47:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8291230235so6980649a12.2
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842075; x=1779446875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5cWGH4JJiSLE2yXBQcPdSMMDAqUH64vfOo+b0Xkv4A=;
        b=cO3IUEcWrah2FmOjE9cykQu7F8JFCy0bAXD5lcFafBDvO82IWYWAInkkNNTdNn5MO4
         CoagzV1eKBOBbzTboIFrINWXfQZjnOgqts7sKLT3UAT6X0s7p9bbVqBDEmrM2kCzAi1q
         RcbmoarGRBAlC8y+eiIuq1L/1MSGXeG8CZWWaxJBbjJXyVChO9uqGlXu0pGeuBzYyAuT
         YramW/AelUNtYNbNcDtmuOFjG158vtLIomF5C8vb0j2P33WyO05ou9Yt63g04KxdD949
         /lWaGaAjiQYwfxnT4LdiC1aiPro0YxO2TjnO4C/UDvKhaxir0FAvkSnc7e4hVxqrKPjA
         j7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842075; x=1779446875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5cWGH4JJiSLE2yXBQcPdSMMDAqUH64vfOo+b0Xkv4A=;
        b=WvkZhhpETxWf9PW80LdwX3Iw89VJfxNQ4jnD9mclekouhgJJ52b5XEe74zGsV8fEn0
         gAP8wROaAIzEtNGF6XP9U1mg6zZ8gYxvpnMG28BnL09K1bqXkJiLe5N4Fr2P46jBup/Y
         AminYXj6ZwGhNsoYXrYJb80yewit6m6iL9gZsDZdGaTWEgWDz3eNxAYFaAiP1s9MlcqV
         K9wnMObuo8LyTopeYsB4Ijp3tQLl6ER0RzrqePMV/jq9f9bamiNezyKF2Au6NHQ319GT
         HrKnHjdn791aC1GrVVnI9tGENrZvvS4ZACgag7vtfGnZHkKtpjtrnKcCx9ChyVbQEDEC
         d3Xg==
X-Forwarded-Encrypted: i=1; AFNElJ8kGe/WxohZgYndBUpICWdz604AOsrFU2mTAhJky6Uo1ycUHpERj5RevtIfA04LmC5cojcXkqznpcTq@vger.kernel.org
X-Gm-Message-State: AOJu0Yywk63HGaBWhq8lRiZ+IvE8R1/i+u5NGDZkkZa+Kx89TueGTk85
	sBZzSkaH2QXqf28BtPq3elR8kLY55tcIm5N5mxdaYql5f7JU8UtObIcPWWySuYaeKZrbAguO++b
	0iCcteJOL/bEU84YcXpeeuOuUgopnOIL6Sbcu9AaOaa6rrFKMR4TSu5mmY7e/nSgy
X-Gm-Gg: Acq92OGG5WqPH7BW9UBmCxmCABbqPSe0/77rKJhb4QLmCb7arMfn86E7WpkjOXNmtn8
	fQeByh3VgiwMec2Tyld3TY7zOtdOH/4Rpy0ADs3mTIwNREmA821f7gRxpq65R/oRdjl1CKXbthH
	ZoL+iPfw2xuczUQFf98B3lCwtRtITcmdHUilNfCGnQhG8SDi6yEIHgbYuFa6dun5TaZQPpmeH6l
	7ahCQPF9QGkQwW+0HirUj4YMh7Oh9wKmJo3G1XEmIJopCac0mXXD+tDqL33uOVW/FD60z13Fn1D
	aQDy2KxVBBFRGcQZmjiyPQPalHUqNAEOvh1PoqXcYzr9/o5luIIrap1UTrFCedVvnHQpuSd9evG
	MsV9vgH8Uhqir9iP2FKjBmxtXHdRJdFV2DSIqhw5ISXJhrfkUaoS9RaN3v4lyw4J2sQGz0ZDNJ1
	d8DQTKWo7pI3Zhy2zc8IsXYh1W5zSDcVj0kKqxAYgtMizjC/KQEc4=
X-Received: by 2002:a05:6a20:6a21:b0:3a3:472b:2e6a with SMTP id adf61e73a8af0-3b22e843edemr3802338637.18.1778842074568;
        Fri, 15 May 2026 03:47:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a21:b0:3a3:472b:2e6a with SMTP id adf61e73a8af0-3b22e843edemr3802305637.18.1778842074098;
        Fri, 15 May 2026 03:47:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:47:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:42 +0530
Subject: [PATCH 1/5] dt-bindings: phy: qcom,qusb2: Document ipq5210
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-1-5f8338d466bf@oss.qualcomm.com>
References: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
In-Reply-To: <20260515-usb2phy-v1-0-5f8338d466bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfX2G4DbJrThrLO
 dXMNK62OimMpy+vtfNHLmeWYQQAEBW2LSctwJfeSpp54mPrLLUHdhrAz9PRKtTEvcO5DVi7m6nB
 pjayY4peqQBvCTdh/Rw/x2208PiEaKLv2FO302ytZfHfx0tFT3o8bQkY/avsx16hTK2HgdxRTtG
 6FyJrnIA9xghXjAlgHiHfcM39/f+9hrVnoqYNyMZXzqXzOtnoGZwW8Z0YnH2eAaWbYXUjRl4RPs
 udpx9DEZgNacTDaL3hdUJY42efiC9pmZxfZkyNsBSM4vqoZDt4APhDGf12t0QqKk0jxiy6auva/
 vgVttsTrIxayXzTsdT0MPgU6sbLz+rdDgN9vwmN8HV0tD4CVvDSXBE2bKFh0Br4HAzqXi7HdemO
 rrdjwyad2Ox3rl3aqv30mttBaMz52LWydOVwvK3B9RaeISx6NnNwCLParIkbbwi8DkzJUwL1Qm8
 EZk07z5wzwI8gcGtsgQ==
X-Proofpoint-GUID: HJv7etTEQYY1xeZ8rQ9CT7UjITTR1Ldw
X-Proofpoint-ORIG-GUID: HJv7etTEQYY1xeZ8rQ9CT7UjITTR1Ldw
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06f9db cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mYYFkqwxoXFK66vEoW0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

Document the compatible string used for the qusb2 phy in ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..509cadd31adf 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,ipq5210-qusb2-phy
               - qcom,ipq5424-qusb2-phy
               - qcom,ipq6018-qusb2-phy
               - qcom,ipq8074-qusb2-phy

-- 
2.34.1

