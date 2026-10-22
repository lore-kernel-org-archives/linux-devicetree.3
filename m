Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660763;
	b=4XuPbJZXhMpTTtc1BzT/0Xl7dRPY4XhCJeBj3PyrZfgkiRt4L+gnklVz3QD3lPfoKnna
	 vEe6Dg/67GUfclsf22oMYVavN8OhIPLKjbHEEJVSRjDIB37P3Y2scDUDnEcXwGhjHBPqq
	 eBYeqXmrU8ybfZ0McLX7rzQs/uqnjGvNZCl6AD7IGf0BOaqNwQqVYdqIeHGJBFYPKCs4t
	 mdHgat9lO3H6jLgH4a0aeHbaAZ5sTUhwplhd9XFBzkoJhgAGa1EqMMy3CWL9hC1iBBwPB
	 RR7kcU6CS67e0grxNnx1QL9TNTOc1zRzTftnBYA/yn/AkQJqOl8wR8P8JG5H408oU3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
	b=lb4W2CIKDk++bNdflFR7gEUPo8sT1tEgf31mFVwXqUFQH+WyosyIbcIK07HZSjpvP4u0
	 hBuBbwiEqTtRM0QejhyF2l+QERmHqQGfAvPnpn7OqhbhhL6s7CrfDlm8XgAyK0nNVH0I5
	 bEC2+EKZhKZ3icgBMI6XmsCSTmKF69cimNAf7OeojXyDzP04H9zlRMq+fOjpcvBsXkInG
	 1mBSwr17cEXPoRTvK0WZO6pkJatvhwkYm+6yHGIGcyAseQwswdOCdtjEbf0JKpx6BALoO
	 F7QTbkBtgourdj0hqiM6C+Dde5yhYtDI69Ipk2DtNC/YGPyodqX2UCB7aTGnsI+6G/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXl5+Gb6;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48AF606A31F
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48AF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=gXl5+Gb6
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so201338966b.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660760; x=1793265560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=gXl5+Gb6xohglf6t2PtAn6M8rqT9TTuWwPgMpEtwM+UheIq1KRs8zY7QIDcxht8PzO
         1ZPZM24MgSPYmEEdlvK0bB9tF6GRM3hX8M4hvq3GB62Wf9Hq/BSjbV6k6rm9/oqpqI6+
         QD/pyF1oFgvvojgb2GEt/vc5HSrimYUihuOmfp24y37TXu1kydvHQxL6vb9gtANnAvNW
         xakS433LHUxbj9ne7GTnnkWXBBRj0mfV9/oSDK3v1XmBBlPsUEgzsLX+NgA23e+vDL80
         aCT4sMlH6auzjfpbhbY/VyDrvvDEth0whQcVz0H7zvh/+CvkNcpd8+MMIrL51M8uuflz
         7apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660760; x=1793265560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=gfR0da5K93Avvlxk1x2k3/sqWbXHDkK7TOj1efR9waLzNWEVOpiXDHCT7P5Ttm8KLG
         weD9/Thj3ra79wz4Lt7Md/xp+tpFb+RRfBQY+iMFMphriWsTEXQhrw+BM8uQd33njVP9
         nWUdPwLmw4+0NW5K6/MljKf1LYkQu/t9vn/ysnU3E+yNdRXUPwWyZhAJNT5LNsJi1okA
         4gzeRPJnof74SIH7Pi6mfTifloDXxRpjFYCMJH+CJFQjHSIDohUTL4SRYv7oFiRtR3e8
         LmvqZKnVduyNCCGVD1yC4mQ7Cv4GmDsY42VF2Jcb77V80Q6zCGgAeSNydinCMrZsELQU
         7Plw==
X-Forwarded-Encrypted: i=1; AKwUvBwEqH1tBpeEhgJ3jC5YgYCwIq/8gDP0uIKyfJEHx32hJSoqLs/SQSSTAjuVVWpCRKTBSlt0xfNysBXy@vger.kernel.org
X-Gm-Message-State: AFq9FYJK++l32XCaYlYvBcn7S61gGPUVjL7Muna215LWvGSvpQy2EQ5/
	hyU4LYLuzejGiP+CZ62KZZO1tjN1rbqJMpDJ0lRx/AKxqrc535in5oVOZndxk2kHmEQ=
X-Gm-Gg: AYBFou0tobaeFY8Ue4xIhpKpt5hcz64yh/6n5/4EQzTs4j3BVrlhmLTufLRPqWc+s8S
	z4BMCyvIUmfgN9nE09JFi2zZGtt92BixIta+msPKUB/tBDQV3V8EkT9akZxACVf6lzhWME+2Ctz
	N3VOifwVKxkzdkFUXUSeCJlaC4QSi9bXiY3XMMr10A0fKzyEyifSXJU/gvO97rqxeI3etw+8+sY
	SaUB6x12CM9LtPbrCWbwqo4x9hWMJovFzHCBNfQ3B/DMTqqc4zRZBmu4O8M31fwMhTyt0Uknm1u
	UMFvEUKN1vxJtTOyhm33ZfYf5av06QJpYBFbG8Y4ZSWu/4N4TfuVR+qCfu8//wW9lBICnz0Mu8Z
	axGHopHSbMDNQG8MaF99JKCUUqt16ZE8Ky0CSiNc8ZiQc1QS9W5xuxyw90VS7T5eEob/vS5k0pL
	U2sONqKlfV9oqUQmvkwI1mzrPWpLPFiLUM+YaY0ldOWx9opEuyClUo1/Yhf43MM141bvw2nzoM3
	hegl3nMpDs2lGQaJJDIfWQqPdf7L/rb40JhTCE0LUxLop8koDRvv1pZ4CyqzUVtIDgNr1aAspbj
	fYNE5EsOPnZHVbHaQh2bL71/gqzdXqRkSU7ZLxy7xHY0RJNXNAbtwkLuVKMJVZkmE+3d7a/7bJM
	cY2sgJJ5pmQlVl1IqEokkdkI/IWxSVtJRyUWWY0DQ5TwAlpkhaRN+kk4syIvFn98CLjI6
X-Received: by 2002:a17:907:c608:10b0:c46:8c16:a656 with SMTP id a640c23a62f3a-c468c260476mr152082566b.18.1792660760257;
        Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:19 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:17 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-3-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1650;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aA+iGNmAXb9ktbwAU0KbUX7yr+F4w/IPZJ4vFwuykl4=;
 b=7+N8AToHLH9xdV3tCOOMykHgHkC/SjnCyxhXQF5Xbwj8wB5CmBkIGumo/1wSKGWDi0IkaKEly
 nKKRh8WkrzOCBsnRZcvh+pPmdQcgLeB6bDtrGICgzm2J/XqZ0xXceoc
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..76184027221402e57a569d74749350c1482f5afa 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {

-- 
2.43.0

