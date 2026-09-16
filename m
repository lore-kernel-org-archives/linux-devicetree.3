Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382174D957F
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583513; cv=none; b=nefisO3P0ZsXZqMOYtEBSEtx2CyAoyBC/j3OjVF7eqJwp+TsZ5paHoiNxbVQBfnLtgRThd2j7EyUWL0wvU+E0u7GovT/gjWdguGox2uFsYefXKaeross8R4qMzcvJJ6qzqjAp/WBiA11brOgSVMaoV22HKM2T8ZGVQ+yPwUuRRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583513; c=relaxed/simple;
	bh=jWHYzbhxv048EpoHMPucxf3ZgNESqyJpXsdJoCbLYbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbvRVknxwrPJQa5Tj75j5118T3DaiEyfTZhTDebTU/dpUjvUerWYam1XlQwmPU8lgg7itohC8g0+Iu9boa+hU2Rc7Xem1msx9QRU7N+6gw5LvcWw6OZEi86f+rF+Gzj5x2GzRrYsrrfgZUd3SXLd/ju3yhhwgJadK5bhOb4x3Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eRF0H3hJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgRfSM5Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRF0H3hJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgRfSM5Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeDe53107055
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5jIxQ5Y/e4moaQ2XFAjQT+FXkhb//3C4hiLXRFU2mKM=; b=eRF0H3hJ/BmErKd+
	aP8uQWcUBUFFdkGGyXjFU88qd+VYUtHUl/zR/Qi21+Tr/5/hibz9tW71UkLVpsta
	xMHPTxMiEyCtJxV7DbzC3TtVWOseitZS24MqG00azDvslhFKUa90hJZnsOZ7QXEP
	kurnJnfQ3VBfOagR0SYmaSXcNA3Cwp2TnRWb6gxW2nsZKdXjGLzMGYIu3ULjKTco
	U0zEF0UduOLaLzYTz+2cpPhqeptoiJi/qJemCskJviWhrR/QmVHO2jxquvSUFXcJ
	qpMKRUGvuJ6JkepdMLdwXEd7k1dfpEGS7tOsfbJqbCMc1UA2NKyRW6cyEiqRIYcf
	Ic4nKg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2sf4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:31:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c99f26dc8eso410842e0c.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583475; x=1790188275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jIxQ5Y/e4moaQ2XFAjQT+FXkhb//3C4hiLXRFU2mKM=;
        b=MgRfSM5Q9GZnwuQ5acF1Y0tQSlTzSylbsZDQjcUii6Fod7Snf/XmXz7WMbEKHH97SS
         AQhKBJsUROANLC3p5FhCIhvtL22+KLIqkigToyKHRdTPAUn05tD69VGfBQwlcFbEeuIS
         wQ7fALZIcLNMqG5cKn5Xz8RqMeqEW8XXGmgqhMxyyfGUV2KvEJmzFrx6CbC1pCBI4HF0
         9QODawzl8i6JN8hr0mfvc9UpyVy74RaPkZTJ+eXeIuIy3p3msSDjyZqhJHACZXAaxAcg
         f9U0X76U8NZyg8cJhPEHbAVBV3LYLrWaVTcZUG11rSVB36TrWKvW6H1bUhTOxzhQkuj/
         Md7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583475; x=1790188275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jIxQ5Y/e4moaQ2XFAjQT+FXkhb//3C4hiLXRFU2mKM=;
        b=jpI/gHQ4FY6dalld+sJJEev3OnTClkcYjez5R/6US5/h+xNKYKPa+/owmHvrr/xt+M
         Ky+ID4Q8vf59ki7fiJ+JWOaR69UP7MW6T/yLbVpPXz2FzfvlfT5izPHmo8qyyrk2bE7+
         9ZEjrx38MhFDEP5V8VOlDq3JQSsODivkp4tYyvpITxjYkQn64aucccEGtpIPM6RQHMps
         yj1mz1vDizza7tdFw+EjOjOO6v2AMNblVwF4EXEyOpkRfUqKBZwisvDdFlcptbdaxEBz
         2E+Ma56JElBRomeZeLk98T8N0Fo1+ks1qQLB2u3V/F1YRdu+khO/URtvzJytFGsYCFmB
         GyEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNjmH8xK8syFv41G9nttok2Eh1hD2B46gsqFfGtcNxyBTUpMRaFVylQoHtXXG0Uf1tS/ssJ5Hc6vE3@vger.kernel.org
X-Gm-Message-State: AFuF++mKYb+gxSssk3xYULylq+5XeEGc1Mhf3Y27lWoo69gGo9LEg+Vm
	aZAuNtUqLGVLvpPOXwtszpizZ2CLS1zFDjaab2z4PXl0DObc+nqoboDCzNRAcGhVf4ll1VkdqMB
	IHEg7JlKCG0XRKKFJ1WGGv0KMA0r4xJ9AJ9terRvMebeB/s9AgcZj22RD9nIygSqe
X-Gm-Gg: AYBFou3DtY7NwVKDrhTd6i1LKAs6dYSNlK9+wPq1ibjUXvTXwoaQh05f2O9K28gvdBT
	lW2G6pL2ETyzz7jrLZk4LzFFdEH9DHRPNRj5Md4wNYd95CnsfLW5s/17bPCXvNOvyajT3gBaz+A
	HNv8pdE0L94SwLysrzjPyE3vQihyQIkR/0gUaGJ7ATOdDgvPoSN2rR30acl+zptFx3aldY5VG6A
	kAn06Q3cfa08oGAZvc4qzBhny1Igsle75KYhKTx8bz02/8OCm81WdEU9hKV91VUnufqY8BVeGUX
	vpM7YGtoasy97IbfVMZaH1qs3ZAtB5uNCjZoyv6I80lps73Vaq2buOJmTMlvg0l3PmfdkdAt4yr
	JRuAXJjjfgLFa/8bFNTgJwOO7Dvw=
X-Received: by 2002:a05:6122:3a07:b0:5c9:a60c:2731 with SMTP id 71dfb90a1353d-5c9a62dd8ddmr101522e0c.9.1789583475287;
        Wed, 16 Sep 2026 11:31:15 -0700 (PDT)
X-Received: by 2002:a05:6122:3a07:b0:5c9:a60c:2731 with SMTP id 71dfb90a1353d-5c9a62dd8ddmr101491e0c.9.1789583474885;
        Wed, 16 Sep 2026 11:31:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 20:30:52 +0200
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document the Nord QMP PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-nord-usb-phy-v2-2-2c8461bb30e6@oss.qualcomm.com>
References: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
In-Reply-To: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jWHYzbhxv048EpoHMPucxf3ZgNESqyJpXsdJoCbLYbs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBo01l5GfD/Oay4Acvv0FePBQFWTeqkshVdO
 f8JWoh6ZQOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgaAAKCRAFnS7L/zaE
 wyjvD/9meUVZs+mBOnOuTKeJ9ibjUoKZDiaud7ut02pAzWq2Dyw8fhEqPHM9fhJK8Ksb4+SH7WU
 1DqFEXV0QHZ13t1373nM+xw1RN68gynWRR9CkEMbBJQinc2fSxeeuIVG8tWQtuGwpZTE8KlMlNl
 +pA606HTkBY5qM+MKe48ysMJwTHQIKsYgsj9D57UpSM4t9XDrvt23DMbZ+ok3buSoQTxYfHFtzr
 w0PivZrWREkglzOpfetCw7jXGeo1YdNWXmwgXSiRu+JPFMyBD7yUHNf1xc5g5nXc6dg1vNmFG+L
 lAhiOSyHraIr4cZI4sgesM8FBgt5UTbLtUnZQhT+9BHqu1ag/gLoayg46jo1eYC1Ag/iHmEBWKO
 7ZlGjJ8RUPnhPv33VUbTWObXlOeR086wTokVFoF3K53ndFGeSUc9znGpt73CcvbLkJzkPjsMsMO
 Hu12NaAIuXnjWX8m4GGAwce2EF4Cderf3O19I3+w1XSghCs1HcAOZRRonalwFhxyNg9KpW+RyZO
 RkOAQwC9nbFRxfavGZZmD/xeleLkP3H584iPS+C2ljwpLW72g+WmJvtbAwDUE24JoKOtPYWxpEr
 EFAk5tsl4KsE8ovdbpfX0chwrTS7BoShw+xrqYyn5LiXSDa9lOr9B3DL0zWeh6VTvC4sQMkT7bv
 6gcvsXnCMXBU3vQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX5LRyxw6nukm4
 EmBe1xBBDGJIoWlmc6obPM63RX5DW3MnUbAGAfnrLub71G2l6c/j8onWm2DKLl3kazhdR36uCI/
 QHKirgAIgPHBjciDh92yG8MJZ0+p9pE=
X-Proofpoint-GUID: Ox7Eb70TpR3Iv22PAeBSp4Qx5VC1AfjX
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaae073 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ukKPufHZZ26NhZEM1hcA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: Ox7Eb70TpR3Iv22PAeBSp4Qx5VC1AfjX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfXzUqPWOchhD+D
 fwv9BOAaPjIDE63kaLHffXfVw1YAIeKjsnYOVLLgo8wWNlvZu6XjgcUo0U37GJEa01CXq0Sznvg
 +Dg7HAwroHo7hIbiHoSo4gUizgW+RGHIlN2WQ/0NeJGiHz/Rn1E61FfNhsJhl+VkhXXyux/u/Dx
 oD4WCA90cSGi98osjSJFh35Tx6UQ7whwD0HelfK3TBaqiQailVd4TJtmEjdjJOTaNFe1l8DEgQQ
 t6TtUDZE7okEemtT3etLRLm7hvR1yKpcWqWPAUI8V9E33wv1WXz/UReoY6gV+e5J7AecGOxRiRb
 Y6ugDdVxIJXMlOlGjXjd5ZA4pvnZg2XQRSUGCXqD96XJw2t+OnEB+lJqY5hV2oXZtrc6SEFo/Gq
 9+GH+/o2v5+2hUAM3+5nwPjiEHJ13Wj9ca4EyjMim2otCCeNEOn38kfvU7x0leP4eh/6RsnuhCx
 I7ac7tPLi9wxASsLXEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160255

Add a compatible for the USB3+DP combo QMP PHY found on the Qualcomm Nord
SoC. The PHY sits behind a GDSC, so also allow (and require) power-domains
for it.

The block gets a standalone compatible rather than a fallback to an
existing one, because it is not register-compatible with any PHY already
described here. Its USB3 and DP initialisation sequences do match sm8550,
but Nord places the sub-blocks at different offsets within the PHY: it
exposes a dedicated USB3_PCS_AON region at 0x1e00, which sm8550 does not
have at all. Falling back to sm8550 - or to any other entry - would make
the driver program the wrong addresses.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 43e90995709f97c6c0af093e6b76367f419d41b9..13e64fe510b8f4218bc11e1c92e87ab3b02d5ba8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy
+          - qcom,nord-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -249,6 +250,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
               - qcom,hawi-qmp-usb3-dp-phy
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy

-- 
2.47.3

