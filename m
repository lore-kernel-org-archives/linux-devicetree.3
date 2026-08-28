Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32771367B9C
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931309; cv=none; b=p8nRtNhyngRK+3aVmJ/BCFlBfh32yt30ri99AHWE8xrBOjciPRdTNok5JIFauoAxYn9M00PHcEHNgJJ7i0ZmjLGfcmKYiB4o4EfPVnKiJYzbTCwLog202I9GSJTACa41da+kcD1Qkjlvx8mjsq8qs9AFku/FShgsINT42lPM1IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931309; c=relaxed/simple;
	bh=+6KGxcGGDwc73riwb5otRlgUrSwJkffaC6ls1E91zck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jf6UDQ2k51k8YxCe1ZPdeFFJFKfxLPIXB0O2ADbl2LVi535xkdcYi5dhQnqdhyFBS8Lr+yurOm2+tumS2De7T54nfcvifzWMSVePUOsyJEZ38o8CbZ7cImM4EX621lhBoy3kkVafC4S1yvm/fx8cJQDYFCGjVYq9jbndiuQRfD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ig8K9w7d; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ig8K9w7d"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso13667865e9.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931305; x=1788536105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaOfa8z6OMzLtYhT5SId13Mw9otf98/zrSeAtowlsB0=;
        b=Ig8K9w7dkZp2wti+wQurSX1ZrOfJh0J7dXpwjL3e8IFY0MAmi5A0gdmPN/atFJIufU
         3IGLbSNpTk8uHmITSJWSBX88IjSX3et0pNVXR9qmkdJzm9WjD1ye6dvbtg5u2fvvs8H7
         re2WGSfEMJQZGA1nMJmKfV2mBiIKSHIjhhqiuxZpq9OT8G0387NClsINRGokoPvxHb86
         e+mOmLmOZRuCMiujts30PSRrKQZSRoBRcMZYpTXKV/NO8gqDx2dCwCnsnl+H0KrsntaZ
         GFDpGQOHZ4zlBN1eE/v1ujUa4lTzBZBmp5NLb14P5fqZ12FjMQZX7qf2eNv3sy+lUZ8k
         oByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931305; x=1788536105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaOfa8z6OMzLtYhT5SId13Mw9otf98/zrSeAtowlsB0=;
        b=hlB0kglHDPE5SC5fuLOTk9vJABWRah0jrtezzZZnlFYta/J8SKWDFvHzpN3JuCYM/G
         Dwf76VT70m1oB3Fw3g969f5R0gGpnin70KOphL+LJiG1fnKIL69MtTvBs36hnA8cDrZo
         m0mbru3zSiriejpeCHsNXbQkxgt0hQ4TUTzMuj7KZ4BQ657lqoTqSBbLjuJD/UxrMBz6
         LxhdpwD6wwqtULN2urYH2kQkCzzVz0Xe13AVWNqVtp3HLX/kcZAnQHgjjGCUl49k/odF
         7CV/FBrV7zE/CO1Egpu3uIY0izzVkEQV1BBJsLUOwGdE+H6JExOt4QYQwyH93HAehjas
         JNgg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtvql0xXcXWGvjLqvd389bDeBMs2ZqLmw3KOU+0A1EvjGbHtoQqgAI0DhgNl0u6jrJjjWb4Ld1tCdo@vger.kernel.org
X-Gm-Message-State: AFuF++mlYruq6M0VuEq1m63oTUCjCqpCbJ78yNY8rcAEBi8vtvwA+lR5
	CwvAk565q98sISKLBItdGqlJX3KVDlF1Itt85KCy544d2zUjXe9yriYd
X-Gm-Gg: AR+sD12op5wdeTQt2EDbykSWUKgryEcjRVrZNIx5mkszKkd3gbk+vblklSMT376NhBq
	X/pYhv2q3mJuCjuUNP7p6FGHhH4shVgS1ud5aCfWzXBfsDzInTzUyPceypF+WyahoF26zwvwIQH
	y65w0fjhCHOFdOQ/JQOck5CmKxJxlTrtVsovAGshLxtuwX0SgpTTF6poe4P2XqjPaFMsyBjn/gZ
	UhHaAaDvnm65uT9eG1IY/1gcr8wmf3oJxqBmj9QU8gklD+IBsz6afzaxMXSTdbM1KgIT7FmuyBF
	yNZaDSUxASiJTV1BlPf3up9Qblax8/RZf+NNOOS7LFHAISmgho0SPOgM+buIv6Gh6PkrxfNyDyi
	xJxIPpo68MP7MmM0hmJEyNzp5VZ2ps4lI6Yf2Ng81SaJzuq1ir3zkfDeqOsyEcIf/psLmDVKdXP
	4wPGD5R7yBz3bPzpy9dZshJ4mucPwkTsgfxQOPZb+mqwgpw8ncTfmZZw4Nru5lYC7h185DfbG6Y
	TKzGUevyMtHVMWcWYLWHTOsnOHof/HxnEBa6DpSegGg+Gia6+3Lh1rheHVCj0qVHIXfNoOUODuD
	7aVttsygYv8s0A8=
X-Received: by 2002:a05:600c:3e18:b0:49a:77c1:d246 with SMTP id 5b1f17b1804b1-49b91c4e073mr129859625e9.15.1787931305285;
        Fri, 28 Aug 2026 08:35:05 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm4453038f8f.5.2026.08.28.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:03 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Fri, 28 Aug 2026 17:34:59 +0200
Message-ID: <20260828153500.31556-2-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apGn9PvuUw_AODd-@kekkonen.localdomain>
References: <20260828132104.21473-1-robertbozik@gmail.com> <20260828132104.21473-4-robertbozik@gmail.com> <apGn9PvuUw_AODd-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

> This bit could go to the driver but the IPU bridge isn't the right place to
> document this.

Agreed. In v3 the entry gets a plain

	/* Omnivision OV32C4 */

like its neighbours, and where the link frequency comes from is
documented in the sensor driver instead.

Thanks,
Robert
