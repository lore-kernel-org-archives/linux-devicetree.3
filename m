Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951364;
	b=cKJVRwtTEKOJvG+zHdwEYq0l9oTyh3vl2woRsfD7YILz7EkOMC0JIn0XReBHfqvxUBXL
	 0TTAxQwHO7N4IQ+g68f89k/7z9atCStxYZhzkanK+PNV/IkXp6nwmrN+CfqpjAGva/FC1
	 54Ryzb5kcq0it6pmHdgYO/glXxhxEnTgtjw3XLB6vxhEzVsCHU3FSd/RuyTJea40jwFDl
	 Isa0MluA0wq95dF53y4gU3QSAgQ1hJWLXrCfEW7dXX80KrqpENy6NS2v5ATMiqvlxeAyV
	 nU92mR2Fr32vGMzQz/lUYnpcxkX4iCfnQBsE6REvcl5zgzUpmiQz9vTY7r3Byz45hUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uvWB+cWQ5tAH9q/mNwHxkCim2VtHEwZoSQ5glTQJ+xw=;
	b=AtfYNzs1wWopv9l8zsG0pZdBLpwSQZQE1F6Ar3yJcL2hNab1qwpf0224oBGJnejIQbPG
	 k1gu/SuYDuVaGdJsxUPig5HQqEGRfYy2bGraCmCxkrhLUknXPzrUDck2cqroqsDmttVhD
	 Mvhv0Tllv1S06KQ67nrMhgarSb0edZJneRU/vzRMi24Cqd9c0EXQK1zvNCXkWOFGZckeJ
	 B+ejQUfTNB5eB1ZadLPihDf8SKUZFp2TSyM0a1TNnck+4UGV7tOyv2Sp6l8YecPpkQ+6+
	 rCGQMnkGM9u/yreIKi15ifrc82cO++w/vIRS9SAZz+RuKCA7IvTd9azt2VJxriccX6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GIkf9kAK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B11606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 18:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71B11606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GIkf9kAK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso20392455e9.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 11:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792951362; x=1793556162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvWB+cWQ5tAH9q/mNwHxkCim2VtHEwZoSQ5glTQJ+xw=;
        b=GIkf9kAKGm2WIoQZEexvqWpzEFiyxVpWcQAuI3yizHai3paX8FMUWCNjw55di2kcHn
         ZjPV3GRiHH/nM/w+5R47bfWoOBVWFfWg/I4U4PkCP9LohxuVNWrCoHDC3Wcb35/chDwv
         9W4Ijvtfa/sw/xt1EANuaFfZXzTWo2nrpyc9QHlWbuAIEiOyizPIqT5Mx0Qqyg/lXyn6
         y32FlV6Z221tY4FkiHXtnHHtY2a58mq/PYVR87oU8kg+AkbiWbt8HojPdS5hggv8WOD+
         fz3r8Z9040gzO45WC9tcOEcNo5Ack/73m3aS8Wc5hQtQEF8CJoX6447XoP04Ocvd+bBE
         MrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792951362; x=1793556162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvWB+cWQ5tAH9q/mNwHxkCim2VtHEwZoSQ5glTQJ+xw=;
        b=V7xkUb0VAPnNJN/mmLiqjw6Fyj1E7obkpKvWys8xtdQuGS3MRhcaFIFL8yObXdVQoe
         8DA+3RhE+edn2QXS1MgguLsXuknik0YPyi/2nddw5PR6qMiTEfsO1Un0nzjWXLq1BGPU
         jU/n2MuiRvlsDyd9TV1DjVS0C9gn9j45O5WCaAlmw00/bFr0XvIL86yjAC6wDPGfhWXe
         8q8qh6+f3mqVesMkGU07H7iJU03G9sq1M68ZfA2UQdD9KNffnzcuLaGCCtEiCVXCLapV
         zEfIG9UckGmn0D+j3QaBVFYyc4a1cLAkYgGP/RCi7LFzFZc0tidHfNhl4uVMPQTxWun+
         X7mA==
X-Gm-Message-State: AFq9FYJb6hOF/lI72OpThWQmyNXDYVgLLXjvzmPUzQn6QipF5QSua4M+
	L/YOa/m8oGvrSIHK3h3xvemEPmqYKBPIkBFa8qrUQ5bgRRBd9sEQ3+wI
X-Gm-Gg: AYBFou1KNpmtX0UPpTQCvKAS3ASmwXrOY3A7CB1S8Tea/OzhYLkAdjAKyKovz/z5nqZ
	gG09lV+a5TbFrPywkL6GoLelci7+ChhTrXldBV0MZVHR01FtW05JDkOVTDWTW6ryw8AGuKXg7Mu
	Zjo5SJUBNridvEBnUkkqOATyUdQ43FJymgpSwG8P+NOGVS8s64aWn5cxgCyMOJzogiRuuKbmPRH
	XJrTZwbRVzKdZIsc+0xne8/98FqjMmhzVLnZCl4X4cpT+1US+84EPcr9PilNRcskdUOqN2y4Cax
	BCtADuQ/xqy13cZ67EV7bH8tblIjfR88XYKZD8zC9761fDVN3u+6JOM8MNSyC0eXcM84OldD08I
	PtzJxxPymb9EQ2/G3pVvd+TwjTXmLga4bwIplkR+lWn1yXPPnRV55EdpcUjppDQv0V2zWrhNZkx
	FiqDV34xL3vC9+LyUJapN6Xz5GxJWw8eprUkYsA26dKjjThJ42UF1lv/sHZxERdU4cYOQz9Had7
	UOdVTJieqXh3VSSDu0W+inHwqg5Jff9Lz1pmptbt4Lnbq5MVO0wET7/KtryawolknWDylF7VC08
	V3l8w7RbenlVRydzYRf7TCpgy2BFPdBODvsBRSefxy0FKNOLcJCqeDOLIwDn53MAE67rPSRD910
	QhriHLVcz4eHnAV4z33VD9UkmWTlKCpN5Sz6BB+cYzwGctJxzDqf9z4/8UovQsbw3gPg=
X-Received: by 2002:a05:600c:4e87:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a35aca7643mr99183135e9.25.1792951361603;
        Sun, 25 Oct 2026 11:02:41 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:70b0:9267:4b0f:4193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm367961345e9.1.2026.10.25.11.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:02:41 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] of: overlay: fix device_node leak when attaching node to changeset fails
Date: Sun, 25 Oct 2026 20:02:37 +0200
Message-ID: <20261025180237.445403-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In add_changeset_node(), when creating a new target child node via
__of_node_dup(), tchild is initialized with a reference count of 1. If
of_changeset_attach_node() subsequently fails, add_changeset_node()
returns the error without calling of_node_put(tchild), leaking the
allocated device_node.

Furthermore, because OF_OVERLAY is set on tchild before
of_changeset_attach_node() is called, calling of_node_put(tchild) when
tchild was never added to the changeset (and thus never had
OF_OVERLAY_FREE_CSET set by __of_changeset_entry_destroy()) would cause
of_node_release() to log a premature refcount zero error and skip
freeing the node.

Move of_node_set_flag(tchild, OF_OVERLAY) after
of_changeset_attach_node() succeeds and call of_node_put(tchild) on the
failure path, matching of_changeset_create_node().

Fixes: 7c528e457d53 ("of: overlay: add missing of_node_put() after add new node to changeset")
Fixes: 144552c78692 ("of: overlay: add tests to validate kfrees from overlay removal")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/of/overlay.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 08d535174..936d5d742 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -442,11 +442,13 @@ static int add_changeset_node(struct overlay_changeset *ovcs,
 		if (phandle && (size == 4))
 			tchild->phandle = be32_to_cpup(phandle);
 
-		of_node_set_flag(tchild, OF_OVERLAY);
-
 		ret = of_changeset_attach_node(&ovcs->cset, tchild);
-		if (ret)
+		if (ret) {
+			of_node_put(tchild);
 			return ret;
+		}
+
+		of_node_set_flag(tchild, OF_OVERLAY);
 
 		target_child.np = tchild;
 		target_child.in_livetree = false;
-- 
2.56.0

