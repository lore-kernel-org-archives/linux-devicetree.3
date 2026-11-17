Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883513;
	b=5Pb8ae/LwSh/tzWoSBGVF2BYSA4I5rhGBeMOeWOcW8rD7D2ZTya2DkwaOTa0JP2g8NUr
	 a9c6sQWchO2IbnHLel0OCyF/cM2CLOm/uaDnV5dBrHhzWQ7L7sbRd+mXPOS/ezWSsFYaR
	 7/fyckhG6ACXLe8jshNZtfGU51acVNv3FVvMYIzJDFZ88C50vqtASbvNcHvCa8L2o+lWP
	 N0SRXR5P5gWb/WlNpAtYELuBkiR5SIqJ5PdjsoqCZYMQln2qsHErUUIe2iIcbyBIJ1IR6
	 2Gup5V6chq4MuppNTU8menJAoA2tSU9vSgVoDJ5lfsuM/MIsHnGLKG3rAaZTthARiWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
	b=hg7pz+pBJ1VURuwHWpLffvFRQGBKHMcP7UIIgm9SmSkZQ+2MymVtSkYgZZFuI0rwUNML
	 b+8ZkTGH5QTnUyFUaZYR3KqY/THMxCgolPzGVl7zfPVzHHpNfwjpY7cDr1BkIb+yU/sUj
	 n/TdSI/dTjX4EsZx+efRWvSkV0J7BGoLWs7cUtpypsQWLdwnyesJvi5b7ydFiTHgIjFd5
	 PpHjiUBKBL+quMs/9ssAkYyeh+NkPgwgpDFMgqRyhfTsvTByGKx1+AztbL1d4JwTNFw1t
	 LjC/pwJdhJeGtViLNGBBopo5YmiZBsGEPSKr/bQ9aBTd19+6tq/k2Z8TtpgaHNhiZCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GiM5kHxp;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E93606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 02:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GiM5kHxp
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so373476c88.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 18:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794883512; x=1795488312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
        b=GiM5kHxpbHlSgBe73EDBEVHyZ8dR4FiqscAYsivOqTIGboQnK69HmSSSI94qxUnUlY
         /4VS6DpYs7r027pRB3TMucojsIyITIju1/Hks59uI9HPgjFotN7njLXCS9NHgLtUoUU0
         /0io4uoIHgHfERHS8WNAUGd4Xsa76xUq5aSvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883512; x=1795488312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
        b=0ws1nvoA+18AO+Zg2dykAGQa/2BoVU/zND9oXrGFmo7ZQNGMfDnO9VTJkuYdaKO7HE
         3qtsT2+GM3LElBuqXU8x8S007pst4BZ8DgfOTrX4tpNSeIpz+tCI7mP3JMcF3C3Srtv+
         ABC83fUSMIRFdA5L/RdZuU3eZtLKI+CbW0QV4BjilVN39Y+3pWvGgssz9OHYt44ZVBgY
         wQQb1RfAWianatzq1a/I6NR87HpYdE7PVWhaCHmv/XfuGVOIH2EwScOsLME7HhC8HrQn
         9rm160fdOdhIN1N4H0oOzerqD9m+DtGrgJiHxBrPwKGQgrVJ0APVmkClbTseANjVjw/F
         uB7w==
X-Forwarded-Encrypted: i=1; AL+hErGF339ySDgrS1Kw/80q1+ce039yUQwPsgNbw9HJBDGzcc7dgMCTcZd8zQV4gxyt8Vnhc5h3R2NJPzcP@vger.kernel.org
X-Gm-Message-State: APuU4Z+jMK1Dzq9NEMDUguiNkXiNZgGp36+juedYZ36SoOaH7A6dXX87
	z1qdJjyfadJMsLuMGJ7lWvrscJZJJrkjiVXhCfiFwGrhacEOuVtKmkWuy1UGKC860A==
X-Gm-Gg: AYBFou0ojSIr6wMpA68rm74suv3MuD5MIYIfas+T9iEZZFNpuG1s1P1tHYkThTCYufK
	KAO0ZKffMn4LuGTW4eJAmnqgMDeRWvaSS3RQ9eA6TlRt+aHl+RI/lZmusfTFWF52F0mHT5nceIX
	lPoY8jlKvFvrER8Fn6CKxfKLKcOzrQe3m6HCq90Ra0L8n6RALRZDej7BH70+HUMELt7NPyLu8cP
	GQrOETmqxR66b67+pWJIotV1gGTMPQLIezjqxyBOFdyNhYJZmPCyUz/iiLHily5mSKz8lET+dwG
	kbCPTCgdoPkCM3Kx6P/IQSis+Lyl9NLYiYm5wa6+mmb9kgcmCMd+rQkKvuDbyuz4jEDY9mQp70C
	zeIqNivitdgnnI99XUOYd0yP251s0cqFFa6/qCthVBvD/KzvAHwclHidzHOWxWMmqxY1oyEys4z
	7q4O16ZDIAbAU+0JzRai3h26fuymnMhPeHw8lzBB6hZ6AYLUPUQ6qEJnGgKxdi1LZjf0fkPm+s6
	8IX3HEBsVAluSYWeYJqGU6L06Pr/tp3/ouTZ1I2m5fd00WF5OeL78+lA79iv8WRAUaRzjbvqEF3
	KNvB3YHfuyE4jgMXsj1LYmaw5hGKCOk79Ur4g873O6ApvUIFe0MDjdMy1HnRbp9dOemM
X-Received: by 2002:a05:7023:a4b:20b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b50314bed1mr11824518c88.15.1794883511648;
        Mon, 16 Nov 2026 18:45:11 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b50319d40asm37154597c88.11.2026.11.16.18.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:45:11 -0800 (PST)
Date: Mon, 16 Nov 2026 18:45:09 -0800
From: Brian Norris <briannorris@chromium.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, conor+dt@kernel.org,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	johannes@sipsolutions.net, krzk+dt@kernel.org, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com
Subject: Re: [PATCH] dt-bindings: net: wireless: marvell,sd8787: Relax length
 constraints
Message-ID: <avu_tZSgwxgnLvla@google.com>
References: <20260311194531.70441-1-festevam@gmail.com>
 <177344689795.3706356.13043407533958417879.robh@kernel.org>
 <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>

On Mon, Nov 16, 2026 at 10:18:48PM -0300, Fabio Estevam wrote:
> Hi Rob,
> 
> On Fri, Mar 13, 2026 at 9:08 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Wed, 11 Mar 2026 16:45:31 -0300, Fabio Estevam wrote:
> > > Commit 31ed9d9d71ec ("ARM: dts: rockchip: Limit WiFi TX power on
> > > rk3288-veyron-jerry") added calibration data for the rk3288-veyron-jerry
> > > platform. The commit message explicitly notes that "the length can vary
> > > between hw versions", as documented in the original text binding.
> > >
> > > The current YAML schema enforces fixed maximum lengths for calibration
> > > data arrays, which causes dtbs_check warnings for rk3288-veyron-jerry.dts.
> > >
> > > Relax the constraints for the two properties that have
> > > variable-length data in this platform by adding minItems based on the
> > > actual data used in the downstream kernel:
> > >
> > > - marvell,caldata-txpwrlimit-2g: 508 bytes (from rk3288-veyron-jerry.dts)
> > > - marvell,caldata-txpwrlimit-5g-sub2: 744 bytes (from
> > > rk3288-veyron-jerry.dts)
> > >
> > > The original maxItems values are preserved as upper bounds to maintain
> > > validation for other platforms while accommodating this specific
> > > hardware variant.
> > >
> > > Fixes: 25f855413885 ("dt-bindings: net: wireless: convert marvel-8xxx.txt to yaml format")
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > >  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml        | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Can you pick this one, please?

This must have hit my spam filter.

And it looks like Johannes has this set to be filtered out ("not a local
patch"):

https://patchwork.kernel.org/project/linux-wireless/patch/20260311194531.70441-1-festevam@gmail.com/

Anyway:

Acked-by: Brian Norris <briannorris@chromium.org>
