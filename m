Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAED71A4F3C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 13:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273111; cv=none; b=LzE1UU+f3Dypaba6xvsgco0T6OfkdD9BkXoOI1yb+umifW64+NtslsXXYb3Yxwoz7cM2I8eP7Q54s7z9O2aLdEZ6VShooEvddfl01Wj1huUIaKA2BrTznCFQHLPrHFY1/ScLU+U7xlQKnndrSrkeGPDlkST2ZEsqmO9YpEJKhZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273111; c=relaxed/simple;
	bh=qsIf7ud5Ph6QqblFlecYc9fYw1lGDBnS/dITukEPMTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6Ph7/pV1XMl+9N1k60X2Hc9Ts4EsHSGLbmqRzDxiGI5RRClSs0bErZSvXe+9Rzl3ExgAWFiwKrZkFgot8eHIzhWxdMZV3IJwfovqzQZjD8tf8UrYUxvfkT44lkqn5zeUovkk2gIYIszkHc32d+BAP8C4TW5gzlcQDLQjgJwrGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhdKisud; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhdKisud"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8298fad2063so2067544b3a.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273109; x=1774877909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=;
        b=EhdKisudNMpu52WQt82xZBuhjmpsHFgAdupV1pcw1o9aemnE8Cd3AAgTW7e2Yv/lXC
         DAKWqKhBwLQsRPfhY4kqrKf0BDHrpkR2/QnnAaiaqw+7oTprRgnRiJ65Lb6OVu/etJa3
         kwHHGasgaXrkUydgwgFcLcZh6xxfJ3z7wgqObD2vy/YTxdhqDxB/35rREkrvFnaJHGoW
         SMqog5HvvHNGFMedIcQg8VJIhvGqsBxQxIPLDbBFjWO4ckjlK8pzAOZwZYQ6rs0avISX
         HNO+PaxY0Rd+exhBxTX5gtHgtyjh6zvJdanHrbiOCRTULynTYW6CPbUmsWOt91vTMpxG
         0KzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273109; x=1774877909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn67HXpA7zjDtiRyKaRULlABylDK2UruwZzMMz6sLEw=;
        b=flbSMHjmWSOKJRY6PAkFB2f/BMgDDc+hOxfKWwxrpYybEQ0DluYmQj3mn4KaAUR1zf
         1iCmSAVdVVOhB3ZveBI7hQx4bwVOFpgEUtsV5sKCjpVX/24A4nlRNCMuFghV7beAbfSR
         GWgeZ/vn5l/Ndpjd/5HWEnh9yq8O7q0vzB19TFnbDQhh44jVcHnKtHhew+eBEgqRaJyn
         3Rs1hQVB4KYss+3yVqrnz1EBwS4Oxu5jhIptc033r9qgN1+zo0rgJN+4nIbAqDbvog36
         p5jcsXAMiN9Tjnugi3x8i+QV8nh9tNF64gWU7AQuXgIDkXkeRNucV0ZA/cBpA5FTIHH/
         Q2XA==
X-Forwarded-Encrypted: i=1; AJvYcCWMg+eOO7ehXqV0vHFILvallmdy87Ofx7M0MK6Aa6X1KQZUEWi0x/40nON5ckI6whK71MI5vd6NgEyy@vger.kernel.org
X-Gm-Message-State: AOJu0YxuchCqF9XBOFP6re+3ZShGU3MKU/TK7tMfp0pLD6nT81/7qSVD
	p4JX/HoTW2Nb0EjG0c2qf1QnkdP3Q+cNlj9KgaC9vdP0QApme4BOAdBv
X-Gm-Gg: ATEYQzw0VlLhysvvgpD5RngwwIzyGO9WTW8KyQ4D95Z5l9WMPBlnDLBEDNnCf4GXylC
	Kx6hfvAi+MTm5PwEPghw3ccwt9HT227XOD9dD+19yd1M9vgHC4y0J+X9Edkk00R246qUOq5aFdL
	hbxBVjVilb5mHaUjTEAhPhJtcZKdtZcee/Dk1xdH3w8ILfL7ehMib6fFZAOMnQ4W4zQjr2qVV2x
	vTW3E+cfrEJjGAP8Jm2bGoXmCoopz5HtThXMQbnB8YbUKodHrzVOzeli3xyvvHRK1ZqL4J2PRv4
	Ql/Fs5DA2K+ol5AadPq9vOqR7DanRGWQv8xoPMDiH3PFeV2dr2Y+Ac4LAI0bTG+wYuVwGJkvfbe
	g0ScS4q2DIsE9L3c5wbB2klNfRVxqVYzE8Wte6nU/enStFvTZ2hzb63IkO+0qKT2wI2OfhdpMni
	5xowXgOf4mxENRYnaVfzark62QhBuHSlDDoCjw1PrIuL5jUAgQHaFEgwNnH4oKTMD7EffRQnyx/
	Kc=
X-Received: by 2002:a05:6a00:10d3:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-82a8c301dacmr11323142b3a.34.1774273109336;
        Mon, 23 Mar 2026 06:38:29 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:28 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Mon, 23 Mar 2026 19:08:07 +0530
Message-ID: <20260323133814.14152-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and renames thermal_flags property in spear13xx.dtsi to
st,thermal-flags to fix the unevaluated property warning in
st/spear1340-evb.dts.

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: fix dtbs warning on spear thermal sensor

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 3 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0

