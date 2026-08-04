Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD73837E5F5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846129; cv=none; b=OyNkY1DFj2nnZWuDw7MjtnwMUDGIaBUsIzY+S2oyud7o/x3tnyBchNHHOWV+wpuY5vRtMTzecjrKgpBxaxfP/JmokyWpmfQvTkW9mQic/aRw7tA0bTnHIZ/YzklL3QqsfiQr/rG5nMV6PxzILSyru1OtQMubBf1pB0S8yW0hXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846129; c=relaxed/simple;
	bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qV2z7n1wjIfVj7v4X0DI/IdiIZpZD9oiczhe0GRied+nju6AdqQ7wHVzrapmDT0nrzFJKjOalFWIQUIA2S4SzCXFBWSh/lZQKpS70uZ/Wd2T8DXJtuLkY8HN369lVZqWkdGJYpYrtP06jBKd1FcLSyXdK1xNqhsP9nmF7h/Mdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l523Lo5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ftbadJW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l523Lo5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ftbadJW4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CW1d3531685
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=; b=l523Lo5DHebBEB1U
	NpkHavwC/pwTXCm6dzQoDs/pbCZeBXgzUyU9lEsoA4cv2+fK1TgLVrcH85fKKIU/
	f454WMGq1FggiPB8jgVWgr9HXaMyT1Suion6IZaHhLEdVyjSWvwUsJ2zbZ5yynKX
	Leutm5YaDyWSojoXuV0VDNqehUjowfcDdB0GapxilNYrMR7HvGUf8tahLPn/6RFI
	HruboycOCcQJV+TrlWophtoZPx/ARTqtlPAq5xYRDkde9vClB9QjQDAgf8E/q/eM
	FeRi70TBJcw0VH93D3W0zlnz7bgPKUPh/PffZ5QB65JvryHavORm47varW7josUP
	RdOA5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sm80b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:22:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso45248511cf.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846126; x=1786450926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=ftbadJW4expB6FerJrOLaiFCEfxm37k9wKIlfacRe1yZeMrs3cuEvDetCo5mkjwbQ6
         6pcQzS20zc53ek1yikhSz1Q2oTt/xQ2YJNKOCjk/EFp6CKtmMtbqKqepIEnFYkWTfNa8
         Ys5WA/WsOnZtbw8p0TyGjj8yoXicRbkYlyDKcmG4LMILzZr+aUAje1SdjGTP7PSL/1IE
         FV+OKvsNByMg3Xvza5JKSC0lVeMtpVWndhH1BVKjVObWav9cIOFpj2XVvOO/K6knw+tE
         Fcf+bV08DnS6eKFjebm+2sthP8rDsDk1uE8+8civ72dwirYniagPat7IbUH7U+ni25hk
         tJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846126; x=1786450926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKOwojKFA4iWwpHnCLiH+mV1B3lcGN1tG/Lk8zN4ALs=;
        b=qwhgIZ5qJRjoW+kevp9++WnWCwXayMQj6fgcpRmJY5WmtGpQM9g7Z7bKxW0m5KbITj
         zYWvizx1Mu7pOGWocy55sEIxnfQeqMwQuz7sjJdmpCICjGxo8ZXrXkiqcJJalXKfGfF3
         cdwGyHjYhmHLmC8I8fVBqFEXei0dH7lZMm2TU9BSzN/XUDC7Flx+gS6pQFagmTownCWH
         Yx66kKvag5k+TXxh8QRidnZT4Fn0weG83vo6RzIieNo+oStjND8WehD1M6GW4a7Lf35G
         yv/w3hmTqJ1bkgqsZ6EMhJtMsCH1Nsk9wjdhmerK49l0gOdAHTwDd2iLJkhGDdfwDVs+
         zBNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSMWAc3lfQyX3MroxtYKFRhnuTAxne0GaFuLwJ+i24Ownde88D27JI6myDNAMFHyzA6QDGt/mo6v8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKrHsMt80CQVa/dXiDT0hPL8CASLuP1i17vR8AW4zjFjwcrQi
	D9nCmGZfLkpbeUG4xLfHAm8IXm9d63I4+NEljy4Tep0BdoZOvpk4P7T4dxMJRvBVnbWEayIhXHf
	NIQhrTJpVfz1bulvzzPk6Pk7Da4B97sBZNCw+U9m6yoEEfM15ZGlrWtDpu8wntobp
X-Gm-Gg: AR+sD13kJO4dS2CJzeEG/3YRUqxpF5RzJHgp+34Jy9JdbvcDtf/f5o3dpwBvUOKSuH5
	3CrD5sdBLJ+4cVL4PSBhMoEoLlFm85bUA31As4dsUQ1pPnTawKfGiWP4Z9HjBc9QHAyNjUPgBDx
	ZK0XtnclnuzuWAn2kepXko8GFUaxfnG4zoN3SASWrm6kww8p8ewPLlZY8UqHPcC4onDNC1Zf4x8
	G/CgqcZVKcia7ZVFxDznZvpYIKP9uqGt8Ku+gGjI+ZwHRexbMvYfOC3i83AEuDW5JPPqNuvi1To
	Lh55X8ZacownC/rgn9CAjco+onXDYFH3ju+xgF7tl6IwKafssysfjh0HhgIIrfxZV0ESHrWEBQN
	mRNKdm+0=
X-Received: by 2002:a05:622a:1246:b0:516:dff5:68c4 with SMTP id d75a77b69052e-52b566f6e46mr281972481cf.7.1785846125957;
        Tue, 04 Aug 2026 05:22:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1246:b0:516:dff5:68c4 with SMTP id d75a77b69052e-52b566f6e46mr281971611cf.7.1785846125289;
        Tue, 04 Aug 2026 05:22:05 -0700 (PDT)
Received: from hackbox.lan ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm42940134f8f.1.2026.08.04.05.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:22:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 15:21:41 +0300
Subject: [PATCH v4 2/3] arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-dts-qcom-eliza-add-cdsp-v4-2-fa593983e486@oss.qualcomm.com>
References: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
In-Reply-To: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=beF8BX80+h9HJHMkGhxM0lkj9SXJhy+e36vhzwEqyPU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqcdlhAM6eIjpLnqeuDgniV8UkZlVTTiN0RQEVl
 qUPS/G3FXSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCanHZYQAKCRAbX0TJAJUV
 Vu2rD/wJ/i0sggQABFNaEzPFq/W++tX1oYVX6eQlHUppMVP5YwSt46vX43wXm2XOnzdMwEHrDff
 HZT/m/+X1/ZTokwT8dfhe/gpRdvCg4ui6GIFh4hPvzWON7ubIqfCGpLbY4cQbSzTNhyyr7vrpD8
 G0S3Zlzh4Pkb6AmR0yXFOUiCoMb42SkLl/BP3Euy+Fjg4TPlZRmgXMqzOBjIMJIIUdA2eMpp535
 5Mo2OVnvOPZLDxn9zU1kB/Uu2yx9N1zx1sFvPlwnNLhrYrhJ1yUtJbTzwi4CXNTZ7FKTSAp22Qq
 pCugcC589krnRougQIwiJcLF29DApL6Jz+mcf1nB7b4bpS3tLZ2yCk7+vdl14WQYl9mA7ft5Mxj
 HBECHmggaSYaLxc42f4eLz6pwhtkG5OCEp+AoVw7jiDwHNRQDSBR6aMuNHHcFRS9D2mDrsmKX4a
 6w1IkYqJ2RnMbTYbKaEkSsMH8HT1pF1+cjjdWkskOkmtWR9yE5O2fnPZY3I3OoZ1VlVJGuXsqFZ
 QQCFLje+wr2GEX08DYPYH5MSA2rhAwPL2Mpyn363SsU1AeJ3W9Z54OWy811IPWfTYhBG9OvK9hE
 qNVjVwpXVSsIBs9cHnaxwwhdEs0eGX5IhHn1cOrWC1UQRNORBZmH1EBrIWwYwSd5PeB1P4E5/Jn
 ovjXkNzLUNGBj/g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX43x1ws+LbQle
 //C3q66gFzjgkqjok5PabzmDdZjhDbeZZjLpfXY71z6Q+5M9K1kvJ+xpMpY70xXQfimwtYhjJv4
 +dyL0YLiY97o22S1BU+EqNfXq5JOzc4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX04WIGDgW/4qI
 RurZql2iPQWo0+89p+pKGXKeCMs0H4+zCYKaDDwp6lxPhh445ZyvycBcFvlel2oY4MeFfLle4kN
 +VL5aVLcvN5poj3muMdL66CuDAIjohf8bk9ZMK9ODAG0SZ2r9REnTrcQXnLPN+YzXUk4JVagwT4
 e84L8/BrYMdhPl/oRaXeJFPP4IjxDOtsHUfPvvw1Ab/uO5E/NaWGz8l6dzrWLr29t0uKBFA4ENm
 QEH0ciXe5MYfG3YZd+bdhIjHOnfGKAoCUZWToviTyRAq17k2UmYE8v6zxpTfyoioiX72nHWQAJx
 7Ht6rU8GfY+CPdvYSKtKp1UhmWqQNGUOB3/CrUFMVcy+t+6LJy6VscDAKM6VsRRmD3cnap1cnof
 vkxvWUtkmAaUOI0EHxNL52uaJXrQIMRuUPePS+5Zh4VBIIWd3tC42wtkyrPXlIqlNKT7vs663sP
 5oOXcfgwEw/CcpTeDIA==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a71d96e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=F2_fgvKzopLLhFp2320A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: S1u2wkbiEivx-HOf-LbGLrb6X09iG16t
X-Proofpoint-GUID: S1u2wkbiEivx-HOf-LbGLrb6X09iG16t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040099

Enable the CDSP remoteproc node on the Eliza MTP by providing the firmware
names and marking the node as available.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 5abc23b9b676..c5a772b05223 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -484,6 +484,13 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/eliza/cdsp.mbn",
+			"qcom/eliza/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi8 {
 	status = "okay";
 

-- 
2.54.0

