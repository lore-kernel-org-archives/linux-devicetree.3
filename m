Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463876;
	b=xPngpcBEj/lcpiayhL4x2CUi7WyroGdxmlLGiUz6oBhMJXJB2vyAvZFHHBNTiYEXu9rY
	 yXTtP8huo8Gw1PR64Sbx+XnIvHMKcyzC+gwLzqDs6pfbq/nfluAJJeGlWiZ21M6PwSTkO
	 vFMpoJMN/Wa3+431cNTHzuxXKjIdGX/ZqXAvNg1Zj2WAsLcyGcOtE+cipilvuZmt4fG57
	 jkp/f8GTsaAWfxYarTCaLgvN4Hi+mzukysi+hrrbfqMjR5g7DhKDkEhuOQEPDVLLSfmo4
	 Bg04FoExxwVjoxRNZWTirXkBOBff/3/EWdxVlFmXDMC0bsj0qc7zEB6ZKot0+PIqD8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
	b=LvV42DCH57+CO0YAbURKiyHJnRxweXarxcmNG+/5J2tHYDMNWOXNKBSVOg+hfVIYHJLa
	 U4gD0EVUo/M2J2kL6b1SCcZVTZkIA+9jO6Vzs72dYRI7yP4wm8kcIQZkSr82GVu0A5ZXQ
	 Hw4SwlgGHfchBN+b+L6lCv8Gx42cEpnzH5JzvY28UuUd1hWoFWcoO7jtJUF8b9eTmut5v
	 BDzwlM29gCH26eFyd/n/s5k82TKMwdueXo4fADjTIFq5vmdi/toRLxKZeyewGYpPk3mD1
	 VXJeJH3+jShMeJtBoZcZXWFdtUAnkmnhzvoyoUM16v/NHR1hjhfRmVcRRXHjJyZmw0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGqGKHJz;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C9606A339
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8C9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lGqGKHJz
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93a40a9a01aso345043885a.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793463875; x=1794068675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=lGqGKHJzDGXW17jD1pryPBA87LDIwWyOzi8ssjyyiVNdhFFuW5BBmlnYMDlxTFxKTt
         PI7yyIZlXQ2rk3UiSv2OD0mL2nqff5KNMDWzhASTkZtDlOVR0qbZ75V/EvbO0d7VhEeR
         LuDxSX84IBSJYV7vwANkLCkq5ODi5x1RypITAppVUuEhdPormTQR+OqrF5fIKaebEseV
         4zGWOGDG0wiOz7ZwvEYqWs9h6r6vNXPiSWW3by6mIzIUA9xOOxKIp7yYXOjl+teB3K85
         1sZovvR5gYzTsezBib9nOY7Ie0npgraHz0HAAThVt9wRL7/++PwiEluIX4vXC07q7tSS
         LUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463875; x=1794068675;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6exMPjzPlDYktg7Qt1ZlrxsNxMuURpKWW9XowflKwXc=;
        b=laEsXG5TO3bYON+FzDUllw8rMwU7nQv1RsGKkLNyCEOyhdbZ5RjI8nAuLPS257wZXP
         NDif3NCJ0reSmnJhx9kl1tjVg62Bf2fxcWH5eVZqjUf7yyvaGcd5dvLsWKvXZ26cas0L
         0vsDjTJaMbW3zZ4GBBrbX53pBfrCodOSunu0Sy+25CJ7Bfkk3GtT5yeFp9oyFwsN3Ug4
         dQFZ8ZgUCdcHyUoSW90V9OmDnqDGy4sTqHGbcn2HnJTPG3i1LhZ7iiKQePrgKc8BGMdA
         lASKdpwHyy4WSj5iU4vI+HZHWNjDVdMoU3zbUDXNIMxxqMh/tQ8oRIYbERRkrZpr5wO5
         DudA==
X-Forwarded-Encrypted: i=1; AKwUvByNYh6ty735MBIGOtJ0tR5FOkRkKUD/q2SGuzLUIJSTZMDd1G5xw5d0VKf1z0Zd10NoZKc+V6p0ta6i@vger.kernel.org
X-Gm-Message-State: AFq9FYKQhQI5M9I1wjpGlYiifeJzXZLHA+v7JKbBufz956xtqvl1DymI
	s24h/To+cqT6/hsDNgyF4teVPWBuadpMUehWglQGXXwo2guTBLPt785z
X-Gm-Gg: AYBFou2VYfBcTS3a1QM6CoaQcBmfUzEazFb6LNMUt0Pw+tQ84G4BcPEY9dKqdE2gE8h
	Z4UIoHQpO9HLqAoUUwn10UNpkhKREAvNrBYgpdkxhAQ3NL21PvEW4bvV0sldBnKYbv8Hr347Prv
	IYSm6NkjyAAiIqnUquWDwg8KhiARAUPVT+ayQ35xsqPpVGuh2Yj4Wkw8ropp20oGmPV4ZJVoyD/
	ForhuO4FSM7GBYR222aEohhtPMON3sGderJcEruPY8J5/qvN6Gj1rOOMH+TsOnOg1fQ/4aeWmFD
	QEJCNCbfmzz7fo7XVNxeYnLzqmlg9JJ1mDImCDwbb2fd1bcVfQYCjgS+VpGdFt+3JP+6eeQEFR3
	6x5gDw+MLN6cRJ4Io/JULiTZ05sRBDQhLvMd52/HE+N95HBxLM8payOckvsY0AJQM2ScNjNlA9w
	WmVW+06st7F96I5wbGxl/4TNjP56q66I/EKUoxho1VTAVJdKVd2A1RVk9sw67by4afqQr/lNGQ0
	Cmpvcw87H5wI7g+/8nG0aIcBbKwijVH54MgL3lczW1CdEVj2OfoZWpo/h20m0Ybmc6CGl6jkx6S
	8v0QxS/7OmG4rA9627Z1UyyNCYFp8boM5pZqemKlCwtc8O4b1MBIWPIAZeXla6AtbRo8dS/Cxl+
	GuZkdMA==
X-Received: by 2002:a05:620a:1999:b0:93c:891b:90f1 with SMTP id af79cd13be357-944133ab8aemr1377062085a.26.1793463875288;
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ad7431sm414076885a.40.2026.10.31.09.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:24:35 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>,
	Burke Cates <burke.cates@gmail.com>
Subject: Re: [PATCH v3 0/7] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 31 Oct 2026 11:24:34 -0500
Message-ID: <179346368316.44447.5094215662368347048.x2e-share-pm8010@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
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

Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)

PM8010 at 0x08 on i2c5, no interrupt in DT: it probes, and its
LDO4 and LDO7 power the front camera (ov02c10, 720p at 30 fps).
