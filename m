Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459326;
	b=GtaqflQRcrm8w5EOCki92qOhDu2LGkDQze16cD+ruadUkC1RBzImQOJUqQ0+xlAZ+UNy
	 /TQa1OCrkwP2+Nax6jrls2Cz+8IK0iPkfKuYAnzDBqu4lERphsMGyfTOVjSJ/T4T3i5nn
	 AVrKDpwvXWDgK9xBWxwfBofFRbdLO3up5I4LHVoY7QCrOZ4HXEC4XvIB4qGdalTYcg8Fp
	 CcaNrSLKWafdbHJwcZtgVFLUSuyaKf6Zp7yvYcWhu6SoYMlKUHaRySvFa4gkFOTPoED0h
	 jI2cbIwA76B4PmNn1Gr0snMyoTJug2i6AyPGvJLYOTOsEo9NhYluLl4rmvgPhEC1rJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459326;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=cm+uLShvE4daXaFExhWExnLwszBr7pl2G7pGV+9pOpfP4rIFZVYDsfBK854svNJWbjrG
	 3FFkrc1UtwvYlB1OQDF3WmIEeCNc0f83QnWk3/NR3bznfaVkeVygSz6h2hTRGoCUjapez
	 99mxwuAEKTTevYI1gXo0rC7H2Zgmc9iCBfyHk7VwxpJshRTnORxaa2gfOKQnOnRM/1VYn
	 Xw/v5GeHmm5wCAR+qr7JhGvs/WIVGgFj87yxLO5v9WSq4fy+eQZCaGfurMkSzEmXc6Mdh
	 A1+8saTul0Mb2hlRLLUaPhYO1jIpumuczVBfQNsxoP3U9jtDK7OF1KxfPCChoJ6qtRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2KDkHp6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B75606A6AC;
	Mon, 23 Nov 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2KDkHp6
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459326;
	b=xrw2FOdgcBGAYq9LRxvoJvGh+VQcok3LOObBmvFwDvUcwOqIuXzaqV0lBFQco5eu6kOv
	 XkS1MrGWENA2j61o2hCkUmn2CtCNz8noGucoajd98j9KskORcuSF48eoNDvt29f/DnFxj
	 DavBQrsCy3Qa2E9QXOF1hHN5trYMo4v2/7dVQ8SsMM7M4DdPbJV4mPUqwGpNcHXXuDWVs
	 SnG3NCGQPagIDywW4HjOKZqqBQBkB6It1svtreLwKQH3nUYiXjM6/ztQ7iniKdOwUutDN
	 TF8jsPVd8IcKF3hvBop7kKymYh3gYUkGjNe30ViqG5XCT4Apjx/L4H8b4YABN0+qnBw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459326;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	b=SgyJnX9wVEhzXAiTBarvx21079xqyjPkvrvwfOG5DSdxis9l/WXb+8bv55mYXzCBuyfS
	 gKf+B0xe+uaIT4lnlMXn56ZRZRk2Ug9D3AIhNUbogFE4G6Nd9osIOcr3OP21W3XJvv6qo
	 bXMrG/EKNjgYPkghI74ZoQfigfSO6iPTAMMBbeN+eTBUjp2iq1fom/HJJvm0ysp8eNmEl
	 HTF754FsHypsiRiqxuJid1aKV6E4PELAX9HkGnmX9bUqt5g0LzVUCy5zyLIWNy/2Llxed
	 CuNRobzKYZKNKqQQfSMbCUlKXeyrOt0/6R4hcjumNVskl4Z7vV/mcaEvQtlLXVi/o/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A38A1F01567;
	Mon, 23 Nov 2026 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459326;
	bh=GEFfizdvljp7hGLFmu1BppmnLe9E3/YwCg/baaZqwuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R2KDkHp6UDvFcp9vCumjVNLRE3Wuu6mYGdcDs2EpPrJgKUr9359+XSEN/NODdREGN
	 Z15l+8yjVQ37Ju7xKqu3WhhhP3XmfXPUDdo1ih3Qo/zMIb5DvK5dfWIJu1iQHuojBK
	 vG8o+fTAZo6eBvzuyAQbkZvkyt1ktx2I72JfjHRaJohc/FCWFK9f5bHFdf4m1zxSVP
	 ZUAI28hGdfc9WFsCKLWQUnT14UNaOUATqFCcmwWMQJwHwVyjPEzvst5eZOFWtVyIUQ
	 DNc+CwScQLau5C9JFA7NYz3enRbp0SzU0zB9x5OMKdWDfSEHe+BsIs5I6L0X8tLI5d
	 lgjLJcun+OHmQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0528C4C5E9;
	Mon, 23 Nov 2026 18:41:40 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:40 +0300
Subject: [PATCH 3/3] MAINTAINERS: Add Cortina CS7542 NAND controller entry
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
Message-Id: <20261123-b4-cs7542-nand-v1-3-7ce179c011e2@gmail.com>
References: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459297; l=849;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=k0G1zLfM4Qxwcp8LEzFwCNkEfCjNW435EmJBWtSiLT8=;
 b=mBneeyMc/WvMN34g+7Ai3fW+4kjQbVhjd5Nxjke/IPKDrD3crdoEUTW0MIqVkLtbcecH5s7dk
 IAtOqxaZE2NBloyx7YW/JBB1sm7Fczbb4xuLz2GxeMJ7xb6gwUEqnGE
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

List the binding and driver under the author maintaining the Almond+
platform support, together with the appropriate subsystem mailing list.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb..2524c5d59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6918,6 +6918,13 @@ S:	Maintained
 F:	Documentation/hwmon/corsair-psu.rst
 F:	drivers/hwmon/corsair-psu.c
 
+CORTINA SYSTEMS CS7542 NAND CONTROLLER
+M:	Fil Dunsky <filipp.dunsky@gmail.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
+F:	drivers/mtd/nand/raw/cs752x_nand.c
+
 COUNTER SUBSYSTEM
 M:	William Breathitt Gray <wbg@kernel.org>
 L:	linux-iio@vger.kernel.org

-- 
2.53.0


