Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906236C9EC
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172607; cv=none; b=C2N4GlWRn7HGbCacGi96Dp2oUOF95t4cCRepCb3vCFiVNN+KW3ZPbuRsSSQjfJ19m6M1fllpVSC8Z8cmgeCQEk6ag2sEciLnY6AI/5qYROjyo4IVTEFY8k/gGRKR6o8unYzUd8DUPS3BAHk4DjUhROViufvLZbGyqLs5ZBrf6AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172607; c=relaxed/simple;
	bh=Te+zNjde8ncPGxnQfN9Ew+2u2ctnkBeEiF85U5k4JHw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=a0cII5UC450mnAPK2MSV8TGheGbOAz/YPJ89MA56p/ai+Y7237YkJIp1zEUHw0PxzLZ5CDXrYPplysGPdFIsam1dELVDtTaCjzdDbKLNtcXmdKObEeWPlcBcdIzEldG4cY3UUx1SYXP8ALB/0B95KBQ1S3zVGuRRwd8LJOlLTQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=dOBeY+AC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="dOBeY+AC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2382635e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 13:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787172602; x=1787777402; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D8ek9XEABkKYopYQPGgQ0eZy+De8ylYFeVMzcY2nL9Q=;
        b=dOBeY+ACU/at7nYHgnvR/yJaSsltHbeyME559Qs+U0McFDMMKPbIcRVCTHuxgp7JQW
         yRigS2/38RFmnvLlrJJwRzX3DJN61R0kAk2Wc9eRjdaZMVWhzJCk7W1UkE69YQ65WIrD
         WS97uHRIBf9KbxeATEQtnfbeXIvRTcrRfd5FdQdY7MrrL0DlxSH3K28hDanlboXaoFlT
         9rkCWMHOWgmyua7jCY1cIxdeF9PhG57an+9vsJr49sFEBMwPsS9Zb6QHhqgtb1Z2Llx7
         kpFxjjHbMslrsN0865nnbg0SnrL5OhKL47vh3bGXcb2bbQW1QorjSrGoCtT86WgeT+gc
         I3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787172602; x=1787777402;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D8ek9XEABkKYopYQPGgQ0eZy+De8ylYFeVMzcY2nL9Q=;
        b=czCP1c8sWCNDr64Fcz/2APM8O8jObpIz6mKcVOrV657IaN/adkqQm+xC8iNmj5al7g
         MM5LyxVkniRR6CoZWQOmeGuhjgZ6aH6u4XPdXICYfrXlBUFHqze9HiJMbr8R+JCqJnVP
         98aDfONpIUr4+7AQZQhHCJ2znimGMw9Z8Xgh1LlgzV1X8isokRQdLXkaU6To9XkPcF6t
         WUTlbv8l6y30mZ+ShvlwqWZ4J6fbwwGZsQ4E03EyEAJyzEoSX6D5OKFWJdi8VgpRFjrh
         C0m+uSaNPGekf4yrcGa7cbTTUyZLQDCgb6pDd9msNpaFal37b3MR5yGS0bL4Hf0rVqIA
         mi6g==
X-Forwarded-Encrypted: i=1; AHgh+RoU0hMCSpX7jvu3bI/tJEhuyv6rwcDD5HqzoZmhUoeE0YHsTSNyz3pLNQvZmoZL41rmjRAXXHes4uSS@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYswAAdVqSvnXNwJledSkmXZZRijzUnPPvxsfjzuLLhjxLLCN
	ZtDUquOsRRNaC6D8uABdjMsipjHv0TG+gyn/wGhB+KRy9XPw7hui5XujaA1JhYKHz1A=
X-Gm-Gg: AR+sD116W4OQ9oqEnQJxLjS60CluVTxxOK42A4dU3e/EShF1gshcJj2yt/I6/XZ7p+N
	6CLRQKkI27q6seRiGpaIc1VxHrTEEFyQyQ0Hn1LhlqT4nlkHb7522OmO20H7NHnEqGX83WQOnAm
	MZh3sT7bG9X6t5B5AjHKkIMuVBD+giDkG7KtMrAtVcyGiVips1XhBtoLhKcBqKpJnGPSYorXwCr
	j9ewOU7iVhTHqZoa8nPM4OmXmuXkyOfgfeKPZTDCI0pWrTGKl2t6gdkXd0Du2r0eS4A1D13OD+k
	yOpzpYTuqJkuvQ9jO/J/0hgaey+7szA7zIr2Uz0uIZPuIC67Bo1gbzqY8hoUTSqfkjr8f7NeXmE
	HA8nroNrrpZ0pzU81NcV/BMpmQ4K/HSpZd3Xs+5uM5AP4OnHjzosd6EV4zqA7L/PyHoLS0VV7ra
	d2i+wolYsiEF/lP4Y5Dwz0rgnUZBHaPUdNAzuOyrP810LNL1CUwseRoFgkIUSeaALuo42eoMCDV
	0Qrhsi9uzhZM8DMAutSz4vvQvYn/vPK/n36nMLtqCel3U5MqnMLkv/BKMGH
X-Received: by 2002:a05:600c:c4b8:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-499b06adfa9mr26301385e9.3.1787172602473;
        Wed, 19 Aug 2026 13:50:02 -0700 (PDT)
Received: from [10.0.5.39] (p200300e66714e500bfe47b00fa11e276.dip0.t-ipconnect.de. [2003:e6:6714:e500:bfe4:7b00:fa11:e276])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499affa25acsm24257305e9.4.2026.08.19.13.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] ARM: dts: aspeed: g6: Add missing uart nodes
From: Tan Siewert <tan.siewert@9elements.com>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260723-upstream_g6_dts_uart-v2-1-4951ae6b4ac4@aspeedtech.com>
References: <20260723-upstream_g6_dts_uart-v2-1-4951ae6b4ac4@aspeedtech.com>
Date: Wed, 19 Aug 2026 22:49:50 +0200
Message-Id: <178717259080.130614.3272450084960702654.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787172600; l=223;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=Te+zNjde8ncPGxnQfN9Ew+2u2ctnkBeEiF85U5k4JHw=;
 b=/uLeucK5jyjnSISmeVUynHbHVwcXGwPgqKGeQfPtZ71BtnVLy1XFSks7yth89NtjvTduqB4Ha
 BtXB21dIBq9DGk/cuow/TXINuPbkdo4h8j30i0RkisjIO33+CQSveE8
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Thu, 23 Jul 2026 11:48:34 +0800, Jammy Huang <jammy_huang@aspeedtech.com> wrote:
> Add nodes for uart10/11/12/13.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
