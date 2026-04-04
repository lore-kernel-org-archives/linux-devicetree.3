Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169073AA4F3
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296281; cv=none; b=BSN33DY4sLsfZW+lNpVf8tTi/XGv/Gv6//Zaau4/sxHVjXK30ixSUp6ZSCSvEs8bOV4XFV7Oz76VmCulhy5K2MIgd4Hp/kB39RG9FepBZHjjKAVAJz63WTPuNyHHoAtXbcXBUOrCgG6RZJqWQoglqAJz5fWHUe0Q2PS2ykObii4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296281; c=relaxed/simple;
	bh=c7eWSUnG59J1YIxNERkK7hxru7fbZOaNWSWZCMVrV8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oxSYvYlEZKhMYUYQVJo1NWP32PrtJdJI/eJA7WovjTzDiI8bkHudVOKgSVQr8rFQuw0vhd+h3jGR+1kapCqn4ozdrQv+VHCzjD6LugGsATF77cJ4KuM8NY7b/IAB+T2xYOgjiMKtAEwzO8K1qe57SXwQFtx5VJ/Q3o7OdFxd8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn5xJqFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DH4vWt5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn5xJqFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DH4vWt5U"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6343jQJL2867016
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 09:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI/VbMEggbDWeLIzA0zsoh/0VKEql+AeY0gue2BvnOA=; b=Wn5xJqFZMYPkyFPC
	3/utqxWVH8q9uY2+GorSZmi+ynGp0/vkwyEvhoMIMZLBvp6Z8XGW1ToSamOAnHgM
	Dby0lJI4gfqucd0g+noILhZTmUETw3qS1cafFwlqB29OOJWe2s7QmUgUA2oMaIhk
	BxVPO5a+q0UBnI38PsoA9ef3mOfHmbly5GDyIdivttE/l8WdVmdS7YRa1my0/mb0
	ZxyzV3iSCTAqy2icl3erx0ed8rhcII/Tg+ambQxeJnbIkiEAD0j48Z4YsNq6gLJM
	aqm4V24QUf6eGN6ox2xMoRSULmDxozaBo344Rwo9jhvH3C5/bakY8JYr2Wl94n5L
	1LsYFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dau14rjwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:51:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so82407031cf.1
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296278; x=1775901078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BI/VbMEggbDWeLIzA0zsoh/0VKEql+AeY0gue2BvnOA=;
        b=DH4vWt5URUaEdzzoYPWGKnEFh9YdrxP+cYYsIn9iY7lBCbQCDccgfL74Bpmw0ACLth
         ybG5FzfomLovHREN8E8Qlba+q9jfEo7lNL1rySVrfTVJZIFeq3sYORBVf3owNEOoUmBF
         go2I2wpLzXyNtDKEyQDnLGB2fBmx3SBnwHPp1ZblPfGQpiakLqK6U+XyDI9eD5JMGEdy
         f+NTEF3K4VNUvb+fgQ2v5u6WxMBT4GOedQNpxP2KFTyV/0u3dtgW+oYj+eSs6t9mx8n5
         +C1WgC3V/rIUmkFohGVRbD60iDI6nxY8KB+wjNNg5N+pYaH4qqIAWDfH0RAiiuE7g6d3
         j78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296278; x=1775901078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BI/VbMEggbDWeLIzA0zsoh/0VKEql+AeY0gue2BvnOA=;
        b=UHdz2zm08JpZEynVjC+bGKRpBB+W/Lqn0wRmlEf1kpbwg8sdS3q4VvI647LjM7i3Xd
         nSkXLDnSiSzJzrzWyujIXr5UvMuQ21tubH3PWnQEAwP6xlQ5IzkjFdeoJF+e8diE7SJQ
         dOmETJ3KsnA6492a26sqqZt4uSnNSHIBGAG3h00SVDRuNfw5mx1JDJauC2FkirFHQFPc
         xqstHLd/wFH+2KQLasv8y6JBzgmI6FuJ7q7MRp4aUjnVQgc/b2BLr1WStz/8rMmzGmoT
         XUpaCplz0IciPEjxhm/PAcuuFoIABGuQiQMLiMzNhV8KkznvfRR0HqFRYucMO8HqBJCr
         0qhA==
X-Forwarded-Encrypted: i=1; AJvYcCUDokpYV0gr06Y1RiKkmbSWF2q+tzepuMVZhW6zqlOXkk/BJLsQGgEU2dRJFyzHmJsY5fMQKFbSZDbC@vger.kernel.org
X-Gm-Message-State: AOJu0YwiSBSIZpyKfZPFRR3vM2Zn6MajcnNeq///2NwbMjSa1GhnU4Dw
	8z3wRbwyoK4DZSGv+CXA5aFurzD+oOiZ7mHLkTqGqrZDe5eVjtjrucKG1a3cQJizq62g8W2TCmW
	gkDuGYeszhwSMwdEGaAGM8NLoeZoyPfyEocK0WVj4tgIWPUClMoKsWWfBTzg870x+
X-Gm-Gg: AeBDietCAXYY9SD0/oDWGEwh2JlwoaUeDgDeQinJMIOIQh5n+VkyWi4S6LQbdL2Z27t
	Ol1Hlbhev4bh2bIhEQv8/YgVw0K5V92E1HH0KIUPfYqTxt/Vdj/YbNJZNpYmzr7C9KHc5YVMw8P
	fnpfpKdXKoaJroeCIgYEKB8Up69ga0ryzzVCSkJ2awTJxvyAnftH9nPHPhqSban9SH1UJinL/5b
	xn9EJ+5wx0GZuz1MyqS5HYE/qIGVZ3jRBlLk3KY68IxVvkcCOx0HZZQpsfjh9WZcTo/94lsqJ4K
	Qhzwb1hon4007jgDFF27zV9SxSk7CwQJ7tE22YiajWvkAxnDamljZADGi3HJy9q4ZonwR7iHkdF
	Cx2SSWr8TuMyDPFW997lYg0nMiMD9tGsHiIyntMazAtGv
X-Received: by 2002:ac8:7f07:0:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50d62d25a5bmr92964371cf.54.1775296278513;
        Sat, 04 Apr 2026 02:51:18 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:509:5dd4:7192 with SMTP id d75a77b69052e-50d62d25a5bmr92964121cf.54.1775296278078;
        Sat, 04 Apr 2026 02:51:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:02 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: glymur: Fix USB simple_bus_reg
 warnings
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-3-b8a9e6806e0a@oss.qualcomm.com>
References: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
In-Reply-To: <20260404-dts-qcom-w-1-fixes-v1-0-b8a9e6806e0a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=c7eWSUnG59J1YIxNERkK7hxru7fbZOaNWSWZCMVrV8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8KgD6gXcQFtkgIAXLyCW8cteVmMv5EMe4CS
 CyuLUf1e52JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfCgAKCRDBN2bmhouD
 12nyD/0TsNEGv0B0VtU7Fw9UDPV6I+M9cbOqgY4b3nha6tJgoZlenFo4U0nqCSwEjx0eth4mJz4
 mtdGWCmabPlxbM8n6+/kW3Z//KnCqbJK33LdQQgYsOLBe/cuPG51vmYpQU83xmbENe2WD4lyy+E
 3J9d00l55i6CcZEVCRElJdRWulRbCXrBZ6xOChAB0Op9mstiAIrhhzzzNmJFPxRb+FQ8cmJjKNI
 tm41/mxnJutji0T7t6ujF3Y7KpAFMyGVDg9gLNluJSn1hRi3ZuV/arilZONASc3nYqdaTGHRud8
 AKQc1/ewnqJeC8o+ZbN9hrMYAVIUJFzxs7bHkhH7MG6bTf0NYxB51sXZtYzCZK07uKOMedAYOXA
 WHOoU2R5ct4nfJo2ASjMEbahCnQ48SBnhxJROTOINkbbjx3hNPtyG8hbtPWwyU9svh6bY52m3J1
 2Rt1I/OVBdagqlDn55VBL93Jnp6uLn+lVqiKZwQ8IJAzVeCRROqKtmGOZl5ELw93eluXt5mhHsh
 enWBSt/EiF57d0XmqGlG6+N6vgYIg20mx1a043UqkgthskDzZNdB824AZOjq7kQOijW1BBoTBd4
 f4OqjU/C/JglJYUFtRPonoXyUlGcbtc+fbBnznoUkyNNCt7OhlFkLFHlCajZzQQ0RDvK/2q1fAl
 zp86ZTF/c9y0mvg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX9+MioOnECFeD
 Iik2i/v4oSAv/id2pangfq9aEVepjBh22iH5pYct9gbQtBYXb2mu2YBlb83YMeziH8LvgzlFUoZ
 /rkTRZUBqdxNCGkezn3E/idg57WzJZKWQX2o6ZJkrlCP5A3y3OiYrZbbqcsKmEqKjlAwLATjdvg
 mmsH3KBkwtfjULmD9q+gikuaTOVUqifDo2etO5eKc8Wpe8TOLGsHdBDyJuid6PKzfsDpFIw0Mgw
 1cDc8GAEnXIBx46+pD4w7sYLuVHzycD1sR1FAEKT2oHZO0f9JuZ660rcLTXtgRTKxC5V5PlRcSP
 t3AGg+9fsyTRGehpHoo3lireP2bZws2scb0jAq0y6uPBWm3IswCagd4oYNuhn2Si3edNeiire3E
 Ll7OyH3j8dmmSbBNurbipeEWrPeNmgR5l56GIdG3ETYHOflwDuh7jhtM7S9zBsxUY4+pIpW2k3Q
 4iwnsXPD8NW7MbXxCFw==
X-Proofpoint-ORIG-GUID: wKgT1yoz02WPI5bxg7D3ZLodP6nKE7gR
X-Proofpoint-GUID: wKgT1yoz02WPI5bxg7D3ZLodP6nKE7gR
X-Authority-Analysis: v=2.4 cv=Q9HfIo2a c=1 sm=1 tr=0 ts=69d0df17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mXL7kWYZv1q9rXQNpRkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040088

Correct the unit address of USB nodes in Qualcomm IPQ5424 SoC DTSI to
fix W=1 DTC warnings:

  ipq5424.dtsi:642.22-693.5: Warning (simple_bus_reg): /soc@0/usb2@1e00000: simple-bus unit address format error, expected "1ef8800"
  ipq5424.dtsi:733.22-786.5: Warning (simple_bus_reg): /soc@0/usb3@8a00000: simple-bus unit address format error, expected "8af8800"

Fixes: 113d52bdc820 ("arm64: dts: qcom: ipq5424: Add USB controller and phy nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index f20cda429094..876bf6a8b8ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -639,7 +639,7 @@ qusb_phy_1: phy@71000 {
 			status = "disabled";
 		};
 
-		usb2: usb2@1e00000 {
+		usb2: usb2@1ef8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x01ef8800 0 0x400>;
 			#address-cells = <2>;
@@ -730,7 +730,7 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
-		usb3: usb3@8a00000 {
+		usb3: usb3@8af8800 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;
 

-- 
2.51.0

