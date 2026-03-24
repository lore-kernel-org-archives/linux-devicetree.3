Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517893BE646
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334129; cv=none; b=uwN1eQF1n7FM8zEPCJPYg3JqQRr1vOCgJlJwqnKlB1Hlwgc2Pw3mq3F3/zWzxICUrDWtIsD3rptD5FHOppvQ6yD/pGi3DrXohZgeOdDeEI6LY7Qjcm2uOwYi2f2TneGcg6LQETwGLztSraZMvCw7Y5CPZNe1GOPIuBDjk+1tkXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334129; c=relaxed/simple;
	bh=yu3nC6vhpzZez3hZu5WSDBz9l+V7URi8BT2ABBFXuP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ta80LFJujHsuHLq+h5gGUB4WlFwTQfGvBG0FEasj4zdFUUGWavJ53ga5g15Z8rKfJi4P1GTNtZRkqn3hLk2uNYoQpHaTlc+HTLSp4cu/gR6jWRfksOJU9dLftQhYhFjWeb3RJ0yQDEoW7iVZlXy9tZ0imjvCcCjXadLX7tWq5RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMcMgJdl; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMcMgJdl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so961035f8f.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334125; x=1774938925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=PMcMgJdl9+8nEGQiWKxf5k+f+ICevnvHpmyNIIebnq1FtFkE/eKPmDJO32bvzB/Ne2
         wLtCDuYLT8RX+PC5LskQqp6Y+SD2O2ZMU5PJhOCWTdTFrxD2437tSkYxsmY1ut9+vD42
         Sw/oZT00uEJ9Kju8mKIohmNb9xlYPjhOF9BvPBFV355YRteNnqNsmizeOOoHkR1h4yyU
         ARky9VX4+fkk+1Y8Ym9qTYtdLcQIC3Sd4XYoRLL0XfCfIEhlmkT1JQpL/sK2ngw0mzri
         hgehwSzc6SjzT3VLET+jNAvqPw2FIawqcbfQEL8YFIZo+WIZdrhFnkAmTKuhj1+n9SSn
         A1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334125; x=1774938925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=cz6Ncak/SS/9QJ0GSpaPOE7APZDr1XiVCWLmVecalWCrcoa/9p/X8Wwem1k7wzE5pF
         S2y4oWMhsZcYR0qWJXG1omiOXee51RyN3s8NrCjyT9Tm1giYat4lz+FRbnquBPiIcjfH
         3yvOR9LdRu3Cx4LFuIP9O7vim279qlxRlzFsF34qKD2MuT+gV9gBxxr3WSICuW8y/wZq
         utCaPaltTC+MWw1RBn1bASACoqSk0/AIbMQ3mN/Mxb90rFF+U1jr5KEqKfUYriBOr4wQ
         1vapQhDvhjANFbP/+ctCcHBuP300ck4S8PJmlIRbpK2r+BbO7RkfwceLmT8D/teACvXQ
         Pxhg==
X-Gm-Message-State: AOJu0Yy8nujEb2qVkL71qmbUpK42IVsQ24NrLhbnJZlfdqRWz9Q3YpzF
	6Oe0Qkv7zu1LJVUyTfcRUj61D5QZE5gANeHdmgMUMbNqqvDRO5vlujT7
X-Gm-Gg: ATEYQzwFwpu2McmppM0CwO7LDh955UUsIK7rjDQF4QijxpB11dnyuC94w8pmmS4GB72
	NOKOh1ZnNowPzSKTyWOeUtaFl3YFwtVsnNeKqONTyd2KvNKDAthkDsu/zXhB+dUIFq6I7gr/HCG
	RyltqmsghsEAmBfeP6uUuJZZpjZNOi6u88Eerqb44TrWPJQLTU14dta46mcOApa+yT8ln6e2AUO
	GxMi2NqxCTTM3Afd8h2Hl9y2tvWdQxzM2CBfeRhPVMfVcKhyiRK4E8TjBrEdqMUVIHCEeOFuJQl
	zK95k5bur2ZcPW51mpfvlcSMTp/g2VkRBJyoE7wbUixfmZrRGl2y8m5e9ohjWTmS2rq2oWZyLX+
	LtokvFaf2ajeTZ/GIAT+pgkfbj4aY5VpCKTd7uApIb2gNqydO8OUBSdbdMV2b2WXfmaUreuW071
	dmIDGo2C/mF0y5lB/2CzE=
X-Received: by 2002:a05:6000:1aca:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b6423fabamr24225594f8f.14.1774334124571;
        Mon, 23 Mar 2026 23:35:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b6470380asm34457509f8f.24.2026.03.23.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:35:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ruanjinjie@huawei.com
Cc: devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Tue, 24 Mar 2026 09:35:18 +0300
Message-ID: <20260324063519.3258161-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin
