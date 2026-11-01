Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570608;
	b=3i0mP+WmgxCESOj8Ik3LxVZJYHBDAFw9PEDevdU3Ws1PoOPknPx4aoVYtAmU/2Ssl3FF
	 hHcRtl7lb9mbpcmOBcNTrT+qjAX2eQuJcGQtkV3s2tI8A7Nos3XX9VsZsuwd7lt5BAgTO
	 Y4gBJEtBz2LOtAWb1JimCtj+13PxMx0ZCd5IIZeAdzMoq9JXpuRB409GK1xWI7/WMa9lB
	 EItnJ/p0qM0KU5Ph+z+u+LH2rjzyoSFmSsDPTPz2XxYNIptJO15Z7T1S8Au/nHhOXI6ep
	 SX0ep+Bec2d0HWqIbg+Nv6qcjXWK0jJL1zgRHGs5zZWyDkuNORKa4sdcxruWok6NkGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
	b=ziptdjhodWsb1IJ2/XXqih+vIGLoL+rI2shhLuzsAh6osxipK30oJ4lduuQVMBphb8mP
	 ay9lUPo8m7MvZGe9ND1P7PrsOQsQyUQxm5p5Q9EWdG0ru0HrZ3DHzhFXCl/HK9GRwDzgB
	 Ckh1A1Sj/QFl3vtq7MXFiEwoO0kvZ2UuVjibPVUAsr0DVbE9ee4EC9HJVaHIa96266GJ1
	 HIAs6K/PBWQLQMt+mzLXNVNErMHfzJdrPaV7ulAF3ZP8MMa70209/ZBFS7MsLoUHjjkk0
	 X/fC6YTOPWaIlMsmillIj7O0AlDMJOrifQr+7qLB6IMBRJdcJFAei5hz42Fz/K+rnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh0Wa4AK;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2189606A32C
	for <Devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2189606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Oh0Wa4AK
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1931ff67a29so3964734c88.1
        for <Devicetree@vger.kernel.org>; Sun, 01 Nov 2026 14:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570607; x=1794175407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
        b=Oh0Wa4AKdc7iROHr31BGwvbHlO/NJGLhoESDgT8sSOB1NzFqWpVVXTVzj14BuO/uJI
         +X4kINBdEpOUfCF78tdKmT14rd91xZBfOIUPjcUumd+9eere6w3TiR5SYooBNMS7mxGc
         omaDkWqfjFwf9/yzSfoiurmYaGttHpgVpBK1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570607; x=1794175407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5HwIFPda1w4a8mgq8cAR9fw2WdrV327kIQbUNNoV+Y=;
        b=TzCEw1ZEdzmBTp+aVddm3X5bQQLPA3zrJNpoz6nW7kK92pH32yDOfBIUml3bBysFKw
         bpquY7s7wur/FB98OZGE+7ohmqHf4zpKpOK4ZYhccAz3hmDE6sTJ21evt48plnoVAWQa
         GdYJ1wneOil421WkNWt+r3O7rmCOuOFaO8kjgmee2FW3iPymUSjRHeElxrDzO39RZ94+
         9buhY17WKtVWLQuavhbrKVwrcHt2stx96Lql5gdZkoh12as/6qj55hlHx1Rzo2beS8R0
         kdTiZCVeGHggE0Lc5CqwR6Hz0QIn4tSss/ocPCRBufmxOyN6bXYdC+GDIQzHw6Cs15Si
         wDCg==
X-Forwarded-Encrypted: i=1; AKwUvBxQOjYDVHZuMaRavVba76ONSTRIDpLt6ipjA0YVW4rGUPAlh4ToA5Jxv/eLtEQmFxcMxz2Ekp2dR29t@vger.kernel.org
X-Gm-Message-State: AFq9FYLhE5kv0lmVaS1YgtRXU654O7/On2CodBbApuU3/ChYTwF5RwjP
	5BC/Qz9S/IeDpVQke7AcgN7X/1KX4kat1mTNCAwAF1XhY+nlkRCw5Rgtx/RdSxxb4g==
X-Gm-Gg: AYBFou39oydwv42XRO8H6KBfU4+3ImRpbsBW6zp+RI+hlhYt8KxwJLQ1YanBw2piYG8
	gbzj3Xov25j27++CgjBCpN0GZJAZqSwTG0y7Ni9l5P8n9WaF6I71B3LgmuDL/VdFbiGVV9Bfm0g
	REoJTnRxLIBFaoSLaDNGAfpDvEDyj8XsroVNdDlRL0wDLtpvjJzzAjbJXUIJJPkPVMpTsbzDzWF
	DOxdh7qLr5Ei52zIkXuQO+GThF7+xWbJYps/R7qKq6KMM6Ry1twRBvYSytcYZ/QafSCByb1u3sz
	Xis8JH68Xq1ROGn0g99chG/EmS0QZ6qr38tDq+ZwRTBcZj0ExrsXI2OMBkoXdg+1g2k6OKSNT8b
	6TUf4RwKP8+YME2U7hLhjmnqxiUJN1RelgGpRZE/7ADjlLblIO33D34jWGF6ma9gwuOeUZUKxTq
	UCon5JhYkrOfIjSfK6zhwyz6mKF77/ZCHnzj7IXO1r03ARSUIMgNQPgFS2p0Bvsg34SfGAR807/
	dh+s3fy4HwLqHkYhSR5SgZgJaLyeCSNL7WiLRE4C3UEV1wMsa4szvjVK0ES68hQbHTXmRMxnXqM
	wQQJole/qbPphmSQqhZQEKbFwAsZSD2/xEWDmJaCslwBvxIRvJ9Eg3c/yLh/lU8Paml89nfJUlb
	a6i/omtIRIYdw3A==
X-Received: by 2002:a05:701b:4348:b0:196:d6e1:108b with SMTP id a92af1059eb24-1aed79b3f6amr8350791c88.10.1793570606920;
        Sun, 01 Nov 2026 14:03:26 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:22 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 02/15] libfdt: overlay: Drop redundant *sep != ':' checks after memchr()
Date: Sun,  1 Nov 2026 14:01:09 -0800
Message-ID: <20261101220224.1436242-3-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

In `overlay_fixup_phandle()`, `sep` is obtained via `memchr(..., ':',
...)`. When `sep` is non-NULL, `*sep` is guaranteed to be `':'`, so the
`|| *sep != ':'` checks are redundant. Drop them.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split the removal of redundant *sep != ':' checks out of "libfdt:
  overlay: Prepare fixup and fragment path helpers for reuse" into a
  standalone patch

 libfdt/fdt_overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index c6dc4774cff3..8d96428af04f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -432,7 +432,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 		path = fixup_str;
 		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep)
 			return -FDT_ERR_BADOVERLAY;
 
 		path_len = sep - path;
@@ -442,7 +442,7 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		fixup_len -= path_len + 1;
 		name = sep + 1;
 		sep = memchr(name, ':', fixup_len);
-		if (!sep || *sep != ':')
+		if (!sep)
 			return -FDT_ERR_BADOVERLAY;
 
 		name_len = sep - name;
-- 
2.56.0.317.g454f8302e1-goog

