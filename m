Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D72138DC48
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754024; cv=none; b=tsb6AK6rScL0r2AA3PNmqMluVb0b4gZ9d5zVdxPm2E+ZFiSBFNbd31g/G0YQe8nZ8yZq98HO2ST33/KZGaKtp0cxef+oJDVEZvNwyURmRr3LvCroEkLmMOLkrZtyGRut4hBlY7t5y/NLK3ImU8CdgF0B0Jx6cRVIwED/3MkwBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754024; c=relaxed/simple;
	bh=pFxxeCj+iwbU5h+W9rpZGeU06N+az0yGHyB+CL5LGEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uk8P4zCje/ePFIom0dOPjy5/eVqTqRuvsAO5pEklM05Aind8dBfwIHAo23zs0W+YcQqJU/i57ImVj+ipgdsfJ1YwC9G49J7TZl/io8Y/EAFO9udo5abTZxNeRygeUYSEETpBDhPaSq5XPHK3RNFpPzjB5LqAKa5H8CGhXDPiaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6FQ/pBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwkDJMRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6FQ/pBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwkDJMRS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736oTBl3960472
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 10:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bBtfTMX7VzOq1GXCprAhYzUfGXz5v0Kn+0HFtpAFmgg=; b=I6FQ/pBRTkaCR6fZ
	o+AsMy0AfRS8Vz17wxmxnSlTyAJblfRIwt86UcnW8SscdpSPguRD0x5sL1xExpBQ
	1b9K6o6RQMWOY0UqPer6YsZm0ceGPGvEUmtEB+affujvNLuv4ImwgAmc1l/Bkn6H
	7GRVOeAne4ksJ9SzeFFsQ2NKr2kZwJpb+FPo/y371H4KdyGaX6sWWRoPR2YwAG0f
	yZH3PsiuEEdZattWLndfEBas5zbHZdohKzVLzVsimXoWWvXYogljc7nOu5NA5XeC
	eRMcVOdDmC3Ou1dsTo0tIhNvi2hTVYKoyCaa5sfqMZe4zd0syIh/GRWTIUrjKZBk
	qCLiZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fajsfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 10:47:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so3463827a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785754022; x=1786358822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBtfTMX7VzOq1GXCprAhYzUfGXz5v0Kn+0HFtpAFmgg=;
        b=DwkDJMRSxp9XFwafIMJL49xC7QQ+n4inwvjX/Flx+ODcc11w/yxmdZWY6T1f2vLNsH
         0un+wkLtYPHY1JTpMcdFTHGFPUSc9OsGhc5y5o+huT2jGfuhNF+rRfyMxVKMDqzmC94E
         fYyg9vQqDLz+qlXzq6ctFP3F7Zqjs8JywMcMDXlNQ73nHXBjTcUg0dHFno3V1P1GOVeW
         hVgy9LLgMeaFL5nVqeoIbayLsx8cLGZi5DT1zvsHqoqXukn3a/CPMJ58fBZK4XfluJm8
         Rv+Q8D1aTt2e0urQ2bLsxKLR2LB0MQspvyDTSxFB1vCysRW8pJbFzAID51TUWoWq6a5d
         76eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785754022; x=1786358822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBtfTMX7VzOq1GXCprAhYzUfGXz5v0Kn+0HFtpAFmgg=;
        b=PNumaTM9fx1pBRoRXQ/cKskULEAr2Q7HwtKFp40+xpRJZbsDayNp5obmsRt0PWEHHD
         jIMJobhhUykGhHqfYoOF4BOnpIXINdrxS+nIy14aPSNKJsF8ELW7SQw2sBhMI6LWFBLz
         iVS2yR58CY/Ev2ZpvA0vU7Ud8dMcHLo7T1zSeZLM00uxogOOOHE9vS8XNTvPLzMGfEKP
         frbCiBsrKjJicvYn9bsNcP3vYqAi777lY1PCgPPEgJIpvOreqUUPJy7Y1UMMBd95+mgV
         lJcH/G2bPlZuaTAntj899hEGzcqRoobFSpwpYGEB1EbtcEbix6awthoZA+2cd8jHRFX/
         hc9g==
X-Forwarded-Encrypted: i=1; AHgh+RrcDdlX0/yJAVqOGQvquza5SiSYvvXVf5KaZzC1ctQmz/3me5ujY3M2yDrZQNEG/xn1qUNTKouHizD+@vger.kernel.org
X-Gm-Message-State: AOJu0YzdFGFoUwIdG5EEH9olF8YhY20cM1Rj9I5u8IoPz/vZgh+pSVRh
	FIzkZFZvDc+WXU8D6NBnivwaqzpfqpTybHwPlHa5PIVkcmN4B+O5OnKUJu2Rc68ofud9iEIJaHz
	QcdYbcSE7W3E2RE2CvKG3opfhIrI+cBSA9I1zJErYJh4tuFZ170vBnoIJaATh8hP/gqa1yvdO
X-Gm-Gg: AR+sD12qMjAuF9JiHnNTAdqddM5FWeWSU/VvoNrSgcok55vBK0p694glnIk4BKPiuCC
	TW4kkQe5n6h2QME79oeNkLZ7F3KeB5eTvC0EqhPDy8NDstsNNxoNW9b5EXCFyRNVt4cs7lTzaY6
	kAwxP4onVljGtsu3/IwLpDM/IYhOJuhsILp9W9wsLz8tRfWyBBPR4lMTnt2gW5Ovvpee6eZXPP/
	X46wQ0nWf3k8ZS4Tf97ReBI/AjN9ZUKqiydlgvIsNpvXtbsO0EltXb1CiQQIMWzT+5JxnnH0wSz
	ZEuN0t02cKM+XKClkxSEEaSB9vVHLPhpWsm2P3bOdYNSoCQVMLg3dFd3VgXFz1GkjgY8K07g0a2
	3GeLyvw+xq9t0mrHyr+zFEatwGuxVSmWYWitsqCEEJVZBxEqeHRXiDsVzjSwxFC9Hj7YFBcRcUh
	7UPj5jzUdbHXIgnUVCwv1OjUja2bqoEw==
X-Received: by 2002:a05:6a21:489:b0:3c3:9c95:c0f1 with SMTP id adf61e73a8af0-3c92a7bdc19mr9637786637.41.1785754021982;
        Mon, 03 Aug 2026 03:47:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:489:b0:3c3:9c95:c0f1 with SMTP id adf61e73a8af0-3c92a7bdc19mr9637756637.41.1785754021572;
        Mon, 03 Aug 2026 03:47:01 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e506csm29993730c88.13.2026.08.03.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:47:01 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:16:13 +0530
Subject: [PATCH v14 7/9] arm64: dts: qcom: ipq5018: Enable q6v5_wcss
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-rproc-v14-7-a1f87b0b0ad2@oss.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
In-Reply-To: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7071a6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=aRINabbV50o6nBH12gQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: KAViKDVL_8hh0Tg6l-9ZvBUAAXFmjlqy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX9ND7GUpgvQZO
 Dh2Dta2lSyhjYNRR5yMPr5YrG5QfnKtYdP6T/vlVnAcnoGdz64WrCRNw7Vw8Sj2+GnJ8vjROxZ4
 Sx86vD3jSXeCtK8nnvjIZM2Am1BxSWo=
X-Proofpoint-ORIG-GUID: KAViKDVL_8hh0Tg6l-9ZvBUAAXFmjlqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NiBTYWx0ZWRfX86F1tLHSZxb7
 1yNWAZBr6SyuGjYt6LIgrQulJtts2EY6AqQ+qn2oKbHipAcaHrWssaJw2IBayL5IHoqTl3KGuIV
 RKZ2ZEJds72dd2Qno3em0nIw4Veolg9TlwU1t3CnXBl0BjzJQdK5Gn3HiSFwUNZBXFJkcFBA56r
 Ihs9nc794JQgHL8/vG/p8OT2Xdh6/lpeM8cv3dbobdCz05k4eb0fKCksFSEp4dMrl2dJNMYc1ND
 8rNyTd29fZ//bxOM1JkBe8/3RY03QkiI+PcGdBE+J/FvEKDxZPLOwRT08RVkJewU17iz5lcp4TH
 1ZnN9hU4wdpP6Zx2H1yHzzWVaAc3yY/CeuOxzNiaKJRngdbtAJhjjdb16EP5FHVIxp6HMY3qYxz
 bAMqRIZX9S/w6xkOa0jPrXVvWnliY+GslK4YTk0ool8UdMROQfP5oucz3P+v+CMlNQA3pB3TTIJ
 E8jd4j6gR0lhhFZQaqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030096

Turn on the q6v5_wcss node.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..ce3970358056 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -46,6 +46,10 @@ &pcie0_port0 {
 	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
 };
 
+&q6v5_wcss {
+	status = "okay";
+};
+
 &sdhc_1 {
 	pinctrl-0 = <&sdc_default_state>;
 	pinctrl-names = "default";

-- 
2.34.1

