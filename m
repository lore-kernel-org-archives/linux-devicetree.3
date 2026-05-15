Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93F947B401
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842096; cv=none; b=K9UclQ8J+SqlIt9Akh5DDxT9MNZmdXP6Yk8WXsmeNo80KTSX6J+0sfaFoHyOPoXXKqZ4dxmVPx4O3joH7+eZxHw+j3DQ9JLQFswqGbcYwkUUXvscGZB045U1UP90VpF3o0BSMxhWP+Gdw3kMgR5ASKb4n79AJcexz+QSzekPWdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842096; c=relaxed/simple;
	bh=79rZTqEAggicoiBdRqg4u5kofmpZCLqTyvAK6+GYcms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGDGp/8NGjZ6jw1LTZ5E/LkLQG1LCrv9+fuq6lKmRHBNyP2uPEUIWW9Sp2NFCcrChTUpc3YBMCUHA2WRWn54ASKwrI7EpPFmuMRm9anIiqPTkqFn+lPjJ8pudop9cx8gfIPqCUOcvEDtaR1daG7h+WoXZ1brLJtPwXm9+URcNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h30i5fyL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8one9Yf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h30i5fyL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8one9Yf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAbCs23512973
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=; b=h30i5fyL9qxNDuoQ
	Yu9oH+wBgaK5cOsI3Nu+6bVQjvrOUabnhDyUWmok1sofyPKAjozZ/Pg6wkqwwgzy
	RwZlFy+K2I3IpbnpRv5bj2yhFwwHfkcKkHXr9kuYvgIZvp8Vgk+AVMlfVdCWoRKb
	ATWQzCJUiVLSUU8uLCxhJ9yFELBQT6LIVhJiC8D3/8vUGME54GIpf7yDChdSMCoM
	yCzqM3qmiDzPlHUK/pETPxTw48zuZxogQ8jQisVRBmAmCXuHPBURsIZRDnXdFxWR
	26mzLvJlNBIwPXGFZOwHLojPckbdVzu5UdJ42b626+asZOC1aAqrms6iBJ8Srzj5
	SBdCLg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vawdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 10:48:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so57573865ad.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842093; x=1779446893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=;
        b=F8one9Yf6QehYOZgoYRWD0GOgBcM9Nt0H8wmFZzzKRZvU0WV2HSrsJsbRVM+tP1jTK
         QvKoBLUG+h3+9wlrJ7aIFosCijOdDu94avPMEErQVV0edTVi3vRjRrojiPl1yXI2hjiC
         N2EWYfmhIGrk/X4KneCJvNadaqT+24lwZTXcQX/SNx/rymLpFil+FBOvZbFZC7SdWmJZ
         3GvoAbqZfbQ2RzQeQYIgJrmMrBl6dl9EBY5S6NZkmr/U88OFV/FYiPRbIKGqU+rgT/kx
         ngBE1nJwyMX+PUolwa3/80JJHQGa8gev3OQ478v74b1E1svUgBtQZhDb3mI5tv9DqHXw
         Be7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842093; x=1779446893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NXSl9xWJgGrKtTUXE9lPJPSwwg5bTC1u2A0FFxmrhlA=;
        b=ReYj+MGuOQffVKoCHregIF2MkxkIyVkLn7MLb0JzknCRruKDPfkEYQOmsAagIMMYsI
         N6aHn21ip4bkJu3C4QaIq7gjtVx6j1bZSY6qGksY++ZrLCXQzg+UzztXka1RDvjbpbDk
         E7n5cex9WDQEY/8RU8+wZV1inotH9drHyRHUtUensev5Vzfjd2BVkM87ekdACqZZ9rEx
         Pi2A1gBGhSO/DEi1QoHTT7w0j1fs7JBNc5+v6XbiWV79U3/BtFKag2FMWGbyNrfyrjo+
         LdemfWSk2oSSpEKddIodYJuJsBWKpO5UEx/0pou9A8TB2tPX4fYc5NuU00V5mkV9i6tH
         HSkw==
X-Forwarded-Encrypted: i=1; AFNElJ+FWZMoDRqj4Zg3fTH4QnysxoCVk2m1nc2ZGJVI3QEM1luXJBCpjFZy8VIloR467NGpq+QXLMW1++uR@vger.kernel.org
X-Gm-Message-State: AOJu0YwQnvlNHLZ+5SBRPzxRGPCiOGr3BuQbE3oKcncnvbHMxVohSFlT
	ae6Z8XBq262RZPPjtNzv1TyKUXaDgK760bfx9jM/Lj5FEeoFnWrIzBlru2pDWf2nFcKZiPUysdL
	cfWi9D6gqOxlhNMiE9BAZ2ZQtgJiwEVXlJh+ni6Z58xcjiSbjWcnbxbGHowR6Z9b0
X-Gm-Gg: Acq92OGkYxVi5gTtR+D0KyXTqfLmJiykjmPg9VJy/V5Ej4S6gYT0YOsJvUGSV8DrItt
	jy+jyTJAvIzg1alzlfRiyNIllVVXWE+xyjZxQsoF+RbkmlUOs2ALSEXbAs3fuTq62+C3ThuLXQf
	QME5sbNq7zX9OL1fLTnMKtIeo1bx3oSflUomwFnwREZbXfG1M7hS1XdHBQVAJl92j8bmeGWnRnT
	JMf3bMMZtvtCEximftukvKs4yybzEfx3744OfqIJDCurp+vwEVrOCjyZ80pWFJyORwxvqxqyhOg
	0KsKtSJw3OwOf/KH6fXP8XXNORSSnAsIMgwjsKx7nDinOdpvQ26fk+g1OP+THmlsuONeO78pHeh
	Q/McKSl46Jzw9/RyclxHhoWyIkgoKj4Unj3oe3md4vYXgtffCA7hNGrBSsG0+4/oKKv5BBKHBIw
	MbpJsU9vzYmK+ZaxcAb9cOlfpizEGRGSpm1GRrQh/XCpL6xm/XOuM=
X-Received: by 2002:a05:6a20:6a24:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3b22e6668b2mr4159410637.1.1778842092760;
        Fri, 15 May 2026 03:48:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3b22e6668b2mr4159374637.1.1778842092295;
        Fri, 15 May 2026 03:48:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1006fbsm4955221a12.21.2026.05.15.03.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:48:11 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 15 May 2026 16:17:46 +0530
Subject: [PATCH 5/5] phy: qcom-qusb2: add QUSB2 support for ipq5210
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-usb2phy-v1-5-5f8338d466bf@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwOSBTYWx0ZWRfXxV22Iwq/u0c5
 hvYg0rSUmjjhtUdMyuX6Et/y8kxLi4a2MBRmuJQBIzn/hMG/j0wHTIfB7WrWgYDyc6KXaLlINSi
 wPRkALmvLnZISv8ABjgISzAIwuKfNkewj+Nx8eOK0LIq33aqMfRSqLqOyLDIIraAhaA4ymCqaHM
 /5PS7+KcUlsahnU/zhtoUnFeEx7GHz1vJcibZIgiR5LxeI0ssS7Vm4euDH9sI0QbiO7XaCIqdsV
 SyEnNrwScLWVnnLYjIpbr0WlKlHq7hNYcaMD6TIl/EWXOaDAmHLVRRMqkfP08H5llDuFj1HrDSS
 nLwAoAaX7IbYDdhFoAyfjWYLJ8l+ro39+dliORBlFBZkfmEZQP9/aCWjBVlz2ORdpv+gGPsqTeE
 KFjLzRScB1s6LnoOavcGraBXxhurWinZ+n7yMnxFJi4dd9h16OiRZuqEdyI0jelFyrdzDNFCSJ1
 yf8vtql2tdzmLotuwmQ==
X-Proofpoint-GUID: iuz3N35mRHoN-s410-LF5f_nXPaYTns7
X-Proofpoint-ORIG-GUID: iuz3N35mRHoN-s410-LF5f_nXPaYTns7
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a06f9ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YjFiIu3VuMthEzLBwjoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150109

Add the phy init sequence for the Super Speed ports found
on ipq5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..749106175742 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -929,6 +929,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq5210-qusb2-phy",
+		.data		= &ipq6018_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq5424-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1

