Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787A4756A7
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250101; cv=none; b=ooKNpoOV7jjZOC9obJ8wrN6iKOe07vxlO/lGeynrYUTUcYsEAl8bkZZUKPEJtG9QN8bm+Q4Bb8K0ygnZmQXmhfKde48mkNuazb9idSH26EHNPo+ZGllY6pTTkgLQPGFp8CppbaauZ7ZYgh2LE6L3HdAhx5NAyeGKnAAFareEKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250101; c=relaxed/simple;
	bh=mFnQq/dkhM5tvCdOWiM/nzdrS6jwO2OOqJVDNp1Vutg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dkbSx+OrkRZuctMqAjZq1ni6J1bTcYteYTsikGfP2wJuDjUnRokiDqTUmy8TrcNcEwbm/kyy+feDjkQBzJDh9iX4vuIFgf9GFk3Y5o75i6zOvSUqwW7mMffbzezNHL7OJcC4uc3jW69rDBHaSMSGmEhe8ycrCImR/VFsyDs++6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V70YMhVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXzTErEv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V70YMhVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXzTErEv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Rd42322005
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlHMFxXvr8+udJbU44L/P9wcmn5Hgtnl95h/oFgGJ94=; b=V70YMhVuTKZk4yA2
	s4vmsJRLDvAP1Z1DrzEQdAbntGoHwNcJAk6zu+rCZaq5mJVkAUkC4MHvHBxb5QEC
	zueJgPTwWqXnJy41cMNZqG2V3x17OwIXSe0k3dWYiXSU0ckmukEvuq85ZgXO9gcu
	4USEivlmRlFzmBTeI0cTzD/2DZxxUZZrL2f9W/0cpuK21q2J/jgy8WaTN/PJiuKu
	wTSFjzudYnokVbp0sXLvVxeyiU1scC4iAvDuMQB1eqqruy+UwCbAwtKfbA7q49+w
	CqN1TyPL3DOUHnaesmZha4o6DJQEyMIjLF8Fi3V1ZQrzJ1JafwFDlluM8JdBx/In
	VLPzEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:08:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso125375285a.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250099; x=1788854899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlHMFxXvr8+udJbU44L/P9wcmn5Hgtnl95h/oFgGJ94=;
        b=GXzTErEvwSTGmOPSNxl/eQxRQQyBR/4MLC5Uf1BSusfkIrZwm/CI4Y1fifSLTSnbIA
         fzPyK2p1lVSceZZRwmS4awZwM3Ay1PVH3pDbzC5ucz/5l5lxOiwiHhibbEYWjSyh/eMy
         IYleshCztEyCYtLyubcCMphKJOCyTIwJasAGA3q9msOpiHUyzB9TaOn1n+xK8gGMbhiW
         II4hDnIGF73wLSMTXMIPYPc6/ywFUkW1mImaWjvl2bntFVCiERsvuf6qF0GonJvcQme6
         tHA1wQ7JzuutZq0/EDjTnEyy1Vg1ax46ppfFIYUOvietW+EkuK33TPplb9PuAzugNrmj
         d9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250099; x=1788854899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlHMFxXvr8+udJbU44L/P9wcmn5Hgtnl95h/oFgGJ94=;
        b=Qg8yaSZ/oGKt4RjURUQi2kI9ImrbthZjG/ADD73B+R/aLi8lE67uCnNWoHGkrih9hG
         aLqTIor9RSf+H8i5fU0LfNDw40RnuEcGMl0Prxsmm82iZZ2XZo5iKHn8Hxkgp19lL7eO
         jbXyoLJCszfS/cBPH3uljMrp2fTdT+4hLoaG9/Hp2g0l5rYuw1tMh65i1enert/DmF/U
         2pigjgLtgJVm2nXIgRH+ODe0Dt/UznqoHW2uEQznE/4RBxedV1ZGg//KP9gNaLBv+8vv
         jpfNmHCUOmP1mClOPpdYqzOilBCmfx6no7girGUrtv9540etuuysWR5VtuW1Z5iwTdDa
         MmuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR9FdDTXCMz7ONEBFAZ1Dk3GrocsmtAoA6rjucqEhrv1p98tK9MDPKmBvvtdUl5tUIVe+vd+QjIdPc@vger.kernel.org
X-Gm-Message-State: AFuF++lXzGYIyGkLXoRFJynGwd0xnEEdjCS0XQ/hXaFIppWJgUYeFGKt
	+tcjx21sF4Do5YOEt0asRgZJ604yjkZQalwBtdTAkbb+gDAdULvy1V7zGKXYxBAgz+vcWWZ864B
	aX5ZJlbxRDyjyAdi54458dt2DF1RbzISoaTinSVnL2oGlzpVQ04YrtkRl/yS6fkUM
X-Gm-Gg: AR+sD12IaWhrkeq1Nl7ya1TxDLz2PX/XotiF/Ik48Ceh/Rj68BiOOrf/ARnogFC7kFv
	ym5DyOMgPmK1p+47pEdciMAhDfuMU2xN0uzlFWRbbkR7v5IVItLLuy0+bI0hZww9iGDCWGWaTMt
	0fVribmyK6hzxQsM5cQPZU58jvHuGuE+L5zA6N1v4rURN8AsWXB40Cmave6IjjAqdlRcZyjSN+L
	9B2T6UahVw8mfkLDNkeV8QA/HkVHMzq90CfHB/KjOO5Ymvvn20QLRlbJQdDM4L52TUgwLcEuXGM
	6KNbtwM4p+9yh1tmkAXI/ojpsJpIHS1PB5rEgdIJbH21hJs0Zgx6SjbbDmIs7/nEl3+/VH0K3bx
	Wq+pet18W
X-Received: by 2002:a05:620a:90c7:10b0:933:ade:2daf with SMTP id af79cd13be357-9394bdf41e6mr349020585a.18.1788250093585;
        Tue, 01 Sep 2026 01:08:13 -0700 (PDT)
X-Received: by 2002:a05:620a:90c7:10b0:933:ade:2daf with SMTP id af79cd13be357-9394bdf41e6mr349013485a.18.1788250092897;
        Tue, 01 Sep 2026 01:08:12 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:12 +0300
Subject: [PATCH v2 15/16] arm64: dts: qcom: x1p42100-thinkbook-16: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-15-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mFnQq/dkhM5tvCdOWiM/nzdrS6jwO2OOqJVDNp1Vutg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe5t+uJjuSbwW8jZbonfsLcTns8trwwRP7By
 VtT9R2BOcKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHuQAKCRAbX0TJAJUV
 VnT+D/0euFYTquHFjBGOVc9OSG4Hs73zhv4R7JSYuAwrFm8VxIo9XFOr5FjXPi1XhamgDesNOkg
 sKT+mdXWsi/umVvm480TLMgqcSayIBmrKmwSHrIR/9gy9ULn8Pedm6IB2MQgg2UJfR7HJdn7Gqa
 9kUws7BYzmomrAvXV3Zl/CkjrUkzOMWoltwarephbVbXnPkbKCBen5hQO/j0qv9liiUjenYCpi3
 umNw9GhAil+kiP1wbtezVpFtXfxRjBwzpP9b75ILq0UgLDJ5wUBzYQzRLAU+o2gPavizs4FQfPm
 5OLmWnQKQdwHizOSwmUKlHSe5oKwn7QvOyRxsmSeObfrLtKiuFkTu/QmR4Vvks1zfUP0Iume6c9
 Lpp0wish2QFNjiQ/vWJawylrGWOqCZjr1gbEFnYASZr80Q7+BiXP2C0qBjdNsbqVSNtl2OZSswk
 QYUURRZ78JITjp4T+51kLUgOrULn+dYNM45r5heDMfRtP7O+4Dt3EGq5qhX5KzozHlLJ+dyDK6X
 C8Yxar8cefWbg8unvuaayu/wNmojJuExIMl4M+9TADcF+N8FNo2dCSqzI0TlRflFbLuXOLoSqv/
 YIXrKjvYZRoB1i8a/NVWD/ErZdRgmcI3x3Og/G3pwkGRZkkHj0P2iXqgCWFHf19Lvln+KIHaqoP
 wcxWYTJd9x/WxAQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Wr523JKYB2lmCPn0sEVmhgR8xM8nsKQl
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Wr523JKYB2lmCPn0sEVmhgR8xM8nsKQl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXy46qRy2YwBl9
 xifVkWageTvS51osK2e8Q0M4kHEVZtP5SwFtAEszqHEycszkmujw+Ip+t2XM+IHAKRE4aAJabt/
 hLH/K3QJuv7VvG2YvbNMPQzRVWOoE5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3e9KmMTTjeWP
 Tp3BPIvn7cl1yYz4EhoDdY2XC2Rtq4OkW2eH/hUH5qc3s89lpkkbxcuIV9Us/pNje9LyDrkUlgQ
 QaF2R3wa4PbCLACIUnQ8J/pRB9JYEvrAogU+7ZCqoarUus/7mYnDunp6gkIOzn6n3OHzEWTQ27q
 Veom8nCbfUjWA5SHW0L9hVuOnF2GzUFnzcVyDh4I5YUqAcXxvA+FH9/1Z9d0m19FApSGF9Fnjsf
 ubCo/yT3MCMVek9q/LC9yXdX4TY09KlvT2ZKNrkRlYjnnGqSxDeLf7tuF6TgPqr9w6VBZFftKXA
 kfuyvg85uHFRx6W1fTWehAGsQTS+A3QzaFnaLc8MsJKa1bBYIcXgkgRB2yNfKYQU2cUf8ADIOMj
 FrXNvDai83Wz78daisjnLlCoa0Qqp7IWYY9IjrSY5dJX6lsh7Ldykep36YgVYoJoFrsR4+csTOE
 sxNPb4UMX5vkiO58kSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: d3f600dc452d ("arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index c2f21fcb1b09..1e295741e676 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1327,6 +1327,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
+			       <65 1>, /* EC reset */
 			       <72 2>; /* Secure EC I2C connection (?) */
 
 	edp_hpd_default: edp-hpd-default-state {

-- 
2.54.0

