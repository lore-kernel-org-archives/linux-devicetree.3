Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639962;
	b=Vd2p4brMyNfSxW+nQ6CePIuaGB9lA4C61Be3ym7MdIQDbCyFZrBkeot2kobFAN6wIuD+
	 MAXCp8yvQcshISu7pJ3mBmuAeUWYtwwAU90zF6FXyQAUVHbwPHHBiUdvqzeRIjIL6npzZ
	 2aEhj7W5iGqMu46Eoryqx08jeF0XdLToNFciO9C5H6CYRgQatdHc6n9dZNaHhpD3BPD+R
	 ojRmTTWUg24QvyBpfMeeVIPyM+VNG0ikAe0p62ESG0G/4LUKcpS+2ZMlz0hSAmGdGLkBH
	 FR36Vk2jSEXSOVhHs22o9hPwUPs2eBNABV8eC0tXRRauaKYq4JGmxwOMMRjKiZffOqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
	b=lu5rTxxTuLK2GA+8dSH6UMF5bZFMU5TVodxC3hTw5lkTYsxaFnPibavv8nmx8DdUsueG
	 edJCUQ1edxmbekycFND5zK00O3NG2LGRCJhASD66Dtr4Ll0lRMUMMvLmvz9YNRMnkMPKT
	 +xF/4IUhfMbtyEeXKcjKmTA2wVekB2n0qut1wZJs0naHYwoFC8OfnkAoz88Oy91Io9Hut
	 TwecN1kkPyUKs+b+hOXt4Q9PRV4ofJMU73opARw53fTOOuVvkIX62rfhU4mh2t9OmDdFO
	 jtPGWQdH4d/TqRpt4Iz2GwGwa89Z+RcxfIoO3XnEMkjvj9SHruk+BRKjUuPU7alagcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQwvrX3O;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6B36087625
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6B36087625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQwvrX3O
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1394525eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639961; x=1794244761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
        b=CQwvrX3OxWaAF/1od46y1MESRrbdPw7lzKGyqKUOWeGhNjWn0vDsj8i4tWSycRnqDS
         1h6HFN/Ypl8BGAwrCv5KBjHvKARoRu9gfbUowvgfVtFRB06PpC8KcLdOuyb+1e54DtqF
         Im0kUMhVwWEn0UJj2kVsnB4MqV/Et7iMPTCPx7uokplU9l3wYiByz4EpaJ5jRYyhkr2T
         uJJOMX8PWlarPg3Vgobhql0/RBGPQyX2Iq/sXkhId2aBymvkACQKcPcl14/RqZU3TE45
         RIiHYG48+PlSVQYWVyZGxFXaL1UGqAz64km+KHNbrP1j4avSEPCZwYa3th2Nj48EIt5Y
         K32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639961; x=1794244761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
        b=pViM/9wt8hysXzXwXV4XGwzVtEmuvlCZOddqYquj/gdzhno9DNxZIuTdazTOPdZyyw
         m6kr0pfsak9pk9VOGqqTOWaF3Rf7p2MUBg+p5CnHL1Y9YV9DS/NBzDUpShI9ZwPTtqhO
         1e6Ls+J6srMDdeDAI8ud2wqomCiy7LykkroL8Hf0Xppv8cPz5eqqLg00TQBRlqMqUI78
         //Bp8I0K4bR+qgGcs9hJJrT7oofVZzM8HHiavFJxXpo+t5l8X/DEVpBDRNMjW6+Lpx6c
         +FJRPIPOz30WZigjHF9m0G/pjw1aXAod8fpDWzEdeG4TnV99UXZmtkBFBzYGLgzWWF67
         Xlng==
X-Forwarded-Encrypted: i=1; AKwUvBw0FTbmrM1F4/Lcbs9qvPJnOcw6mUOaeBdfkwSwy/qdTLPScPiUEBcs7JJH0LiFUpBKji169X06sDbg@vger.kernel.org
X-Gm-Message-State: APuU4Z+z4QCRKMb16idpMMaAchMu8oeVuPR6TpM43wVI/SU10JX0OhK1
	gXtLEnNE1kwyauiM2rANxsQuTxZ29rQ0uLLHB+Z/y0cdCgicq1dycY0o
X-Gm-Gg: AYBFou0xIAaHK/OoeddF8fsOJL+q0pfKGpmjoA+YiTeqgGQCeoBg2O74z4eFC/P09Rc
	a6329cz6bebt3ZO1ZNK0o2PZlpEi1U/shQPtHtGkE7t7trSnQnNs5Ge009rh6GY8WzO4TUPUxOp
	8nDr9E8KOAt5VqS9ed1FD4C9/vV5oVw0Hu00Z/0LQDqr9eh5r0MprhmZcQmhaG+a6L2qjlYK1Ip
	LxW1h3huYnACurPf/Y3TQr3ZVBzO/Md1ZiQK7fgaxyi4HhhrnzMu4RgRkD2vI5rS03gvR6JjS1L
	k3MPQH0XoLL4peqZ1XqbGjxXFP5QMFhxBjFdMuqGn7m3cpjPfhKYWo4SjwOFavBSXRIK80pnBFx
	xH9MR84UgGD0c/3877wd2jcNV2DjPNPUlfGVnBD93Gz+80EkfDazaMEu+yLmgkhXqco5AgMDQ2T
	lCv1y53pTg/nhEQyFhMjYsElt767f//6dTOgBGQ8i6lF+Lpyi2GNwK1Ce8u9mJeCQ9GQ1G8V2ha
	VFFNjRfT8DxXVjnPvRQz7hnqH6jhDMO3KLMZDaSaLm60AeqDYG3Bk6qiu0wpLjHZnx3dzPvORZy
	IbZgxsUUADWJWo/SsTu0CCWb53o=
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr19525473eec.29.1793639960809;
        Mon, 02 Nov 2026 09:19:20 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:20 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 6/6] arm64: dts: rockchip: fix modem power supply on Photonicat
Date: Tue,  3 Nov 2026 01:18:38 +0800
Message-ID: <20261102171838.2958552-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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

The vcc3v4_rf regulator supplies the M.2 B-Key 5G modem. It was
incorrectly modeled as being supplied by vccin_5v (the external DC
input). As a result, the modem loses power when the board runs on
battery.

Per the schematic, VCC3V4_RF is actually derived from VCC_SYSON (the
main system power rail after the power switch) via a ferrite bead
(B1). Change the vin-supply of vcc3v4_rf to vcc_syson to match the
hardware topology. This ensures the modem remains powered in both DC
and battery modes.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 11ac78acca3be..02d445d7968fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -177,7 +177,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
 		regulator-name = "vcc3v4_rf";
 		regulator-min-microvolt = <3400000>;
 		regulator-max-microvolt = <3400000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&vcc_syson>;
 	};
 
 	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
-- 
2.47.3

