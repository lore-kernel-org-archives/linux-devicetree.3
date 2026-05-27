Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBEA3E3D8D
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872951; cv=none; b=coTfk34FVAq6EI2M8H+p4dQgIoM1RIm5CSkF5/opqdo27nGM+7iBrvW2/KNDEkTE6rcQZaN2G7DlzresfdeFZ3C5PKkuPmLXsYqbS71nl9QDhUSG9GnqG83mfMlGFiSeBIF2xUQ3W9HGi47clARgPwu01UhyDp84dvcEiZvAbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872951; c=relaxed/simple;
	bh=xYy1/j4PQat72RkJ2qs58ZdiYDbBTsDsaIkP/Qz8WmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fr5RFUFhN2WziFUerP3tlzOeYOJg1UJR2sl8vw/YyMcqDWC8oEiXmChha6o+k3IcXRWN9dPQC32cIfucEFuXOrrEZjGHHpW/ENE5Pm6DoL+LgI/CIUdg3xPw4Ie8bD1SGo56PB+teuROuDo2KB7dGpDgjuqrm9RT2vNY0ramAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=I/J5WfVR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="I/J5WfVR"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36a8ee1e28cso3850250a91.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1779872950; x=1780477750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzP4nn3r/gwn1is3A2tYi+9xfNYB+0iqmEG+7KOfkLY=;
        b=I/J5WfVRfzjhf5qjwyUsAHvbOe3VTsw/jzfUkEHs2iYR6+JsaK5DIeKteNMKUQQQyQ
         MRu1uSc/PsnxCSMz5HlgcpjlVdRRroJDuEbTF2rbbVtDoM5P8bbkc9F7Ir/TGzmhX862
         CQeNu+p1UBX/hvI6kg9Hy77yhz8dzm1w/bptybDywsv5ghbteQEeBsyKyD5j+oGYzXrP
         bUXsxeaTz6AZiZRofWWzthR5QnRsYM+NCJ42zkd0D1Kgok0exEsF7KwC6mjGal+lZ0sw
         MJI3q7oSRAfdx+MowNxL58MuG0zQDGc7P7FNszz/NOR2qqmuGD+LGCqmdU01W74vz0yc
         uR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872950; x=1780477750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YzP4nn3r/gwn1is3A2tYi+9xfNYB+0iqmEG+7KOfkLY=;
        b=lzzrgQj9huOig1M5ieurfFwj22V/iZtUIHkFzrQgS0BjLFKC1T/LdhDBIciS7xWWnq
         4++dmlDWwlGCzm9ccO0PJqSoO50O4OeA8v/0xBa45+H6r1nMRID0WTip9SIVo0QE14iR
         pXZXtcXDGyeY+Wq0u3HkniLONZ0v3IYY1nAj7QIffmlKN6r564ShvIkQ4tKNKbdg62IE
         EQz6wCefQ98yvq57MyrBXd3MG4v/bnaUkjKlhATlyI0sDzaLg9GRG82ADcPHjPzFvjEq
         g6IPqaamhyMd3RAeO4kPzVhpajd267ZhQTWliM1py2CC8ed4c9YwssNevXjzd5COdoGS
         Tg3A==
X-Forwarded-Encrypted: i=1; AFNElJ8IAP1DDqvwVvThifmIZq/o2AfYqRtr0VUOVnrPZwR4XgiGppq/fKbTDA0SI6nP9V/nJAXfAl+x6C1T@vger.kernel.org
X-Gm-Message-State: AOJu0YzS4S78M7a1GYNQUNTd51sWHJTdWw6rGUDQ5vTgG8tDlUaArmJY
	Axf48Sf9VWGA80ew/6+DcsWv+VppYsx+HpNIdIFlm9sRrXg225R754mRxDDiWE5ScA==
X-Gm-Gg: Acq92OE7PL+ybIjHZ2Trqddh9kfFoXZToPrZ1xyedwxz7lxRnG8XjhQlT7LbCB/4HDu
	/pBVRytNRSfrqz9oOKfXcGnmvSac1tJ2smuoQ2kJPZekCVeZANnCYwfNYoRkEx+gVoO61zmqvMs
	vU6bHOvQtiRFSi/sARrHNs0vY27UAzGveHwocbu5AWvlL5gcw9cp8MOtSYFqsGAmo4cpuTZAY3k
	vYtLoe4AQ677J/pOL4HIhiGiJ1p7hXKutr2dsYuclssoHlQ67RnXlqgBR8CC5N2Ue0CM3JZXliH
	p0CTQrA32pdYmezsLwDHoLMSTbADt4CkyxrfIbsJFN8JoMvcH22+kZdNL21ELQBi1qAf6bXT5Pz
	HtJwxWT3VK6D0CzspKvABl3H2KduOF8kixeHi5gz0cu5XkwuenXfeTc3PqkKYfD/DtISzI+M1G3
	an+y2MIFFqY5GCNcVZ14lWBTdtm1Lc9bpnY6kn+OoxUrmUr48L7ofS7DbwCMB8FV8FlEqKznPc3
	Ld0+Qcrce/t7AAYkr8P/z7+jW1iDgS7CL5qAL0=
X-Received: by 2002:a17:903:1247:b0:2bd:c5f8:504f with SMTP id d9443c01a7336-2beb0702144mr236239085ad.40.1779872949672;
        Wed, 27 May 2026 02:09:09 -0700 (PDT)
Received: from TPE-build-server-2.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bed2061c59sm92430365ad.2.2026.05.27.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:09:09 -0700 (PDT)
From: kaihsin Chung <kaihsin.chung@synaptics.corp-partner.google.com>
X-Google-Original-From: kaihsin Chung <kaihsin.chung@synaptics.com>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Kaihsin Chung <kaihsin.chung@synaptics.com>
Subject: [PATCH v7 0/2] Add Synaptics BCM4384 Bluetooth support
Date: Wed, 27 May 2026 17:08:47 +0800
Message-ID: <20260527090849.3647601-1-kaihsin.chung@synaptics.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408083217.1915419-1-kaihsin.chung@synaptics.com>
References: <20260408083217.1915419-1-kaihsin.chung@synaptics.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaihsin Chung <kaihsin.chung@synaptics.com>

This series adds support for the Synaptics BCM4384
Bluetooth controller.

Patch 1 adds the DT compatible string.
Patch 2 adds Bluetooth driver support.

kaihsin Chung (2):
  dt-bindings: net: bluetooth: Add brcm,bcm4383-bt
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/broadcom-bluetooth.yaml         | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.43.0

