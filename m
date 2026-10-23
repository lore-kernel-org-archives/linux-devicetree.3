Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799679;
	b=imPvy+u93m432ZZb6iRcf2Ztfny2C+2eUdYc8N7gwSW0+U9Cqg4uRt+3NBeGgDtNV+jL
	 BHMcSV1H9xofQ0jMGWg9NeKT3JYmPgfvMaH0Js6rugt0Imk554Y9sG6qFm/LcgtfFPBQy
	 rxFyKcEbLLKGxUWJM9lLvgx5Vimp/dfkOc078ZZs1vpsMVpOtheWmN+OJms4x0itplB4o
	 amycKvIZYKe9Y+0W8UUE/pR2wd3SXR7Q8XhAu+VM22+szU5oEeMYJ1LsIhd7gJJd87y2L
	 2RUhJmmjqCicEyw5GgQL3IBm6EOmaMh8qSEpDVXu3DRul6xtZBEwBMetNCYyeFqMStw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
	b=i8YjdPS0y4aVssrLZgMulUQFfO0duunfrid7AYLLboBGx5mdl29A5tpkrsZAM40MCLhn
	 BfmlJ6YWAVWrkT+I9Yfj5JRtcNZFdGqCVF4yyBngkj+/l0oRvP6454iU+cE6ETeogAEYK
	 EjNXsrunw1KyoJyEKMwxZzrTG7MgmxjfJSSfxmi+qMUwV8VASbVghXZrwvIf1+54gObKr
	 dNPGjozF8FuiBbE2wJ9XTSF/xbhbjuCVbJf7siLQINE2TOIeKAMK3gwULApJIgZPZSN9P
	 766gp4T/o6MR6wDGZbwwZ8ZGSvFrN1hESsJ7RobwdonTNGkOg9YrNimqL+I5aaomVrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="eipMIJF/";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B90606A321
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 23:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B90606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eipMIJF/
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so1622324eec.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 16:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792799678; x=1793404478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=eipMIJF/+KiVQoBZN+1mDNs4jpn5iVKTQzVaOmEwNVdkZv//EFYFN84Vr/Rp+XGnqO
         VAlB9tdAUPkCE2Z2mD67sGfMsr0V0D5DI6PwjFTZ4LZJ68ZOQ4ThjufDPggiftsXLg90
         Lb55duCnTzex3vdlmqcdestl/quKPw25iGd0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799678; x=1793404478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WyWU9QEly82UAo6bEoWPREDKCLnVhT5ADM2LPpXyEAo=;
        b=HPA5Eq+cMrYtotf505ZcR2b1x8F5vxRAvtSRTmLjsmuK4Zp2gedlfsuc52U+iHIy3v
         cLIRgrAR5BLSBsmgqOO/EIIPRh+nVF7Unce3BnE/jWr0RG1CWxtkEqviyr65v0N9Y8BR
         7RTKN4VG8gL8/bzkVsPJVUNzLFvKPwYxPzLOQvlNUCoTJ0JO/Bpn8uIlnI0HmjvWOJgl
         eTYAviSvFCMXVP2DJLNwZKJRKxV2dY+p7IUn+BVIAi22RvXO0b09o2nta0hhm9wUH/M8
         FHpT2lbgosERZ6G9B6vmPp4vjifv81e13XjqWxI6mZLFWnMw68N/YRzrFxrNrClbiD6l
         zxjw==
X-Forwarded-Encrypted: i=1; AKwUvBzXJjmgoMdDaSyZ6ptZbcDz8v/JO8xqSWyVnz7+q8Gj/MPMgcEZabUSdVtlL++OQH6aMf90JKz6UKQb@vger.kernel.org
X-Gm-Message-State: AFq9FYLCnnDNLTf8AcgEUKMo1ogltpjYiFKTjvATr2Y4xuCygvMqfYv9
	H9liZVSz7Pg+sqYaQCCA499DH0o5ePtdRbfTY9ycDBRPfuIfYl1pAClFwm7/ccae7A==
X-Gm-Gg: AYBFou0itnJZ9BDxNn6Q3e41pjJDIj8H0pvRD+pOOW9vthf/y31DnKykwtk4xZi2wDZ
	l7j2pgnZKsHngRlNQ5gC01Pc0Qmgyu+M9VS84tTOq5coMH/eg6HyR0b5eVFzlO5m1mlnAtVXutd
	Pb99FGqrvU9n+pRagZVb836GDYRp+2EhLHTIJgm5gU3QEpf3iEhfOAnYds8NWyJqcHfjhiHknkD
	0q1ANRT9P1pR2e8zJVSch39xBfJq2Tc1BGecWU4L7xwvDR7loKD/dVivP4dbHotlqd0duqOD9N3
	kAZDiJ27PG1GcspQzgWrraZPq0f5KJVPwO+AVLZ8P06RFsXgEgmZ00YYC2M07arIsOF3yE8p7Sn
	VWcGa/ETOTyRpcOV7PyF5+uZGHECij5MtbIIvtwOsx7OQirZQi9/9ypfrl9EUqvf6HnZb4WOFIf
	zM7/Tkzu98OMh16lXAZzpYQOFmqBUEYagn0AOKYjKAsX/QFdsfQRjU4x2p2IlTBgOhGPwH0HDzm
	mWbBK4x234H7rLgMBtBjrVPe0+dypJ/ZEQs4+Voa3asWSRZ3xnLZ/fl/ZfIyf7/RRVV+PpdDyZG
	5z3zOl4u7Oh5nvC4bBBKGB8EQawA/AnmCkm/cUd5
X-Received: by 2002:a05:7301:1694:b0:366:eda6:8dae with SMTP id 5a478bee46e88-369e84b9a3amr1401168eec.18.1792799677639;
        Fri, 23 Oct 2026 16:54:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f8c2:b3aa:f878:2faa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm1460608eec.18.2026.10.23.16.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:54:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>,
	Subhash Jadavani <sjadavani@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Lucas Wei <lucaswei@google.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
Date: Fri, 23 Oct 2026 16:52:17 -0700
Message-ID: <20261023235408.3063350-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The goal of this series is to land support for the goog-mba (MailBox
Array) IP block that's present in Pixel 10 phones.

As can be seen in the device-tree bindings for the goog-mba IP block,
the mailbox IP block in Pixel 10 phones is fairly sophisticated.
Notably:
* It has hardware features that support queuing, meaning that more
  than one mailbox message can be pending at a time.
* The "channels" in a given mailbox array aren't homogeneous. Each
  "channel" in the mailbox array can have a different amount of memory
  for messages. Really, the "channels" in a mailbox are considered to
  be full single-channel mailboxes and a grouping of mailboxes is
  considered a "mailbox array" (hence the IP block being named "mba")

In order to cleanly support `goog-mba`, improvements are made to the
mailbox core to allow `#mbox-cells = <0>` without a custom xlate and
to allow mailbox drivers that have more than one sub-node (`fwnode`).
For TX queue mode, as suggested in v1 review, `goog-mba` exposes each
hardware queue slot as a virtual mailbox channel rather than adding
queueing support to the mailbox core.

This is a fairly big rewrite from the downstream MBA driver shipping
on Pixel 10 phones, which jumped through some awkward hoops because of
the way it got queuing to work. It has been tested on a Pixel 10 Pro
XL (Mustang) together with work-in-progress Laguna CPM, pinctrl, PCIe,
and RTC drivers.

Link to previous versions:
v1: https://lore.kernel.org/r/20260714222338.2965707-1-dianders@chromium.org/

Changes in v2:
- Rename binding file to google,lga-mailbox-array.yaml.
- Drop generic "google,mailbox-array" fallback compatible.
- Add "google,tx-payload-words" property for queue-mode TX message size.
- Remove unused labels in DT example.
- Drop "dt-bindings: mailbox: Don't require #mbox-cells to be 1"
  (handled by deleting old mailbox.txt and updating dt-schema).
- Drop "mailbox: Simplify circular queue math with mod arithmetic" and
  "mailbox: Add support for mailbox controllers that can queue".
- Expose a mailbox channel per TX queue slot instead of adding
  `has_queue` to the mailbox core.
- For queue mode, read `google,tx-payload-words` from DT instead of
  detecting TX payload size on the first transfer.
- Match "google,lga-mailbox-array" instead of "google,mailbox-array".
- Move MAINTAINERS entries under GOOGLE TENSOR SoC SUPPORT.
- Use guard(spinlock_irqsave) and scoped_guard(spinlock).

Douglas Anderson (4):
  mailbox: Allow #mbox-cells = <0> without specifying a custom xlate
  mailbox: Find a matching mailbox by fwnode rather than device
  dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings
  mailbox: goog-mba: Introduce the goog-mba mailbox driver

 .../mailbox/google,lga-mailbox-array.yaml     | 226 +++++++
 MAINTAINERS                                   |   3 +
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/goog-mba-priv.h               | 130 ++++
 drivers/mailbox/goog-mba-trace.h              | 183 ++++++
 drivers/mailbox/goog-mba.c                    | 621 ++++++++++++++++++
 drivers/mailbox/mailbox.c                     |  16 +-
 include/linux/mailbox/goog-mba-message.h      |  38 ++
 include/linux/mailbox_controller.h            |   4 +
 10 files changed, 1229 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mailbox/google,lga-mailbox-array.yaml
 create mode 100644 drivers/mailbox/goog-mba-priv.h
 create mode 100644 drivers/mailbox/goog-mba-trace.h
 create mode 100644 drivers/mailbox/goog-mba.c
 create mode 100644 include/linux/mailbox/goog-mba-message.h

-- 
2.56.0.257.gf7497c7d27-goog

