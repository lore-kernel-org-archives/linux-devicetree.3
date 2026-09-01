Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297984334C4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256279; cv=none; b=oKJy0XJyAeXiICQIKoPxt7fqFh4h6nRgy4Zaun5IHpZiKXd2SRC5OJT5T9nPuuMzpx4UxclKfjC2KpKR8OEOvX9bbvepB/GlU4xGgST9PYTl9DvoojoV7Mthx0tnoxNZcocnSKA2GEMQl53B4CzmGvcsP2AivOLgbl341fYfvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256279; c=relaxed/simple;
	bh=v8rzPC5p/ZzHT2U8EE2mR0Bf0z1+u2GqLUlHUAGOYC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nCi8QNuFpIltU0DjG3ywWxwIJMxBCeaHPlJcA4KXt3GnT0Jle7gVIC2XRgifjQSE8nV8FKc+FF3tHZWVhYR9VeDoKhTINvOzQB7BYYwYoOsdzM6oC/aONZ+oXuT0XuDOILhEDlK0+SCz6C5w4l/5fOSlxfl0e6sIDPh1h9ZIdZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCqPygv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGDMKshQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCqPygv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGDMKshQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179MHq1892621
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 09:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WhRQE7fxgjYQGNy87/Z7kAzX41sDH/R/55t
	8bfb9X3g=; b=pCqPygv9b+63REW66URXSnPffvsI10zxgjYUO7gLL9kjUrq3pMp
	lrC4UHiPhZEwUUEIEc4JO7yi39ZJ61gjDZSBMJdBbuRWO1pUrWSP/qZPwtDvlKbu
	BCmp3ZCcFddKMmBqXB48fA4MfYM3dz7DyDNl0ZRbWAAdZo0Isodna6y9CxOqy99I
	UDFXq8XMTlqv65J6IY9tjkXS/uwxQ48nR/IxToLqhh0B1wN3Z6XG4sg+CfL5Qo4g
	FBLYwSTpjhmVEeXmUnIZTFNHSGmyuj5xmp1kMAZJ1TvT/3FSPfYZ8urwYsjDcRNt
	sH2gXemAj3JYyFJZtJPOwaPCuzKStr/K2OQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7c9qeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:51:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1026141a12.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256277; x=1788861077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhRQE7fxgjYQGNy87/Z7kAzX41sDH/R/55t8bfb9X3g=;
        b=eGDMKshQB3exPlLDqpX1z1qYhkQBhjk/DW3fcRB/s/vblKMkpQwViM6Q0FJEW/i6BJ
         S7kZW8bQBVukE2Ln5Gi9dO0n5UZz77JQzusF4P0kRB5/fZ7xwPJwGV7yYtN6Vd9xWz5b
         fY7w8VIKTOdW8F+S9Vy+h0fMbBmJsuTQU5oKL3oQpWxla/KVvq5PI7ViTdCfYuRuN8rQ
         8yIcjPspbi086YnrZYtSB5Ml6nCCZWaue82dJjrP0xXue1wffwBCMDF4U/OpkLHWiOms
         UElmLwijXCtPap46uAO/Zmq+kfmfPhjElWDElCghcbEdegQVO2VX6T+ak3UtS4qUEtl9
         iRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256277; x=1788861077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhRQE7fxgjYQGNy87/Z7kAzX41sDH/R/55t8bfb9X3g=;
        b=bNfYZVFGDOANIyNBVqjehwBW3mVXnKt8Y7rAaJ4/dilr3G9ILtFS6ZjioU/svskd1z
         zopE2TISaoD7PD2Ru0tA357xJaoTlSmOIYlV0uA7RXaXV61PXryN8W2shcSemvxB4DYY
         7YzCHy/8AuST2YwWULiK4xC2piAKGphDpwwzEnXVT3Q0vH87QEytcfnH1Js42O0PBNdE
         idjHfxutw4AClDtNazmXNC5v3G1nH0qdIsqZJXgcuwoHWD2qYwW1c1D8peIHvcU/lNNg
         aWl+sqjj3jTtw6qNf5DsHkcfSko5PYshpt4d2PxNifr831b7CBafzFZ1JvSWsITSgmFN
         GSkw==
X-Forwarded-Encrypted: i=1; AHgh+Rqohq+TVptXH2B7lKC9kBjgM2U0kEgPEHOi1rvTQ5yQUyt4QTJ13UphaGjI+corsoRmm8NoZBMbayg+@vger.kernel.org
X-Gm-Message-State: AFuF++lmR9ZTf9/AfwoA7sbsqz6EXTpgc/JQl1XVBdbdTuogtxP3vBLV
	FWeIjKJ//Mgh0T5sQ5zWGqfAvzglk1nMh4BENIB3pXgmhHaajasb1nrNzpeW0ry7xxycAnaCQx+
	cl0sFLWrM1eNJGLWxSY/RfFRhWs+kucsPwn6J8zZ61sb0zJD4Ki+oljOjZamrUL9g
X-Gm-Gg: AR+sD13cty66sYp8MRGo5hbAjvGSqx4AKCThKnuqGsgUvGNRhNUkrzP+3MnZ1DwJkrQ
	YJ7JZIt8SYq1iVfxDRtcbWzBq+vTNbMFs9gcx0ZwZxvx5IvGdkI/pTjqLid/XFkrKtzln5bgMhx
	FV8hBi/GhnAC2MSwrlZIzP7cU02kQuTV8ISmWzLEbsXEnu5ePF2SjnLuuUzuPX1eNcqHofTixPk
	zhOKU08JpyenzyvBnza4JTtTSFLz2zIupcO4wVxUEC15K15sYhiq68VUuESHs1HM5F1jrujXnB+
	bRm1/SyVgI9hYy3V9E4rSFJVrtD2Aes3Reteyz6R6wlH7GY8zGLbyym428IxmWqxNsdmvaqmDJn
	qHeOq9eblnc/M6XYp6yxHonAXIvu3JY56bDAihIPivA9fJSRkQseVN9zoSb3w
X-Received: by 2002:a05:6a20:7483:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3d7dfbf750emr8395230637.25.1788256276648;
        Tue, 01 Sep 2026 02:51:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:7483:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3d7dfbf750emr8395180637.25.1788256276245;
        Tue, 01 Sep 2026 02:51:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/4] phy: qcom: Add USB PHY support for Nord SoC
Date: Tue,  1 Sep 2026 17:50:51 +0800
Message-ID: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96a015 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=3z_Grn4b4YC_H-RRj4gA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: FcaKu7iwKP7Zc3tk06dXOQ-OYPNjCpoQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXxKRyL58Y2uQn
 aUnOBJfUpOY3+sNH31DYRiOuGttUFBkCCp6/iephzuEBfSLb3zhZ5KUww2xKsGGmWTJ2dJia07A
 tlVI4r+0HJR/sovDfz9/GwaSuuUajh8=
X-Proofpoint-GUID: FcaKu7iwKP7Zc3tk06dXOQ-OYPNjCpoQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX4OfoM9o9uONS
 0sfUIlq/uW6y0cIEryo9e47VtE95aI6mwvaxCF6vN/imZ571URvFZf010SeOX7qTj5Twg42U+P6
 cSQKSAwzHh+62Gm8eLCXqtc7Dv0KmGsWgzQJrzc5UG8oACQCMK1UDX3KbYLVNBhNpwPQdOHNv10
 P6f4ZrdnK+Ke14UXYJYwe7P32lO7NEkwMAc94s5+pgcVC3wF/ug3ZP23Ax14c/4B9k9oeiVlsoJ
 Wn7/irHowH2hvedGiArC2MwTAwqUJxyzbdAHfQuxPXYrXFlA0sjbbx5hh9fm007kBwaSBtWUGDr
 jPoZbook5801pVpQ5sbxMIxZuktpUWlKtxsVs5WTJ0SlGGFYBfifATG8VIN6ABYFEoZ+3EXjWBq
 WyfVruYWoYHFvAvRdJBaOADBu92Lj5kruAYYo9QtT6HtXyT8Qxk9PwJ3e906XCCh9z3iWqG+Ds8
 mArJYy2jv6YVpyLQ5mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010086

The series documents Nord in qcom,snps-eusb2-phy and
qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
Nord SoC support.

Bartosz Golaszewski (4):
  dt-bindings: phy: qcom,snps-eusb2-phy: Make resets optional
  dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP
    PHY
  phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |  2 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 66 +++++++++++++++++++
 3 files changed, 69 insertions(+), 1 deletion(-)

-- 
2.43.0

