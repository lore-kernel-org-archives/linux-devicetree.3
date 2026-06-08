Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAFE399036
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901981; cv=none; b=ax5yl639WQiCXyUHrjLjjclk+t7MhVKWFeLk3LtveXimLnclaVSJIRT5LY3D+SajRrwiSvztE3u3Qg0w9ImAQyzYRrPLPMBHmenignE3EzS8cuUUKT9UvAJU/8MYgw1H2BXgF9Wcbp5XF4+CUrR7qlB7xaicbUfbkIizX0SWJrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901981; c=relaxed/simple;
	bh=K+dgZNHY5hnIkDIrCn9f4ZsTwh2z36hnTVJH0i21ga4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bOwwJmDIzYoNKvErVc9tpSpoSK11/rwaCnVOjBy9WsIW3K67noINH6WKRP4DrmIOituCU7ICRacRaJedXUArMaq3l0oFoFTKs3jpSh9KgZ+fGpe2SCdIhBNVSevIq3pCDRoeH64OQRwWD3jDquPl2L/VeUgZQW45WHapnXWxmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZXCMHTXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LO0LSlwC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZXCMHTXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LO0LSlwC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Pkeb2733114
	for <devicetree@vger.kernel.org>; Mon, 8 Jun 2026 06:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=; b=ZXCMHTXj0KwyxOuU
	UxMnzDBkxzD7Fnx1REV+YmBYfyJjxrx4BpiTe4PUEFV23hes3ftNHq1zMOY9E5aU
	QCsrFGwOzW8a1HfGxknJuvlI/QP6qSoBu9rKP7crGoBsg+ost5oDB+AaPfZtbeGQ
	gL6CL4VzNZzxMphuT5jPBPlma1qj6EuRYAitDcx5y5eXqTmCRaulI+N2jEqULSDP
	UijczHrBNIOgrfaQF4a/UsP+UJoB7Zm84Mqi+jlR0VCyd33XWw7QXe/MKBKfER39
	hRWbiOqd4HiIFRs+9nndFTd5w1r48pSYftGQ0IVAUoBL4WM5XHiW+YHMzhPg4BqW
	9jgWpg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6gex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 06:59:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59eba324559so2444970e0c.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901978; x=1781506778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=;
        b=LO0LSlwCBXkwPiJ08w8rhr5kfzZrzn3l/27TDxMT6986Rwrvr7YsCc9T8aNC/IvP/d
         5j+nI8sv8qKutNiBQXoburOEH48ul3bdIw5tGP7MpKKpVHmS/BzYL4tk3GZUB3zAsJSu
         rTPOwcIUsZPwgZfRsBkD8VDP97/Q1H583CJl7qUHv8JbhVNgJ2+BsvuKz85eoHXhoXSY
         qBSo8s1+AkPpu0LDO6/zeJqwlDi7jtMOk2CJIzignIWNZNydIzQnL5hqhGOk6Nmudx3F
         fnuwFxPUwlt8G5OtqX0bcNzWCyp+J4oXFS8TB8fn4SUSMcO/SBgLspBA+vhevT2u0VtT
         iQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901978; x=1781506778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ijJ2Fs7y6o0l/NRnU4TC9ZpeExxhgCsJvN3KF+zKxuw=;
        b=P/XoFGOcj2fCABYGhCotdTGMsrYCGuxAvCQ6zLsZWFtjBVJWKywC5TmaHpzaEWlHIQ
         RzBY3OV8Tqc8i1nYo8kuI3hZnF74/S3O07f9grx7oYjCXYvp/O+yrzAfHfLi/+OM6iLI
         CsvHvTMv2nes9ymb+84qHhKeKkqPJux8Ef7Saz2UnA5U952IJ30pxFQxhSgnicxH7oN4
         YTMOmR9V5RfNN5EThor4qVd1w4FceJY5pHrUoBUD9wlj8OgNAbWE1m5xSpJhXV/8N6Fa
         nayEao4j+1Hr0z7SgLfEbYYmabG/L7kti9GEFJdugy2VLW0bSdDdSp27hMo9Y2+InhUf
         g+2w==
X-Forwarded-Encrypted: i=1; AFNElJ+qk9WqTsU8uaaCauC3Ggo0xEDk0CAaqBdLJlPTB8aO/vjDqbDQsGFeFwmVjiQ4iHYpZOWtWMsbtGcF@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlRQujhDWveOmyB/FUWZRuadh4/YfVMe03PCjS5a4gUK/xk2a
	JuWSNXR3W1IsULdhy+FwMYfRIu49EH114Zgg8QyNJxIB/x4evdRXmDdQdSRdb3aFwBnctpVpWi9
	90js+qx5LK1sUIyZSO0W6sclAn9su6lxwUQv7r5EDeVsoPukuw5AtDmkpkLyUikr5
X-Gm-Gg: Acq92OEjgeDdp3Vje9KSv68GR1nti6K0eogBnNyWXj7XfKO7gra34JT3Jn7LQNOKiZc
	/+eyMKA3f4Ty5a4i09BjexSz6mkMW5SaF3NUoUOBkrKxAOjLsNLtCCqC/0RFFDDB7LPqpmWKv/f
	oopD4ozfFvBtxHU1+gAdExUsVb6YyYvOcMoH4dIkj2XkubxHaBde9LvW9zqCeFkZ3LgsW1OhKGI
	TaJpgSYJfboXaN4sm0jMu15E2DpA0S7POrE3FN+tD3pdpIpoC2yLpsbiYS34MqrpcM/hbgdgST7
	s7jePK8YVscvcc0L58fhMFoL7ALVBvLUYg5aaqa9jwsR1GyuYRXFTEi/7cMfabe+EQidzRKxHkZ
	k2mDHX8ox6t8cg9vu0uiuaTYrlqXmutBsG49OshcdJxeX3chbY0fsP19FGes7QKQcLV2NgAarX9
	HvqD0WHXi9cdiTnYx2PoJQM00+t/t+kRORAwhc+z4AilgLVA==
X-Received: by 2002:a05:6102:4189:b0:631:28c1:155c with SMTP id ada2fe7eead31-6fef118d103mr5591737137.7.1780901978120;
        Sun, 07 Jun 2026 23:59:38 -0700 (PDT)
X-Received: by 2002:a05:6102:4189:b0:631:28c1:155c with SMTP id ada2fe7eead31-6fef118d103mr5591717137.7.1780901977643;
        Sun, 07 Jun 2026 23:59:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:23 +0300
Subject: [PATCH v2 5/7] arm64: dts: qcom: sm8350: expand UART18 to 4 pins
 config
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-5-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=K+dgZNHY5hnIkDIrCn9f4ZsTwh2z36hnTVJH0i21ga4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLMPpbd/iMy/AOpMuLuKYEOLwtm4UqjGzc9
 c2zxSS9/baJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1ZeYCACypuX/NOMni2S+nKV60V4Uzvrud9ETiK986sgV2kEiiqR3Irz5D9bjUu1QyFC+dxgjMLK
 fGMJqgWJ43PFl8xeHndud30r9tdgXfgppDFyKaZYq1FslQm17WnlFeMXcZNe4Ra/WZR/rBOuuk3
 mlnHxU/XnUBR+lkYkZUeY3twUskOluahTpW8iPGoVYhVSR7G0xsNEFhT2tdn5RCXQ7/s1lWXREo
 aSLJWYYNrMjuW0joWOScuInd6TzzVh4dY9JNAWLqg3H5eKwxHZ1E25Ml2kSpUmfoXHIpYLD+qt4
 tVVA2Tgd2ufVZAljVuyoNBsRV9IFVNyFf+0sESlL/d+1ce03
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26685b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=GNmHCbt0ONPBLg8daWUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: c47Urz3QTDuDiAaTtemQeuXdjRtoRaW_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfXwh+vXnIRRIPs
 v2K6UJ4VHD69DJjxYceIQlLZNY2r82cQ4l7sH0TcgVQhfrYUrWgLA0DrrmGUiLuJu3s8UgC3Ecn
 12ytIWBMDA22d7j5ZVOOY95l8a3DYFxQ1ftFvOT1NBRc5qI3/UQp1W/NhPkYHIvNUvT3Gou3qjn
 q8EVtUeXQj2YSNjMK1yZY0ir0BUte1027fCL9YQOt+u60AtK2bOEu7voNPp+r0X7PJmop3UOA4f
 c6+a6VJwUKzDw/d/YgEynqIzflS2KJneSFMtebRSyBTuq+g4HbpS4ePKXju1y6s3Xx60Uh17Z64
 xb1ScfVClZKIr7cNBzqPGo1FUKVOmdl88ihes8M+AdreMGGVNQpsgJiu00INRBYjPuE1QLd6Rmw
 wlLgjZDSB3PJWateM2erRKGAkD5ikqNVsvlj6+trmc438FosyqIZFJ3lX9tkL+3KIfmVcCNlxgZ
 acxV37cloAUnVZ3ORRQ==
X-Proofpoint-GUID: c47Urz3QTDuDiAaTtemQeuXdjRtoRaW_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062

On SM8350 platforms the primary use of UART18 is a 4-pin UART (targeting
Bluetooth or other similar applications). Add all 4 pins to the default
pinctrl entry for the UART.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..eb2a795d8edb 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -3309,7 +3309,7 @@ qup_uart6_default: qup-uart6-default-state {
 			};
 
 			qup_uart18_default: qup-uart18-default-state {
-				pins = "gpio68", "gpio69";
+				pins = "gpio68", "gpio69", "gpio70", "gpio71";
 				function = "qup18";
 				drive-strength = <2>;
 				bias-disable;

-- 
2.47.3

