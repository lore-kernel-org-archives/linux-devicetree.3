Received: from mail-qv2-f17.google.com (mail-qv2-f17.google.com [74.125.230.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBF247535F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 11:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077106; cv=none; b=rsrx6Odx/PI3pdatGiTweWM5s34NLeSmDWadiuqDBs+1dnWesmmKVNhzJBGO9+eT57zcX+CqSMB1Y92XEhDeHzBfcwnL8+P5unoslZ0o5D9XyXUsu++LNS+NUfCtoF3Z0RBA4xxxhA8mzAfvpL4DqtvKBTbgy9ZLGY9ZuAoTahg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077106; c=relaxed/simple;
	bh=vAqHJkJK8NybKzUEyFkNm7wHMeyR870vyueLoGzt3yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATwRHJQqxKfAA2B37wqlBHh0VxW6k7xm6acnZMj2L4sDMdnIKWRlsbpoemyLESc8E4EsvK+hQw1CuVmt12te6D57V8kFkVKK/3BlTsv8QPNCApeJYoQI5l6cwuA4sdPObHbEanU3caMBtESDpBi789xzQPovXctsOtw2DGX/kQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yd7UyZxu; arc=none smtp.client-ip=74.125.230.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yd7UyZxu"
Received: by mail-qv2-f17.google.com with SMTP id 6a1803df08f44-90cdfe57a3aso38015936d6.2
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790077104; x=1790681904; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=Yd7UyZxuYcpgdsBC7v+zr8ehmjbay9O+GlPey3zkmG/k5wfsjwV+Q/6Iu85siWQ9pb
         727IFEVtdBncGtRG3inXhjGM2il4uAv0JqmoOnBN7Oc3GiDyRuA5UQuYaSlyn9LWSdOU
         RojyWKNK5S4FWGDOTpM11e8GByKC4brR5GxZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077104; x=1790681904;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fSk3TeVnQVuy0Nz0PmBxSCcv2Duz1teV8o735BciAQA=;
        b=jSXDhjW4BnCQ6fbxiWTTA64kjA+ioI+ET7VU2UtlKvYgenTKGrHrcDal34zlb9i5lS
         OFm/qpaVpQzew2OMeRWqzzApMtV2fJcwsbQL0ICFtvyje3RfD0uBYUwKFO1Y6ZrYBL/V
         3Zw1oRn9Flv/teJAZe860vS9oflS178OwGZbkvEInFVVU3Vx54ipBxaZ9MAgNlNb+W0N
         BPbOxPG5vejCSIRRnrgsiLpg6QwDy+v+wf/m5a8zrJxWiDGOI7zhVp1gUHw4lOE+gIgx
         riGUl1DtpstdRLe6N4cSOhd1F2Dc61PNmZ3OrgcN1A2+qfob0OUCnKATMusOhO+dwd1q
         t0uw==
X-Forwarded-Encrypted: i=1; AKwUvBzWbXTb9oV8gyDCck80yqTq6/hTKfyhD5bByekvxeCvXAMKauNFVKiJ4zKyuHpNcSd6zOaIrCNQJ/Ol@vger.kernel.org
X-Gm-Message-State: AFuF++lMY+x3LA3L5Cr5sFAYlY3k5mbIO0cmfoKRNJRukQYmjRSvZDPI
	H/z9Y2HU6l9LmnVShbXDIsk84sULpsUbz5ZKpOrN5gwncGAl0hsi7fgHJFduzZJh3U+0luOyH+p
	xc9KszicW
X-Gm-Gg: AYBFou1ad17jzQ3O3vKLQ3K82h0dDrAJSvK+0zATFc+2nciLBXldwrScebPqt2YXJfP
	ylMriVME1739aeUj+V7Ek5W1+WBwRnqrvRjWf5VOxp4Jc7/HUA4v4bYTR4ojNNNhAcbN7VNEMKT
	03Oh+H+jfTviBT4SAPsRDlVQBf7X+3v6p1rsW3necPDbiNM/HJc9t25KZ/jsZwL0BHqYY+JSwQ7
	x5qCVnm1B8Ko5cxZa7k9gth3Xi1IUF1HdPWnOlnXZJsUo3sbTOl14/c6bNSVJXPePee73yaCx+n
	gCcUnNyKQNMG/3f9EhZWq+ccdfJHzs73hweg9U2/NF1a6VIiAJGsuTDGkKu+MJmvcSRVZ8WiQiA
	nzhE0etDVQr4Vvin4p1Px8YlO1TP4dklHlXhL8oDtDfJrKWXZZKqeB1M3g512F8Cp+BpP33EJnJ
	abujJZzkxUkVfVtULxAwIPrlNXXxsxT4UgyWqMB6bnqhwgR7WWrrTdrQQMdGE9HFEYVXde8tAnI
	iYS/UykJio4gSxsMg7lg4CIS/XuxbBOeHbrmg==
X-Received: by 2002:a05:6214:5b04:b0:912:517b:9758 with SMTP id 6a1803df08f44-913fc9c0a29mr49707186d6.50.1790077104094;
        Tue, 22 Sep 2026 04:38:24 -0700 (PDT)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com. [74.125.230.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9140250b82asm13428356d6.39.2026.09.22.04.38.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:38:23 -0700 (PDT)
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7e0bcso46097521cf.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:38:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByvWslkBJ+lDx1KhoIa3INqq6ofKYRl5DrslsM30zXYgVSeORDXwnz9scBLWcm04X4/ahijcR9Q+0HH@vger.kernel.org
X-Received: by 2002:a17:90a:e183:b0:39e:6c6a:209b with SMTP id
 98e67ed59e1d1-3a0732aab47mr857626a91.60.1790076789532; Tue, 22 Sep 2026
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain> <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain> <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
 <arJjxjiWVlnHhioR@kekkonen.localdomain>
In-Reply-To: <arJjxjiWVlnHhioR@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 22 Sep 2026 13:32:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XSEqnhRqXFFRQlQKzrgp_us5KopVV821iFq_cxHFRxG_Sd7N3TpS2PoSA
Message-ID: <CANiDSCsD_OO_7_ZQ0NvWHXRN4jo2Aqr-XGZamn3bCzwnZ6gmZQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Ceclan Dumitru <mitrutzceclan@gmail.com>, 
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

On Tue, 22 Sept 2026 at 13:17, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Ricardo, Dan,
>
> On Tue, Sep 15, 2026 at 05:56:43PM +0200, Ricardo Ribalda wrote:
> > Hi Dan, Hi Sakari
> >
> > On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
> > >
> > > On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > > > Hi Sakari
> > > >
> > > > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> > > > >
> > > > > Hi Dumitru, Dan, Ricardo,
> > > > >
> > > > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > > > Can you check this
> > > > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > > > patch into that, otherwise v17 it is.
> > > > > > >
> > > > > >
> > > > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > > > that branch yields no warnings.
> > > > >
> > > > > Dan: any plans to merge these things to master some time soon? Or:
> > > > >
> > > > > Ricardo: could we use devel branch of smatch for some time?
> > > >
> > > > Do you know what patch fixes it? If it is easy to cherry pick I can
> > > > add it to our list of smatch patches
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> > > >
> > >
> > > Commit d12183645a31 ("precedence: silence some false positives")
> > >
> > > Sorry, I felt like I was close to merging devel but then I started
> > > another major surgery to the core and got stuck.
> >
> > Thanks for the pointer. I have added the patch to media-ci
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351
> >
> > Now that I have your attention ... :P
> >
> > May I ask you to look int
> > https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
> > in case you have missed it?
>
> I understand the required commit is there and I tried to push the Maxim
> serdes driver again but I'm still getting
> <URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/110822240/artifacts/file/junit/test-smatch.log.txt>.
>
> I wonder if we could have the devel branch there or some more commits...?

I managed to reproduce it also in my computer, so I do not think that
it is an issue in media-ci.

I would prefer using only tagged versions in media-ci.

Dan, how far are you from making a release?

>
> --
> Regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
