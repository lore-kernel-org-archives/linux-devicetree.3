Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795387846;
	b=qnXHjFHyb8Hr0u46wM1o64C4Wo0Ej+xB2SvfiaSD3ny1BMbCoqt50gr5+gORxT9fjNst
	 FkzmNVdLWJi40zo3A1KHFVTigiU2FH5Q+HBPEQ9sThdy4UUQ/M4pQPu5npYuY/gseisT0
	 CFK08P5Z+yvyPhRBMlItgL/0ZWQj+h/3h8dqeMs+jWz2Zi0I8fQzRJJfuUykOig4fnbaO
	 bKOCno1zzxzor+oPxRjSUXZXortUuAWzXxqN46hUKhoaq6/iUv/w2pcbD3J17jXNzzjsP
	 XIk9fUSV2Kes/Lbs2bktMH47hPhxKa2HKWQOH267DlOOICqeUPMdTC8PafNzuLoWGCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795387846;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dj0rclRX49oBqOsb02p9Kow8s4eln+lcBdmpJYUIU4I=;
	b=V6082LG8Q+piWItbtohzDs9zEd7/WjiBcg+rFmhJWeFEqyDifLnVm1FvXzjjTYJRoJCY
	 0opaxkQr93PMQTc7SAUuqCQ+dRAU9ne9IBfWNo5JnQTz12Xw08/JH+OsIxWJP4snwGEWJ
	 qAYXUQiBJYY5jeOukm/hANYXp7/rOMD+LhmV+edJ14OjGeE0X825alqUr90r+nuQc3Btz
	 u/NexdBNW2lF6jWLHbAAsGyseS+E1YLHVFDrHErir+7l2JRVbNr5rb8RB8xFeG5LNaHF0
	 rT4Nlxd4qF5TTm7lCQ+WslQC6Mv7TprrdLOnneKVWUpzTvf7crz782yqSCi2Plm/eDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=SB7lUJ22;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B66606A31D;
	Sun, 22 Nov 2026 22:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4B66606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=SB7lUJ22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=dj0rclRX49oBqOsb02p9Kow8s4eln+lcBdmpJYUIU4I=; b=SB7lUJ22a0e31KYQQfWOHck+ln
	Eje56ysbXR7MJhNPoO97H2wqLYkfg/NUkwGTqlNP8A7GnW68vc6qHrIYfSdOESSE9UAVAqhdeOIxz
	rH2Ttcij5J59EDu+2qKxOmPpOSDe/q1qyaZiDNk7QkDa8M+pmpPGOLOzpfO6eQpRCFOJfQjTkwQfM
	Tw20Vso1VWmpk0LS6m6G6RRy25GZ3hhSXX/CkfGiLT8cqYKrI5H4fE9XvxVyiGRZWNJpDkX+aEi9i
	UbTSQS4lwshIDeLEIpc3nzMrzCf48bgUg1qZ4v+UTE5PUI347TyVVt27T/GaIAkFLZqaYm7PnzmuA
	zia7Zi5Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: rockchip: fix GMAC clocks and USB OTG power on RK3568 boards
Date: Sun, 22 Nov 2026 23:50:21 +0100
Message-ID: <179538782477.3150822.9311810146574826911.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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
Content-Transfer-Encoding: 8bit


On Tue, 03 Nov 2026 01:44:44 +0800, Coia Prant wrote:
> Changes since v1:
> - Patch 5 (USB OTG power): Reworked the power tree based on the schematic.
>   Instead of tying usb2phy0_otg directly to the boost, model the OR-ed
>   5V_OUT rail explicitly. Add vbat, 5v_boost, and 5v_out nodes, and fix
>   the vin-supply of vcc5v0_usb30_otg0 to depend on 5v_out. Drop the
>   incorrect phy-supply change on usb2phy0_otg.
> - Patch 6 (modem power): New patch. Fix vcc3v4_rf vin-supply from
>   vccin_5v to vcc_syson so the M.2 B-Key modem does not lose power
>   when the board runs on battery.
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: rockchip: fix GMAC clock parents on 9Tripod X3568 v4
      commit: 1b14b7c656147a8288b85aef4988007f0458e256
[2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
      commit: 3ff840ec8cd331b304836ecd716c674fcdee15b9
[3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
      commit: 39594d438bfe0961d975d5428a325dc07aa47342
[4/6] arm64: dts: rockchip: fix GMAC clock parent on Photonicat
      commit: 5925f9674f34ba53888fcd3ba21b143bfa835c27
[6/6] arm64: dts: rockchip: fix modem power supply topology on Photonicat
      commit: 9dc1e2851750ed78d46ea52028a69d3eb36b6a65

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
