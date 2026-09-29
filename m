Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE239B94D
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 02:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648941; cv=none; b=gWu5Q9jkXc/X0lZhxuaERmDg3oM72ijD4QosJsE0z+s/OYsY9JPw+/bIPtu/6kxr6ucQrM++qhk8aEFmFvQSdRoSjA0G33R5rabM/Zj7SOOt2J2SWTAiv5eztx/zN7YiFr3A1GtjHsx2cZksWwF0NQDVILVnHCvS24TUbb0Sgh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648941; c=relaxed/simple;
	bh=Xi0oR93X+EwbqsjKmkBEu1JbxzRdobz9nUK2TrbX1ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RPI8uUxClBMvAbr7R37VAFCuvZscXk2+tuqhCkigPmSmOnoW+ENzRvHr31CZXoeDRhOfKrY1x2NB+sKnxwgr/EbKlRyAvUuohGAigqpoU/dPHM/Us88uTN4WaqcylizM6JU51GGSr3ux+tClkYPw8Np/ldiUB8bivd25+K6bk5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zgx7TL3X; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zgx7TL3X"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so2089057a12.2
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790648939; x=1791253739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2Q7/Tr8R4pY/MWK1/a6+UXwdCPjDDbiUS19/ruPYIY=;
        b=Zgx7TL3X5mHC0+3qW5EYJenWTTuMwjptOfE3a1ouQwlcZa4TlRvZ3/xUbexa8+/IyW
         YOmxLMrpoi4Ggh7vXVF3SYaEvUIYzlartve97OG0yujfDhwkXKBzTYX7SloYfUWYzzqh
         VNU+clbyeG78IxujH1xQ4XWY0GtCgPbkPZUusQfib73w0sJZeedCxG+NpRz/QCYqXlAI
         1zHZ5LJ8BhNmjzofftzSXWx3g7PAghb6H7Q35GLSMiAMWED4Ohta8UBi3Pfd7/GSiOuA
         czFXzRiJbpOrnr8j7TdQbjXINiw7pKUkLX+8Rp4dmqseZeSazV6ChXQT2gulbamo/68W
         tePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790648939; x=1791253739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2Q7/Tr8R4pY/MWK1/a6+UXwdCPjDDbiUS19/ruPYIY=;
        b=DSNHAwm/yjuHNg/VlcUF7q9qbCrag936expC3OOjkUqhwoR4DhpMU2mR2yu+aePe8r
         6OT37T+CnChMlZuebYVLPDilBNt2VBPuSPm3iDKJTidK9BKL1Qoj6XkGEO1B/xKM1z9v
         RlmaPNV3lNQQX+q63hnbe8Ljpz0/jJC87fIFh3iScB6zbJCDRb/s62WGEKMV7wYdKuxX
         4QjnFjqCg6Fjt/NKmcXmutOpI8RNqH+SfPYBD+8OikV+EUu1yOO0pjtnIbRMN5eoaTin
         gYbaGpQIC/m9/RbEDl0Fh6u65AlmQ4GXhsK6DwW0YmgZETIovo2/sMKpDcav+oC+MGsf
         n3rw==
X-Forwarded-Encrypted: i=1; AKwUvByYaNIbEwCSLEIv+0jwp6tkUYmW7td0Z29SUGOz6uecjRuP8In+daH9cJn6vdkSrS8cN+jJJ1EE4qZS@vger.kernel.org
X-Gm-Message-State: AFuF++kQUNp7FqpNmVIPHiZx+p/wx41VIDRLOdJ8yhPURNSeoJ41wack
	9l4I5EomUE5l1FjdkGBpspPEkRVhNBISyNcBwVvmn2sWHwMiGoZdOyS7
X-Gm-Gg: AYBFou2pxxPWr9K+BXs1xRIHcWmpw3M/G5op2BVH+Fr3xJkugajCM0ZNYI0j4r1wAIs
	tFyf6RxDmMQA2v0QZ2B9tyYIzRrGAxxXbob/pRTSkun0Hxg708I0KxlZmBaE6ttrtoLun0JT7OY
	7+RZRjsDlNCiwWJ2taMagUyYVtprGPRwyS1SxcCFVFf1tN87hGhwadIG2Out3Bf2ajAw/kJwScP
	SShJD1pclPuURAteSthk+nGLqtoOlgSeh+/zDsGxkBKhxLXpzgNTCFNhs0parYmshHwyoJdvg6R
	9ZsasQwVamCIn3vIuKAmlwHKHoVxSpzf9lnj5tc3bM1NaVDJjnl1Fqzmeo+X77UeZdRVn4rY6LO
	nR2XBY6uCf1gSaqHlfoD4FxSUmO5VvRb5N4ALpfjK5SXxCXBQ5LIpiek4f7p9VP8imkRZ3HsR9b
	hPTc4sNQfvuk/4Nhp7hAf6JEbHCspfyt3WmXBMpM7A+MTB9NfstAIaRafl+xqgLGZiZRjf0bZTa
	hjDnlwdbBJMXWvgw1A9K51ycm5hUC6yZU5l3IotPa9btZHLV26v+v0IGZfga1wbSNXZqiUCOt3+
	GtAdVr8Ut/ehhZ1423It6OXV7cae1cQK2/Q6qe2iT1RTkSmWxw==
X-Received: by 2002:a05:6a20:c709:b0:3dd:ff93:a99 with SMTP id adf61e73a8af0-3de0e73d7b6mr14414466637.25.1790648939195;
        Mon, 28 Sep 2026 19:28:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc79219db77sm4919997a12.14.2026.09.28.19.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:28:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] powerpc: dts: eiger: add placeholder reg to ndfc node
Date: Mon, 28 Sep 2026 19:28:55 -0700
Message-ID: <20260929022855.24484-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ndfc node of eiger.dts has no reg property, U-Boot fills it in at
runtime.  The new IBM NDFC binding makes it required, so dtbs_check
now reports

  ndfc@1,0 (ibm,ndfc): 'reg' is a required property

Add a zeroed placeholder, as the nor_flash@0,0 node in the same file
already does.

Tested with dt-validate on eiger.dtb.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix default reg
 arch/powerpc/boot/dts/eiger.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/eiger.dts b/arch/powerpc/boot/dts/eiger.dts
index dc4d74c523ec..33ce507e71d4 100644
--- a/arch/powerpc/boot/dts/eiger.dts
+++ b/arch/powerpc/boot/dts/eiger.dts
@@ -196,7 +196,7 @@ partition@3fa0000 {
 
 				ndfc@1,0 {
 					compatible = "ibm,ndfc";
-					/* reg property is supplied by U-boot */
+					reg = <0x00000001 0x00000000 0x00000000>; /* Filled in by U-Boot */
 					ccr = <0x00003000>;
 					bank-settings = <0x80002222>;
 					#address-cells = <1>;
-- 
2.55.0

