Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E413A5444
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753413; cv=none; b=C4Gfq98pT9oXaNChznNxMdBMeS4NhyGotvg686ONLUClAJpOMLlS01I8st459HKxVFYYFAimFCeyCR7TFgxkM6nx2iJ3KYSHZ2V2weRym+4HH2JynEIs7V24PaklsM2du9xAHHQ4pzjN6bXMDqIAvvhZXknmdEJQbZYQerVmvgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753413; c=relaxed/simple;
	bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h05wm6M2nz1M5u/Vdm+w8ZeaaadPIYfvQyYZtmtXTjFfjvZv2L+ILjyy9iAClL8FmRaw3W9IS2txZbQOHWsnLZU0vyga+mR10Tbxf4JOQB82HOPFqkl8hDxK+sFn5l/Co6cH8/PbEE4IzkD69++IHNgNlgL+XAlXhGn/0s6s/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RT7CjWA8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX+JnvSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RT7CjWA8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX+JnvSs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9kAE72305192
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=; b=RT7CjWA8mT4Z2i7N
	xtiQU7Bj6WIZuVFST/86WSZKB/Jb+4CXNRm4BbO/ZZMA+TUp/lvQPNWCNlrMK//r
	N1ie4s/gMxOYlILIy0pPsIgxsAyIey6aQiG+Rw67hTAdcDHhwY4OYDLs4Nisr24p
	E5M9nyYSrc8JiM72zDN8ldEmfAzS78av743qs9URsns81I0XbRoGSi4fcRmOHoCK
	ZVf3getI/I3/JJtaP0i3NgcJXs7jk/Qbo1jfQrSt6Z/12G1HoCxHSnuz181peU+9
	knvUiQDhlMhlRtA5Tl65tK5IVNTa2SWvqJYve+cdyiIwpvnCx8rKxKDENzAXDpwZ
	z7FXtw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0brb7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:10:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so5446821a12.0
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753408; x=1779358208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=gX+JnvSs3IHbaRrxd/r+AZg3J7iJQ0L1xeaJSJcgMfGgMWtWq2ebmbFQqEU8gjm0BI
         +Mu8v5Kgk1opXPtWJpDQXj8P+0HNvwfapGJqL9qH+9CzHqvXAZg69NpKedRArCnvU/Ii
         zzEaxCxJe5MPt3jWtpcHbfJWs2uqIR3paxr8fN/rV3RVD1sO/Z95pSlEVLHs39OgURkb
         RmFv5qJgOvk3DSotJUuAAv0BHHtUMxejqzMIYeVAPGLcrJ1tpbd8hnvq9AZrNIV3CPdJ
         aROlrEcV3wwsGEWR5/tjQP/e1Gr77SOEmIO+aeRaZgGINQaai+FscOZ7MOeJ1zOXvuE8
         05aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753408; x=1779358208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKU3mkcAdu5oWFLwon4MUG7vzEY7xSuDI2VpUgR6EjM=;
        b=N0/SPvvJ6zKOE2LawQnM+kEWxL0PQ3ZR4Gq2AtcvTx9joC6fAkTfFWRnzzn/O++cDj
         QfHogMAwkUBQeBCKf2yQ6PCkTFlHNhxmnd2JmnQ3GS3fMaTz8rqQe7wZdg9tbOPOqEQL
         3UBy7CUEj+1brGRs61EH4uESkt42O87SVbfSVLAQGfDZ9foA+q8K0MDuGG/EIpdTiIgQ
         TMD2qB9ZJsxpNXig186sqBZB1/v45kb5cF5rVPQlwk43yRXyw8jJ8FNLz1mVWbuWclbr
         2xpEiCG2gSKBaiLK6/1IVZIOKO8oycdDKSxFjPZdeSRh2Kvaxgh64I3vxtJA+AGIC80U
         81PQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JlbIgVOmiCO+bPIyFr7u97A0nE5An3pvydUdkxRUpnts9JaYR6xOwdni/vA99GXNJeIPVc5lSRcnB@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfhGbMEXtvgwfaoLLnSPHBxNYdLhD+psEPu6WNuXE/Z+Y4SlN
	pjZpBvnrE4pwPAtfo2n/iL3h0uAXeVgTp3LqxUE4suzKH/wnbShXrcI8+pUopGg4NcGRJPKcjHk
	8+8/NDUJ5+QDeoCkUav1m/6nKa1syt7aXMxfUI/ulF2eINosY/UUvccwFYM0bFxVe
X-Gm-Gg: Acq92OHq03xCY8zqHIakLNiIoJ1I+dsttJT7krUpnu/SvPyr1lFGEckTWvSAIvlyI4s
	IFg0GorkTWc3ILXaR9d4zZA0s/GyX7+6nOwoIgy1AhmdP1S9jaCvjxgXyNWWLzqjOnkh8LSMDo/
	PpuGpMhvLrp3ciTfJqB/oQfqQJf1UTadj0aoZBVOJAbDsXNygNDnylrThue1/FcI0EsMo0dKDju
	y818HGXV9nKObw0zNA6kj6SZvCqe9/R2X1a3knjY7ncKTOLCAir56Ni+kOVHP6+yWqXOvpExHtb
	lqb1189Vh+FEb77q61nnul0/eT7C8vmI2hzdmqi3XOSRSR6oXswWPM00iOso4Oq5LeKbPpsZJ78
	qJk6j7TiLyWU8oF3ah3N+HItpZ+4jZ92tZaBLdczy9ZH5boWWJWC/gXy3JTsOgWHdnVhtv/xmj+
	vaXhNTjX3Lqi2S9b2Errqc
X-Received: by 2002:a05:6a21:339f:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b0c0abbdfamr3403998637.30.1778753407678;
        Thu, 14 May 2026 03:10:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:339f:b0:3a0:b65a:5df5 with SMTP id adf61e73a8af0-3b0c0abbdfamr3403962637.30.1778753407098;
        Thu, 14 May 2026 03:10:07 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:10:06 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:37 +0800
Subject: [PATCH v7 5/5] arm64: dts: qcom: purwa-iot-som: enable video
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-5-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=1004;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=qscoCSFAgisCe1f4h29FeB3VcT/jr5H2iv1XW6q2vDA=;
 b=XvDaPxN44wekljoc0CV7Y7J2cIXJH+w6vuKul/77hVGW2Uo6fgyz+6+UsJgKXY/IbAn30qQsQ
 1Z/H32YjFS0CxXfyfp7CxJni41TWGjmu3LZ1vu4iTPjU8RtQ47y9qSE
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfX4BuaifKkDa3t
 yKBsyi9e0QwXLMnMXjdvouSRLUBsyGCUh0JcYK0HKWBTi8aWyLPCVWPQQ3uEgwzRQ3FgGsRiy35
 hvKV6HyMf5RHSgGTc1ccb9LZGoFyqHgIDVRpa8MheS+TxljbsLQ2+UB/aPi57Q+xDHC/xscxV1b
 BuRFLoeKFuEzFtaYNlR6qdX6Jzizw27xRwCS7EAyI+aMtqHlNm4/M1G4ouaOZMFpMsrJ8VGMA69
 OhE+Re410EKK5ojLdQmuwKf3MegdMLytxj0/qb36DCpwffrOCXCI0yiVuDtdv300P6eDDnr8pKK
 Xc0+z6J64r5mxmhiJAuJ6LXzo50fybl89foRFyL5VKW+kILXcQUVobTK4WQZPIEuwNXXOfCJ6PA
 OplYDiwqrwYaiW/IGs+2YsltBJV4zTsiDm/wmDZL9l/b+8sKxuv32x2JsgRf4IUyXtaAEeRN7kS
 xmLyMfAdbGX8/Uvo8RA==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a059f81 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=REEBHDwWlCTOHul6J5gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Mls9-1JPmHBYUEuS4oiahCWaETTuwECX
X-Proofpoint-ORIG-GUID: Mls9-1JPmHBYUEuS4oiahCWaETTuwECX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140100

Enable video nodes on the purwa-iot-som board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
index 394e65518ac5037e5c7c50583acefc0dbc8ebb47..ff8621f8750584636ad781467f9c35ace2354e4c 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
@@ -389,6 +389,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";

-- 
2.43.0

