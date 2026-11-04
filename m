Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810724;
	b=Y/kd6yQ6iBydMDs18HxdyfzUcW6Ddn0eVeZwfNPAVuT/qrqA4DtbnuTmIzkqvOD9e9Jw
	 ty+X0CIKf0lOi4oD8AWQmMwx0o5uExf1Wjlx9wx4dMpy/ioPlHcMGMVYXiDJ781N+gFiN
	 stMSYS8EYu77MBGXQS5vp/63sYvy9FnLTapVAkcdLzUaDKkePXBtfJX7V+aVhVtifMAFr
	 rFF1ETfmvE4gnxFz0UFGLVLhWtzeGbVLwiZBWgVvM6QpOcnb3IV4BGa3RAsXyOcQ7pY83
	 /bjUz5XERhqe5nhReNo++56iUPvlojwj1ojyYZy2ijugBhFtXBPIMI8pDe066Hcd1gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
	b=yz1ERay1gNhLoHm0Wi/Zu7vHh20KvfyOgxQt7wd0MeAHjayvfH2YI0OCKehpF3WTIRCJ
	 ABls3rNfnZKoXgrNPCf36EuPRQcGi4qDFc1XMdZLdC4XcTde1Jfa+MMtXHACN7GtDaSmy
	 qdgSmNinQvdrcWXVqvRPCGU/S/XQsdL1gOm8/HwqjLzLX4x9/al2zO+amidJJKl2LxCKA
	 hRpYKyOcxXuRRrrsjdCz8UH9Vn4rayjJphhDI9+p/u2TsOCeNM1T2/6CfLbxBxAiYX0ZY
	 oZM9/xRDygx/CHLdv60z2HHG9cg5qDZ5Mp6hwPAKLVxVIfwx4AgkKCIdrxrf5S6JZig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aCJZ4/Xo";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAFF606A32D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AAFF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCJZ4/Xo
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1980388c88.0
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810723; x=1794415523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
        b=aCJZ4/Xo9jKnaTImkPsBsYrn3ZiAHaVH5EYy0bf6wENa9Kq1tc6D6GlpvX5t0fkziK
         wiAUHhfbnFo/FFaTP7tTCp1b8oDIUKJNqcc31oM/cgw5UTvGs6A7zVMmehHfmeh/jSh+
         aDMBdXQ2XaaFhxuyQ0m4HZvj3Ao9VTgB4PbCAGxyOrHJNWc5imT1XVJXThXCSeckHrd8
         FzzYh+R/uLqI+X/n4CgmuKQVIF6q2obULzITNmNETkMsHpPdDbK4/aeIAPeBTPshpCmV
         JHCKzrf2gIhUIPftDnZYbaq7Q7rPcyllVwxNKOtUTIfy/Q3gqhTysqJh3PWEP0QYSyc+
         8r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810723; x=1794415523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
        b=DNrrz5U9nwJZJZSg65kAI4tv7bSIywVVTozx5n/5MpR7my2fd5hnteS/ay+r1D6c6i
         L5lG2A7ly3xw4AArDDUtytusxM2jLoRbZeoowzZnYiK/U43V7Mp5FaelFg2d7es37Nk9
         UrktEVl7JmH9bWBBOtpmUG16M8a3nvMDl/i14eJNTPL5fdcqgpg27kBa6i2YXvte0L/q
         aAkdNL/lsto5OSeiHS/ds22ll+HOMovBx8m74P9VPbxW8jUaHO3JAiVk/xXN0DN96KoU
         rt1nM97Au27lApALNfuLw1L0grIscB2Q+O67AfRyyrEzWU/8J927mozOSzRXjG3ul8+W
         5rZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAw34X7S4/Kd6QkrU6TXRUboFimJG00HrIqZ1IML4lErv3VykwEwnY/oOU+Bd+nYy2dBJMtZqdU0Jo@vger.kernel.org
X-Gm-Message-State: APuU4Z/zXhtRdLj03DopVdtzoBfJfX886Gh9lV9neeX1eBXsbBiwBFpZ
	s2yByPv3kdggSAbsweYlXJgvw6GrYSl1Prhklq4EgUsK/DxVT0D93rZN
X-Gm-Gg: AYBFou0Fage5v3A85bZIbr5L/2Z5WdMG0qt0QX3Mi5EOGN7go7XiJPAdsGJodvg0CaC
	ugXI+MKEH/OWRazF8KNB70hplF5qQTCO0doBB4MkUEeeZMf7A0cHcJCXDkeDfHNOfoTYSotZkSe
	A76V1wBEmeTN2WadESK0coBz4HwcP0H2QDuhdWsiugMd+nDXunQ2YhCnteGkHhwJA3zbEwoZQyy
	2AbFQUZNfKQxhNj4FpgEXSpvpm8RFxXvO8azxJixyVn+wXaEb4ypL3Gj0ji9ah6vS2wwQNKCyyQ
	2ZSqyRIxr2CMW6E6eH7QNmU8nnQht0KwCxVNXpwXEXklMOSp7FoZk6cOQjP7/VUzR/X1iJqw/FG
	wvNZiPTbz9almGPQky0xN63fny0FoXvWUEKiajBoyWs8F74CqQKted5ulkU8P9KR1xPoXowHVvu
	qdQzXAJKH+hbh3EU7k9uZedLzVeBUTk5qSrhSYtvPF7NfTjCNOoR5V06dUDc90HktNaBGDBsKot
	6Q4jsAamyUR7hOtmv5hwJfm4nDUL+o9GS4AhhXzpYP+F/WF69Gr4dXEFaSf4YrVcYdKehDT9tpy
	I6zq5H1t9Z1NSD+4dm3032Yc7D7pzBbsZH2krB6us9UC/bB4AMn3Z/fg3Whp3dADBnjyNUOZCiv
	u2NM0YvHKz60G5bOiu7QNn6Zbu409WHJ6V9TLxWIYNOADMjrlsRt34BCxY6AXp3OvYqdojF1+CH
	EhkxjuSdLYkD1Si7O2C2HWbFWvp1kRa87vwzNqAB3gDzQAgm7u2pMF6t3i5Hm3aPo=
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr25419815eec.1.1793810722385;
        Wed, 04 Nov 2026 08:45:22 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Wed,  4 Nov 2026 22:14:59 +0530
Message-ID: <20261104164510.105359-1-kapoorarnav43@gmail.com>
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

The driver sizes its channel array for 10 fixed and 21 external PL
channels, but accepts external channel nodes numbered 20 to 50, and it
never checks the remaining room while filling the array. Channels 20 to
29 are the fixed ones, so listing them adds duplicates and overflows
the array.

Patch 1 limits the external channels in the binding to 30-50, as Sai
pointed out. Patch 2 does the same in the driver and adds the bounds
checks from v2.

Changes in v3:
- New patch 1: limit the binding to channels 30-50 (Sai)
- Patch 2: only accept channels 30-50, so a channel node can no longer
  duplicate a fixed channel (Sai), and add a static_assert() that
  ams_pl_channels[] holds the fixed plus the external channels
- Patch 2: rework the commit message around the duplicate channels
- Rebase on fixes-togreg (now on 7.4-rc1)

v2: https://lore.kernel.org/all/20261023185652.195025-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have ZynqMP hardware. dt_binding_check
passes, and rejects a channel@25 node in the example.

Arnav Kapoor (2):
  dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to
    30-50
  iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels

 .../bindings/iio/adc/xlnx,zynqmp-ams.yaml     |  7 ++-
 drivers/iio/adc/xilinx-ams.c                  | 57 +++++++++++++++----
 2 files changed, 50 insertions(+), 14 deletions(-)


base-commit: c293f0db308fe76a0a9b0f6674cd2dea149b03aa
-- 
2.53.0

