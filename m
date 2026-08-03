Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84F23264E9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771889; cv=none; b=GSWhoGhX/Y9Dc0UMtU32d48ZUIerg3/wbbbyteP7AH9D67iZo+AqNfUupBSwqiPn8RqAhlebbHEpIyZAAEmLVnoTcVKrpZc8dtxpbD/PtcYcjuTHxo902baqsym3lBesAGqjSrkhOKAxqs4ZDTdehqmVF1OINT1tCBZnf53D8UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771889; c=relaxed/simple;
	bh=kP+4wsvp16N7rG3Dioz7/r0IESK3HqsuuFrTk5zhtII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7e2pIYnsz5WZBUntBKTtIHb5BhY+UAzeUa7dAs0o1e1RQ5TKljY74cB8WfPq1k9UzRolWA7zUWqtb8WvH+L7w8p2MAkfT8bX4miUW2KkgEKJI0xKYXQFZ9MW9lx9bpOjZTULVSke8wF0256B/1XDoO51kbLI22Sz8ZJ31wn5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppjItpki; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppjItpki"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49544f26c43so2420775e9.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785771886; x=1786376686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brpCBQVGbNrDVt7cTfK+56VzO28aZ7jJCm8ldakLLGM=;
        b=ppjItpkiKMHQirGnus+IDnP4Vxc2+A1vjLr+YbvL9+Z91Jzal90onXhUFtlhjqdBDS
         MWR5bYf3EZ0UzKLJbWV1KYlhjBFtOJqol9CBqIRR7Onokqiphehwv7xfbQnKJphqAprB
         wqCe5H92L59rLjaJmefRq7pNjdvInN1WvT7QBAEsrtCz1LGvALAUXp/NCJmrZM2844kN
         bzrcFtTqV85+85d79GXH0HF3gsFkR/Th8IJ9Eooy13kn2iTiIuc8ayGwTROIB9zINyW6
         RTGF/ZP1XIVyWXqnupnchPazPYlzy7Q5vtk/utoxjXCKiZk1A43bTZnxZo5I4vUvF9c6
         4//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785771886; x=1786376686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=brpCBQVGbNrDVt7cTfK+56VzO28aZ7jJCm8ldakLLGM=;
        b=a5iAar6KNFxPr2Y74PZhqXSPAtbB3Dq5x4jLHnF4rFEl1rdRQufImspoL1CJQeTD4t
         pDwuGZLm/R444AbJH1F3yT0hPKxqoOKdtVp1as8NUlKt8Mfca5JcoEWoUKZmMWuft6gt
         uKZYAONiIV0y1SlulpTduJpJQa1aItskLIFCSeB4UawxgUamxyV3SZ1/dzcUfxblHi/m
         wK8p5eDIaiFFSL4MQiFuoY2wugIfPzl3UcuOdCCwNfPo0S3STIwwz+Q6FVW6cdSTnUEk
         mlARmZQQ8iFriHMQczW84dDxFYNhgrCLQE279IPYXiUyWCgrilVHBrcVDJz2f7UowW4J
         UivQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/804qdmUV7JI/QAHw03m956zC+B9qAXWwhiLlqEjGBd06z4suyx9skj+gzZW3vrAKzIDZNP9PWUs2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkixlBA0yCRSrixejxCpfRZeTrPGtV84uiSSrjCJcPV27PGpA1
	u0bQz3AV+OQDshX0YcZOA4613bgEJlo5GiNusO1AkRWxp4WEoQcUVqQ4
X-Gm-Gg: AR+sD11VJ4R/op5P9d9mH2seACaa89uwUBk/bnKMGlITTGguq+0uzrI2RCpNhDZ1zsc
	AXSkB5dCczuZXtV1Mc4k/+4Bf8fgoYXnKpXTmy7CLwo+zH3EJgfsGHVBASK4BPgN6LshD5uuJYA
	uD7otu+XYRnk33iu2PbdMSc6V4dnNcaumYnvhdaeIY2keMpxdU+yMV+NSd/LMb0aZff9jIRYxc3
	0apOQsgesfhfxjFo5O6RUW5RfLH5FceAhcywR6wVwIjBdBjc5pYNu2+EUge3CiPvKh/KfOqmi0j
	FE1W6zQFIz+PTiOzko+oVnnonXMfFWJLjKA8cFgiEi+ynEeMQpqk0xqSp1z1wXyI8HCalYrM8NC
	Gd5mgmmXHss+2wl+ZqQ7SFHQypRK0zKMnYI+4kbCGOXCtd/dE6rBdYREUoeYuR26KdUEnWQS/9v
	9g7D9NxaxLFYKOBUpLui0M+HVk0FII62OUTENW995yl5M4vmPzlleLNJmCR7IV9e/oHrWf1QGK+
	O/40jEqTrm0cRjVQG6RmzHM1ZD0Vh4jzz/544nkcSVrQLYRphbXQjL5HBXA3jHVZh09
X-Received: by 2002:a05:600c:1c11:b0:495:7561:a9cc with SMTP id 5b1f17b1804b1-4980c6aa664mr130391355e9.4.1785771885581;
        Mon, 03 Aug 2026 08:44:45 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B85F300A5CC0DBDABDC4661.dsl.pool.telekom.hu. [2001:4c4e:1b85:f300:a5cc:dbd:abdc:4661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm233512265e9.4.2026.08.03.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:44:45 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	krzk@kernel.org,
	will@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v4 4/6] accel/rocket: add RK3576 NPU (RKNN) support
Date: Mon,  3 Aug 2026 17:44:23 +0200
Message-ID: <20260803154423.12175-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803094125.3285895-5-gahing@gahingwoo.com>
References: <20260803094125.3285895-1-gahing@gahingwoo.com> <20260803094125.3285895-5-gahing@gahingwoo.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jiaxing,

Thanks for the re-spin, and thanks for asking about the tag rather than
carrying it over. I went to re-test on RK3588 and stopped at the diff,
because patch 4/6 is not the fixes-only patch the cover describes: it
carries your debugging tree with it.

Diffing v3 4/6 against v4 4/6, rocket_job.c goes from +55 to +306 lines,
and 202 of those added lines are the ping-pong experiment. It brings in
five module parameters that were not in v3:

  state_init  (rocket_core.c)  - default 1, i.e. ON
  sptr_alt    (rocket_job.c)
  snap        (rocket_job.c)
  pp_clear    (rocket_job.c)
  sptr_dbg    (rocket_job.c)

plus rocket_snap_take() with its ioremap() of a hardcoded
ROCKET_SNAP_DPU_PHYS and two kmalloc_array() buffers that are never
freed, and rocket_sptr_patch_regcmd() doing phys_to_virt() on the
IOMMU-mapped regcmd and a hand-rolled dma_sync_sg_for_device(). The
comment above the block says it itself:

  /*
   * EXPERIMENT (not for upstream), 2026-08-01, following Tomeu's
   * suggestion that the block is stuck on ping-pong bank 0.

So I think the trim simply did not catch this hunk.

The part that matters for the tag you asked me about:

  rocket_core_state_init() is called unconditionally from
  rocket_device_runtime_resume(), not behind core->soc->poll_completion
  or any RK3576 check, and rocket_state_init defaults to 1.

So on RK3588 every runtime resume now writes PC BASE_ADDRESS = 0x1 and
the CNA S_POINTER 0 / DATA_SIZE1 / S_POINTER 1 / DATA_SIZE1 / S_POINTER
0x1e sequence, i.e. the RK3576 vendor init replayed on RK3588 silicon.
That is a third change to my board that the cover does not list, and it
is the one I would have to characterise before I could put my name on
anything. "RK3588 never reaches either" is true of the two fixes you
name, but not of this patch as it stands.

The two fixes themselves look right to me, and both are correctly gated:

  * rocket_job_fini() cancelling poll_timer and poll_work under
    soc->poll_completion - RK3588 has poll_completion = false, so it
    cannot regress here.

  * poll_work_seq / poll_seq in rocket_poll_work_fn() - same gate, and
    the stale-work window it closes is real.

So: send a v5 with 4/6 trimmed back to the fixes, and I will re-run the
RK3588 bench and give you the Tested-by on that. It is a mechanical
respin, no new debugging needed from your side.

Two smaller things while I am in there, for whenever the experiment code
does come out anyway:

  * rocket_state_init is not static, so it lands in the global namespace.
  * The two snap buffers and the ioremap are never released, so with
    snap=1 that leaks per module load.

On the real problem: I do not have an RK3576 to poke at, but the shape
you describe - one configuration byte exact forever, a second one
computing nothing, the pointer reading back 1 no matter what we write,
and the 20 KB snapshot differing only in OPERATION_ENABLE - reads to me
less like a register we are failing to write and more like something the
block never re-fetches. The regcmd is DMA'd, so the interesting question
might be whether the second configuration's regcmd is actually being
read by the block at all on the second submit, rather than whether the
bank flipped. If you can get at it, an IOMMU fault trace or a read-side
counter over the regcmd buffer across the two submits would separate
"fetched and ignored" from "never fetched". If it is never fetched, the
bank is a red herring and the ping-pong work has been ruling out the
wrong half of the path.

Happy to run anything you want tried on RK3588 as a control.

Thanks,
Igor
