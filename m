Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B0373C10
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256346; cv=none; b=XnwV0tSvq7xj6wWaDSYB8H0Opa5ol+fJ7zirFspbnSzOErsDx5bgLVbjjJpRcEeEx+4ZOAz99kXenjOOOReaEGrxyjJuMjCTR4e3HUZrq3/77PgyTnBUDD/IvSvjWkTqQMX4j5z8/nbXp/ZIcNQeILfIYEbCqRIYjdqyIrGWehY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256346; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxiJZ5fPn9D5crb372xc650dzjTpgkrxHwPvIakBirG2qsokenuTLnA+ze4o00BVs5TEZ729UhnSFIWbrzTqBwN1s93FF/GgkMwQ3iJEKyNVLPBaxaUXLmA/ogLYAMQ5JHfrhzW3q3bHQ6xribTpxJM3/Ph2QHugBICL8z5h99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaJ22dBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPVfbzsK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaJ22dBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPVfbzsK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Vpc2411512
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=CaJ22dBDnOAlakLu
	rSvzu319rVXYBhf/HrEA78o/j9xUjL2Yqn6f0bgVjv20y12oppysceI+fBpjVCAM
	u/PKPj37Z5TFo6+l/JlBZ4J+XiaBtNnx2VPo3lHPRNwiHkeBHhE6m00yJUf5wMQh
	C4l1Zs8WHuqF1XFkLTNdwbGy4wKk1IruCuP8UbEuPYQSkfYL/W+d/fQ5VkLIrCL4
	LXv5F/g2kcB6w3lCfZFPHbW6+CLD0KO73n9k21YtwPfDaWTuxR0VCjaKEEwZUr3I
	FNOyIpnWr72nwE9QNAACHIlUW28BDMzs72d+FrPQIDG5qsTX0bhD/QiXQvsPjEaW
	A2qdTg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165awc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:25:43 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9639158a44dso268538241.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256343; x=1781861143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=kPVfbzsKVYWUKoYPTX+uH8yqviOmQlawn/zUTmwm0KIuOFH7F5CZvVT6zK21rMQt5x
         7UCaNoGZ9hf6xJYoBpE7rb1helNlwqblcgDshVWYHhW9h9/XZ0iMtQ+YFY6cSV85KM5a
         X6lV8jI1F1t/HJMw37UumVel+i7ZGJioVPd3/Ar9MbxPB0g/uFJ7SLJ2ND33GbDAHm2U
         gB67PEn6XLTH8Fhx6VTFQRydTMAS40c22TOhiS7ILsJgSvAiUI7HDaHO+cAPR+4DuuYe
         W3/mTvG6MRIHUf4LfuUfTtowBfMd3MAn+uhnte4OIONVNODEami9IzV+qyaWxHB7unxj
         SUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256343; x=1781861143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=dABZAm/PofhKud6TpRI5S4CdFgVaFw2U2WBhD/njxSGYuPyvCrjG9vAxid84AyjXqA
         NcUiC0bMjYG51g0y0bSiv4HIsuqKz2bgPXmIMPuNZnWAkJAygiYKwZMO7lB3yaXq5lMq
         B8v1vZVmvVwyBdT/8MisqRoxfbCmHH/nBWGui0TaR0zqAyCBQ8+nGgrPeeFQo51qWXGt
         sAyLFTuVDDi6eWdcXL2w2j1ZfYAr345gQBWdKFxiAPUeDDzPSiVvvKsLSHf/oW7iVCCE
         akIkMR43hqaVX69V0JsnzTxl0T+P4DP+IVPGsVo4JNW8/FKSfNQcUb9Czl20Y8zygQzg
         wpyg==
X-Forwarded-Encrypted: i=1; AFNElJ+07edCy0XHlL4CdEU8AQp/lGzuH6jUQo3Fw+05xH43gKe0sQ5F/OAzVLHTHmJ6As06o+YTJ8qTU9YK@vger.kernel.org
X-Gm-Message-State: AOJu0YwhydQcTmTeso4X7t4xkIuODqZny7V/xhofTaiLt/4l3ip5nZAs
	H/zG9pCSFowTm4yt1s/P1O0QPjz4Y5KXwe++FRzF2XuOVzB1YnLhdoSrJpzm1cyS4UzEDXm7OQd
	I/cSx1GutrvbzKvOO5H+l0Ij8AKOEkBK1MQQxrGGeujHQxTcRs9vjrVvv8nB0l++6
X-Gm-Gg: Acq92OGAlXc8Lu1D7WmI+bsc6wKm8o9J6WcQM6y3LuvBRO+utANpVqFkYd4Y6aS1SEz
	Nx4xWSpekzCIy4tA6mqWZ2VCIpcH3FKSWBCs/ZzFFk8gqFjD+49BNvS+ZjsFXIikU65m9po3imx
	780XVjfzZRSYuKDqe+sOXNG4+jAkiaKIKXhDEmbIGmu6WiGmXk28HXop7vk1RdV2os9mVrkhVZc
	Fx7JcxL2FMXj2QNgMJn15LDCOLYk/qzAk5d0J51AwX0H+da37xjUm749FPFfpFMz2/TVY1VrXb9
	eeF7fiyoFHyOYmg4r+B5dD5qdd7geJTEvcVBDthb21hLJpr5IzW9x9Ejk/cGG4UXU7YRQjmcQ+H
	Z4sdgrnhSWMy6+bcz04+xfDeb7FveKJokGN/9cA1xNKRNhk7veRBLYSHieBWQ3XLFH3IFYms0yj
	V063zXnzzFdq5oi14ULH36ur3RIfVcVaC+68w=
X-Received: by 2002:a05:6102:2b98:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-71e888c088amr738027137.0.1781256342833;
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2b98:b0:6a2:cf9a:a5f3 with SMTP id ada2fe7eead31-71e888c088amr738011137.0.1781256342448;
        Fri, 12 Jun 2026 02:25:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:33 +0300
Subject: [PATCH v4 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-1-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CPwZPO0cN0OQb8rKNsKDy2TPAKrkP/B2msY
 7r4j+VGLtOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQjwAKCRCLPIo+Aiko
 1b1rCACp504C40HruoVsq8k3/NZr3gQVKQigLmI44owZM/nGTYSGUmJisKxVkzKDlW9Wb25qa6A
 eMg81mELF0+bqqYnA/U1EtzLKzyxsXRbDntfUk1zGP1/D9W5xyPDopvmUh3peAb0oiRc4bfYPvn
 mPxCU4e/poV7QLQZAvcmTbw0rBqAEY0r5UC9Z0O0WVkA8vpxM+tUyXENbbOdONYJ6HDYMfx3tpk
 oG4ZJVRThQraaLfSWlRmjRF8Wlb+uPgCWgV8HYZXkS7VT62ZmcE7sntzkM+xHz0+4o0qie1yp17
 EOx1QYcVwYtuZeZxKLdtMJo7UUVkvifjW5jIBtaJOux5Kqc7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX27rvm9+eSMYm
 UEYRdOWVvbMtFPc8y1FO+oJpw3pSN/pmIg2dpZB6cn1ahaAyAkRugxjmyk18P23O+F/CMYToEx5
 WN3Jh+e+p/HNd0PXSDcC/0eysqnTWV4aUAMcXCVVor0GKDtQcR6q79t1Y7lOsi4Xde3qmA34oGw
 H+Ger7YlCkz0a8NYbxywE2szsMl86ss1DQO/rUqRIx92yAmH0D29fyN3xGW0wfIQ1tL321KkKC1
 BnaU9d6CcHt/2TApMd/ZVVzeDXD2dm4hyl/FH6fbSGHKFQ2vAjPxnFJfOkjD++O6igjSQgCuZIB
 zsZLA5Hgndvyp/1MIrDzdeh43wBkF41Vw1nypM8RzFK15SGpxxvf2jQBJaYZ2sakvEPrs3C2w//
 1vSgV91T1MJzfepVO00n12+26vPI7PebY0K4/+TQCDRts3u8E7XuwWOOZeXdwoDA32sC57qcbSt
 vFVNkv78qIE1geejdoA==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bd097 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: cWl44uAWr5KeOdE1GP6_YYFiOEEtgqk7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfXwuNW1JVug6Lc
 Q5Sey0J7kfop1KdNto8oZutDkT9jgIsiO2cEPdMezcDOwjwaLtNVy2ZitZeh+k7vucmuuUT5zUs
 Llm2XkAoy64lXve5SzTn/sugxV/V1N4=
X-Proofpoint-GUID: cWl44uAWr5KeOdE1GP6_YYFiOEEtgqk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3

