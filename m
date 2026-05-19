Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1986388373
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172566; cv=none; b=ghwhBZb3HUoNc8mmnd6x6ukkQFwDWVfnfbPvHkfs1Tm3EUZKy2UHzgyG8m/TkFmGvELNaT2rXkLJkYF0wRF+ZUr8CHmB34DciJPR2lo3PVDoCdEZMwmQYNnoZchfMtXCIHPxgzPnRWXWody7Lpg/IlvEDFbqoc36SvRI4BL1rV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172566; c=relaxed/simple;
	bh=k0yJ7kV4O+e0EI+PQKgXwEgwWi4xO0n751Z9YELXbZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cStIv3e7YxYPMsrT/IFLUTFk8yX7M63zXpK+WHpioRdmN+zy07XhKfxGQDZHSPvYcz6LxabHRCcOQy4gJIexM08tANijbXV2Wbe+w4zyF4xbqUk5U5hwdp+l0h/qicI1wj2lDUTEiL5DHqkxY0Gjfnvk9T2ZigGMkM4tCY8VNSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzKooqrg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hass4uOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzKooqrg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hass4uOd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5WP7Z4131363
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgfER8liylYO61nBS/gqDAH26Ms9Ra0JpIjNJstF0B8=; b=DzKooqrgiWhJ7jvN
	U7d1yf2FADSiG5TqfZC7B7DqXkSN7iJaAorH+tZdr5JbWg8+RH2il8kOP+4rcFhX
	eEHYyQm5K7ANY/Jeyh70RBibw5DPkc/kAe20o097cxE2LUZ6N3lL4G+R2BMT6y/s
	xXdm+d8Zw6ZPOLEPJbI7d+TsnhKFh7EnnAuE98japsiYnCnrVTk/spgplzrh1SCz
	antUIbmGM4v+I1+DSDFyIyhyXRwJz8gFpE63GXogQGRZY617JIvkiE3IucThXd3J
	TcBdNWjBJjZxVF1wy+T6DIyZwv/Ac8bmxS8yP+n59DF4m5DoGbv6/92qhHkvjay9
	F8GvxQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ht1g8bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 06:36:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-13536592ebeso15267019c88.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779172563; x=1779777363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgfER8liylYO61nBS/gqDAH26Ms9Ra0JpIjNJstF0B8=;
        b=hass4uOdgGQR1sqjBXecf5yQ94lRltEQbNGiFvIreIDPqCT2W1ej6O4xVwgHS3y3Un
         CoX9qQaI5t1oNG6AwHXU11pNUPhhRT97HDFXBeP9lRC5DOE3ZteOibJBfomG4WsstYZT
         MgcvSF4T+lSItTRlN+1kOKEk5g4bjbPfLizVB5tdRZ1FxBf8mZToHqmb9lVVtT26HCUX
         7Nj5YhwCowFeJr8mLdozXoPwrfyolIga2h2iQOUNjsagsLteomVOv0UzJPxyBtl+prqx
         0tKsvxPS6+UDS+2b3VQkVUn6sG1IH/K1gEzUDzU6c1V3ax8Sdr4H+E6rjZrdkRdwCBsY
         JfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172563; x=1779777363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CgfER8liylYO61nBS/gqDAH26Ms9Ra0JpIjNJstF0B8=;
        b=m5nyGR022JXHhrREx4SSEtKHWUZU0nAyjxw6vBY9OPJc7slLsfGemT1LfFS9hdzTm1
         AyicZLj5GsD7E/ZvSWwZxn6u3fjoIpStj2MS0yzUiudhsJ2rAsWV59y49aIW3ygdgTiv
         gfw5hEKNtu+3LDa7Lxo+1ejyZseMqVAUGQrIFwuq6pv9LYSe0g7Cd0iZNO62pMDGBi5W
         g6zSGDI5jp8ae8sy314xdvNZoorUTsAdQJD/0ltT+Mm92se3xPv0FONtn3Nugkt0h5iT
         Z9vItNm/NL+rPkhd7PcG91Kgm0yqihGQsT7HohSpqhemPkJZzvAnXCSlTD7VGK6l94JQ
         l85A==
X-Forwarded-Encrypted: i=1; AFNElJ97YXq9seQdsBgf2q26utK1ZMqvcPOnlsZWFJb9vFrqCQPgPKLEL35986wD/zj2MEeVNw1uQPQk1Hkv@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMYLKGmmiNrpfx7LUs5UC9RUWKt7WGR2bGuu3iJyTtAg1Lo9l
	1jrqJrcjtGzrEGjQRW1PwOu0dl2t7hxfDtoAYvrJQROoeJBEFz/SvD8DX6WNmFUVgTl7NdBmgKi
	uAYC+ydeZhjCpJ1qB8vf6sqxgz//JbvDuAOnmsW4xVEu0BwrmP/o+wm7ldjTEZ42I
X-Gm-Gg: Acq92OESlcf5pVGMbwpObHsm7Ry+bKb+FniNMfHMGHm7Rc/VGAmoUrzw89PEaBu8FZ/
	GAIGqWlVCQxl7eIDjUFwpRxs7n5YPSrFMTbldpuUS+CJuD4H7+IncQf38TGw1xcMu/RV1HUszOM
	rQpKBdjE3N1c7vCjrK+sMVKwgYrhWmMme4PesxjoFlPMbO3Q94OBLU+8m2e3nmQxT1Hau3nTVhz
	bnQANYKxd7XMz8XyOuzjh7dHmtImpM+frRL1pDF7jfnfmj+bw1QsTfI5HhuxVnygdjYWNGQCxpa
	KoDxRG8imvCFnEuPTf/8Y0xl3qgcvYjnuc2vqrOJyi1Go+0zbC47XKiNy1Wh1Y+J79rM6Knouhd
	1dcjpBmlFXQt0BUnY9XMdqko960iJMdIDExqV2lHzMCoKhFud1ukr8DuZcQHbaxe8zo9FA+Jv7F
	GM9vk6dg==
X-Received: by 2002:a05:7022:6729:b0:12a:7165:7405 with SMTP id a92af1059eb24-13504b5c8d3mr8397180c88.8.1779172563021;
        Mon, 18 May 2026 23:36:03 -0700 (PDT)
X-Received: by 2002:a05:7022:6729:b0:12a:7165:7405 with SMTP id a92af1059eb24-13504b5c8d3mr8397164c88.8.1779172562471;
        Mon, 18 May 2026 23:36:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbdcf140sm22614537c88.5.2026.05.18.23.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 23:36:02 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 7/8] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Tue, 19 May 2026 14:35:04 +0800
Message-ID: <20260519063505.883379-8-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
References: <20260519063505.883379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JKULdcKb c=1 sm=1 tr=0 ts=6a0c04d3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ukdo0q4ZjtfF09RWrFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: BCZ32RPBItDCSJgBLFRelwExyF2mvU5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA2MiBTYWx0ZWRfXxHx2GHEnN6k1
 gh9aHhCLTFhrFjM7oF+akBe+vkAPEsLED+UdmgmH08n0PuH3G6ZVknWP7/1J8tORaVl3tUQtsrO
 Hb6HvhgmEr44J9vq6ZRkOPqG+mgwG+uu1wZZX7lIvnFCT7I27Td01uemJwm4Qn+5Y2wRDXnP/f7
 dmO3nfx6uO9qGdQ5y8ssTohIfmMfAZ1DsKEfJMh+dNsJwOqHW2/7iRQZq+z9a8M7tjqFFChVCt8
 Ei337h8msYs1Ue8cSHdoisWF21S3HlK0An+LOUPGNLC0UMZzPKQFz5M24p+w9bP4d+O8aVfHuDn
 lBE+QREiBq728ZBAjmCfptV6QiXbU1mqK8Ka7mojBiNLFV3y3fxFQ1nKzVjc9fPPp+H7kJn2j5p
 heoy427h3stsrFfJtrmIljGM80gwGfAQW9WAsdolxi9Q4VhD3EnY2HObMEDC3jwSm2+Z5rJi3jx
 y752njfiER3teRwJAFg==
X-Proofpoint-ORIG-GUID: BCZ32RPBItDCSJgBLFRelwExyF2mvU5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190062

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on SA8797P and Nord compatible.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index af266d584fae..ab25323c3581 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -303,6 +303,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,sa8797p
+          - const: qcom,nord
+
       - items:
           - enum:
               - 8dev,jalapeno
-- 
2.43.0

