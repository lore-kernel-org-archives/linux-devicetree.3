Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467334;
	b=0JFoFUG8npt0X8H7ZVXLfirzOGi61Gd+g/5gsDI5XJ9UccmmdUKglQs3wM5kfu4c49w/
	 jK/7qaXqXbU6EhNRH37XNCg/NDXp4DK0c4hNtITfLzLu7kU8t7M0bBkGMJQ5O74UtF09t
	 rWN0HJBh3gIV7Ef6NDRBIxERPuXVOx6fgDENxI0AOh49YZNT8lVzma3PJtWxGrLZNlMUf
	 /qXuKCVJTRQCzcVD/BptwnWqkO9wCHSD97oZtjUywUn1OQhjZIvDpCR+J9DlqvxQdkyVN
	 vY3508mIPkqIN/U4ul1q/DN6EROvqhL5k2nmgyHdO+JCs0AduQizeKyWxH7gxB07Y4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
	b=qN6LBmse7RCi4t4l62FqgV9H26/Je42MPMmM5zMVWM+wmMOb5S9n1W1cCHpHyVwJlHAh
	 fBgiqEQnPYSC8tzbo0Zp8d4F9e0//40dmm2eFha3uT4ZrSfi3kmVACzrS3+9o4Gn2bq6G
	 vBH8tr2HJ2xTktyBieMDCcuD5NXsTEOurL0JTjRkz2h9ePnPSCvhP2BcNVFMfNtUjbTju
	 uxuA/kUdOwlp/XBH8Q2dmXMhMbV+zYnmGhKjBMGPE3pR9FRbpcQ2HJM0RlhpQipDhWXn0
	 65SgsCjiiA33fdLDlniKMCeNXVe4RDx1baYvXdQ2I/TqVWOTqSUbepdz1XnNeBGKEFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9oX+f0K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E634606A32C
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E634606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9oX+f0K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuqJo2862209
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=; b=mXyHqxhykrXmbbOB
	c+/PPeNUMQG2nQEliqU0Pnu5RqWuUV94jqtt3QfWwnKXO/dpntDJd7krxOIRl6Nh
	z9qYu1Zxp0ywgewuQIWQA5F0C6c9D/aBiXmCU8u3QvR/8tXJaS00lJuMcuFarAw4
	kKv068ordsY4dJRw3ydqEUoYP9O0JhINf2dFmLwJ4DL/TCztXZsfknmW3zRM7ohY
	hfLxi19sVWdTbAiLkXDLvcgrvbQcHxlJVxgCJxIXLaZJ7cAF/rVc1f5Kc0F/s8qT
	zj2Qd9keuj4zjF7jmthhhtVeQLLLhFGE3srkWF1jVwidaw9DOgoMnoq9PQzUx3d/
	WAYhTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7utd5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:55:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so283366eec.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467331; x=1796072131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=e9oX+f0K6GARL+y/KJUJ7t0atx3e5EJzbfrPbcOmE16DCKEsrRnBGEjeBP6eQVyyFc
         6H1QMLDxiK1m4Xu6CqI4tucUteyCeKn4Liy/vWeDc1Ec4rd1hMBHfQFpA7EqDAIe7dRT
         XJZY3/Ixqb6d9xnZcdtz9ZVaM3OlNS1POL+Oq9EHsdOBHhBRnIWUH6pAhzigKJ41XzUz
         9o9OvtijVUtFSVK9zA6S3iOnreTlIy8tS8nnGSRsVrlrZ0B6f4fXrOysyDyJn6P23jue
         lBGGEdMCCWNZ7gzBShTLwsjRme5opVzEJGOFdxsR2vNGC42txhY8bGsXbTPUy36jBsiu
         gd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467331; x=1796072131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=2eVVsmFOWvf4voF6023llx6np68Y6/cUAEUgwGObZzL6rWOlAhruXrWbygsyqE1zMF
         ZC8PUDKkSMGOzcco9eT8m1GOR6L1f6U6GwGSv28Y8OobML5jAIPB9kb9+8MxLzOnuag/
         2uGWQzF93QHID9ve0OeOo8KDMTLiWy1IYMqXByUjiLbv9HazzCoreWk5DXsL1pHLZ2qT
         FEyvaJ/ZoefJyh+xkAtkzDjnm6a0y1ARCsaAO9zYpsDrcdAak/V6MbVanHcl2q7GgwJH
         FzpYGzR2yhy1VTjG7GsV0AWMO8bR/EpV4XU1UAn6wqKUcejdJGL6Xu14UHq4JWg85ybV
         4htQ==
X-Forwarded-Encrypted: i=1; AL+hErHJni1SYiqrlkR6UjZxwjH2Xdfja575xNaJNpMN+bidT+cE8D6wbdAG22G7316g63WPsQbPg45AbAUG@vger.kernel.org
X-Gm-Message-State: APuU4Z9qm2K/cNo7cLfC/vgqXJJnhf6ebO3kDBmv1/hu5zefXJBrdzEy
	dYsfIIPMdE9NJo+uFzSAqDyyJ4yl5DeAJMmc6spe9mX0HHKyPUxw3mTpDeG/FT8xx3lDVW/3Rj+
	fOdzowM9rGICfPp89Xg1gvFQ+P1WTcDApZOY5gVh78yseXuBUqjBXDrW8x1d1NfVR
X-Gm-Gg: AZFdTZfOlr3u7ZgUM0gRgQJUYekWr3hL8gSNyi8LlvY4Osz3mzNeucXcrfgGhHahZ4x
	7mt2OgvlpyjbuGh4VtvHBSRMaAnr6kxS/JzSyZcV9ShuE0uoHQXgwWTA3sZY6FZNNFIG6ClvzTe
	ppGDmdat9SBtDEZaqg/HcPVKms9I71AUJEJjYzm4gFlO9wCbTaLTEcfxeeyhfUy6iPR1iTMub5J
	+RSz28HEK05LbmmHxKnigImZ9tga+4NVCKgGS/7BSstJjlucKor+rGJ2Sm1DOJsX8WAGxd9RmAU
	3U0Zfg6/Eyojcs/InAk9DERCoW56cJ9BbcJFEg7OLjeVaGhN9n8RIJo7LtyWwGQwrbE83g5vmOC
	se1kAyo0khJV92YnVdXBewIK2ZnEFnC0UtA2sFn9LmMbx4SBQraqPK4+5+Dv5W6NLvHvaBX9D/7
	VYpR3pLeQg
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295186eec.16.1795467331424;
        Mon, 23 Nov 2026 12:55:31 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295136eec.16.1795467330810;
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:44 +0530
Subject: [PATCH v5 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-4-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1257;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4feVVnMM5ALc3+0FOkCxSTWjH8p033HoHYKJfJ9BPqE=;
 b=U4gJSJ7RC2dXsz6wOxP8adtXjI+Uqf0pB3DmbJF/K6HNUSlGrMCcyr1V+JIqX1azpuLpHkx59
 yfo5aLfJyi4D0Y66+UF37R5KpgJJGDmdkn41LputUlQxvgdm38TPc3X
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: ZkB_e2H-jrW6AzTrKOvTeYD_twuZ9ocd
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04a844 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ZkB_e2H-jrW6AzTrKOvTeYD_twuZ9ocd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX989i9D9Lgwjn
 3fBUU+Jk55nrF/jXse1Uall1AqN/RdDakRg6PXNTvPDdeopuFo4fpBnPIxcdN+YVsavFTj5vi4U
 RDYpNFX8kivYhkWg7E82TtYvc/UemFY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX+38nB4+K/gpK
 YjVmN0Kh8fTASboYpjqU3MQTXvQyA/73ZnMgQ9j3xJehR0z8+a0AUSKhfH3HzE3AxYb38pYX/B0
 Nk6aV3OC/D8t83oCV6BGWPtvsVEAnmNz5Ap1ReFRkxwLW4lBqwbjMsOWMMZpJxDWyRAKvvuoCrg
 QcrpDxCAt8p5XVjF71/tMfZ1u5zNrkXzdqMFxUqaHMQc27NAobuf1XkpK5sKQ7dvO+SFulBZ01o
 sIfzK4ixHG0wFHSKQ5RdyCbQFoAdVvc32uYCAqDDiNzauyGeENBDkIICnG/I+49htq2BictTdOC
 ObjtUfLQEalIl7O7OEchh5PDsk0eTe6My0l0lG3ShKIko0i2rMvWxdKtrsO0BRJtwl2AlQqBnpZ
 5XRgpMvdnQ7K/FQ9iQegP5gD29v+x8a8cxu5IKW9jVgh/iGZXZTItlSur3OhtWhwWrX/1CKYJGu
 R0CnkjYAfff6STlKFdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

