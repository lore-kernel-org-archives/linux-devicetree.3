Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981800;
	b=Z6M58xd/rxuXbjx7rG1e6o9buWwVwcKfv8GjhjfUbfBHlObdVbMDDcLfb1GkAWfGbAJs
	 Fp1yFbFEVmCr9pGL9QY1SAjz4k7DRxWJ+ywegoOHAhK0qrKKxcurYHW9x3xcbYmXLxeCv
	 FNhmp3KniZxIMTApRrXnSGgSbbqDfCPC5yN5zEy9aCkLVqWQP84hQ+O/emHYnkj6ENvOW
	 LVSf6FOLzh55IKAquFg2zUzOurXDnlA2kXOXFlaO1EKWDrTTYIVz9Z0sm0F8N2IFRCjSq
	 slVis78Q80N5H/HRYMhgPfJpGXTzhK3Tr6MBUdIjX+VWWu1/3C81LNfxqNLDunKEFjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=LWeOKt6C/lZzum/GOBKfKMUV9tdod44P/9ZK32kzXVlHo976TsjlE1zcuQi6Ris8rvjP
	 bo2DKEfm+/CT1Ip/Eh+NZRp4Y4soLZd8u0hDPOSZL54OyrmwLgv9TDSzEaLPlq2QDPWBC
	 aTOu23afeVX3HM98vgNWojJMnIjI+UOZqpQoLRwcqARRXddzVcJq3fq9VDeYI8LeVw/+p
	 udO3AGxsVW72msC3bTXhdkCrDREpolT1aRJGpS7mhpcxsNP9xiDc8mm4ZtPy54J7Kt2fm
	 5Rco81Pr/eWenWngCRvLdmb/08iNP4vf3F/1EyxPigzb+xZc1Ui/CiybJuJfxdBYw9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKygsBqE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcVvAXao;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D475606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D475606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKygsBqE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcVvAXao
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmIA3371230
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=EKygsBqEsQzDW286
	tT03SPglrOUIoulYqIuzHpEu5MlW20/dEf+6W+VN4/r7IuXLHFP4Hqrf3i31U+bO
	Bvnn7107/uhMixlJi6mCc32jIJCJNpc59WrXf/upDybP4rhs3pr3pCDkHI6Nib1i
	NtKairIgV/cOAmJJl/V0p4kp/XHs5RPh0M5/8blqXZLNLW/i156JMp3FEP2XGQKi
	wp0ZUbSW4/5NhD/hnQW9FvRmi3U95bnvyEeiDa3/5cn7+12WqDAuUQtm3LtU+xUe
	rJjZ3+MpaCd9jbZtG2ZlEzXx3QXYMbHiqNXwX47CSikb9cnCR5lQ6KU59gf553wU
	D/XVMQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sevx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 06:03:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so7935105ad.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981799; x=1795586599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=TcVvAXaocsauzxzkvx0D6ro9G6UimTqHnj57Bnlp/w9XwIKTFmDDGro6GUyM4xgc4Y
         FmQKWQ6lu04IVVF5QKsJoGTeZdicEhuaH2yraS8jmwCh9S1Jpg3tpYWVQHllF6w5WVkA
         2DTWQYfYHJv+ytQCKVmMK0xJ0cq1Z1/FeVyh/L2d+mSIiGVdLm6MrnF0UMGDHOQXDzdI
         SRqvMT7ASak89kBpSxXbyaxvyRFQ01sz++RqHUyYsloREuvHc53XvsvXmuQMvZAtfmqt
         rfCU3TUcBhXQEAorX5Q+nhtuVi6NzB0fvv1xA7PYH3Iy2K0rU0mZrnTuRi99SciMOCRK
         Yu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981799; x=1795586599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=ZBwkaY3YiDUREnYzPKPxP0HKf94+1ON1A9+czsTG1iOxd82NTAQwSCYXnO5UBdLlBa
         2f23gx8+LjBLnEGnco8JB375A0eywBOtEXyTHv0T2alLzrKE08PVk4eeZ5KBcNM79EAH
         s40hahdOZjnsrUh8rvP/sf1lz8ytBCvckeN3keyoELja7sA+ajVRQlv+fS7YVnKccg/9
         4ztvB8V3TNOKJVMwEZADhD33TKquz5U14FOQRflH1gDF1SHkGrTVnmlhfWZdMnxCUe7S
         9opKzcjwPJ9n3ZQ7pKCFTCfhzBrlUU86vEr7OatIN5C9xzZ930H8fEDwlOPoZXbtEMw2
         4zJA==
X-Forwarded-Encrypted: i=1; AL+hErFc8DLAs+vyWocWEe/MQdfZ0x0MRMY94z85i9CTmol5NWT8iHJ7mwXSurD3DYCofmBvL2Be2FHbbmdC@vger.kernel.org
X-Gm-Message-State: APuU4Z9FIBw1tZt/9xGWryCJkP1uRxuN0OP1BphNbBLIGq4o6C6xqJaT
	B+hg4j77m0o427dzemkgkPU5k80rH6IfbIbbDJ+mm8Jdch/f03OYh40Asd51zX8cSCmjvwJyw8g
	iJ3qQLMxM5ZVfHvsJ3IVcNSm9vM2T41q6w5XvbLcutcvIGubSkZRhOOngw1Ng1tBf
X-Gm-Gg: AZFdTZcNvcQYkgVaKKZAxs3/jlRk7/Mj9/WYPlHC1STuRRGnouOsd5Pq89mFbduD4ls
	z+AlDnlTfgl+TtmCWdxlxSMui2GInBvUCX/r1/agP50D06FtM9sIzRV3dykLrw6cO0sBCZGa/Hy
	3cU5TJuC5Vn3eQL1HVZUsaWSfx3fNnzfHaKeR93d/2XEvJ6arJYMCdIuX8k31yeMy9G9wPbUXW0
	4E5ogY1fl6KSutKlajgCU9TGsSRIXD7gY1mVVu5zXS55y8yFlqWW2RXTsnmoxfLdZeU5i0usRQF
	h8/np6LWcMs+75MQFqNrkkNfug6BSN+n3WhfY/8Iz+Zir8oVyt+arlqWtNTSTaXgA4CY9J/9F8+
	F/2V/saaTLKgVQt38/sShhSNik6jtVeRoDnAxreqT0QjXzWYXv2OzKjWBX56xcpF+gN05D4QoLg
	==
X-Received: by 2002:a17:902:ec91:b0:2ef:dfbe:6380 with SMTP id d9443c01a7336-2eff72f34e6mr17388425ad.15.1794981798971;
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
X-Received: by 2002:a17:902:ec91:b0:2ef:dfbe:6380 with SMTP id d9443c01a7336-2eff72f34e6mr17388155ad.15.1794981798497;
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:37 +0530
Subject: [PATCH 06/18] pinctrl: qcom: sc7280: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-6-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd3fa7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: IDLfL-y8Vakk9Ktayc3jS5SOwM1qJAcF
X-Proofpoint-ORIG-GUID: IDLfL-y8Vakk9Ktayc3jS5SOwM1qJAcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX5Lpz5MbF1XHA
 +4O6giE3sYFCeW1G/ygduQ/QHif2x5oYhlgiaJSXoOEcUY/SuQ4fSLA5HPluHbG4QgLAAcL+QhW
 Bg6OO0EpytWaJ99QIMWEbbLjCkRtxYjU8FPiP1Qe9pQ6or7uwNQlXybHSMvi5eIsaM/f29E7Moq
 HM0H16GqS+b9SzxrVXVKBHzSsiUEZHPAddbYGWYAnbPy3e8M65pqLzm5ngmXjtAJgK00ow+jTRl
 LDeRMurZBWoj0C+36R9x3mYqHEWKDeEz4dxMh7aAdBSmb+2kVhmgjBL+0qkrpl9jU5zEjHhLKy0
 YdaMsTupIBU1f4umsVtKOGgjfBavPDMGdSCB75SDw09sv29aTt5N27jhfncd00loZ04ZFPWggyi
 VEhQNCH0W7OCxZCVfffvxW+9par94xy9EYb+9UHczC7v22vspPrIrr5P0bKb6muQ2q+2O5Ln3MM
 gb35dRsQh/SfN9Zswzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX18glSzmmy0Ws
 CyBkSOg18G+DBHWmHl25wqccULDdsZ+RSuM80V/n6mPuOmX1rZ5vRywM13rSwUZu/IdxABilaOc
 /rdFrA34m+Ptgb8Asxk9gsbHndHV2S4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180023

Add the gp_mn pin mux function on gpio60 of SC7280. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1

