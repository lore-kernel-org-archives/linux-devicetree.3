Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174577;
	b=trJOZ0LOkeTT0pHv+V4PMwJpAkybXvuPS0TC5Nkr1MIL+znLi9ENkLiepvhDWQ0WDM20
	 emrGWvlF+8uh31R2IO7dBAh8R01b+whgYwSYKk4ZC3LG5VZarKT72V+lhD51IoH5A63AH
	 zrsswRbuI5QatCxPa2ESiXOFUDpBg2FI+SPwU+N6YIlDTAZSXTWSXs0EJisFcaxyyiLBL
	 2VbIgEGdROZKV1jLZqiCge3SxsR47azIQ7oTYI/MWyhYby6B60dEy+FJloWDyP93797KH
	 bVbUeQio/+sz5T53i6fW/cI9zI3oLIeGVsJUxxpYu4nEFcm9haFjyZnv1QvHO9LveKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174577;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+TwsPHLOwb34n682qcPLKZ3VuEl7ybbeCtYLA4lwg4Q=;
	b=sJxY+t7Ts7rJXi/tno4ud+voMjGIzK89oh2ES6nY70XbpFsclTDBmGtpbaK5qau7CsFN
	 BwyITJ8EQHnN+n2EDCaKiu0AdcqP/xrGzgjhwkM79TrSlFPN5doAip/luvCzVsAvra16d
	 JB/Bp2t80nL03sRHzbKU8vJjVWLa5CUW8yHLzdrGrzHu3wW4QCH+cBQSH87QfHZ+PBi39
	 tljbgPE/Gn/SUTky4uY5JlqkREhNS6gNRkTMXeSDc4FjMgZ1wU3d2+kQ3O3xpIHQ312i3
	 eC7pCpEvILGAPZ3Ie8HOwvm+3XbDeq4hd4nn4T7O9I5WpCa60iVX+zvw4/mHaCHEumA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=lscAILz8;
	arc=none smtp.remote-ip=95.215.58.140
Received: from mta1.migadu.com (out-140.mta1.migadu.com [95.215.58.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0F606A321
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=lscAILz8
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rSxBoFd8yi4ayeN+0LcJZMJqNNHJYlNR0g1yFAosofk=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174574; v=1; x=1794779374;
 b=lscAILz8sSDU7lK8pPBRQsgo6WbolR7x27tev+iy8Mh/GZnWsonyzYtN2pn5ozf75Yvjw/Eo
 Bv+5TdLh3DslfXwevo1VlH78QW7gA2SJacTKCjgkTRoWczSSVjsLDkmqCWqDs+qw4CSXLeDBb94
 aDzefsU/vDHPMYTelL5q7VpUS7NolmwkJ6IDvK/vbUNbuKlNsifXJ2+HqIVf8kkzWsymPESVbtT
 rlKpeW8xgXODxFyxf/qx62M6z8QpiQvQqgmDnED5+A1qzXG9R3BqpDQEAgV9THXLm0UgaN/Ounk
 1whp4aSCZI+zNuFT+UgGHLly5RiF4ghJtq4seEWa+PpSw==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de6896dd19b37bbd;
	Sun, 08 Nov 2026 21:49:33 +0000
X-Mizu-Trace-ID: de6896dd19b37bbd
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v4 0/4] leds: aw2013: Add AW2027 support
Date: Sun, 08 Nov 2026 14:49:11 -0700
Message-Id: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XQwW7CMAwG4FdBOZPJdmhDd+I9EIc0cSFCNCwpX
 SfUdyftpokDFSfrt5Qv1n8XiaPnJD5XdxG598mHNofNeiXsybRHlt7lLAiohAq0NN8EqOYxDDJ
 yay4sXUNK2aIitKXIT6+RGz/M7P6Q88mnLsSf+Zcep+0bsEcJ0lZGuwbJaMDdNaTuYuKZu5A+Q
 jyKye3p30KAYsGibCFs2db5Tq2LBUs9WUgLlpruMjU2zkEBdfnCGn8LiPx1y3V2fy2M4wNBfud
 kbAEAAA==
X-Change-ID: 20260907-aw2013-aw20xx-rename-df233c5921c6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=2493;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=rSxBoFd8yi4ayeN+0LcJZMJqNNHJYlNR0g1yFAosofk=;
 b=B+RflLJkBClvn5XesEBOCHj6bPWkEuzWGRNpZex3RGQd7Y0Zn7LvWvlLiVEe77jR49n5z4Hv9
 TUdEPvQuIM1BW190CCE1m8ev199al2tICtc4lxFaH8dhOxLaIJqqxK9
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Refer to PATCH 2 for a full description of the similarities and
differences between AW2013 and AW2027.

I'm hoping the sashiko reviews about unbalanced regulators that I was 
struggling to fix are covered by 
https://lore.kernel.org/linux-leds/20261021123406.3163547-1-lee@kernel.org/
and I can drop my failed attempts to fix them.
Let me know if I misunderstood.

I'll do my best to address all of Sashiko's comments, but it might take
me some time to circle back, don't bother reviewing until I've done
this.

This PATCH resulted out of discussions pertaining to
sdm660-mainline/linux, a close-to-mainline fork for Qualcomm Snapdragon 660
devices, specifically for the BlackBerry KEY2 Keyboard Backlight,
in the following GitHub PR: https://github.com/sdm660-mainline/linux/pull/218

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v4:
- Drop sashiko fixes covered by https://lore.kernel.org/linux-leds/20261021123406.3163547-1-lee@kernel.org/
- Rename the chip id register value to reflect that it covers more chips
  (https://www.awinic.com/en/driver/AW2027DNR/640)
- Address preliminary review comments from Lee Jones
- Link to v3: https://lore.kernel.org/r/20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org

Changes in v3:
- Drop rename
- Capitalize commit subject
- Extra tweaks to cleanup patches (preventing more unbalanced regulator
  stuff)
- Whitespace fiddling
- Link to v2: https://lore.kernel.org/r/20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org

Changes in v2:
- Reduce renames to internal driver scope, to prevent breaking compat
- Address Sashiko Review Comments
- Split renames into a separate commit to make the actual changes easier
to identify
- Change from RFC to PATCH
- Link to v1: https://lore.kernel.org/r/20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org

---
Paul Sajna (4):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Add AW2027 support
      leds: aw2013: Use dev_err_probe
      leds: aw2013: Move assignment of chip->num_leds

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 177 +++++++++++++++++----
 2 files changed, 146 insertions(+), 37 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

