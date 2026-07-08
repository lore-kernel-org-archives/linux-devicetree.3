Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7F393DF1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505920; cv=none; b=TPT2Ber4PQZDnt0MSb4Sltxfn8eGWkwr2BPP1zFHQ4IBiwMwsORhHbyVDEXSZ4HxQ+Ie1uSREOBV/Z85Rbfu6pTcJxnJ1+ZIFYoo74RU+3o7bW75sPE2i7rx4bHiyI+JRC4+8tlV8DhQPyDKL0AxTL0rcNdjekjoYRE6ZFyVUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505920; c=relaxed/simple;
	bh=vgL5xu/faGIzhMMAboP+mSE9wUQOi3QfrQTUDyaaBpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mpa70U1THdq4h6+JzaniRECn/kWgzMherxgUwwB1Hli7XhGukVyYjjBH7Q5jS7T4HIZsUUbqC3wD+Pkfok0zYut30Tq0QOvswfqXjdh5PxqozQZ21MOT+jZ1LBqzv848ogOGscco81slHCqfNAHEdWFTDzFYWsKnsO2M3qKQq8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+UHi5vN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOztmlJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+UHi5vN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOztmlJu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66888rsF2204639
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 10:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vlet6Dr4eNjg6YF1wNiDWg
	Q8y8z42mBnCyt90RKWFpA=; b=P+UHi5vNG6quQkO/PNJhI4q8z2q4ESNtcc7rkk
	zJVveSZy9WT914nwJsqFfksATYhI7v/t+2swaV5XJub9qrR+qNRacqHSWlYa/wJi
	JpAxCEnJ6ouhQPL1eYZ2NWDwztuo0UVXnnGk0VwQ3HCoDDYLT3MUNCMK5EsaVuzh
	GrPeQyVTUH2CdyOThSvt7as5sWv/nJo0VBfF3Vflszp+AT2BKEZDo7S48JI14Es3
	xMzGuKmBy9BQr4jPrz1BY/E7GBymLxZxNuVEE11yF3izsbwpZsCltPzXNByWry4/
	/SNH9m5lE5KmoSPkDIzoNtKp3nEZWz9Vrm3kH6wztymRntXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv0tu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:18:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so11479511cf.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783505917; x=1784110717; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vlet6Dr4eNjg6YF1wNiDWgQ8y8z42mBnCyt90RKWFpA=;
        b=ZOztmlJubWEUUS+XKWC4tgm8uPknIlMC3oTp5iMsN85lOZ9NwED00CQAFW+2buUdqq
         KLwz+lY78OfskE9KdSKzkcwLgKECyW+1SMgTwL/8CFhUuE6GcWetXIZNmkkkEaQRkSe5
         55yzKmYZ+TGKpqvoCdfDVq9DpT+f8FKUQG5c6xJ+dMaTuhR/p2fuSw9F1enX3RqJ+PQU
         ktkuTgg6NUV9hl/LvLg7Vs3JpzWgiPBa3ViL//qN2ANslRyP1ktOE60ACesFcilFH1/f
         g+poRKDCm2dmA8bMXsoHkTyiexLiKolxaDrSiWfMs5/uxmImN6oQoGI5nBzbSVjUSqXU
         mPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783505917; x=1784110717;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vlet6Dr4eNjg6YF1wNiDWgQ8y8z42mBnCyt90RKWFpA=;
        b=Jd3ID5BlLGOuUsT0HoY0KF9BKcb9HmxBJmx243pWaM/g89qvcTrodvTUa4m4hTnzZx
         IO/dBX7eLSaT660vI5GEz0z7wVrYC625AuPLZ17vIQHu+hdmFOChS0eMc7TS2zWx6jnY
         KVbrR6DpPDIuu08w5tpnzE3xltSKgWiK1UJh5bWfvvBlxoFrsPwVPwxrb5aLWuHp7QOv
         SxLVzgkLJmWtDRifdJ2mE5pM86trAeE3NP3VYFexKAqmMBsS4KAfzJZ1+sOpOkya1oB0
         1X4sk2ZZ3s4ydfUYev/nqnPvTuNJqOEh2DWaRppW+6xzgeqdd0zhc1l5UKodXo2sGwVt
         dllg==
X-Forwarded-Encrypted: i=1; AHgh+RqREdbFgX89zVFkJZt8R3Yr2DVLhQDxPs2Y+9UqwEIOvzfxUZ1sUX97Pzm4Xg+rUuttdBmbOuZN2NjC@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqZS31mCEhLjF5PPLv9yp995e017/GCtLuk+9DGPfeuiy/ePq
	0w260F3mZmuIzXRhlBA0Dj9sTduLOJcn+fFLVSU5r9T0QeHkAJy2ZGujVz+ZH4DPh9W62QxSHUp
	rDFIYuQlHanOB59TstxsOvjznQPopg8w6DxqV7unJlvWD6pvcuZ7CO/Pz2KuMgzRmXqcxjRS7
X-Gm-Gg: AfdE7cl5POJjRV0a6D86jqMiRsLFNu50yBlB+9WpapK/DS4v5S7XuJ1NNTjJlz9GSUa
	EENKW7qqGI0QudSKZa2t3AMg5VwfrW5yVJfl1N+RduCe1ei3cPIH4gq5SnNOHORIiEuiT0Iserl
	1xiS7McSquhU4rr4PVxSNNE/cQu40e5E/AFDxiUvQH9KAbwY9rPLIXgnseNUdx3EnJlysnxUJ79
	26xxmx/IjWX1irPf1H+Pk0/aQXEAvR4DCrcjlgiQtpCHyIg5Htl+NaMyae9utKJqXKqVO8G+AHD
	N7EDlUZSZckoWVIWmE5b5VNF/t2/WEcqPO9Zblz/EDVzg7Y+d/z02cy3x2Lk+PcS8a6zWxeiH+4
	TAE1gjeoynbIWOBQ=
X-Received: by 2002:a05:622a:1353:b0:51c:1b22:b84c with SMTP id d75a77b69052e-51c8b4c6ef9mr18261251cf.60.1783505916524;
        Wed, 08 Jul 2026 03:18:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1353:b0:51c:1b22:b84c with SMTP id d75a77b69052e-51c8b4c6ef9mr18260851cf.60.1783505915771;
        Wed, 08 Jul 2026 03:18:35 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm39944636f8f.29.2026.07.08.03.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:18:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 13:18:26 +0300
Subject: [PATCH] arm64: dts: qcom: eliza-mtp: Enable touchscreen
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-qcom-eliza-mtp-enable-ts-v1-1-372020a7a86b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPEjTmoC/yXMQQrCMBBG4auUWTsQC6bFq4iLNPmjI21aM1HE0
 rsbdfnx4K2kyAKlY7NSxlNU5lSx3zXkry5dwBKqqTWtNZ2xHIry3c8TY5S346ksjOSGEVxDPHT
 ogWjRB6qLJSPK67c/nf/Wx3CDL98nbdsHaL4bbIAAAAA=
X-Change-ID: 20260706-dts-qcom-eliza-mtp-enable-ts-f57e8eef6e8d
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vgL5xu/faGIzhMMAboP+mSE9wUQOi3QfrQTUDyaaBpg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqTiPzT+JcJDQMJOHQUV2MTlqOO1Owk6dmcBLH2
 hm2NWnqEQ6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCak4j8wAKCRAbX0TJAJUV
 Vn8wD/9UuN6krOA+FKnjJCZhjss7PJQoq/udWjgHnkUAWhiH363Vztmi1wHykoPTy5p4dOaC3Mt
 1ZuyrsVxq+avsGJOhfmYcqfEtRtXLtHrQAiu0RlGdaSYkBPuKqBB3o0jpbDGroF+V4M1qvMbj7G
 2V5Ef4/Dl6TFqI9Vah2OHqUny/pIa8v8pj6LjvFlEs5rG9vMNXqh0+k5Esb8/F9NSVbc1NXxzxD
 ZafdoRQbkKdxp3X7aS4zOP4AQsL7Dk4950OjB6115IM/s1Qig1m9ix+jnBRNz/fQDerX84QVfoT
 Pyn1NNUJKN5sTWsa2dc2LUk4K8H3XlF4JsSzz74KM++WbhN2c6Ca/CGLiwCIPETH7zxeNGYcXMN
 8wu1LmtiCFVnNS7R1cWmgl9cs9+QgvJK2ntSKysshL1CSDxdyY0bUJbGBRjJ7G0PrhQ4OFd6hKW
 U7PZzfQzxft8nWsUjZOQp+IzbkEnoA/Xx/SWqVrJ55j3nYKKgudbnZALhlX6KYtll7zxZaT4Oqp
 +ksNLLg8yu64trAvtyt3DlaAFtxYA3by/Y0s3VzRbH8dqa8t4neJeJRmdO85czZPUfSAtHd9fqM
 AEEgzdtvJbQp12wpiQpvhHQav6hsyNnyOQtb+QKw8IpGFsO4ppZ91g8frvN4e++4vuN2w5aNIt1
 Ekr3loH9wRTc3xQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4e23fd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ZAEF7KFIOrdsHMH7GVQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfXwmprTW8vgFAI
 l2Y9gzmp5UKwN9okkHvv/K/qL7W6lEA9xmlv7hdN53cqMRNwHCSE7UQMrKtY51/VHChYzQTpWAZ
 C07Lc3/0NHSwwb/16VQrAuj97z3klcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMCBTYWx0ZWRfX+Xp7EYN2jI6R
 qqygvPp0yDQqPdCm7PLKNha5CN6Cc66tI8Yi2/guEPq0r9Da7fUvrFEO1NfbHpVhgjyoahr5uLz
 agK8dUDzn99P5nccqrk4Ih76jnxZWvGl9kw3lB6b+yGGIdsysl9IDzmWXB4bz28Lhjjx5oBtqDt
 r9XNlkgA14t1thx7TK5aw1ccgaPrDo/BVgh6NjwH0oNR40T+LQmr7VWFW1XVhyQuyZq7aqrJ8oD
 sgYOw5TKkta6pWBmS9vzufG0G4EawlrsodiqKe/FXidvdq2ILFKSHqNtEQL2RDpXyz2ksujy91Z
 PtKU3dyT+vnhB06n/4R/GyCktaCP9soLfhwo9xM553pk2u3Z34IZ+C6o480MWycBMEsy4Egeiqy
 +Yujt76pg1nzmbGV1eIgkftqrJxwXttcEhx3Uz96Zn08wG3iQqNKE4RSv3ajaNaiKvXRWTK7OHd
 4pT1QnpIwLPvVLxo8/g==
X-Proofpoint-ORIG-GUID: jH3hMts9iaW6GpSJsL31Q0QYD0sFTlbH
X-Proofpoint-GUID: jH3hMts9iaW6GpSJsL31Q0QYD0sFTlbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080100

The Eliza MTP uses a Goodix GT9916 touchscreen controller connected
over SPI.

Describe the controller, its power supply, interrupt and reset GPIOs to
enable touchscreen support.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index 1374afd9d14e..64d54369a551 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -479,6 +479,30 @@ &remoteproc_adsp {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "goodix,gt9916";
+		reg = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l22b>;
+
+		spi-max-frequency = <1000000>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2400>;
+
+		pinctrl-0 = <&ts_irq>, <&ts_reset>;
+		pinctrl-names = "default";
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
 			       <111 2>,  /* WCN UART1 */
@@ -504,6 +528,21 @@ mdp_vsync: mdp-vsync-state {
 		drive-strength = <2>;
 		bias-pull-down;
 	};
+
+	ts_irq: ts-irq-state {
+		pins = "gpio13";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+		output-disable;
+	};
+
+	ts_reset: ts-reset-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart13 {

---
base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
change-id: 20260706-dts-qcom-eliza-mtp-enable-ts-f57e8eef6e8d

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

