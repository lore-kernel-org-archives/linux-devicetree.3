Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485D41D120
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729198; cv=pass; b=gEP4VPGFjTXuIodjDF90bUcfxhQKTai5mfrtNIeqM+PcSKF0yla9ZMHp5Te54L0SnhSgpmvDcGklBsTkx5D7tTo3PqPwnVMhWI4Zfc/lJv4Wt6o0dO9MtFF2qVVRo8srVDKg2wijv/ZH+fzGkBk33ejExYxSPFSiG5t2mSRtuFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729198; c=relaxed/simple;
	bh=alnnkH7WGWsawf5VvQl+bx2GHauHyQlXLyt5VyewApc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JhaU3Ac3UZmbGAyEKJvTh0r5WR0G1pQfTd0s/iGDdwWDBQlk8+S4bxD9TMetrHKkMW42wqXhxaA+T9GUTR7TPGEwFfk7zphxBFtpzAZO/Haw3yjajC6m1Y3QgkatnTGASzq0DBFlyyaVwBvdgzI4cQ2jviiJ36ZkrF8EnJapoPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=Qvsbxy37; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="Qvsbxy37"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-895fd505832so4124497b3.3
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729195; cv=none;
        d=google.com; s=arc-20260327;
        b=m9osBIAxKAKPdyoSWtrbKhAX3PZnA2VRAzzjs0QwFMCZkP/R1ZwmtZgybVowfhhHw8
         LXdji+Ci9psEVQQdf9umxYTjSOahh/eEpur/ZqJGG919ll2ZkNqwHST5gnkEJoHPYuKY
         gBHxaTs3phCOnmeAQVBQvohRjqASP41ChJcNA+SfgEQnV3KZa7xjZA2+m+slg23hZpHl
         mYnjCOD8+vDo33mjB43E7Ejzd+F7IN6RLqtTx1MIXCISaVauGdarvEq5ZRpb2Y2R4YpU
         GB28oiq7r0/DwlwxGSD2GPFfMrr/dcAIOtv84pZcRvNDm/Eehf8pVX0+4yoMGb8lQEWg
         cJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        fh=m2NFyLIRTJFee3Lc+M0ynoPobJiECtwKDisvjUACSz4=;
        b=K5YFH7FB9ZmjUxI39sKBoGI1kBneXUDW+hx5NP5CLVFLPFIuQSdC6Q+RTl+kHAqkPI
         2WpYzAkhrNH7+lZ57Pq33cCNp9FP1otof+R1MDZwuu+0DVQcmSMfRxyXIqVfMd+lxn5o
         gHRbOL18FmFmETqa69pZBOwql6/mZb8zr+kOkoELr9oIOCWIg6n4dlaCBJFA+miAdmn4
         JvoZPBKzg9IpwC+zgvnd1tRvjXiTDys+QVtI+SgA9tajs2yzCfHNOi8hNj7oJTmEOBNR
         MfHPsu17/gBAWb/g1kbZK0oECXCdpsesYWynK3ITJToI90+fqQ27y8tOacYQH7gpQAAd
         u5XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789729195; x=1790333995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        b=Qvsbxy37H//xJ31u4JoC+be2ELkT9Z6JgjPObo7Z0QsgAau1q7aG1DoVjXD/w2c1et
         o5Zbb5Ho1xS9+tgRi2AN7Tv/N0WbyWcHyTgTnl1fDO5VdenHaWs7BvmINjQbVsfWXl6d
         /zQB/VheRW2o1FJ9YONo25kyuWI4JX2leHzge6L/ofZtgavGKd62pwhS6v2Jh37am7Sq
         zUNLDxYJ9YpbCID+CC+g1lGGZgPu8A6HpLnkpoGnqw5nJehJfkF6YXjNE6Zzxu+ZqE8X
         274kw/ICBAwzw9hjGG4XWS8GYN6PAE6iKAyI3I677ttC1C3V3dqQEnjru40l2jZu7ZEV
         gYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729195; x=1790333995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4osDPipEl90WA23ocY12H8xUxvylL6hv1TVnP5ao8T8=;
        b=L43lkcyJ9nx03AXE0NOGarPGUg5P3JsatMD1hDbwe6vaNBO/xXG1qf0ivqZSb80/BT
         OTJEZR815RiOucLH3hd1GxGUL+gkTKgnRD1LXpu41S4QmSUGJMDkGbffzSWypzvfWJKt
         dAHLJANveS779V8CD/AphREjU79RJpRnCxupvOqlF6dcyLIge8bbXqrZJwZ9yPQdaMuJ
         cduAZfxY3sdxPsjFhl5IDNyYUZA38BpKT+bx+kO+tRrNyB85Bdg3mMK5PNQG3SoS/GhC
         MedVCsuiRAtQv1mLq5BENCfjiYtTYG4WsS+U8mFAsMPCLmHdf8SbXNffHrMo/62FW6lf
         QhrA==
X-Forwarded-Encrypted: i=1; AKwUvBxqT6+hU2P5v4kXoUpewtG+mmRJAJTTb5TF3Ub2UrZP4V3OAyRLzALy2cuKB/4q/r62wxMtptusLkss@vger.kernel.org
X-Gm-Message-State: AFuF++mxSxE7LH61A5DNT6FM9wxWTow6sRFhLmM3/TThbsCLxwibL0nO
	Tzcficrb6M96iWAqSTKoh9LWTg6pjhNluO2rmjjo2Fz0JxIRkAgvYNvCxK11ehM2+/np3QLJIjh
	nFqP/Bama+L2PMXuX/zLV6BmgKxKM6lv10wl9EE8New==
X-Gm-Gg: AYBFou0kBSilzF+H9d8yqOVCw1oSuAts/mqJcRYdDHhAT3vzFrMMXLWZVSKpBLdH5Zy
	8DO7QBOXmzWkap6H4uXVKAWCppxNFfmBVdfsB0JacDHAHMuHBQVGUwJEDLVuNyJdm7RvU72diZ/
	s42Dh/JLy75f8/j1vC5H6nmaSaKdaUmYjjtYnCUCOLLHJ+Rty27yF0cw3LiruRpNvLBSOXqyRPB
	V//57EpBVCafIznh74g69wdmmL+KkFQWRzpVgj1AJzyr0954oiCShBkOymYsTF3a1jGVhgz+37Z
	zqPRchpHorVd1fs+7bV0EqbTQ7lbuyTRAJ+nI2af9kqna5WttaD0XLFrcFTk82Z9Y6FxQfmDydm
	8jlroMRDDSovWEw==
X-Received: by 2002:a05:690c:e0ce:20b0:873:5bb2:6c19 with SMTP id
 00721157ae682-89736b3f7a7mr4725497b3.67.1789729194857; Fri, 18 Sep 2026
 03:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918031326.68542-1-karl@asseily.com> <20260918031326.68542-4-karl@asseily.com>
 <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
In-Reply-To: <321e417b-55cf-4667-9c52-cbf3548561e6@sirena.org.uk>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 18 Sep 2026 13:59:43 +0300
X-Gm-Features: AcwNN1VW_L9A_m2ilmQ9K0WM9ssAzHQHLSHz7CCRbfwgDzOxl-iZROlyG5jgDeI
Message-ID: <CA+gvwbrep8j5R5c2o+oMAK9NF=K7EcXFswNCfaVnmfnsBd4v9A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M
 codec driver
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +out:
> > + regmap_update_bits(priv->regmap, ES9039_PROG_RAM_CTRL,
> > +   ES9039_PROG_COEFF_WE, 0);
> > + kfree(buf);
> > + if (ret)
> > + return ret;
>
> How does this work with suspend and resume if the device is powered down
> in suspend?  It looks like this is doing some windowing stuff and needs
> a specific write sequence.

You are right, and it is broken as posted.

The coefficient RAM is write-only: PROG_COEFF_OUT is documented as a
readback register but returns the last coefficient written rather than the
addressed one, as the commit message describes.  So regmap cannot cache it
and nothing else in the system holds a copy.  On a board that keeps the
part powered through suspend nothing is lost, but where the supplies go
away the RAM comes back undefined while regcache_sync() restores the
filter selection from the cache - so selecting the programmable filter
would point the interpolator at whatever the RAM powered up holding.

For v4 the driver keeps a shadow of the last upload in its private struct,
the upload loop is split into a helper, and resume calls that helper again
after regcache_sync() for any stage that was ever written.  Stages never
uploaded keep the part's own defaults.

You are right about the sequence too.  It is address, data, raise
PROG_COEFF_WE, lower it, once per coefficient - a per-coefficient strobe
rather than a gate held open across the upload.  Splitting the helper out
exposed a second problem I had missed: both FIR controls drive the same
address, data and strobe registers and nothing serialised them, so two
concurrent uploads could interleave into each other's RAM.  The mutex that
orders an upload against resume closes that as well.

For completeness: an automated review on this thread raised the same
suspend question a few hours before your mail, so the fix above was
already written and building by the time it arrived.

I will hold v4 until your review is finished rather than resending
piecemeal.

Thanks,
Karl
