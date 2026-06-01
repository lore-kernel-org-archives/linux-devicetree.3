Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C49C1F099C
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 02:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780282667; cv=none; b=gK2pdN2Cfvfi85sMSEyqZCEaPEKJzB0UBPK8cmpbBhya9y0yE6VGq6ek8rclyDblzN7VurfMdlZQkWj89bVU8Zndx5MfQ95+p8P2HSh5UBLa7Y86zPP2xYnHCQOhZ7RjsRzADjd4Gv5QUkv8T8FW0mi3Wa3rphwueqJijVKk1SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780282667; c=relaxed/simple;
	bh=6SyTLlkLlY7/nQLNxMMSWjNn0CtqMy26+6iLfA1gO70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkVNWJyTV4/kLSJhMIE1zU0+OmXAUtgj0jt7AQCFGKs4IssxR4HjAisDz+WoxdM6LMpZLaObXxr18Zyk7V7++e6bnbwrAfo37BPKH9VYJYv3DGRpxBnyAT51xctQKtd7ItkL4Kv23224MW9q7UG5757eqD9y36sfXkXDNceVIco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jhIoKy1N; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jhIoKy1N"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36b903567fdso3318263a91.1
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 19:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780282665; x=1780887465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4dc1e6o27a5Kq5vwZr329EQ3xcv7LkgpKk1NAl1/Wo=;
        b=jhIoKy1NQTSrgAD568t+Ih4ilAVPu2nYlQED/WOlvg+tt1uKBDFeviqKmj7e9DLmYn
         d+CfGGz4jiI9EhDnzYZLFOivuMRQAvniSVWu9YmspZkh4d7z9C/ElXqPZDatMnFky3Wb
         L4f9fgPdTHlManft+6GUVMIYhfKXWcmMvXsfuH9RIaN8hmOj7xYebJXmks5WnFi4hyh+
         UG7e+vkd3YU1qmPc+vHuEwWHRIikF2hlFNmqvGLOFv8wzX67YD1GNJHE1cu/Wd2W9fOm
         CDGUJeA36ucWEm63LyckHXYrFH5pw6R3Om2nE/JVKYxFb/hQ1TfwXngG5i5/OqJz2jNS
         exRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780282665; x=1780887465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4dc1e6o27a5Kq5vwZr329EQ3xcv7LkgpKk1NAl1/Wo=;
        b=ownHOLXtbbmTQf6AnP3hmQINKC0FEObb06g9Q+aFjiP0KsjiPpbhXvFNB55GsT/f0N
         9uQgoPUQc1TWekDYjY60B2OLHAzPGjC1uue6HXvTfIuB0+vps7OCu9oryRgeIypWcYzc
         N/GRkfLteq8+OrPkJNGKeoDE9k8kDWuALt2F6/0qxQ9xbkTXAcCPY057PAXCINJytGOR
         hwhavKzbqWoYQjGa8mRUGRKsH8AoGsRRqYiAE3frF7GJXzImGJYFbnFtqrq2+fS110b1
         AHKw6OSwN4CFj9apF0KC7s3pRWcgXrYM96x1lJmYY8QBRZy2oSFQNKhALTSFdupAN3AD
         +pNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sgxiIcDwouQhcTK35nIT7HMe+e1AiZI+83xDxh4q+saALdLYh1MV7aE9iWihhf+srbFzQPriNLaBK@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/PeBXyp8naravsOH6ZxgdlQucvrQnSwhWEblKyNim6F2kafE
	kSvzaN+z7BncCrS9f7drHXNpwtfyD8Q4oA9LvKFbX3cemXPPyeshz0/M
X-Gm-Gg: Acq92OGEEeBRcR+in5cLf946f6DE6pGW09wiqx5laSkuq607/17O+8LCi84dsFKo7yp
	bVj+vyxFtEWhRj/JTaMz8wYbrI8Au7Ndx88FGDRTPYubZglfqgp4QKEE7eHfKRVOPX2ASV2JJGF
	6j+7Zd/YlCaq+3fo8Wp6queEOvKK9zVsKK/uKMDo893/i0jE7Bph+mrYJJROFid5AZdc5T07mWE
	XucsyBxWJJ5XR/zJnxI7wGFqwbn1QPztPNUuNGA6Tqo6b56J8chxf2l4JGMUwfcQBAk1r0j125r
	wpZpZA1yK8vwDPN7kS7qyCtkb9VIiYXvcvEpTK4STIRp+jqaKeAPeByr1qpLeDxd7ow5pNe7fjO
	KSD0B9YiSRVut727bLnm2PK+lu5+jOr0EPg5jIp1t52aryvLWJAZERqlzDmmp+LCTtF+LEVjPS5
	FchNbs3uDhaL5hPgH0rhB8dX8YnqGv1OB29A==
X-Received: by 2002:a17:90b:264e:b0:36a:ee1:fc24 with SMTP id 98e67ed59e1d1-36c4ff41964mr8396209a91.8.1780282665674;
        Sun, 31 May 2026 19:57:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6a340b7sm9065397a91.11.2026.05.31.19.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 19:57:45 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: (subset) [PATCH 0/2] riscv: sophgo: sg2042: Enable PCIe DMA coherence
Date: Mon,  1 Jun 2026 10:57:24 +0800
Message-ID: <178028263198.557087.6386925175219722340.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260331171248.973014-1-gaohan@iscas.ac.cn>
References: <20260331171248.973014-1-gaohan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 01 Apr 2026 01:12:46 +0800, Han Gao wrote:
> The SG2042 hardware design supports cache-coherent PCIe.
> 
> With recent firmware updates [1], it allows to use DMA coherent.
> 
> [1] https://github.com/sophgo/edk2-non-osi/commit/017a5aea26a066fd2bf501b7893937183165af36
> 
> Han Gao (2):
>   dt-bindings: pci: sophgo: Add dma-coherent property for SG2042
>   riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
> 
> [...]

Applied to for-next, thanks!

[2/2] riscv: dts: sophgo: Add dma-coherent to SG2042 PCIe controllers
      https://github.com/sophgo/linux/commit/e728a57834d06b9bbf9bbed69e3ea16416d257d5

Thanks,
Inochi

