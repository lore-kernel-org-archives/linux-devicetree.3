Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542193;
	b=dLpgCBeUgDJ+1Q2tTkPRVy5+hE80r20dJ1cAIfcl7xNdLDxcFJJeTxndop1SqawVOySV
	 TRaElZAb1FHcg8SkNR/2uVn2za2Z4+qiHApByCvTgmsljwlT2K0R5G5cSR4hfPrGonAQ5
	 OTbfbS9gaP+5xqxe+b8hbpTMmZASlbguos4tlqH8OWpo1l4WQasT8WztskWpG2g3omHGm
	 J3F5+aYoH0GLC9IJMrg8nGxFR+LiOdOpE85RCbkoHcZ0Js2heDmCTrvafn4f6EuhTOIaT
	 1vib3hdzA5D+PLEY8TVCU4qsgwTkZVL4na4gRtWm+v4kcbP16CrnIHbWGW9aPonAy0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542193;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=sCc0kofNvkDa3L6oT1taaFE+OREB6QTLHsXJrjG7pts=;
	b=KdI8P01sotWvjD90NbGkS1qzocov4eu+THUFhDt/h88JCnjZ4ALamNxP5kspwlSVxzIe
	 OsoSaANEDP/UbuuAy2Ggj5whO+KlpX5c8Fua7KbVl0PbmwZO/7Jas9zBt4FPszztQt2bE
	 Z5SpuQ/Twg9HVDizlImwTpk2ougMen46Xa1EgejCTEFzU12BrpIdhtFVjeKoWyvQAESIW
	 ehXfOovZtg7ywskUNXO0ld06lBAPtOvPeiEBCaL2eJXna/JkOAsoup1X9VfTeMOW8FPBy
	 rmSldYyqZ6nseoobYxSx3ELhDny0/7IiXEjG7mF7PHmu5BcKzGwni7NjAVbm/G+Pnkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVy7FqQD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B09606A335;
	Tue, 24 Nov 2026 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVy7FqQD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795542192;
	b=vB7DpqTiwU7aLdEhT6qrpEd30G9lOu3bviaAmBd4l9NFNe8EIbCJOPN+JOWB0GbpvGUs
	 59n2eRf+BJ/fgx70HAR0+qgVnQNfGB5nnVnW2O5YKxTEatc2RwjnxIfI+D6Wc3VrXVE0l
	 Om2Yiiu21ka/PzXplGeDD1+xaNnsjlLO/rSG5gJ1U1/J/KjB9lX97tTT97EqEeL6OUD52
	 bOVtWaWF8hBzReNL4/oKTVW8W3OfI6hPSBPoKkb/vpo03dBG0OXe4PedLIa7rT01IGIjZ
	 m5iSaALTmkTGmLtoh9b4IoK/tBoXQa/cRyPna1XyanvlWAW/IjuZTX1+WBYwoMrg/9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795542192;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=sCc0kofNvkDa3L6oT1taaFE+OREB6QTLHsXJrjG7pts=;
	b=misdtEuTjgp41MVdSRijqaT9dZazi+dz7VeE0bYpvyjGN4aU0hPbQQNXNfdQ9nfs5kKc
	 rT2tBrfcKCjKEy7IE/Lj/Q9GIMqf0rIJWDL49BuwJrW3k2O+PIqf1j/CKhRyiihAEiI2B
	 9DplKUv3Zlk/szR5f/JdrOHLJ4NHVaBe3lxwv2J8hjRm//eT/Kyp0MXm0E5tnhZ6PwwjZ
	 sTg7JCdCDYpMr7vkD7sS+NQYYWEPFJ51eDO0WAbsgS9nY2pYkpKZWXhONnbJ3tUoDcQdN
	 g2nqIUGPHVp7x47Gf0gFdCc9/51Rnk690uEAyQgRGrxIzk9DUmw6kEx6RXLdtvZhbSw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F5DD1F000C6;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542192;
	bh=sCc0kofNvkDa3L6oT1taaFE+OREB6QTLHsXJrjG7pts=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PVy7FqQDlTr4xSNME9EwWR+FxkDm0KhHUAsrjE6TZICUij3sQ3WMLgknX+Jk2/kLa
	 0ko7a6jLBq8Kq3RRNZpbqhVtLSnbOLBeMPP/pMlg7uVFr970WU6EttsIQZ0jsFolKN
	 idI6lP5mJ8fhjT870yt0ClLCswsgUus/A+XZwN009V8dpJ4Mnx54GPpdxP3AUxR+98
	 RiK0sZy7YjdLqiWMxqGuczdb+c2OUp7EGqgkgcGToOul0jRS4M7KWLH+c0K1NDE0iC
	 1PYZpssr1QKZSw6DadhAhpFYOXLSro2uV+Yqy79E51ieeUQdhsKluDXB4inW5XXT/P
	 pGwd6z2+fo8dQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B7F424CB18;
	Tue, 24 Nov 2026 17:43:00 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Subject: [PATCH 0/4] Add FPC1540 fingerprint sensor support through QSEE
Date: Tue, 24 Nov 2026 18:42:59 +0100
Message-Id: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3bSCZENTEwPdktRU3WQLyyRjUyPzVHOjRCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgABVT8WbwAAAA==
X-Change-ID: 20261124-fpc1540-tee-c89b3527e72a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795542180; l=1509;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=xOzpTrKsIgO9EFs8IZauDfSC/Ubdmarcofr0n2Gl3BM=;
 b=AczOttScH5/OAPV3Cnqt7WmEyirdiwHPYuF3W5zL6ePdL/mVcDkBYicWVRtGm1LjC23JxPGtf
 A5Qh83g54DEDFjZPZcpqTqPDWUb9iFNXd3+mupcLsSjqbealYUKUzLG
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me

On some Qualcomm phones the FPC1540 is driven by a QSEE app and Linux
only has to power the sensor, load the app and pass commands to it.

The first patch adds the qcom_scm calls to start and stop an app and to
load a services image. The rest adds the binding and the driver, which
exposes the app to userspace through /dev/fpc_tee.

---
Armandas Kvietkus (4):
      firmware: qcom: scm: Add QSEE app start, shutdown and services image load
      dt-bindings: vendor-prefixes: Add Fingerprint Cards AB
      dt-bindings: misc: Add FPC1540 fingerprint sensor driven by a QSEE app
      misc: Add FPC1540 fingerprint sensor driver for QSEE apps

 .../devicetree/bindings/misc/fpc,fpc1540-tee.yaml  |  74 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
 MAINTAINERS                                        |   8 +
 drivers/firmware/qcom/qcom_scm.c                   |  83 ++++
 drivers/misc/Kconfig                               |  10 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/fpc1540-tee.c                         | 512 +++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h             |  23 +
 include/uapi/linux/fpc1540-tee.h                   |  20 +
 10 files changed, 735 insertions(+)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261124-fpc1540-tee-c89b3527e72a

Best regards,
--  
Armandas Kvietkus <armandas.kvietkus@proton.me>


