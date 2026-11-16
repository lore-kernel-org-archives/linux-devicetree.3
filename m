Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862414;
	b=JdiUyNlqEFARkpmqWikNRwZicJ5nKeSbCxW9bqt+kQXrKkXnk62ecRimXzGWn01Z9FoR
	 Fu4O+LUUkxoB+UZdUK8eiqVLwEEliA2iaOjHTAJIgM9wIxQ08kw3XrYtw9Zx97B5bgpDK
	 g92urGrPP7ARfnb0VPwFZV0hkqAMl/oyw7IlCHiGTStDSkxU/h8Hfr8WqgQ0Sn6jZMf0B
	 WmP3DblNCMiwyg6pwXd3VER9PapQ/UWotBBYm7/DzXCA5xxGHerpEwb7GJq9DStDXGkqs
	 gRc2l+Wl9STGyE4rL42day3U0mmimmQfRhkXLVPaHnbtpInY/pKUVAtU8VuGE1z50bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
	b=ImMXIiwnSTN2QauZ5g8MP3oeUv2dMgZCrM2wnLTPR39pkiD1UjZHVnQbc1lFHxAit3ae
	 13dWjjQJg0z0OJlXVQ9/2cRVX+7tpJO7A83yIeEqK1t0BrHOZt8STpAELX+hiGwnoc5CO
	 XUnq2QV+g6iiVsSvYusUgljrzoXkjOXY5RS8iPYpEnHWGankGYb848XZOIK84mVBCoAUq
	 O0vVCw7nsfSV36k5d0mxhpPtl0W9fX+YekxtBz3pmKtq/z6wxUXp4bLPdXO3gCJD84GwY
	 SQ7nKcCuam9D3zEtiirn/iXYDV96WgSuqV6wOHNfhdcYrD7OMB5NXtaicV3qhQCAoyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nCuNFi+1;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09E606A887
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C09E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nCuNFi+1
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so5734039eec.0
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862413; x=1795467213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
        b=nCuNFi+1jkX3+7y0KieRNcc1ZPYxF5feR9EqTRBbKdFSf8aj4dllCa+xbU8+oB3JTf
         2DCX8D3cIDue6bSHWzfTY8YBOFRrKRjGlISMg5jDVyfQ79vajKoth8mF0cMgjBI0mT21
         XsQv64ST+rxLF4dSXI7XOo7kqWQ0/UecgvABs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862413; x=1795467213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
        b=BFIQob2b1TDAE73PdT2u1MFgi4FlZeh+d7LvhGssID7dHfv526+ubJ0n2Glyqk//Qb
         SbJlsYU5OhSs9K9uO4TDF5CXAjNSc/Co6mWJyeoD85d3uxOjP6DcBcmIuVZk19Pur398
         kTYcBys0ZTqxG3VJd1d9TMwKotmHVOafFR9kbzPO6VkpORB1ZqKPe4dGY/6EGidj9/+y
         sR/ca7z13lXsbxdXwvOELR8GGCcq/WoABYUOzQFVtzyMJ/NDDRleUAVcf0cXf6OdGeAT
         RJYRdl13qzU/kjSyqlGjWByN7I3OACN6EYtteBB3ROw8wnPqfScbdMwVB+BAQiW7MSKj
         nFQg==
X-Gm-Message-State: APuU4Z/Xc72xxZsZXOfkNuTjFHyvylKs9OfwwtkCaSRJmOIOjbJedIZX
	Q4LShl4wuGP316MqGcFTzo/jepyg3QF44JpF6arEnc8NRvHOlwz+yJzP4XCHkcqZEw==
X-Gm-Gg: AYBFou092OZfIwinUAZwdq01ZUCRhltJjn5wkw48J5y5AWm7RLImEVUyOkHsBTTyqYG
	QCi7isWUa32NrKMxVwRShfa0WWvQXKaOxBrmdHzQLpFhZ7jGZSLGmYRomwNOmvB5c66uG4pVl7V
	ezNl+fxdVvJzwq+tgDjrTOnG1E5W8layJqDJgR6sfs6kjx/RZS3F9HVcAJVK1EZuxThu3q3jweJ
	v5dKSN4bP4I53hza7wPWyu9vqtxlPJE8lHSH1o/CK9UL2bvL7vuTcScBFaRuPMw9JksejDjXLik
	ugTt4z+DsGruizEIJWVjE+B5KN/2S6J7N0ziFz0WxnuI2wkMDKgNfzbFgOaN+X93uPETdl1NOE1
	J82KShq487uXCkcH6ZbJxywmnnxmtFSS075MoqpJ7Az/jWr5DU8j02TsBVNjkLafrG47ogD2OmF
	daKgomZJQqF98VO8zZoJO7pCAMWGcku1nLxyoWXwp96WhsuigMTBaCinbUTr2wliC94KkTtDFDR
	0VUe9Gn78KpS713c8qQj9iGPWKyN0mIeklX1x/60MF4uOCpk0i4yx0avX6i2botrit17EADOAm6
	QEsjJ66N1fIP0X6Wwmgpv9qTI9aHxKM2ZXmegjK75JJ/HH82VPyPu+1L9ZtVpU1DCxzSAkd0R6q
	3FoQ4LGPKLrG0/qdWdsyPuW6+WQJB1i2818w=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr16186461eec.25.1794862413017;
        Mon, 16 Nov 2026 12:53:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:31 -0800 (PST)
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
Subject: [PATCH v4 01/14] README: Add overview blurbs for dtc and ancillary tools
Date: Mon, 16 Nov 2026 12:52:58 -0800
Message-ID: <20261116205320.1621386-2-dianders@chromium.org>
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

`README.md` currently jumps directly from building `dtc` and `pylibfdt`
to mailing list information without mentioning `dtc` itself or the
ancillary utilities built and installed alongside it.

Add brief overview sections with basic usage examples for `dtc`,
`dtdiff`, `fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and
`fdtoverlay` (along with a pointer to `Documentation/manual.txt` for
full command-line details).

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch adding README.md blurbs for dtc and ancillary tools (David
  Gibson)

 README.md | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/README.md b/README.md
index fcfc2e55d804..9d38c7e79fc6 100644
--- a/README.md
+++ b/README.md
@@ -112,6 +112,95 @@ $ meson setup -Dpython=disabled build
 More work remains to support all of libfdt, including access to numeric
 values.
 
+## dtc
+
+`dtc` compiles device tree source (`.dts`) into flattened device tree
+blobs (`.dtb`), decompiles `.dtb` blobs or `/proc/device-tree`-style
+filesystem trees (`fs`) back to `.dts`, emits YAML (`.yaml`, when built
+with `libyaml`) or assembly (`.S`), and runs semantic checks on the
+tree:
+
+```
+$ dtc -I dts -O dtb -o board.dtb board.dts
+$ dtc -I dtb -O dts -o board.dts board.dtb
+```
+
+See `Documentation/manual.txt` for full command-line reference
+documentation for `dtc` and the C utility tools below.
+
+## dtdiff
+
+`dtdiff` normalizes and sorts two device trees via `dtc -s -O dts` and
+prints a unified diff between them. Each input may be a `.dts` source
+file, a `.dtb` / `.dtbo` blob, or a `/proc/device-tree`-style directory:
+
+```
+$ dtdiff before.dtb after.dtb
+$ dtdiff board.dts /proc/device-tree
+```
+
+## fdtget
+
+`fdtget` reads property values (`<node> <property>` pairs), lists
+property names (`-p`, `--properties`), or lists subnode names (`-l`,
+`--list`) from a `.dtb` blob. Use `-t`, `--type` (e.g. `-ts` for
+strings, `-ti` / `-tu` / `-tx` for signed, unsigned, or hex integers, or
+`-tr` for raw bytes) to control formatting, and `-d`, `--default` to
+provide a fallback when a node or property is missing:
+
+```
+$ fdtget board.dtb / model /cpus/cpu@0 reg
+$ fdtget -tx board.dtb /soc/serial@1000 reg
+$ fdtget -l board.dtb /soc
+```
+
+## fdtput
+
+`fdtput` modifies a `.dtb` blob in place: writing property values,
+creating nodes (`-c`, `--create`), deleting nodes and their subnodes
+(`-r`, `--remove`), or deleting properties (`-d`, `--delete`). Pass
+`-t`, `--type` (e.g. `-ts` for strings or `-tx` for hex integers;
+default is decimal integers) to control value encoding, and `-p`,
+`--auto-path` to create any missing nodes along the target path:
+
+```
+$ fdtput -p -ts board.dtb /soc/i2c@3000 compatible vendor,i2c
+$ fdtput -tx board.dtb /soc/serial@1000 reg 1000 100
+$ fdtput -d board.dtb /soc/i2c@3000 compatible
+```
+
+## fdtdump
+
+`fdtdump` is a low-level debugging tool that dumps the FDT header,
+`/memreserve/` entries, and raw structure-block contents of a `.dtb`
+blob (`-d`, `--debug` prints tag offsets; `-s`, `--scan` scans a larger
+file for an embedded FDT). For general decompilation of a `.dtb` to
+`.dts`, use `dtc -I dtb -O dts` instead:
+
+```
+$ fdtdump -d board.dtb
+```
+
+## convert-dtsv0
+
+`convert-dtsv0` converts obsolete version 0 `.dts` source files to
+`/dts-v1/;` syntax, writing each output to `<filename>v1`:
+
+```
+$ convert-dtsv0 old-board.dts
+```
+
+## fdtoverlay
+
+`fdtoverlay` applies one or more compiled `.dtbo` overlays (`-v`,
+`--verbose` for progress) onto a base `.dtb` blob (`-i`, `--input`,
+compiled with `dtc -@` when overlays reference symbols) and writes the
+merged blob to `-o`, `--output`:
+
+```
+$ fdtoverlay -i base.dtb -o merged.dtb overlay1.dtbo overlay2.dtbo
+```
+
 ## Mailing lists
 
 * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
-- 
2.56.0.679.gc527c65306-goog

