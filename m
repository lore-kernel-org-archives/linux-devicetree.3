Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267069;
	b=y3YA9NXsITULdnlFMWLb1udBOnxduedjt1H3MZdyClkOcSF9quMA0wk86ZDSCcNnD3/6
	 fpYizpctQwsIjqYH7n2B2q4/T/fdU+nqUqrfWhniVgY1Yp+Ncn+oRavbSJ/HX21yYp40X
	 61TNhcXEW/fVUbYpwMW2+DGlOoYglz7OoVycg3w/ljyBdTsaK2c/Wvu93N14JU1VH+Vxk
	 QREgXk2de8YIf8sPM2/4KvlOKqdA3fzqub2TjsCN3ecuKe5wSlxMLXrxomYFl58AdTCLk
	 yxV1Jj11Y1J8BILOs/ZYt6+9+bcA24q9nC/DkqdYdbjymqgYdjyvbR8aEHPMKGl+odg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
	b=f7bVszZ7Mz5CxUM7Tkh+FoGwMg8RCJL/rXJjKpJo8qh6uuWU3j2GTm8WWXLIevS/ckQ4
	 geOyvTk583PhAkbMxPxRh89iQxpiBy9ZqzOJGC8+/5E9AoVxl9A8rM/lv6yOdMBY6BPl5
	 X0rGutlUPxS4UoUptD4oM/CTI6fpjVqz7sv+o3SDd11BDejpuVU1CEzfTYDjMK1jg8OW9
	 uhF0Zutm/5pzFcDSTmQWIvtzuIC5P2QBjo2f6xV9DtkOp5vV4GtIBjLSzbOrS3IsibmH5
	 tDC8LUF6W0obgTsSrMCcHDawZQJG2EXWwMLiFsvWmO92Z66mIhUM65WudiHjHKmx7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds;
	arc=none smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5937606A320
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5937606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z5292Tds
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5363c8de563so20520571cf.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 05:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795267068; x=1795871868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=Z5292TdssQirJ7anrgy/Ycj0wO1diReVT+xjqWqnvVpWW2hxPlSx6CnnlxSpqetc1z
         +fddjESnGkA74Im6cQr17DvOW+VGIqruhO1KE5CwbJvPS54ALuMYtx4ha2VuyybUPXaT
         reAh9DT5rV9fy+W//lI4WB/2FhxslsHRt8LxjfYv7VRLIEVwboWlnhQtGGPVYMmD6ihL
         rqPFQZBMUV+gKP3QNnxGnSycOaF5ZFKfpghOCMHkZuVfrGH7y+3NT0bJUqPxS/JDH9QM
         4l+csvlxSOav/F6ZIn19ywP7A8Me7D4xiu4/Fmr/Wb6uhFimbUOp/Inli4T67eYP/2Tt
         /qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267068; x=1795871868;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgt/byHJz73fVZB9npadRPJRCi06Zbw9U3jYPp0MPbc=;
        b=yrlLZRwzqfCFKqdK43+vv3hW1o4P/aNxVnsVVCkotqjiu+VEPOYKVNkDej8waEZPiN
         2SF/YUjBP97xUZ05yqJIzq7VOBIou2ZDrnDv3I21C9QGuTCSPYwG8qlNY9FOG3clUL0S
         kfmzyAVT5l6B87iStqcHwGzdFQEFt5+LdWol0AHM+gEPHrQMSSKhjVhWqhGUF1Sw6tJU
         65sNozQoXIOCBY29Li0Wy8fE6Vv/E1kX5LMglSSSiAQu4xfnlcihLmQu/bMc2dIcPw92
         HIpDOPcx6yym6THxyEmV/Pk7xhV0BJ+q5JfaU/ITJMQinbbaBt9kA/NfKZX00Gtmnb+s
         sETA==
X-Forwarded-Encrypted: i=1; AL+hErFxoNun3P/i0927M0tldXGuqpKu+JoKoPxMkXf3Oeo7J0f7Qo94kfwpo/NkUz8AY55QvOexVf1JzaPD@vger.kernel.org
X-Gm-Message-State: APuU4Z/KS4N+2u4NbUXclcmnEyuv9M/GGU6M/5kvK5SJJsD/psW5TXMH
	sjqblMzoANk1JoVc62ouk/wE++DeFp2td4n/8c1E14MA1G100ZfzV+nbz2oJdTeQQXb/c8avQEV
	a/J4d2Ev7Qw==
X-Gm-Gg: AZFdTZeGh5I5t/d4YokTplcB2oQQ11OIUCMJeUoe31IkO+skruoUpjg+B2FmClNrLqG
	aD28zG+cvFge0OrKl7bs24ivkn5230zR5BSwy26R1nFSnnnetlwDZZBmD0tal3036PM/uMBErDW
	+B4R9YGRURV9MA+XcRfkYxNNoYJKaR31bNJjpoh0s2Zbc/x8hIXl7hSOM3e+nKN4GIBOAqNbpNG
	jKlHv0Z/x7QlrZ9r+4hheHkc+F1PcbQDLyLp06Pa5OlDJqObrGW73HFO6HNCZXapxp8uNpRepn7
	AvyLAfABdVLomjgSZDaf6WcPglpLCfyKULoNx+3mCWyqsBxROOYrr4ZuID4e42R8eTJM2X6CXr7
	c6NRaYT3QOGSOwcKFzG+08hERlCD17nHiFQqjlM4RoL6r3jWwDkkZNwGcH0TxwtycBYsCewPLrd
	V9HbSz2cJ9nqL40dUEZT2vDziUaujuQ/IaJGf2DT6cHQuEOj2IaQNW8Ss67kgHZSV/REpMtr+J7
	iQcJHFsDnEOEomphqAY6E4abie9Fs0pK0AypsXVf5bZ0noBwE1AJRQRy8EniXMObMuVsxXJgg6O
	o6RQQCHhwMB6gBeMkqYTwFQIr3u51nwKsQYIjcFYLYmAH5L3Li7D69AsUcEzcef2IXHRZhkgpQc
	ONSTZjNjAeeAuB/SuhxEkb3bcr3iLqIM7cy8lgX1IZZwkr6Jne/6mEYgAjP0QTErJJXvt3w==
X-Received: by 2002:ac8:5f85:0:b0:55d:2dd1:48ba with SMTP id d75a77b69052e-55d76aa2f7cmr111131171cf.60.1795267067663;
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Received: from localhost ([204.244.107.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b1e58sm53873266d6.12.2026.11.21.05.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:17:47 -0800 (PST)
Date: Sat, 21 Nov 2026 08:17:46 -0500
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awGZ-nCCbCNEuyr7@maple.netwinder.org>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
 <awATU_lyjPBxThwq@shikoro>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <awATU_lyjPBxThwq@shikoro>

On Fri, Nov 20, 2026 at 10:30:59AM +0100, Wolfram Sang wrote:
>> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
>> +			  unsigned long id)
>> +{
>> +	r9a06g032_reset_set(rcdev, "reset", true, id);
>> +	udelay(5);
>
>For future reference, please add a comment pointing to chapter in the
>docs where it is saying 5us is needed.

The reset duration could vary for each reset ID, since they refer to 
different hardware. There's probably no "optimum" value here.

Ralph
