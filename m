Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB39238D3F9
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030903; cv=none; b=dAyMW2XbMaHWZfUNq03uHekHciW5TNixh7juId0fPYJV+vZ+rGRz1kJo1w6XcUQJAhMMd+fgdCfTtYhzPLzxz5cO8u3DS+M3O0LX0jGbe092Sj2J+reRJ/4R9n3//zWQSvOziWU60eQvTkuC+dz8xaDhBsn4dAxBCswvtQ9H0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030903; c=relaxed/simple;
	bh=+Xmqf9//jKxo53Q4wUP4Zh9zAFIK2W8+Ydxk+pi2mRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jhG8mO/8d1UyiBhEL8OEchep0GCkCTOPzhTqBAzvwj6P+b/4x+PjEYZwJyEAe+e5CyvVK7+aI98Qxz7gt8BQrWR9/K91nzfpfsxLpySxkyDi2i1cc4UDO9CJ4nXd/b2HrD0755zATHF/GjQmBGmIW9Ya8j9dQQBomqXHoNYw2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXgoBb14; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXgoBb14"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-388b404ea89so804865a91.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030902; x=1784635702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Oe9aWVjKhDNM43muNwN/DRmahJ3UH9WTei9WupS48E=;
        b=VXgoBb14N+WMVTMCa5pwu6IFVaCkozs7UBPPDRGLA0c+1xv2CaQrC3WADDAuAbOeto
         sEu0xUYGof15aNuAk/nq6ZOQdzMW/mFl9biCLJXhW30Sp2a3yMnUAFtX9p0O6cZevjZQ
         ojV+py6yjoeDO4uelFoT1Lt0atVRxXIRb8q2efy11lWf6mR0+ujDKdrDSTYj/7P4Hsgf
         RdCUb5fMMyy65d9ZB7POn+azJvNwsRMc+omsih5eWvrC2FNDrySG1mKtbkpt5RVcSpOg
         dy6vC96TWIvHsxUkA7OH/X+qJ0OBmTUPkV//HFB6qBtBqaTSH62RWrYtOAf+5J19qQVw
         OfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030902; x=1784635702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Oe9aWVjKhDNM43muNwN/DRmahJ3UH9WTei9WupS48E=;
        b=X7FEr9kPiwuScJdd+gSNwfMgXLJbEox/h9QbhwThoM8JQ8IdJxLz7D15rs9q+eRHdQ
         Ai2RkN4US3C9qj7FTCkanQHRHJnxmL6DLFY46p5gSj+paMKWyZzL195iltQb4pXFv2jo
         zfY8lFtmK3/A9uAxjpgEwDZubJW0fW6Jm35Wm15roovT9wiZMA2BHTUA8COfh4T/zecP
         OyFcKjfiVRnEqszpJ+lHxHbs1KNetX5N2eZt0zS3pE/QyTAE6wKLo6n+3rN2ZHUmULXo
         4D7YVl6Nfj0abraiGewbU+vMrLI5WIQowH1rYwVtph2zMRgdKb7/95gtmHGcvtl2yO00
         EPIA==
X-Gm-Message-State: AOJu0YylpKY/6R5IZ4xhhkgapRW+e4Nhn3n1qrls5UVSk2pkUz3Xj69i
	fEtFyEuq3kq/ENFMeFF7kLZOXoIqE/AIhjvxTcIzNLZre89dz8GnfIqL
X-Gm-Gg: AfdE7cmuZFSNauZE8tGykaOgZIFH3CS5zmyKvLhbK+Ye0anftmOIRVlUiBe1u+8bFbx
	rIlFyHaIHmlOMznHwWeztGeQn8vLNTAypcJ0deLffCpnq9eo5eVluVynKDW3Ci0YTT89dFmGVzF
	m5lXEw8xEZM1oT8VwouT1pipJ4U7YxHKmNxzMSwM2+iedg3Q4h/7okO9BCIOzrweCxSmn3ywUBm
	QKBePNODE7SndlHkBAv3vVaUfNCR8QAIRfRVvi12eUIZCZueCWC29OTM4ulRQFkHJPsYB2trkWv
	lsnh+7ZB0CwL+zMfNuO7gNxzjVwzINsgOpwy7s+QsuGEbaFUXCONCpQ2eGo+PVjmOykTVQJpkPy
	brgbjmfjK8i+X/HQSexiTzs8VEYN7zV0cwqZ7NAu58/7oNehImi0En5X9EWefvW6w1cABQCBeVQ
	v23eYSvrW6iCZQ4V+ipqtiJ5WouzJi1oQnIhyWWKnUelAE1iddi8Eb9sO6PLY=
X-Received: by 2002:a17:90b:2248:b0:37f:fd70:6790 with SMTP id 98e67ed59e1d1-38dc81c1b09mr9238776a91.9.1784030902088;
        Tue, 14 Jul 2026 05:08:22 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172dc530sm1384425a91.8.2026.07.14.05.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:08:21 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: bletchley: Add second source devices
Date: Tue, 14 Jul 2026 20:08:14 +0800
Message-ID: <20260714120816.1504058-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add second source RTC (ISL1208) and LED controllers (PCA9532) for the
Bletchley platform.

Cosmo Chou (2):
  ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC
  ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 294 ++++++++++++++++++
 1 file changed, 294 insertions(+)

-- 
2.53.0

