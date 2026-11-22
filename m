Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383991;
	b=L6kXiYotL65CF+MqM1eZRJz3MwFkLWF6kVFx/JsSicsm76Sqg/Xtz8dJ18C1VtKleLRb
	 rYpCqNQoI1WgwwTd2qYVJZTve6YlOoaTqElWzIcbqUtcKzOaipaAhdgFtQxQkoEnlyQJd
	 7c0RvA+zx2BZxzfBgSk9k1bF9T/3fYbniaFPknbbPDIMdBoYkSR5WzbySsBMcpcAH3+Do
	 bswNdNkD/XUvbsji9I2CJXrjZ3QjwjMRR8A+yNDk7YxuMvMG+X1PYoDNIqQaVBRfRckDl
	 +b/ZXohJ34tK20A/rJ7qqqjvtmbBpEbCEtfj+WcXV1FuZ6rUFn01UxwsSaDVomM0vGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383991;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=zqMdG/eHfP3KuBz/jyafMdzBYeomt50dPOhuuKaHWhw=;
	b=nVXHO7Q64NKZdhKoZcfYXauy0QgjSf4sBeTyEFipkSxDHI54lYyig//eCqyi+usV7EHP
	 3dB6otA8wfOSTYH+B0QgRwFt1kG6/v0i2GFK814uidYvDdpC6YtrxrSO8WIFIK6LI2kby
	 z2buwUWbW4gjy1Okwa7Wx/hyP0geJp0dvnxuaIIdCKWRt5LMt4QSJOYlROYkpmYil4XR8
	 iVCicYMV8D73GeOkGB0bNShEJQIMyRFa4WhqXU9RvLT/hStRSoMe2TXQ5mh61uP5Z69BH
	 7VffQpXJbq0mWIowLrsqAZhbF+ci1aiZOcryfwpSidEPhBWzWDtRd6xSdzF56QXUdUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OX7pRAWY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6E5606A320;
	Sun, 22 Nov 2026 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OX7pRAWY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795383990;
	b=FUAd0K4WW3gQ7AYFX/NVQRSv6x15gh1a+HV2tiqktbqUhPUX/4HPf76Ifij5SX2NMHMV
	 Dcb371KWEn6pkqSK3W0JvRplI5tUFLQOmm6wGR8JXuhLabjSDp/W1MDCchVrrPdqvTI9U
	 B3DIM+0EhApcvELDDN0lv3rRiKmQLq6Y1e42uuSP07hG35ze2sRJ/G0X99bNdMLdKaj05
	 H/G0kyh0IuGAifu8Hhm1F/ItoGdykLfLPhWU/dMgzv5h+5inzSo2CwTxLWmTZdZHe7+D1
	 lwjtSFK/pOlAhy+njNdNETp4Qhb2hy7UVZ5gD1r28kst2j3wFOHULr6SqCnVXUjCCVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795383990;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=zqMdG/eHfP3KuBz/jyafMdzBYeomt50dPOhuuKaHWhw=;
	b=xUX/AL4GUQ+zmZWhlAVHiuHxRUrZTRJCD2f7TwH3xFHSX0W/RYi7IVDrx81x/SNvOK43
	 rFGbD/cILNci7E4XhtnClxFa+Dk5Fz3/F8sGS+eQuwdqIJyZHJEOjkM7MsYSqUE23H5H4
	 tyu3bGoY1ELyGnFqnBXvs6g2FgzmHyTfd8XbjYytH1iMaY8EZND++UalA82iXZ47hor5V
	 yBIZsmdX2/Un7CZBNIEzjaldYQBWpLqf/GaqsntnRDWZJF9rrt7Fulp+0M2iyFkVo3lk1
	 coIESepdN8Nn61HAcJ+FjaLD51o1YwI6/MdMPfzHgsVxUK2iwNuQVnGNWmu3yGK1V7A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D03521F000CF;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795383990;
	bh=zqMdG/eHfP3KuBz/jyafMdzBYeomt50dPOhuuKaHWhw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=OX7pRAWYVtl6WjYNIWfxx9+HgkbtuTmQIfe9Gy+FzQ8trKWqVOIzJoXb1eiVMGO4Q
	 QMKX4T8wBjd+6qPIn/TswtCptkY9OeZOUTPO7J49u4hwUN7VLzoL2oV2OQvGLkh5xw
	 +VnOhYY8tdOFQcyvyudugpVq2mgqxp7bX21FKuBua7DNz5oOJdOdFJrHYTcVvQrTYi
	 H/JAp94c432Uil4c+0hjQjcbfxeXaqwcB9r1IazTLW0Z/l9jDa8uhiBJvpQv37RC4b
	 bGm5tjiq/72yYdLnLZKmjW2d/DtZJP9U1Wu77yN0YF3aHUBb/ZT2K/0cMIcfZhDfHx
	 T95zOTX5FgbeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 304AA4C20F;
	Sun, 22 Nov 2026 21:46:20 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/4] arm64: dts: qcom: qcs8550-retroidpocket: Enable
 displays
Date: Sun, 22 Nov 2026 15:46:15 -0600
Message-Id: <20261122-rp-qcs8550-display-v1-0-d513d9819a34@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAwA0atI1gZMsf6uIi6KjRoQrQ2IIt7d4
 vItZh5QjsIKXfZA5FNU9i2B8gzGxW0zo/hkMIWpiAxhDHiM2lhboBcNq7vR123LhprSOwspDJE
 nuf5pP7zvB+gfyFtkAAAA
X-Change-ID: 20261121-rp-qcs8550-display-d799e2184da5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795383979; l=788;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=UFvaZtlmbK3x3++gaX4C0nDXh3A1k4gRmCkgGdqnpQQ=;
 b=H4xkYsRP8yGDCMsqsSuE56jB94upcwQstyYQc3y8KFK/Ot/5fRg3f+T9EbyVDTCQkqzwix5i6
 YBo7VibGPlpB6x64qg1yRXULZuytc5+qXY3xt8h9akSXoPMDhcf7rWd
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This first cleans up unused / invalid backlight nodes, then enables the
panel for each device.

---
Aaron Kling (4):
      arm64: dts: qcom: qcs8550-retroidpocket-nova: Remove pwm backlight
      arm64: dts: qcom: qcs8550-retroidpocket-nova: Enable panel
      arm64: dts: qcom: qcs8550-retroidpocket-rp6: Remove pwm backlight
      arm64: dts: qcom: qcs8550-retroidpocket-rp6: Enable panel

 .../boot/dts/qcom/qcs8550-retroidpocket-nova.dts   | 49 ++++++++++++++++-----
 .../boot/dts/qcom/qcs8550-retroidpocket-rp6.dts    | 51 +++++++++++++++++-----
 2 files changed, 76 insertions(+), 24 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261121-rp-qcs8550-display-d799e2184da5

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


