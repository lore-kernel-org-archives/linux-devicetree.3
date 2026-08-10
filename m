Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B33407CC6
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 21:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397580; cv=none; b=cM5q35UR66RHT7NZ5BPRcWdgRjuZZ+BZsBLoLiV+8sXfKpd8gVByPweKTjsIFeW0xIaTrivDlVxVTdX+rOFaUXNYbBNOZxL/3RQvKXggtGHBRBT7x6NB/OR0iClIYSOOdGJ+bRURZuesq544HgcYbtFdLcFD5a1F3G9WmU4mxhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397580; c=relaxed/simple;
	bh=PsF01tzSfmrGWR+juK90jp8b0QWZXtzAXTBj5VBqHa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vj2Med5vwA4z+U8kEXzT0siBKsF/0jy9l06MRu1bQucf2JZG9Fqljlgu/wGykSP2xiI/Hxy+Q+Hl2bdVKB2PfiQL4DFvDG9EyoNQQjrGNDh+oQ1gvQsAzSJuqBdIvtlfJwibzpjc853Fzqc6YnjEJ7yCYivcZ1bEbjTL4JWTWwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BPFQchfs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROWBG1pu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BPFQchfs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROWBG1pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786397577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
	b=BPFQchfsAn6968le/xLNeMPgECzIqr7kONUSGFKNMZj/K0LQvzMNFqSkZu4zkUOm9a8zr4
	YeVPMg7EvAdv3ahP9pGmH5g985cbCH9qSeKqcywQBMKxfCTrZ26kA2QgMUoP62dQ9k3ZYj
	HCdSpZWPge32iLA0JJTLIasmTIWfsOA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-4RWvG5f_MNeMsyQUuHTmrA-1; Mon, 10 Aug 2026 17:32:56 -0400
X-MC-Unique: 4RWvG5f_MNeMsyQUuHTmrA-1
X-Mimecast-MFC-AGG-ID: 4RWvG5f_MNeMsyQUuHTmrA_1786397575
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e6ae12b42so37189767b3.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1786397575; x=1787002375; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
        b=ROWBG1puqNBfLiHjYOiiotJh/nTN+7rO/inviQ1axQ/KdkGvmITAw+7y9rwtT0ObqH
         ZFZ5k0dSc0blvDt9uHbf8ki8M4i9//jCH3YO51v8In143Xcv45Y2YbuUbzCTr7IZ+Nbr
         9e42q0mtqpGB8BkeC9s0Q7/islQlAgbeI/6vGqJccVmqKmsLMmlol95AQvx7RJJSHqu4
         LiCcYqe6W69FVBCGgrd7W/AWpkTchKK+wRUIRmfnNbwjafoau2Lao6itYPG7i40KkFVk
         TW4+p++sAwwgDr/nPAVXcVrJsuuj3VPuOAbRqfVYC5nCIJ0SjexoaHFHWONTkl8K5ur1
         9JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786397575; x=1787002375;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5a6xJPr5Q3rMuS2Aj7IIL+OhqTMjYbY/9k8n2tsOG4=;
        b=sU4U0MOu12JhaAxMlzNrLPvEkzQ82ahSLL0RVoePrMSI7rUiN2qb90pFFzxCrYi8Tj
         1+DqzGi6VZFSqh4OAET5Hpo8HracTHnYP5jN4Q8iVnWgg3SS9N6o4S3ZNzZYbcwf0IdV
         o2nFE2BReSqWlb091meNzUlM7f8LtsWRsNb6Wc2Ph2PibEoQrUsXdyDigeibGvt9EFGk
         Cf360SEo78PSC51Wi/j416vYTYgxYH9CDXC07VL4vaccARXAOz1sq1hrU3JeXeg2VYq7
         VruHJRc9tVKdlJvcM0Iwcm0bJrzbLIwXSnYAEGpWOaaP1ye5zcLNxcK98H2Ew33Q6BCf
         r+ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHTcXi1aPRfyUuAlavRYZMY+KLuMBWKqmscblh7tSWJGmRmQOmYmHuddw7ZpK2s6JtjgLQ6hQola+4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Tf0pd+OnXE2eHIJoE9eYl9GFyzazalbb0FreMI49lfapHzBw
	loteVMVJpvP46Mhv9FZRvYp51xKQ4f3+UciFSlGyOmOI77bGvgF7WyOR/83BFMmk2hbYXIDjvtZ
	JbsSXpPe7eg3EJsmf7mGkrnmj2wv4xCYzQ5zUXltqko3e+8ArCFeP9I1SXTxR8os=
X-Gm-Gg: AR+sD10I6sNQQhG1LhAI1QVHpP6NtZ3+IaQTf2WrV1v5aMP9cDjISM1klz0+6QHW/BJ
	+iIqCQ4MBgbDlVknbTa30iDz9JXLQvWw6IFFax7Tst9c6GIq7vTkS7mEMJrPtCi4b8HjJZuJPLr
	evnliSc8CnMowq7zdmLYOD9rX58ykuTs9kr7Uy4VOhsVoQtLaSbJE4/zVvPV1dtpQHYS3uAAr9l
	OiESdZ6btz+D8dhY6O4VrNHOr6fjneJOyNSQhUxsUNZhIFtOi64BLrExCNGavMsYvVFPzENQv6t
	a7gVYCGUAtereM+0JnPRla/Ez17slFmdLwJs4yVVPbQmx561gEvqKRiEXD4qG5OPJh+D42wwQ6g
	wGsJyBnaTKlbHSViFEGKdbgWw0h+x8dJvSf8=
X-Received: by 2002:a05:690c:7286:b0:81e:6a10:f90f with SMTP id 00721157ae682-8225ba2bd2fmr193701347b3.17.1786397575323;
        Mon, 10 Aug 2026 14:32:55 -0700 (PDT)
X-Received: by 2002:a05:690c:7286:b0:81e:6a10:f90f with SMTP id 00721157ae682-8225ba2bd2fmr193700877b3.17.1786397574844;
        Mon, 10 Aug 2026 14:32:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f079a0b0sm63450967b3.12.2026.08.10.14.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:32:53 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:32:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v12 10/11] clk: realtek: Add RTD1625-ISO clock controller
 driver
Message-ID: <anpDgt6ZlkFE1ONH@redhat.com>
References: <20260804163807.1285869-1-eleanor.lin@realtek.com>
 <20260804163807.1285869-11-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804163807.1285869-11-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 05, 2026 at 12:38:06AM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

