Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com [74.125.227.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B714424D4A
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791116384; cv=none; b=YplDO5MM7nq16lnrWyWGAla/f6LpHBwAOdGJsk9ck2nUd1Wdn3xJuY+cz+FivPJ6kLU+xDPe74rPffuOdhvUwWS+/3JKwMEUJ42Cztz7VXIQ5GsMy3cySW5nNPCERiC20KdJeVdtP5casWrTInURAlckxBVHOqUyoFaHGrhArZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791116384; c=relaxed/simple;
	bh=Hnu+pCMvzuSUJgWSfCJpYPyMsCbRc7B3l4busMwVXGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6mmwu/GVYy7irdTrp3+FQQlL3YYv8cC84rCNzK8o6vvf6R8czavSG2wtTghzoWDn2C55X0Diq9GSTOOv3zFQuPOfcZkjUtZ5zHXV9VGtqpEo8tB5Fa0VzHwd2IXG4AlGbnLMpyZ/nF2h1+YJx0kqsk2VL+Lh3cAAUaeFWP84uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMl6wMPB; arc=none smtp.client-ip=74.125.227.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMl6wMPB"
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf947fae49so476481137.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 05:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791116381; x=1791721181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxtxB8N5X48tB0UW8tHe3MMy98DMVpxgLXTv+lNKsPo=;
        b=oMl6wMPBKbeLSZRNeV7SsFPqyoKwd+mALSDrD12VAH0bpwKBFZQtYeGE5OHFt0+p/o
         m1MiJUxVLa8cCy0iLHrKdM58x1XjKbDTNQ+srEw5WZ7n/H3e6fWN4IYbom9FLIKmz577
         R62QJgp1lXwaSIUA/oGG+j7kQDxAYRU5gLZ+iXS7fDsuRAkOHxnS5zlqwu1BBQTZNHQB
         Ex/WGBvruENYkNuEmI3uK9E2ErqfQTUi7QgIorBw0PJOB92ACPcXzpTueTOw2U/myNgn
         Rb/nhR9y1q3RPhgtV2Onv0PS8FH+NeZmPuXN7uwA6lCrMUfHPT5eJCYzjJlwhdVQsZ/x
         jSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116381; x=1791721181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxtxB8N5X48tB0UW8tHe3MMy98DMVpxgLXTv+lNKsPo=;
        b=eFU/leTIWtlKLRudfuynMMm25muWUxwevXqXHXqo6jTheMMyrSO7cPrrcM8FwiN/Ls
         ZI00QN8vGHeCi+yU+PgkDH4iKgKcfXcGaT9vuJD7+TI0/WpuF9SS8fOBhlgL4B2XOj4h
         rSfhdlNbOJTHJ7j/ycP0qCJ4lTUi2hthVZsWR9q2Ny7en9zAPpWNpayBnj0/Xu5Ib20I
         F+3UxXfDo0RScs0C74vfW1zC2Daqt17HxpXVCQ02eL2oPTj/KzLOquqv8/nfAubGedB2
         zrXwH1G8lIeTqyq/mvjMqyDALah5OFH1TlQ1/kfUB4L4rVh4ii4KFCqlVSnkCGbK+2oI
         rk+w==
X-Forwarded-Encrypted: i=1; AKwUvBwPwAkV3TwR2wYfY/SDjkopsaRl12yI1GqeEgYc6vBuH49VXMdPsZ2kSRTnrSfJv/k09J+55BPdsvMD@vger.kernel.org
X-Gm-Message-State: AFq9FYKa3h5JZNdeBQCVO0xza1HJ6/1cnF3vh23YdTY1lcR27kNY/+15
	hPoHvmYb1Hcaz2i/GCxHDfgoA3SwL2CJ24RkhErrYkTMS7AqkOkCiS1OS2DxaA==
X-Gm-Gg: AYBFou3wi1GbYB5hwZ97Yyvgl1QGZXshrWS/+73OR2bS2HJmvqoHO4D/rd37H6zn0g5
	dkJjfX4KmGuTcS5XmGlEh2o5IdfTWui2FHIxIBamCFS+HXHUpBpK8KZTCjw+127+4600N9FWN+b
	wFUMZzIrY979BMcF3KXM0GhxBAUCCF0fBy8oRWg/Oay2IhqMx/d6mkG3eZJwMCpR2OkfKsIVuTQ
	OUNe9i02QHtaAl3ZIea3373mc5pYkjYJW9wIWd2o64Lx//HQ/KsbpNICSOq4oE6L0oSCHeXytXu
	uaintl5hcmqvSYWsX/FJsLpEhB1tzVKf2Cskv/sMDjPDLAx2hMYYpJh0QXJi2f0rfcihY4+Qv+m
	h11Cy3ZEyUw2uRlsylT7HTo/sAvc5VIDZWYL4nG5nYD2d64hS3D05HQZbeMDxJesiUUtwY7zJP6
	cQYerBPvXUbuVdRg/QoXaNI0kreIyp7pkQtrVusThYsuRgA+TebgDxzK2bDwmr9s/njBxaIQoT3
	bx5urJ7bGDvvV9Rzg2zryNMa9ya3xMVHzB7lHwhhVh+mg==
X-Received: by 2002:a05:6102:508a:b0:7bc:1de3:39b0 with SMTP id ada2fe7eead31-7c0f5dab54cmr2257004137.32.1791116380675;
        Sun, 04 Oct 2026 05:19:40 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a800:a625:1d37:6d7:739d:9d6d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98b2f115fc9sm7780464241.10.2026.10.04.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 05:19:39 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sean@mess.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 1/2] media: dt-bindings: rc: Add Ruwido Z3 RC-34 keymap
Date: Sun,  4 Oct 2026 09:19:30 -0300
Message-ID: <20261004121931.6746-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

Add rc-nec-ruwido-z3-rc34 to the list of supported keymaps.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- None. Only expanded the CC list.

Changes since v1:
- Newly introduced. (Sean)

 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index 43d84296e70d..827f4b0a8263 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -105,6 +105,7 @@ properties:
       - rc-msi-tvanywhere-plus
       - rc-mygica-utv3
       - rc-nebula
+      - rc-nec-ruwido-z3-rc34
       - rc-nec-terratec-cinergy-xs
       - rc-norwood
       - rc-npgtech
-- 
2.43.0

