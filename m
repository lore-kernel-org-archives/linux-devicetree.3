Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F386D5012B9
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687479; cv=none; b=YdvKNA7i3TnJq4FS0/shMWOVQ6BnptUOT0pH0kO+D3VVX/3zWX42wvEuO6Dhs5t9tzxtIRVfnf1jX7JPlAdIddZJRJIZv/Ea2Tr+s2OnwUqzqceGgYCq/3rfZwJBjOj/IAsbN0dy2RQ7Jk8p2RWlSupbNwp71ZiQSwF+l0qbddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687479; c=relaxed/simple;
	bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yr2hfHNMRmJ6rf19XXRwwbjR2EOsVXT+nRc4+L507Q8h8/Vr1JNd/FAxtGLpe+dfFHdngn6VXaME84KzhkVAUlCjyQMUrKaxMzTZeD7Kzn2zYOH/QKLBj5IxF82T4MxZZ/D7ozJSrLlk2MYhrjOTICyTHm41U0e5ggdKQt9rRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgmE2TMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBktHKjb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgmE2TMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBktHKjb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqf6G3842780
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=; b=HgmE2TMJoVBA3FXq
	VK/2OVF4lA2Oq88usOkoAsIxRMDj7uIKfxGrg86AdxE/+Yd3wXd5HZDt0hEOCnZF
	6Lb1kuWqwexH5VpjoDiz10LK/JMExNU+UuPfZSHnoqZfd50bC8EjCKqgh4Pnblvx
	f5f/5lNZRZNmtgVqiV5/dAf+z9qwVfWhnTHEi42slxGVOoGXNJadOMqHeGJLpYfx
	mPV3iAeZa+mqD301/rZcD4ZYORNRH7pMW2BdQQ1XXtnp3dpa/DBIIpy7T+UP/z8g
	INcxQDgElZGFx8MEo0YZVfBP47GU+Fn+yxpAAqzRvMVi93KLan9nx/OwqJJXytB/
	dgjfGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0v8tx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 13:11:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914321eb48eso80614396d6.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687474; x=1791292274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=aBktHKjbAz+3HpvC7y9YTFPr5s9hAdboFBGjEAe4aCHBorYhN+pLBHetIB/t95Ot4A
         ZYvEPN58bsg0pjgFF0kvpRYzOMjDPPfSDXsjB86EyKL9sSRcdzwO73AabugYKJdz6+qS
         /gIPXtQOHqWYoIkASgHmlN9xuT6jCaVMZvRXF6RG6gqaxgCTgB61rqza+RSPykKXSicl
         edjyN4/btwG/YjL9wSyAEn2LhXPV/KE/XdFi/u2DEY0yjLmHg7pRP0a3Op0H8Vjjbr3y
         cQU/fAyqY9hB0YIlOU3hxvI++2u7kBoNsojCrLLXM4qzUynEQexARMeRWn3myQszi6Qj
         iaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687474; x=1791292274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=Of/mGT+cZNyIO9pDFgJlcHn4IthNT0oMqRwcQhl+5cls7eOkElNj98byG6+EUg5KiW
         DEFV29Q/jlPvhkPIyJSkxJquliMVdJDsfNoAyUeel1J06ZO/UVarQIPJA2DxfSGOHGo6
         Jr/xK7rWgOS85AnHRLdnxpDKHwp045tQ4alGDf4penY/kpP25+XzQWqdo26YUSvmyZSH
         QTKQnCFj6kDGKCME045peRodeXcSZlLvbcAdu+z6zVSGD34OnjrZKNYJdxaJ2/mfwLfB
         JEa0JsfATUzhUp+CHoOkYOfoFEqUcozCTlPAtVSStEIlxAmWmfKCWRDbMHU/h1YLJ1z9
         TWWg==
X-Forwarded-Encrypted: i=1; AKwUvBy6oUtaJaQa5wZcckdCAsZk7M1PAnMFbF41qIm/IarGHWioTzwdj/1Ss2CVinycv2RBAZ8KSShGk5sk@vger.kernel.org
X-Gm-Message-State: AFuF++l9H1M2iGOfvHXSbFMU5nlaa+MQTe0O85U7KmHdNUgn1XyOVjc8
	ZF79MUvkjQJrl2IqyT7/tr1wTockwiMJgKge23IXhZA5Wa5mIBeQnF/chPGkdpeNXP2JVkLn8nL
	xz9qcaS7QHLhueOjbfjGMdYWr/LXN9h9SEc8rnoBCRWtRIAbrBjo7mZvDD9ou1NyZ
X-Gm-Gg: AYBFou0lv/dhU33/oX0K4IjWyTZorcpaharljTVCLfZoT5ajui+WNJGF1Du6/aV+Ipj
	YcuQNKbQp/ugp8soHuCaBDQBQWY5+DV6U2Kjz/yy7DxRzVZvHARyXiA3FQTAqZZAzY7BLIoDjwI
	I+00Lq0BYaZz+KEzZq/0/9K64WJtl8DKp3tERZlVjEwasQ/CuIlEqNGMov7/+yNbiBRfR0UtbCr
	D4XMMizxBwM+XWMTm0Jr2VwfdK1UweZitcKjszzblkb30b4SFTjEIcBcAB2mgAh3CUxhEh6jcG3
	qK+SjA9LvhC3pVJmynUbd80b5uy1fP3Z0RqZeHvO+x8Ye1atn5sFCscUFK2eyrL+5hjCpR+5iES
	Rfugq5P75GTqYeH8M8XX2gm9+De0/WPSwCVY=
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11896096d6.3.1790687473177;
        Tue, 29 Sep 2026 06:11:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11895406d6.3.1790687472624;
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:44 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-12-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1145;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
 b=D5j/rezBI+6woOgH4Aa1XUrZtzWWPHx+aHttGaTValqJSzXgPUB2KFniFLy6aQPzTvUM+nEG3
 IntmD3xUVE0DVf6LBfXZVHe6DoHKkbNWzrcAM0Oc3Aasll7HiO69l07
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: -C7ccwxJxIdgCrZcvnRljZro6-fQJIci
X-Proofpoint-GUID: -C7ccwxJxIdgCrZcvnRljZro6-fQJIci
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abbb8f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX57LJTIvQuvoV
 pFnwiMpcDijcDlWfbio+i42D3FukupdvqTYaRqWczovINgOmso/2JyslaIUHtHOVq/9gjY1qwSP
 x/HkMsxMsQ+cJLycKkM1pT4tsUROZoBCuCOtNaYwOYzs6/WhSkz+CZYaQD87GPSOldzIVsOVYyA
 YLLRyZAb8YQj2X96QDlPxe03/0XS3f7tQycq8uoasoNW9JE+aB6ZN2CWWhvDtieCemLC6Bx5DX6
 hekvYq77WzUegU9kUavtFVr/9w5HF/xRAhjqEtxBwW0Oti7hu5yNGfxN1pH9beGZ2B/WpHUZuOm
 gzBqjcZ67ruf2auXFONwO+DASkiNhjwipSDM9aFvxJ9wrgG23zedwv14Hu38DavhrOeTINSWPSQ
 Lor0Os1J6JaErCX6wCGfRue27cliF73XcQHDHP2s2R4Vm8UG+A39utwwyEMfae4Vy0SU4IFsUjo
 rQVMhc53mGferRfsalQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9dlqUirLBuWl
 Q96SvESsW7d1Et9vZQ1IPiAHslgNglf4vLpMooNncuup3GJpuKW93ToWc1/5magTVcG6BHb8gBD
 Ksc8rWnAcGtR4MSf0qJxfWXQ+rXoDS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

