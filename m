Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F02D47FF
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625980; cv=none; b=eO4eTkvJbG5JMS9LY9vr2abgaYhGouWs3rD0MMwgeOJRh4UG7ww6Lv5mIzf05y9e55/bwiyiz84V+fzgUojN0obqKjF619XpSegMwNh/LcMz4/Tnv6HiBKqol5anttM9ZiJdhBanTOElYSI8gVvE9vjjWrQaFgKJ7iQ2XZEBSfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625980; c=relaxed/simple;
	bh=ZvxvIgwHzE9yj6ySmWBg3bX/llGDIIzETW1roOBCEE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0GCbSgC+STe7Gnmt2McX+BmgHJqQA+782kHTR4KItVxhONBswO1VgZlIHN0SRQ9PYRNQEfKYtvjGriWU3IC7eU38+e7lB5/l2CGhIdkioZlAc5ZStTTufkbJT0KTv1e42NTKnGtYAn/DhcIyXJFXKlDPs5YXQK0M3m/UHf4VS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTzpywx5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTzpywx5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc827a68fbso511345ad.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625979; x=1784230779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=bTzpywx5D0rfCLnpDkWMU8e/sGifebZv9lyqXx/Z568iyyDfPkkQqQoDXrZoaNfTit
         iAz/Dbxx1ymiQGro5invhVvWsytkiznDJB0tkt8q/PHZW+uKW2bvTqX3Pqi+yqF1Ag/Q
         Oce/6FSpIdmYsTaq6W8H6Mv0k53noaIkhZJQur+SXS2MbQiLmb/d0vqqGrQxOCzJZbcx
         hEF2EV/whTd119mrJLlOjHokg0fU+i3VMXLY3kbybDgcfwu35jCeqkrzvR+WyVGAr/Vj
         T7gkIt02d+n9z0yFAT7qw/rgvhoR9DK3y8zf/qZcAgCahj3+piPIUPVinTQ6/obJ6gmc
         XSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625979; x=1784230779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=N1VAyOGS+DDOfLIE2gWv6Xru80WSef2AbtKZZ1GY/ZUn6xSlGsMH8YHmweaOWjfj3K
         PD+rgKXDxbzENq0lIhduqafXt4LmVGBCq18mdnEnjdgsobrKo9huU8EcFNrFFr9XefF8
         qhbuFMstD/Y99XELadVYS49skXDEf3HekHXEQQxzKD0/+8A4WGOAlVd/230rC53VouBR
         JZg4HpbVfZBcIrg/+C1lh6byJa/qdAFiRcMbg4YYGakkJH96xZdZBxwT8JXTbaA+Ionk
         nT6JNphOseXHp5QNPzBBHk99oWagNBltZo38lG1GBHZ3Utq5Q3N4H4SvCDTimS7tvfBT
         Bbuw==
X-Forwarded-Encrypted: i=1; AHgh+RoVqe3bwLvnmY/iZyhJCtus1j65xjh9SEdNltBH19BAM+fODPmeAjNRTHnMMk2vquIjduQJM+zLAyw0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCgngJJXnukdxfS8kZiBoHNvEcRIwaHMVow5obohW8VRtQ6kWM
	p7KkAk492iPGi5e4Yz1KcwQdub+VXB5POvsClA2PKqr3DHw6VOzv5/md
X-Gm-Gg: AfdE7cnTx/1rKnty7Wt8cNHgHeaW/EXCuSkZ84lmB+SCE1D2qSR9rnDOOJ77L9XzTqw
	395UMYD87Axbtj6/Wf4xns1THxZhBAfWbObJu9RtBcHigAU78qDlYXm27e0IFRQC/sq0UhUmAtb
	N2/VHxnkGoCVd9tpZRZehBpHTfiErozYxccE11BD+yCNrbd1fPII5hSP+inqMiD7AB595IZWS8a
	qtQIjg5k4exJTscKiqSTKKHABOKZ4XVQ9mIjsE2AoHDU9OEeIp6zTOdt1wkTI56tHxwQ04Y33Wm
	A4W91MdoDT4V7Ab2uUwv10Xgd6iajat6FmF9Q5Zx27zGEzOkgTh99nyDnPhfzHy30iCbEs7t1q0
	vor2/apv4aLtCjffHpvkbQIpPaK41sa6KWkcWsHo9u1X009XhUOIW7LCB71+vbo6kNqaIMGgPVY
	S23SuFh7B3KunKwglky32ozABLwB38VvYatpQdotIAOqnix7WKMUbrI9xZMa8GzOrjgg==
X-Received: by 2002:a17:903:90b:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ccff09e0fbmr44702215ad.4.1783625978569;
        Thu, 09 Jul 2026 12:39:38 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm49018755ad.79.2026.07.09.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Date: Fri, 10 Jul 2026 03:39:27 +0800
Message-ID: <20260709193927.108105-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
follow the GPIO hog naming convention, but the mt7622 pinctrl binding
only allows child nodes matching '-pins(-[a-z]+)?$', causing a
dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
  'asm-sel-hog' does not match any of the regexes:
  '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'

Allow gpio-hog nodes in the pinctrl node, following the same pattern
as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
gpio-hogs").

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 6b925c5099cc..021307b6d801 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -65,6 +65,11 @@ then:
     - "#interrupt-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
-- 
2.43.0

