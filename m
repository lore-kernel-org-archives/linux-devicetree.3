Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719E3ACEF2
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071137; cv=none; b=hhlELw6pTWzP0OhUaGwXIAvL5eL5GPfE+KuGbRvixUlV6wan0yIvUQ2NgFV8FsDBfEtgs8XDCK/NAnegx1ZBgbICw06XVUXIvmkf/8AEILzVtC7oOZyGpK5AvEtEC9pDbVBxdYd9k9p+LK3qsJAZpvYsajUJ5lzsUtTSGwkQsPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071137; c=relaxed/simple;
	bh=EoMB7UoiStbHSBMeq8ZVueYt4jkQJS1HZckwlVOvKm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GNFkkXf791vIPTBSWM58riOnh3XcynazLi0WwB6W4ww2rjOjwSySVVsqBrR74PkSuwCeGD75NOYObtHjXSJ4lowtPhnFr9RqN+U5b6Xr6nog9mepjiNN+yEGR4R7htUjmZelX932FXcxgw+oEIF7MAR+QdxbB1cSgkrD9rTShEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWYkF1tH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KH4XCXIy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWYkF1tH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KH4XCXIy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5HZM43560579
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/O1zcfGsTer4tXwGzbegxRSeRdL1qrj/XaG
	YJGnMpLU=; b=lWYkF1tH3ofkGXV4M5q0XmTmSNeQQ/3qDdFwfD5QCIfwk5Vkfrb
	Mrt88pErNAxVtZH1nGd/GCUjFeqSrc4ZnJlh+KtFQYpxg/w3a0XURsF7LleFYzYT
	Vg0BG5DL9VqsLAUGuirtlDPuKbXcbXb7xqgy24+JE6QEWh/y7ivn5BCJ2EQc73Rv
	25EEBImIo0TmFdEcs0OFdqx7WZeUFNBtcaJxYQrOjW4yCz5sUFic707I9MKo1P6r
	P8i3yzGbbZkxU9hL4LbTBsCh1UrsH6Ep9zr137n6pQQiWqAd6pUma7tl73j0Y7KQ
	hodcAePt1WDQpssxu6+AvL5mCWMSzsqO04g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0mhrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 09:05:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8e4c29caso102019371cf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071135; x=1776675935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/O1zcfGsTer4tXwGzbegxRSeRdL1qrj/XaGYJGnMpLU=;
        b=KH4XCXIyLKH7muxmLBfmlIuBAAlN+eGCWp4sLCclnnPoyg2tLjUJwuWo3htQ2Q8blE
         KVMiE+CH5p3xQVra0K46h39ZTxfONDjXXx3rfsGejbKtp75J2VZuExjpfpP6T0qvCxXw
         4lPri1orzurDAv2WcAf8+ungwvtTvkMyfEAs/8j8f2X0Zcm6Dk+J5kg7P/JgsAfu7IKa
         5npct8+Kks5ax9cJ6WxrcIL3YK7xvrJUYmBl5ulIOaYABxbDAPMIjkMVhRYEpzk1xJGG
         SL2xaJiseA6TiaxYZN2nEZuMLJAdOSyLGv66qMzFUcfdBS4yqbKwHzlctERLbNABcw5P
         degg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071135; x=1776675935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O1zcfGsTer4tXwGzbegxRSeRdL1qrj/XaGYJGnMpLU=;
        b=C5L5YgQqBk9RKIFfU3/bId/Dz8+DbSFJYi/9Fv3f2aMYcTAi1lZvG6RB5NiHhDK5Ev
         Codtel2Z9S4WTauriafDxF+dT7F5mJkX0ufmtJ0FpUhC6YCPZwb3IBU4uoLKUV6engql
         Dgz2RcnXXvAcH0WLzbSywzrUnlWxsmb7vq3zctqEhZtnAlsA5hkLYQ0A3BW3bBymDjPC
         LNYQCk6hzwWKuiNh2G4f87yuiH3M/7VC9PHs2RuRrEgL+Y3GZa4ZFhqax1R1ecww/b8X
         yRKQ7bkZKwSG94gchow/drQKzpwXJrA6OiwYVJTwLpy580a61LubUcFHi6XxZhk0sRHv
         SRUg==
X-Forwarded-Encrypted: i=1; AFNElJ8HoudFlc0Y7zcQFYnbbOKs6z6MHH1wxnKoGK2pz1QkrSvpQIA8WP3u0oBLNp5i7ms30uT5N2e2R2qU@vger.kernel.org
X-Gm-Message-State: AOJu0YzxEGn6bP2j1m0r0DC2MefLFU2kYhRLk5n10K6he+pqAsK3s1uB
	49O2/WPhw/UJAAiozaWQsMTTR4momUN17g5EBVlCm32FD3Kb56Q4Gt/+bRxgZE1L0gYHDg+Ml6W
	mW8KAXrdCsfiN4wEumYorv48U4AA4EXYhB0biR5d0/c/FVY9OBlSslq26wawnF5+0
X-Gm-Gg: AeBDietpBf/qwDMsofkRbogTH4QjOSBhszdim+MccQKJG8UwLBSHBPGK7MWno3EuMIH
	pFkvbigzLJ6STYl6NdbCKHm61ekuooK1wjpr80g8Zg08VexKdyia1+oUjuP9tydc8c7Mab2THX8
	I0Tuboy/dt/0E5BUuZK37dWt7zn4BUvmPtIhDIfCD8yB4tdAuzGTHx+w70FTkQcyzuwtc8W/3o6
	sfCGa0uR6XcyMQwZ0ikkrWIhJPOI/XxquJkK35KCsivYvHdO1UfdKsqPC6gH+kOUcf4u8gKINNm
	mj3y/BSzliyxLKKUpjMnAL/Hv5ZNu5bUWZiDJ9XdZeA/BRpDw1Wb/LOzGZQ332Ac9YYFiErU8yp
	itxomj7TYyJCxwRhSo6PzwdXCA4EMoZFb5vLH
X-Received: by 2002:a05:622a:1b24:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50dd5b66409mr175432621cf.15.1776071134829;
        Mon, 13 Apr 2026 02:05:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1b24:b0:50b:4eb9:a97c with SMTP id d75a77b69052e-50dd5b66409mr175432121cf.15.1776071134241;
        Mon, 13 Apr 2026 02:05:34 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b56d1asm270409685e9.15.2026.04.13.02.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 02:05:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO flags
Date: Mon, 13 Apr 2026 11:05:28 +0200
Message-ID: <20260413090527.53000-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EoMB7UoiStbHSBMeq8ZVueYt4jkQJS1HZckwlVOvKm4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3LHXtew+/THa/ZW3QxIHoUVDNI8tVAHwriS+q
 I6ibfojmCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyx1wAKCRDBN2bmhouD
 16t2D/4z2IUrfD6nyxcywzUeAzl5yy8KHM2vUnjwR6EWL0dLrTp0N9rqnmSN9BYkrpGeVqI9R8M
 3QP0dgV/BzfrspQgawHEfuiOkUZEMN/6P8IjVLTyRcxiGETdcs5p9nbDpxFt/gwwoSTxqbj8uvI
 Fxb3yWKFvG17X5NQ2pWFSFUldyYbBCib1L5Rkpe97vnbWEOmAT8BujWosj3G14p4RWEKue4P1M8
 8RBmPXtZ4Zm9i1pitYYucoF3DLBtO3smeYT/swtYwAbWSgAvB2L7IBTEOIkcnStDUps7hWXW2C1
 Q7hEnOmcFq9Dw5zYaXsuX49tWQXZ1BYQfbM4of57CYs8KTMLKAyUk2ErcxqG4m7+XsuuIirhjSJ
 PAT55TrV+OMnGfI6FdMaHhwS0WVUbvJ/bc5fU40o6EEiyqlhFRK6yGUB5w6yv8chqtCdgFpW4z3
 lq/OEQLhll+5KKgJ004e0JG6CuNCKDZ4JwcPW6SgCZr273O7Tgrhnvtxib7xbtCEmqOSFUWpOBg
 eN53tCZGGPz27NRq5XhKIdrz/WSGDVArmNX0pvA7358+wVJvkRhdGvbuFrKhV5zYWrTNiRd+L9Y
 iNiCwGTmW3lS3YmEOnY2W8nwoPKuAJ7/6/v8BtzIhMWmM/Zi03aDkiIxNM+vUqTnAVfnDYPrRZw tOxXXiuD+iQRm+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dcb1df cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Fqtji0Tb7apkAwCtZtUA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX2TmUO2+Hg+d7
 2FNqUs8BkgRiL5zmwSaaFNuRdz4KeRteNKTwKLsR4ZrG/2UNKG8YP0sRLIWc8y5dmO8XqjptQhl
 KkGHsNDedriqsnsVFISAr8RmadGExVKVOZhdMPSHOPAssYYKGjtVuXNa+y6OnbzmOcU4yvZbnNk
 XvXVEtpm/GWN6ikIjlUz8knPh7LQSHWkTV9Jayd/2ZRCvAoWdIhiWVrPSaSYMjH27Yl5FtyyCP3
 1rV+yT6emSlVwhtkRBp08jJXoxhoV2hbpXokvOLbzFADnpyGly+Rc+aW1T1379aJoBqRKPse3Pi
 yUBO7zEAfKVh6y1WmPEleeGpOSDPQW9iO/SWx+S8Fd0Lr0Cha2V1AbNTQ7nTO84Z+qe2hjEC5rn
 lpe7XRhSjRI0lfOxRnh1z41KA9YxOqqyJKojWx0xDp9D3FOydDNSEA7PL86Y5gnEnGmiohKsGpe
 6rvaxBfuYjjhPRq2g9g==
X-Proofpoint-ORIG-GUID: EmpGG8W1kyDm_Hs0SyzjpXWHfvsE9Ux7
X-Proofpoint-GUID: EmpGG8W1kyDm_Hs0SyzjpXWHfvsE9Ux7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088

IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: IRQ_TYPE_LEVEL_LOW = 8 = GPIO_TRANSITORY.

Correct the touchscreen irq-gpios to use proper flags, assuming the
author of the code wanted similar logical behavior:

  IRQ_TYPE_LEVEL_LOW => GPIO_ACTIVE_LOW

Fixes: e46b455e67f8 ("arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 466ad409e924..1095454716b1 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -151,7 +151,7 @@ touchscreen@14 {
 
 		interrupts-extended = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
 
-		irq-gpios = <&tlmm 80 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&tlmm 80 GPIO_ACTIVE_LOW>;
 		reset-gpios = <&tlmm 71 GPIO_ACTIVE_HIGH>;
 		AVDD28-supply = <&ts_vdd_supply>;
 		VDDIO-supply = <&ts_vddio_supply>;
-- 
2.51.0

