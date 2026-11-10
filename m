Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334374;
	b=tlTF0QFnekYsgwMlEkhKXZ/Ctq7XpMg0+TPBzNNrHAXvfv3YjXcJSkFCkRslJ+ClcQcL
	 9WWGE5DxCtIofp76huXaaejMhViqpX9gZlvzbHX2cqc9K2C60vMVgoEzp4ukmB3ev1mNQ
	 Ia0NujZbn6/YQymM5y8s5J3TpNDnldMOerH8gvG3KAHerWufrhnhdhlskgZTmLvMV2n3n
	 GMgna6TCMywHimsm6NXBbFUoN9wcR5SxHoscpKmdoebFaFaE9QZD8YCrpUY72WHdq2MPu
	 ICkjJbehM/3cBBghnKnPEAPoWq2Ua1SGjxVl5/S1b5/POQ2xGfUoc2MZDW1970IrD8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
	b=h6m6pFgJFVK79KpnLY9vVEGknPz7UQsxbQvqajoQrFPovZTp7X8KRZeGrtbpQW8+O5WS
	 LUC9K6N2yC9F7yLXDw5M5aRURF8dnhsm1lgmfEp6oZ1X9QDre6d5IegZy+f+OVM1DNnvi
	 Yk5ZvDoQraiKWSl85xSRol5DNXgc+RN8Yz588vSju6BSdOM04gfIob+QybUz6MnZzp54C
	 yDjiDCuPJnvAh/7YF3Fnxo+T597m4K4etkVYNC2mkFXqZJOB/RA/oohqfBbd53s1sM02s
	 Jz6dvcsT+L/8c0OM1XkcbBfnD6h18ezspd8oQ09kwCAhf9IFja0sJuM+kUHkMooa+3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tS5pn8Yi;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF23606A325
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 18:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF23606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tS5pn8Yi
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ec08f71daso17846806d6.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 10:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794334373; x=1794939173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
        b=tS5pn8YiT64Zd9lexBBZTQYgUn0ddUenE2ATM8vMaZ1MPspNzyROAIXQHAXOUwIrac
         5FpzRX+iTDtkR0zhccjnG59AFXZKzj5UpgnP1iJEC7nuuC0xu4MQ+0Bd9LfClbfc7uzf
         IMovpPts3lyTygm2Ue1nDT7LhW2xyvsJBoT9t1XlD7OD9gf8XGs245NMk6TLlfaA5Cmu
         xwKxenpVK3Xr4KOyt6vXpwBuiKn6psxaZ0Y+AZf8RVc611D6x4COmbVGw6l62uSOxQp/
         i9Vg/iUhtOmE+rJlBiF/9c4q7ZO9RzeqsPBF0emRYoDIN83Wcx0wOJAbsg56/bI0AvQ0
         j5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794334373; x=1794939173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68pKDA1p2LdEONMliWN80HdZe29k8kOJYDnRCJeXxak=;
        b=GPEdbC1b285mek1CcG788pVcyU3RlGjOdnTzcCBZVmiV9eq3yduB52BXnkME4Y4dmq
         /uDWaME7vzaoeGYXG1egPyDS1n3E//RHd1xcCdNrYrk30wD2s90HXQJXR6rkrcLPCufw
         +07vTBc6TsMYZWB7Gle/rfuNQa/DlQHc/wKB8WHCv4gk6tsZhHRzlwuObQbjTFXJONyI
         cApTxFnss2imUgwq3Pi5UqDKz9sP1TuN5uS+NYw+aCua4fo978bzu15PpAYvZcDOhpMX
         RskiYQPHCqfgoILOv5780+P6h8DqQ9WdCl2psT2j+ERo3ajnH5X+xe/NyGqr7J04dOt8
         aA2w==
X-Forwarded-Encrypted: i=1; AL+hErE1UFfcbkOBBuRifOBmnl4+Dw6gPSvVzpc/zYBjlJn1Bmpct3u5Z/27zhKTIabbHd/r4/fuA7w47a47@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yl+nR1uv1/BFDlq7JbeNWRajK99c3LA6UcRq9z1JIXGt2DEb1
	oipVNSAgM9mDQ2MeJ/GKyeBcsI16lMwxzRJnbC9Mcw64mWlno+rQz1gT
X-Gm-Gg: AYBFou1Hk2/FnrRxkvyAHqjOO7Gr4yHsWm7g2iLWYeu01sEMCMWIWfq7F9uwnN0xmAo
	JQS53BuI2U4KYans6RoHv2c8+GFBhll61KkWfPPNAPflPgxla7sYicR27ChYUipm/d1lskC4rvj
	bEVu84wuNSpbTwb0g4sFWcIUwgaaeMkFnzGORtBgKm0DTh+cPSkLcdNEW9ycQU8M/etg1Pj/9ef
	qgBFZoDkgXYrGBamZ3usSuAe7TWmnrFKz22+myBhuVPBVowiBmuJXc5CBWgFD18mwZa2KsXPJ1E
	LU6znRQIigbPHK5msYZI2ldu9QD9enG7JZYYeL4FUZsfN+v75oAK2HAccfQlxDKwJ6Lehm2VQky
	bn2jAzOxmRVlZUkHVSDABIJoMxuO4UpCjf55Oac6s9fgqWPri8uUPhrtjqTtoS/9cW4OWseGQiG
	q5A0GCm86IpQw52TmxbNiKmcTnqkjrDq+fZVuLha/XajtKQ/eg5zoCKSidrDeJCvurBdAtE1lAB
	7RCmI7aYoYAVos/QVJv+jRImIfbKDI4lrT/1Ayd43ykpOG4P3i8Vdl24x9k/d58WAPRweITcKtY
	bde8I2/ooU1XKNP3dpupE27H2eOFwcS2uPD96Rg77LheriMVxodEeNcL5wl1jhA6A4VGrK5ZHOi
	30xjz0i+DOlvRcBh28VIW6a2albc2mmTO3zNfE5ClFUCc9MyptCRH55ogQPPpdJvsIZ03mIKSGk
	SMDdPoeXLpLE/56S8nkL5n3br242FOjOivRcNBuUowNmYmVP5mMGuAxrDZmLDYJOObmqru07E9R
	H9ceR6SSLOcfK57euSkos5HKjr3e0xieY6a7yzG3aLJDw==
X-Received: by 2002:a05:6214:238e:b0:91e:9db6:c324 with SMTP id 6a1803df08f44-91f041351bfmr1113006d6.40.1794334372476;
        Tue, 10 Nov 2026 10:12:52 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f017737a3sm4800156d6.8.2026.11.10.10.12.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 10:12:51 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	quic_mohamull@quicinc.com,
	quic_hbandi@quicinc.com,
	quic_anubhavg@quicinc.com,
	Vivek Sahu <vivek.sahu@oss.qualcomm.com>,
	Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] Bluetooth: qca: add QCC2072 support
Date: Tue, 10 Nov 2026 13:12:50 -0500
Message-ID: <20261110181250.47751-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-2-2d100f30e202@oss.qualcomm.com>
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

Tested patches 1-3 on an ASUS Zenbook A16 (UX3607OA, X2 Elite), 7.4-rc1
based. The controller (product 0x20, ROM 0x0101, board ID 0x17) now
loads ornbtfw11.tlv, ornnv11.bin and ornbcscal11.bin instead of falling
back to ROM firmware, and a phone pairs and plays A2DP audio.

With the mainline A16 DT (M.2 E connector, no Bluetooth node), patch 3
creates the BT node, but the card only powers on with Manivannan's
"Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq" [1]
applied too. Without it, hci_qca asks for a "bluetooth" pwrseq target
the connector doesn't provide, W_DISABLE2# stays asserted and reading
the version times out (-110).

One of five boots failed: the rampatch download timed out
("command 0xfc00 tx timeout", "Failed to send TLV segment (-110)") and
the "Retry BT power ON" never completed, leaving BT down until
userspace powered it on. ath12k was bringing up WLAN on the same chip
during the download in every boot, so I suspect contention there.

[1] https://lore.kernel.org/r/20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com

Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
