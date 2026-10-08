Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9A3A641D;
	Thu,  8 Oct 2026 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791478098; cv=none; b=O2QpJuIOoHqBXAC0E8sw3oxtfpLmgW7MrbBJtdv10E6TPgXy/fPumIF2KP5hI6k5tMxqSds1veUYzAi6v/SyxCcqm46oFFGHYdHi7sVFU8xnj96rG4gJLA/FvbuIqs7IjTuq+FNcSE4PZxLorNBTN1vAAn9cyMBHSY8nLw/KfNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791478098; c=relaxed/simple;
	bh=NYMhRDIf9k1oofv9WGSs5ILJjfW6gJrHOfFfuXs8Nro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gVUpTJlWljLh/Y/b3jAYttd3SjnLMVimXL6zUrtaoPTPRkgcTF1HGY9HKpsaFewVpvScTjW4pBPsqVKwdKpNZsCwHdK7se7n5rOhsc6HfAIeKSiKZ/0z1zGb0xAGuXh/4a0Qw8sfbLgEsagKSQ6pDFaGw978Y7gqmGMp1VMElvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEf1nVaf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEf1nVaf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225011F000FF;
	Thu,  8 Oct 2026 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791478097;
	bh=SBm05BjzYrqNU0OmxlHtZZ2AEdVmEJ8+If4Os62zFsE=;
	h=From:To:Cc:Subject:Date;
	b=oEf1nVafDbrNUTJblhgy6rb3IVEd3KTUDbav0dTwLqqgBzWUAhv9NO1gUR7+x+FQs
	 1h+eXp+C0vXWRUHjmz9HcTQIMGF2dL95ewdITQ9I89JfXEcfd4XeS0VJHq9odqbNBO
	 1Du9RZpbrDc0Ji7aRRBWdIJ3aVJ80dG0AI7XnKQlISGoV+5UOKgnbH+bPHgRR3PBrG
	 fkxjj2r32MdbtTlsxFJSy0IdqU23gN9x8O5TVBQNvWbXJm8uAbwNMGhFCCTXpJR3iS
	 6NQY7CWNADSyb/VMJQmNWmfbkE046TeX5/20tcv8KOq8Y3zEv4M6INpe+faJu6ZTu/
	 IRtAj+Et7dfUw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL 2/2] MAINTAINERS: socfpga: update for v7.4
Date: Thu,  8 Oct 2026 11:48:16 -0500
Message-ID: <20261008164816.566624-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_maintainer_update_for_v7.4

for you to fetch changes up to 96e948e9811dcb68f513e1d6445e22999f8d099b:

  MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE (2026-10-05 10:13:13 -0500)

----------------------------------------------------------------
SoCFPGA MAINTAINERS update for for v7.4
- Drop the arm64/boot/dts/intel from Dinh Nguyen's entry since
  all Altera's SoCFPGA files have been moved to dts/altera

----------------------------------------------------------------
Chiam, Evon (1):
      MAINTAINERS: Drop arm64 dts/intel path from ARM/SOCFPGA ARCHITECTURE

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)
