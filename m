Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323925;
	b=Q/6EmjIhbFtXOFBK9rwnQ8LRKWC/ld7gWNz49UZouRyMHTL5FEZHDrZw8lPz/eJ5OebE
	 1HGIwwgxAzaZB2OvFNneRTwpRmeZwv5TUQivvGsE/3iExUT7oR1Jeam44OYY/LczAK+cm
	 BgMUJ1lV49/EA7nykEK+s9wI34AQWnJT92HgrXF1glUAUb3Oj+gCG76774ZJIrwufHJbl
	 6bizRr9yhW/zQfSSmZIb2KwH9UcGylkxmmbRFH1VtNfN+uMqfKrnhOSlKjHEZDXJ7uk6S
	 HD6jiIc8gQy52IiarGJTB+slj5QYxMSdJSSzrcGBzNzJDgwwGMNtFKrYTAqtPGlid2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
	b=Q7qOIkPE+m/SXjYFSxbRQUWx36Br5ENKBhABMZ8gCYnCUnOl2Tk4rkzlaeVaYgUtVWn2
	 TnFyQJXQBVAC2SMPGcDaAFnPKBNRAzZz220ldCsa//GP2ZMpa/4fhOx/xwSW9BVQ1rXPm
	 uTewewpReedfIYpfEM8dAa5CYE9xxYBx28buv/2eWGTeU5g21PVVzCyRuyB9ALbycHszD
	 XGypNoq4kAAQ9x19/szvdRJ2hwViYbj+r3I4WoxEFgGPyziHqtITFDKZyHh/AN9Pau0oD
	 6JvP8PVUpbURtluBIqgnzmWw9KysCgUZsrCVt6/XRgAIDIDAX53bMKJo/dZK8Aog9sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5cy0R4;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFBF606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFBF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5cy0R4
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so141216a91.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323924; x=1793928724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=KX5cy0R4Pf4Wt0qAcCTxPKYp7HxRWjYf0GR34UtxG7gl8as6ytj5y3x/4HRoW3Dz62
         4fXqTs94DPRpsy15NfAnupgAWSvhHYBg3PHctkCe5bV4t1bAOizZOGzwkLs3U3eiw+CZ
         DaTBbRw72BmuUGsvLx+0A4yyuZR5jIFEdAUuRqNxJwk6I8vbMfBIcM0bfcvzEGtSG4PZ
         JH++2F52MFmjXP68AUVWucqCeR+AHXmPgGCjGWxCfrGQnDMhxCsEJwbl53bdMhHFsmWG
         8vJbnMtwV/ArQff/+tVVwPi2N3/XcY3A5hKOugo398kJa/Yq5T2JBnndWXB7z12z/Da6
         6xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323924; x=1793928724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yIlFDFOCLlOt1ZkFsp4BTd0cM3qgVmPIY+YJA6U1sSQ=;
        b=1bMSi1HIh4qO0Ii0eN5VvxOtYYEQLHWMklsogRbSjtRKosFyLGvsEsruC6C1figsNl
         WSQFf3YrTiSCwdSOT+BYhETelVB0+57jKtLUPc3XxYEyPY2hr+cwiKBBIhTzEc0Pe+ll
         dsRK0jwfUrOda/kLbgVUfyrzrOLo0Nd92kZYoTwE1gB9lCGBbAmxQNWwErkt2DOl+tch
         gLpH99QI3ME4x0H1s2qcZY0hq4uaskpg2nJygyKTXO+Y/5dfaWLKZ8sGVs9k2NryyJCe
         3/45U8cQpFq8VjLnCx08VnbJ66e1krci03IiYunXetMO5CY1/a9Zcjrxc7i+3p4OiGhM
         HF/A==
X-Forwarded-Encrypted: i=1; AKwUvBwPZdskrrQ2IEMI3hg0/58TyOz0YVvJlayV1FRuR03D0eo/yHbldE4mzjkP8YNug8PUFpKxcyGI9qSX@vger.kernel.org
X-Gm-Message-State: AFq9FYLpPRVdkPILqW0ug7lWdWxFjqM+APc8+qUkDRAxwky6Ms0OYsXi
	24U0qIjlI89+n7y1dO/l8cidE5856G9RSMckf8hUPG/IWQtoeqU0UKAx
X-Gm-Gg: AYBFou2kLDMbMiPQx3fJR9tKN+5nwxueQzShz2Bxas1A4LeaUl4zZrQEUwsITZbTCZz
	t/mkRAGeDnw0KS/WgxqK9zDDRu3q31LxQC44Xr1ZZaFW8rgUcZ6sJ3nDYY/RnFhS6g9JjkUP8lm
	RUwMWFP4uNCMPcjuinvZCeehN+5epLPjcXzNZVCMShmYzwpJP9sdgyUewjuisH3meoFEC0ZUD9w
	I4MLnzit+zpaEAAzkOfc4zsvzeSzjJfWS0e0YPu+vlgUU+cd4tqLMLc5yLB3zNWuc+JeMh7V/0J
	USaAJs/Lw3vEx59wXlQ/W0H7DXrUei8dMrsc5gMEEAcuy0kSHZMCVBI0h6fOSuatS1adoQL4zLX
	Om5HM7Mh6N1dTf9fCPVnpwEgkt8Z1ME5BSkIFCstwJNHpJBBRH/cT3XzA+iTrN2zRnkWpdr8bGG
	QRbfiKX2ueqfn0LDh7wXbwz+V8MvrhmU8MdmtE0hDfRXzF4Z3rxCJ19FadzWqOyaJwfoybmWFaW
	jWvBbkIDW2huvhRNMNAhbB0qAB7IuqWlmK7LxjK12JwF2mhAUxEUqHWrknsnkICQZ7fXLFeHweJ
	vQcoZYxirhdmFFhkDvHdZiFGOrxoovOPxga8gg3gex0=
X-Received: by 2002:a17:90b:2742:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ae897158ddmr638114a91.14.1793323924302;
        Thu, 29 Oct 2026 18:32:04 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:03 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
Date: Fri, 30 Oct 2026 09:31:30 +0800
Message-ID: <20261030013135.158157-2-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sm8250-hdk has an on-board SD/UFS card slot,
but the SDHCI port hasn't been enabled in the dts,
so we can't use it after booting.

Enable the dts node of SDHCI for the on-board SD card slot.
Add the pinctrl node of the SD card pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index c1c673086..ad60be5d5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -396,8 +396,47 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
+
+	sd_ufs_cd_pins: sd-ufs-cd-default-state {
+		pins = "gpio77";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sdc2_default: sdc2-default-state {
+		cmd-pins {
+			pins = "sdc2_cmd";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		clk-pins {
+			pins = "sdc2_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
 };
 
 &uart12 {
-- 
2.47.3

