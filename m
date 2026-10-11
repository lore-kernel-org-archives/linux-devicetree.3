Received: from mail-qk2-f5.google.com (mail-qk2-f5.google.com [74.125.230.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700114A60F
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 00:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677493; cv=none; b=Qbg2QrDcfI4pynuzdZqiRYcZ/Q6N/hawX+UILxevNfqXWD5BnAZj8h3bXo4TJfGFk72ixzmiRVdhkBuIBY9/JK/Y+TM8pqnP9iHCp+bBf0d+mvi9QpRfsEFPWaUDEfzh/+z3QA7ohTapt9OdR/bDAZEqEym5vL8htVB7YMBnAAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677493; c=relaxed/simple;
	bh=m2qc5bzaGhp+P6plEuL1iHjdBLdQ+Od5wxhJthpXIyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+qnrR7H8A5AVROffU+qaSsx9hfeqNKZeFalpHAAp8Qce4Uwhd4MyU9MngSWlGQ3woHWBPW4TRSPMVzhykH9bosTvtT9ZZHay/845AJ4UleGgCZFFPfRYWzSjG4J9HwO0keKi8LBEGiAz9DJiU+9DAH2AnmNNL5YozjuV7/5VMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lo2E4Z3X; arc=none smtp.client-ip=74.125.230.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lo2E4Z3X"
Received: by mail-qk2-f5.google.com with SMTP id d75a77b69052e-5337b59ef7fso6350091cf.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 17:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791677491; x=1792282291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=;
        b=lo2E4Z3X0B74U3SFCkbqANSbBrJv7T15GOZ9F3AVAnYlKw1tHQaX3gbaqsKXma5hUG
         ds09J5WtI54C2hIsixhH0hPBOQ6Vyz1aL1D038/Ef2W3WCj0ZyzI4b+xcyjDKQ4yBfmQ
         7ihdkbLqmyMswolEShpLwK16zMLSobIeLrkD4I+K46XEygN35kr6oYndQMaeQX0YBokV
         FxHDas5MvD1fZTx68S9cZXyPPuVEcxg+3hGmdXuqXjCUNLTdSPquEw8igoBvaS1V5IKH
         hnnB0hVewYKFbf5HCjzKR1xycGlJnjnGvpnMQlm7IChMnsBTAlm7Q69EJAp8ZVZ8SZuW
         VFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791677491; x=1792282291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZSFox7DYtsZr6D8rsT6OanL7ONG4L1d4OFVS1wYXN4=;
        b=OjkvRm8+DOW8coHnioJOnGnvgsyYHRli1euAhFsUZR16ajEZy6MAx2ZEYCxZdlA6Vp
         vdTpu+bL+40VtE5zIxIeacaK2Hfj+6zrhwMaY250Sgb3H/xe9EqBbmdGKbk5CIQNodzT
         gxOmvfJWgIkVdWKeu58E5cWhl9oFnvaqdFx4p2Ku/b/uW24NImqw1C9UKrWLfqkRmUBI
         GGxVmJ4rmW6tiMekzSI1pgMbR/VBhB/+I79HOgBTZwtlGIOqDz0v4Ai577DEc39l3cX3
         UsWEU1BgGufnGCjVg/O+j9ppExdAls3qGZgPtEaA/5UiN5DQOq8bJ9rP+03fOdoU2Unq
         +wsg==
X-Forwarded-Encrypted: i=1; AKwUvBxxWs7tazh7f+5S6+Fvezog7FD3hxOtbzNAmUj8pB7wMvrayk/NgTcynvkZfM0Vq0v9OpQ71GQeUxim@vger.kernel.org
X-Gm-Message-State: AFq9FYLj6xI3yWdoYAKFMWVYyUmkm1wJMTi47r76BEzeItuyXCXfH0KT
	K88j2g0Mh6m28CFh8X0NwEQv52ahRAHo8r4zLDrKNFLwB7g6HH+NuK3n
X-Gm-Gg: AYBFou1Num1kWXOcErXkFzIekl1nA290AFimxe1RUuvFX3NOJYXRiAQRrRiXYRdkJ0E
	VbRoMC5bu8lRinZBek74M3dZdcKHmROgEOt8kyvJQGuFmf0fgL1eB9Gv3mpYP2kIrVWL4OWU5Vn
	APS44lyhGS3C2VNCiXzNP31YDtcvhNV8Z6+ffBcGaKVNah52vE2LfMAD4EvL17zMaOPte62f6/g
	9FPuXlPTrY6AJsSrq6XE6uVAbgBJ3QZpTJpH20b8QqKmcc0rIBuDQxCBEEP/Q/boRhNQzZ9ZabV
	w4tpk41LffO2ddJ4u4JdZuBYmjEv7mOOhPgFWNOAN7nVFbNdhbhjc/cTkeQYggtHxAs6gx4tPN8
	ilQ9ZVzre2Vvkr+4H3zFNBzfTnMULkBiArbMHocyQ3Ocx6Ziya4wvmAbgNOHrPhDyplDPiuXYz5
	uJ+S6SOnNI0OJ4iZ0CxJjkMjuFxGObjBpbk00iJPVJ2JGR9kMMCUWw6ZbuzmvNVgHrI7OYqTOM0
	dBE/w==
X-Received: by 2002:ac8:5a4e:0:b0:535:341c:e2c with SMTP id d75a77b69052e-5359fb8f878mr101828041cf.39.1791677491408;
        Sat, 10 Oct 2026 17:11:31 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e7f6aesm57217596d6.2.2026.10.10.17.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:11:30 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: "irving . ch . lin" <irving-ch.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <mbrugger@suse.com>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Qiqi Wang <qiqi.wang@mediatek.com>,
	sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH 3/3] pmdomain: mediatek: Add power domain driver for MT8189 SoC
Date: Sat, 10 Oct 2026 20:11:23 -0400
Message-ID: <20261011001123.1092269-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
References: <20260202064820.347550-4-irving-ch.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Irving,

Some findings from running this driver on an MT8189 Chromebook (Lenovo
IdeaPad Slim 3 Chromebook, board "quigon"), mostly around system
suspend (s2idle through the SPM), on next-20261008.

1. MFG1's EMI GALS sleep-protect step, BUS_PROT_WR_IGN(SMI,
   MT8189_PROT_EN_EMICFG_GALS_SLP_MFG1, ...), targets the EMI config
   block (emicfg_ao_mem at 0x10270000; SET/CLR/RDY at 0x84/0x88/0x8c),
   so on MT8189 the "SMI" regmap has to be that block. Without a
   mediatek,smi phandle in the DT, the step went to the wrong regmap and
   wrote INFRACFG_AO+0x84/0x88 instead, which was one of the causes of
   SErrors after resume here. Giving the MFG1 node
   mediatek,smi = <&emicfg_ao_mem> (a syscon node for 0x10270000) fixed
   it. It may help to document this for MT8189, and possibly to fail
   instead of falling back when a domain uses an SMI step and no SMI
   regmap was found. (access-controllers would be the modern way, but on
   this board fw_devlink then delayed boot by about 10 s waiting for a
   supplier the syscon never gets.)

2. DISP: at runtime it never powers off here (MMSYS, the mutex and the
   DVOs have no runtime PM), but in system suspend genpd tries to, and
   the power-off is rejected part way (genpd debugfs idle_states shows
   "Rejected"). That leaves the display's memory path blocked: after
   resume OVL stalls (no vblanks, larb0 stuck busy) or the display
   faults with an SError shortly after the video unmutes. Marking DISP
   MTK_SCPD_ALWAYS_ON works around it. DISP has a single bus-protect
   step (MMSYS_STA_0) while VDE0 and VEN0 have two (MMSYS_STA_0 and
   STA_1); I don't know whether DISP needs a second one, but something
   in its power-off sequence doesn't complete in this state.

3. PCIe: to keep the Wi-Fi (MT7922) up across s2idle, as ChromeOS does,
   PCIE needs MTK_SCPD_ACTIVE_WAKEUP and both PCIE and PCIE_PHY stay on
   (we use MTK_SCPD_ALWAYS_ON for both).

With these (plus a cpu-s2idle idle state in the DT and a few driver
changes elsewhere), suspend works: repeated suspend/resume cycles pass
(20/20, then 10/10 twice), with RTC, lid and keyboard wake and well
under 0.1 W asleep. The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy
(port/quigon/patches/mainline-mt8189-suspend.patch).

This was found and tested with help from an AI assistant (Claude).

Thanks,
zoan37
