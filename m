Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472459;
	b=ucN27uJauZVJ+x0q9Tu8k88/keR4CBGRrUdb+JF1M0TO19QCOATeonRoXCWeLUaZBkE8
	 HmoEOuunko/bCp+tzz1i9HEwndhVXfnBkJ37ntZrsGArcknMdA84eXXBC0aYQcqRCEDal
	 1Xlv1/Xl7WV2pdzUFm+fOQY2tFNOXRV+aLWBg7rgTQWLGJnNJ7xa83+w7zq6WULk+KMg6
	 JIpYqJYbecNWA6+a4Kilrz9PgdG20R7xXI4WjMUiOo8c+jqQxHGdez8bKA30XRRf+BT1Q
	 azmaoRxJn51VR5NwR4GCZIW/SNfuBvHdvn3mJQ5iSl+6WLNRxXXz7a4XP/QDSRVB0kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
	b=pv29UmVG0KWNampmEYO2JQdsBcNykM9t9Sw0OouU8Y10PXZf8K8mqJrPY0z6fXvNxkN3
	 5zKa57atZxq7jvITLjegJgUBx1/fBUuyYaUt4lZvKFUSGQDEcLH0BIP5msRqPgDO9Z8Hx
	 AXj+XpaDsyDFvI3hHfT4xGBMD9X9zUhb+dLW5DQKEciB2A8W1rzNq8xXshSfxSFiMNIDQ
	 JsCtOZZ9qW4fvKaSgbvpQEecw3x09WC0Fzn5u0GFKzQzYY9R8y2QVKNYh6oMpmeEY686b
	 5NA9d5SeVQV8PBjyNf6/bniRZGv7KxUaaXOjwLjzOVEfESYiqln7uKNJzoaYRjfTQzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebXST0T4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AflhbXMn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B93E60A260B
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B93E60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ebXST0T4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AflhbXMn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zbwl903615
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lCEAyTVsKfq
	f2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=; b=ebXST0T4Q8PYIyuHJxnW2EU1d7D
	47DArYhnx2wuor8XCNT4mzvfpg9fY7gcClF6hBO+KGUy4WjBwcJqJuGCnE7LyGsw
	V0h7wpSQO9PhK7zYHSOT5rfQEdTZvoTC9Jc5A88Q/0HCxuiJyfDa9jlvzt3Cb5B7
	Dnsf8EDJR3JH4k3Na4kVfKzCCiTA/QbYhTDl+idNnrVMmouA7FL7PfrsZy7RLm0L
	mtg5E54RzNrs0XipgSKGfuvPRJniNxTqgZ5uZfOfIPYLKnjvgG58PInor4gW+Zes
	EF2k87vUVlcM+BdwICHsbVZz9cN4isdnPv6QpoRjJJLadiW22j+9jL7+2Yg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubra4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:34:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed121d5161so4192125ad.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472458; x=1795077258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
        b=AflhbXMnSngbZc9iibNl3tWDyawGvcbezmok6YhLz3Rs96qfcRtIO/rJdoo3gsgKHp
         mqp23qu47b4M+SV/6ZFfnT2uNkRfG94UXgSjt6eHVp8k0AlzNzOxlyxiDTlvxnD0P8IX
         eCiP3LB0SyF/joWoBC1Rqx5VBig3s1QY+NXV7w/hQ4Px/iRwKyeEglgB6/Mi2NvjWuMD
         No/IBFQh6ax7hl4kcrYCVAGnqpLA/DQ86NRcZlvuW7W2wOu6b6U0kfJuZI7x0YqlFcWV
         esZq2ReVspek2iMXYbuS9DVa3EBP3rt0XVUDQ4E+n2r439W+k7A/x0wzjwMmVxqIfNQL
         ZmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472458; x=1795077258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCEAyTVsKfqf2TuD0MbUKn2c2nJtOpDVRa0HC47OHj8=;
        b=B9YNFgpOBTKuS03PbezPICSKzrrXdlmr8gtPVvuEGXqiuHFElgt/IQYSXTcaukm+tB
         /tCawTyckiEEHgKICHZ3hsaSUOMHqr1z+g6oOA3Z5Q24gNEsAiuTbUiqP6kprudu43Ir
         7TPXfPgqVQ93wNlfF8Pl+QnLed9aXfuRNd3KLRAEjoGgNqth6JCIzJVTIrDvThvNoDJn
         HDej4xDtZTRq57VhHhgLLFweNoe2aJ6rN8VdPQQLY4xyDDUAGB7szjJSeFJcYU3VWG/6
         DEw10wP1JusFUKr5CmW83ig085ZlZwqxH+GoFeU2ZiPvi67fRDuyoZ1emg0awlNjgpnv
         ukNw==
X-Forwarded-Encrypted: i=1; AL+hErHmdGyZHESXNcP4xBGdETg0YGtQVl0k0qllaYYH0qDhadP7j7srrGUEEEfln+jaKXmIcPTVDRohmUEC@vger.kernel.org
X-Gm-Message-State: APuU4Z/Iu9dMvmXjHO+azcIPwB6tp2TPzmKp0te8SKK1sSHFOEJdRA7D
	gw+KLdI6VURZqYR2YN74qqC2oi7x6DLGhkvdIRQzzFOx330MsWE8gadEzgb4dVWUn2VkSiS2UsQ
	vTyG0xYQ3lKNT+jQq9V3uVfCawDRKyzGr89zCgz68mUk9IUPPgwCyZbWp+mJINVma
X-Gm-Gg: AYBFou1fx+/5Km9JlFbSFHBIZkMl7slvYXLfRXFvr/EAITW1rBj35Jkjy4mGRMypGme
	HM4F5ORx0ZFDJlIp7pWUOGLj1TzonBnfRRRXPohVra2X4uE9JvovSXUt6e3Gbc16j2A6vtzyA78
	mlLk9kbwO0ykBMXp6NY6GezxzSD9ALm5kiAKRCTsxNxx2ZUbtkzIHVy6M2uPB4T6GDjOThKGqVd
	5AfKt9d5+OQurubl4fftkfssnwTXb3++BGyMa1d88F0cgqgGp00+XFnsd5b1dnrGfzdCYj5zkuN
	yZHpupn/gprfmlGVCZmjgzSbDS6XbbxWae76BJ/bjuIVSi8vznY2xhafB3h/TExbu/KiNu+ZTTt
	nE2Kkk3y672jQmDz+8L96k2k3gsKtvtiZQoKe5GPP6jY4e8MO6et8A+7eHRYR5WWNEntrms/Z7m
	dotQ==
X-Received: by 2002:a17:902:fc8d:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edd7146534mr83242475ad.0.1794472457793;
        Thu, 12 Nov 2026 00:34:17 -0800 (PST)
X-Received: by 2002:a17:902:fc8d:b0:2e9:5714:607b with SMTP id d9443c01a7336-2edd7146534mr83242005ad.0.1794472457290;
        Thu, 12 Nov 2026 00:34:17 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b950sm29351705ad.13.2026.11.12.00.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:34:16 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
        Cheng Jiang <cheng.jiang@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] PCI: qcom: add support for the Shikra PCIe controller
Date: Thu, 12 Nov 2026 16:33:53 +0800
Message-ID: <20261112083355.3884737-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
References: <20261112083355.3884737-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXw6LzU5AWeN2j
 dFfJm2kCQlllghZ9bIuceKrhCW0S/V9/sshAAsHRqeRvw1+O6S400zjoy+RSgiqU1G/C9UXwywu
 Iv7oLroEoGViPoxGg/iRkdgrcKY5a+M=
X-Proofpoint-GUID: 0U_w2OMF_R3-qB56gkUY4YjJdefVtdnN
X-Proofpoint-ORIG-GUID: 0U_w2OMF_R3-qB56gkUY4YjJdefVtdnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX4erV+C6z8nWT
 SrNtGnEgyX1R7fJ2lez664Sa14u0uXCDdhzansH//eDPS9uzukQEDqL6rqilzLF0NbwJUCgZukf
 +8YI8/F0aKwm4OGqP3N1d+/CMFj5EFVwDUQgpTIwJweN4pEm5X6Hs42u0nr9gfyzo3x0qfzm8n/
 hWGLbYD7EuwRVDHz+MJSt0bqUmzpWquv5rziyDoo56OvrRaEpRKAhQG38J30cgfFYKLfGB+nDAW
 d9a2AF8EwuUp4fNoqsNDmI6Yq8aEJUOI40T/1KNKJRaU8U8eatnImMd2OQQJ4r1/vJu0ER7iBwK
 XwrTUfgkR1BHg8BsDH6gZqbpxQuD/SVmAjLWhrLO4D/XnmN5MyVu1Ci72rHyrX3wqBVvnb58fkp
 xLeQKAfcOTmdH6rMZ8svfGLxZPNchH69LnzA5BmPLk6CAU5fuwa141GsziCZ9qAorp0h1A8O12w
 nQQUNYuf8IX6jrQ/LTg==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af57a0a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=OQKFvcYlbweCljSKIGEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033

From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

Add support for the PCIe controller found on the Qualcomm Shikra platform.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index eba1b2cb30f0..7573c509d7ce 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2623,6 +2623,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sc8280xp", .data = &cfg_sc8280xp },
 	{ .compatible = "qcom,pcie-sdm845", .data = &cfg_2_7_0 },
 	{ .compatible = "qcom,pcie-sdx55", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-shikra", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8150", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8250", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8350", .data = &cfg_1_9_0 },
-- 
2.43.0

