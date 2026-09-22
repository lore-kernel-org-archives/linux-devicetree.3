Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECFD5208C0
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063520; cv=none; b=chdB6UrS/xDFNQNTtcMeqYCg5UdXzcgKtv9TvrgHacKNR+G3qY6ARccxdYoSRAL+z5H/mRknVjid4WLExGSgklP/cFZeCcqtaEHJ76Tu8iL7xsFN3kt1A28nZi29eZxBPHcYDhiJfIk9Y41VkpHvJ7eogarMHlJEUR75a5lBoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063520; c=relaxed/simple;
	bh=Bhy9uqYX4+gKeObZReLUadqVPipO02ki+kAIFU9H1L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pVs9VpPPZ+P9eEiJw3hrYXTwmJpNJuxkyLkA3D31Ko7xYQG3q4oyUidAZrcU5hw4jXqk5Pm3E1mEpVgZPkyKeiHhQ3r0mUGgg0UQDm5dOAudc2Ni6HGw1/jMUt8OJPuQu/tmSLSS1Vbjd/DT5wlBtEeUc0L+iqr+4ddB8S61ePE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agCtbc1m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FN7ffLJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agCtbc1m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FN7ffLJx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M77DcJ3677780
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJc80BOBZPqITe7DVziwRLMQd9BH5/inm/c3YM8mLAg=; b=agCtbc1m1MbFnEVc
	T1YAs8YLGkZITq4JSpQFyT0YnES/oQ0cJbGA6j4aUGvmZmQTtwAoL3nTkxELi0sK
	+oDzhQO6srQeRZlNIg+wWasf8xSMDA14ii4N6w4H1jSvaYq3/dfx8rt/buOzNtDn
	qNx1VL5LonHoNxb/5V75rSC9pFr3Dl5GmPU6PNRrwY545a67VldQg9FH5rq99tDV
	29DY+wFo7YSj8qsYtSIURtobaDl8lg0Lw0jGIFvhAzYm3vJPmkQ7Yj+OszFnPMRT
	oesUldVMgwNCU5x7fzn08LpH+Y6wS2B/b4sP2EZxMtbnJfQN+/dXCxJ/8uSNFvNM
	hiULcg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vk3qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 07:51:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so118984985a.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063507; x=1790668307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJc80BOBZPqITe7DVziwRLMQd9BH5/inm/c3YM8mLAg=;
        b=FN7ffLJxTktM9qSOyHqLFjICIZwTS6iMPL+BsiBNiLhLqLksmJSU9Uycpt+Z5MsQbu
         ndvkFpLUTwwJD6jGszK41KjGMk+xtU/vnBVVoQwfG+T0N/KAHgXh2+mpNRvtXOo9QzY6
         Eh983jWzuqJSKPwJFyAAoKWNmJS/irwPCFSpecoZS5E7+PKeTQQFXC3ZYUhbmDMH0dBb
         DrMyclnX/zWQOzoNF6KZkY/Ux33CjuBL4fi4TlczDISTiMWT907SHbAlCSCt12MG8aAU
         kXU4zU1IMbv691x7RVamr8h+kqtwdqDrW6KoUBerrcZY0ZpJlvkb1b68fUPKs94wwXDk
         WdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063507; x=1790668307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qJc80BOBZPqITe7DVziwRLMQd9BH5/inm/c3YM8mLAg=;
        b=FyeBiVlA8zWLiDk0gDYNlcePliaiffUs0XjsU0K+SifaHVi6hunq2F/jAzeRIjnQ3F
         d1rT0wAZIKXQl/jH73KgLkUQX9aHIjXdGI+IRa8u8ety6cm0K42VIt/2F15di7Iwep+J
         z+Puvz9FsNvfT7TtB01TLsKNhsOYqUcQwXAKsXXtFqbFuxSBIlOo8Kr/kkcS4VcxJ6pB
         JzNJc/7F7v+4UbGKsO3gOfP+QZOcjjbQWUZ6PbQqMR+7WsXFhmi7m8xDsG8ZdipDYaFR
         dA+iotVpEarhe0ugEyAeCOt1DJqgyO1esacC3pyLTGZbZin2F3Y305tWjgddZ/GXbiGn
         KUXw==
X-Forwarded-Encrypted: i=1; AKwUvBzqCpcCUNSZuVK52T4jcIi5lT2Udq4krLyPHJSfLwT0cM+OX7iThbzmgkgaNf39tfKzrni3IohU9qLi@vger.kernel.org
X-Gm-Message-State: AFuF++k2RFa/ZkcU163GFkLRflcCf/Y1dDgh/umTEcgepYpBfYKMaj9F
	axeg/CAd3kt4yzJ8ufxNHx7vYoCe3jY2sa8FmAFF2oZBBdoUdUibTgJVcMPq6kHjyq2LSdAgS2H
	y9lxPc2p6skr15n6PEA7/h96t29PnOFpg7vQxjrmIdfxsIP+VY/jxIOUEVzVJvaMG
X-Gm-Gg: AYBFou13leB3Ie7P2PkjIJpzdJmKRue1OJIDLUSahXhnU2Cmp2JqMkxa+7awrDQxvtH
	Agc3m8ufdYJYzATSXrBoYJVmImMjvrmW1R+MKw7dLviXXZqypNH8MTTKGxjH3S7wkxF50+lMCu2
	mAfgJIcCv0VVk7Jyiqf4WYr0on3f25HLYaHgOnZvGRyD5E2fDXHq102fOoUmSKAKVzgHU+ZKmi5
	SkIPuZT/Hud2xp6wUFP8op9YrYtPj6s7dX2gq+MwR4C3jiEikPbWoVsT4rpe0RoGw4NwGG/o8B0
	yE2RvSoFBanU0qexWqMgL2NHaWnR8jGOrkW7XHW4iS9AEUkvoG5dkgXz1KF/IncyKvU1i8HGKY2
	DbO6GWgoT
X-Received: by 2002:a05:620a:4112:b0:93b:fac5:bcf3 with SMTP id af79cd13be357-93c17f04695mr291160585a.32.1790063506659;
        Tue, 22 Sep 2026 00:51:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4112:b0:93b:fac5:bcf3 with SMTP id af79cd13be357-93c17f04695mr291158085a.32.1790063506144;
        Tue, 22 Sep 2026 00:51:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:17 +0300
Subject: [PATCH v3 08/13] arm64: dts: qcom: x1e80100-qcp: Mark the EC reset
 gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-8-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bhy9uqYX4+gKeObZReLUadqVPipO02ki+kAIFU9H1L0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN5ghlseSeXiZzY2rKvhIaHjhtGUS6fMJOIr
 MsMHf048meJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzeQAKCRAbX0TJAJUV
 VoRkEACINVKrnTOKZNo5OXlkQfPxHr02976ncJHgAfjZc4JFm5yrmUgOILQrV0FKDyIeABdRpZk
 FEK+WrPO07TXzPpCG8J0SrAEuuBiOfGpvjisRZtunw5+BlkhHd+rM+l7PbsW2tmB8qHr6fh7r4d
 tc0sT/UGKXzlGCVzY8bbPHVEUlHuHON1SbGtDohn3P0P5pY3c+kop6GoCDNDVjmxCDz/hom60Wu
 921Bv0ncnKmp9dZ+ljMx9QWo6udKd5ILvEAB/t5NYWgn8pilcX06tKSP2ADwm7i3YE1+fooV9du
 SRUPe1uQMcRBxOUjDg/xxCGaB96W6Fw95SISXcCRhvYbizKCnLAibHrJsVFabZP3dhB73vfxh4G
 1xDCjkz7d1j9TD1UJTBNRtaXecVLo96IUoGEkM3lj/wRZtiMn7slDh+I0FSQROBZDDxIsdklyRD
 qKpFkr1lCtR70AhOi86uJYTcNOL/CMbLOX6VWMNjcxU3b8ptch453c1Q6n/gI68cKChg9Ycqbko
 PbHNwdahzbbIfbxAmKNch1j+tCQhX3Nt+Fo42STMP8xuBp107odCWc5LaovZASEiKteVOztH1pb
 Qb5+op8wWLTB1aBgpsplJdOenQNE0eWa2SEDjdxie+OcNoHR2lwjiFjgislPef1yxK9elIMNEVz
 VjfMzMzNfCYBlSQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX5X48lrpBzlPc
 faGxP9ubwk3yy0qLceKYeASkOKIbGoHBUv37/IXfLDFMR5Ii4n4Sfu5dXJ7j4/GbwuB76tDkhjm
 VYU6dTqQdwJPhPPLhfGhXJ1psONLXUg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX61v7BNqeVwcp
 iXuu/vRR1/D4OZ8jThw9fPg/smzNgCN2BokOI1peVi8/8fhXJkmaklwuz1/l4c612RYPtbT6w1h
 ERMTsfs5/zXLEIoFwNXCETPfnhecuGEJYDooh5WddWwjYtvitJc+MWmZFSniIsOCA1cBhq4Psi7
 FpRyYnj+snBhiy4hcXFAyunoWaEIlu2dgQe/HJxm+1K1fF2QUyfIVDG8B3iDsAlo0Ixo+v/XGiJ
 ovuc4vf/LpFZfNEUBZ1LD253+tClrWWMn22jkL0NnWXk0PuXez7FZcNppHhZ50ZO9cPD6uw1kTx
 wsk4r2W7sQdi4FVIWfwtQqeD7RXZEvs5CpNtUh5z7vgQR0Ule68ms1DjisTNSV3oz/nd3hLpWik
 6qPwL12cpdupSAmt6MbvBu2uC5EQKUux/7IUkyUzrGpM7T72Upp26VYdQ6ESExQoYMyb2fY4WBA
 JLrM/icvt4xXVuU1sSA==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab23393 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Hz9TZkmbOGt6frmL8bMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kJwU09o7D1MKpIlbtd2OY_Trt-S9rQdh
X-Proofpoint-GUID: kJwU09o7D1MKpIlbtd2OY_Trt-S9rQdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 9d4fa442d158..65f0d3b14419 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1201,6 +1201,7 @@ &tcsr {
 &tlmm {
 	gpio-reserved-ranges = <33 3>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

