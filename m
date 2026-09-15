Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874C374735
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488317; cv=none; b=G8WijApK0n2T+2HcGyZXDnXDha3FErG7VbgoDem1g/KMOJvzDKSW7l0KhKrzVBtWG7kDopB6D3wMeU7rbP2QIgbm99wLjSZzaToprdlNBWwG+lQLmDiBwJXbnyfr6iUN9wO43lSS52MJedzxo/iaLr3XVzcRuq4W6AJHBCd5Nrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488317; c=relaxed/simple;
	bh=QlBta+H5mNjq+dbHXbi+7XyTVzhQ/G0m8qgfcGULLxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ5YV+tMtLiBE88KlKASTQJzQk7QUhmfIVP2JorSPYGNebzAnYYQ7CIApRZnt9cPbvNRwhfOJokHAu5xtHn8gEUyNr9gSmW/DfJnyEIdKRyj7nm04HqXjqYxSm5+c5ixUSujRViaZQaHiFpdRiFSc4/we4Ysp5tjlp+BTzWYbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gQsBgUmM; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gQsBgUmM"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d9197so2807848e0c.0
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789488314; x=1790093114; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=gQsBgUmM0UThoXPgIyA31+OjXE0+9+6CAoY+oNG3WZ66zVTgGsO1rVnYgeQj5gRA3D
         kU7elYJpYqudWw+Ot11bdOfAo3lA/gROyyk6p/qqDH8gjNx8EtTLROE1EmQQWKgqmA4L
         TQaeA7EQV6A9vZ7aLaofXWvzXohIINEbrfFK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488314; x=1790093114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SNucMVkd678hHS4QioCaDYebjQk2vtrspVRirogiq3E=;
        b=jkvLznE4hmoPBSzumzw44qRm/Asl/6QlTDMq4kkQSvpjtnm3vLDUUxPyuLH6dp4inn
         z5txWA5xMBV+n6p8eoPdlkZwQ1f1yjSthrDzMzBU5YPbymz4oyl3NFw/sqDMhNe8C8cB
         8f2WgMG5XGzLwQtU3Ndtok7AMUbVaqbl9meFAcQkLYOTHrU95Bl1onBogLtgrYKNN0Cb
         ZHgz2wHl3A8eBQ9x062lUq0dCVIh+0o1o8cj8sEfqV61WtgX79ZSkHz/ynAQTr10uBUR
         BDfW07X5TBCit/q9aZotJxjGpPbkzFOdCPi4i72V3bBWuJ6DfxVTmU99JcFtFnSBat8Q
         61Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwCVGii3OmZ/HLgLyRstXKM09qfNm1koWZ3j1AN7C9qyUCCF3uIfSnDfLMDmA/Twc+iNR4WrV7hJzcz@vger.kernel.org
X-Gm-Message-State: AFuF++mZxkrpEcDKtdsK52fHaQ9NYJ34KBJfyoLwzia2o3DPpxkIZ2yV
	CjWIos5h7R6f6N/+zgeLPv5w3vav73SO3SrDjefJHG4B9s8OZhpugtIDs0ropFWJ02z8IQijge+
	4l51kXw==
X-Gm-Gg: AYBFou01wwYk1sGQyaCCeoE776iGIKkKL2s6eWblKmSbf2qczvYH2+mZRFMnppJPPEH
	vjH1cjDy8XZY3DsjnjzFiX6ASdcd+U3PP+4pso0pBrir7DiisA/VUzJ8g2C6yAu+KRbGPAsAh1x
	SjuMiVqUmITQ3l0RG5mOaBcA84P3Wc4ED0p7WMdYRZ52Ur6uezPDa6Oq7mB/j0l6RsOEVgF386k
	hoaINmLr/tosEZL9SozkOJVvqvyVNXFREaKf6c1K0+dVNjXIVrVK0iYKl9WtTZEZUxtJDAoXK3q
	vEs704yXLOUeOUOAcsZldamaNS0AVxM3w98XUYS47Lp9X1wZzWS9/vIaNVpktNPFroXwOLJmAJg
	SysVcytcM7V3Pi2+hD5nLErvBWajMkHYU1/avPPdTBk6h4TAlGFinU7yfvoutqT3bOk4RGefl2n
	h13IVilGSShcFoyGFEfEBU+8nJpjLCfm0bNeU2mRxUvjdyMnvgM0tLtbcYc4ihkblvTtiCqBxr1
	DJO57fXayv2VMscYrbSJLTVv1g3gQxfScpyy+/o4ypAMbY=
X-Received: by 2002:a05:6122:130c:b0:5c6:7f44:b001 with SMTP id 71dfb90a1353d-5c981883794mr5018100e0c.0.1789488314340;
        Tue, 15 Sep 2026 09:05:14 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847122e2dsm16175489e0c.14.2026.09.15.09.05.14
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:05:14 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso2886102e0c.1
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 09:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWlTCaFPW3q2XQTe9MreCOCNfS7V4wqDbdnb68jDW7JlY5WdJ1ZsPdypGRaySFg08YpGrzsuFZEpys@vger.kernel.org
X-Received: by 2002:a05:6a21:3315:b0:3cc:3d08:da2b with SMTP id
 adf61e73a8af0-3db405ca519mr21103752637.15.1789487816474; Tue, 15 Sep 2026
 08:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain>
In-Reply-To: <aqfyYSagcejWb4xD@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 15 Sep 2026 17:56:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
X-Gm-Features: AcwNN1VOeS6uL0_wTY-nR6d_j0OJAaYWMrSrW2geaFCqxnwzMq5M1mnIaCQWjMI
Message-ID: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Dan Carpenter <error27@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan, Hi Sakari

On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
>
> On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > Hi Sakari
> >
> > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dumitru, Dan, Ricardo,
> > >
> > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > Can you check this
> > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > patch into that, otherwise v17 it is.
> > > > >
> > > >
> > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > that branch yields no warnings.
> > >
> > > Dan: any plans to merge these things to master some time soon? Or:
> > >
> > > Ricardo: could we use devel branch of smatch for some time?
> >
> > Do you know what patch fixes it? If it is easy to cherry pick I can
> > add it to our list of smatch patches
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> >
>
> Commit d12183645a31 ("precedence: silence some false positives")
>
> Sorry, I felt like I was close to merging devel but then I started
> another major surgery to the core and got stuck.

Thanks for the pointer. I have added the patch to media-ci
https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351

Now that I have your attention ... :P

May I ask you to look int
https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
in case you have missed it?

Thanks a lot!


>
> regards,
> dan carpenter
>
>


-- 
Ricardo Ribalda
