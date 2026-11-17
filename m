Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936383;
	b=vzIYfIkgEECdJuLFebE+ODwOXWv5Vcjmb28xq0s7IiTaQmqO1aN6HMbi8WCKNSaevpGr
	 oVS27EW+MzxcW+LO2aoVFuQA0XefUz9LUklQ57nsYHHCKbF59+iQo2tkPGCYvZCcVVjS+
	 DFl67RhnJs+Wg636WE4YWT8gtLNh+zfZh/SxLsioLbP8AI07ekKoCOsUdu2dgHZ4ppINV
	 6ckVnnRVblNnLiFn6Ol4U6ELIeeoFteGKWjt9YjJzf97NURrXmbbVvWPUB7qZ/NqVhdtf
	 0WOebz/3iampIymjneu+2MsCGJJ+dWvlM2aG2NPw2r7lbjF4Gfq71sb2qacAOpgvWCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M+o9+9qekLBCMmwzgiZ85/sw7Z0aupiEWaDsdwZ/4vM=;
	b=h4hzh+t+3gEz2D1bVGCY4BBpfmDPCZ9R2+OFy32JhnEL479W8i6KAL6f278s1U2fymad
	 4ingMNFmQQCL9WlFNKWI+kPnhnkorKCNZ1nGTHNM4vpnUIVPl58/lDGDgZBR/apHcoXiu
	 EmjPRXIFcZow7VDnrsrvUmdRguq/ieQUuVvDoXcVnsvx8gNDYCz/zPGQ0nJLOs9mIrK35
	 OHxw+S8TOzt/vvxfdZQ1ycFNogzcVyIu0aYrYp3CctvnR4/slHtiJ03BujA8hGQcNqED5
	 DFK8Kxdsb0YBClRT+mmqvB+OcjX4dG9QqPpDhO61vJgs+RHiB7tnWuI9ehT84W/0Wdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrpOdjQX;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19871606A32C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 17:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19871606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrpOdjQX
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944abeso48244c88.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 09:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936382; x=1795541182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+o9+9qekLBCMmwzgiZ85/sw7Z0aupiEWaDsdwZ/4vM=;
        b=lrpOdjQXBkqUxxULtoY/C0zWkzRPNV8v9WPWwkie6mJNfrRKPe79e6wA0+DFLUp8LZ
         yZjaOYS1qN1PdIHncPT3qqkwux8/LI/qM8Gg6HtuASnXYKBNJW3yQ3EQmVj7iFuNDfIe
         drj+2qZIrdViGVUXMrYdejHOi8go7g1A+ZdU0YsODa59s0SLJGRfpiPrjBuxyp34fIIL
         bbXR1b+a6jvF9VmwEjYzEwKKI/u46m7fbo0P6KejAbPBvUv2Nnnj/6BcPsn0FR0eH4mS
         mIxcDKI/4xQCMdje79OxI1SBfxZvY7PlLXwwjLA20wHJ2n4Ti279uOC6z86M+427Ib0e
         MAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936382; x=1795541182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+o9+9qekLBCMmwzgiZ85/sw7Z0aupiEWaDsdwZ/4vM=;
        b=2TTsZSVrnzpO/FhCSAHONgnxzWdxeVDeYy8yjIAcZ9b0oc4KVjdEg42aqFxvhkPgFc
         iqHpVJ3mfjC/2CdkZNGFylP4zIOHEIuL/tXQQUrlpnCPsP5rr5JaDfPlWX9GxffgZCN9
         WTylE/0HwxQ4o2sRhNWP+oQ7G1JfoqStT68txa8dnz84SsR+bWnVa/Q9a3yXJ1attqyI
         94XIZ66mAFDYHj3XpY3MAj0NHqPBzH4Hzv2bpy/Pn5MovzuExipCRNEFb82IuVv+mp2z
         ea2HTP59a6NUnrWc5ppTaYpcQAnD8SNPjm0K/C6QQw0qso6PTsKirMD/8FkUxAlZBebK
         Xz5w==
X-Forwarded-Encrypted: i=1; AL+hErGdmXugjoLMF3LStub7m30MgbhZvzwh5wDzTTst83o/jpBJzjzeQVWTdFjDTdPYGrmLXkGsk5XauAtE@vger.kernel.org
X-Gm-Message-State: APuU4Z8whm3nLo7SUIo3l4deUZpyoYM+jaF250pMqvs61giFUljf7a5K
	wpMo9vLvu+bZ9/A544PmqsAC34zH5VlG8i7wIDqbfV29gB8DXDy0GwSV
X-Gm-Gg: AYBFou0V5o9gRMUN040U8GfSuYPDc/BbSB8EDU14LLIB1WsqLS8OWWwHqFJK6e0dYQ4
	fghJbtX8pDbhmMJdyUOxlu2i24CRkuzkcLMLBWFP8EGEe9CMBRymkF4n3KgL+CZaqy9GuVQvQQO
	Fbf6SccbTGrNojWVzs+StJFvS7ptfi1hHC18MMFvpkWDmgJPu/7C8wn/vhEC4YjVsPVOEE2cQfS
	wsM6hrbBJ8V2XrZiQSUJP0QAohIraQKPmXqTZBWh0lTOMwuQe6ow6VF3gT9+YVnbLNnEtXWabA+
	9dSMjF4/xpzS8uGLvC3QcUuhU9mbpBdNARueK8XPhy4plXWxDKH6LtiV4kfJu4p0Sf3bc8lJVZM
	D3l44A7zDM7+NiPANRFlDzpxlQ3eZDktgAwKnAGrpXzP5hGX7E9TOpdWI7jZ1JtpFGhZDj/Ac+R
	Zi40tISCC+C6zwqeNVzI/L1L/1Tg7BRS/FWBvFemhsGvId2Fueqxi8qe6rFcTpAfj6Ab1SmXfqF
	TkGDENy90ZBoq65TKLNAqJ5bN/FvLUlF1X4/WgyorqSNJiL/fShWon54eyEOeeAlLRi6zURMu1v
	FOPLiqhnIJPH0ZmI+7T3r8uHp6h6pVqsj1OaoNszs7vjLRx18+GoSMltNlravsVIZa5V+h+Y19x
	TFFHzBh583E2yEmklvaCMKpYWMIf7tdltHM68gqkBcmELU854neditmYlDp+qFL69nEUD52WK0b
	wA5U7+XOi41dSWJEfDJt2byRPgKAsRczN2BteDv353Q8Q=
X-Received: by 2002:a05:7022:7e82:b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b543c23b8amr254647c88.5.1794936381830;
        Tue, 17 Nov 2026 09:26:21 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm14263079c88.0.2026.11.17.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:26:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 0/2] Semtech SX9xxx: add a reviewer entry and binding maintainer
Date: Tue, 17 Nov 2026 22:56:07 +0530
Message-ID: <20261117172612.25535-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a MAINTAINERS reviewer entry for the Semtech SX9310, SX9324, SX9360
and SX9500 proximity drivers, and add myself to the maintainers of their
DT bindings.

Jonathan agreed to a reviewer-only entry here:
https://lore.kernel.org/all/20261117031830.69ac22f5@jic23-hlaptop/

Changes in v3:
- Patch 2: replace the Link: tag and the reference to it with a
  Suggested-by: tag (Andy)
- Patch 2: drop the L: line, the IIO subsystem entry already provides
  linux-iio for these files (Andy)
- Patch 2: drop the DT binding F: lines, patch 1 already lists me in
  the maintainers: field of the bindings (Andy)

v2: https://lore.kernel.org/all/20261117110939.214932-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261117094737.15253-1-kapoorarnav43@gmail.com/

Arnav Kapoor (2):
  dt-bindings: iio: proximity: semtech: add myself as maintainer
  MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity
    drivers

 .../devicetree/bindings/iio/proximity/semtech,sx9310.yaml | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9360.yaml | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9500.yaml | 1 +
 MAINTAINERS                                               | 8 ++++++++
 5 files changed, 12 insertions(+)


base-commit: 20ce8ef9c9e04cd6c5ae0422e251a9b5936c6b7c
-- 
2.53.0

