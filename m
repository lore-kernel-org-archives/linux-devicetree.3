Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57F3E5A10
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686560; cv=none; b=gcKroRxsGsujV0qq0FKrMZntxEbSheKXMyxTl7llUBm5p5Dw2+ktIKc7LOhhAVmWtIg57VUdeLkNN56DAQnaB9zlK/blnNCLXKnFoFu+tmzEbVByFI+HmuNAHM2WuWumOLLM200avhuUrUe9Gv+FpG79RmfPVxT0VYSSzuaL7Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686560; c=relaxed/simple;
	bh=tYHEyC60vh0yA+ow9iEUUDHB3KRZUf9+w+HPXxDH/0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FaApdyU7JoBz602FeEd2LDQS9G9TsbfVDnTGitaAPvrAd5ikUf8LKTnKs/fhZqbgQMnwknABLrp/twADnQpAY/Eks0Vv5QQl1ljy0u7oIG78/q8HBS4hAl5Jy9/WeAaNl1EP/bxWKn4qX82kRacfzybPX5cvnyfBtvVm26UrIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHRYaxAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=as5uOz4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHRYaxAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="as5uOz4U"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DANuGB2321230
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=; b=VHRYaxAVAMY1TQAB
	KoF5y+Ky9JKEUnvGQjKAT5Kg7FXK8S5Ya4JqVzj7g6A1UJ+Si17SRc8B+R6Xpu4Z
	r7Ach50hKc7OP9DwS2hYCsb8WM2qAfNpVEH6binKZqqgVA96wpp206b8LX4QScYv
	O4IpsTJoBjHmhOCrRj7YkBJ2XFo/qZn+U/G6vyHi3ihGb/Cov7dGjXQ2RjMoMDsb
	ZaWqvkdXGrPmJu3GImVFCorqkOlKxXnbJo4jyXKRsfA7bPHHAisVWRkcqzx2Fox7
	ySY8/k7+nm8sJSjfOuR7NKqYmJYnnVMCCo3xP6XnNqxFu/PydPquyyS2pacZhMEa
	tb82TQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4hguaqvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:35:53 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so9842508241.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686548; x=1779291348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=;
        b=as5uOz4UklYPq6mR5mp1E97UozG1848i7MMdX09c5g38d/rz2alRwc5Faznwt3auqR
         8UtZN4HFJozPQ9yMVxmD4tsDx+0dUSDmOLXULr930fS4Ij7crjFnXAdHort4l3xFkwbK
         dg00gEN7YM9uNbYAonL4qN7A8k4Ux1t7+FBVJSOW7qjYbarIb/oDfx5eXQMXy2qIM5TE
         hZYoMWSiXKSitZ7hKQx9hbkhSQyaFg5R+YoFykC6N1WWaPosHaxbuZcMr9Fk7bs6U42J
         kJjZ/yWVGHm/M3qccq6ayoIKnO3mA2HwQAfEi3DFWW2gJb/TITz7PoVjZZQhOCGWkvIm
         pl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686548; x=1779291348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EB5VNQudI6X5U1pX5BmnTNJl0oywZ/20uRk2m9TAUpY=;
        b=fc7ilQFXXshvq72HdxzxEF5ndgi0nFSwT2Jy+njBImidS04ds3pQmaKzKWpys3Jfwo
         TyYZ108k2H3SRCFMWNf6IDOXhNFzsgOTY3WDDlaU+woTcdZQ+3O9bNyzLZV+uyGHebmz
         n849HJnnzqNBgI6TnG8Hsw+5bB2arzK7dUH40xEwVRjCbk0xjAcwQ0rjzcrjeXLlU+ci
         cRl25A4i42e0zanSkm7mpABDHzi1w93tQLvnLfY+QtWNDRM7loNq0aM2PW3JayDvgV+a
         Lpo3T2Su+OrI36sz9i8rYcXRC+gRhaf7ex/sIF6FvKM86KvVak9CrbPM78vKylRKZ5ph
         xKDw==
X-Forwarded-Encrypted: i=1; AFNElJ852fQm62KU31P1hQUBy3zY/qYimH8xmOOMDZzxtkaFr8shWyKozEzHpZyVNR1rGRigNE/WbxUct8vW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DM7MNNbJvhN8pZxy4SUbH7GIwxOg28mFyP1BwKDaxUnAxvfb
	ghoW8NgKH4OhEb7GjhIAtJyN3G9pFb5X1/ANQ0kFQZ99xBwq+OBYZ/tXhX2oZl4MNhgN7/m+G7u
	7Ry51Ng2JDg4NrGEFsbI49vRDE/9ZOS882zNwp18lLJKFVIkC1mNwzGWFGyICH8Fb
X-Gm-Gg: Acq92OG3JGTX+GYgzURGL7fvfRorn4H5PF5bqeZ3NfxJs/2o5SmlJgCcboealJmaPA5
	t0oudUuIiWZg5B7TNyrZOj4Bb8/dvj/I3wfr/67FloWcgMJaIgHSEskYrhRnDLyOxRTjmi/U5uB
	RUsNAp02BcLq31sL3kFqFrej1RgxAKzVGng83ImWMgtDWq0MM28mWS9NT0eHOUiUObQGgpFXPgf
	a42gYfPZLK9FSQREsbwkqWcANVvFmLoxTSB8qccTRwJpY/m24D6qnGB5ArzVB7aNpMV3X0CWGL8
	RwoMVrBu4vPlPyeBBKLIIxQPfxiB+U+JB1q6RqdHkln9hdhZ5Q8Hhn65Xk8SbbWH98SWMxAj2dH
	rcGouQNRps/Bnqxz1rQr1NeRTGgqcuf+A/DbhAooi52SshaIaEA==
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr4077212137.18.1778686547515;
        Wed, 13 May 2026 08:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:5807:b0:633:f7ab:6bd5 with SMTP id ada2fe7eead31-635d1f9e9e6mr4077196137.18.1778686547113;
        Wed, 13 May 2026 08:35:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f446ec6sm43165835e9.32.2026.05.13.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:35:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:35:30 +0200
Subject: [PATCH 2/2] clk: qcom: nord: negcc: add missing definition for the
 USB2 PHY reset
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nord-clk-usb2-phy-v1-2-8eafcb2d5129@oss.qualcomm.com>
References: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
In-Reply-To: <20260513-nord-clk-usb2-phy-v1-0-8eafcb2d5129@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tYHEyC60vh0yA+ow9iEUUDHB3KRZUf9+w+HPXxDH/0w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJpJH/y8U1Ax90iAVFo88ARvOBAlUepzPrrOF
 J1MStmY7aSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSaSQAKCRAFnS7L/zaE
 w1TJD/9j8QT/YDEs2oki5aCHPO08dOSd3Qp9f6Tvw5j2MVKCfLtGeQ3iW2LRUxV/IodcOV2B1vE
 qKMD/4qwFDWj0r/7J1tp2cv73+wEjzLcqfKUv1tMCkUuifXN+/JgfYQyGmrl7sc7chbgaCGCSLf
 vSECnqndKy1rUoLpZwWXR8O0XB6lAgGtmqMLBA/cU7z+n/Mhd4zYAYHKdhvDttIgl5X4d026lEU
 E51UxhdKsYch1QcKPru0MBAZUf1905RvilvgL28zZtIldE9uuOnm07GQlwlhGWRs5nfOJ324BhA
 ccJi40yK/xTfVv2f0Ec/UChSrsePO2eZCVbrK+jKSDMfH0djrOtUkhu6tTExXuaLVEEOOowf2Xm
 pxyYN6DIZaJqdyqJEgAKNivP0hQjiJHct5Q4atL+41aMeZTZMj6vFifYal0jYEp/llPrgQskaAh
 qB7DlibMkuvtKvPLLONZb970etIpzlypym23uaYHRo+meKMAfM8+ZR5Q3FbpVV4k9zktdqtqe/V
 kiK+I436/QQsBMPTTQss4KNqWBpAI4GJdgGnCSjrRImQJcyKgq7ps1UegNiX/RaRXjn21d4rPeF
 rGLCFLFfWxxLpYLh31g0QRCQjS8Jc1BQjxv96g7DDwGw0IukCfQ61wTXO81B+U6KQ9xUL+JFrqi
 XXLHe8/J+HxnvJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=X4di7mTe c=1 sm=1 tr=0 ts=6a049a59 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JLQsvVesbaMn6kmgP5oA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: uxNH70iiq4wlnaK-S2a-hVVMLxXx27Vy
X-Proofpoint-ORIG-GUID: uxNH70iiq4wlnaK-S2a-hVVMLxXx27Vy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MCBTYWx0ZWRfX+1oZAGAQLTDv
 lQq0vlCNoTa1zwF8+gAz2N9HycviiIwVDB0fTn6OtwLcERd/+e54YJFVANxnaxzai3mkcF0OqCm
 lnO599VYKZN5bEwcoa5j6Rpv9b/bCZSLE5+pIgri276HvhKd0gANvejxMKaM4vh7QpsqBCYkdom
 yz9iLCw/XQDe6hl9VidtwX4iKioRTRYp2I7TGMTbINHQCw7Nk9sHcDSGZViDS0P1v1nAh60lUYT
 CWgxgcb6rcvsr0tSPM9fWYuvILNsO1VMGJXCFFa18dv9dbrsgggrpbb6S25VKXxtp3QP8rHeGvd
 H2rOz/UfYfgpuep47axwzb3niUtcUQqVGotJvOc92F0fBLJxB4TdAZB3wreT8PL93hX9ng8Jsf4
 trRoxZ53bxyEHRndJaLlxMHrpJGJeGxej8MAtclLatb9LwswHqpwEPbLmHIU04VM/bS5q4H8hYT
 pNUZEPKaEwhHjFm6j3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130160

The USB2 PHY reset definition is missing from the negcc clock driver and
its bindings. Provide it in order to enable adding the USB nodes in DTS.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 1aa24e2784e536e6b6e76f488abd0e2fcc435380..31442d39924a6f79bf39962ebb0de8d5c65fa0b0 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -1918,6 +1918,7 @@ static const struct qcom_reset_map ne_gcc_nord_resets[] = {
 	[NE_GCC_USB3_PHY_SEC_BCR] = { 0x2d000 },
 	[NE_GCC_USB3PHY_PHY_PRIM_BCR] = { 0x2b004 },
 	[NE_GCC_USB3PHY_PHY_SEC_BCR] = { 0x2d004 },
+	[NE_GCC_QUSB3PHY_PRIM_BCR] = { 0x2e000 },
 };
 
 static const struct clk_rcg_dfs_data ne_gcc_nord_dfs_clocks[] = {

-- 
2.47.3

