Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A284483820
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027160; cv=none; b=MLP60SzblkwsWC/PPlNojmLKie749DccRYTadpUOEmBycVXAvulg/j06JOunNc/98/wF1acLOpWksowWqevRhA5GMxnjbbX5sSgb8qnmNEm0jlWBtiZUk2gYmTMcEXCuLIFKq58Po5DrCgHWk2rVThzGgANR4PU9D9s5sB3xwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027160; c=relaxed/simple;
	bh=WoEsQQXEHcp3Z4NugaMqCjtqYrDzpmWHIggHogkIi2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJmHWo+fY1hPtS3D8l6rM5avkMaMb/VbnGisG0sFNT/E1bcz//o0WlUC7C0JnuzrNit3155L1lwVXHXSk9GfHVMKmyPdfpydT4Hs7c37XU/YfdkOXYjcnRaj0mQIRNaNgjy1S0LWtqHVxpcle365iBd5qmYrRSht2UQUqj4F/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dMUkAwfR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tnr+iYDY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dMUkAwfR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tnr+iYDY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nevq1277839
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 14:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=; b=dMUkAwfRDd94ITcJ
	ThymBVvr/uAsEmhYltnLdBgOLtGCsM13SpU7I1R+KHqilUROU9paqQKO7XtDhetg
	PVBuBjYCGdqam8jYXxy5T/qiV040YQCsxhS8V8vB3mRVIEMRFD1a7zWxDwFDd5m+
	sK9D1RK+Tyo5YQvG5VFtoS6aqFxRUjKyQhEIRIt9fVHW/zuCOoXKxpJmtDhgBncg
	ePMBEnGgV1mGvbRdQysHF6yLqNCKv6W3k/MIW5i/HPTF0aoWIZzQvwUrhJ9K5FnQ
	+qqM8x4p5DhndF1jJL0mKHQ+9Nw7DYmRDAS7S1GVjh2lH9CSBrg2cKAH4yoL/jNy
	CLLUpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuejra1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 14:39:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so25057771cf.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027154; x=1786631954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=Tnr+iYDYkzUXcH3Gg/w4Yw928wlkOdJHjzUauMzjBEsa6NSoewCsOfDzQiGnNNQdA+
         /78cPEVZafgfuaAh+Rb89r3gxmO6Ftr6Or/mrHHC951Z3H4646+yxiLg5BgDnNRB6f9i
         D7GOhSehre+ReyV5/gWEnjxm3/I5pRuAUkwGHsn1+AG2YzWT2LBB/1yZaZFDYcaqS4xs
         K1k1qHFRMxNFUNRN/FEZiTno5t3BZXQRnM5f6PCIqa7xkCV/k8w13wsY5mPqI5a/qW+9
         1iFhIpge+ucLbh2pdhV0oDU7WdHUrpPTttWE+Oilhb62uzM6L8XCxYtZ7zU9hVGTcihw
         Ix0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027154; x=1786631954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rc77KXcNF3bATkg/J0Hcy+3fqulP+axrKTzQn99rjZ0=;
        b=Ru4dqgdOy0Jj+a0Soi5CkXXCUFQwLv5xH9WSrl93W4lS5KCQjVeAa9XR6ib5oumguz
         loLfVk+ocDTldP0jhWKswfwRiu6B0EosJWZPzhVgSkh5XEFjYcz4lC3a3MEF5vh5zQQD
         NfBJdMvGBAMCuA1nr5rXWI2AY62yC2aeoiu+HEc8bgrIF/u2e9ImfxywaXTTiqu/KOF6
         LAyjfmmtHtufxGza6dmrgmYFWplcD37l5HIqe/ZJtHUfxDga+iNWnRcHe26WL1u/WtqX
         8lgBcWM8JmvEjRcAHnnWcsKMTZNQOYxxMDj6HCuvK872+Ldsp9Ai8z4KzUPSYK3Uu2Sl
         V3rg==
X-Forwarded-Encrypted: i=1; AHgh+RrLt/cDd6PMtrJV3noquN+r/i7f9lVCANScZAL6yj286yNNqHtGJCDNQcowpYdvRHolcB4v4TvRATmZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5K681XRPZlZsRIzSNmxejLaT5Jl4+TdxTRauF7u4okixUyPcr
	NTuyFJbR/8q7GkfXECP46KiJQdptq05euYAv5PStylMqhq4/SVOk+7mOf3otT5FiDGLI/zz36w8
	dEuN4umtDdanQu+v2kAIW3RF/lFsW/hkCmtSGw46HcMweN3PtuuXWEUO8feG6Wd2Q
X-Gm-Gg: AR+sD13CF+Zu/YbWxzfgmF3JL9nlyxmyZ5Z6vJGvtUck+CWiQkPvNeN0eYzzLjUq4jB
	wYY/EPtTn/atS9d2CaFZYfBo7JSPSmf5mKgK3VQ4eFNuhvLtj9nm9oMyeuk8lDGFXmTz3y+MdGl
	78AIO97sEue2qDThVzBUOthoFwTUaR/g1AXxjtDk6znbFWgkpAYZ751ytHjO6RlOjsq+++MB3iS
	gDlpGGke6GmhgL1rUMYUJqmgrQAcK1FDmhWmfxRtcGkaE04KWbSBk+0rt6UEuwgIk6nNRlsyE+G
	vCY0UPi6Fh+OWzpkV517yZDg/45JwGJwppOtiKbaCm7C6YIabJXIKJyUuQR+xBDKZXv6MiogKlv
	6HBJxRuYi34vf7V11eKVCTFs6SGBDTsipl8bx9pAWVReCPjrai/y4TGpPibmetTb+0kEieJiZmr
	CZH3FRePpEH1YVeOWzLG7QmWRhWosjJ5LlQAdDP+Qw8lC5VcO3Ig==
X-Received: by 2002:a05:622a:1448:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-52ce60c07dcmr146322011cf.22.1786027154016;
        Thu, 06 Aug 2026 07:39:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:517:8f2e:5d97 with SMTP id d75a77b69052e-52ce60c07dcmr146320971cf.22.1786027153456;
        Thu, 06 Aug 2026 07:39:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:39:12 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:43 +0200
Subject: [PATCH v10 10/10] arm64: dts: qcom: arduino-imola: Add NVMEM
 layout for WiFi/BT
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-10-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a749c95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ftHyobG-LFCBQCjHduTxT8ne4RWniEGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX5ttWHWhrlQgD
 unEWpSQEhlPEBNDaD+QGYlHhnouimoXfzb2ItWcmswxHMHAagzxJ4nY7dqP9uHHabpRza494vnO
 4ZoU6I41q7OzoSQRA2T2FsAMOX8yJZIpr8CFsgD6Tp+IWxrAsibawpJy4oTFtUAQ9j45uFQ9T+B
 D1c8JI9oghBPCkFwcZjHSZmgHT7Hj/XZsy52lA3pSjZDNyMm1G2LKWuTyld9VdwDfgte3Pwul5G
 9deK/jltAKf7Gev0MsponlZNkp46iinhE7yBH9b6/yTkB94AHmaXuX4n1Bz9LPw8K8xYoTSXUry
 D3A/CkzXnjGHSmihWO1JSK8zRw47p2Ct855edyWvdJghZ+Ee/ZZWsWX/gg+exKKaVLbnYr533WR
 9gvgTXAQ+IvzlHm+cvw7J7Ow3vDo6OUaJ6kG0hB2zMlhb0K0okQ/9yJWyLeVXXnwfmArkHklnQQ
 8Ban7DUyVzWm9Mum23A==
X-Proofpoint-ORIG-GUID: ftHyobG-LFCBQCjHduTxT8ne4RWniEGS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX4BLpmHs+J7Q+
 LcrIN6aE12J9KTPuqLK3YxBLVr8suG44r7RH3L4AWrkI4XuF4BBnasCYENSq94OkiASON4jN1wp
 6LB7hihxp5ahP5ZRUx9dEZEsVlD/J8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060114

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..38839b8a361e76f6c1989924b16095b9d8815f66 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,33 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			wifi_mac_addr: mac-addr@4400 {
+				compatible = "mac-base";
+				reg = <0x4400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+
+			bd_addr: bd-addr@5400 {
+				compatible = "mac-base";
+				reg = <0x5400 0x6>;
+				#nvmem-cell-cells = <1>;
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +538,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +586,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1

