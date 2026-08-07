Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95224052CA
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088464; cv=none; b=HHoZKhfElf4Eo214jSzj9fPpmCARTmA0cLx258vp/9oqAbZDdLlOvxHcOtTvWRPjODH3wBJP1zdtKPEEAwcguJYSH/GsDaHIdGOCRgarwWQIko/xUuhCnXhA9/aHFpz//RGl7ICIzNEn/Co4eCTWUmL2frXA8dpziICwY1vcMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088464; c=relaxed/simple;
	bh=ScMM9GxeeV5e3+9VHl4c/oHNnOx6+btkMBr+c9U/TL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qPjyHsfxlaZqDDGyL2VcUb/RPoT2xdbaHgAWlIx+wLNCCB7/QXDvgl3MxUGGA9SmABUraMU5uwZpe+MXZedyoCvPADcaAn9wGuO4T3LdiOLsdWTTMN8udotEj2hYRt8yl/gjSDuwoPe/lM1c3h27kDVSDVqHFRj2EyeuE2moRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=mk0Q56e6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="mk0Q56e6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fd4531020so1970254f8f.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 00:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088461; x=1786693261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=;
        b=mk0Q56e6Cy2LvW00Ni9/Ph0MHah/nwulhc1nGETsd9S6PZMKaq+U46sXC9IM/iQGhW
         c7cuOu7s3+WZXAU41LLe6mUcA2SHS2nOOUptoPLoOZoGJW6isLn3K3fciN1WMyfzwHcI
         Dq7oAtwYDYbLGsAICWl4ZFITQActjNWF5pBG6IJZFwaLrmnGc3ld8lRl56FzOSC8Z+i5
         RKHJeulm2dKN0txissaZQOev3FGwy6z8/jtoZp72I3W5rivoqglkHkPGCtU8fhYAkZbM
         RFOa6I2BkTz3y918t86aJd5Rh7WDSqjCdLQkxuUHrK9UnsxooQzBym0zGoL3Kn2qih7W
         X18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088461; x=1786693261;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJeYOt804451rzDFy0He69vDtZSRNQGd+4J9yYwV0Co=;
        b=DSonPTpsMSeyAIFThdYoKwD2jEVktY/8BnrILxA90+sOj+FsXGzYCCdUEer2q3HMcW
         yws9Sk3/tazMBLsJYotojyYOqdhPd6zjFrbAczFhqxbuAO06MqNFgH5OW0ave2Bgvc9r
         0WV8PX9FTp+wE4su54hWws3x2jV1ay7iyJ33gWO/B3eZLPGAzA14dfmf5xVkEnOhNZif
         RZPhVi82u3mxUByXIRl85Iw7YG0XXUtFutl8FxQ8ApJkTEuzZvF/R4XhPBHCqPCy7YiO
         ZfgsF3lHw3FOKhizihiy7Uj9otnTTAFzHFblVvoIrMBvdr+YZwv3WT2scKa0p7kTTg9e
         /haA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/65hwJrIo4tVCSowjuRE7I4Q4nxKHWr5a2s2PyOSshaqIpNV8nT6XFgnvFEOFQGnlTA6M3kJNTPqD@vger.kernel.org
X-Gm-Message-State: AOJu0YyWT6SzohksvB8e8/7mN9R7tBi0DdHSt0vshyvvbvlAF3eECKUu
	50koQn29U1EhkSy2Xv8RTPSiueikBnFVhvwxG86kceVQi5t/+Ta8sp0dYq8egWJK+2o8
X-Gm-Gg: AR+sD12UVB5+T/86G4LreXbdGt2nXsYWi5DRUe6BHILiguFHRezg5pwwekpuVoxGxot
	PNSYf5N3OX3srt9wE92FbbGRMMlF9WlC9DiCZC7K7+4ZKJnadymS4A2HT2pmtWHX0IZNYg3WGgN
	CYBDoOX9TuWX30Vqo8hyoDtnW9CxMYOsmxtt4AYxlfhr8ZPHAc098ju5mFUrPXCo0OpzAucPbLO
	YP7CTSz2gy9osKnfGjHUgBztreDiQRm/Mgp0j+02qovpDima7yndRFRgqdD3ILgOeWKYzKWKSSX
	rbjjpfbV8BYblKoZ+if+tWGfOUdsAyhPzf2TiFabYy6e6nhMxQFzhhF62hW5urHMrocbolpMLQY
	RIRtVK+JaN27tQJ8xMp31DFvikBB97lZMJnrpj3zCFak+ZxY/H5xUxt1MvM/hVxN+mYyuiP3Ycz
	nUDIXoI4mDMVVhS8WtaJvD2W52KjxEK+Zi4Ft1p44ko4fJismdYlmrrsMXDvVMOrE=
X-Received: by 2002:a05:6000:2586:b0:477:3986:9b54 with SMTP id ffacd0b85a97d-47fec62e2b4mr28868834f8f.20.1786088461227;
        Fri, 07 Aug 2026 00:41:01 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:00 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 3/6] dt-bindings: bao: add I/O dispatcher device
Date: Fri,  7 Aug 2026 08:39:30 +0100
Message-ID: <41e65cbe88021964afe55d9e3884ebc199928264.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the device-tree binding for the Bao I/O dispatcher, present in
backend VMs that service paravirtualised (VirtIO) I/O on behalf of
frontend guests.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Model one node per backend device (single reg + single interrupt +
  "bao,id") instead of a single node describing many devices, following the
  gunyah and Mediatek Genio bindings (Krzysztof Kozlowski).
- Add José's and David's Co-developed-by/Signed-off-by.

 .../bindings/bao/bao,io-dispatcher.yaml       | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml

diff --git a/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
new file mode 100644
index 000000000000..f118c6d486a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bao/bao,io-dispatcher.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bao Hypervisor I/O Dispatcher Device
+
+maintainers:
+  - João Peixoto <jpeixoto@osyx.tech>
+  - José Martins <jose@osyx.tech>
+  - David Cerdeira <davidmcerdeira@osyx.tech>
+
+description:
+  Backend device exposed by the Bao hypervisor to a guest that services
+  paravirtualised (VirtIO) I/O on behalf of a frontend guest. Each device
+  owns one contiguous shared-memory region used to exchange I/O buffers
+  with its frontend, and one interrupt the hypervisor raises to signal a
+  pending I/O request. A backend guest that services several frontends
+  instantiates one node per backend device.
+
+properties:
+  compatible:
+    const: bao,io-dispatcher
+
+  reg:
+    maxItems: 1
+    description:
+      Shared-memory region used to exchange I/O buffers with the frontend.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt raised by the hypervisor to signal a pending I/O request.
+
+  bao,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Hypervisor-assigned identifier of the backend device model. It must
+      match the identifier configured for the device model in the
+      hypervisor.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - bao,id
+
+additionalProperties: false
+
+examples:
+  - |
+    shmem@50000000 {
+        compatible = "bao,io-dispatcher";
+        reg = <0x50000000 0x01000000>;
+        interrupts = <0x0 0x08 0x1>;
+        bao,id = <0>;
+    };
-- 
2.43.0

