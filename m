Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089352;
	b=VwFOMXvbJbd8Ys0slNgJejnkPlBz0jbq7B4A2So8dlVhP27g7HguyCMTlVFr37OIICMS
	 4B/KNAhGPi97P9lzieKGJvK1zt/CKVv+eOhxj89nKWv33G6IZyZUuybqWas4wPO2DtJH3
	 0SdQAc7T9KsizQtM/b7ayiEFckqfNE+zIXRn+gKC7xsPJCx12oOfkeBt/O1PS3eMuu8aC
	 uVTd+i87WmDurD8RJIet3RJ97/9jIZmz8+Di62ozSuURgHXP3RkjoelzKC200oCmbF9gL
	 Fn0cmOHihsuiY7buuuug7H5xiRJqPerXxO/r2N6ZsChWnTAL2k6wAjsdlNtQZP7tn8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
	b=O31dC39rRr0UAUFn9dUttt0GG09WqxowgK87GMl9x5+MW1Uv59gwQvmOLst96ZJdboB6
	 7vAOLgTJn5asT0lIdmp5ZSRGmlOjP3lQrzZyxjSi24zpyM7JqnxU9r8DZnfvXHer2uIb+
	 OtN/BP95DoLEa02PGPPTiESWJUQVO42Rt97Ti9FvtdqPDkWkAcc5K4ML0DiYqturAlO9S
	 CTE0DOulDngj9RiPPSe19F1IKLVYw2k2/+98wEXM/m3JKAXusy3l3b3kE/zpuF1+oyXpq
	 ome0YLv2SueWUDsdR7EgZJdfwuTZz+k6BI8eqmdjElwuF7BHTauAJU3BvbJ9eofhFoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA2F606A320
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BA2F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35829219da8so940777eec.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089351; x=1793694151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=ZurG5xutDCh1J7m4GPD1L2fxDLreUhtXfCdJ/Qc0XSYIV3caH9ozgfgRsilfd9MiwM
         WqfYgBCJvBtKJGTxAl+ukXEnDIM+oLtaQcxAsC3+fO720QsZGx8qlGNHlPALrypI92GJ
         LtRZdAaL2NHqNNLZRIM4TJESul12xrc0r1TIg5UH/gfHCaqnsimeF1+ZeIaQZscH/hl9
         0bZr2dpbaagVpp2X2K5xAjUFcHdgy1jIaXKXDDvk/xUQyKR/N/yB2GpO2IxGfpypJz8E
         RB5Jsf1R2fhyL25ZB+LyOMYJn2pUClZkIcopdr9zlORMqMXbPvV8h+V+1lVYpFSV72Gj
         Eerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089351; x=1793694151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=GxpPt/AHcjhhWFZ+JhC6fwM82yvctsLYL/tDZcSupLqDyG6Anno1C/xFaIRh15O/IX
         FPpPKAEwUU3QvjAy4Chj+iM0N0+lT2VLtFlQt2pxS5xTF8pzqSXMC6d1ItL3Vj0bJsEI
         +T61MfRHMPPIa+VPQRfPwZIuuaMAbSOnU6vdUEcuZXWIVZVp0HXC3h1zh6UxkvoH11ky
         rwN05m3QRdMTJlN5P790cJMZCS66q8GuXXiGPzFtRbhEdKB4DOwdtxJhOavZHqWgxWLI
         mFXJW1l5Ll5LuZ8RkAxge7XgRb9BagXWCEwrq+m9oiqeoF26y9q/cX1RkiT0XFi8GU2O
         sbJw==
X-Forwarded-Encrypted: i=1; AKwUvByCS+vJE405NWPpt5cRljVoreHGb3dfw9CXTpwCDyzR3c5u0csQvCBtHANobZ/mkOQsyIkWdKKBFMtH@vger.kernel.org
X-Gm-Message-State: AFq9FYKeWvQ5LuKGNGzlQv56/gH0ek/PcRw6K8YOVJa9XBT/m6KTST+Q
	GCZ16r0fcIoYASeOhkAPXqJbnh6vfeyrsbElOWHxBIGf+GyjmPaPuJFZ
X-Gm-Gg: AYBFou0YTXy3iHa8teYNsRYN9ESV8wz4c7sFmenI9VcvoFpuY8/aqAx6rNfVpkiJH96
	Kt3peL6nwbevnB3xCriKpUGUcdyymLz0yoTTAzRDs0TS/JFneqVD+txN3ZNVmw6C6DePi29+aZ7
	nnnkPWMpOl2gF4hJfWoNSwdL82KW/4QJhmk3mK96xEDdUjGf0kI7+mjiEFNWmedyIqFntSe8sX5
	6ipiICXhGEnuF3CzqjBOSC2HmH4WLyLSgwy5QTksiHpYqRw3xSAccqlolwjUJQ/F0LKvwtEq0PA
	SCn+XtZE6IxvesSMIWneUULDhCouwQyipZA1GNf95bVSEGGQyBO9txSUSPZF/Wk80CHZnb99v99
	L0WFuK6uLJG199ne3hk51PYRXaGb1e0CVb6yUzCM3S3YsZsP96eBibgWz6G2h/bjlGhuua3RNx9
	W3kb0rXe7ZQCBPA3hftUjbY5IXksxqN8Y/EOIxY59j7RQ1WRA2XCRr+u4zjoRde4j2gbP69jKE2
	o/QHEK8ZR8St8r0Zj9JYllI7CtuKODeZABeTTO+y8BPLjpssza08W+OvufbCJm7rk9SW4cZWGD4
	oXUxY9t32WQU5yfANsDZHDMgQdwzOrcGjcwbU+owH6//pw==
X-Received: by 2002:a05:7022:1703:b0:144:f0c6:ddac with SMTP id a92af1059eb24-1a3c53db509mr2547824c88.17.1793089350969;
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm37314409c88.11.2026.10.27.01.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Robin Snyders <robin@snyders.xyz>,
	David Heidelberg <david@ixit.cz>,
	Richard Acayan <mailingradian@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] power: supply: qcom_smbx: report charger state changes
Date: Tue, 27 Oct 2026 15:22:15 +0700
Message-ID: <20261027082215.70983-1-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
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

On Sat, 03 Oct 2026 16:45:20 -0300, Fabricio Akio wrote:
> qcom_smbx does not handle the charger's chg-state-change interrupt, so
> a charge completing is not notified and consumers can keep a stale
> status.

Tested on a Vsmart Active 1 (SDM660/PM660). Switching charge_behaviour
between inhibit-charge and auto now fires chg-state-change once per
switch, with a uevent carrying the new status. A charge_behaviour write
alone doesn't send one, so this is what lets userspace notice.

Tested-by: Adrian Nguyen <thenguyen1024@gmail.com> # Vsmart Active 1 (PM660)

(Test script and mail drafted with an LLM assistant.)
