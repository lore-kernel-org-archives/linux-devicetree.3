Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E9C3B0AE8
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 09:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775296288; cv=none; b=gm5as9vhbdJmgXCtHwNa1cLq/nxbjyynqvYnjJjquLn5CArMp7FcSGbpkS0J7CED6Onri04Ao747DTBl6iRFjxKixHha/+tFome+1JgWrotTtgllwvvp8LVIlhsrUCStnmM3pI1feMaDeCwKvNjUWsZyMoRC5cJGbjEMwP2rKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775296288; c=relaxed/simple;
	bh=vKKM/Y9bnXZHRerJXsUC4qkt/oK1g2pG7yKxtKeCWN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMVjl2cl9T4wKX36AjwOuushjIouvRxc8Bpxm/jNRW0pIBzRn0zhl3hbjj69aa7ks50OZ8cj/Z/ruEbb2jmuWhgh0sreXpfNb3G2wcmu/1WJkllnz7Nu1E5kwPQiGpomXYrJ/ySP02nOokxqVn5OapMvahWLxBOT2nOxCn58wjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSq85/Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7zaFGW/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSq85/Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h7zaFGW/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344e1052973403
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/a2Qiwnx6SWHY/xMsjI7rQ+EvBR25PqLLeyOeKr2tTQ=; b=hSq85/Hy4bnl0Ees
	l4Quxz31vXTABCvSWRxwmID53/+jU2aRediL4Gxz4/0YT8qm+u3D3Fg27WZjbcUv
	oW+emoUrb66KGZJN9Y4DrSFYsbsPwHuPsOjZNhiw7Dma6X0bJyuHO9+p/gpPl7nY
	FED710Jz5gKqlUhFQiHxLZiNglHzkaVlj9FelrnYAXxJEXDQ5u/QZ3prJq7cvnhY
	XF7A2e4MUbCY3fGg0mF5Wzrxz2/aHZty01L1ubrayeS8LCzjTN+syFWYrgciWHda
	/p+waFGXYP3QHZLyhnEEVANzLuMaS/G1/utSYktVsmRuLs6fmM1lwhKdpddPoAPY
	IUkndQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth8g0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 09:51:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5e32bd79so42722571cf.0
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775296283; x=1775901083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/a2Qiwnx6SWHY/xMsjI7rQ+EvBR25PqLLeyOeKr2tTQ=;
        b=h7zaFGW/7nZ6qjXIQwYlD0o9Aq2qq386Z8+ELyBM+Ome6mPxUV1Mh/Col09aaMVcZt
         UtyAU31U27zq2p15DCYUBOud0Y8C3DpXUwW2/Udr0Hvwq42TdyIsxW8Wcqo5DJLw1X9s
         JbVXS65ZpRt+qwFOFIcXLKbBiIvwQmj0hTtTQVlVNWsW4hT5Gjs/dPpvs/8g6TSAFnWZ
         xr31pJ2w/EXpzrjIA3t0M7fMUDTMTyLVexab4c3pfTZUGay3nPrmFaTs2soawQ1OVKTq
         3HvW6M1vUTgfJ0WsB80LxoHWhRR/Mgo+c3LAOJTDrng82u0Pfzfmp+Owudsw0iC4Ztya
         eTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775296283; x=1775901083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/a2Qiwnx6SWHY/xMsjI7rQ+EvBR25PqLLeyOeKr2tTQ=;
        b=XN2DcHi02vuO2WPxjqWb17e7SJq9WQm92BtVlQoxdsFL9GRf/nMGpt4mR6q4sOUY8S
         86yr06SkJ8hOkkJyY2jYdEE//R1beivofEZS8Q0yYVkSdf4l+tzZUbi9kdjt0fwQCPe7
         lRTn1U7VsvX6hBr+E/r9nTqKA7rLh+amuqpPTMA9DrzD8MpW64XN0p2LOo9j3neYJSQo
         aK02xCMzffLn3yza6bLQKZ3wkXwvmKXdQ6tKz8cl20ExQaQpWZkefnWVmBDa3ce3W6d5
         oJF9H6Tdxncztkk8HKrUkRN7u6udyEti/LlML0bxVgLwObaTpDyWMPoofiEz7q6+5LSq
         RLuw==
X-Forwarded-Encrypted: i=1; AJvYcCXCNZas0lbi5GMA42ZL/hOfB0RJyhbLUoGv9iAszMfkwNahzIPDOBCl/MbTw85d4XQkDX2GcePy2ZgW@vger.kernel.org
X-Gm-Message-State: AOJu0YwsO93yqjv45UOIIW2GdlH5jsMRcAzL+UHl7ejI4PwwD7AUoBNw
	BX8tqf2kcJ+ul8qEPrnc1WV4oMqnFMVgsCkWoobhVhr8G3yD8uJndq91FrTnHWTqGfxGgYBCBMb
	n/pRDPb3oD5Q0ezEne5U5ruQak7wt+MkvysCG3Zsyd+OLem8X0UgZYoa8RyHWujmI
X-Gm-Gg: AeBDiev8ToxaJyU9opbssvrKai+hY2i+JjYCHjmOD7UygehORXZhsMm1jtIXucFOv0E
	QXdSuCXKRz5l8PlF/Hu7gZSKN80cDCC8t2RUTTXjjsYiKLkMPJV7iIOfdoAcnjj92FiPDx1XA9T
	MS0vGPAiryaVoyQ3wZIlKVCAFf9RKzrVFYP2rlJIcqH1c7ShoQQbFlX7138VCeGlxNW5OamFE5A
	p1EkvmkSor80BdxvaoiskYc11itZ0cVWauascqWKaGzos+2Hf/8ZZTaE1JbI6YXCaVa9tiuL5Ef
	PUdYrbz46wPqItMlCOGwkAKBiYB2FAMsA41TsAuKrZ/Qg2tIc3FTboAq6zjftzIDR14bgDEtedn
	ezQ3ZEkTOCFgK5MOc8iFo/b+3W2DinHTk5wlQ3zi+xjmA
X-Received: by 2002:a05:622a:1f05:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50d62b87911mr94939241cf.30.1775296282771;
        Sat, 04 Apr 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1f05:b0:509:3c8c:23f7 with SMTP id d75a77b69052e-50d62b87911mr94939071cf.30.1775296282372;
        Sat, 04 Apr 2026 02:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm24098466f8f.15.2026.04.04.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 02:51:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 04 Apr 2026 11:51:04 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sdm845-mezzanine: Fix camss ports
 unit_address_vs_reg warning
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dts-qcom-w-1-fixes-v1-5-b8a9e6806e0a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vKKM/Y9bnXZHRerJXsUC4qkt/oK1g2pG7yKxtKeCWN8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0N8M9XPTySk8rtKJdPSQCvcTzUs3opPXXyAJD
 dSs8lJJX4+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDfDAAKCRDBN2bmhouD
 1719D/0QHiJRPD3LwR+cIfj+ZqNGgbXkeoEpscgEeBpXS994L6XtM9QwPhzYgaYyEHNUDDdpYmd
 XnqbhftSZjK3AR58VeGe8irPYopj4qzX6y6IOHgzxWzNy3OD8FnWhZwKVe6KDqcefOJph4uKKAe
 qQVnJVJlKWGlJ2619rrkd+lDjtvTqItz5FTB5lT+F8iLPPf0glj4XRtiRcrsFWzMs6UmXDlI5m7
 zD48RGlOq1cU2d/8FJcrdvKJiLv8KlO693IjpO61yMJEyvB1rVBLVjUMnKIYqUR8XBVjRilK1QR
 2X4uZzgjvLWYAwcLYtL2UVIxrasURIxwJWJaL2emt5hhwWEewVVdpP1JCCxjFfTMaqm6YiEUXOG
 eH2iyHhTrYqemfRW0AV3i3xZ5MVF15QyWV9i5q38c2WR0qiBcZo8XPDgOlejrqxeuP4CNTM0GuB
 k1OROssUQcRulM6bGCBpEYBizX4ofA6E8tftQvMTQ4mytChNR+iZM50AuLfOfRxlu5EchTp5VlJ
 NF7RijJ79SoKj65w6tj4Qosu3e5C7uQaLptBfHytKz61QE+f6X9R7Bx4nEJh+HnflJP/x12A9Mz
 n8mEhXeYKPq4XE6PVLL2IUYedmL6N51Z9NklPUevadwIVwu1ZOmOEZjZc43iorhk0dUbzwpyM94
 YEjS9GG7addcfxA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA4OCBTYWx0ZWRfX2SWHRkf35Abj
 tCjLqwyl071FztHM1YZPxyGn1x5j06JUdnFkD8iiHVHuKjMONcxtWtUidxRrcmXPPMnsx4rZ5+0
 BAYBZ+gcDUjeI9uRBZ9SM/wVfkfweccnOuEXi5KeNfs6BO71YPJ8BLKj7zL43M7Fz2rIbJ5R5Te
 dgTbRrySwqKb5fSLNmTdLMQsrQfVj3IdyXaYMIgHmGb3tLgrnvqctyCiGuh29Uv7gzqjyG6epdr
 UTDX0i5Q3QVOUD0pOqKlxsC/UzHYwdCDmD1XhD9ThKdFew+KEfu9MLndgxpZH7mCgzUYpH/H3mz
 9z2m9IXQIAHc7ALq25b6arByGX3zNGeuZlY4Xn2m07G7pYv5J5CkLMrjECjldwe3GML1TAxB1W3
 zszIYUN6xgZxXi2O2egtYcPqD12dDdzBMlnk3gDLP2o1ja63i3zpcnF9IRsv4DX9tPpPS03FPqg
 yg3+qB2kJ32TqoMkp2w==
X-Proofpoint-GUID: qyfVP0PPgxJsgEI0IUTeWuckDv7BEQTa
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d0df1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6Yl2zW-OJvWZmFEgjvsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qyfVP0PPgxJsgEI0IUTeWuckDv7BEQTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040088

Add necessary properties for ports node in SDM845 DB845c Navigation
mezzanine overlay to fix W=1 DTC warning:

sdm845-db845c-navigation-mezzanine.dtso:19.10-24.5: Warning (unit_address_vs_reg): /fragment@0/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property

Fixes: 30df676a31b7 ("arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index dbe1911d8e47..678a17c805f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -16,7 +16,12 @@ &camss {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			csiphy0_ep: endpoint {
 				data-lanes = <0 1 2 3>;
 				remote-endpoint = <&ov8856_ep>;

-- 
2.51.0

