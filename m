Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE9735C6A3
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109438; cv=none; b=mc1Qp171ppJGLYKTpnb61j9OnHhFg7n1TSyt7Eq6EXXNQqoAB/33QNzHhv/Y6AilhGzvQKewQkhoqPM5V9cb6bw1iKqwEwGtaeKTTqPI0/kwIr6RL+cl2GEnH542oDuC3jjab0Kd9AyCndoExbffv/IcY54VYNu6T35T+58dt2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109438; c=relaxed/simple;
	bh=ZwoMA8Ox6Voxca4W7TxJCuuQ62Fybafvlxh9RQQvVc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7p6WlhnA7P56nTeH6/TI4Y3k5mq6cDsZrwyU1saT9fV1Oa2gn6dSohTr9YPX18BTzwvogbsPLPSjZH1ER041A61guEpQYJznCON4lfNx4lOtw4v2bzVfiVzHQGwMvO0WsILkQFNtLpMNHQIHclkNdKQYBAHX/G6CaueyE347Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVjP7Eri; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IatUjvOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVjP7Eri";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IatUjvOX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B6kSas3909220
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=; b=iVjP7Eri5rcITkXk
	QxxSYxhar/tyMUBg3H9jl3lhWoUq0sqtuR3SwgnxdJgVW1+cvKJ6nyceKxB/I/W+
	ak8e5MimNn+GF9dDCMfFavlPq8Ma7/e/BhqOll3KdY+Gbd/57EuJWz+gkMfnzB5O
	0vjvEslzFqq0BmLPim6ccy3cSeHRvLGPesAJEJViBj5Xzo+IoXo59sUJsP1qEErQ
	bE5LrY/zpIx3YhSASKVNw0Ez8AGlSgWHcv6aUA/cEcG6QsarMh2SzizVIRH2W7z9
	/HJlEzE1IxjbMib/hRQBY2DpRTKwvZ4uGZKK4/8Z57b2WvKXkTC7h7yooUUCyskr
	acR0Dg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q125ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:50:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc2229450b4so567850a12.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789109426; x=1789714226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=;
        b=IatUjvOXAGtTgJB74K3//3AX/QdZysEXAygvQ7vu8pKaCaW50/QCY/vWoOuwYiWgnw
         BNB6nOy/fL3U7cMy6SyYh1nmd19iJYMzpLt/Z2wuRw0ZsWCs/pe0vpM5lSGdcLezESGE
         zAlEqbNGc/pi7tuhELBals6qDyhnqNuLbtETMCCHvpYMNO3cm3D/m/P+XkTFSbgVIyh1
         NIJsR0+XKdbvOHPAJ+co1AScyqjeCcsT6tcZR+OwcsXCFhCRz5cQN2CDViqd5u6Ite7p
         zSznupc1vfkQrFe3RQZiHjzqp3RbEeIR43uwLc2qt3y276JW4Y1ro4FX6jRL682VWy5c
         wKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789109426; x=1789714226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEfHSxWSBoTQlF/WKmI1REOFxvDDF31aFDbnkZZrKtE=;
        b=HQjoHgbYZhBBqa4b78LAT91FLkdPDlmgnoA3hKx+W6F/xOjCbDcI1iW3ad7drxK9+d
         I2IcwczSiL5NbuvEwagBgSGxz5mhprSdDaTYpQIAIZHkYpLRc9uS4HkQasiHms2zSQyr
         aiLhqiEq0TS1VqdKmmvj4uiTCYqiBrrmjC+7XQsHH0+AbjScLxyCDMHvrgpixGzWqde9
         jh4ZJOotxkTsbSBdCwxsxQul4784gUMHmtyUMrzQ9eS+CrgtxHjrf04uL6yl4E3ymcvH
         oPcTgewV6TOP/NzWaiAzUSIO/MVjwNo0Ih2vtyoOt3251xqyQXEkzy60zOTc0cUOE0J+
         YknA==
X-Forwarded-Encrypted: i=1; AKwUvBxNeJdGlUxdODa8JYzPlVk/hb122jm/xN5xoSpqTmMqSFAJdU77NhrtODRS7oGpDOiJZi11umcKn0bY@vger.kernel.org
X-Gm-Message-State: AFuF++nf5uHerv3ZG4YoM5ZjZofjqMWiaveiXIH7V+1N9ClEtb62BHqu
	kE9yKdc5rJaO1JdwtgKdKvQjCgsZI8iHdPifM6blx3kq1QMrk4KUTUZMCY2jK4T4J7BKStiplJv
	ub8znkmrD/IgvA7cGJr3Lu8R/MfNg7myONm6dXU83Gqa+18oL1uCPWy/SE7yVikij
X-Gm-Gg: AYBFou1qhp70bgywWjKRpU8ISUZfgdb6+zC8uPnqgsI7XSxXgbShcxx+aLLzLUHbLmx
	XnuqZl65QzsjUNs9xY3lPhPAL6WSshUHk/t2e/GWVLWpPEpxljvSX6aLN9vFQaNb5jVzkTk8ZUd
	3Nscc0qXazwflKHWESpnCFtyo5KL1EuGBSxcQJUmbAi32EqP1aQf/SwcrUZljavGNJ8uWHSCs11
	pxxi7aKTChThijLcMRFINIHDuI3JsNcsEBU6DY/hll7qpxQshl4ENfCWWoYKP+o1wO1L2xmf8Px
	bCiIHFIk3xk3WbLZx/C/0xHIcwJlNlcJay+gucUXBesllO3Y8cmQFx/boh6mvhtMo+MUmkQDhQz
	0UTeddt5tHfr4KmkkzTCNklTj742bh77fs8Y=
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr4510208637.2.1789109425696;
        Thu, 10 Sep 2026 23:50:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:b598:b0:3d9:3626:1326 with SMTP id adf61e73a8af0-3daed14f694mr4510155637.2.1789109425258;
        Thu, 10 Sep 2026 23:50:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm3934383c88.1.2026.09.10.23.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:50:24 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:20:05 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: hamoa: Add t-power-on-us property
 for PCIe root ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-t_pwr_on-v1-4-c9eee197d082@oss.qualcomm.com>
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789109406; l=1295;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ZwoMA8Ox6Voxca4W7TxJCuuQ62Fybafvlxh9RQQvVc4=;
 b=VeSKiwNYRtY2YbACkPlI4ykxtAOab10+9Np46hXK/j3rcKpDNEwaJfxvNDBAWBXs30lhjb9vt
 BeY9ih9GK+oB7s6k0I/MlFPgOQROZqJv3Zh2NaO/QFos/IkaLcqKqLQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3a4b2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfX9r9OujCMjnC4
 LhrGzjIlkWW7QSppd+L0WTmI/9PliEeUcdvdFxrmj8gmcSNnFUO5GAx5T0T0u4xE0EwJJtTrKjq
 sJDmulvszAba2z84R45/uY2ihyYhateR3f05TSnJP6FfACd01saRwvrNTotPRmPDsN36dxGB4cw
 HxwZrORcm5+9s9QSe8db8mGY1KSJ7VIx64VvAtqwSPkMCp2BewebvblV7upbGqZA186IVfaf5Qk
 AsL8/Y74u3IHE+qYqoaq/PCPMUiDLWqNoRT3TB7ihCVdjesijdAPxfbkXdvzYpMXMNHEdy9Tl9p
 miH0zy/zSER8LE2mf1hxgzFLYvPJGxzWvDwwoUCMIB9Pi74GYuVqb+zIkC13zLkFJrIOz943sxe
 40qIyS7ENXpTU1Wn5S+i5mC0HRGbz7NRO7oTLUy0DUlQ20rswExA6YHXuP+S1l+lz3iNmgn4seN
 GoujlOsAWaTpUFsZ+Bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA5MyBTYWx0ZWRfXwCIJxQi2g+ov
 0CXhsMnFBMjxwWdhvgZI9u31YNLUXuNPB8pAs4x7x/L7hldghARAh1HDhp6wCY2jtnHD6V9W7S4
 u28kp45iBcf5G4oSzNILIW+ZK9wU3jo=
X-Proofpoint-GUID: 1bZ2yeCpI-kiXibBt9BN827H9dvZDCyU
X-Proofpoint-ORIG-GUID: 1bZ2yeCpI-kiXibBt9BN827H9dvZDCyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110093

Currently the PCIe controller is not programming the T_POWER_ON value,
which can result in improper L1.2 exit behavior. Add the
t-power-on-us property to the PCIe root ports so that this value is
correctly programmed during host initialization.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 8a96ea1bdb9c..2fbcdd4e9088 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3374,6 +3374,8 @@ pcie3_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3514,6 +3516,8 @@ pcie6a_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3654,6 +3658,8 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 
@@ -3793,6 +3799,8 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				t-power-on-us = <80>;
 			};
 		};
 

-- 
2.34.1

