Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4C472079
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 08:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250082; cv=none; b=t8pY/YZ9HtiQXpL4EBzdnEp+gCqY59tvQ2l8P069qx+DV4qfQg1loYw3XOTBp/7c6SRbV5v/8/c0DDV4WYUsgjoAlLMwVvUa4mPhD14+zxkUKN810vd6BMThOpSy7i9QyYP9JmmliT8tlR/Ua7k9CNRGPr8HNnKrOYfW/5xb+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250082; c=relaxed/simple;
	bh=2HAdXfiu/PLGPDRoUMST4Gy4hCI6iQnVrCqoLWrINE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRztWmlWb9Gs97h3v6ZkiLr+MJBIvdcx6DfKbfi/8GZFJsL2j0UxJ3tgqeqnfnvUi9UR+8InrGa6tZrLKGt6J9+UyOHs+phPcVgk1L1Th9Jtgqtw06yaS5rpGRt9TkVPPjXSfhSKTbMFH91F2WOqC4bgBEKIOvQFU+g1R4HsrZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIRuOT0B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BergBUca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIRuOT0B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BergBUca"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179IG41975461
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 08:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Kx4xrUiOUDymqdUMtgn1fESMMcXXP87VGRNfsBoVCk=; b=aIRuOT0BXDjSkFkE
	gp7r0LYTaJ+Aio5g85wNFMXLid5zAt5PibU469R9K47BBDsihpyQuHlhFR40f0c3
	X4Lxqh4FzrwR4xkBUmmEZkQcbs9rsQDg618ZDcz8JaTi+wJcd9mr3ImeP2uahPCG
	e+cGkTxiLWl0NCwt4+klPCXmVxGcje6tc4BOzndvQehuE/0YNwzGWhSE8LOg5jDR
	p77b8ikBSuvWVsikzt6HpnMQUe48z7VgajxBdBHO1+MQ1mIxcMKAJ63X5MA0yDCU
	51RIGlCHY3K8E7YkahELg61EhvLpPWkDBZ8T7SJagawIyqIJcKagqIh7vZRq6h+W
	nauPFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r16m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 08:07:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so132069985a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250079; x=1788854879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Kx4xrUiOUDymqdUMtgn1fESMMcXXP87VGRNfsBoVCk=;
        b=BergBUcagSd34OR4S6rZCn36Po2cU8Mf6RaGhBzvKBFI9tg++cJLQSeQk3uSQihO/g
         Vlv5JxAKnVmv1kO2g4g3uR8bVSupkA8Cu6OETF0IxizWUq0ijgKGuAZZp1wbMmfjUeoP
         YI72UXLLkPcxXPRfTDu/Tb9mALXu4rKFqWywxatZvwoXn1RJsY0TQUtWP1QCBCnwBrpk
         kalD7pbhyGct++pvQ0eIOWOmpiQv1in08z9MR8ixm9xJ/dxepXzuW7PR3yvO1P8Z3AnS
         dgP8oa//6CEUATZkkQUcZT8gUljfz1v9XqIivXvmQ99JpYI36WtwRivlkOwO0RrwbmEY
         fm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250079; x=1788854879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Kx4xrUiOUDymqdUMtgn1fESMMcXXP87VGRNfsBoVCk=;
        b=CekqYoXrTrLjAXsJaF3e43ZOtPzkWyWIoY7NYl2puRhjOZxP7PusI9/vVL+TdyI/41
         DBeuzA+//4wTgE+RC/EnZ5emlpzqDPRl99J533LexJ4Rzi9noxfvGGBYsIBrRm2bBSio
         hsn/xl1cAF8YO++6Q/QGmVtcWHYMxBDlXW/mWWVFMGzDmvM4xF2wsna5ky+nT9Pc3/fH
         HUl71Y/fRkRvmnMi1XctGadrT3eil8yvBUb8jhzmOiEQ6EXunyOk/VdzQMSx9ixblmBZ
         2Sb7rtlpld098/928dzPa6NRow3gxtIUvBu1cFrXOdnFM1UF8JwSR33QOITs3gWAzyrR
         mPog==
X-Forwarded-Encrypted: i=1; AHgh+RpZS2wZrFBbFay/1NGMYz3krdUhXZdK05MQSzwz88OJMVagwi0YKnEZ3mrTLYMb40uOGT9HckBNqkLJ@vger.kernel.org
X-Gm-Message-State: AFuF++nCUhGyzRPUzj5tpu/X2NLdXVhugtJuJPnFCsfIXvljQTkk35ng
	b4x8j4riwTSsn+xxIaEDnIQ54/Aed4hJCL+rbyrLiYaZ5CElmGyBykPvHFcSspjj9Xp4VrrTAoR
	GpfDyDIOQtr9eIjv4qltK+HwPztoVVdY5ujs/CkEpnSHB4bXsnaiQNOci7XRt+3iq
X-Gm-Gg: AR+sD10veZd1p4C7wcGRa6RsuynS1VhkACc7DMf0z30wsb8jlkYuYk2oWXr+8b/gjEs
	qSc4eGYG8oQw+Ip6ts3rnVBIP6pO3cIcImorMADR05uEa8XYEy8HlClHbOR7ykXYQwLaj/Naz6c
	Gz5V624kn9Wd2LRtYwSUv7MiN87X75ZDkoCthO8dYHBNJMXqcMTGrhnNcpa3YMpvc13j3KPAIDB
	Nfz9ydlUyx7lV8aUD/1AGVjlRVPzLtJveGFR+4swHxBaUj+Ndaz6rZWkA6bgag69iMu5rE9qKRS
	+vIQa2Yg37tABQztzb1dG9vK4LiSYEyxfkxeyVqiN7pxPYQ4tpMjQSb7OboY6UfXE5nB5Rpr2Bt
	/nAHax3XC
X-Received: by 2002:a05:620a:280a:b0:934:b798:c245 with SMTP id af79cd13be357-9394bcfb005mr460784485a.16.1788250079128;
        Tue, 01 Sep 2026 01:07:59 -0700 (PDT)
X-Received: by 2002:a05:620a:280a:b0:934:b798:c245 with SMTP id af79cd13be357-9394bcfb005mr460773085a.16.1788250078097;
        Tue, 01 Sep 2026 01:07:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:08 +0300
Subject: [PATCH v2 11/16] arm64: dts: qcom: x1-asus-zenbook-a14: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-11-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1066;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2HAdXfiu/PLGPDRoUMST4Gy4hCI6iQnVrCqoLWrINE4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe16gE4kJN5XF4/q8mcDKmp7o6EeLeiaHSts
 JmLBBUxA9eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtQAKCRAbX0TJAJUV
 VtPZD/9y/qr4QbGubvS2arhmPYh8wUouvVDruYzz3CEWQq7Bn8+lbQCe0Fm9QXHeh3XbRYr46WS
 U0sFzRY+eeNi4whip75Eig5WVjHO5+ONS3/kYrgZYSX7BgrY28gKwl8DTYdALzKEnBd4M/pXJGI
 vnB4AMlRjTSsKJQE0Om0SBwqKefFeqEAWD31e5FzswlpEBiSfX+En9zcOJsxZNo2G60FPq5Xj4l
 PlLHq8YKeAYgui3jpkdOL/8mRvriQj7SoxhlqnaD4WQr9z8X6ByrmwsLxfE3CxnESrq4LeURAMz
 teT3EaEp7rijsha8bumpknjtw0R1i6dcd2irnYk83PpAUnFAJj9Rq/JUZA8SochwG0Wx7JLkSRi
 7RumwmYUdvmIIl1Nf4pbMpBfYObf6f2LHK4OGGAuFkutNUpq3H/iyg/zulVOkWXBAuvvk8r55KH
 B3uHeajQuctWB78jCFDoDwCUCR3O4/U62mlu5WbUFvbw0pBBKzKW3bmvx9GaJnSpRXUVFipnX87
 7zPzV1AuXXPZYRJmd+NiB2SGQcyqe3si5EM58uipaZ+7yz93PbLfp5osuQ0tPFPJOr6R9GsjLfD
 hmQ8ASINc2xvSP9ZDxxVK+O1rs2tXsS58hfu9gWBgrSfZqHlpQ3cQ2INGv9BXvvKDo2SY2SYDOk
 vmEtKkd39alF9OQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9687df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=19dZ88v4spfqzsZ6lMsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX+EvU3l644lze
 JE5X2qTMrGlBTF6vQtd7thu8iAj52wEPd9Tz8Xl9xNNnzFiWa2GjayKwmCIwWROdf7wsIeWEYSp
 2zlermApzGjTtJllVXUKG/NrjW88Yg6Pwql+7b8epGqPDM4NjW4FWlyV+LyA0HpGo4WU6NI/V8G
 0yJ8jn5SCqBmoMePr3vA4DRtT9FTyWlPeNRs0OKREcS4PMbJxY98cWpak4XkEHEnvrzvseTVL9x
 om9zq5E5LNX2Yk8wEa52eaPpH3F3jhVTXNZ+zWh3kesRdrdXBzrOVZalSsb0MQPGUVvlJgRS6eL
 5ELP9NXCO7M6GTnYeCCUHXRFtQiynGPaPBruT98LO9AHeo+koQ/oXghmhWkZPX1yQYVk08W6DBv
 cdqR4RuAxy7zQ9EFGkudAwhYhVRHNnvNQriJxL+hbUixhuQ3TKHzBfrjXezAVdUz0QF9AJ8HFlj
 hvz6q7hGsyxNFpCZEZg==
X-Proofpoint-GUID: PRUxbff1-W8imeISbaHYdt-SU64PO7KH
X-Proofpoint-ORIG-GUID: PRUxbff1-W8imeISbaHYdt-SU64PO7KH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3URD9ZB5VfLS
 9cThOvJiBbSPwClXWcW2rkk9cXUlFSQjCmmt5CGMAZKpouMvEa70+i0ZlfcZWyCrG0TDIEwZEc+
 70QMpF10qzbz++uKz+sIVYRodlUjseY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 59cbbfbce490..8eb4c045b58a 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1274,6 +1274,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
+			       <65 1>,  /* EC reset */
 			       <90 1>;	/* Unknown, TZ Protected */
 
 	cam_indicator_en: cam-indicator-en-state {

-- 
2.54.0

