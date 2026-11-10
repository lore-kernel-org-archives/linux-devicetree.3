Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303087;
	b=5rujJjzX7/Rp/aLDWz6wZWoiATk1zoZ6SP96kuUIns5h+ludYI+aJmBMusQ/50rjh6bE
	 R1zhpQWfNbblGOD1T9XvKVXzQP5RLejDael/ZoN4d4RAx1noXNwKvblBVr5qn+n/nGkna
	 MaGfMs84NbTIn2L5Toc53wEYjXTO2R/rCyJZyUs/ief/EmrSQ+q6loqJtYBRmulEXpod/
	 PIHfFgxBeOVhEiMPNjqsCkqlhYww/0yO5ao/+xz/z3tIPThtRUTCn4fKYxcpkTiRS00Ts
	 CiEKIU1Rs94WN/oIb2dErvJ/VLWZ4IrHyB9z3Csc5jO4397F5l/ep2w6X9FqZEG/Nsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PNvMG0LMoLVP/WGTQaZZL/2qupg9DLTHm2fR/RogwOU=;
	b=CYm4owy9tMPX8URbYKUjjM/+p3tmNrwbP1gYbUmk1Z3SCcH3W4ZiikLh0+r5KzXhE99t
	 u06QpAAwIQHEqK1o0sL9ZvRjvQINBB5wvhq2RAPNQTDxgUiKRTqY3dqb8KL/I5gwLeYSg
	 8Sqi3WVo3NYTxoN3ypJslOE/B78GVQ0v5z7xtPDATYPQs/mtzYoYHTEdyrldl6VtZpy/w
	 MIR7zh7kGcVppuWfi3JKMlFR7ERmeuOL0/lHo4RuXvMKSSRiPoCvForOqJuSWMvZhT/6p
	 jSlbbjcxBo26P9GJ//3fU492X3XENk751qnFL4GxTMeB9QvX33I/wfLsIkl4mOzoqQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4poF479;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BA606C658
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 09:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21BA606C658
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x4poF479
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso664256a12.2
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 01:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303086; x=1794907886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNvMG0LMoLVP/WGTQaZZL/2qupg9DLTHm2fR/RogwOU=;
        b=x4poF479wxwDgCDErfn59S+ztQPaPgmCOVEVOe9g25S8mKnugWPAKOMLse7ntQJOX4
         GcHVDW7afBJV/IxxgC4Y+YnH9SuRHA5bTKx555MyNdtKEoo02WnCXf174mo7wOiFuGcs
         F7ds/qyHkIcd0fEPjGPXztX00qfpLAuOJr+xsjxvsLVGnLnCZPHDN5IYzx0Z3yohp4xO
         MVBI4mpNcPcEllj+Ivw3DU/a/wjNgeiSZwzebEEEz4SvIo6E+0wCeoJA+8Eg517pOnwN
         CLj6hjSz01sxMNBIhUmOOwyQpUv3QdS3eZ8zwxPOVhjF+YhqelWdeuO8WJEfqNBIfZdC
         aw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303086; x=1794907886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PNvMG0LMoLVP/WGTQaZZL/2qupg9DLTHm2fR/RogwOU=;
        b=QXmg2SGZGM9g6BcANvARwrrHIP+I2fuaSbdu9WrYRslhyDqT/HnSFj+suXFBjie/ZZ
         AbL4EPbHBJiIp21tTbrHqWTCxFQbok1cAiYNVt8ONK8EhEvRCcHb7mbioz3ogmijgxIF
         WD1739OwaoRUYGfoNjJXP3/e+OYmL2hC9bPFmkhrINGNDlwMXpLcL0zCYZFgQmo0YXoS
         Wkg62DGdla7EH2iZL35Wyim3f2LKjGZeV7+fIYEt8eMTZVtWLLRXXZvzO6tvXNbbvwfr
         cn3e5MrWBbbkLjVDEfl7VaPhiP9V6IcbVW+Pp1pVnWC27kKNNF81xRXJvOghc10AtTDI
         3H2Q==
X-Forwarded-Encrypted: i=1; AL+hErHpvJiRO20i/83BPlknyRxc/2TgW8ARxYdXlyAkCfuy0D0CRcAfq1uT1GlFZ1MfmrOqNtMULlTvB2v6@vger.kernel.org
X-Gm-Message-State: APuU4Z9rcRdjEkwo5K8jho3yXBtrmqeiH6umItR5YsGxsYOuN42q7C/9
	GFAl8lagdVTFKL7MFJnY/G81pP6sDHovMDRCyQc3u+JrlOwbUJS6IN7B
X-Gm-Gg: AYBFou2NK7/joGnSX+v1u3GHl05vel/fKab68udoKAL563sRoc/vJ362xJJS3riuB7W
	aqwQSRWcf6B8VXZGSIyjxNRYpWMLni6Bk5W6IMifW/ROFF3DwF8RwVto3YzcV127hRgIiuV1MoD
	DIyH7nR1mG4BA29I2Nt0LyGHWH654QHOdWUjuusV7V1kIubrIX8lQksd/9IWmdEDgeFP+GLuOvV
	dP3CInUd2aLlAjWE+Uo1qg90UNrjTUgYp4uFSbdRl9QpYexRRHnuv66uYkP5/iQLOdjxFkvMHZY
	hOvXgSYMYZhUq+paszIes2REp3Au2t5YVO0akF2DbEshPlpzZ7S/yHeLHKwy5/k7JAvHJDQjJFq
	HP6buoYbcs15t12fcwTIYFb6KTUElXtoac9SG/35qAUJ4y3/CoK0YS1we5zA8DcM3eso5uMJhN4
	ECIbryVxQ9EqdYLOQWTGQNZh9ZffTIu+FVfUyyxQimDnEC+2I0lFaLS7dzdi+Ji6V00WdgdFxV1
	5xM4ZX2EKGB9xbPdjvsWtY5UQMU833LSpvLoML+FMxCR4T6tbXUU579s49CjzAaHuptZkrsSdNg
	PDgK1e8EerOd2wsVd/H50NFqJmFeoT7G6lziHwEvxzf1kuRVqYU0p1uKz2u9aBRXpSfeiRnpG8X
	w89PgYsaIbQ==
X-Received: by 2002:a17:90b:1dcd:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b166d31305mr2199901a91.54.1794303085812;
        Tue, 10 Nov 2026 01:31:25 -0800 (PST)
Received: from fedora.lan (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16913b050sm1115979a91.4.2026.11.10.01.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:25 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: andrew@lunn.ch,
	robh@kernel.org
Cc: gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	klightspeed@killerwolves.net,
	jason@lakedaemon.net,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 2/2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Date: Tue, 10 Nov 2026 03:31:20 -0600
Message-ID: <20261110093120.179318-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110093120.179318-1-artem122novak@gmail.com>
References: <20261110093120.179318-1-artem122novak@gmail.com>
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

The Synology DS212 Device Tree lists "synology,ds212pv10"
twice in its compatible property.

Remove the duplicate so that the compatible sequence
contains only unique identifiers.

The compatible ordering is otherwise unchanged.

Fixes: 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NAS devices")
Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-ds212.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
index 416bab50d170..8b5af51225c9 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-ds212.dts
@@ -14,7 +14,7 @@
 / {
 	model = "Synology DS212, DS212p v10, v20, DS213air v10, DS213 v10";
 	compatible = "synology,ds212", "synology,ds212pv10",
-		     "synology,ds212pv10", "synology,ds212pv20",
+		     "synology,ds212pv20",
 		     "synology,ds213airv10", "synology,ds213v10",
 		     "marvell,kirkwood";
 
-- 
2.56.0

