Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F67331A41
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296274; cv=none; b=WjdSBlfgUQcxAeEvg0xVkZQZQb+Pd7y+9nHWFN8xu9nV0mLiASKxDGHduEn6LubgjRHfSNS2TpQ+07GVYOCLtISPIrcxuBt/ii1/YjUgJ2mHGXUusyJWjRIYHvYEkTsvjDVLI4Yup5E/B/NGbzht75eKHUpnyBnmP+UWr8D6wA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296274; c=relaxed/simple;
	bh=subr1r/NjBqgxGfDZAex/s5p8C8AnxshMOdsb7dnhLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gxVNYxPFZ9qKhLWCJ6m8jIrVqQbZiVgzeeGxkSXONS9I5pwhjawNAW+HIqfTd4Vnx5Ephk5PQRwGN0P2PQwfCXWvjBlpAmusGMj/5IVugsU48gU+CwZgHkBB7jUUBM6asVmZafi2I8GX6KjozVeqODxp+nah5WNJeAmjm2eektM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlOuKGTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7iA+z1u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlOuKGTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7iA+z1u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340JeEC1309474
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 09:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vhrV1gV6/mbGaXRde4PoZk
	/z1UcVJp7UYj5vSm2/nZc=; b=KlOuKGTtJ753RLOcS3ft5UlGmbYpJoFhnmQWFZ
	3edRxONsEzN2vhLrTIXSxWGuipTGfC9zA3lMr1l+PlIPPTrEl8Fy35tZJOJjwQCq
	9ecA8MjWSFYjFhLH0FvPrausr7XHKItc5JuyM+1TF+9k5D8QHN8ppT8///DXWQ2Q
	Qrq28SQEp0d797gnAV/Sfe/1Ss3YgpEXf1UvBcYVCwwotellCK8tazlaOFlrrjCV
	l2kJk99wD0iIGFVSDBoP1GPUwCZXmNLkIL0LoUKKfexdhYnfKNjW5sbUibWRbvcK
	W4KVMNapLHv1/JVhPiYMGmWw+oMXwse2je2X1ETCooiB7YGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mgu4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:51:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso30562861cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296272; x=1775901072; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhrV1gV6/mbGaXRde4PoZk/z1UcVJp7UYj5vSm2/nZc=;
        b=E7iA+z1u13M6oDPYa16tMu+ReT7BddwEpCFH0RW6VN/W1lbCOiW1s1N/Qgol+3/GW9
         tGwbZmQeD+y21DOiJZ24LDSJ1t9m9BkXha+9jB/EAuk4B5kuXtqBeCUGT6mgGEXG983i
         q5N9I5hHase0ikEzS0vuFqbBp1BMoAyYsG/F3+2l3flBJaAIXYhvEy9OWwauvp+I5sKr
         5B538AhQ4QVUpZTfnuavWetK5C2tGHzCFM7FzXbtPNGru1ED1w3p7U5XgPZR9W3wo/5V
         nS0/2kBWx+SrWXjcGxpDGLAzpuTIsYdkO2SY1ul/ZS8ZtNEFKLZx4ip/UEYjxviKKcgB
         gIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296272; x=1775901072;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhrV1gV6/mbGaXRde4PoZk/z1UcVJp7UYj5vSm2/nZc=;
        b=l96puZ5/w/IRoMGW7B4IZSfRP66I4jCEBQhevoxVyaEbwH8ZNujQkxX8f2Hp10IWmE
         3KVjUa6psU7kauca21PbRs+MLGVAGCiLjPVxPnl+a50lamJRrgnzUpd2e2yjgKL8QR9M
         7YxqxrFMkfxkBjXIc857TEAtambzI8MHuwW25TqjQSqnmy1ySyer0eceszMIykUNnARQ
         luXBcFCcs1xhpKYIszV0lAGkd6RnANhqUmBF5NTx6Kb7CEsdWPflCsJIl6TnWU7WPcrM
         ITnMox7kGrabRrmlvGUJ4aqTGihcvpAxpXUxrA9SCZspHyYuYfxEsC/uFzR/9ZPE+ULu
         6P4w==
X-Forwarded-Encrypted: i=1; AJvYcCWefugHA+hhucvZTBLuqRq80GVp9NcC453I3Agx7RveXkkhe093E5E0rZU8y4439TJZJHC003KSrUGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrstNQ26YssjmAys+LnNQW7WAvLKgqOiE0Dh1OOvTJW5vM4Vxm
	VsaJwxtnvSCka1CbtVLC9fhSvSAFBt9AHb80u9c6NZTWJ54x0eeWDU1Mqsn0IW/7hv7O3YRmW4x
	XuisSvp3VeEnJZ1aSEBjrtOQYnXqkSx2Jv5dcJRfYway5PAP2KtNHAZ3RO82hks5Y
X-Gm-Gg: AeBDieuRqsUyM0ab3PdM547d3bPYdjk2Bxp3u1Ppjgcd6GuQbz7oWZ1g/y1kJcZM6Gi
	x4dROHeFyn64VCbo3DYaJ1yD925/Uw89e+cxPa88QzQrdRBRPm5/z3P2diEj6hdcxoT3iKE8bpa
	T7ZDLKiy/va+cUebmr+m0nQ6dEWQGiT9P7mNFOMpQBQxxWUs214+gFpFlhY1LhJDN4dh+kzzVSu
	qRgQolZGpAqQsfmEQ73t5fMBGGhmHhSb8NNQ7SJQHBnw8IFRucSyG2ZFPn58i3kPPEpn2z39zyW
	61d5ww8n/o5MMDq0t7d5RhGwje9baWA+mwvjgpeV5IbMpJmVkg7SrX8cX2yAoB65teWJKatS+Vb
	p+YoQSZCPTWB3XPaTxDDy31xWLYdeaaByBMCga/h11WSO
X-Received: by 2002:a05:622a:244a:b0:509:1949:7b36 with SMTP id d75a77b69052e-50d62a1a466mr89117811cf.30.1775296271779;
        Sat, 04 Apr 2026 02:51:11 -0700 (PDT)
X-Received: by 2002:a05:622a:244a:b0:509:1949:7b36 with SMTP id d75a77b69052e-50d62a1a466mr89117401cf.30.1775296271310;
        Sat, 04 Apr 2026 02:51:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Few dtc W=1 warning fixes
Date: Sat, 04 Apr 2026 11:50:59 +0200
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPf0GkC/yXMywqDMBCF4VeRWTuQBBXqqxQXuUzrFNQ2Ey8gv
 rupLj8O/9lBKDIJtMUOkRYWnsYMXRbgezu+CTlkg1GmUZWqMCTBn58GXFHjizcS1NbUzgVV64e
 FHH4jXUPunt1tmd2HfPo/wXGcPhgEy3YAAAA=
X-Change-ID: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=subr1r/NjBqgxGfDZAex/s5p8C8AnxshMOdsb7dnhLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8FZkXQl5YDcPuGr8qJLXAafCtXHXTkLpIHZ
 VqAu2aA+t6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfBQAKCRDBN2bmhouD
 15rjD/0QIKz90jyl8jl678rm7NnoaZZ6IilgfgesfvoyxXr3WC/a+CKIuU3T46Ww2QqXEOw4gKy
 +46h09fKyGWPbJnjX4yHWS84nxbZfS7RJkkvVRX27P9T/1OYfOhGSmaCEGY0D6oCn9EqmEORHmn
 FDfGKFwqCTV59rFv6sX4UC8ey12gtnx7xOw0KKmYKxWtXZ0uy9h++CPp9WAISfv0AJ2e7QEeLUV
 vAl0E6BAmQkmQzNeJQUEUr/ZHIJNXWtHOTod8p9i63Dz92UFZp37TeF/tvotJHoi0P8GjMMHeCS
 f0VCr/epL/qOiI4puuEoEy3LuhFPb8NYniutV/DdQmxYI5ILMezgNwwZkh42OcoUrG4+hpv+Hvv
 U06gVNdpIhXMW7IYN0c0JMOB8sNDRQ2z6OO1VGBmnJopZFv90q6xOvAZVjkXbtF0HEt3vdy1TDT
 tGIXlJKOQWq1yNRwTgONsZBvjVL7hRAJlM6niF/f+bkn63L6N9Ho8uCGZrSrwErSbuy5VNybFIz
 u2NjNJ4ABBTDaAFl5ZsXfH5WwTKqfRSGX2v0ZC0XSS197dHNlN/J92gSj+HWT0lmJ3dJVziUoOK
 UT2bn3SDb+7+WP3ftPtYSB2t1353GUp1LSgtg/J+5QZwmNFJjmk4bAjmoOn/FlJ7h1v5OjAm8tj
 Rt1E7rA2cjuhB6w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 1ySmiQYTbcwvMqNAlMYvu6YKBA1LHZWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX2Vpht2/gNQuc
 D0AzSs7z8OV4MBHDz45VxO/5FNX4jaT2gez8gNZurjJjHswgt3w1BIjGDJlqdM+fp0md88KBCv8
 m49kKGJxxxNSzOZ99L6Aikd5GlCPpwQgCiVfHi4bbySU7iIB2JwN31/q6TLTum2sYo4tRqXclvC
 O76YZjvbP2CDVjPNY+9ecS+PnU/e3nCJk7S0kPH1E5KW+QlrCviAO/Qdrc39XmDzmW3SltlnatD
 h8SDBYObpafvEoBYXuCtrPvzHye5JGmNUTEMmcr6ecm3JN6dlu7fzL5ejZ77/w8aNPp6Ap0JimN
 4DgtDwksyNDmA5asrgfommKHVZRGOdkm4LIkOHdWvYbraOSlgykE2rN4emcI8YEATQSYrNtz0dX
 YNja1hBnCSA5bUx4ondX0NRFJkPSxZOd2OP8AixWm/HirQsJPxMhgmayaTdVh6K0R5z+eEd/Me7
 fSLXG3kzWo0/c+rCuMA==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d0df10 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KhWeNy8F5nQL820tRQsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1ySmiQYTbcwvMqNAlMYvu6YKBA1LHZWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088

Not marking stable as these do not have actual impact on user, but still
warnings are not desired.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warnings
      arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning

 arch/arm64/boot/dts/qcom/glymur.dtsi                             | 6 +++---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi                            | 4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi                            | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 4 files changed, 11 insertions(+), 6 deletions(-)
---
base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
change-id: 20260404-dts-qcom-w-1-fixes-1a25bbd0519a

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

