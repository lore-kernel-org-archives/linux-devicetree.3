Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC82C21E8;
	Thu,  2 Jul 2026 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980431; cv=none; b=n6zv48/hpdl2UPUPIH+rfD9ttzKgfhbIJDLytgzms4owOh4AcOpMrXT2NtQGKgnWmfAMQwVg3RQ7UA2iddueVFU4WmDPyiC1YmITJ5KcVzzDIymtFxl4avyQXQIFSwnouGn+neg5wevROL8B9C2crIPy8vLwcKAexRVZHgiJvJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980431; c=relaxed/simple;
	bh=3tcD0Vtdp21AQXkfTlPs95Zl9wYOFIGlxih4N4h9StQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=W78pt+bR9MBb4W1fdv9G5b2OVe/bEKJy0weruyNigV7NgPXZhAK04FIGUpdQ4Xy/A3Urw6fGuWx3HT4pz4wYj/K7hAUcLJLoapE9JrKuuW6EN+W1OOdbig41Zje1nCK2ORZGTi9UHmHk0iTpz1VRxb5TFS3IKg82lwJitaxIycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=sNqtjJf2; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sNqtjJf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1782980400;
	bh=3tcD0Vtdp21AQXkfTlPs95Zl9wYOFIGlxih4N4h9StQ=;
	h=Message-ID:Date:MIME-Version:To:Subject:From;
	b=sNqtjJf2kQN/g0Pk7G3kmXHUfWM/kCPPcxWXOT5tBGd+OitdNMHKNy5HP+wwy9Cov
	 Vt1Mz7c9Mg+57XPOPc3hLsfFPJLiEzbRSs3vg9vFXBz8a1osWhoUAOdUPKA9Tovaxs
	 +ny4A8s9BSIlKiyUuGHN6c9cRwDW5n7XZVgIS7X8=
X-QQ-mid: esmtpgz16t1782980398t64e51a94
X-QQ-Originating-IP: 9vM7/i79yZjCOzv6+3QoAO5ixH4Sp0huNw3+3vzLCXo=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Jul 2026 16:19:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13503955215817398908
Message-ID: <BDD9553502347B02+ee3069d3-eb04-4a37-b364-107cf8d0653c@linux.spacemit.com>
Date: Thu, 2 Jul 2026 16:19:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: anup.patel@oss.qualcomm.com
Cc: adrian.hunter@intel.com, alex@ghiti.fr,
 alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com,
 anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, irogers@google.com,
 jolsa@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mark.rutland@arm.com,
 mayuresh.chitale@oss.qualcomm.com, mchitale@gmail.com, mingo@redhat.com,
 namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
 pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
References: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
Subject: Re: [PATCH v4 02/12] rvtrace: Initial implementation of driver
 framework
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260429125135.1983498-3-anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N/QSj4NLaJeC3dgqClwKp2ylPragx5WZbygqYZNTBKsOI/a4I0bRGRy7
	0nymkw9zOtQvACD3Lt0Y0hWV+WyS9Ke1xdHmHDlUt31CFjxrhpEAymSfDzspPepFM9AaXD3
	RCOxkiaY2hahnMhjO6RrH+IxrY5EMQIg/YMA2EbNccD7f8P+ccO7UZmKuWnO2lTuh8PcmH0
	zbk+OpEYvZUNUk/oaCQM89NBIJWJ8Tv6Bh49oOGgf1VcpAr7OJYhICM0sPtpAvgX3xFtgCX
	DAeqi0l3x5Pxtah6qFYV+gJM/2YQOiIZ0hd0XCQnk+nL4/B/zb3WoXv/dolKQcKJk1YjA0U
	BEU3F63jskGlFXeOTCznCZWCFxAxLynEP6wZojMOJ3EqLqZ3qPLzEMXNKFfvByllCS4KTC9
	v9GF0MwaUGveEXfH+cbbRvBN3UQEqarmD/lfJPNYMH9oWZeG2J23J7CPzj1O1pVcQiWWSfx
	IKZ6RgmzXrmSO4TwUTvJOAAXNHgTah2cJBKaI5fG3O1ihPT+L7ctuaG1maM4vv1Xb9tR5xO
	U+z0QRScnlxy9PXXcr5ziRAxGB/m++uSBETvlj/Q505gbVMVPRruNcJjSR26G4j6mkHLCyA
	hAPXeKBwco29pUXdfbz2WU3hDOYUXOST4THF1wa4qipEU0Xeu8HdLjLcPgnCVYBGsLtM0oh
	6AL/jYJ7r/gJxsvupVBdl9b0I/budxOufuYd9vGOspV3d/qVP6nU2/r5hOXtNotH/DvEvt4
	RwfGwr/v064lDZ3LpYxizbHD9CcgUqVnPqK2XzTOWmjC2U4wUrGiP/bSy/wTY2Wo934zmuj
	dDVh/RuULaScGN6aow9na2oYmxY88KfMM2jEknaVNY5YOQJcvS+afT+EkudTHb3wwLYutGp
	WtgOG5MD0Mjiwx8HXxiP95BKTgHM2IrZwbSNU/ZEoZDWAOCGMTlQ06KCTQd97mNFn7EGhfb
	M0mslQbNj7CKVYkoKex1GIAVAPh9f1Wk4iOiyOaz5wMFdwmfkh3FyEGQgzaOD4PslHz0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Hi, 

Based on the current framework, I am concerned about how to support RISC-V ATB and reuse the Coresight component (ETB/tmc/TPIU) in the future.

Zane


