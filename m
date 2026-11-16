Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864314;
	b=WZ3wQRdcfgeiwUwqbGJwlL2Eyy/ohduJHk9gF3lahnaX2xMNZpKjN5cMHl+JmtCBE98N
	 y8hj0aOsw+/6yisVwENdTW6GrfAICGy4+60LvNQHlQoFMVQ9RXTr4KIktr3UHrBarGWuF
	 kZLsrmdck8bsyOyqdqSfWQLKTSW41RwS0CW3Yr4ikxek8XCxuiux0b3pjSlh5SMrOgVav
	 el4H2H5y6wdhenLT3rmWJZSRzY31MTglLqbGlDLpoT6rNb4Kwwnq5A/kIcQN4/FyLo+4I
	 Gw/ygmY1AsP+RvDz5ItRzYAVZF8m2h65AJ7+/HstZRqR5t14tHcXuexGfVfB16GkWVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
	b=VcLfN/oEOip9r02JXp2QZKRC/AtU7aKOfGWRzzXV0VUGnP+y/vmjnbfipOQ7pyucRoCA
	 KTx10oAKj73mdkO5i5DetniTwMJAiXQmm1V1CKpYxiPqXUDvK3GXTsAa1ZcQoo68xIa5A
	 YAj76DSegODyDApUVvNJWTSR+WVb8/YP/PtVEMGNas9JiylmFO/uyX+uTZdoTVNtKjcAJ
	 DOAWACQ8AiwuD5XzWLyULN9o7hgkuf5RU9cOKHuYuthos7fzuheW3o/w81bhO5Xxaryiw
	 UqT8qXU13ccENYv7NoCb6KX6rdzGYUBxfTYwfdJyVaMxwtqLYevKvf48kYSI1C2S/qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crKqWpBy;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7F606A322
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB7F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=crKqWpBy
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so11292665e9.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864312; x=1795469112; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
        b=crKqWpBy9v9PmTiWD5cN4fT6cTPSUgRhGGLMmQFSUba8ExVSKF2vjESeXDDhOae5pA
         rka/KPNPbUmqrz86doZE658P+yDvCys0FbcqJ018GzsU7GCACJ4O06ZWwGgHaPMxA2OD
         ytTESXi9Hcn4bA8D1y02uinkXD4u+sRReZTUIqiKVJGQdu4hQRfNtfPYK2mQsCxvXiti
         PEIdXijhuXSwohct+dh7Qh3Rfoh2sRFjHXqa5TT5MyEMDzSO26jZYkC8X8a1GDfbt1Ij
         8szutdp+XbCjFldFdxWhT/sxaFGGpgMMmbg89VoZusnty0wapoSXJc9jEKLdSZekifB5
         4ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864312; x=1795469112;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQn2kGhWJbaBGD65fKWwqKtr6XDMTGh3Rmtbd55zkps=;
        b=JrHMyBzRmEq4z593N/L/KeaUaZIjjV9FTOaolWZ0LmuRN2dRJQ/NHMLbX7QWh9k6xI
         PZfXKXMGBnPLhzOzyo4Ad+YhzsusWxzcpb5g5SrON6H9FPh+9EK5rxChChROGxSaDMey
         rK8Fw+2qFmvJXU4JomKACDRhVSgMeTqAQqVsmwwbhwlVhPKvrPNJ+9p8SwWzsSmz9Vx1
         r493u1aR2rNRtgJLzW5h/A9XFsTAmC32ozihBBGuN0aCsY3emoIbt2It75+sGoOu87J6
         DYELqYvqSRBhW4vNaptbZA0eGC9umCe16/aQslfzyLxoHGagQI1lHOlmtcqWQiliT7kw
         Ygyg==
X-Forwarded-Encrypted: i=1; AL+hErGqmHhhw7xk1e+vtKjJyBY11YlqeqUU0cA7eO4m2k0+OvPD8E9YdLkjociY4Gg/4ANPFOs9rvUN7P6a@vger.kernel.org
X-Gm-Message-State: APuU4Z8zABvzsJvun6V3a9L4Y/4ehWMWNEGGDcKBzNAIgXN4OKeqbiYu
	xIhZxXEDppE6Mv0jiiP2ZyeC4HAJezaB/y9i4VRRprVSK35GaK4jInuB5/uVEHuoKCWkqA==
X-Gm-Gg: AYBFou3x/qRBnxGItpn+749bchKQCz5f1bGUr6twOeID56sfUqbFa54AOj2e+dxuBR5
	qa6jFMTGItrHSsfObr+X4n0Z0gxHC9meCU5DP9lpruwvOIthhuwiTnr/xNMNNyonLmh7AcVpV4x
	bJuAiALUOXyK0f9GnQa1trso5CHjFS58/nUJxqlkq9vgZ/2oPLbesq9OUMvQOYZdhahbdZdmZoO
	zO/iuDtthnxARpI3hjil/qZIlh2mUqTuThBCraHwQOd8PtKEBEfXcNnnQXvFgzMv7s/SmPyOgwa
	oTeUqXOdvTqHY3cFK8ROiY4lruPtNfBU+MIiKH7vXT4T0je7soUA5e7DZV6LxePwU7jTduUVoaY
	+R4nixXQUDKidxKpbf89zZwc5R9NHrGGBCyEvd9uvZ4D2P+Q7F42dpowYgioNcOFFsO6qAiT4bs
	oBkR62Gl0Xc7N0On55gy1HfTEcB/qRnsAfEPzsAPHDwtVvSa+l0cI2Y93DC/MkpE04MtnC+JeJ0
	HleMq6eoQrOYwFbWpR0LjiydkU8Mu7yON1BUlod3GMHnogmC+lpyAeTpMFq4pxDSl3fBiX2NgGI
	YyhUcJ9f3I2S/v0dG/hUau7F70N2IOYoIB/s7NS4drl0MSRFNtuzVemDoOPOSg==
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr183128505e9.27.1794864312370;
        Mon, 16 Nov 2026 13:25:12 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:11 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add cpufreq support for Qualcomm Halliday
 (SXR2250P)
Date: Mon, 16 Nov 2026 21:25:05 +0000
Message-Id: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALF0+2oC/2WNyw6CMBBFf4XM2hqmKFBX/odhUdoBxvCyBSIh/
 LuAceXyJOeeu4Anx+ThFizgaGLPXbuBPAVgKt2WJNhuDDKUMWKYikrXNVs9C9OPhaOXQFImuqZ
 IMr/ANusdFfw+ko/sy37Mn2SGvbMbFfuhc/PxOeHu/fLqPz+hQGHTREcqiVRc2HvZaK7PpmsgW
 9f1A8w7k3LCAAAA
X-Change-ID: 20261108-halliday-cpufreq-1e9c3581e2b4
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=1354;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Vl3mWqPNXbM7HXPxqhlw3hT3lk2vRli8dmhGXwQ8GHA=;
 b=mUNNSB18W8LJ/FF5bhpDD3vmw81siwfrYgshJoZ1CBZT9EROHlU2rHOC6cPim2pc7eyXwRq4A
 GwdTh0lHIa0CJwIHlBExQXh3MMeIBeUNkfF9eAeGGTMsHnlz/DDr5mZ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) of the Qualcomm Halliday SoC and
keep cpufreq-dt from probing on it.

This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
in the Samsung Galaxy XR. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR, where cpufreq runs through
qcom-cpufreq-hw.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- Add the qcom-hw binding from the DT series (12/17 there), so that
  the cpufreq patches are in one series:
  https://patch.msgid.link/20261109-halliday-dts-v1-12-289114ab8197@gmail.com
- Use the "cpufreq: dt-platdev:" subject prefix (Zhongqiu)
- Link to v1: https://patch.msgid.link/20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
      cpufreq: dt-platdev: Add Halliday to blocklist

 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 drivers/cpufreq/cpufreq-dt-platdev.c                           | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-cpufreq-1e9c3581e2b4

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

