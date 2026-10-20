Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510650;
	b=nEvvK+fXuO7SvsJ54KiPHswCjuQEEI2J5MwA44svcuEL8Hg6eKGRvcZMg1AuUOAZQgXh
	 /G+prikAIoVkBrRu8jaAr7+7KqYeJA1dag6xxhwBb17+yz0GtC7098as7MQHM2ACZKYYh
	 6/l9j6PMJxDHt3NHGN+0S6SIN6nTbhMnPcS6FbQbrcodbc0eDrYSWZjFIU+xmjVg56rf+
	 QCHqeo2Nu2BXM0FWk6ehJ1mcyvnrm2kPAewrQRb7OIVutOuY2RoX9UIkGWFw5Qd7lTbpw
	 texC+RfeYyvCCt8BLq25DzlPzJpbZuwc+4SB0D4VT2qf0Ww0RkyG4OGmN0l3xuvNUZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
	b=wx/J/43Rfb27d3uf/c2m5IVpwc3jnOsAHzSqme5eJdUyzZSr7t3z+ZWBvTxIPhwAvTwg
	 Tk9adoqGM0w0jB2tl5cdydmetcDQwoeT/ncMf3QjQHIwqlpdgyly7XfMqhcJMSqNHtxA5
	 HiFzqrnUN+WWuIcgnKm+HTN29fXcmIUuxPCiyBIN9glUm4UR+pvD7S0R+HSBi1BFTc9+G
	 Q3zpRFbUUiSTdhC+utcBY3hbaVymachyXXmNHMKFvL/yIFe0KMbKfxhYClilezLS6NNSZ
	 nooDsTG/JOqZinAMR9GyK7wHe5n3cRxjcLazjyseY1Lm/Ev13cum7lidYOU3eqRDq0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89860A262F
	for <Devicetree@vger.kernel.org>; Tue, 20 Oct 2026 15:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E89860A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZB0AmpTi
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36681e85e87so985978eec.1
        for <Devicetree@vger.kernel.org>; Tue, 20 Oct 2026 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510649; x=1793115449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=ZB0AmpTiEFpkYXp0+xLjk4W6R0qcTahYVXSVmFDgQXTNrUa4ZAw/D78slYkOG/1pqT
         WKBNuC9DZqypB0b8Rk2Ji9vE0p9+M71yqhsJS8VL89DlXOT/kJhPFZQebjojLdqPK6Ww
         0H9XY3j6gr6XmSqFQ0RJQN77Gy9M93W1ltSps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510649; x=1793115449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qznKbFxxt5cLWwuKS0ovtSoD1j1l73+lYRqJ0Ocaqrk=;
        b=d2hBR+OtLrF7ssBlJc8PrOFUwihdYuoTlfJiVwBSITTcIi6Qvrqp1UcJCb69K7lSPV
         2lfcJ1BuzaBthA/CO48HGgSz4OTw5y+3yMndxil+udsllyUxD9HPbOAm1x3tPX09ehCY
         etF1z/WB8UWJCwY/wg+XLBxaDN2UnQnwMMEC/A9zope4pJ+lA5LkrR2tCTt50Hnre4fd
         D/PozR64rfUoBDDuPF9lOxlbABHqKERg1aQPZW1Ub4bU3NCKFsi4ocuHY0v45EYtIx1J
         VE8Rsf8YI9aRjogzSSDhM09E9Qh2EythNWtKRzv/rSdeL0S3bLevn0kbaE4HwIk31AIp
         KLrQ==
X-Forwarded-Encrypted: i=1; AKwUvByQG2xh4KYHF6sz+QJVkN8kvFWQmprVF+k0abOL3Sf2lROvG8l6dp9OsexoPWb1IVmB/+vJJl1gDnSL@vger.kernel.org
X-Gm-Message-State: AFq9FYLK8XJu9RAZjRIigMhtsY9H0Cxk3H8Yj3qps+msmVcvcz8mGM9u
	wnSIrvUvRnL2qGwV/U7sgFCtN+91TRsjE1xuJOdC3/KZsjRruCkZ9pt1uqgLzbg1Jw==
X-Gm-Gg: AYBFou10pwynxck4PHlcykolb1FIqH9BpDzOOxVy+9POfF7dcCQK6W31cWC1Ezo7SbR
	icdle38YmEwj11mbZM02a2LrOX/yFTDxZ0Qkluy9nU4QBELCnHcXwKGboSolTkGemOt8D+8PbYf
	lfFHqxiRLYRTB15L0MLcdNupnq0UShUnk1b/QiAfB6WexlLaWqz2xCkjCwRN1ggHBi8qu7/GOeF
	m1p40aXzJWPz8Hy6UD8yi07XlRM9WhimUVOlG53fGZ4VzprnTBKUymSB8c3/0FkG5PQbVQFhb7R
	rFeS1ukjSgI3E1nXjXk/j2HD0E3/PlPFKqUonNTcPhDZsOMwv93f+FnTp/Wt6U3ceV9mu9u1fbM
	A83wwohRkK64YZFgYqJjP7tF3rUDQ8VSWuq6Cq/szqQ0UFtDbibVChTjoZekspDKaOYxQa/PyIR
	uj1R0DwjJNicRRMq7n2D2zqtJ+i32FyNfK4l0C9CITdnmf7MjT/7f0raOHvy6h2RDG1Vsi6PqHj
	RIC4hnk3kOBNzx82jgxXCUwnsdE+meOupwkaeKrFf3bU13GsfabB4Z5WK4=
X-Received: by 2002:a05:693c:6391:20b0:366:e24d:a0f6 with SMTP id 5a478bee46e88-366e24da2d3mr927924eec.29.1792510648703;
        Tue, 20 Oct 2026 08:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
Date: Tue, 20 Oct 2026 08:35:19 -0700
Message-ID: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
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

fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
of update-dtc-source.sh, and were never added to the sync script.

Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
kept in sync with the rest of scripts/dtc/.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 scripts/dtc/update-dtc-source.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index 94627541533e..f21da460742e 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -38,6 +38,8 @@ LIBFDT_SOURCE="fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
 		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 FDTOVERLAY_SOURCE=fdtoverlay.c
+FDTGET_SOURCE=fdtget.c
+FDTPUT_SOURCE=fdtput.c
 
 get_last_dtc_version() {
 	git log --oneline scripts/dtc/ | grep 'upstream' | head -1 | sed -e 's/^.* \(.*\)/\1/'
@@ -55,7 +57,7 @@ dtc_log=$(git log --oneline ${last_dtc_ver}..)
 
 # Copy the files into the Linux tree
 cd $DTC_LINUX_PATH
-for f in $DTC_SOURCE $FDTOVERLAY_SOURCE; do
+for f in $DTC_SOURCE $FDTOVERLAY_SOURCE $FDTGET_SOURCE $FDTPUT_SOURCE; do
 	cp ${DTC_UPSTREAM_PATH}/${f} ${f}
 	git add ${f}
 done
-- 
2.56.0.212.g129ede20d9-goog

