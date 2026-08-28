Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77E45FFA2
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925588; cv=none; b=BH6L9yuwkoEq+006Mw4ULQoDd/XjIrxtwmawnBZ7zXCpx5QXS079cyge07EvoPodE5DTSSM/ebuTrrBgbTM3dZHMfsfvg4+w0zH0Vj1AenOZfCSTUDsFbm77cQxofLmXYwe76J3UhnkUTSsksqR/exXsmCEAgfR+ETMVKiW5wps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925588; c=relaxed/simple;
	bh=y6KuGFmXIEB/zhRMWuseJanpRZIxUWUxZTjuXV40lYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQYkPkUoEtcO+5UGc6K7iTH9FucWcmWrl2i2l/N56MfKCYUGNVDjUDedGXyX8EhWjzE1lUStoveNII+oH993am01hH+jKCNiWs6xWj3mlHUnTj5IA4mxRVauHDPh5tkmC9LhOzf7V54KV6ZZQwtiAkWE9R+TyKIrCLRqgXiGNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRZHBrqy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRZHBrqy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so626065f8f.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787925585; x=1788530385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqZUeZ9L8VF1vTIFkMSmSiqi6T/ciO8jy2NnvOaW+Gs=;
        b=rRZHBrqy06/FSihAk8fQW+ZuR6N/kVB7UlDLwIOUQmZeN3vo2zI0TQQ1Sho4WZBXDk
         MlOLzOmsFlm+abqx6R7cdkbM/CwFQ7fHggQ2JlJeXoS9EHjYPkE6G29vwweatIssaJrV
         4HNneAY0C8v7+/7EMRAJl6kqEyZvA4zzhZY97XS1xHdV5+wPZ8nEl/OoLSAeV+rWqlVg
         AoGAGJv3lcBXU/mfZW+fmtx8M6MyVAUsfQNTSdRCn4SvfoYxCM5NX1Krz1tFE1qAt+XA
         sEpvjEJAQ5L+c8xazXUEr1IQ9pFXnJhKGsUyuBTUuTmz5faTAeynvTn2RhDo7edVIoaB
         sLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925585; x=1788530385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqZUeZ9L8VF1vTIFkMSmSiqi6T/ciO8jy2NnvOaW+Gs=;
        b=NTTFnIDttEpa5geMmM4Ae9nIsvqtkmq6WEjPklwl5b+HH3wMJFy086jChjvGFgbcW+
         mUWQpkZYFwSlZgn9eTQo7+gXGFg87USNnImetqSfMtXRicatGzIditPx+ZdKchQteHEH
         9SV120agCQIz7sIUKMkniyLi+C1V7ezjmySweiIcS6BOWETwuO3CHE2wDEzWrfhG9neC
         Ol2ipyNmZfcahGJu8B6bWaG76JAWPku+jRl7jHaiQIUcloupW3E+YkbB7LLgib6mCfKO
         iMb2hFYzj37fGjAPYiw4LqMQlSfZHcNmmGSksO83TJYCZIrrYqy3Bb4NPnYyXFV85158
         TmtA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9/kcqvcvvNvqnaA0d2LFoaP1UnCjBqOSvzxWgEXc6uKNd7I99ZDzKtCtlIRvFNKz7pCPkgco+9N8B@vger.kernel.org
X-Gm-Message-State: AFuF++nePg1Ot5Bfm8d0Rhd1odO6FW9n5XbV8ojEr5hYgUnPh+DndmyH
	S31g8OJATazT0gvda10504Cq4hKbavnjPV8qBsA2WYAH+7DPY7+gNpZBVSFKnz2uwSs=
X-Gm-Gg: AR+sD11pZuNGUODRiZwYYAYKL5G33UXM2LbEnYXn5DoZ+qApWxs6KRPS7kgfiy6/9X/
	F628IuWF82uCJpMSEzyv33c4Rls1EK5x7WWTQjF3jF3YHa1nlCZhXwjXzUWgq4lKMwdhPVAAneE
	i+H07EvDdb/37LrekQNZZLfmzR9uQtGIlZyG1PwjOC48BCqridCZJPt0I4wa90Nq48awBUHhFQZ
	ffuWniLibZ+bLTsIGanVTrZcu6llNDRrAo/64R1zoiHFouyqv7ZVZbBEDjvS+x76dl4M7qf8RMY
	+D5pQHmZ1+rl+PRlF0AMq9DVnQ/0kSVn8DfxmHNS+Ae7ajwhdMJpH4vlcP2iNTXnIZEB+o0yASS
	Xcfgsd6k0sBlDh7VjBROsTm2aQc1XN+Sy6vxM778Csod+S6fuadtdQj8TEb4Epo/DbkFyCgyu2D
	wTFzQiU9DslIlQoufxg11+8GXiUevsaNgNuxeT8dwALdRXz8U0IyDq74rJl8yvrXGlLcv6OcLqe
	YcoD6oVomcR+r08DW3UXae6IN/xQRMhj/oMAUHkUzl+0hy5EAVLtGfUFoiV8yk2T2IRPi1idmR0
	B5x5hguMfW6q1DQ=
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-482f7828315mr10404375f8f.0.1787925584957;
        Fri, 28 Aug 2026 06:59:44 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbad08d2sm5220828f8f.16.2026.08.28.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:59:44 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:59:41 +0200
Message-ID: <20260828135941.23605-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828133537.C61EC1F00A3A@smtp.kernel.org>
References: <20260828132104.21473-1-robertbozik@gmail.com> <20260828132104.21473-3-robertbozik@gmail.com> <20260828133537.C61EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Potential NULL pointer dereference in ov32c4_set_format() when
> sd_state is NULL.

I checked this and I do not believe it is a defect here, so I have not
changed the code. Please tell me if you disagree.

The mechanism is described accurately as far as it goes: check_state()
only rejects a NULL state for V4L2_SUBDEV_FORMAT_TRY, so an ACTIVE call
passes the guard, and __v4l2_subdev_state_get_format() does return NULL
for a NULL state.

But that function opens with

	if (WARN_ON_ONCE(!state))
		return NULL;

so a NULL state there is treated as a bug to be reported, not as an
input to be handled. And 37 drivers under drivers/media/i2c/ assign
through it exactly the way this one does, none of them checking the
result; the line here is identical to ov02c10.c:712, which is the
driver this one was modelled on.

So if that path is reachable, it is a core problem affecting all of
them and the fix belongs in the core rather than in a new sensor
driver - adding a check only here would make this the one driver in
the subsystem that does it. I am happy to add it if you would prefer.

Thanks,
Robert
