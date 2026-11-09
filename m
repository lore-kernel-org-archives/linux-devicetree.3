Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233573;
	b=SMsfDsJ+AyW7zz0m7Hdjn7JSDZxnZwPImc1etsz5hNvM/ZouS4iv/+eJ8TQJzu9/77GG
	 PnyJ1qWbjlBESUTpfCKfjl3MTJRd6cv1eSolTYhKSS7FbifTndRNn7KMLRrp68Yg1/gIn
	 AdMlJdxmGXUvL8ETjkaSgaBlBvv887d7hYER+dTN5CggxrikVE1ZQaSIp7doHKW95Tyg7
	 zQ4Ly7jWmfz4SXBgjTivwL7ZjOVemiS7tyyzvQSd2e4lc7fwAD7Ktgxrx1yjd8PqxXmra
	 p1L6BN88NWanegF8XcYO9gUDz4OqnYy5haMdRb/ydF4YzEWdbhW7B/P539cGkUaJJUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
	b=bkGPbVXll7g3viPn/Ldeb12B2sKFgoT+sX4ChVElyOtW9sQqZlDBvKjiNTSSLvBcg1ai
	 1RTTn4Cy8e8w5eIBVZVJOsWdVxJedf2rqFoYEY46jvAvU2sxoDmmKDQgHpKPyY0yZUy8A
	 c3Q1jgHGy9+l1Nuvm72f5L/RpLA4tejkJqrnRP3MGZe2AbR5AA33LNtLXYZI/SMqvrAHb
	 89ImxpBK6KBvWDabQP4WRRpb6hXFUg1dUyoMZPd971/V6xyzaRfdH8tmcJCR6A0MfefrC
	 rdRUb+dEKN9kUzGzXIVA0Bt+dg4S24uf+rcUXFIAZpoH+CTzFoiaMv3/zUZby5xC6jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iSlRhOHk;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55943606A325
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55943606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iSlRhOHk
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3ada81853so619939c88.0
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233572; x=1794838372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
        b=iSlRhOHkEmHHRlOjAZ5Zc0O9ukNiVEkLbGwfYRO4HtZq7zmUZFU9HHEAnLPf93sdgg
         +tnoXCdlQsRcorOmzY2y8bKBem8lfkP6ouUh9IeQMARnDZEdyL0+eJXGZuZ3ck0XcP+j
         uCDJYF9drY0vQtAYtetTYW7ViatZ2bCtvKbOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233572; x=1794838372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElgkdLRGZuyI/zcANKeRh9fMZ2znqsSy1p9YbwRC0uI=;
        b=cpbgjpDmMbRzhxN0QrbG88Xv0Srg0Tc7ov0Jh9iJlFKPOS1O1vII6Ac9CVlHxiycon
         7i8O/JxVNSi+wXH26/kA9QgiqUvwt8O6qKVHb8MQl78hbHXow/DC8UnNxA+YXmVEsORs
         Z65UZed4aIhUvg/wItvItPpQaFXV6XPSNhkuII2JwgZ/D4yFW+jwpO/T3sFjj0SjEFyn
         vouC7Z71rFgL3xu1orjmDFGgPtLMmG6AlpjE5jJTPJVhAIcYv+JojqXcIyM651GA1EFb
         oIL2nZKSmxQB+sGiFdstZLv0Ym0R/nL1VCSjZg6cNXGQ4NoHtQPt84Zg/6qNLzTVUKZV
         Gf4g==
X-Forwarded-Encrypted: i=1; AL+hErFFMPgDt67LesgpqMu5tNWCbhyDIZ6N/OzByvJBrFlvQtipSviYPU05ngR10DUKaBMiLMUYgPpfi/4c@vger.kernel.org
X-Gm-Message-State: APuU4Z9QobaTnGvJ3luqZG5AAI2/5wCXf+2QCDcnNmza3AxXuCSQtXCp
	xlWio04oOKt0G7MqwDny2Y97I5xMJqXzWea+Sc8XnwgR/tPqreh/F6R1+rqtjDM6Kg==
X-Gm-Gg: AYBFou0U46TIhxdcVtDHnpDO6p0yyXzuNmezpWYedlZCX+6RLTRUwLmstzcjoeGHDrA
	xW+LgpGgo2tSiVqAcy88JUQHoXzX8zvQaeadejIArF9Zm5GSDzoLcClpZ8v8fHdedh3yJwbBC01
	9KGNrpP6QakPcp+u0Njrtna7GuoRtyNtYtGamfc6hf4LBeoRdpkVDgjdveyyZ2IGF9xYUTwfhu1
	Wur4iev9QuDbdGmCvHAo7jkDg3D+CqxO22G/2/eR3V7jRimiwqee0WZ3zkAA8rJKb6VWxbRvNrt
	ArghqLXEnbByYt9AoNNUAoRGNpSyveZAbnaNeUphvPMlATQPAL6OkZSEJcIqeRJ1yah6642BVcW
	8nM1LEZGZmJlGTl/10vmwGDFAk2Vbh9fLvSAZgc0vV6D+M5xYchMrJ5bNjpq+b5yWaY+Cgh2QUf
	FRRXQMfUVNQPn/bygWRjDBk+fnP4w7CXgd9vUVuDtnKvch5TFJlZwl749MKk5V1NE6n+30qYl31
	SjkTIZI0IBQH1JHGe8bmVe1lOgsBrTYgnYL4nAGZ+JGGZGHKWX4IXV/uLzk8d/6WqsbpmFXgG7g
	IozIfwo+C36zA5/a/jmNukk/vhCmaW9MYf5bDjs2Qn942FbgEIKpVDqSNu4Z
X-Received: by 2002:a05:701b:2905:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b39fe88736mr6517005c88.11.1794233572139;
        Mon, 09 Nov 2026 06:12:52 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b37560d95dsm12254569c88.11.2026.11.09.06.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:51 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173-elm: Fix DA9212 regulator names
Date: Mon,  9 Nov 2026 22:12:30 +0800
Message-ID: <20261109141233.983830-4-wenst@chromium.org>
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

The default names VBUCKA and VBUCKB don't mean anything in the context
of the device, and don't match the rail names from the schematics.

Use the proper names from the schematics.

Manually tested on a Hana (Telesu) device.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index be6e6fd7cd36..c6751adb1c2a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -314,7 +314,7 @@ regulator@68 {
 
 		regulators {
 			da9212_vcpu_reg: BUCKA {
-				regulator-name = "VBUCKA";
+				regulator-name = "vdvfs1";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
 				regulator-min-microamp = <2000000>;
@@ -326,7 +326,7 @@ da9212_vcpu_reg: BUCKA {
 			};
 
 			da9212_vgpu_reg: BUCKB {
-				regulator-name = "VBUCKB";
+				regulator-name = "vgpu";
 				regulator-min-microvolt = < 700000>;
 				regulator-max-microvolt = <1310000>;
 				regulator-min-microamp = <2000000>;
-- 
2.56.0.455.g6c5a503b38-goog

