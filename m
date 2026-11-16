Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862441;
	b=Pm6UZAI9nM61SpGPAfJTZCbx2O9eQgWwM/5yNCCClSr6kf9JNLaiqMWzcVo+X8AeK0RT
	 23uIsxFPI5Z6Pv5/Ywt0jdX3wO+Zfp5OzRlywl5H6k5sRN0GFy9S031ZchHd0S7b6PzSq
	 bY0HIMaq3EGgs1j9LBzYyubh8grjR2+JajaqJZLt9uNxgs3IEGU7fmOmLpm+yfve1MLiP
	 Cf8vEy2yCy6PvlEe5pKdO1yis4GOuyWpt8bCF20H858FfNYm+RvNR5TTAtS7kEc0savJJ
	 zslzzzr5eRFFqEejN0MgntIxm3iBWZdzh0raHvtTSQpC0+0nZacsZbaAzxfQbz8iqVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
	b=jj9/jQtvMy/X7VAFKTaBWpXZE9nm7b52X7cB7ybDQT41WSPi3sRuz6B3P/yoQGOYJIzk
	 U4YXFWrAUm3x7Kk9DpKULN1m29kBwHwwlbO/mcWehLaMxFgpdUciSmvo/LbCkdCQ2GXuQ
	 rayo+kYwVlwsvFHsU6eCLwVELRhw0xWdfb6GyjjrpslhOk5ENoCSc+14uk7UTUvQ0S/26
	 MTDhWGhJGzUFm/4tslqhfwvNoLBFUBDtIVYUm/h0+QK6HCrUbCp5YPH2vAILYQHLkIW82
	 1k3YmDzf0ORfEUZ1LCtHgns+ZiqIFY4AF+dWgyfCK//pgHF+9U6YWVNnrgpt6UVVHdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="V/WQ14Z5";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E2606A8BF
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1E2606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V/WQ14Z5
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3791619605cso7363294eec.0
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862439; x=1795467239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
        b=V/WQ14Z5JsS299GMVO38nLTCesW0lZD2nRskeGbbhT6RTJz/XsPAzhwpwkvVmvVjSS
         l5OxNg1HaYGVQrA9bJeY4mXPTZVTSZHNUYMyFCxIbkas13W86sKNbEsiA6qzSBiH+vQd
         jBw9vYYYOoUOFDhvmirgTPn/SH21BNtQ3OBVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862439; x=1795467239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
        b=tMenX7v2KiAWPQGRna362cmf6G9uuLMeegGcEnIsKv0l9yKPurVBOZrz292ftSh4l7
         1jJA6on5JvRNPR9UWc48V7KHJvjDWfmcDg3hg+6LxokwxhzJZLEXkF4lXdRPKkaaVzT/
         lKtMEEx75DRmGN3ivwGYk4ZK+oyFT7tHj2dmjM2tj1sJVAM+Z5u07dOfV88IQTOKfMDX
         Z5v1EiAp7sjFWkeqQDDIbcxPFb/PUFCS8zvd086BHWrkDqTFIs4goQbHHgA+es7wIL+n
         /RhhX+xYqMqJvkZWGysCLXLo0jA8UuUC6f6MhQ7nkRWnja4Ht2ApF6gFf/1jjEK+oTYX
         Ufmw==
X-Gm-Message-State: APuU4Z9YY22FYEw1N17sh81RiqFufWbmWPADbgdSnF1vcoulhKqcCRCR
	Buz0rGoIEV5sPjPGBX3niL/gPhHmF07ThPtHqo2gfAkkOeDbS5Qg4rDt8sq4J7AL+g==
X-Gm-Gg: AYBFou1wBHCNEslnDyj5r7KzJOEVCGg9mbLP5Igaui3YFqnP0EZsmxu40teE22Ofe6H
	KJVLgyxOBCLUyZwp6Vu6da48KHk2cduQtszGdygrCRPk8sfui6IAQED7QcZcsYh9SHgJZOPzCnC
	C0lQIcQIs53OouKtaWim78/v1s6BGlmoCDkA5zzVIvdJmWNYXj3FQ1bbHZyG6m6oBVBsBz1bSAz
	jg6fpw4Fj8VuQllCpJ0XVgP7rhGX3/Awj6BA1lienIkmdcJ7bhzRnDR5s6eHo2FPaHeokV8pfYw
	sa1UfTMpU4TWTjh684GFULEWMoiSKs3mPz4MYgiBpUWU8os0krqdX01XKPeUtsV81xRybuYis3/
	ToVT6g2cv6lWr49vHHhGHzk6H2vIJwEx539ilz65ZzEe0brdKtQT8C3NwA07ILnLX/e5Sd+EmtI
	ogRSIy1WrgRmFqGbNagI/70U0YboSKnM458HxLgx3y6ql6fwWqv8U+z2r6mdnJwSnFA0ZAMYw9k
	6uN8SIyWWj8FU/XOH8ndpDI0O4hjia9Q2wpa80eYY3PCoUzXhcqK2/9lgQL38DZdH5ypoVKU/1i
	60tNADuNXwUnI21y2enAiBSghCgIaX3sp7SHv/Ml1t4F/ACe/sgvnxT8is+GCLqspMSP/hOFs3B
	Tuc6vKjC3ZmYZFA==
X-Received: by 2002:a05:693c:4146:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-379e16d093cmr11060171eec.32.1794862439198;
        Mon, 16 Nov 2026 12:53:59 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:57 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
Date: Mon, 16 Nov 2026 12:53:05 -0800
Message-ID: <20261116205320.1621386-9-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
across the string table (`for (p = strtab; p <= last; p++)`). When
building or modifying trees with large string tables (such as DTBs and
overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
`fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
byte dominates serialization time.

Advance `p` between candidate first-byte matches using `memchr()` (with
an explicit `slen == 0` check for empty property names and a `tabsize <
slen + 1` bounds check before computing `last`), preserving identical
suffix-sharing behavior.

On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
DTBs) this reduced `fdt_property()` time by ~5.6x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up fdt_find_string_len_() with memchr()

 libfdt/fdt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d9ccb70345d0..c7cedfba7815 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -348,12 +348,20 @@ int fdt_next_subnode(const void *fdt, int offset)
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int slen)
 {
-	const char *last = strtab + tabsize - (slen + 1);
-	const char *p;
+	const char *last;
+	const char *p = strtab;
 
-	for (p = strtab; p <= last; p++)
+	if (tabsize < slen + 1)
+		return NULL;
+	if (slen == 0)
+		return memchr(strtab, '\0', tabsize);
+
+	last = strtab + tabsize - (slen + 1);
+	while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
 		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
 			return p;
+		p++;
+	}
 	return NULL;
 }
 
-- 
2.56.0.679.gc527c65306-goog

