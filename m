Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BDA278156
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472160; cv=none; b=T2jFGJanrLLzEd67jBH2bqRdA0JjH3uR3k5DMeqfmzL9PXhdATRFSfjrHrnyJayPs/f1LIFEN0pbNMJraI9PVlZwdi0lxiDPhdjAyRAKz85gZNZo9tgIl5QIWICPLjX2l2QTsdgpipckOlU5JuOJTCX+yrikTMvFQz11Ob3t6Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472160; c=relaxed/simple;
	bh=dkdKTWjiIoTpWTw2AnmWZhkyXS5KUPx0v9M2CLb1BG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSi4QvbWNqjNuIjjYk14/YsNFTKlc4Ju6bX2kuoBFzOwcBnOs8/Mo55vBqS9IMuO+hhhKNnlyYZSVME+w6fpOqEzj/FMvZC5yof5VpFJ0nZoB1MwFB5y/cjlKF9DdeoiUqmcHgLYsAMYnzkTi0BIfkiEiZ9NUAD50vqRzF1Z6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VLZjJxj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PescjT4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VLZjJxj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PescjT4Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCM1hv2485210
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=; b=VLZjJxj/JU1FlGZ3
	LbhNAJmxDwhPSJwT1rl/GwYebs6NikvrXWml6YXWqlGNwCcYiZW6kr67zaQY97c/
	YqIAJ3Ev3u7g9KcgwX4nopQW58wtv84ADoElTAjWRZ3HBtKPnsi1Zmxc6JhuZ/lC
	xdT2huGaGI/bPT0G7QnXjts9r8b7ovQMWVMtmiWWAZmtJ6zqfM9k4/PrwAJBa3Ic
	LVmvUJkpc62Ui0BCauCrH69pF6O/dSlqUoFnMapz0m4qLi1a2yAdMXF3lYWijxxh
	iRmyPIymHcrwJjo7lsnUbF/upnbvE7Vwz9A0M2im6mjXINKN02VvUMRfWgSf9lTU
	ywvbCw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx90d1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 14:15:58 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-651bd07888eso25498602d50.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777472158; x=1778076958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=;
        b=PescjT4Y++ynOS787853EwpM0gEulvKkszTBWEqHuyJ2gmIB6F1itGonLIhCep3V/F
         fBdhpCdtyB/BYNs6lGsvGKiJM48naiBBfz5HvOaK0vT2p28Pw2d16XFvl9bQw1WT1JH/
         8osWfuFJ1CvMGdrekBae2LHbi6Pd/U8vO+1kfmpgKrvbWR3eGJQDdZJrK76BLTF3JE6/
         tOElTm8DF8E0vN/4u3d/zN4EiDtlRkjQISoTOZfuhutzKj8/eI2tzUbEDp1ANtXL9jW3
         72RHrVnU+Px8HfjEQ73o4ly8o3JxKBdmKnkvt2ZzCiypFE514DsLf2yRtHCSw5smFI5o
         ahbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777472158; x=1778076958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3q7UrZcoQZYqRZ20D+aGIiNqFtBTOHUCnCENhBsFVo=;
        b=hG0eEQ9N6eqbh7Rr5vtDK8+/jG4cPD97bJ55GEsPEwjbyBcqA6QQE2isFP9Aeqn+9u
         LJg+GSBsTIabOv7sjcDOruxesqaBwu0W3DBQ1lmNlr0s81JXGauaGhxWLnt6MhdETqKg
         FSrc/vXf3vmPuFslbmWyHjCtOsk9ZsiYSx642rJM4JBYW6dIM7kXazJn+hjpN74+P7bG
         SrclA/EXoOI2uLgVAqfAaamJLo6mTji+Yw55jn8DXjyxqWvuLKrT9ej+nCYnUK6IVyR8
         WAEMQY1Mh6tLetwFcEgSQan9OgwtV18B3YbnoCW0+wzOmSPxhRNyuJ6zPLn6e4Va7Hcy
         ogyw==
X-Forwarded-Encrypted: i=1; AFNElJ9wqBVKQls01WpnHD/XEETpUfZZ3qXAa8S8905g80sjyBZNC5s7Aw5D8Vc22sVsCbZgfGcpoVTxYNJb@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJs2kBrXSxUdU8xlb8ONEX/QgZlGHc12yTgurPcXraSrUa3oe
	F8QOkTt1rIRZtQT84tidWXHGAhfdNDj1/fI9xYDTCdNdyLO6zmBlsKKlFQTAkz39+2oQn8mkcIw
	+bk6YIIyBuVnY5eZcePzAC6JX4sAGNZLJbrU9KiUb+66fYUkOQV0TRKc8MH+LIF3W
X-Gm-Gg: AeBDietGI2GinLWEaGPwctroHSjA/6G7Ip+4F0YA9JRGy8DeCNBfFpIp9UzlOmtBiGD
	QZvMqHfCESmbZi5je+Oebv4xFrJEnWQX57KRE7J9GRfV9/rk5ARFq4rDqZeRjvgprJ/IuNs8X7L
	3FDBFQLz/LgCe8l3eoSnMzXy9EpDdjlKYTusiFScjoyMe3cDSy5ljyZJTEpRdComi08macKp5FG
	VV4Khh9s0KRxSMtEPgZYcjQ2UaFlM+nJ4OG1wrf4s6cLLDtYuVmf7XSHNhThUAnJwQ/12BG1yXC
	Ehi2pfeaWPU/vuHbEc4kufrYWdHcpbf0kFpWMbLpuk2/g1LpdjjBWcq52tfKRqJJJ1Wq3wkzYgC
	Ve408YlHXJbBeMSspHyRywwC83qUQgtcC/kDONDCYTyZHuZVVq/khTbbYYVJKfkU=
X-Received: by 2002:a53:ac81:0:b0:656:25e6:e107 with SMTP id 956f58d0204a3-65beed51765mr7084481d50.3.1777472157585;
        Wed, 29 Apr 2026 07:15:57 -0700 (PDT)
X-Received: by 2002:a53:ac81:0:b0:656:25e6:e107 with SMTP id 956f58d0204a3-65beed51765mr7084413d50.3.1777472157021;
        Wed, 29 Apr 2026 07:15:57 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65bff2c2eccsm1379533d50.0.2026.04.29.07.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:15:56 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 19:44:58 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add camera clock
 controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
In-Reply-To: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0NSBTYWx0ZWRfX2VJ+hu2Usazv
 KBCe97RHN9M2XlAQcHMhrBtnp5wzgi4MWyQ+iqqusV2aF2qqqIM8HyxEknOqdvmDlS+OwZZwYwP
 s8PnLgUv72zSSSh0BcYEoWJurGiu7n2fHJyPX19T+zb4kt5X2ZgZdJr+PAD8wIcLkxwplHei26c
 /Hgn/v4jsgyfXcLoVNbO7tc4iJNEFz1qB2/mbpaQdjQ52SMNxgt8xao0CQLT7T4vvpczItQAC/V
 qVmM4rsdjlKoqFZo1CwAmetBLd64J3LUQr1iuSzZD/k66rMK3BSG8vpHCSpEdhwgT9+SbzqSPSm
 exF/s7mxL+CahT7eY98S/GaalQJQNv6Rhy6sEgcdkunwJGeWfAQxpAnEANT3soUjGcQr4iowdcQ
 DcTn1qYDDzNE9BHdc/sNu8a6oxGeDO+05/g1HH2wXUOFNnBQo2Z5V53AwCONA0s8kF3siOZsmfz
 mCoHQ6DXYE3UYiaGOAg==
X-Proofpoint-ORIG-GUID: m26nCGpVmrfhLUZPgP1gu_DbLJEZ8GDs
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f2129e cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3iLwGWznUEgL9WBE7MAA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: m26nCGpVmrfhLUZPgP1gu_DbLJEZ8GDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290145

Add support for camera clock controller for camera clients to
be able to request for camera clocks on Glymur SoC's.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..8e2a872988d1c3d97506856e2e5325646db59746 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
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

