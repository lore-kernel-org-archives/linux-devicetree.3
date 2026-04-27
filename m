Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1496A2E414;
	Mon, 27 Apr 2026 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777317298; cv=none; b=Z6/7EC/qTMHHnfZaSIIKg8l6hwXqFNqfs9/mIdBBKQeTpY6JbG/k9+0aNXO8Udn1m1lKIJNzGCJBQsUqZGVA00e06mecN+ZxC5pJPr36SDsl7I8z0b/Th+O4s31BRuwNA33GXtbdGowof7gEOjb43YmKL3ODyT1AIRcmkAmL4Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777317298; c=relaxed/simple;
	bh=PdnuyTvuhoQMGMeBVnQLbG5IqfTvFPutVB/bI+WpAOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOwviJV9nTIPVhLhE9xm+xAvedphYaEu+MDnGyKZdjLAUs0ug0hPLqosUgxiRt8t94HvMmqqnG3hFA76tX0XPzZLGhRpWe+XI6HfGrVpoAiW9eY3TY1nDbgoEY/dYnD1oaZr7qImPPRRL+PV41oI+9JSOxPAU3SBG2UhJV3nNoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8ZAI2pM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8ZAI2pM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616D0C19425;
	Mon, 27 Apr 2026 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777317297;
	bh=PdnuyTvuhoQMGMeBVnQLbG5IqfTvFPutVB/bI+WpAOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8ZAI2pMW/5vuMO0eg2as3bzLndbw80bRRuTBzEWC+xrIPfSh7bSGwyYZ3Mr755oV
	 4Hw7xQYBsQI38cnWWDMjX82epPl1HajS9Vr4fCigkrSS7GBs/DENYlMNZEuK1ZeeKI
	 fR3BuEH6GRZAbUUqQ7toEfn5kd5G/52nIATFlJbEyZgWM+w2kK9kdcwbaCaxXaSJIY
	 iyq4MU7ynSq7KJcZI9VX+BONqCBFXWK3cuA6SkKXUhHJbnU//Sf5ByL5F5Pz50Iz2s
	 SPI/aodPsGbfVwcmgBslMDYsTYeT+JS//wdtJChEZ3IQQjS/5du+ahPU5vAzmtn3dQ
	 YJHM2vNdtl1Cw==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Date: Mon, 27 Apr 2026 20:14:22 +0100
Message-ID: <20260427-coherent-slimness-133d28f2cba0@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=501; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=09O818Y59SMVVItRNPa3fOedSa/QBLcndxc5e/T2S+8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnvt/aKbir1fVW7RsAivnfOsR0HWhpeS56w8d1Ze+Fqb TRP2h3hjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkfAQjw4FzJx56ugSEbZp1 Sbz2srxM0OmksglsC/n2t7rEfsrarcDwT5V7k+eX8nX72Qu3XJshwzz5cs65P7+qdk7c0SSsYPv rNysA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 20 Apr 2026 18:48:07 +0530, Jai Luthra wrote:
> The starfive-camss driver and bindings were dropped, as they were no
> longer being worked upon for destaging.
> 
> Drop the relevant node as well to avoid the following build warning:
> "failed to match any schema with compatible: ['starfive,jh7110-camss']"
> 
> 
> [...]

Applied to riscv-dt-fixes, thanks! I did drop the Fixes tag in the end, but
since this is going on -fixes, your goal with it has been achieved regardless.

[1/1] riscv: dts: starfive: jh7110: Drop CAMSS node
      https://git.kernel.org/conor/c/3e256d4c4074

Thanks,
Conor.
