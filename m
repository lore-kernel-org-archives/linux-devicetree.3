Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE038BF75
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558939; cv=none; b=NuDqsnPA7Umc0JFNfzxFcJN02IMbCVX+Ulk00ThuUn6oaAMEUIxTEMdfxWDJZTsDbFsNqIc6qy8jrgzf6HIShhQmUrrhSfqiCqz6NMs0uf0SKQlUJYAkdyVtcpfpVjAKD0etLZb1ai4dtIvpdk8uL7SPTjpw2eereno1eOSMNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558939; c=relaxed/simple;
	bh=i0JVg6NPKDqPdCm8XtH+7L8mGlKzlTAmtPgz4+TozJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhzJ14z7YXTOt5Q+TSgLvpOly7D98dUx9RFTv35LnLmAMOBhJQ/xRLa8fF/38bW1DHAyhts3hQdLBJoCah67S4LVcmHGn9gnY2Nvu2wCYMG4G/l6cFTukUFcxIvvw9V2Yx6KklJrbnk597sFk7UIN0fZqZavYKKDiNGZFoqDxa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0oX8rgG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fDeKCHMX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0oX8rgG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fDeKCHMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781558937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
	b=O0oX8rgGW7kIcNrGrvNSy9m0VCpUTeyqM7Nh9BlpSn3qRk1M3zR4PsT22HPJQ/0d0gzDq3
	iHXOSZsxpPGR45kPBmy+UjiQ4eR4SCvdK7L7cfHjOCtufBrqUiHUJNfM+LWaEtgzdJXGGn
	ZUnmWOQCli/vS3KpZ0qTQ30n2H5zzbs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-6AIHI9OkN6uoLdvbCJyL0A-1; Mon, 15 Jun 2026 17:28:56 -0400
X-MC-Unique: 6AIHI9OkN6uoLdvbCJyL0A-1
X-Mimecast-MFC-AGG-ID: 6AIHI9OkN6uoLdvbCJyL0A_1781558936
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177f07ea82so78243381cf.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781558936; x=1782163736; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
        b=fDeKCHMX+lQ830Zyaxwp768jl86oEkj3stdG9OtY689Uemx7+nwYMq88jVm/28BfRD
         ZppFZA2I554ac8zFBwZRO8qjCicF0f6bzift+15hP9ve5/okFZ8xDMVKBgFSg28YMm1K
         j8uQopBD3/oHWfBmiycJEQwsOMIGQ3PlCRPDI8FdhOrD1p4hsr6C6VH5wIkjqfJRQ3go
         ve860I+FpgKP5uPHmbMX96t5x+UeAnV/CJySluxTbc6ctGZwgmfaXeO6YMK2gQ2+OWrs
         c2lVyipVoY47Xki4Lnd/+Zk2z7bwygNBlY3jHdysahBYpUe9ecmksvDSy2DaN4NJRhfv
         673Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781558936; x=1782163736;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8CvKAGdCUW18KUmFYuMA9APTtSF2TfQZeTic6jDx6AY=;
        b=SUdQZzc/T3pFHymEUipfW8KIUqSKfp3bKReX5oDTWuT0r7Kj/AJmzotpAHrali0rKN
         A9I1JDhlsNtRQKGow5S71DLgnsGAmQTBrtjUiUTGFRnn/PafyqCuzNpLaTCslBYezCvi
         g316/HIXfRQrjqREwo2WHraDtgH8SJGzpIxOlGMkEZfah+DBeG1I8nLaBiRkxIWVIv9q
         X8zK/0A/b5Fw97XQLLBHVxPBdI6ZcwBUM2GGchc5PvUIwdUREZXanoaQweAdvVRbdvwy
         vQtqcYh4TefPuBi/0wYtOw+xnVLX3FuRt2mp4p5sERttnTIDtTOocfMT3g6pRcpdDICj
         RqGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EbbZGg+C3HNPopoBgj46rLO8mmZ2A4AaofjbmzeKy3JDhDUEzjOeI03hwzN4+TxkPYuFP1C2KAwAE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpg2x4CzwmtdQO4gcTAF/Ag470pmg86RhnF8UwC+hfjwd8L1dJ
	EHG1ubSlJGvwWieVmKTSfdLCCoDl8p2F9zaimSdq555uwz7dU7zdZIGWZklyCIam0Ep72C0jLVL
	8pp2bqAkmWh9bZsUg/m71IrYuZtjlyNKa0C7KKm1htADeDvYszo52kUknmqZ4EV8=
X-Gm-Gg: Acq92OGkayCrIfBbBSxkqvThim9aOvL9eb0ezI4W1XLbH/E05/pYPK3JXuCfCDjrPSr
	kbbfo8Pm1npSSBrL46x4PJQS54uiSMWn/XdzhcRlaxFSggELxW7Gs56S3IH+3k/KuRebloBOFxF
	sWt18muO5f76Fkil2S9urcA0NtbgWX2wbCzqpXHjJ3l59GvX6m6gwa8VyDpIs3dFj1OjWbkCDBG
	e2Jrhl8UhWz9nCmlVGz7rgGeoFOYoF9RF6hncIm5M0GSnauwXMo2dluMxMqDZm5lcq3Rd39DVlf
	K6H9FTdPZ2h50DCCiowNPd+1rELWxMRo3B6Jthmfiib4ua644W30+ZWtDt3fhwP/skMO2K7qWUc
	oDTbiq3LYI8dHGgW25GJjhww3jo+VArdN+Vmfnpkdo/1GYosoXx0foebU
X-Received: by 2002:a05:622a:a310:b0:517:79f0:ae3d with SMTP id d75a77b69052e-517fe23ac1dmr180027021cf.21.1781558935525;
        Mon, 15 Jun 2026 14:28:55 -0700 (PDT)
X-Received: by 2002:a05:622a:a310:b0:517:79f0:ae3d with SMTP id d75a77b69052e-517fe23ac1dmr180026601cf.21.1781558935056;
        Mon, 15 Jun 2026 14:28:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb6442d8sm119356571cf.11.2026.06.15.14.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 14:28:54 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:28:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v8 00/10] clk: realtek: Add RTD1625 clock support
Message-ID: <ajBulHwzII9cynqI@redhat.com>
References: <20260610080824.255063-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610080824.255063-1-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Yu-Chun,

On Wed, Jun 10, 2026 at 04:08:14PM +0800, Yu-Chun Lin wrote:
> Hello,
> 
> This patch series adds clock support for Realtek's RTD1625 platform.
> The series includes:
> 1. Device Tree: Add clock controller nodes.
> 2. Infrastructure: reset controller, basic clocks, PLLs, gate clocks, mux
> clocks, and MMC-tuned PLLs.
> 3. Platform drivers: two clock controller drivers for RTD1625-CRT and
> RTD1625-ISO.
> 
> Best regards,
> Yu-Chun Lin

Sashiko has some legitimate feedback about this patch set:

https://sashiko.dev/#/patchset/20260610080824.255063-1-eleanor.lin%40realtek.com

Can you go through that and post a new version? I'll review the next
version manually in more detail.

Brian

