Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F983C9891
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312690; cv=none; b=iChov4pWl0dgvs+GkrhiqcSZa5P74VadHk57sxTxDgIhW0taISkYhr+KkeCfpOcJDdU6vSymr+aaJhiDkzEmVX0DKNL2B7Ft9ZHVzlZI1vz8+iDBT3sv7wsaRcbWGdu9xFN4+QX61+AsAu5WfZSaQ6NGYuN1rWZ77ESNT7V6Bl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312690; c=relaxed/simple;
	bh=uPaHJPX4fBQA/65TQFLuVYTjl+5WzccZWh+8+FnorRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eLt9L451Sig+XwrzUIH6Osk+CRzfCQB+zicoGWoSzbT+xvqZs9Igj/TUSgVJ1ptjhDZhargKw0xFZTRvvCcfNc6KSjwFvEYLvd7WLD3YAfbJcoM3ltOQzcSunCRJmXzr4Fi/GKAU0pTewPvVKl8tk4L5DTVNXwgVUt5t2bwBhN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/xXu/Lg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CxPb9lEx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/xXu/Lg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CxPb9lEx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfOIi3076226
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=; b=B/xXu/LgiVbB7mgR
	d5vYXO5JYtoToD4jXeNqzL68W0cQUznt1nL2Y0xOFpgBlIi5OT+3lXKtNxs/qn6U
	4OOrbI7WWzKZ76CMeCr0/hZ+BJz1Wi9QCg6b26pAkgFyRpNHXaNApMeAezw5Jh85
	e5j9e5BEbrnSM7J73ds5+6/6JHcZND3CIBC3NZhDiDZtnUT8lYT4pRRdGAf7B0KF
	t0XBTs8zeL0hTW1fPJANYmrX7H/OgM2lCI6FNwbRVwu0yCsxXmyKOJxVo1q/VDwz
	Rm+6yVLGXHGFjIb7jR+BPOhUy/V/xS1XuZ0dB7zj4blHOz/iE0OisptzQ0pRm1Tk
	uuLjag==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d45158d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 14:51:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84540760dc9so1672190b3a.0
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312688; x=1782917488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=;
        b=CxPb9lExJX1dIo69aRbYkyGI2YiplYW1aJn1gnyW+C16z87VRmCS0Z1f660xTqNW6g
         oEZnEBy6SrCxkXt9ymhLJZGZrZfUFt1lYj6bOM5HoFY07v8ow/x/qjq05JLUqET5I6Qt
         jKdT6YGUngUknUIR++9Rh7RrLcH+ud1eedhvmQeykq+dLJrwPe2OwEN/gJ8m7sg/eMdW
         uVhbr0SXNYb5QHhuYsH2uZD1aV6AnALEqRFAAuqYwAeoYROBX26PvrChMRJ/wGWtEZf9
         pomrLpKdug6+4uNHb/IIn4pn3mFiNHYYej8gnAr6dPBRtxqWb4P07qbb8bhxhJ1RPaD9
         vYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312688; x=1782917488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8XivURppudXZz+Z+GoxZig9m3FBNIfHMcPRM9Xb4h0=;
        b=Sb0Pv/ZRCQdDPIYoqIFPZO+/+V8DO52JHkWU8BFI0d6P6z/heH9qlSo0L8XUDXXzzZ
         Wy3tLwuacWJUR5WUEhChU9i5E3G8Tf0ueuHymm/KGwwcKr1+3VRzWQe1gEBu1JAoor09
         CbBRtRL8Ul9ARdLoAifLWX5R7ROvDbgBI+JI/+qiXpn2AMRXduH3PljybsDv1wl0ItFc
         AtY8ShwZLM6aQ2E2EpRGTnGZQhufGvO71lbUX+fUMG2tr98Ubhwfn3X9BxBYV8x1cubM
         1+4mq040dVkUV9xlfyk5t2OK+3oQOEieRooE5aFzHIYYv3HYuXmJtpMgedzkJtUyWqto
         JkTA==
X-Forwarded-Encrypted: i=1; AFNElJ8WgofmUcqJKAMS80gNTJOlLI/Sv1uHj3RYw9wZX34x8qPoXCsfKXMMBgHyqVrajG8hjXgzPNuwluBe@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk3KySdrlxlbimT1KpMTc1rcWzlXruvhF1NbosIr/NwP8B+TxE
	YVYKxMyI8L1tK08FaBgeg0eKeSHv/F7PiePTaazBhdoUH7CmRm4/0xvIXh8jxiCs9aAy7UBj3TF
	8ZLXsMj6d/OqHwEO/fKv54veBFgBwMXbTb+twfX09ThiyMg2QPJXNINJjbU0PLnvg
X-Gm-Gg: AfdE7cl7SdG3lHJ412rXsCVVxWH9aangdjM+KgFT1a8/j0cTiPRZ1ykluRBbcwjnH/X
	9MqPZVbNYRz7WS+NvH2Fa0Yo++oUUr1SAf9ewntzPBvbFhaGw218bONbFEcol6jIsrP8YubWSMO
	adhaR8y1TomYkKpblAZgM5XWZxSOO1EleDaP/gPlTMLK4A/JJvwzeFiFtI1tbAJAKLP/mONaXNv
	ukqYm3aXxCWXc4xkb8mHlBQ1e2lDhfDJLBbZ6KdHs9olJ2M4wF29oZCJQOWedouDrrMsmyDph+3
	3MU8flwWRF2iEQC+AsFGL5FW4N6cRCh8Sazw40kKZSttobVGrNl2s+W3wBle/jTE5TSwOkz070o
	dkkvX4536nJYyJDSF3IOcwhGgoizr9kWdPLD6t2NJFQ==
X-Received: by 2002:a05:6a00:b46:b0:835:388c:9764 with SMTP id d2e1a72fcca58-845952d9857mr9047632b3a.37.1782312688170;
        Wed, 24 Jun 2026 07:51:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b46:b0:835:388c:9764 with SMTP id d2e1a72fcca58-845952d9857mr9047578b3a.37.1782312687461;
        Wed, 24 Jun 2026 07:51:27 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:27 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:20:31 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-glymur_camcc-v5-3-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
In-Reply-To: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX0NJJ6s9WC6P3
 zHAOnbQmR2YKncKkmck2chg2V9UOpDLyzCs6hZtWeHSEKA77qikdM32clRvlDIkcfNNH0KaAjTp
 PbkPMQSIhALm3k/El5mFp5k+KwINpvI73caP8aVfUWJcbKzZ0N39kyKb4lJLNtCEp5NfCq0+nQQ
 2rckMhzeC/K3hOqmaJh83rvbKuHLX2VXh/qrxFN7x5nWhktMUtEWSkMEtrNWXMSh69XyUyEomG6
 z9UVSnzhBApMUg2WrnrCEAqlmRiOKtvtDVIgYO0fkE/HV4RvYhPz/emtgfct5fespjFqBWSxLph
 DzXQTZFP5H7itatwGW4Q47IyY96sIGeLpidBSnBoKNqtTsqPCa5k/p6ThSKFAW8LhGEzno2ZEAh
 4HS4Ryf0MV9lrGpXfZygmVf0jm8q5JpCPi7vSMXQb7/zgWli77BT9MVxoo540vZg8HZDpXmFFgS
 SUoS7Ia8DJB1jFQbfgg==
X-Proofpoint-GUID: ZE5fXwN5zmGzL54KN7hORUmSAnRtYRId
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX9K8sjoJt0dV5
 lFEJN9rpE+laE024Ce2gQhMaGgmDTHubkGI2Qg4/JHoowmLSo3X//+UGzIaFpflHXZYZ7ahOhUH
 qQ7DSVpOsT+KHbWk2Dqut8jQicN1hVU=
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3beef0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZE5fXwN5zmGzL54KN7hORUmSAnRtYRId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240124

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e9549d126aa50a0dc7a90943a3249..eb5cdb588e9aeea4275a0ba8e94d77dd608ec6e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-camcc.h>
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
 #include <dt-bindings/clock/qcom,glymur-gpucc.h>
@@ -4362,6 +4363,22 @@ usb_mp: usb@a400000 {
 			status = "disabled";
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,glymur-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,glymur-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

