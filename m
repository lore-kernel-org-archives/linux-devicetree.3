Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685911;
	b=xYaRO00OPcHRBiHN0dI9zPUpq2v/jIwvxCt3iWFFwbrBE89RCImbAwJj5SXi/vT60MJ3
	 sx0kf6raOfgB7q9abx2x5k+wHtEnhAloEtDb3c4vv2WdgRTUSOQKOdqrQGcsZBSp6ox4l
	 dVxZBpKlLjXd346tgE7z5gYIuj7LrBAoFgo14Y3N/MWedJtxUTmkqCTPk8TC8DTY78fLl
	 +ev9cmL7BPb1mib6poe108ndfRp1cGKgeVbt+HJ/qRCLpmFUcv8+/dmPLEvvjo2WuezLI
	 MDpRFhW7Qub+hHYG2fUOkABkFd/xD1pWHVCBtLHgvYnMFAiAnH5nCX1EBtJ9GHizJZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
	b=SdMWB4CwXf0sE5xnVBbYPwUlNv1p6CLRhqUAQLluAOzFPNhbIOwokwyxIAWrsW2z2sB1
	 LBf8WpY8wJTgZ9pzT3SVr9k8XPDjzGTvGbq3lu69GcyhQwMmC9KxPO0/+SY3Ym+seKORq
	 LPy/dT36KtnOwUdghHgUhtBXD3X5rrLeJZrvzIjYIPXZMA2Qhw5HMv0Ppjq5FKZtI94qo
	 D8AltkzaJfZXOPOb/KeeZrG0kqK07qGtNBXeHknC9exD1cVcWtTtTeP4Lgh8kvCdHtLf7
	 +4ehpykzafHqpgiZhdRxgXVApCh8Fd6Wlq7RZgaUq8xG2dM4ws2GMz20/Q5R1Z+hq2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWGzwxQz;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B67606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38B67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWGzwxQz
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so2428639eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685910; x=1796290710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
        b=aWGzwxQz9Wi0C+RrshIBxa38+3yLzysGAYB2LZxc19Q4H+rfA+20UKVsTMEMSUeidm
         5LJ5ndEWuh4XOccbQ0BNHbHh5PQe18HJds/1uubckXyXDn2iRlbQ7vgdAxy3TU+Bjz+c
         gpvTmloYsu2CNrJTDM7/vL+L64fqBICziPt7XYWhIVcwICsI2IV3ffjPN7KD0PyQAwKK
         11s3wD4mzkavEvyBmzyrXKdzSuMRNz2ZR42Hn98+zGDHVB4yk7Y9Fu7yueqT8qV/xWVF
         U279c810mOPFG+UPpjNkIB4e0XEE2i50DFqmlnd/MF0qfYQl7O+8c+vnsFkzLEmo3Zwr
         LIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685910; x=1796290710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
        b=yk0/iaK8U9oSy3wys+t7Zs+FQsXSA/qy4yFJ0BczBPlchNQw7fosolo6e1xERueVbf
         dBC0xxNJJqkhlbQDt8qzeILQMeELafE2CXvslC4m5rJFYeamfmfdyyjWNWMIhCJ+QUW3
         b/cntWEB25MJbWuy1c+UQgTkmIxE3C+Rd+5yqFwo1MnsL6lQpKzUa89WbVEW1P1Lkx3F
         B5Y46sVGnrtWRypPs5CCXkm/IeX5exAHxW8RMgmNF77aaltDHVn0+BZiZPOcTjOIGHel
         zecnn91MNfmLQwoWcD1rYpCpmcg7TUEY83tmMttJPc8zt0npgnzKkcZZBMsKnwEUTX0v
         7W7g==
X-Forwarded-Encrypted: i=1; AL+hErGf2boFF6bDVThIWt/J+WZZRZDvgoOwrOqGsJ6efmeisg6u4L3AahTQN/Q4lQoixJvZyoZ8Q9xL/pCf@vger.kernel.org
X-Gm-Message-State: APuU4Z/Jp+nItrAbGj3UxLFo98yO3ZcrhlMmeekwK9zOjLQsZ7r7LNiL
	bmY1jwniLf7pq/DxZgd/rqD1RK5OMfGbmbGkREESWg27gOHMTbYB4MEB
X-Gm-Gg: AZFdTZe8XW3lz3WntdhrEfL8bKMnoXlwbStbyqRMhIhRz9SjgVEN2yEP095ryG12ToW
	PFZO1CU9imLdqBfzfPjn1kkexmu9umy309frYy0XoWQ35IMEybq7JFe/HNCPF0M+mxoNcQ02LU/
	Is+OUhR2CAzdhn8LE7s89r3FCql4xPKW3lnaWyUzSTed/2IYctKbmczi0C94Sh+i++ueX16Jan1
	4hfT1rE7mvUkoyYdr7LXy6m5q8CGL9qmhhRs394U1QNAF0D9cPBMfepPExM8i3KEOz919os3oed
	/0N1N9ZXcWzrXzuD5ut0hQLQqp2PMw0IfCoxXvK1xKpHfQ58qp7DH/yqIqsbzIf4yh+dToVyXeT
	ws2KRQ52nkPW9rsYsGOKbADQkXy2Q4KbnUPBuGD+kB6pP2vr9up3evLd24namurxSLvM4FdHEUu
	vuJZVyY7Z4wbzxaC8vTriicVEMBhhDHb7Ekkd3l9u9giL4iYLhgMhM73jPL0mSEKul34cXvcJ1S
	7LaH4fdgip7MzUVznFj78dwP5TlCTs5vLPVSwybG3mctpbP/QMhBgplATMNB6q+D6MNy8OXbPga
	tTqMij/largbyYx1Rrv01ugqpPW0to75nrOS0M+rESwBczmgvRUn
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr13514697eec.11.1795685910273;
        Thu, 26 Nov 2026 01:38:30 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:29 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Thu, 26 Nov 2026 15:08:17 +0530
Message-ID: <20261126093819.76480-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On boards where the TUSB1046 HPD_IN pin has no usable HPD signal,
configure the device over I2C to treat HPD_IN as asserted while
DisplayPort Alt Mode is active. Describe this with no-hpd.

Changes in v2:
- Use the existing no-hpd property instead of ti,hpd-in-override,
  as suggested by Rob Herring.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: Document no-hpd
  usb: typec: mux: tusb1046: Support no-hpd

 .../devicetree/bindings/usb/ti,tusb1046.yaml        |  7 +++++++
 drivers/usb/typec/mux/tusb1046.c                    | 13 +++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.50.1 (Apple Git-155)

