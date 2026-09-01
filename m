Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41DA473C96
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250094; cv=none; b=WI9p8kT64PVzb1PZRsHLME1n9HNl5mdwGBnquigOdl6m3ExNKd6UOlg7CtQJdIJtCeKm7TpYTB/M8rIvrkR/BqT5RKglJqa3uCzCyScwk7TlWDLMiy8jc/210K2VHyWYM46Am+vQkfBY/hYcBuHXycyVBhrypEpwIlGHshSxAvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250094; c=relaxed/simple;
	bh=4SWTpgyjUiHaL+RbPt3tQXyxf+WultQnhEb9/hxXaYk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sRgK4jIrPpx2iojge+pC3VmIoPKqB3SIHSBakI+3oEHQnG86ipwQjxhCrQT2CMSPqx26lj5sTjPxb1Flh/0HQ0WSSuFVGKptI8V+UykH9iajQIQnUEvU12sL43KEq/ImB1Vd1Qz+6mRBLdgx/gVZ56ryyhAJW74bNEbbJClfa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7dTiL4z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cAf8/1wn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7dTiL4z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cAf8/1wn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JPl1709562
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/OJP7iD7lovDK/OYZmxbRShO19pjRQJK22i3lLe+Es=; b=T7dTiL4zTKYx5mwx
	OGqlW14DUCz0tO1PZMR6nwv6En3ddf4F/Y+uCI7mxDO92C5/MGTPoTXGyFXU4jyU
	Jj2A9FVu20XjKzySpGN+UZzPz2hbZZbVt5zWG55XVCYIAIdQ3zR2xWTxKpNZ6cPo
	4iU9g84Z2MNozb4Sm0HCUE/ViU7cWU36LzEJdmL6oHfrBhXqPBZ9zUnNoiCFpOiU
	E3ruQjYZIGZ+gO6ASe/HbMgIMyrfEqoSb5Si1Vau1Vo7T+644ABnPAMQlFoo3G5S
	R5jqzwIskMYHvVqdN7HOeYCglv36hEXl+n0KkMIdGjb6hnxheZYKf2BdOpmij55D
	xHqP9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs5m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:08:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef13b61bcso920217985a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250091; x=1788854891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/OJP7iD7lovDK/OYZmxbRShO19pjRQJK22i3lLe+Es=;
        b=cAf8/1wnv0hEiwP3yKwUTyvefue6pR7wRcS1Fo9QjNmtDe3zLmMIi6KXhUsC9vIqFm
         waSmgYbbIVThYqBC41dimMVKlSIl1XF65/LX7fh/K65CPRGpNI2tVhzS6hJxUTlm1fHI
         Fg9aNS4VrNAWWfM1HJHNhxtYaoGV1LR2SIt++7CDzUhF/mDQFvUSKYkD6sDjHNomw/wY
         cVHGOBC2d8rb9YtC9XYW/BE1Gu6CRaKQfk0hL00iuaHNs79jBJDyS5ql+TFcdfRQF6jt
         4lWNmUq3DjT+rFS5hs35ADpHXZubZsS31wd45NoJgijWayAxcbqgsyegCOu1SdcYYffj
         StBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250091; x=1788854891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/OJP7iD7lovDK/OYZmxbRShO19pjRQJK22i3lLe+Es=;
        b=ICgWyrd3BAPwYqPsisATcuFTEr7LHfFY/50v6BGEwfT0uYhTeu7LP1Tglp5y9LiXV5
         +oMMUKNED6eDnqoWMvDZbx63YBkMYHQnOLSQ2dFkc3dbWGW0pVI1DlrVV883wG6h+cfl
         tH6/JV0IRIl7awOu8a4ScpteyoHzRanF1F61JeP8SjvfBUGnD3Sfw8jSanEMKvVUm0U6
         0Z3/oGmXq16pI3kDdQkQihap4x5rlBb2FdBJdYOuRCw7G8YzrR0/YX6DmW/ATKUEx5gw
         rFa67WJtt7ot76GqaTAyGLDaspm2L+jpsX37JjWnaU72gkn1cfokJZ5E1HwzKTRJp7YU
         /GSg==
X-Forwarded-Encrypted: i=1; AHgh+RrNK3DybGInc5BuzlI6dUSqdACaFROjzMZyJkTwiWAwdpAusQ6Zru94zM/lqn4TTDyfhhzFzdk0yhP3@vger.kernel.org
X-Gm-Message-State: AFuF++kUFvRC7/e3Wlkb9Id/xHCst0e0UKn9LAL7hQYjPPLA7lh5DjQ/
	LO8Rc6Q8eLM7nv4gH0qHVeAyajsYvXHS3neTmGSW1NCBuqOb1npX4GMwBONWi2NSNXCFrP5vUnI
	7XF71wXR7t7F1JAW1IbBS6DIBF7dm68xXTxCqvzmJePNSnELIO1KpZxkFRMiSNMdl
X-Gm-Gg: AR+sD12+OliIFtvy59F/FKyzrB68m9FpZDlI+HScaUIle8Vp1H47isQqPPZNRys324S
	9VSpBVTGue518PWBEGFHt4gkyEmmoMCA5mw+vM0QWIkmpn4uJ1cgJuItdLgw/BHo4hYIkwOuXnY
	GuzqIrQe/A+hlDvU0pXeR4m42RMRTdks68WDWX94PPPb0Wm5RNK6o75ILR6TVDKjn8Gb6CKqAiu
	mkftKLBpz8J9rosSU57CavZQZUZDtCnlxELEi6vTzokvKTqstLyqv/O4w3xmH+8O+dpilmHLuO6
	4llLLQdfGSb2ZSnKJOzgZD56RHc0u7WU+q0xbinjIieWfJOKvluqS8BHfk7+sChjilqKtHVLWts
	cTrNy9F6M
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr4316705385a.3.1788250090655;
        Tue, 01 Sep 2026 01:08:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr4316696585a.3.1788250089967;
        Tue, 01 Sep 2026 01:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:11 +0300
Subject: [PATCH v2 14/16] arm64: dts: qcom: x1-microsoft-denali: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-14-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4SWTpgyjUiHaL+RbPt3tQXyxf+WultQnhEb9/hxXaYk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe4j2NMElSLSKG8HNZ2lJmG0SghLoUprtGMW
 Xcyl5Uqw7+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHuAAKCRAbX0TJAJUV
 VrDbEAC/ruMzELke/b9YL0JOLEDL5T9u7r9FIlHHNq/11MELV39cWqVfJbKYaGCZyH7r9fe0KN4
 brN+0S6evcw5b5Ema6TH4IMlt1ReoWAyAwdMoio9mXpyTb2gIIU/H5GBxBUrgO7XKlaigkghaWG
 bPao06vM6jyki9+JYHDN3OLzlnmsM/HpfuEyP4pURBAl4B04rNQZBwooX5HbARxctqZFwzs++KI
 +MgjOHqABx0u9D7DUOU3WWCqoxABRgKNrjYUcR92dydmOBln6f9J6mFGkA/ZI1r/9fBjn38rHdh
 pJrsJmpKl8fbP9t1GfdiIce3l6BscDsdmkwRwcu7CbpOtfBhz5+1UIpUiI/BOAKD8jQ2unSLRsY
 x9ZCtdEA5lWSjoyYIwXZ0D5s8H3py5K6ocqXQeCuLU8qX+aQS2W4MZstblKMZEpmO/KGk5wKZHd
 Si0KFUvD3CRd8wIx7dQjmSpJqKli6DPr798irOh+soBfitmHm06yRLfbEAAUfo1FiKI0UUpr7kH
 m/YDqycVYBlQ3U+E9HbF+BdRptqZhuo4w0PC1WoW6KOvUFzg44e5CBC09vUSsj7VYIodsb11D0b
 Fbt70r3L7CbfFyxnO+1hJQz8VblwiCp+28uHNjV3OOetguPb6FgxtqwN/F4XH9MI9nenwGwUjVb
 rSKKyIDAQ/l35Iw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: TLbeEF_QuksaK62VeHL0UP3lg_bXHaxq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXxHGFeVqr0eMP
 YUEQ4UPhQFl9S22eq17yZ8eK5ks4RmudmGjR7k+BQWJQAVSNMwv5tcX1KYqzTwwNllp87druT4N
 b56jerWFo3wgtaIHTAzBFHRl0O8SGJ8=
X-Proofpoint-ORIG-GUID: TLbeEF_QuksaK62VeHL0UP3lg_bXHaxq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX6VaheI+fIbRq
 S5aeJJIkfWUNkQYSlgUu7dqbIsDrlQokgTxLpuSKvKrkPcepWihYg+FFusWJWDctuEiqQge8o36
 cv62RFJdB9GvZyjyWscDX/E54MhH8wuPezhdbxUpw4Kw7EGQW4LboMv9CEx7J2Xgryn4NhVHAJc
 vhr6iPIQrVQ3p3FZ4SKsE9bL72S4y+Kqo7Ix97Ex0NLKAvNGGla4LwGj9rLYpt5ByqqM4Bj3v+P
 hgXJZF2gzj6jxS+0lMghOgrlZrRTJvVi9KuQOtV0KUMYr+8204+foUNlRz+7MXRZ+b6BAeNXRqb
 +54gx7kY7TkaWE41L9oc01FQVjikjP66TLdMr+vqm1/8Vq/DQNCAhp5qfcn5O8EQJEK4oVwYmmW
 wfaR5pANDaam1mqIl0bjduB+aQBcENGpSPEPY+nqRP99tPGr8vpLiKuMxSgADX4MEujftwO89si
 cNhMs+Ngr4X6dyeakmQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a9687eb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index ce7d958ca687..ef2684e23a09 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1109,6 +1109,7 @@ right_spkr: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	hall_int_n_default: hall-int-n-state {

-- 
2.54.0

