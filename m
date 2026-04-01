Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C2F3EAC65
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039116; cv=none; b=X+X2GCBJ4y+WTZYrUw0csL1rKxlvj46IYdPOxwnUL5vHF9XHop1EukL5IharK0piOvInk/ca7pQF93E3sdrWnujQL8C5Y6f3cTDgRgL4xDVhGsbyiAAPamMcdHOX6q6PHOUAIzG4hq72dkdl7OXcfk5sV+WDKmrggh9TMJBS3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039116; c=relaxed/simple;
	bh=mAwX0EaZSAno54HSeI6K2yFRSljprrQA3w6CZbcroEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVyfyEW3h9rX8TwTQFGRa4D8kyswxlbBOy7iyCb5trqLnpSXmZnh25lKh+/dp6htgFyocTkNW7+qsKzUDZ/zM9fShz5AX7FC9NuIsUSh/TTf2QbXNfZCODqFlXCBnB4bMI6DLKl33Zqn7xkpzvtnQbGfSvMrsTLvjwS8iI0oLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Owf0MQI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNeR4pIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Owf0MQI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNeR4pIF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319ADd33174292
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8TsPnsxpUlTjlBA9wye7ehr1UuqmemNdZNhKxCKE6E=; b=Owf0MQI8eEMJFiqw
	Uj5uqMz7WyxU4+l3uGXDWIgxWxK+XBvuQSB87p2i9lGrBWe7VEGt1/s9VGXRjD9/
	xXRrMTGUtRsVRAu4NH+wlqo6HLZSPDSW+FaSSaOAhXa9mJAYilvemAtC2tzU58cq
	/i0vheqTduPHQrtFmm1O35Tl/VWKDA6WzcUwtrX8DJsznvKZiVbOzcefdgeckuWC
	6cvLsEYDew/TuO8YbXJTGHoC1RrEggxCl9lTH2hLihB3Lkf5EpZBrPBfj0z5Z89S
	WabZD2QXkVgd+xdnM4MG7/6HgntX5bv3jv5zV48E4I3EX59gXcu/XEFWg+Rdb6TE
	bvXStw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d90gbgb4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:25:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7385a1476aso4285799a12.2
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039113; x=1775643913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8TsPnsxpUlTjlBA9wye7ehr1UuqmemNdZNhKxCKE6E=;
        b=bNeR4pIFHIBao4xA3l9ggjz+5F2kBxjLs1nM4FDpJwd4K+52BBbkPNEdzKd+YZcpWy
         JGQapO6TPHpLbWIsigu8IrdeqVbTKvBXZoOKGX33yJTDIVuTXxAyTqQ8G6LEFEWgb/x6
         JoCdjwV5RfPMy1qlAropZKU47EbcDiJJc6vZPXgMdzeJslJWeAyToo+RYS8zDsWy71uR
         uNtD5r6GuEnzC82FqH1jhapSo0cyxs8Ya+nBdoX+RUk1t/cNKLsH+2CJFApq6OdYHno9
         HrhEESBO4bHljdi1SR/Po28AhQPXcVbTW4nCFRJiDf9Ze2hbhFHYroRnKGDhaA6hjrpl
         s/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039113; x=1775643913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A8TsPnsxpUlTjlBA9wye7ehr1UuqmemNdZNhKxCKE6E=;
        b=LP1DOBmYoEyBNcIhQ5RLCgUYf8GbohfEhEwV3s1NHm/AAtZbbEUksHIErYDeTYA9gn
         tRhmr/SJyQaj9xKuszgunBO2b3aLe+08NvRPAP7diJnYsFKenfRd5hvakVttNdKd3lYg
         lK9nLUUId06BOqPXGWaGdMEpVr/lvVepONPq/tci9CY2dxpFYQFvpwrR7Te7gcKi+Ay5
         FJ+DuAzVr0mSuPSHQytrmI4MwwRXTa2zkEthYytGrF/h2fCNx9sFpG8Bth31knXlXSra
         Q8UpoGBVk/boB5gH8BcgqhBxSRm664hTv/BhZlgd/wDfm7e0hqXoun8noPG3so32VO0A
         +IUw==
X-Forwarded-Encrypted: i=1; AJvYcCUXgVFRzngpl9JHVbSXZScO9dC0gv6JOQKnyAI/SQvvht1ri6EsMG0JBw512fLPky+kAhhFQVJWcdqn@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0xE8bkTJ5dhI6uRQAz56X3XuYVwqmJH4KkTNvSt010WTMd8F
	R8mxuQvWOln6mxLuWV3k01QDG1SUTWyI3ehqryn0xgQN2O8ZdzG0cPbjiYVwddYJqrK8tXGwQj7
	5AC8h6snXolpeLUBltBGi//n17cWzd4YBcjeDJy3NZ9pv12hjADnoAqcNAR2k+Eo0
X-Gm-Gg: ATEYQzwVuB0pb0POK2oXJwCelQM64Bv924TAlSpldPS+q59dzcgs57s1IqiliKVhNZc
	CciXbGO4gQMZO6O8dpTRywqi/fXlRzMAa4OnDyznHeM5/KsMHyRJli7CIqz/r/n7EwViYt5Q1Ha
	duNhnspUG+0qexvfwjZFS0v6vUqfdMccNPQwiK1rDFdXi5QriVpw0oFAKTDUGZGa37IErz36riA
	tiWl8Ej6ujOd2FaezxL3UdIc1hmm4dJi3kSfvFV/wGcUdiCdcGWe7q6NmtynZbMH9XhoVqyTMzf
	SwqpDjfHsq9hc35/dICxLStZPA3f8zHNdthbt3WpKLDSgu50pizSSy4Y385YDFVOM9yckEWwseX
	TbgTGdWtxatOhreInSe+cB4+ARtaznAzdFTlPDqDw/tPs6Q0zE08PhL3cCSMeituyjmW9OP03NN
	738rB/SNBQf+R3sWOP/Fmh
X-Received: by 2002:a05:6a00:4095:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-82ce898117amr3288775b3a.15.1775039112812;
        Wed, 01 Apr 2026 03:25:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4095:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-82ce898117amr3288748b3a.15.1775039112321;
        Wed, 01 Apr 2026 03:25:12 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:25:11 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:42 +0800
Subject: [PATCH v4 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-5-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=864;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=mAwX0EaZSAno54HSeI6K2yFRSljprrQA3w6CZbcroEc=;
 b=8V522elefGB9MdgGf2Qjl8En45Q8N2xcOd6LvXfEf0Dl9Uppv+IsQfDjfgFHfQJJN6wRr+XdC
 ER0eTs58qi+BDC9EKxljmvq5iG9eHi3j8lmKc3cC/yzFgaYQYFdzExg
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfX5lvndJFQZ0TJ
 Ig7m2QoVrR/829bVRhTHxN3y0lKjACq50MwCcOjMccDNfCHVQpOmPseZCQCKz42+nDh5sCq0Pya
 ZLKrwjW+5i55RgxIbZ3KqNQdLJrp556fT2cmV6ayNzeLlMZ4TOm4nXHuD3l3jJzzCJ/u2ytm3x1
 6WmyfY0X2BaRILYxuSNxURhIqnDk4J1D8uBP185ug583HouyWxdC3td2/3Wtq5uL23vGQ62CFLL
 t9Sxf8EI6CkWpqGs0P2KyW4D+FXt8V3f4xmHc3rIzniX6KVGowcDvIqM3heltvEcLlZ6GLWMvBY
 9XS2ukSu5rMBBS2NUn4Jz4dIu3Th46YcUfN1xGsgVRm42e6+qdtt1s5KpcprLn9ZwOuzjCMYsB6
 XU4zYad43F4/W/HTeznux2RzNHal4Km2e+l67F9gQzGrXGMmHg9vN5qwuHFa91x1NVBinPqrexF
 CF6MJ53WWWu/Vlp2aaA==
X-Authority-Analysis: v=2.4 cv=QJJlhwLL c=1 sm=1 tr=0 ts=69ccf289 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Kdw4P6-pbyddU2fe1WrqESyAuuyIkZ3b
X-Proofpoint-ORIG-GUID: Kdw4P6-pbyddU2fe1WrqESyAuuyIkZ3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010095

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0

