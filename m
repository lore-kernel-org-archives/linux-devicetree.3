Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5147ACF4
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 09:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256294; cv=none; b=TYSBzU81JPVj680fRV6A0h4oGZVsf5hr2FrSBM4bM5YKID5Y7q9fLTGUdfjycX8vesP0RAbr3ZHCwM7++F4x0UAzVhO7ZD7Hk95dKcfNJKZFR79HUxgUWIyt0uLIF3Lxy9+DDnmXBu8x/R0VwJApKmOT4e9ZutzecvpnSwKOusI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256294; c=relaxed/simple;
	bh=I2fDkzNify1UWFhvkW9uADxCcWHQwDRl3GWqoKy7/b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rF3vnWwakj53lkKIHaTww/wfSCbF7fIn7/5PzAz5XgKstFcA7loLaCVoG5zY0FrMC8zORTEm1AmuCyLWRrEIe7fntCgKh/OPxQIeG0zt1LOzD/f9drar7yeUvvKRC3qNvMCA5mkAw5d2rnSW/bOtmEV+Ordl58509xt0nGVo3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKI+A8mz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdxNlM9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKI+A8mz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdxNlM9U"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681797sZ1211406
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 09:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UvKym6aHIK7
	EK8GspRQJ0SdMsn7ujRvAUZ69QOH0Tt0=; b=BKI+A8mzQyOyxWJF6Pr7gOITDCG
	YXMBxzDOwswcI5+N53qt4YHv7xEhiuLZTFgTNMh2jjLEeXZO8YqFRMSf2nuR2NKS
	BeABuKWedVawmbGPxGXFeqf/HJkus2Vp0I7fcmmst6LEgcj1sL/xHkbMwDroahK+
	dNxMyg1WF/6qLno21vswqpUG7zlLM5V6JfOcXmoqVIpW4dKMs9Wn1uFU+6K87SeH
	30ODe8Gq7ui/mX9+vbo2QW9nsiHDehoXDvHu/8vVk/NZyzv53zWyGd06pe0HFfis
	uWY+TPBQwLfI1OoAWz1W19giUo2kWAS4Eetln7hSQ2cPC3ZDbzOnmZcDXdA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8svkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 09:51:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0aso1392816a91.0
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 02:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256291; x=1788861091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvKym6aHIK7EK8GspRQJ0SdMsn7ujRvAUZ69QOH0Tt0=;
        b=AdxNlM9UQsqJX8D609tTo6R5uHB4AqsJnkgIM/W5TdzHJuq4qvhI1HjqbR5aVeQoWy
         dlh8h2evhufzVM+Mk7cqN5h9eY8SD8cxYciQMikCDrAAAolC0M655Aibl4MLKOoRnaWh
         4wXrj9JXyzr3cUOURvCS8paZ0jvxkhtDo08MxJzigXKwzItuSl/7q1zXz8sujiZbjU9J
         FbpTec/0Hw/j+dcrDN2+10hU2PR013CtxgxrixFZElsQzfVxVCfDfYrJu7ftHqm0HJ29
         iMSFXw3KXijLYyPKc1D9op5ilM+oJDpkLTxjolBYqaxfFDyzYoXFjH/FSABDYmuvVmpi
         BN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256291; x=1788861091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvKym6aHIK7EK8GspRQJ0SdMsn7ujRvAUZ69QOH0Tt0=;
        b=GQkykzJpVJREKLxNIqkIM4CTVpVu+CaxnCAsZvFL1N2wyDhA/sVxlLFe1xkF/eP7Uc
         AnRwvALUbpzc7sAIrgKGYqz4uEnpJxcHrV227KF5efwV0KX4T7kXJOySPsLKw571AZol
         HveKb2hd3ssBqFYrYIy0JHqKL07b0tfQyIl+Yc0YUlhk8H0ARH/Z8Vf8FzmG9b6nXAmp
         GasaJBNsMQvePM3r73bFwL4UKvBwzhJD2xpEUK/HPto+cArRbIpuaIzzLQOmA4gGCRy3
         8c8OwyW2DEajv/4Xu/naj95nZsqOpeRiQtewL9+WRZgxZ6zChupJtXB/1y9d/LQRm2kU
         6Q6g==
X-Forwarded-Encrypted: i=1; AKwUvBwLdLqzsoCsg8q7gd+v4RdZ2O0yuc7wlR4xqBNtN/2ILURXEziwRy7KKONoPlfLgEYQBQtlfdZh1wdn@vger.kernel.org
X-Gm-Message-State: AFuF++nH3S0SzL2yuCEExKYPqv7KLEMjNSeKHE1vyi7wC+3fgkDn7mge
	oB+ijETNWXMxrDcHj1PsWsWUfPqcd+H+S/+ks5pKNpw/A7mo6Fjhluxr1Ndv58Y14rFJVVj1aHg
	F+pDOtPk5XBu6Wr7IDUH6Isvex4UJ8793szSQnbTlRwR4inqI+Ci3Vp3yjE6bIk8X
X-Gm-Gg: AYBFou2j5nwiTW+zMjELLQ8/lhC8S1+rCi8vb1ka8lpVBjmabvG9gC4fJpKzaGuZ09A
	McmJ3fe/qRLE0rBjzAG+L8iXGrfKSdaCrJnzXE343SuIN5uKwZ9+CZyIQxL3XjwAILrL3rUtQkd
	jFUyRt2LvL1WFPdCDcQsScP/cBfXcerRbPFtj5NWTj23vNN1h6gHM3SgcL9ByPnFeqqDky0CcZ6
	h+2tvC1vL4hOrF2LhYV9vouD1/cnZhnNokJyXJCIxkdpvPTOIZpNjwRXKFdCDK6FEiRZyeH16OB
	pPmFIm150sYtEJT8ciMx4vaZWP+ctL5T3TGls5AHBEBlq3/buKsFnrLjP1KPr9peA3CCmpnIi9N
	IlZSobpxv77Cs105Z7KI46IJvueJfegP1JwhK4wJIQxO5pwP87c/kRuTki0SH
X-Received: by 2002:a17:90b:1f92:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3990f78b130mr4966289a91.14.1788256291380;
        Tue, 01 Sep 2026 02:51:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1f92:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3990f78b130mr4966236a91.14.1788256290969;
        Tue, 01 Sep 2026 02:51:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:30 -0700 (PDT)
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
Date: Tue,  1 Sep 2026 17:50:54 +0800
Message-ID: <20260901095055.42229-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a024 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ukKPufHZZ26NhZEM1hcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXxt3riY8L8Zvi
 +z8IQHSwBDZxlxaf7qhisR6Vj2zEA/kbfKPrzzqZfnIqDPTkvCzIvVfwb0MgBKgmOK1yRCoZA18
 HqkDs5LwEs3yd2shhoZ8vFsOfRPT7XjXxZbur4EuCrybSSHemzPyI7NiCMIQh9fgsW+YTFrqrEA
 Ek1yGicsPRKG05T6Z/i9cvgrszB12mIfBTEXkz97YfGspI7DmLTVHE56lRLYurOKm6FCBnq1pzS
 WkmqvlOHjJuWQ4QWL1jjHpJhCHpOxOeg4oFSKqq3WFoF0OoSKN2i0QlS0Skqrcfh6qf+/V2OFlf
 pZ5258ltyMwgABXenTN4Dxt/eODbhTf3Ix0EkA729rKh8ftHoXcPndUTPNhAsJhdeyYHf0off8a
 5jkusWaTFQaTfSx4NBm2wBj5Dhf599HigZ/+uwk/FsnnRbaxrsJnH1yjWvMFafcA2yIC92nhO9u
 qs2yVI7faf56nkoRWOA==
X-Proofpoint-ORIG-GUID: amZbAHClOXibj9zmRCf6JsAYpKyC5K0S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX6uWijJ7Rkx+F
 Hvx6qsUxJuVC8KT/+emUJKJPBSXabXbDSI0uaDKsYrVVgDFAJq9fcDpR90uENlRDRPT7g3pGN2i
 COZylMtEZGIRfL2ppne2momqVXu91EI=
X-Proofpoint-GUID: amZbAHClOXibj9zmRCf6JsAYpKyC5K0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010086

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

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
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 8adfc78108fe..b5ccc8b4d8c8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -27,6 +27,7 @@ properties:
       - enum:
           - qcom,glymur-qmp-usb3-dp-phy
           - qcom,hawi-qmp-usb3-dp-phy
+          - qcom,nord-qmp-usb3-dp-phy
           - qcom,sar2130p-qmp-usb3-dp-phy
           - qcom,sc7180-qmp-usb3-dp-phy
           - qcom,sc7280-qmp-usb3-dp-phy
@@ -212,6 +213,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-usb3-dp-phy
               - qcom,hawi-qmp-usb3-dp-phy
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sar2130p-qmp-usb3-dp-phy
               - qcom,sc8280xp-qmp-usb43dp-phy
               - qcom,sm6350-qmp-usb3-dp-phy
-- 
2.43.0

