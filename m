Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F944CAF8
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070657; cv=none; b=tDHHNtCFLzA0uF67aviVepifpxdZK9sfa9eWjjYbdsWXsDCR2gURoxhEpUMtpemPltPdXSBsxQdFaWXsCaO8zlQYxQVCt8OaHSN6hvlRNdjO9D+bao4yt7/gyS/qOM8rF/hY/DcFPxXHU8S3FVt+XTTo9LTDtk9aWiB7EaTsjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070657; c=relaxed/simple;
	bh=pMD+qtq0eSt1F5BVDv2O5eMKZDQLYY3B7GXUiSmpVF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJC4qbx6rEB4FConu5G5kkWKGriCCWTj3erRudUVuqvxgWKpxv8m6C1qIbPMpzzfA7Qg3PSyfd4Dk1TWsBj2eGdNgfANfSCDTG0EMMWApRAow9I1oDnNYB5GoEtBj/HSv7hH67qN80wxKfqHyh3IhS5yDD9fjOUtTXSPo1uzBi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyN46s9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bgfxE680; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyN46s9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bgfxE680"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5Pk73036600
	for <devicetree@vger.kernel.org>; Wed, 6 May 2026 12:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuJzY1eI/8oPfBeCGjJdm53R6qQTKbxATapWq3XNg+w=; b=DyN46s9dhJ3cBgci
	PtMjLznL+15aDHCCr/Qn9pqGy9fJupL+7SMQ9jHAW5bDtCwbKuRZmfj7hkaWm1Ai
	nJVx6s5UhkcYuyxEdYAyhLs9791MBj1/XVot1Q6FNvuPNHKUHMddmE3rAw39p/6j
	2WxHoh1xp24MEjrGAxBQkawRv8FQaffT/KbRN1zuB8occ84aZg2RdfbZLrAgwJF1
	dweg9N5bn1ErlY2lAw6a2b/lc/I05yRqyMWCznt6mPHmzke6eJ+9EaAY7j0iZHY6
	nKaxuj/bu7ZMaH+HtUzNReubrT8Q85Y77V4ZG7U6kKz48wdLcIP5UVGBlxa4tLcn
	ALDGRQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf02fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 06 May 2026 12:30:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf01172bso174961851cf.2
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 05:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778070646; x=1778675446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuJzY1eI/8oPfBeCGjJdm53R6qQTKbxATapWq3XNg+w=;
        b=bgfxE680dzfcpTBG8zhCzkfwCYkhK1yLSSq/PLPqdXL61Z47IbqMSDDfhVF5pvzFAL
         1jDS4VsgG0uLP+p/Zm4dwrLwtSyezEkC1KxR0jTTO2unF4DxR7hAfOcmDqlFlhHffgkk
         T3d3KMq+zhTAJEqHh1ZtnKiF9d0PgetSoUhP4yA4mWjDU5jhtAmWHb6S6C1yDvDoDus3
         Ske13RmAtyMjx066qcsITARoPvJGG411IPQMQyJgvsIEiUsIc1hupUIo4bDomj6uoIqP
         QpvPDSlQ+ntaZrzB3xMHZKqEik1Y41NtgseTE+jupZqoJiH/Z+22oBRd27i65GL4zKbu
         biPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070646; x=1778675446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JuJzY1eI/8oPfBeCGjJdm53R6qQTKbxATapWq3XNg+w=;
        b=GTpki6j4MRDZZFIl/YOZ9I7+DzKP/8+NJSs7VgpN1D+hFGUR8u2DIpJe2d/1kYGus9
         9ohKYZ/OO8xDTQu4JeiqP+SB9tWX1502NRjL4WMhoN4giwNhPO6/WOI69EkdLyLUf+Q1
         khfxcYDZpYZUL2VyaCznW5bhHGg6/SxFfAD5L2LXkEV0P8AnPDaylLoMd40t8LQ1PGLM
         4DiX4DfUB/gwerBJBzn7paG0ni4w/QNcsotBXoAAVVmLEm20k6BW8n7x8Wq4IZz/Cken
         9noEn0yJ5hZQ+hWDBnjOineih3CFeDFRoW1+fW93a0hwgLlfScgUCV+cKWpy/kPs2Nsq
         GkBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/eqXrOyMm8NAJCqGfGSpZHyvc2IP2tKrJzPlX4dqTUgXqyqVesvWV+Tja9G3E/X+dClVelp66it3m@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxu4ayFqI03rBD5iMMfW/PHhlJrBwOxYGhqe1m05+xGSplJYzV
	iEVhIGRjMR8dOINaxrjTlj/o+5KQl8wXuaENyPUmOrfpTV44QZhPPjif4FwLmzW1WUDfHSKogYi
	iELKXTqOvo9bctnFAffL7EhFmtW46N1TrqNtZSzIhCIxnY4yVRsCt3qFryVxh1ipJ
X-Gm-Gg: AeBDieuixKAu/hxwJpyQnlSpco3Qqjx/adrE5gqIk8W3uMxkau6nsbwgVvV0C/WX2yF
	GLcm9DlzUJsgxs0hmut1PUvSrK9Mf2bgEMCh6duj5+KqImn0el2DVdXD2DwZzlV+LyfS8BmVvF5
	zV2nKJ15zbjqvNgWjzK+7PlIGy7xGzBeXiKFzkHT3AKgb0n+zlVZy0FtKOr1hKJcZjby5PYa8Lg
	LmhBoGxxnTEkZ2TRwv6R5d1jBvjL1IIL2F72QpqO6sy3wJvrQUbTnhogMvr8V31ERP1Jt+zd+JH
	PSPLrAO0173sWMrlZr2f1Th3gFGvb8apT1odk3cusSCpIawJfsAYNgAFxkxcqXRrROibXPQSUq+
	vcr7/n4WgSA0LN2PAXzSzuknyfOdKjuPl2blLCVhwQ/mzKA8quwVGSJk=
X-Received: by 2002:a05:622a:598a:b0:50f:783d:8cb2 with SMTP id d75a77b69052e-51461e27337mr41354191cf.26.1778070645585;
        Wed, 06 May 2026 05:30:45 -0700 (PDT)
X-Received: by 2002:a05:622a:598a:b0:50f:783d:8cb2 with SMTP id d75a77b69052e-51461e27337mr41353221cf.26.1778070644681;
        Wed, 06 May 2026 05:30:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm11855464f8f.23.2026.05.06.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 05:30:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 06 May 2026 14:30:28 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable DisplayPort on
 USB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-dts-qcom-eliza-display-v3-3-9e46401f467a@oss.qualcomm.com>
References: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
In-Reply-To: <20260506-dts-qcom-eliza-display-v3-0-9e46401f467a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pMD+qtq0eSt1F5BVDv2O5eMKZDQLYY3B7GXUiSmpVF8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+zRquJFhY3yl90HqWbvzEFm4I0j6rzmmxIBRT
 rq/5VxWgcuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafs0agAKCRDBN2bmhouD
 1zBiD/9mfgwfJzl/oiY+NT17Ybi7EHhJj9boqzHw7UkMVeApT18NPuiY4E0w+PQ5LKYaS7O7S3w
 qMsHXWCgoFwOO1XXtjCxSMGOi7n0sDMOLaQ49SL14tBGLriVgli1JkluKK1I1ZMA98Fb6ONEEWM
 W5P13YPX9ZygdTJyDk+CVXph76PSQMAIYIuva8kCqaur97g8H5g/SQHf0vuHXHZzddbplS21egk
 hBgcdvKH0S3nv8xT2rk53Y2TbwiHoab5zEEV/SL6q3928/T4btHRZPLekYe38g3kr2QbIRkVb1K
 2MvWR12h3C1+vUHtNwZB8WEaCINyb/yIr9MvsU7k+09SH02umASjetkXnk1+YTobAHr3katwwjL
 aNLTIOEtStq6NDgpB65wjQaz9nnL33fYjqTokgKgF0TtaWfq9i8/do6u2jXt44fVbDathQ1DZ46
 qAV7J5mwheIJX4o1u+63Tx9pRoTYwfUINoxPvBwmruNN495fs/+LRYc3OT9+zI8pZMBKGXd77nA
 K00xq9su2+IHIvRSbnjVIdi8I7A8TjMGcXbNIxoJQ58AxGqlO/QQOa3q3nWdkWLa72iGLL3Wo5u
 d674IN11T7YHCHdIHZXCY30lhMzxAFLzYDM+X+99v9jhKbE0HStvEb1cbQPVo8dQzDO/cEYzql4
 0tnLsrAKdkKugYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDEyMiBTYWx0ZWRfX5Zxo11o+xUeJ
 yTNDvPfY0186/+XxJTWVDR3NiUoslDa+RW9bMndxyiielY+xUvldFo22Vxi/VFDJGZrd+Hf8NAA
 sutdp3AEWKHRDnC5ecE0l4i3CXML/v13wwbvS8c/1+NT39u1IjrMlR176C43RKYkpCmbO1Mnynf
 FsRDZl7GJqwEYNIa4Lhj0NiGBWc5tlTla3zPREkzdbFXbCMaRUtiPmjYBmhuYGfDx1n9McCYwEE
 hHcXhZaJXfdl7e1wKlBFNTHi3zsBirfXKqzRZfh0TsxUeAu8qAQO4t65725F67FrMdEFpVbQYp0
 /sfkkBsxSG06l/C5ZIWB7+57IzRRmQCyijinKryMTu+HPFvsm0zK7kF/71ac7NZcCZymVeRW/NO
 zYjmgP8F3Ef7ZUzO6vbZPqcN9rduHLLjItGwch0/DlBwh8BS9cA8p7GzsImeD5mA8ItCIvRr3Mx
 OSgkcXadxs2Jjcov47g==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb3476 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O309HYtxkqMLGareKSQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yz9mcGzTpOTB9h7UQqzRigLmoF9eMEmK
X-Proofpoint-ORIG-GUID: yz9mcGzTpOTB9h7UQqzRigLmoF9eMEmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060122

Enable display on USB DisplayPort on MTP board with Eliza SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi    | 1 +
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index f0a390107d5d..912cfbee552e 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -421,6 +421,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l4b>;
 
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index f22a8090ddec..0fb153da4dc5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1010,6 +1010,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.51.0

