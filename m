Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E003D330A
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270884; cv=none; b=jbu3v6M8c2rT9qwqCFrMR/LeXNyWROV2yy8WTzMcw/YcLin2CEScch1P+TFU/vOgPXw33cl+O0RVdGYTVg0BzCMNtt3yyHVeWh8XljpqHcF2/4OsPpztpVWJj4GUsHYk4nzj9mX54itmxUcKTz7xWZ/ir4AwgEt48DzPjQGTbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270884; c=relaxed/simple;
	bh=Vj4+oo81rmJlqOMEGHmWK78WOY1h7oRumK4LiWBULcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q6DkeFChWBHlG3dcjaRjLNA5NT4X90H2/i86dk9aJ47gTPXdsNHXLIzi7Cmp/stUROAXHUy5jF5sStlf60xe0niYE8LyIlZjl65FGAcPcJ9JzFH6DLeeM+eJB6KeTgTx+dIMJRw1mwSC8A22tfjouvFrjn8lWk0YxG1/U9JkSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvXE2y7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCXgKyWu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvXE2y7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCXgKyWu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9oLkQ1177853
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ka61IIK+ns+3eFQU2HkmKW
	/PVhZJfUX5hk+AG1Fu9I8=; b=lvXE2y7wNFmuXASdy8xKPX+g8s+ASfU2P5CN92
	GDjrvgIR+LB/oyj/7GOk7ihSkVh8WFtIrmdecBvQ3s3cdzW8kC4ankoQncYJw6sl
	q9WMy3ip8fVI4bO/JRiHdrvR5fTVQLuYPa8rtE9UolBj4k7B2Z7LrfgNNPTUWpB0
	pidxHdaOxcr2Br8ZLtMoen6oYXhzBtg8/Hvp2h37cvA4lyP/d/VF3htyEyXvSVbL
	VPPGq5GurXjdy/fuh6gocdMEL44nLLIpfSMq9s/T4e8KOh1CYoYwi/3zpamsg0Hu
	PLZqUj8xOtU6WLm9o5e3buCsYl2BTJifS0uStkJVKrVcR0xw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6r0ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 09:54:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso131280301cf.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779270881; x=1779875681; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ka61IIK+ns+3eFQU2HkmKW/PVhZJfUX5hk+AG1Fu9I8=;
        b=cCXgKyWubsOAd+t5rTua0WJTG4Ep3X15kDkp8Sj5iUmzOZusHZZhER6eMsFggYvlRf
         x+QZmykWxJ/SfqGc9gOgcSWBykKBVrbAKSeZzmF4GMTNYUTuETNguORN0ik0wPMzAv4A
         dNK1oOp9+WU837elcJVT/HPso+XGGL/jh0cdPUroQQvSYiID1Yndcg9BODEG1lFdbCWb
         7SyrxKr4J3NIrXJrkQV2CN1msM5ebscPpW4CnTljSrQj3SKq9X7XJ2vp5hGe2yRLnCuJ
         9HojEQrQNQ0VmhjvFLJS4oXdWsqMCz7d/Wr4cmYlEOICGHbZQmY56ngpL9zSK0qP/Iax
         8Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270881; x=1779875681;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ka61IIK+ns+3eFQU2HkmKW/PVhZJfUX5hk+AG1Fu9I8=;
        b=Atqxfx/Fz5ekySiju0JoJzzN8A6fxMC74aKBtGYA9gZ8sh5C5m/zHP2j+hqmjggIxu
         Um7EgNdqnV4q3jzGVzTxMnXqH2HIfhTr66TvPpSxYexhFpI2d8XCumVfZdQ3glPUnG0B
         aSY8JOpL0I8XTZne8oqqsK2TDarrTsMX0GGZ0j/CucWluCXy7e5I4fIsYklKh1JeFEQA
         xLoZlPEKg8LYpQ84e4jMG3NDfQCBBIlRkyvixjHQsmJF18/RIeuQbYM/+5QnCT17FINm
         tZHhCo3rk195w1MTG2UudUwPXoDtrVEQFo+IeXJGMi85sFdcT+1TEPB6+LSAImaJUdPg
         4wVg==
X-Forwarded-Encrypted: i=1; AFNElJ/aLy2knvw0cdyk5b2UhMIWGa0Iglpe0haF53ToCxMyehf9fLxM06YIF1rpznX4TeeMDJQsGA4uzAaD@vger.kernel.org
X-Gm-Message-State: AOJu0YxJSXJrzts8XfLrMZtjEdtDJUn0Wxzilje/iIEzh0iDSNeaGceZ
	4gmbZvj70fIPGybe2GCGfxAQoJKBQrflA944+5WBZrTvQdIxJDaj/mJy51mPopVCKCOkRIHIsOr
	4+IonpTBhJGcU53XXhfw/Jae92sigPfknNHZ9gNnKLlyXH19xODrA+UF7o78khk24
X-Gm-Gg: Acq92OEGcZ4cFTyh8FIWUxPoMH5D6BiwaKR+lifcXJW/VwDkv2a6sT1Mej8JKvdVTMx
	7rfomT7uQFcnbm0TIPU6uPoLSy211rR6Ox1/hfVeW7mvszsyvboJYoLt/KsWg3V37E0m+ltDr7d
	o9LDDNp63rbmLJmKWA9ROUynB19yczSv72jOXXrzG0U4yVywNUp+xoYAJfic3AJBdrlEXnQ5nAP
	fnZOVw+HVNctvui5v4hBchHxJR9z115mIw9PGHWd6zy9l9Tn/oVnIeuQQ+tMVc8KRYHsTDR04nM
	8adsAtQUYxTFgMpsV8AkyZxhWct6R6i3wMnpZQhU0XU+Cb7WxKAeTQ8CMDee6QD0xiMtkbUlwC3
	1v/dHANWVKtqAmy4mmic26UgjkYPE7W0OFBggzcqfYuneW8DnpMShnNL41c27f0l25mwTvGT/3y
	aYVW2GE3hcNjj6xnJKTaOSTxxRyBcNbvI8w80=
X-Received: by 2002:a05:622a:30e:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-5165a07df9amr339060241cf.26.1779270880855;
        Wed, 20 May 2026 02:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:30e:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-5165a07df9amr339059981cf.26.1779270880378;
        Wed, 20 May 2026 02:54:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39588750063sm27747751fa.24.2026.05.20.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:54:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:54:37 +0300
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rb3g2-rmtfs-ipa-v1-1-8b3942ded279@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANyEDWoC/y2Nyw6CMBBFf4XM2sZSQCO/Yli0dYpjUh4zxZAQ/
 t0qLk9y7rkbCDKhQFtswPgmoXHIUJ4K8E879KjokRmMNhfdGK3YVb1RHFMQRZNVWJd4q0Kj66u
 DvJoYA62/4r07WBb3Qp++mb/BOC/5Kh0aOCuo/BgjpbYYcE3naCUhQ7fvH/kDbx2iAAAA
X-Change-ID: 20260520-rb3g2-rmtfs-ipa-e41e93f5047b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vj4+oo81rmJlqOMEGHmWK78WOY1h7oRumK4LiWBULcQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDYTeYRxXiFKatYpSg8wFiQMqrBiD2jQp465/3
 cS1NVzhwn2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag2E3gAKCRCLPIo+Aiko
 1X28B/9Ll0yM/1m7vl9i6TpeNuzy51v5aTc/vkTSqZ8hF1ZgeioVU4JojdNuvuY9xRmQ6DnVXjp
 XvzdJlJ4p/l221LwjfiGGzv637cUAJnnMxbPnrO/geWzXhGZCj9UWgXo8o+Jlm+PZvSdmdsgiZt
 JVsUlGtblUFHf84WUHoybrfMUTUrA9/Gyd2GhaGcgONa10UpW2ff5CSIaKtAnG87t6ZGsDEYmxc
 M4a8TGKTKpgy7HzEZax8CH4x6iYKeL28yIOP6CUBquvxi6THW5VYsxmHEA+4hIj0nZK8R+4hgbN
 dI/bbsPennWTEAq+JhZZJehehWdtcoc0xvZr6WoHVqzqQmlz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 9HBnBMd1la00pZ8jd-02XzcG4tp06eYE
X-Proofpoint-ORIG-GUID: 9HBnBMd1la00pZ8jd-02XzcG4tp06eYE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MyBTYWx0ZWRfX1xLV46GSuMZ4
 FiInaMnIdIXG1HDqEh+B8mKNTDAFG5pBpiOBqVfUBZEQBqttXpt/mrM+4gIcfup4Atk4rlEGMhK
 NwpOkfkqdiYdoyQufhPqTVBTHJA7Tw/ss4BQlh9mNIqt4ct3j/S+E8yJ3GOcsotV9BpLmQ1Qp6j
 t2elbeQ/ci2Vnokui2MAd1g+bpq8zxXqCNuJos52jGYWZOSAloO6uHS9zRdv3OeXU3Gz+uVGrbL
 TqqW1Vu/vbmdUtPl1C58CmXeDOU6RH7a/MQyZOCFXtFQMhrdEgKVsTo6b4CxBAR79ewuoAJB1jS
 Jcw04C8USvx2EcxAC8Et+hHFASH6EJG65Yp187zH+6jMgBYZD9UopekFM6CJALCt6djsAoYwFlX
 sKIP2NMFsG0FQRcL4AaiHfPGLhT/hKHjr5NVoyBXc9tIcXenenRF5Tz4sj7O/9R+0Z1TpyWkchu
 WsU49oXkxA/UJophuXw==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0d84e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Z-PxJsM1GSiCisScR-AA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200093

Downstream kernels for RB3 Gen2 don't specify the RMTFS address, instead
the kernel is supposed to allocate rmtfs buffers dynamically. The
upstream kernel doesn't support dynamic allocation of RMTFS buffers, so
use the fixed allocation. The RMTFS node (and corresponding interface)
is required for the modem DSP to work (which otherwise would crash).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index ceb68a890bf4..37a3b51323ce 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -165,6 +165,15 @@ debug_vm_mem: debug-vm@d0600000 {
 			reg = <0x0 0xd0600000 0x0 0x100000>;
 			no-map;
 		};
+
+		rmtfs_mem: memory@f8500000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xf8500000 0x0 0x600000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>, <QCOM_SCM_VMID_NAV>;
+		};
 	};
 
 	gpio-keys {

---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260520-rb3g2-rmtfs-ipa-e41e93f5047b

Best regards,
--  
With best wishes
Dmitry

