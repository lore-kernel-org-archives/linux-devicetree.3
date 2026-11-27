Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774793;
	b=fpiYtxonmf7h5hLCsWCIpfhaNFBiZHI1ZuN1XirjYEWd4xEkmkRwpt4XkaruSWmJbEva
	 jqq8r+k6HNFDBEphzIa8G/VPpt9pGrkzNx1vI8g+uguFcg8Kdo+MXJRmhNc4QZD6mxzjz
	 N112VYz0HVBtYQCP1VyeBErAv5J3nbFkYOlSwtSty/DGfGe3nIJ2aQ9UPt5UT3W5NtuxU
	 t3QO5pleaeSo5aH1XDyZRzMmz4gCDfIZ9+uUQwqgGqEsDtZS66vaDdaE1pjxZk5jUfpsR
	 qX+RCvtV0+EQNqA85fPAal9M2PRAhZRqi4cVx4EUSk/v4otE38ALrcPbg9nw4g7XibA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=aVH5cP7pmE7+Gc1YBIanhzWnvzfL946zjGCFobUuzSA=;
	b=gs7n7Os+I3D9JUxnsusSdO8MXwkURQjLTG5TQEp6ZwatNDfjarm71vom0xwfJlslJTrT
	 pL57QDPdxrCmMxAlN6VhDNMc8JejkEMSyggY9woGj9loG4FKyaBB8QwmjT05U36mfX5kW
	 QkRUD4jNAigLnP0NZs6fntx8IElNaAccIuPmiVfV65n7Kzk0cU3y3wFKxBfIDQ8NnYh+/
	 2pr8RX2yF6eAqnSbVamD2bZpDZwZE84xScQbEycJdx1PFNA8TGqIaYSq/DymGKR6TPWlh
	 SFhbQt1ZE3AwZgQPsX1oNuioJaBpeZAzl9FmR9TIZMIwqchB26yfE2vSRodR7DHR3Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s530ybTG;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E259606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E259606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s530ybTG
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdec1c95fa2so194104a12.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774793; x=1796379593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVH5cP7pmE7+Gc1YBIanhzWnvzfL946zjGCFobUuzSA=;
        b=s530ybTGbIbc1xJHfvMbaFIkyd84eLYU6b/KLKlJtqxWaR7rpjLmoZICIA8x8/hCjV
         5gPjiA0nkI1rqyqYNJB2S3Ue8re0Ihkp6LA9LvA6EFEnfpG3U6xBFZbHvS8DCeDW++nZ
         ccFfCu7dTQbpHBPZ+5JfFhcIRwV+e2Pr61+CuHwDm4hS37zSBXFzTZZX0yt6mijvGhXJ
         FRacnXdWfk7hDdC12vHFnqzQDhFd3USXFvFQCWGSDkTyPrCUVNsvTrrmU4+wMVyU0v2U
         /JR4o7y7vHwWoIIkn0sUL8rGwVSKbFOjwFps3cEuhBTkrKIJ215TuybiKTCsx2F7KAlX
         2oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774793; x=1796379593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVH5cP7pmE7+Gc1YBIanhzWnvzfL946zjGCFobUuzSA=;
        b=gYeu+VAYMtetSuQTEw69X7SVM2nFoleJ8bTeeZZHRCTkJ8hUmgvnc9H46DsmrhAD9N
         IZymtqAtIrrD6bT6QEPofJKlIUCiEUwYgVxLg9bLMAamk+xsqcV+suKsriSg8kShR+dr
         aiiwJCLCsIqmXuhPHsdgP1ansN6H9/uI5RbUY7OR6UjU+UHm52kJEWhfY4LX4Cb3+YdV
         SnsmisTvE5xp75+944aVHwywfEZJMQLObp8cdbGkxlMpKnFCBzGfuBPq0yhcNImcM5Tf
         MjnobTZHS0GhQ0AWiw/4CQjmlhWfZuqRPkg0KGUk8/BwKvucupMW3UTPuR8Q4ySKNBDi
         aQeQ==
X-Gm-Message-State: APuU4Z9nDJoTNpst7xnQXEKeIDS9b6Vh0PsCg/nxB6lm22LXjiHJ8UR7
	/BGKBudYLeYCGkZI5Ko2z5mDkgp7EkoooVt7MzUcrwZfIEo7CmUjn5MUMnY1C2Io
X-Gm-Gg: AZFdTZdd3j8WT+bpCXBmTUU8qMVjJNo60hrYwpOLXLCul3DMiZ83ZyvFvztmwctoixh
	UyaqRakP7H6aonPM7QMXRL52y4Rw8N/k6ICa7YDeEzXIHkjjV4bvfKFck0VWuxIgkqPXrsR9EGK
	C+eD5W6seTSU8X4m82+PBvz41E6A8Rp9RPrArw2s1uS0XyHId7cJztpHUvMmY+ocuZlBlHqwT9S
	ndIns0gjr5/Qo1CNqaKOb5fJpMqD8QHyRUxX19UdZaoJsvoNEsTV9xuLQo+82o9BDfKRRrOMZ7h
	GpIXOXTsB0ZhnEcbTmoJKkWks7791Us/ILiHITtlXGbAOoeHDE9zXJcJjZb43h1k3ak/rV5uQ9V
	ge5Td6WaEO/C3Abb7f1dwlo9mSzFtStYkRBbGuWP54/WglHOQ4qzSv+luTHd5SwFnJcBuHqeFjd
	AEvP4wPgcK0rUshfJue4bt7z78oEtzr8GOS1ROE3px3z3yAYUuHcd7YX7Pb9vigw3aCaBT1Be8B
	Nqk3d0l0qHJH0O420mggR/zSW7KlZxFlZExEIATZeixr/1bB4mdo6PMwL+Obj+zSZXnV2qreYOD
	KGxXvGB/Z54A812iBWmEsNPjLsSfaE3OfH/nVUadinWP2lme1krDgg==
X-Received: by 2002:a17:903:4688:b0:2f0:7d6d:4a09 with SMTP id d9443c01a7336-2f07d6d4bc1mr273030015ad.1.1795774792626;
        Fri, 27 Nov 2026 02:19:52 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm107807105ad.39.2026.11.27.02.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:19:52 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: devicetree@vger.kernel.org
Cc: Jianhua Lu <lujianhua000@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: qcom: Distinguish Xiaomi elish display panel variants
Date: Fri, 27 Nov 2026 18:19:18 +0800
Message-ID: <20261127101942.3215633-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Xiaomi Mi Pad 5 Pro (elish) ships with either a BOE or a CSOT display
panel. The two variants already have separate device trees, but their
root compatible lists are identical. Loaders such as Stubble cannot use
those lists to select the device tree for the detected panel.

Document a board compatible for each panel variant, then prepend it to
the corresponding device tree's root compatible list. Keep xiaomi,elish
and qcom,sm8250 as fallbacks. The binding now describes the panel-specific
compatible lists in place of the generic-only entry.

This series is based on next-20261125. The binding update precedes the
DTS changes.

Validation:
- Strict checkpatch: no errors or warnings.
- dt_binding_check with DT_SCHEMA_FILES=arm/qcom.yaml.
- Both Elish DTBs built and validated against arm/qcom.yaml.

On-device Stubble boot has been tested using U-Boot firmware.

AI assistance: OpenAI Codex helped adapt the existing downstream patch,
prepare the binding, commit messages and cover letter, and run the local
checks described above.

Changes in v2:
- Remove xiaomi,elish from the generic SM8250 enum, as suggested by
  Jianhua Lu.
- Add a Xiaomi Mi Pad 5 Pro description to the Elish entry, as suggested
  by Jianhua Lu.
- Use sm8250-xiaomi-elish in the commit subject, as requested by
  Jianhua Lu.

Jianfeng Liu (2):
  dt-bindings: arm: qcom: Document Xiaomi elish panel variants
  arm64: dts: qcom: sm8250-xiaomi-elish: Distinguish display panel
    variants

 Documentation/devicetree/bindings/arm/qcom.yaml       | 9 ++++++++-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dts  | 2 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dts | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
branch: xiaomi-elish-panel-upstream

-- 
2.47.3

