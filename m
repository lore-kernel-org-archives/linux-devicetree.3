Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33331D5CFE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791593333; cv=none; b=TV5495B3iMuEbwPEE+f+XNXA9q5ZVtHjg/hXJV35w8B+OyRr4T1qYCOLsQZdtU23xsPJS0hddI2kHk7zwR6Al4aa2+qLdH7/AFQqTBPkcrXGvakZo7CQkezNHbQbnMItK+sz7rpLg6by+UR2Kbm1NFvMO1rcbLCwusQPDqEXIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791593333; c=relaxed/simple;
	bh=ebpVnBIy+hnWB+VFuK747CkuGRFENohpUlisQzcondY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4nzmNvEMgKvaIpE3pYS26SD9ITaxUP/HJcBhbxLAgb9dH/4dpUmQWx8Lpw0366u7OkJNsewL8YnSaqbLZYY163kvkXR1J0kJbaoHPuBvnpmkBwEw+kNdViUH31DYZn2vDh5CineouoVKwZkJnBfHHRPzc8ByIcHcRn01tQBmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ENOs0Vmk; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ENOs0Vmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fa
	ux+tZRy2uLgA5HLcPYxm69xVVfboZqhcLtg+UrKKg=; b=ENOs0Vmk1B/ken0OCU
	pfjunLvqDfqb6QTDtEx1JS390GvkjHMHM7ZSeQ/U6JTPncV4N2H38Vp+HVVfxxpp
	hDjj8Rw+pOJzL12S0hbbay7AApUOmNskK9J+qew6QFu8tWX9e4YXp4cZCWv9cI0W
	J3bpqrTo0Jj0yok8pe42GKLfw=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wC3D3Rdi8lqW_JnDQ--.22135S2;
	Sat, 10 Oct 2026 08:48:30 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: ti,tpd12s015: Convert to DT schema
Date: Sat, 10 Oct 2026 08:48:30 +0800
Message-ID: <20261010004830.36014-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009144434.GD622105@killaraus.ideasonboard.com>
References: <20261009144434.GD622105@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3D3Rdi8lqW_JnDQ--.22135S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw47GrWfGw4UJw43Xw1kXwb_yoW8WFW8pF
	Zxtw17K3yDJrW2k3ykAF4UWas5Aw43CFW2qrn0yrW5A3y5tayjgr9rt3yFq3Wa9rWkWryq
	9ay0ka4kZ398Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRd9N-UUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-x4HfGrJi16qTgAA3I

Hello,

The v5 I am about to send is not a re-send, and I would rather explain
the two things you both raised before it lands, because both are fair.

On the flooding: the v1..v4 postings on 2026-10-09 went out within ten
minutes with no version number in the subject. That was not four
revisions, it was one revision sent four times by a bug in my sending
script. It had no record of what it had already sent, so each invocation
sent the whole queue again. It now hashes each group and refuses to send
the same content twice. Sorry for the noise.

Rob, on the schema points, both are fixed in v5 and both were my
mistakes:

  - the gpios property is back to "maxItems: 3" alone. I had added
    "minItems: 3" and a required entry because sashiko flagged it, but
    as you said, dt-schema makes the two bounds equal when only one is
    given, so maxItems: 3 already means exactly three. Adding minItems
    was wrong and I have reverted it.

  - the two ports now reference "/schemas/graph.yaml#/properties/port"
    with the unevaluatedProperties lines dropped.

Laurent, on the wider point, that one-at-a-time LLM conversions cost
more review time than they return: I agree, and this series is the last
one I send on its own. The remaining text-binding conversions I have
queued are all device tree, so I will send them as one group, per
subsystem as Conor suggested, so that the same class of mistake is
reviewed once instead of fifteen times.

If the view is that this conversion should not be carried at all -
Eduard Bostina posted the same conversion on 2026-07-30,
<20260730092245.52034-1-egbostina@gmail.com> - say so and I will drop
mine rather than add another one.

--
Chaosheng Qu

