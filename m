Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D911239A056
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 22:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791672620; cv=pass; b=OmfUe1nFNfRO5p82Ox0iUR4PDNxb+3H2qa/1rs69G/fPE/NkDm/74BsLJW7/RDG37d8JXNGazkODT583zb3eaJzCUotrZJXSWn+uWtkAYy8GLHlsc11RiujBRKcRvuDmsX7QAt6Enhg2LdEmhhcqfSugXM5DCJae3UquLEXN8fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791672620; c=relaxed/simple;
	bh=/TGtMgniuS3mQKYDREuxXcJmASBlmgeqI+YDGfaVpmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ooBO+tkWUc9tpAIp4BSQIMvosFQHn0Ysy6FxUu8tjLio7P62NyMnDpgqZX/fULMO5swObugC2IdquuA/fV1bNpKoQwoJMv7Wy04Jep2pKa3ZgyX1pL1TP43/N4Zde74culPqbz5gZmFvAiq3MV6ye/hGcRfih3bVNCvcah4uamA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=PhthF4Xg; arc=pass smtp.client-ip=136.143.169.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="PhthF4Xg"
ARC-Seal: i=1; a=rsa-sha256; t=1791672597; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=MpbC6YaAXJ6ZNcmFbwJwYsNmqDcQsV0MyFag9pKm4+FGknfPQNkdehAuMlducJQz2ZfKXrUoe2ntzW4seBGz8c73iXXi6cDNas1mxDb5BhmWThMa06IDUsS2VAL6takhEVE/WmArPLW9tTaMOJZYoDP+Fup8JMyMocSLbM3lfYY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791672597; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/TGtMgniuS3mQKYDREuxXcJmASBlmgeqI+YDGfaVpmo=; 
	b=CUgWOBpNxqBiDyuu4/+1PeLG9rMZeW85h4g6qAuJbgjHwEmH8PLgjFJA+HUFBO/yLt2FzrsMDF32DRlQp4vjySMtMtH4QqcHdGDU9fYPsl88fF0EhwlYw2zwD+VpE+eP+MK5cqKe1/FL7hMy1awQM7B7bbWiVJLFEGbDxwnWrmc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791672597;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/TGtMgniuS3mQKYDREuxXcJmASBlmgeqI+YDGfaVpmo=;
	b=PhthF4XgTWH6vxfA7VwErTZYBbUlzxlCikMwHRqz46Q66fd/SrGzLQOjqvm9mN1V
	tN20To9UkV931+j+NJrMofVBkzs6eXFJeTHds4VU925n+TX+6XCrjFhdBKXPQ66IXMw
	fcEsVNiHt8NAfLYriAU0X7HPY7H4BrEjDnj/MHGA=
Received: by smtp.zoho.eu with SMTPS id 1791672594264277.8783341912497;
	Sun, 11 Oct 2026 00:49:54 +0200 (CEST)
From: Igor Velkov <iav@iav.lv>
To: sashiko-bot@kernel.org
Cc: Igor Velkov <iav@iav.lv>,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Sun, 11 Oct 2026 01:49:52 +0300
Message-ID: <20261010224952.1116479-1-iav@iav.lv>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-166900@kernel.org>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv> <sashiko-outbox-166900@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this regulator definition need regulator-initial-mode = <1>; to force
> PWM mode?

Tried it: with regulator-initial-mode = <1> (opmode "fast") the GPU
faults from the start of the run, with hundreds of js faults
(INSTR_INVALID_ENC), job timeouts, then "AS_ACTIVE bit stuck", on both
boots. In auto mode I get two timeouts in three runs, and none with the
Armbian DT in the same mode. Not adding it.
