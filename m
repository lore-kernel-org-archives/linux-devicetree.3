Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BA3BED2A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868516; cv=none; b=Rle5/L0bONTCcwSxPOOBbUSv6/s133FVX3KinklksSoyp0Jc9eZ0KdMUxR6QsJLKAYgdiyE37zx3TUYJgHECacaCQ/SKbnsenDc/3SgIYcHyg5MhyonKa6cauAKwnIEv0eoZLpyau4SYM2lPJtqEuskb8x+k9FMlMZqM56KXxWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868516; c=relaxed/simple;
	bh=OzVTQgV7DNr9r03rbMR0B8M3EozSxWWh6geGT1Lm3Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nxDa3RgZrhgE36x534p5VWBzYUwx53Ctu1CIxJytz79fhy6GddHH+Alil0yPTU2RXAzlT0R1KzFCtPptrYUnXnLRjNEMzstSzGXLFEg1vr640MLB+13/O4Rp3vV5yMGeDNa8gq2m27J/20lBs30D1eA/TuDLRD8zdKrcDub+5XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPrKxZrt; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPrKxZrt"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1106783a91.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868508; x=1775473308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tif0BX5UVtB4rV6WFT+caqXXTeWJp7XZF9XEZjBKH00=;
        b=KPrKxZrtzNm7H+lmmpwlsNPZw6mQBW5Na2GieYsiiuiBQPDaBwWjESlJEl8Da78DNe
         YXFdF8T3BPd72u6e1IbSnfAI1b6C7kwx3x+pPmedTWXrq1NVcB4sjD42E2pg8mP/7NZA
         A4ntRL67Pia2I+oNPcunrdUZ4lYCK1+DdYG0jdbuhzUrY/Sp4Nt3DkLB2GpiwXIef8xl
         QLwCFx8WmUEme7q4pM9blBkbF9j9WXu1jHHODUTUt1y8Cdl8FBv7PMTM9OpYcdVnC4TO
         bklXSi9N8VxhdmDVZr3W3ET4CHPyIP4nS7nQA6Osh5d3kRqKxq4Zf8BL8rEYgEG5dvp+
         VebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868508; x=1775473308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tif0BX5UVtB4rV6WFT+caqXXTeWJp7XZF9XEZjBKH00=;
        b=fz8O6jKzHX8v89Slmc+tsr6DCCmMEFlLGh2k66hGOFcRCco1X57AzizViFzdtsYla5
         U9MBX+/QnBVPvoQ02eNq9J1pi+j9SyXibLdEsD57AYIX7gT8Zeksj0/nqUWNmn9C0gW4
         LSwGonpPHniR5nyic8YDXxRPxhhS4VbZA0Kp/KwphAdfrivF5GLVHrUG0N6k2VY7BuXk
         9iid1WQwykrJ/PPsM40LyXdfxIQub2E0u3rb1VcqJpK733xGOdiKyXe623ov2lvDlhZC
         GSnIE63NvN33cPNpSJMrhdkSlxEGxy9twTtvk0PgWs2Kb3MBV97qfAxotcnvOAT8OmrX
         Wygw==
X-Forwarded-Encrypted: i=1; AJvYcCXrJPntZz5rQMzz+4556VhUvDHZ61iTPP1zyWTvBKsQtGfil0QIfO+MyU5K4uu0NleQnt/NCJ1ygni9@vger.kernel.org
X-Gm-Message-State: AOJu0YzblYfGvBMwf2kPC22Z4h7GrpCta4GaXVntpecf+h/jV9Z6Pc+5
	XkGiSOa4EFfDprf+RUZCoF1CjoYX9/KliGmMFvdFEmkmSJc/OR1mMWk6
X-Gm-Gg: ATEYQzxHU8IXAfqgibZcpRSOhyYR/Vgw6kZWlPFRzDh5suyM8S/H0itrHVEGppqMgUN
	sKxhB1dTVoSDTBlkqqwxpximCFkkhcDheW08o76/KEm/+98xD1hnfWsOPoTzYeHv6VvV7Z5vJSc
	wuPIAZzCRlk2edpCYnE9yyZ4haK39xr8h4S7EQov2pGLdLK72UnmkoXHNRnh2To4b5kZA4HwWbg
	kCWo6PPpN/smM6vVNhcmNxwPVOysWXui1YWZB+FuoDbZ3WG7fTaL3hMEEvpMLbC3zZL3m6iCMrq
	jrcuJMzrbT5flbYJlwxDfuzBc0egUU+nnQKDbWhDpd7Wh3xBtPA7nth2h2BrTt2v3zmMDgY1G1D
	qvgFnK+Gb0l2OJ8/6OpIouFyhPcrqTwLGr8+zYPaK4ETWwWEiDGx8nEURDYY80m4bpTeq/jIKPJ
	1oaVnIHl/cBdQFZFwAmh4Gah6W3rNV
X-Received: by 2002:a17:903:37cf:b0:2b0:659e:97bb with SMTP id d9443c01a7336-2b0cdd104e6mr122029165ad.46.1774868508266;
        Mon, 30 Mar 2026 04:01:48 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9a6e:3eae:13fa:fe3c:864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24279113fsm77701375ad.60.2026.03.30.04.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:01:47 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v3 0/2] dt-bindings: power: reset: cortina: Convert to DT schema and rename node
Date: Mon, 30 Mar 2026 16:31:33 +0530
Message-ID: <20260330110135.10316-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Cortina Systems Gemini Poweroff Controller bindings to
DT schema and update corresponding dtsi file with new node name

---
Khushal Chitturi (2):
  dt-bindings: power: reset: cortina,gemini-power-controller: convert to
    DT schema
  ARM: dts: gemini: Rename power controller node to poweroff

 .../cortina,gemini-power-controller.yaml      | 42 +++++++++++++++++++
 .../bindings/power/reset/gemini-poweroff.txt  | 17 --------
 arch/arm/boot/dts/gemini/gemini.dtsi          |  2 +-
 3 files changed, 43 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/reset/cortina,gemini-power-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/power/reset/gemini-poweroff.txt

-- 
2.53.0

