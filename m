Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC965293F7
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687443; cv=none; b=LRfd1kCtePxActRYAAiv9XXx9OKR4F1JW5TfbljlaRrx3NM01rMVx2zAibq0Q5yGc4oXFtt7CF4CSZ6KkZhzhO2TlHDUT88R6XO/g3hnhJHKu8rzuNX2Kep5nfg69aAZWMX7lWB/usBj3Ju1miNnxlJ5AeR2zgGppD8Uob1B1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687443; c=relaxed/simple;
	bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sCp6XlSxNU+wQHcdvRbcibAI3Dpr7QCMKHKhB/wTGjJpwACHOr8BUeybt8nqIs8lA0d97ZYI1afplU+1MWJmjGaud9Fraz1klI9soENKCgRGmu0emcFRB4hN5cOTBr+cT3rTDgWwtZdxBb/ZcMcZQoYYPEC52w+NPc1YsqYvTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtxTDD3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7sS12Ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtxTDD3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7sS12Ph"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqdW63936714
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=; b=JtxTDD3vOv5Eg3EZ
	74SW4nZDTmR5v3LuNgsquWaCmI1NIQdU4qegJMnTIYqCwuHKtDwNh6DLzM3zh+jj
	B0CDbneX5meq/rTsE7Z6iN3aEVcvIhs3F0amJq3q5WGMApysNQ12sOFYLWr5NwTS
	U2W/7nI5dm/pxffyQCViGRVR77JgSJuAP/fjNf8khRa8hBerry/yvlAOnxVTWZcm
	jmDQ1n/ZD87ElOn+f3hQ5gjIFrkO/df0Lc6iC2GRfDmcT2TNUr8gEty4BMzgkd3e
	0eoK7qILGkiAOpO8h3WdbKyTOuX25gVZw5xyBC6VF7Y3ov+2/w639qsYwRRgfKRS
	hmc9mA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gmm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:10:40 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91431adf55eso75516926d6.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687439; x=1791292239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=g7sS12PhuVymvpvde+Jng9clBqsPyCuOFQ6Var0XlIqB1bOYbtIKGomCx4vAOkacFI
         +khjj9fCRMl9cuxFfhCqRzFas0jOBFmhzgCVx2rbBHT52GxQI6r108rMlZn8qu9NftpT
         Px7nzatbzlqpCv/itk5hITU5VXJszRp8rNAaG2435hUcZc6Wh2KE5jM8SR4xTvQmEvKg
         e8snkNFi2JpqfyMtrc8HwZXjie+zGzO6SB5ZAV6j/S3wHlErvirX2Zef3DW1j3SpVgsP
         QCvbtpW/kskSUHzhm14t4sL32vSnbSs1NbkkxqCgbHfamcA0ELDIRZiUP+HghnvI5Qe1
         ZZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687439; x=1791292239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=Y2ptrmBYz0mw5o6Gi+nJTiGQHM6gMNMnD36+YQJgMRK53X+gx9MXFNkbFcOqeYnPUx
         pwBe0UweWH74QKx91srqulM1FwskqRDHrkRZonutiprHL4GoSpjKNTWQJvMgyzRxfai3
         x6BUbAxwhkCo1LHYnT/JELJ5/lV4Y0K10SjIobb6yViKIRX9Wvi4L9BXUm41EA1P3yKD
         tUPD0aEBcvQvxYftzqinh2RL8Ea9VtWna5ARR1xiD8/qAZZyS5idqE8H96vqvGFRBkGM
         u7bTMfjaWB2TvJQ5clLMzXnJfNmCFShKKl0/y6r5LrBtgfBKhPiRJceo+CSEe3RZuIua
         HG0w==
X-Forwarded-Encrypted: i=1; AKwUvBwtKIIy3bone8T4AkOdMxBizxv6l2YTqr0E96RkAWDmdm/+PCu1VvRWTQw/QRJulZOkXN1UyQOrjqM8@vger.kernel.org
X-Gm-Message-State: AFuF++m5wKG+t9jT0FD4qb9mgUJs2J1KBEG2eJG4heZLEiIcZxISemTS
	pDpiic7FpdtebJQ4h5X9vWh1dH8FUJ4vwBhoTnGrOVY0DwGFEzq6WCpA+BDcIu39QoWTqBos0Fh
	Yo5pcutPPyg0TFZe/m+EfBQH5eXuMy8ZWPUxA6Q1hHWPCRNkBoDi/gtE+62xXnOx3
X-Gm-Gg: AYBFou1d3pp096DyxoltsuZ0SrF9XhQI9cQDBWgHn6bdYjeeYK6ke0r6ICE2pJKGeTU
	mWmrINeBHP746B5rhGO1zRg4UOSm43JKG1F5l1nOGT1ijIikYGkNQknKbDLgU0ItEYZdW8rLxiw
	A5uD1TgEHmM13sCGOqYlxUIAUNtSgOziukd61L9xLN/ZcFtlISH+ws60SlNgn4lrma01g14t4cz
	anx2JNUMtq/2qTcb3P4G5emcPKmLCpUWl2BuzQCtxm1FfELFOa0KXdv5EyfEdYqHZ/kM9kfF/YN
	kFcpFb+TMg8zYlraeaRGLNHnPkgRKrORT/o7B0vyC8svfKPRoKzUculUeHHqWly83VLIwKNnz/6
	8X8YBVOy5nwqA3Or0sBlo6sUw7Zm4fjPosPo=
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245699206d6.44.1790687439107;
        Tue, 29 Sep 2026 06:10:39 -0700 (PDT)
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245697826d6.44.1790687438088;
        Tue, 29 Sep 2026 06:10:38 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:35 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:39 +0530
Subject: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1258;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
 b=XhwaVHJnLjC/IgFYYs+mIbCRbw9D2kBck4SXpR/pnx7zD7aUsUa8z6K0ZIgE4nKO1zU4iPrkb
 aoKNmoN1I1pAeBy4TRQFW1W3TlnYAaJmRwB+3n/j4KUP/o49+T2NKst
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX45OqA87uJSyn
 YOW+RZ4StY52kuDyb0Jv0UAkkJSQIUh9wCSZkLE687TBgZ61+wCPV6DB+EKxrgTp+MGO4lORRZy
 kS1KeNtivJ50R6/NfgfN7Oh3ohNVf1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzHwE+hnQzAv6
 DrVaq5GwHS/yoBUxBdegTI2rIRVuAPtWqD0dL5EIpXFfTK5r6eRx1HV/d05xAgeFjczwt3PKa+i
 bN7qPc7buB4V8cCzPPsyEC1p4rGtgL1lYzjDHJgYEnZxri0CVWa7SFpszLUlXgM5CFxfi8Gk1vI
 F9vfNMznswG/+zw/cH+NJNNyu6LAH3emAvK4k8M3tRxJawYE2QP6ng+Wwk+u+g/V0WT7KEnx3S8
 MBLSKqQm6Gyxfx98oLuDEWcbVUnW8/OqOYrnR/AP8DUxFc9nwdH9Jy5GWLNAbjH8bgfOI7Z2rrX
 NIEZaQ1YGOkI0UlW5d9JWsemDWMey07Yc0gNSNAbkAdtwp2sshGJeFaF8jv2z3rFhFNdyFKYoiF
 irhFTIJcsvXt0dNAAst3rZnJrm/Dr23RyB2S9s911ciESoXmG/8J+3J99pIS/GtQhDbSTQ0rpuh
 +TIR8AGde8G/THvowUw==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbb8d0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: fBz7Jbq-aDauYh76368-4zuIyLgR1dnn
X-Proofpoint-GUID: fBz7Jbq-aDauYh76368-4zuIyLgR1dnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..52b5fc1ef9a3 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
 	};
 };
 

-- 
2.43.0

