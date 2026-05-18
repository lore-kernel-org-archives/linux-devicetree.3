Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955FF481AB8
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112209; cv=none; b=Rg+A/bjlV4lqHrwZT97oTFY0issxLidT68D9nYtAL6nJQ106Jt5xnEERZU36efI9S1FFYueJNpHv8TX812ybir93EnIclQag4rLqMU5bs8ia5xF/+mFxeEX5eS50PeQwtB9RWWzqXlN8IFNlBWjevQpFbNdsjzTBZm+chH+UDvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112209; c=relaxed/simple;
	bh=fpyfAuxqXVVXVUx6y23m8FTqtbLsqhHyF/u3USHTtCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPblKSLFqWBuADVn+ny3xj5P+f7gcwnumRZIQF8fEIsJpwdb9ySlyI1QfuOt+jdf0uIusYFhv9wtZZQeIv4F+CldQqJ/wX2N/Ab908/lzRyDuWVZTyBTN0nrJ/1cfMhYPWHpbci+s4pntO2Zfzgp3ufFLUs7Rg70Swo/ou6cNmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTpu+gJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMFcOeIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTpu+gJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMFcOeIp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFxD02701098
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:50:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDqU1NSm48bX3qmgDYOZxIl1cMDyhT8rkY31oVrqSN8=; b=bTpu+gJafC/Md5Ay
	gqy4VZDNHJAD9K2NARbW4QAZ7U3yD1+hrSe8Vvqp/eczGsBKBP6FnzJUcXlEL+HC
	qzqAIl+QfXH1XFQB32V1XIHNIvY5+5qxI8VpnyefOR+Udzm3iWVQpwkWvEEG4pZn
	EeknNQLNNuKF8sKiSuimQPVdDpx+TR8s0gQClSBQKPLeBGENZzcdXisQXV5W1J3J
	CHf61FRZjzTY5DCu3QjQvhvjjMJo32DEsuSTEor5bfg9c3p+8Epv9nkWKQEnPVpX
	jHG6OKFSOutBD7NQdpwBIzkRgF5Z4vVo5zlQgJbj6MquoWmHIdovValZ3utEaA3r
	gbr5Pw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82megb1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:50:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bc763c7256so54000125ad.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 06:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112205; x=1779717005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDqU1NSm48bX3qmgDYOZxIl1cMDyhT8rkY31oVrqSN8=;
        b=iMFcOeIpoVkmHzEoKcPovGNt8WPqgvMpHpFZExtM/ljWi0pJHRKrr98+rZp6I/Dth0
         pAetuH4WSVxadphiUdYijNKIsR4IboihBTYWd2/UocQI8aPuEajiujRFZc1Cml0yOcwv
         F1r5AmMVJVwYoCZUhDsymsTkFT6pUrR42W40a9wY98DTu1sU+MKg9ERa+riZU/cfbojv
         O++23oky5j+PtkwD2E8ltDeeh0YsT3d8aEOYnTA1P//nlWMz81H2JDv+omW0cEhB2boY
         OhqHKYY/2ao9tjWsnJnPLBe9PaKKlqQbazcttexq4AtAZlzC4K+AMI62KensKCBkLH5R
         9K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112206; x=1779717006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lDqU1NSm48bX3qmgDYOZxIl1cMDyhT8rkY31oVrqSN8=;
        b=A0rqFHqrbSkjK7VncNWTmFVxUSW+oIYDipvOjrx5DavlBNB1/2TjqMmjx3crdZoVIW
         auZZo7GLKwHm83UTH5uJCVjvK58376mkheOyJuU8uJmlOKPVkZc6jv0IxEQ157EW7rVh
         LyjZQ8ZQtorZi9hrLb1s6G8wryrMSpMEmNb6WLLO8Fzw9n9AiRag3UQge45y2pkqZT5T
         hrX0x8dq1c64tJJiM+I5rBOJJNGtGJLC25TOwiZnc3hRqPyXI59xgFrYapHwnLvovkut
         hwLRYDXnAGy1Lr26phSTlMGAa7RsLHJN9naTjIdr0i4Jzg8Yj33ycJnCxKllZ1lVyXhB
         zNnA==
X-Forwarded-Encrypted: i=1; AFNElJ+TbFgCUkuxf+2ioC0Y2CTleuXYj+ZHKjtLinVZQvLnTrKHapUgY9uRPKFIjU3x4ml1FfIJWKyBHYQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwDODrc8/4CaD+bGF57kQjXHHZt9gDUZo6MmU3ETjTp+eiB6V3U
	jF0qCvXTTTLQuBrN5BlPndyyXTwwWrW8Nu6jjPrnFdA4Dk7NUIOcu/ASrUKCTklIORaBxcTSgrm
	wZ9w5RP250kBCdWcMabE8p8gshmpFkE+dh3YzdHN5XE7+xOxUS7+/JcX68knw2tQ=
X-Gm-Gg: Acq92OFWv4veGMNpmHVcTcIL3+o0S/u5YfvjDzQhOrxwOSrEG9vkUEt0krybpLPHuCU
	dHbCKufFk3aAaOzeO5JPVpn5xjbMvRrkB1Lf7Pg2j+SzN0u+AUKanwMfASm0+oClg5A07cdAMpQ
	CGhespHi3mXyOd/4KM5PVPbdQm+GnGPeWSNlBtPvUveg6G770PIDUlkMLwRaW+1p3he/ylEq2Il
	VNUkaoxOIfzth8AJWEw9NtWNIsln3S5kjk49yQiWM5nNKQKEIhoYFjoXQz6VgQsJNK0lKNcqs3A
	DjfY1fkVlwBq+CUo3YGmuISaYVB3XHVbLXj/Vbvzol8jyjzb1emJoxxIkhgx5QefqJ2N82gETTi
	0nTFoAI0hDCWNbnwTMVku+JQfHehQ/wSwYjseNaRMr8a+OLHWN5U=
X-Received: by 2002:a17:903:1b65:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2bd7e7bdd94mr167994725ad.10.1779112205581;
        Mon, 18 May 2026 06:50:05 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2b9:8d39:5e87 with SMTP id d9443c01a7336-2bd7e7bdd94mr167994375ad.10.1779112205060;
        Mon, 18 May 2026 06:50:05 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f36fsm185411275ad.21.2026.05.18.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:50:04 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Mon, 18 May 2026 19:19:39 +0530
Subject: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
In-Reply-To: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779112197; l=1556;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=fpyfAuxqXVVXVUx6y23m8FTqtbLsqhHyF/u3USHTtCs=;
 b=a433+0G5gAjzs/fjzv/ee4VIv5e8wLfIG3YETXZBCngvo7LDy2S4jbgYYUlm3abtaqzLO5dW8
 YvLxWXvlnJDDuc5sMFwGzndvlROvj73H3Wxb92lYhYXgVPQWSBLTUwn
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b190e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Lbdm12_SwBOpIOl6TaEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: -2pZTEI6sM5W9rvAXZGEtyijlP6jQyKi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX4pUIEAhZvETH
 mIIy8UFvi8ieSTj/7T2j1u6e+85xF3O9TmL8aKJFl7jtx5pOSYtiVGuafrlOsKfArCCK2HUFNW9
 Xn9KwIITButoA08PFJzCoOUS8+MZSO4z5kirKpo8Z4kSVMKUjGkKgvUHMhLUbCDKWJUOT31my/V
 SXAl53kKWPxfXXQ4oX84rIX0TrMI6SSkhVndmBTTChQCHjx0c29YQJs5EFrxGQr12wuFv3GCQBh
 4v2lA+K9T7oQbcBmgLKVAXYGjHkoBP8l9DA1HMHNYoJx8yih88BELY4Y/ccQ8jqmL+27TzQDzPX
 ZsRPtmyCP799s/EQ1H/JaQJJLfQXmVKX5Lwtx8mBLLpo6mNbKMK+vE0FYNezizM30LdnqaCiNLF
 UIb7Euc+V/oNgL8ITW0TB6dhFDz+KpZcFa3ynMVrKysQS6zXnq2wWVlP3EhqZSr8xoYMQMk9zCH
 pYF/5gxxAqVf3YbECfg==
X-Proofpoint-ORIG-GUID: -2pZTEI6sM5W9rvAXZGEtyijlP6jQyKi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180134

Document the "qcom,batteryless" boolean device tree property
for the PMIC Glink battery manager node.

When this property is present, the battery manager driver registers
the power supply as POWER_SUPPLY_TYPE_MAINS instead of BATTERY.
This is intended for 12V DC adapters, where presenting the supply
as a battery would cause userspace to incorrectly trigger battery
power-saving sequences.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5be18e404591e3f0382ff2b3f7d168..5f7b90d37ea09d9aacff463b2ff4b76d218bbeac 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -72,6 +72,14 @@ properties:
       - const: charge_limit_end
       - const: charge_limit_delta
 
+  qcom,batteryless:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      When present, the battery manager registers the power supply as
+      POWER_SUPPLY_TYPE_MAINS instead of BATTERY. This is intended for
+      12V DC adapters, where exposing the supply as a battery would
+      incorrectly trigger userspace battery power-saving sequences.
+
 patternProperties:
   '^connector@\d$':
     $ref: /schemas/connector/usb-connector.yaml#

-- 
2.34.1

