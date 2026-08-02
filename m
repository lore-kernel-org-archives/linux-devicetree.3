Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537403C0624
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 16:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785688094; cv=pass; b=AfhAltOehWYCzjPDW5RYPJtNZkd1vxW23Fr7sL2hod22Kg/631QEK4j4lBaMLy66O4jze9WlFfkYGBmC0GwluYi9+toynkrAxNAIXxX4Nvp0r0MQGacv/OsVX/VT04SxKhjZr/ynHzs7oYTDnBI0jLFAWRm7pFLm0MGr0wMOX5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785688094; c=relaxed/simple;
	bh=3RRoxVdVTUCeu24UcHj/mykL3ggbS5JKaLspYh6bYnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzGXtHgnNlURQIIf/R0XRiUMc3hktVgPljCy5p81wkvIvOAYo8CR+BuVVJ2eRMDNj1sGC0ZqiP8vyIEAt79g4BSlAdnLU4X0I9IsvqnnMe3MCNXPstV4zyqxg+F+9+YZ5zvmwhfCptM5tep7G6hCDiXQVXohTuWJMnndwJ1TQsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9sKqDdx; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9sKqDdx"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c9107baa7so25025141fa.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 09:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785688089; cv=none;
        d=google.com; s=arc-20260327;
        b=cmzBkvwjaPK1lbeYWZEPfGTQwcjL/y2BRnwx2dZGspHsVUgqGvaeQ6o46MTlryuIYA
         zwV8YkwoW+FTa2qV/hIrY/X2gXVc/7Mk95YjsNJB19Yeyavrg72nl9P4aEMW/NIKABTN
         pracubSC0zFSH0hvcK82FMDRByvuy2ILSA1XXuaTyUp029ptUJtbzwstc4tkw8ew+zcL
         mSnyVyJrDgoE4PcVrMGhn3ZGyH+pRn8OOcz6BviA4i98jPWQ/JHR1br/Nz1+ZSQFbadJ
         qRqymvqKbmzap9mEFkdyifewo3iI+jyDxp91IN5BpmbP1E9snitD3On59HSK4exTvtrU
         HwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3RRoxVdVTUCeu24UcHj/mykL3ggbS5JKaLspYh6bYnw=;
        fh=uLGadxBNSpELbZD24zlXQaH271jL6W/W1Sqrc2DVb70=;
        b=YLNSS9lWWu46HfoAQfORy4piB5J09THXSZor/3ItTti8PfiAqO1yZXngUEB60TARHk
         AFFBJ2CzyHYZjMKt/r+oHP+pfYEcAo49HdDaVdYFwRb51UTKfWRW3a2dHmof/szKN5rx
         2ZCciBDapMFoNgkaVBNRlzHW4X9/89zY2tqbYpLCnW+y8LWuaVxBVjo1y1vz8zplQNnY
         hkQ2cBY3qOr0N2VsWy6an42g5yClMorP2JX8ivxbsE68B6TBg5FnCVWEdADGm4RqmB2/
         Fv0DmAL+tTDDhra7c4uHs6Py2gV4/dCYayqo6lsr7Kf6JrHDFP3vhRtw78hhZQ+62WrK
         ZE5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785688089; x=1786292889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RRoxVdVTUCeu24UcHj/mykL3ggbS5JKaLspYh6bYnw=;
        b=T9sKqDdxt4yjZld3u8c2SgffVu9f1JJjppdpfo9mz4KFEvxlXPxKqVMsl5zjZsYCcI
         MGEp26ncvhBwRbQRza9d9e2JZT03z7ePGDfzIYpyXtCG1MALNarrl42mkDBJyiIVEu8y
         nAjKZ/iYTeNC3InSDHmvENiJO385Yh8gSRs5rLP6Aai49tqv0OniXYUxzrz7CEsxbz3V
         REnlY4X2iVj98hNitPqK98w59VfA/YW9ozStHN8Mc9EVKe5aiTDaUO24cX98xbyFVA0G
         7HVIrJDhtVDM0QYn0vMgkMxfZAfWJAttfoqNP/BnoIKUYvThCukDROFH6kX+CGqQkVM0
         znjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785688089; x=1786292889;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3RRoxVdVTUCeu24UcHj/mykL3ggbS5JKaLspYh6bYnw=;
        b=R3XBsJhk5PHbn1ZbwMd1joaEVzFm0g7fGQV+akaotTSB+2BtJ5aJ1NnGGvE54qSTNl
         dMOiJaX7Q28n4kmnogz8yiu+r5UPbgqGfOyVBvrkXObGEjgn0D8Cgu5W0G7uaQl4/1lm
         uQlnrMwX3SQ3CoVhuBKbW3vXMPEzBiRP6/33Qn//s1r/u5Pnlf8dV231uwRZvHOboyfY
         4hWz2sfKWcr3ThSYvNlS8HWweKXlQmQvlqIsnF3Rjytf2BLHKrURN6ixRs633X5fVDUh
         lZn3xa4VQoa+weRcwfWGk1XUvDWTXitBzoRy/RPa74Zm2cv4EsWZ4iJ8f8J1wVErBrA9
         u9wA==
X-Forwarded-Encrypted: i=1; AHgh+RqBNEtP1M68EEFuqFu6wMEq6mXPJw+xMKzibk0l/b8LbkvqbsemLj349hGIlJa9vHOtaZ7VmG5AlHcD@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbdKea8TbGL6ZBP3tlAK+NjuTa+MC7sseCuzFXMFMCmgwD31c
	RveijLik2yOtR0vdbrJbIJNZIlg4bc0S524t/V12tNqKMUoPHWAA4hSiw06KWGwcvCrcBspXKRN
	+UnEW9s1Lqy0KarYxk3aNG7Skj7j1HuY=
X-Gm-Gg: AR+sD10r4a1nqa2v42kmGQdxgGRy4iJ414J7NhrqafZNfk0On5ja8/hDoy21kKp1m3G
	MAcPSrnveXqCVjN0vQqLQSOAvbuS2s07rUCfQoE2PfwEBEWF+8u6vec+dEiTBSsV5JtVMVAYDNe
	FfMpRuDamkHjQTVOoygwAXFn8HkfVlZEj1+ELoMnhxZhPPSb8kLJdrCX8OMMz0Tt8B4M+LQ+U3d
	q4sL55Jfw1xJhqjR1FCFnbA0iEtRAoTAtGMMHtXDsZZCuoklqWyladXsZ8/vVBIWEN+dy9o7ibS
	rOp94Vh4cVTTUpBv+uUsky9fK/yUG99niQmRUcgCjC1+tijPAb1RrfcTiWyx+9mFHK5smvXMQrz
	Lq7JReEAIkY8QHM50drN00t6dtlnTIIU9buLw1cQFREClXdjl8LWTHT4kZk3WqVY=
X-Received: by 2002:a05:651c:1602:b0:39a:e3c7:662c with SMTP id
 38308e7fff4ca-39f86404782mr12959971fa.22.1785688088313; Sun, 02 Aug 2026
 09:28:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730173643.256052-1-kieweg.leander@gmail.com>
 <20260730173643.256052-3-kieweg.leander@gmail.com> <20260731-manipulative-taipan-of-symmetry-e20afa@quoll>
In-Reply-To: <20260731-manipulative-taipan-of-symmetry-e20afa@quoll>
From: Leander Kieweg <kieweg.leander@gmail.com>
Date: Sun, 2 Aug 2026 18:27:55 +0200
X-Gm-Features: AUfX_myB0eIYVLJOrv7htov5uvEh6mjN4ZOlZvZ62FG5euIGbXECqK5Pr7tL988
Message-ID: <CAMwcS0gOXUZ5nd851feCGaBx3EWJ8Tjo8wKhGicSKaeX24gpdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/glanda: Add initial DRM driver for GlandaGPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Content-Type: text/plain; charset="UTF-8"

> Drop. Kernel does not print such messages. It pollutes dmesg even
> without actual hardware.

Thanks, all of this makes sense. I'll drop the info/debug messages on
the success paths (probe, remove, init, exit), remove the redundant
"end of table" comments, and fix the indentation on the
of_match_table line for v3.

Best regards,
Leander
