Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E503F44F4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 09:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960563; cv=none; b=cBYaY5+fctyWMU7m+IYvsLjTHRTpP3ST/aI+wMjNqm3SLGmSV75oxnWv5fiFYg0csCfYtHNtpK4U0efO1/5tUQAGKVN26EwrgwwwyHbQDA6ZM1BXKmvZKKkHjeKvVYw/2QKL90aoMPUbASJolEVIrtY8iaqPxlqNtWJE4zjqgsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960563; c=relaxed/simple;
	bh=gl3B8ifsV7d/4hCmtUg6SYjyv5TXw2+LHTnAr7tsYxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmOqFaq3FUkc0UONG9NJBoz92Yav6qlE1xGRX/qtbF9h1tU456zxElb0pn4V0f7sQFN0Gw6VMPBcoTvloKjnOk49a4Je1kAJ/nlF0D/8HpN8yUqNZGvlBaOL78TLui56dn8eYBxJa/qFUbi4KyGyqikEn3x+zbKvOzXkq2ZVLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=fH9RbSP4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="fH9RbSP4"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso2254836a91.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 02:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1786960561; x=1787565361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0x7REC+Dg2dGvdXaqGEhAI1YKD3GSMLH/CxsoF9aq0=;
        b=fH9RbSP4Gdw987al2P/3KAxjxajBlH9hz1AtMWVKpkXKaJsNTPeMjmoBzA8+NP8HX3
         qPJLA1+8RXU9w2nUf8Oho7iaUw1tFesvGn6kw01F6C+JmSyBpJngvJWYdawA/Qo0jtVa
         nshTch+PtE87T+xrHeBkPFFfcyoeex3VMSfPQmhpjALRA9khFmhTj3WRe53vpegPMd5r
         7l02mJiqDqI0wocuDoAQ+Dd4sNv4KSl9O199PSDNJZafn9BUEliiB4Ji/uy41jlG618y
         81NkS5n7dfRpxvhdv6zCopYnTW/bamfmkwWGfq+GCinTknnfiTfecUZIlAtsY9Fl8MRX
         +2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960561; x=1787565361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0x7REC+Dg2dGvdXaqGEhAI1YKD3GSMLH/CxsoF9aq0=;
        b=Fhk/2nvN5CHelw+etIUc1kImxGe3iNgBKlc3ymMvGniD+WarY6rgrfikTFcqPVzSgA
         2ykKaGf0lp58hgXZT6uo9iM+EM2TNCJahQCdCLgdkH0T3pyw+VIY4oDJMTMEDyDw3XUL
         EBzGpL8e89RX3u8sZtCKBlKeb/yLaLsUks1pReiVi3mLlJ5jLomWQTr0QXdh1T73hVv/
         WSV0DqQ3yr6OoXCwRcCLsiHJV6wi177yoll7a1VLqre7mykNmIcG/UapURuigbUabfOL
         rXo+Lo7wKIzRci9JzGufk2Zr0f/3YgkkzJQQjRrZGpZALnJJ9kESPVi5N25YEycgMi7d
         WN/w==
X-Forwarded-Encrypted: i=1; AHgh+Rrg5QP7oLr6aAVEFPQIT+LSRG+SzIYY5R06fbJn+puIUwUL5FKXUchZ8LtaX6bf+hNV6d2pYmUOY/oD@vger.kernel.org
X-Gm-Message-State: AOJu0YxU1xTxiYXprwHrRZGXLEPIsP4FuZ8qzBa8LP76w0hIIYNHKwjt
	y3wWCajZeiMkny4+QrcT19XXFxTWWZ47Oth6Oqsvcmu2gSP8T8MYfBaoToz5lcdORg==
X-Gm-Gg: AR+sD10TcI70tuOdpcUxJxlvKkYHL43dN5ukRKxDNqdcU6Decty+OCzyk5J3x6MVLsP
	7XV1IoqZtyItYSqPqsrnBX5EsCTymJfKktWtciIFj7nz2OW+wDXjDnWzQo3pa122xFoEGDfL1ez
	sKVCS2Gop0GcBOQJ3Nrvp1A/uVGi4ftO11WAtsiw3rtxF1OIb/IYDMKu+PSTe8G49AiyHSRHjA+
	uQorL6MQeVm3k23Yn0vVdyi7QwxcZ1vWEehLC1zwkU+R2RnlJ01Ym9Wjz34bLjDkTXrZrA0jXrv
	9gnbO+lH5D+mWMmd/pm4xGCNLpEgMEtjaPg+3ot5UB4MGAr9b3gafNVwfJ8FeFFag24k9ku8JsZ
	RQGM9bPhTllalRPpvc2YARm9fbFnDR+qEdIsqsV9eyfUfAMkkFMLJ8hQsokIn3T9SLe/TjUVMIk
	BQQtL1c33LyWOcp0tXuJ0q7w2UAu3c+r60/H6le8+UVHaIwJiA7hkPjLnXzMP963459aUEk/3rG
	NpATgaZP3YuHu8LNR14cS2zo6dyn8YtknQdusyd0+n3OmKP2ntaTkIxQ+2Cjre+2w==
X-Received: by 2002:a17:90b:3c4a:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3933b6f15dbmr24036091a91.3.1786960560679;
        Mon, 17 Aug 2026 02:56:00 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b4383sm1692047a91.15.2026.08.17.02.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:56:00 -0700 (PDT)
From: Kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: Kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH 0/2] Add support for the Synaptics BCM4384 Bluetooth controller.
Date: Mon, 17 Aug 2026 17:55:48 +0800
Message-ID: <20260817095550.648774-1-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch adds the BCM4384 Device Tree compatible string.
The second patch adds the controller support to the Broadcom
Bluetooth driver

Kaihsin Chung (2):
  dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.43.0

