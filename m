Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1133A032
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067668; cv=none; b=P1VGW+0hpPLE6TOly0zrGC9h8BaG+LiSk/Np01u6HXY/uW1SByQWA8UIyKlWEdIhDauUiIfuczEO4P/TYErA7S/5Xk0ms3XbO9ew/NJDc+4yiG5cwil70dZbgVuHGLZ9EKmJu6sXWiCrlpxT1cU1BBdGxGcPjgww8Vz7Vi/yDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067668; c=relaxed/simple;
	bh=JgHz+6t+/lLVkabEsSU683KM7P90wDLARi+pbBBrukI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWFIdiIMMFXNgZ6dYaHgWgxs30rcgs7K0XXCwiiLFYlk0y6UFtO5F26+Qaxu0/UtI70ca1l+0oZPOJh28xoxkwtI+XXd8sP+F8Ulw8BV+583gicbxia+rVu5Ij0ysissqI0hFKcnRbm0QG204AHk0OghzP0WOPvDrO15+mpXlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=svoTaiG1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="svoTaiG1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85725ce182so397016a12.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780067665; x=1780672465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=;
        b=svoTaiG1kUykeMA6SaROpDrCS9Rv/ISQQLUOzYdtwXT6u80lFH70qZHu/Je3yQMUy7
         jSuXlzzqN9qVmh81HJfQpVYOZ12SBXlyQt7/WF+PMOmZRaqCW1Nrjp0vfDk5kJ9r0+AH
         8Kk1Iz4nTeiX3l/HJ6OjgJN3PmePjyTnvt9uwf7TH/3JD5QKftcD1LETMV+X3XcAeIxO
         pgmQ9pPw9kNVRUvxJKsD6sqa4RWwxsoYYn+blNrx4b+g8IgbTr4DYEOI3XN2LTjWoX4G
         q2IGlGsFxzowitBVbFCiCxsfjMdV6/Sv/OsyLgcg1qxWOXj+VJ5ovZwEvG7ZCf+wccPx
         gi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067665; x=1780672465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjGV1ydNT4vhjd08DNoiUIAjJm6vDoz197TfHBqCPyQ=;
        b=he4aF2syylkFiBCbJYndW3+8LkaFKSYSVeEoBeOfoZ9qL9vqWo7GdsrKDco0tNaf6v
         4Tfbz0tpeAiR/fxbtKsepfc5f+Zladf2eJxnBu/S8GxBBUPdOTaYaz2XaSNhWywXLWgL
         xHac8KeqsL9i4/N8Frme8GGVOSkBXcFGWTb+ycxgu21A4tTm2NWPY4h14o0UWOZIcD0T
         5OtWTUH4s80iUva+QTx4IDBe/PkM4EACMX+LxCXzL+1Vz4MRdcjzEzbtuokLaUrMW7mS
         qFKjR4C11vM6UAP8RAE7G4eIiYTj7OjteOx8oOpNbZpziMYTovJZV5+m1IMcxUrQE/vy
         slIA==
X-Forwarded-Encrypted: i=1; AFNElJ94nEfR0e49ST88fbLN2tAaotrAn9iDUFCl0oMA8bwqzjfRMmgk16agmlHYcEVdk6+MV2O/AGxeB0N2@vger.kernel.org
X-Gm-Message-State: AOJu0YzLZ84OFtoxEUftVb+fo7KH3DYzz+hspQ0AS4WPlh30zvgDOn2j
	isI9V+AKkZiL45rVnTpGNko3Reo2btwP5hHW39dRYedkUiOvfb7DEiZtXzQaiO6+oSQ=
X-Gm-Gg: Acq92OHIYatEOpmDKqCxyeNkvRP1wX3FTIJ5S6NFF+/YX+X/kKcD689UKmE8tR5ty35
	ePTYf1th7l2MHIGD+x9QA09px5fBXxVss2ho6tkocyFVa7j5tjd9VX+ccts8EDZUv6sn2syuAs2
	ZU3EymHXW4skf6HYS9QBXlBIgz5ZOFCjXBBrFt/u5y0DtY51tLe1B/XZ8y1cq2d25hO1u6u5HMB
	BqDNxl3XtZ97uOviBk5ykcRMM+QGm9ZWg+e3tvG1srEZb/YyxmqTV3I3KNa1B1/kz4tYCfkY/6/
	PHx2qZpCNp08d2jgKGAFI7EMM7kwD0GKISt0g+aPqvthHg7OdxYglJQld5BLE2yufI2/yvn7azs
	AmTw2itTTmx6CiUVOjtj3ktIMEV8g9cGLGZDYFCgjE33YA55L62br3bUn/zR42gAPoZTta2qguR
	hba6+p0dCgDgtjO/9ZrE62g3c42GFpothCpPdqSw==
X-Received: by 2002:a17:902:fc8e:b0:2ba:839e:15cb with SMTP id d9443c01a7336-2bf368463e6mr2923465ad.27.1780067664889;
        Fri, 29 May 2026 08:14:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fe93:5096:4a36:4399])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm24992375ad.8.2026.05.29.08.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:14:24 -0700 (PDT)
Date: Fri, 29 May 2026 09:14:21 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] remoteproc: xlnx: add auto-boot support
Message-ID: <ahmtTVp9Kv2ZH-Ds@p14s>
References: <20260527051611.194844-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527051611.194844-1-tanmay.shah@amd.com>

On Tue, May 26, 2026 at 10:16:09PM -0700, Tanmay Shah wrote:
> The Linux kernel remoteproc framework provides auto boot feature. When
> enabled, the remote processor framework attempts to start the remote
> processor based on the firmware-name provided in the device-tree or
> attach to the remote processor if bootloader has already started the
> remote processor. Enable this auto boot feature for all AMD-xilinx
> platforms.
> 
> Changes in v3:
>   - add more descriptive commit message in the patch 2/2.
> 
> Changes in v2:
>   - remove the auto-boot property from bindings patch (1/2)
>   - rebase on latest remoteproc for-next branch
>   - refactor the driver patch (2/2) and detect the auto-boot runtime
> 
> 
> Tanmay Shah (2):
>   dt-bindings: remoteproc: xlnx: add firmware-name property
>   remoteproc: xlnx: enable auto boot feature
> 
>  .../remoteproc/xlnx,zynqmp-r5fss.yaml         |  4 ++
>  drivers/remoteproc/xlnx_r5_remoteproc.c       | 48 +++++++++++++------
>  2 files changed, 38 insertions(+), 14 deletions(-)
> 

Applied.

Thanks,
Mathieu

> 
> base-commit: 90de217305800ff32df4c0308e240925c8deb385
> -- 
> 2.34.1
> 
