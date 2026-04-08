Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85E3537F1;
	Wed,  8 Apr 2026 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775667891; cv=none; b=bgw6QMQ8OsYYMrmXm+LJbPzufZ1gt0khlYeBjpbsKJ0J1Oh2FNrK4CMLyfpXkjKnoGmBX7xYQPkJc7VP0eybB1IKb6k0SKQx9e4jUnMzNtBKCQvkctswoYWsKNfA8UbnODy01Cvu+secputwGIkTuVkgW5dyP069+2Lr8pIrtJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775667891; c=relaxed/simple;
	bh=IWPyGXQ4SlgESVVUSmf5ONItQUVsirGO2BNtqolC4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aUIT2N46SQGXW5XkLB0XoNJHkVOKu27GmInZORE6TvK5HfKrKMQg/0GKyYqS1Kyf/u2H/eHiiC5da5lB9kq/7ML+yUEmHtfRtuMbNJ3HUdFnMFEGj6P0SRZnkGcrSTzhddtEYonN/ynrx/wXPFdVwns2V1nmkSOMpEOLQFS2frc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4ruKw48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4ruKw48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72002C19421;
	Wed,  8 Apr 2026 17:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775667890;
	bh=IWPyGXQ4SlgESVVUSmf5ONItQUVsirGO2BNtqolC4Lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4ruKw48hzOAn3J0lNic5exiEZbi0Yv1B2ax/wflr2Y8JUeGTLYnrCaWyIs1Ya2wh
	 ziNPIFdjLQddkE4q20QNXvd59rC6YIsGT4H+qghRSEtP5rpT3iy1S5wqsa8jiOQfad
	 KYBI8XIomHuJrfIrVkpJXSK861V4YIRfUIiYvkXGvF3ZiBdK+uOpnAODNAMltxM1Dv
	 2nL1QLRETDNQFRV5KoZuSNp3gBRWQR3N5MbM2ZjKClo2UR86Xj1RmxLhImmE+toEAJ
	 M4vqisl1iDHX3RRRzaFYX8ZERsUHkKGCL16D8nkvbZVLAPsB4b+7REgF1vLWCrk3QY
	 k4W/eDI5n1EJQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] pic64gx semantic conflict "fixes"
Date: Wed,  8 Apr 2026 18:04:40 +0100
Message-ID: <20260408-overwrite-expiring-82891c334a1a@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407-rely-speculate-dae3a81ea1fc@spud>
References: <20260407-rely-speculate-dae3a81ea1fc@spud>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=0+n/rYs9NffjR/pk7EiVoWwYTXJXJ3Bv/k/254MwoAc=; b=kA0DAAoWeLQxh6CCYtIByyZiAGnWiqehommUTcwAuRtQ1e3JS0/OPIs1P87tls5H8PNuUzifi 4h1BAAWCgAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmnWiqcACgkQeLQxh6CCYtIEdwD/f0Hv v45MmwChbeC0HldbL0TRUQQ8QrsK39RDZTGnHf4BAIpiWtfht40dZaZN7rhkY7duOVxdsL1GrcF kD3XoUjIP
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 07 Apr 2026 16:36:22 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Paul Walmsley <pjw@kernel.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: Alexandre Ghiti <alex@ghiti.fr>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/3] riscv: dts: microchip: add tsu clock to macb on pic64gx
      https://git.kernel.org/conor/c/89991efc78d7
[2/3] riscv: dts: microchip: update pic64gx gpio interrupts to better match the SoC
      https://git.kernel.org/conor/c/53c013c3b27b
[3/3] riscv: dts: microchip: sort pic64gx i2c nodes alphanumerically
      https://git.kernel.org/conor/c/ae488e2669f3

Thanks,
Conor.
