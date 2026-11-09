Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233582;
	b=lkSHSdrAuptrf9nmcepKO9+wsfbAf7y7zZmc0Izz0/o14bknvlPgBMZGQDiBV7OSMa/5
	 JlRVaTf1aRGGVPuRiPtM59YywYBI+8j3AIMIkO+QWieMgVGxJIdNKwWqUVaqCHSGYQNks
	 2BsAIXwO0u5iSouuGn+rstzupHl/5Sg2cMoxnlPfRF31KSul++9ya1Kq8kYq63spL0K8j
	 VorD32rnlOV1SqcYe7/7tyTyIzMw9RiV94iO3j1CAG8nXGfGNWIJOf7a9ytyA0mwD/dw3
	 iCLhYjzxzc6yWlc1Hms1TsBomcTBNmrVF3puNy9SowzZPEJ81ncU2gg5Zec/I6iAUrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
	b=Z3ROjLmr+unlkxApjmmcBut6DfDilAQbZVzGj7/Agux3jUuo9jRgFpKpVa+clWtBu6i6
	 dAmEPMd+E8gJD5qbjv6065qlP1tzD1sW4caLf+VDpHiDyMZeBPWqJKEg5aSJO+k4yjdgC
	 FiQaD9+AvE/+TnLGQ2MD8t8L1OyUwiguXDwq28ktvHz3fqvzSupcdwc/fvfZc61fh8nAB
	 bNYzZy/grgc3BpAVfpz6/CUcVdxThVMNn2KNtEaQDFjCGg0HwT0iBvI7TdE9/XgWA7zuC
	 AnXmWhZ63F1c1wJ4zMjdVqMbw4YKYPEmsvcOEsuLL+eQJlQa7+tdPK+g3qRgMCPpVLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KtwIVEHq;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ECC606D805
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5ECC606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KtwIVEHq
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so61299c88.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233581; x=1794838381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
        b=KtwIVEHqUP+2LGv5avMTl6VIWtacjf2Z5tVPQILYNXvUxDbfSQmlwmWDyOEs+oD8K4
         9UWVpb1pebT4xUJMyWKPbhpHYCUqEV6A1AMAsaVOKb6f/EBHOeoIN7IcwP/Sdrggl67B
         5nrMvxuG6GyoSdZWtweAq+2uFXAKkK5AIu+Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233581; x=1794838381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5bJy5vqSzMU+DBJ+D/1wSxwu0KrZJz/nqBnx+LerxM=;
        b=r5eelIUv/C26IScAHJwWQi8i/raXOjHaMk6laDfwXlLoqMxAxb+19seMMP1ikfUJlU
         LoSk/ezUikf6RVWuc76USPoVZJ6khniKhTq3rnaBMEcgzMsrwVGIA0f6fEPBIqTQklWQ
         3pLZTmny72Y2LT4TfMdrqYG2FAHBHluOIuwgGuzLIcFgRfWbb2/fown5Z5EPYCiojvPv
         Zz4hR3nVGsPifVbBMam9u4oc1a1Q8HQojht+ynmjL134VtaB6ZlBGDJEOjW6Hv995G5+
         DqhT1ozJUbQLA8nKTWvU3Mz/laZkhS8iPNvk8Rq1+V/fug9Qp8CVnILLXRrz9Ai4XYfH
         VVyQ==
X-Forwarded-Encrypted: i=1; AL+hErGBFjbtrn9BIppr7I7n1PfX7jyqjyPUJomLgCOKKmCWr/3IKjvqA7mN8y6vXzr8ZAyX/FAvS/Icspvt@vger.kernel.org
X-Gm-Message-State: APuU4Z/sGKnCxoP4ezewTncEq6Klm5KS35/yG5KwOviaBBoGek8QD0nm
	X67tqY8G7f9C29upZmbJWhG35UI+JDl2Cagw2aZUwy5lG/kS21i8F0HViIgHYRxAjw==
X-Gm-Gg: AYBFou0C9fgsETlOc+iAY1TtSWmx4oFmtpIFVt8/TlHdyxAzAYx8kmV0dnOcuaUjDzr
	vYbhvextFiwCqMXm7upkB+x9kDhS4KtJyDpt3BHo7mVK+sbeAK0uiQ8rQxoM/zYlMDYyQqljq/V
	AHOWPEweXFz9Ec3I0JlFFJEmxMndzuuCNpgFKMQqoja4WZg/Jwy+pXPJISviA9fp1WDyqm1fVY/
	qwFNv2H7R7JNgcD/spkuG3F6sS1A2po/eDBFF8wMD+mrnmB5V071Hnw1XL1FYGtFpTPpkjJ5rNw
	tO8KqreyEGK91xRwVPlGxisrAfuaUvd4smu5issuDbjZ5nMUSEp9PHjeSLSn6eOu1Coq0NKJEFC
	aQT2qZKFhjBh+MN9PDGSp/+3c5NlPPkNBd6bABRk4mcxWyx6PMZLIjWQw0BY3q7jC7eAZi1sCyW
	aB6KQKtXSrm7XR8ziuyMvAm2gpF9/zqh6j5mst5fhQIw7OijZM4s8qIw/mJeBirPH98/CBwtRhe
	4CgUqxLZ95DfJKvaXRqMNMSnNG0LVUov22iqFZ/dcbqnd6lWNi8iYBDJg/KXFjA5OXiCC9Ym9GR
	H53Ztlu1O8WMC02toWReg5pQIREVJik/BbmgQ+fqpXH6FfYJIALemHlz5m24
X-Received: by 2002:a05:701b:2618:b0:189:ff2b:b194 with SMTP id a92af1059eb24-1b39fec8a89mr5374626c88.16.1794233580747;
        Mon, 09 Nov 2026 06:13:00 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b375603ee8sm12930496c88.9.2026.11.09.06.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:13:00 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8173-elm: Tighten DA9212 regulator voltage ranges
Date: Mon,  9 Nov 2026 22:12:32 +0800
Message-ID: <20261109141233.983830-6-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
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

The DA9212 regulator voltage ranges in mt8173-elm.dtsi are much wider
than what their consumers allow. Tighten them according to the MT8173
datasheet's recommended operating conditions, the CPU OPP table in
mt8173.dtsi, and the ChromeOS downstream GPU OPP table. The DA9212
output voltage is programmable in 10mV steps, so the new limits are
rounded to those steps:

- BUCKA supplies DVDD_DVFS1 (the Cortex-A72 cluster), rated for 0.72V
  to 1.131V. cluster1_opp goes up to 1.125V, which the DA9212 can only
  provide as 1.13V. Limit it to 0.72V to 1.13V.
- BUCKB supplies DVDD_GPU, rated for 0.93V to 1.125V. The downstream
  OPP table goes up to 1.13V. Limit it to 0.93V to 1.13V to match, even
  though it slightly exceeds the suggested upper bound.

Comparing the voltage ranges against the datasheets and the CPU OPP
table, and drafting the change, were done by an agent. Manually tested
on a Hana (Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 579ce73de7ad..a1cb9230158f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -315,8 +315,8 @@ regulator@68 {
 		regulators {
 			da9212_vcpu_reg: BUCKA {
 				regulator-name = "vdvfs1";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1310000>;
+				regulator-min-microvolt = < 720000>;
+				regulator-max-microvolt = <1130000>;
 				regulator-min-microamp = <2000000>;
 				regulator-max-microamp = <4400000>;
 				regulator-ramp-delay = <10000>;
@@ -327,8 +327,8 @@ da9212_vcpu_reg: BUCKA {
 
 			da9212_vgpu_reg: BUCKB {
 				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1310000>;
+				regulator-min-microvolt = < 930000>;
+				regulator-max-microvolt = <1130000>;
 				regulator-min-microamp = <2000000>;
 				regulator-max-microamp = <3000000>;
 				regulator-ramp-delay = <10000>;
-- 
2.56.0.455.g6c5a503b38-goog

