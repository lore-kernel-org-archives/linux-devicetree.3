Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938638;
	b=ql9awEF6MDmPd48TrDoXLWV0xh5vHmeZtr1DSDO3y48rpxLpMxw6BPpM3a6iIojDvZM1
	 gYp/HcO4U4e8eCyfQVn0s9NfpuIGLcM6V4PGeEvggamjOwy5NnEndHElW2IAY+8YPtPdN
	 0pTrS7SBi68IbSFGQBBn0wf75fZQ/CnGcfYwA1RYg5DOnEfGnusEJy3AcSbCQtZzGVPba
	 Q6JjpMRnAES4XffWc8KY07JzLoygBo4UF4sNypFfRl06o5UZLNYOJg91kFcymcyaVlst1
	 zynIisFskFV/0OnKiE6cS/P2dFWRrstmUscPngrrL8kG1+NUdzJ4IbMjbcz9augunsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
	b=md9TSx1CGu3tG2o+WGaFYZbD2gmKVti41k6xnM28nA/z7r1EII+E+CXLtfFmQmaSzixn
	 uqzcQeThXgfGz/qUMOl5ODhF5qmUAoTUWBfWfNycHu3WT+I4qWrJCtTE+bxioUutrI+W3
	 AbKNpMFS0BsFCiVoM2ljPmxwUJDaUp/akNv58r1Z+jvqnQFRKIC3alijM+nzjjS1I5Pdv
	 NCXNtZxjB5rwZP+8IBkBNd6xUKrvxxBKrkiN5JAlWID+EOOdDlyMX/KQczphMhaH3H24v
	 gPLh+BwLKkJ+SllI9oyFEqUc25ljiprh2LeSl2swdIv5XCXIO9I27v8u8X/4Uzqe2lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24657606A334
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24657606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso1633925e9.3
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794938635; x=1795543435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=YpD0FpDDwRYk0+tTDmxkLlPBd1kyejPedJ5+xOxM/EcL4d4r+LLb1C5UTFjzFDbyHn
         lc8CA8zc0kpx1QqrFK8MRm45z69yXPEqhaARuSnbcFGPXf3Nm01/FQG9hmhjRE0Tv44X
         zlRDlB916srIukvu4S0uA24/EJktwNQboQh2nKfSB/sV4NNph8SJ2NzpwcXQPWC0YJOM
         Jb5+XQj7vndiTD9RboYhHMRDqX3dUBW/3OK3h5jSoNG7549u7exgeuds6ElelV5mZlII
         E4IVOAL70g4E4TawfnDbnk4kKgLd18gvQzUpvMGuT/GT+QYhyeBFkrUg2TFRLOjx+4y8
         wCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938635; x=1795543435;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=GEYDWrsi8b4IDGuniicdL9VO9bxK5O9db4OFqXePIzn9OnpucxG3lwHjESm4gF+3GK
         j6KO89lbsETDepX56zxb9XQKLlr7S+7qnnqEWjpdM0jfUlVEeJ9aKTuQ/pTnSDTxNkvf
         wRF+3ZhhiKtkTSgqexcXl2FT5Yei0UcH2ZbHrEpI2oODyL8sPOs8ssWiLeN4T9hWdw/j
         4hYcthATZZiHRnyvzdMp6l/3I5njEGilzFmFcT/r/8GgySndD8b+UIqkhkiRyGpHsIaZ
         wrqjiUdm+bf6BurLafQ5BJNEORX3HEfAEJLLwPUe2MI7f5WL9UE7I3iJuAg66W3kFlFr
         AaiA==
X-Forwarded-Encrypted: i=1; AL+hErHCdVRDza+fuBBnFIlbaQWYnqMl0koZjvQ6hMiat8SB00b7sYsokhCYuJjvSbJJ5khjQOQMtuWU0uz7@vger.kernel.org
X-Gm-Message-State: APuU4Z9HK8ophEGCRpjm4LCO1112I605XKetmylTMiBFYrUaQRvyv/Zd
	yYHI4x8qwgrevY03ZCBG5q3+o6QkRlMY4nJupv28q/YqueVEleiS4/Pj8JXSX7yRLY4=
X-Gm-Gg: AYBFou07jKPVeJEW+Ko/kSgdNRpoHYkmWxT3QwRki8fraLvSAJPYfHl14mvVy40++Rf
	Vf5AnKRR/GlPa9utUAHRGC9r/1T7CzZzVHQGGGVA3GX87bS+9o5DHX4gHlkX4y0AqAZiCwpna0W
	zC+xH8sIkhDLyr2tpNYaOyOTx9Y/SNI2cv2B9ZinauSyov8RfJSCchEJ36ualoKeyuckbC2UgGt
	xuNCEBFjzY01NgDsMGHlWCyFoslX7QQIDC91p06aGrMNjJAB7GX+PY9UKSURsxkMEZzBtaao2SQ
	7ddNiREhBu7UCvE/kMc/d/hohUT7+j1AwNh8RDjYjcZB9WtYQYi/Xxvm58ougNYbatxdWWkFdYe
	WIo4+ceWWL6BPsUKzTPWcqvqFUdWrO99RnLBvZNtCcUk7Pw0m1tHk0CrB0c3ZG/Sx1pckr5anCK
	GkR5Lc6EU3Ib9yZ6UEbE4tPZfDMKESWjxrwJipZ/FoNk29PqXh/XcUK7JiY3lThepNG1sKsbhpe
	8M8z/g9yiB0MuNitq1X6tV/UsBUlRN2Kujg+HM+ylTjIN7oP90XEp5H9sEzkdR84WY7Xzsjcizh
	QpSY/O4Na8KfKcwpMfRz/FbcXucxOl2fhQ6fNTf9foAxVaF+
X-Received: by 2002:a05:600c:3547:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb55aa4fa9mr306817705e9.34.1794938635593;
        Tue, 17 Nov 2026 10:03:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm81197935e9.14.2026.11.17.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:03:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Tue, 17 Nov 2026 19:03:45 +0100
Message-ID: <179493854888.412784.10630903001767923804.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
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
Content-Transfer-Encoding: 8bit

Applied to clk/linux.git (clk-next), thanks!

[1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
      https://git.kernel.org/clk/linux/c/61b67dfc9c24
[2/3] clk: tegra114: Add CSI pad clock gates
      https://git.kernel.org/clk/linux/c/ecb755d4fe97
[3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
      https://git.kernel.org/clk/linux/c/4d55ffabc35d

Best regards,
--
Jerome
