Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFF3BD651
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255364; cv=none; b=Bkm2/1TSooNSKUDCtrnQcDRm5njQ6Sa/T7Fa2gjV3na+wZ4RAUWX/JTk0sjrqP7KFSHTsXxmdP1ksKYx0I/+1wfh8UEjWrgMUX2Xkh0qkckAoDkPsP8gPAkVtK2DwJ3xdUp2A19iTbZAgifkxuMORq04KBiCmJMR139zX+KxRfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255364; c=relaxed/simple;
	bh=qEUwuxS2ldHJrvbMxrPEbm+N5g9T6Qqu/k6SeHZj9OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AUK2RDFPeyCs+RmJ19GYTD6wFFvkGzHlMSRMD2TBDWiTkvfjCC8v71xV3VTbrC4X7L6iDuXR/Nk/6UCSIbgrPkSaeHjaxWoNI1QbLIEREolNFiakelj7fMgbJAYR6VER3VxRKwSmgqfC4jHz+X8ipmVj8jMULDZslf8Kmd4KiGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tp/327LW; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tp/327LW"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso566309a91.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255363; x=1792860163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hX9ySrij59b5BCGF/OT7UHUToVS6gesb8Ac2hP4ly2M=;
        b=Tp/327LWGCLnick1CmbS9bvWn+5MsjeZL8eGuYHXvysCnnmBDqQ3wEHCWP7Vm1lJp6
         DRZfGIknlkcTqYr/JFw+yu+ByO6QbJEG2GQaPOLdEWOD1dTsPi8tmsTLGz/aMgcXv438
         tLrY2BPbMHf3ZGZDWobPyJBd9OnI2kqpHsZkTKeWxE1gs0dQyhI0aXFSd4P0UQbXC4CT
         90nQoSsXt8uX3J1lDj8SFTqYpiQ0BouZjmM8D8/n7EpoWtmwO2dqpyicx4wWi4qQnngI
         OT7Cwob74187Rj+Lw2El1y8wcC86cYZYaaGiKj5tgu8QxgdVOoSAf2X/g97yCM5LfSqo
         Vftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255363; x=1792860163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX9ySrij59b5BCGF/OT7UHUToVS6gesb8Ac2hP4ly2M=;
        b=GANi8LJXaF3wvq9brYtN3mgAwRjv6ocdsPd5AvFN/dc/T2wdTYfzRBA3Rf4xxhtsPO
         NgHIdkHP/FdUIIj5/bTy5vUmPR1/yQalFZHoP8OnatnFmp/IALMA1OPpcm045uVgtbE0
         5VkuSBinjfYw1H+OaqGFrgE6f0j4viKJ8bQW2Sg6LcMgl1wwGbOh9r2I3LPI3KFd8at8
         MaEOEGk9I9UA5mOe6ElY7Dr5Ukrux8ePBmXTfSQL2AesBhba8iXtFDYhWF7jJfs53WIN
         hUzT5zKEWIFLibac7OWQRGJ+sH3y6ieHvvd+RnQppxG3rSye6rXPOZ7dp58lKkTVVev8
         XqiA==
X-Forwarded-Encrypted: i=1; AKwUvBzWBUjBBzD0Wo1c27azVT6JmYxRGBOjW+yepVGLHb0W7vdjYDSY9kMXCmlCpNYjiwKGulRpjQcqzsvj@vger.kernel.org
X-Gm-Message-State: AFq9FYIWcBSPxSgqrb0m3MchhL5GdXozRe5SnD4purDfyFRus1wRmrjS
	iMljKDVfdI3jgvCTrsjnp03n68YmAGvc8gxvZPZNVDng1xUWx7yDS6Dn
X-Gm-Gg: AYBFou20pbrFg0mPJYk8v9471R3J2spB61ajwBroaXKkPman3tu3fjkya+p9Bf/eezU
	CnHZLcgT0tEYVZACT2TN5rXFmfodqyW+j0defLNJ60C93n5hUS3eqzLPeiGCJZK/udedTTs7wow
	FhZJZTuP1c04wcAQFcZskVLxDxO6CdXU1m3VMCb9G1JRYsWIH/Ow/eBYfSx0CzFAHVpQHn0N2mk
	Yjk98Maat6O+Hvi2ziOvV7is6MNj79wWugDNAsTvtYgyRHqvblqFgkqD3c1i/nqvSUIPRoaxm8y
	tPT+BJFCQA9e2vPorwevTmXQvz2sqeooqG+Muee2hQx2UuSAflKOM0Sa3HtiLigZ2KHEopinZv+
	55Cnmn4liSDs+PW/0eRchAmVGS7CkJylKtoRz3DjrzKGYimwXEANYyWjC7ijVwqE5ymvCu4LuLv
	SLUtPse943OwM6SHc5caSc10/k8/xXWtsdWDhCj2TluDS2Kg5yn01d1Vf211+qHQ==
X-Received: by 2002:a17:90b:280e:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3acef58d853mr2395968a91.54.1792255362914;
        Sat, 17 Oct 2026 09:42:42 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:42 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:23 +0700
Subject: [PATCH 1/4] dt-bindings: arm: psci: Add skip-suspend-mode-switch
 property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-1-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..7777077dd0 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it on firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.55.0

