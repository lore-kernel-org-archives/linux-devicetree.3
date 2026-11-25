Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602449;
	b=By1S1OeD5x13pueRq3sLGL49fWqpG1Xc4TssHv8xoYbcc5nSdJrNojxDBxiy0SNEZQt+
	 RFsBWOT/ynr/ElGYHCL0oDjrVRXnuCI04yi4welOiskdLHrxLPfyH9goPCNojl8SMlwFE
	 v0C67+bjRcwLSjMkHyk9MUVYybQVVzSxY6AE52JgdkUzUHD0b9983zV+C18Qe9CfikxSq
	 ZzPz1DDH5mk1fpTUryMs2INiStp3hFMW7dz+VnGCC5d/cn4msotZEiaQGMQxRF4QLtdKg
	 ljq98K7RApqrQ9xMDtrrFql7V87BlMmEYAN+9yv2hJHu73pamCv0p7xK9SzKzDLj1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602449;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=yJ2ee8XURjMr+gJDSljGPp2zurmJtZZuY6lxpVhgFio=;
	b=lImOc0CIlJIeOsGYgHLcm+lQhHFwxc3e0pvr4fedsoCm+KkmlQmBKGCIBSLBuWZRYHEs
	 GtNWGRRY+SBY3UnXHyq4GsRuJTSkfTzcr82sKXQSd3q/2X9BaubnATlTvegSSObQ8j9Rn
	 zUo6dnK6T11Neyz5k/yw8Sp4LQlxHI2Qh2KyWxLUbInnDfu9EQEHuQuMCp1pac5bc246n
	 SupWGU5PNQ3A2qDYYUk7Z+2tJQq77KMvqEpgyHw9EpxnSsM7XR18Ntu3v8Ce5Xn3m5mOf
	 iWxlFnT/j27iqo/SyPlYGe9Q9sdakcd3Z9nqxwrYLI+o59tPUEm5pBKgfhlOfQMSxjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=oQ7COddP;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F64606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 10:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F64606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alessandro.zini@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=oQ7COddP
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026112510272418a17728c800020747
        for <devicetree@vger.kernel.org>;
        Wed, 25 Nov 2026 11:27:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yJ2ee8XURjMr+gJDSljGPp2zurmJtZZuY6lxpVhgFio=;
 b=oQ7COddPWZm26sSa5Epju0z04m7IGBxCMEoOGGCi3UDRnwtz8IkoLDR2DXWmk4I/ggAHmf
 JR3cDKxdzWgQYuXdiN1BSDeRx9say1Yvep2mTPcitTUzkpxvNYivhoR02goVd1QyK572m5Mq
 Lf8M7KE9SX0NA07qSV94m9qjfPwdsND1BsZmTvD5ncF2qrY/gbrV5yBCChoeWt/GtUYU8Pg/
 MysiRlf0vgktkku9MjdktqRbwdnN3pkDhRs8C/5r0Y7pwbPsdGYBU0j6kR5IU3L0HZJAj4+M
 te7GKeO83313rU5ZdaeruPbYPM5FJilbBLyqOg4VmgzcIMvpGN6HfNJQ==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Wang Yang <yang.wang-wy@siemens.com>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 0/3] drm/panel: simple: Add Goworld ILI6150H6 panel
Date: Wed, 25 Nov 2026 11:26:57 +0100
Message-ID: <20261125102700.126248-1-alessandro.zini@siemens.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

Add Goworld ILI6150H6 panel support into panel-simple driver along with
the required DT bindings documentation, including the vendor prefix.

Alessandro Zini (2):
  dt-bindings: vendor-prefixes: Add Goworld
  dt-bindings: display: simple: Add Goworld ILI6150H6 panel

Wang Yang (1):
  drm/panel: simple: Add support for Goworld ILI6150H6 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 32 +++++++++++++++++++
 3 files changed, 36 insertions(+)


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.56.1

