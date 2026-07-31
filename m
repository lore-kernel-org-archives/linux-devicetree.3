Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D3025B09C;
	Fri, 31 Jul 2026 20:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530759; cv=none; b=B/iw506NWp2vBt1wMaUQt+WdlaP9hkTncgxB6mBWjr+0lokTF7jCW1BfslUv+1TE4FJ2pTF/f/cCIBHKpwzpn2jmfkVXyBLmyhzLcqEnXHTkBOFgGfOLv7Q1EMPgl+YWrcGAR3ic7JNTfjPPYNC2GevWrTFfkk+DAZ1YVai5vKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530759; c=relaxed/simple;
	bh=8UVpJY366kV+K9YMGH09bFJsG7PwpfSFkTZ/NZC7z/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sn96JXamus+jUZpbLCNUyesMJGpvOUgpqkycgc6XH8cojvRKvB2a8ymXJLhY7A/HUkJMwF2u5X1n3AYGO6jP/5q+9MscnqyQ7GiLuBkcGv+mvYjm4hZCFJC3/mVkzk9UpXvF76zUtNYH9U2CJRX7GKIJx52+XLnhGvuZ6G0zwYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP8N/yyV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP8N/yyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69061F00AC4;
	Fri, 31 Jul 2026 20:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785530757;
	bh=Tzvk0wcMJ0HnTljNeKkFXNXfyRrqhOxEUWPxRh1mfrQ=;
	h=Date:From:To:Cc:Subject;
	b=gP8N/yyV/2MuAjgrQA6RV1vw2I+sdnI6UqfUHIC9T7ZFCBWByxv8riDljxhjyxHvB
	 amGTU/TkjEyt3/ZzmROVSTiakl04OvGUGqfMwOha80kTMb6HxTJ3Mt4pElbAPHEaFu
	 KTRNCITuZrGmBFN4BUVQrapJ93ATSQOqFtYct7Rba1/CCC+0AmqLavvA7hyx00qpKy
	 QXHY6lzQaetbthwkf04/7fyhMsTALRJL1Vz65ftuLMecKWwJ24Brg2zqBMPDxZufdy
	 t/QgJbDddQuxnZxBpP2mza9qj8WNeZkuTpFO2402Z3/wtzSibntQAoNuqxToBq/MG6
	 D1n3apnq9ViCQ==
Date: Fri, 31 Jul 2026 15:45:57 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] Devicetree fixes for v7.2, part 1
Message-ID: <20260731204557.GA1777195-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull a couple of DT fixes for 7.2.

Rob

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/robh/linux.git tags/devicetree-fixes-for-7.2

for you to fetch changes up to bba13ad17b1a11b3f1ed9b3a5d556191d7755a59:

  of/address: Fix NULL bus dereference in of_pci_range_parser_one() (2026-07-28 10:34:37 -0500)

----------------------------------------------------------------
Devicetree fixes for v7.2, part 1:

- Fix NULL bus dereference in of_pci_range_parser_one()

- Prevent OOB access when too many dynamic reserved memory regions are
  defined

----------------------------------------------------------------
Carlo Caione (1):
      of/address: Fix NULL bus dereference in of_pci_range_parser_one()

Sang-Heon Jeon (1):
      of: reserved_mem: prevent OOB when too many dynamic regions are defined

 drivers/of/address.c         | 22 ++++++++++++++++------
 drivers/of/of_reserved_mem.c | 14 +++++++++++---
 2 files changed, 27 insertions(+), 9 deletions(-)
