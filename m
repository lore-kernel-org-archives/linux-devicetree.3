Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10393D7D70
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781637740; cv=none; b=gw2iHRPMU4qydc8GYcghkMjRsTn+MRUsoyPHC7fSuSrr+Eqz1iCT3hxJo4oUJ2g7+ZVBCE/9UPW6Ha3lZ6K0ZbEysPJ1PGAuoju48xhjAqnPvnqFaYrV9r4AciecqkCupQycW+rXGFW6oJi6VTZHue8/7t1VXN6hm5IgUCk3YFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781637740; c=relaxed/simple;
	bh=CzrTjRh8aVFApgaFvhsZxWUfS7HpvI2aH47+Qzw6otE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+2AiuXSBwNWdJN6znDx+tF3gzITAXSzGqs83cWaVwnB7v5Ps22YKyMPyhu6w7lZ4HnuS+oFhg+WPB0qoZ7hUQvhuK4q6bkvNvqzU+CfucCxJedrG9QyUY37hGerSf8NsE8Rf0VGVdVpzzEJDMiFbnJUSjyYOG4ixjUpY+gOALA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gd01ltZQ; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gd01ltZQ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304df7ff4c2so165830eec.0
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637738; x=1782242538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9t9c6bYslGUW0YJ04TH35qJToA/FwEVp7/7In1g8XU=;
        b=Gd01ltZQDw2fa08Q1TvVEP5f0fxdrowwR4s/r5qxIbdH5xRBSf3xV3jF2TlOZ54+W3
         3HA37DDoaZxhja9UNL/pDj4eej5Dnusrcif4BTmBjTJTt55AGJJspTlPdggAxgHHQiYM
         Vot6ofEM+kaQWLuXEhV1JSSBk2j0UgyFNEGxFxCvPcVnt5kVzc70+2imT+9pOvZHUnoy
         e4yaS2gxcpWqxCqkWt0aDJpOChWnfOLuc079xsaigEZ5XZI9NIXUmrFVi+06IHQYOMzI
         M6XY1/Y/jEnSdMzsJh80aEhhT0Hs5pDdNzIr6GS3MiZtzLqTihTHh/smA1Nvq7Jk8hGQ
         Nc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637738; x=1782242538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9t9c6bYslGUW0YJ04TH35qJToA/FwEVp7/7In1g8XU=;
        b=J2kMsn4oiVNI1E1RjE57LWsayXHUpE9UmZ4WN8PiEJ7UJCjWVd0vk5osePTKjqdrP/
         TSl9Wm2pmge7ODVYTy4UzjoOl+dMksSiGKjTPyRuBN3lmc4jSHHUw97yuIpEB3UpVMjA
         KC7la3SSFAbmZ1CKQN0nCiktdp5tpVv38JIw4yLHPlO9RD20LKLvANT8rs2eH0iBNSdx
         TkMdkKBdSL1LJYwm56DgFY3abZN3je4S52jCMOHoqbeoha7aa3QqjPu+WtjAZh04d2ut
         6S0XW/I1297KriTfRF64+Tza06GzM0qEhE3JdX2T/Zerj8ZAMqkk3ggtsQxQjkKD0kn+
         VNRA==
X-Forwarded-Encrypted: i=1; AFNElJ8eRyK9DUs3RZdZq6P/DI+RoWV45HA3sCFEeTNLbXQB7gtOinForE7xjXdHeyLz5RhpFk2I5c7WTRGc@vger.kernel.org
X-Gm-Message-State: AOJu0YynUp4zIjkSFC4BTd9A4sRf3Y48w1HbPU9HewCa7xu5+Esr6/4d
	7uMAi5090o3i66akbK/6D+qICWiAZ8CYDXXJFrSQvQiOK6ne9xOLfeox
X-Gm-Gg: AfdE7cnd7PdLu2hd3Mrx2pRLdexrhwfs9iud2Ho8iDnMQGQQbxAW+R9Wo5NX19NR9Yr
	BqZKMoYecxeGvVyxA8BolFUck/0kwgPdbY1/P/K0fU6+ZjV6kVYtHKjBSRrJFjuT0YbyeAJoVLD
	ejKJ6AO0p1SYYJoDw1suRExlKJAiqFGUqVfHYH1JKFVcAVcI2C/JvrQyRSzQDPYIe4p2VH9AOFJ
	Y8WZgWk6Ll/C6K3T/lK6Daq1AgLtTf92tQtQfnQnImFhDlH/nnxLhBDDGCMrAECUPyRC8hzAjJM
	c/raezZnP6yWgUBe6ha6XOJrU6plAHC0/7dkNB0miqAv80eVxmvCUDacZW6A3v5+/dsG3Ez9YJE
	BdepfS3yRuXAs/yHegy5+l1oKleQT/rGKMHfdL7aMiKGWb7/mTnrDe3c2gLxXCNIjEKov1H9JCh
	Ku7k0wwgAe+WnGvY+bujg/B6oMnI9EAdqLO1f+9kRnWUuKW1+aWxt5vmG8KNU9ZBdLrUd3t66bG
	g==
X-Received: by 2002:a05:7300:6d2b:b0:30a:e52f:9b99 with SMTP id 5a478bee46e88-30bce88dc80mr66631eec.0.1781637738011;
        Tue, 16 Jun 2026 12:22:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:cbae:d24:189c:2cb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea447b4sm18650560eec.23.2026.06.16.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:22:17 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:22:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
Message-ID: <ajGhUY5JpEQWfOfe@google.com>
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
 <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>

On Tue, Jun 16, 2026 at 12:25:55PM +0200, Konrad Dybcio wrote:
> On 6/16/26 12:08 PM, Fenglin Wu wrote:
> > Add an initial driver for the Qualcomm PMIH010x PMIC haptics module,
> > named as HAP530_HV. This module supports several play modes, including
> > DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
> > and hardware data handling logic. Currently, the driver provides support
> > for two play modes using the input force-feedback framework: FF_CONSTANT
> > effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
> > waveform for FIFO mode.
> > 
> > Assisted-by: Claude:claude-4-6-sonnet
> > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static int cfg_write(struct qcom_haptics *h, u32 off, u32 val)
> 
> static inline

No, let compiler do its job and decide whether it should be inlined or
not.

Thanks.

-- 
Dmitry
