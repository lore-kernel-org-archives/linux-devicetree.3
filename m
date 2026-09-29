Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550474C7523
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674195; cv=none; b=Mtgxn1LbA6tEmYwX1vGiet98GTMTOkXuSlVVz/jQrseSBcFiALCbOYsjD4C5sfXbhuaCKvyHNqsF/bnNVDaUjaFFGu9iR/YPRXFtTglFmUVwUPwjBsp58m8wWKh2qClvATY/TVuQbGnI5gwxHdZWJGRj74QUhY4pD2fEaFjjpmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674195; c=relaxed/simple;
	bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ac+a5eEK5iDJl/ZNvx1S0tzwYP332JmGyEfa47LUY02IAhO0CQomU9Cl0auflssSAbNbZFQPsIynkHqNRVjP5OxlMKQO2lXxmLoXj6B/JHTr9ROgk38Q5Ex8214OM1qt3jGt5gdPZ/AW7hCrw0iPO5KEvp69jZKLAkxD6YWriNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp9x3kaG; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp9x3kaG"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so3887611e87.1
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674192; x=1791278992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
        b=Rp9x3kaGFPezog0Un7i8g0r2EtmziA+deW1YfGgSzPI9wzs8kNyF/PHzAnE3AuV9kp
         /ZXl8MQvKZxSy+3BO4cG8o361j2islCRP+ljmHnBt0qaWVLHfe62hHdmnSSs5bIncxo4
         R7jOBKQ18fgNu4+M+UnyBCPkuo8diEMsp2IgVoWldwtt5QsOesSE+D68aJSz2kPaiS1Y
         aOseOpBUNqmVohomL9ILgAk4CqcoYw76HO2eL3jiQ0IruWZOa6LX6p2PyI4STZyKtsQY
         StuJZ/eKUK5EC3jKRfqLQEZA07XcP41rwg7BtjV7SGiEyO23nKnkH9634E7jAZP5Wfva
         bP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674192; x=1791278992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yR4c/96D5m2oYV+sIt1zs2VIhOzRkf7um58xAidzs6Q=;
        b=Dyi/hIQwrH6Nv3bQG7xUnTTNlMejfExKxslQjej7Kl18qZWCcnu5SXdWQSU2Sv7B9o
         sWL7zFBPnzplJtN9+FOrB2WSv5fGPlI3GTj1PKAY2uGgTSOlgI6cwe3ejMVG9QVcQjHw
         Ic0GF8B7yhv3oI6ErvuL3LZ/acdLWAH8QlZEoZnVdYzOa5Vy91hANSVhcIGJbqUm0a71
         pTJh1/sx1nYO9hoMGIhv/bXGNd+GNeEse/kQasErLPPTEOmry7PU1RGRj9miOIfQ/l4G
         NAlxuaukLtDD22u2UYlvBI/eILlOWDOG24Wbdh8Qid5uezkWqpT/epIwec510urZ7DH8
         mWKw==
X-Forwarded-Encrypted: i=1; AKwUvBzNucpZMXFyw5VNPOaBKlQNVxIxZP/D6Jt7gh//9IJKq6PBaMIKfvqXoZqELbRGVSbV39STHrbYqYE4@vger.kernel.org
X-Gm-Message-State: AFq9FYJDmevvA8DuQWV3XuIABzBx2RmO34oVME5ixcYupxhlXqEdcq7C
	EiJrfZGRLpjs4bxjZKtfC+mslo+5/PvWU4KpnF5g42I+unW5239KVr7w
X-Gm-Gg: AYBFou0UwqDN7ZApXD5SewYT7ndFiqg+hjlqOcmS2VT1kWrcMAGMrEFqvhhos2qWkZx
	ec7DP2WIuGhXcCP1ls8yv6WCfway+7Zxeze86+X5ABa36srPlFRIhwCdkMxToLcBjD3D962Iwnh
	Y/UyAS7wXU565en/KKY/fZ6j4Oz4jGGcHJQdWe6dyjquRAE3k4CWgpUPDbGaCqboeYCClCR9Cli
	Nh3rOoyhITKZFDOjtQ5cTMX6WJJCvJhA/TbjeRVu3uTiLt4wiURfrfgWGyyme5h2BKHhRx/PHZM
	cZuwemPybORXn/jQuPB0K61bqhF90xmBctMXLjGk6iqvkeGyMwF9OLIe7BpkHqBt9VOtgpiKrtT
	xC5QnCoj9lffxHdxYhMWUI7FADficuUd3IGoqHXNSR1MaRlsok+8E92RV1ZU1Q/0XP567bvCR+D
	ohRNxjyxJebe2e0M/92xmtUJnDBrNvnMVWoe/Jih5M7GFBY0B7yOLrYgM4h2tfNIhtcHNfdZI+G
	p1SBHa7MHQ=
X-Received: by 2002:a05:6512:686:b0:5b6:1a7c:59cf with SMTP id 2adb3069b0e04-5b8df0c6fb4mr5787163e87.41.1790674192165;
        Tue, 29 Sep 2026 02:29:52 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb906esm1219348e87.51.2026.09.29.02.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:29:51 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: rillian.grant@gmail.com
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH v2 0/4] leds: flash: LM3643 dual LED flash driver
Date: Tue, 29 Sep 2026 12:29:18 +0300
Message-ID: <20260929092917.1782754-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rillian,

On Mon, Sep 28, 2026 at 10:42:33AM +0100, Rillian Grant wrote:
> This series adds a flash LED driver for the Texas Instruments
> LM3643. I wrote it to support the Windows Hello NIR illuminator on my
> ThinkPad X9-15 Gen 1, which has a single LED connected to both current
> sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
> X1 Carbon Gen 14.

Thanks for folding my patches in. I retested v2 on the X1 Carbon Gen 14
(7.2.5): the DMI description is picked up, max_brightness is 71 and
writes above it are clamped, max_flash_brightness is 600000, torch off
puts the chip back in standby (ENABLE reads 0x00), and a flash strobe
times out and reports flash-timeout-exceeded as expected.

About the Sashiko comment on 2/4: led_classdev_register_ext() reads
max-brightness from the fwnode before it creates the class device, so
the window only exists when the firmware node has a max-brightness
larger than what led-max-microamp allows. The DMI nodes don't set it.
If you want to close it anyway, clamping the code in
lm3643_torch_set_brightness() against the limit derived from
led-max-microamp would make it independent of max_brightness.

For 3/4, dev_dbg() is fine with me.

Ruslan
