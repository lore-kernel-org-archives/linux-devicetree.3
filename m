Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378509;
	b=quuwU5ILU0T7sdrl+Pt/X2xkn9HAZ+kKVyTtyzPR2fx9u3H1FAK7Snx2kRBrhhFudS9e
	 2b3G1/ZlMxfvZ1qLiBr78OMYB6wPK3xoY2JLE9sF+jSdT2zELcI00vyJiPySt9R4B7N9z
	 f3LvGcuNJXbABBsk/EPNjOIqWyx8hNoWnyT9buZAGRLdoxYxjEgHuzL4nlFlQPPKfDMar
	 lH0btOErSzYsTGN5lKGmDkfnsg0vARJZaovgzvaFjHTBtofOTp94oknoK58u3130D7Sx4
	 83jaNKGWcV/8Omlu44+x/wK3Cx4ZlD1O5GzzG7fwApGzm0gGKca0unNJY8ajcWWzeow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
	b=WMIATH0x7Sw4VVjfspTwvWDenSSFtNPaE45RHzSYiY1/3tdiuLKJ1l9pXDGBoQ1D8hUy
	 yyZPxAPysdLgyNk4STx1fKvsgfOj2fizX+H04HI9OiT1miFnNNwBvBF7lk6gECSBTIWYZ
	 8Y2UrD0pziOrMy7BWJAvRoR5fJs2KGX6WNV9H5oGBT2tdppnc6rC4D1sxCtt6M4DZZZ8U
	 CGeVr44e71P3sM7Or5VCrwkxvstOhTt9SIWuTFT6gDSGIptq88b8XTQBpNgPsORVrQuPb
	 4RmOGNSZJytTR7ah+R5VugP2Hywcga1LWGUucNWPAHjgp1mY0NYFb82FodtsDxV2ywQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYm3TeMk;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79A3606A33F
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79A3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYm3TeMk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5133831027so366584266b.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378507; x=1795983307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
        b=GYm3TeMklN6dkS/HNb6FOP56f7UVPTedXjNJ04dD8uUgYgEKEZi7qmhLoQAVkFLdcn
         2MZBbHzPtmeP5y7a4J59YU0ljoSBSfwfb/rXhWTOlOqEUt9avn+PNm2BTD2TUzaI3UyD
         wM7bVoxZ4Wml/S1Dq09CSpgZUKkLrXe6VAfnroL5JvWmpp/9qxH9XhGUeQ5CMPCRb/ZU
         8pV+VCfOju9Jonb59/QugN7jJOZIqBYsqKuReVj7UMnMGGzSE58/YFaPvTcOsB0D/59r
         rPfgK0jF80stTzk9uPBg4/uiVjsQNTf0uqaXZ7J9svJ2fiUNADsVh8IVWVA7PtXanoYI
         pt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378507; x=1795983307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
        b=qKEVE0MlZ4OdQlb6zYEHqGZiu9bKQaCZcbkwVEvxc3+HzAlI6Hl1D3d3xpNZ/F/U0V
         nFGX9aFEt5kucF+GXAAA8LJEjEpCq4B8VF2Yp0f5myKMWiysA3aKKv+5cySMpdF6Md8B
         LfpjmibkNr9eVBMZe6LmDoWx2nRmEgvi1aOQzLuox1W9ETZelHK2KF/SEi3dvFQANSBZ
         jB4ngudmApVvsXPj6/iOPgCAA3VhqjGatvvXtK9ZkBqUHqEw1p/OIh4EOlvWY9GwTiZq
         HMbu3S0mYSG47pTO0uoQ1yXsnxAruF3CqQB5rUR/LNLx1ey5Mf8BQ3v4nji7yshk5k9u
         o/lg==
X-Gm-Message-State: APuU4Z8j/b/Xvi8QfXeS+9ph4B+U9ksiNjAyMRFZOMSOoWIh4kolvkqE
	I9xbkrGzVyNvbcWw3uDg/YTaqumOj3gRWcXsEyFBPdGddEUPPiQqAFWg
X-Gm-Gg: AZFdTZeHLTMp5C2RrUddk3QvKHZY5aPkIYK+SQPmOzpyoSZOo9ULol0S2nrmTwKMogA
	3RTfam8eDi7JdiVwOfJLbnWoYE9C+QOp51mppMsVPScJ9k0PQF/jrjyRXabqH4UtmBiHHInsRLz
	DkJluw2SCr3nJ9XWbpwnUfPbD7dwIbnZ72ggOH/Boq4mTZcgOL43YIwsOFNgxNiulyuMSHzX5UH
	W+531lvH1FWVgYSMupdFdz77ejaERUYEbQz6bxkwdrZV5kpyu48f+KsRWGIoz7rKXm7J9PCWW3Q
	ZQHmWqrJpxnGTc6zDaXPl8SDan6eWgNZVaxfWHTNprvHu5YmOTozgqmb1sYKddnF+t5Kl/ie4IO
	gVwBDtAWCbwQwTJPGNXJGrEd51KvAgN8Z9wpq+6GV+3llFOCQNDy4yoDEOkMjylsQ6qU3V+pIPn
	P1kdEADa8YTxRlbJmp2NAD+2guA8R1yGchL8nKhazMgh/LM73+7iKv1OEvvF1Pu4rtuxrDJjEM5
	NPsefZVBIgoEfckR6hips4QI9G7ZuqW9TCNNFQG8AUwUsUf9qei8gXRIVYxrAjh5ESKJXHedCiE
	BN4YcD6KPKqyTvJtXHisHnXKQTfpaJu+6//r9Yzvzfd++VFR8LrcclXGHSV0lKD7/d6bDbVoSnw
	KodjdSTvIJw==
X-Received: by 2002:a05:6402:280d:b0:6ba:b1fd:6e73 with SMTP id 4fb4d7f45d1cf-6bab1fd714dmr689422a12.40.1795378506948;
        Sun, 22 Nov 2026 12:15:06 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 18/18] ARM: tegra: tegratab: Add panel rotation
Date: Sun, 22 Nov 2026 22:14:07 +0200
Message-ID: <20261122201407.23742-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add panel rotation property required for correct panel orientation, since
it is mounted upside down.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 99f0d1c345e63..35400af7c1c1b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -175,6 +175,7 @@ panel@0 {
 				vcc-supply = <&dvdd_lcd>;
 
 				backlight = <&backlight>;
+				rotation = <180>;
 			};
 		};
 	};
-- 
2.53.0

