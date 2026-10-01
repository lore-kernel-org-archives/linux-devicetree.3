Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC652CCDD
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867498; cv=none; b=tLMNWzb8jqy642DcbIH+SBtaJcysPN3uC/Tqy60KyIdyd3+3pBhiDNRzVEEzHiinn38lj2ZRPmF19oefWHVXRxUJmJ5YXeF46jMlaNJnaY+eOtgltXTJPBAH76e6XBM0D814j2aq4tSNmIWu1UwPF5Xht+qcL61MIirgqKpUgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867498; c=relaxed/simple;
	bh=b7PwNKrUTbBjFvlvUJeBMdFvTRE/6fFMDE4OvnZCeS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkxDJN3TbY+M/EdlTLNDukYAbUs6cmLYL6OMiZniCYiFeTXAYJA7nEEAmAzQYXqUEG++WUYteODCjnHO1k84IFnnIysqUreOlFOBQd8aycHGfpaGPJjNmiOAp0kYRIM/do8EmvXR9GqMo2WldygUeJ+tEGQs1tUoan5djXWdfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EAyFMGBa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqcaYxUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EAyFMGBa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqcaYxUA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DirPG3071074
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=; b=EAyFMGBaFIfiPCu+
	ujTO6LWltDPtlanMGPe38X8U0ZuKO/40DlMXYgL3TgFEd9KxEvEA/HTwAG7EuL6s
	+7g09kIzr3yVvoKfhXWTfXWHAao1hqc79o2dOOLX98Mxewnfd6PwcDhJROkDwOVo
	SA/OGoFT2M8RJb6NId8AjaPxKqJFCXrt2InvcbabF0gxYx1n0PHzONBhScFcWXX+
	Ug9aiJUpX7gu+5MuysOt0L6zd22r6UJrdAlduqF66wKI5qkxWmUy0KFLxdjwv+mL
	oCUvLWlqqqw66Qva0xn5m2cA5Jlb0jKhL9b3WhRDH8Rsj5ct4LpyC8hTLwuz6wDJ
	r35M5Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nthmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:11:36 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1384427c3efso10043432c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867495; x=1791472295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=QqcaYxUAWNITrdTn5d1ntePS9VVQFL+UpgfETWRL9heatJ7AO0eOUeyD92WVvzgD3d
         bxADYXp42J7XiTpXVPbe8kgcCbLWEL/nLZWglX+UUSNgEFK5bLb7MVt7jn5/YcqERh5g
         2ooa4n0/W+zGt/yKLIH2kpOZLPvEHC/8b+bWKvI4QlTjE16ORhqtZsoDxc7lOJQEkEDe
         brrzgwIT/Ux4UrZxgvK0z9WW88xZadk0ruJ2LedoWBcTJOhpqgVixe/hUVO1m7N+ApTd
         0Q3Gja+WciK/6oh1zxi8mDqBSc1OHHE4DcyMp7alAWABCNcreJkKOxdSJHCB6xU9u1O4
         N//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867495; x=1791472295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqhXceR7YvU9pc3ZKzgyu+8pOAFFFFcPulo//ooWwzs=;
        b=2McBp2J+eIEEBgsy4oZA43Bu1NbkOBHicEpVl1qTNvdgLs9quhEXMSKGe1LlGHyOxC
         OW9XybjbBL/gmEz1aWJxyOwF0QCKep1/iuhUb0GjhU6Zo6QXCczNU9/1RxUdyoEjO7I1
         40ws7uPlj2dioK1UY72peEnCs2VqL9dIE8c/yhcr+o/EtGsAAPmT9wr/sP4DdwsdtDFf
         E3RmpD4pBmqA77ZoyPvWGwZhE81R1qKu+Rkmd3PXOHtc+OzpYcD9yZuSsqyI6IGszl+6
         nfzGIePWRbbaTvhkXDrmmsXl8xdGG1gjCt/afVsCKd4owtBBRjS8CcxZKNZtjQSAmPb8
         3nyg==
X-Gm-Message-State: AFuF++k3fmjC0e2WRlpB7yKL/Xy6qp9broLzjjl4rY8+B2KdJC20t17j
	Vs5wN1gtWL2kLMyCuuRd/rDtqUghli550dJHz03chr3uaSGFxCzCikEPE5o3sEIjhgHzJkn7ODl
	57+YHnBQuQyjbWMHKapiPvgOLPwf/L8Pz3nySAl/mOguZu7b/dlbeHDndsO/ipUe5
X-Gm-Gg: AYBFou2quRRbpkohmuSoJxiO/wHXkNHB9qWoX9Z2yGZuXz9v8qJuE8DO5yTjgrfYoAx
	vwdQdAz4z+uY6s0/iNTjWDF4GfBcGO/j2sOC6E8d4rU20VF67r0LmQpOFnbSpUFjXUcq7akhijO
	dV/Ov1dqle5NZxYYb8NA98rFIm1n0VQpWRoGwjMseCyC8VVGF1i9c/7q/9wudD0AsQLa01fbQqU
	+1YjjyMpJ+izl1QLIlSQj7WkPZagoMwXEnrbDJCNsfedfDOalOHROcNh05LmM5UeKIPUcMe4cXI
	I/gt93yDYxJ5D79enafumlXvOOSwZzjSMiPg6ncezigVaJ2Skc7Arx5h8dSxV1S2RemGj4hye13
	LCJwxWneR7RyHcuwHnFl6rYsTXSu6p/r+2MGeU8rPPuAn2evJj2JYyZ/KrGgOXxTaVlxlSLXR5x
	YoD3UtG8plRdrdXHBL1jEYwLqq/uDrlqoEqXQ3kM/TtEgj
X-Received: by 2002:a05:7022:5f14:b0:144:c123:4036 with SMTP id a92af1059eb24-14d33491276mr4970652c88.35.1790867495264;
        Thu, 01 Oct 2026 08:11:35 -0700 (PDT)
X-Received: by 2002:a05:7022:5f14:b0:144:c123:4036 with SMTP id a92af1059eb24-14d33491276mr4970602c88.35.1790867494617;
        Thu, 01 Oct 2026 08:11:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:12 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: ipq9574: add the IMEM node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-2-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe7828 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1EpwE-knX81bZyav7xYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX6ZAnP9jNI6np
 S/hvRF40gHGf7Zs661ofguIbhI8NiDjR/Izz/7LS56GlBL7T90H/9FJg3eOexsDcyzttwDEU3PJ
 GyAhUxV4RB8/NB4G5/SOx38qSQG7sR8=
X-Proofpoint-ORIG-GUID: MjrRYHzjQL88JOMRoA6CzqMLaQ1CcLO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfXwjZ+eVA3pnqB
 Ic1mro27hoVrZPSQNYnjtn2cNNrIBOjldgZ6kJkzSvO862aAqh6SIcarhfYZwJNs7gfDZnRfGI0
 jZj7uSmtAavKQsAkEo/HgycGm8I2FvH9JOW6LByyBxqlmQnHYLfRyEoDhYQoVhoYnwoUeKoQvqo
 3NdPO/NBkS5vI98IYZvMDpui0S8Hq9cbb9w77CNhz9vhdrswtdEGkYHXNanjBXX9nZytxSBC6Ao
 L0J54xQgF1YhG6EO47A/KU28ZxkfcxJGBuuD6Ul5lOtzoNdS7qyIl8ilW2pgUSY8oOP8Zvf5RH3
 Po+quN7pXsZpI8UkDanAYqeigV0GGdY39zUPQdScLsNtjbYBy6OPyBjt9ItfRnoQQn5asE/W/bS
 dJOk+oRMwPNG9EvM11GU2rgzAtHgbnWl5kA8a4DpN4wy0L+S97M+nurHaZfCKDBrKwMv5zxTuuj
 /PruM9Pnzj/wRFN7OBg==
X-Proofpoint-GUID: MjrRYHzjQL88JOMRoA6CzqMLaQ1CcLO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 771a59585645..f7cc6f274ca9 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -757,6 +757,13 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "mmio-sram";
+			reg = <0x08600000 0x8000>;
+
+			no-memory-wc;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

